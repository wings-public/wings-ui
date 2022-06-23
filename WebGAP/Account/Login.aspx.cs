using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using WebGAP.Models;
using System.Threading.Tasks;
using SendGrid;
using SendGrid.Helpers.Mail;
using System.Data.SqlClient;
using System.Data;
using Newtonsoft.Json;
using System.Net;
using System.Collections.Generic;

namespace WebGAP.Account
{
    public partial class Login : Page
    {
        #region "CnnStr"{
        string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}

        public object Options { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register";
            //   Enable this once you have account confirmation enabled for password reset functionality

            GoBackHome.NavigateUrl = "~/Default.aspx";


            //   FOr OpenAuthLogin
            //     OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
                  }

                if (!IsPostBack)
            {
                Session["CaptchaCode"] = RadCaptcha1.CaptchaImage.Text;
                if (Request.Cookies["UserName"] != null && Request.Cookies["Password"] != null)
                {
                    username.Text = Request.Cookies["UserName"].Value;
                    //userpassword.Attributes["value"] = Request.Cookies["Password"].Value;
                    userpassword.Attributes.Add("value", Request.Cookies["Password"].Value);
                    rememberme.Checked = true;
                }
                else
                {
                    username.Text = "";
                    userpassword.Text = "";

                }
            }
        }

        protected void Get_User_Activity(string UserEmail)
        {
           
            var context = (System.Web.HttpContext)System.Web.HttpContext.Current;
            var sIPAddress = Get_X_FORWARDED();
            
            SqlConnection conn = new SqlConnection(CnnStr);

            SqlCommand cmd = new SqlCommand("Sp_User_Activity", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = cmd.Parameters;
            
            SqlParCol.Add(new SqlParameter("@UID", SqlDbType.VarChar,50));
            SqlParCol.Add(new SqlParameter("@X_FORWARDED", SqlDbType.VarChar,500));
         
            SqlParCol["@UID"].Value = UserEmail;
            SqlParCol["@X_FORWARDED"].Value = sIPAddress;
         
            try
            {
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
            }
            catch (Exception ex)
            {
                Console.Write("There is a problem " + ex);

            }
                     
        }

        public static string Get_X_FORWARDED()
        {
            System.Web.HttpContext context = System.Web.HttpContext.Current;
            string sIPAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (string.IsNullOrEmpty(sIPAddress))
            {
                return "";
            }
            else
            {
                string[] ipArray = sIPAddress.Split(new Char[] { ',' });
                return ipArray[0];
            }
        }

        protected void LogIn(object sender, EventArgs e)
        {
           
            if (IsValid)
            {
                string errorMessage = string.Empty;
               // bool isValidCaptcha = true; //ValidateReCaptcha(ref errorMessage);
                                            // Validate the user password
                                            // if (isValidCaptcha)
                if (IsValid && RadCaptcha1.IsValid)
                {

                    if (rememberme.Checked)
                    {
                        Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(30);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);
                        Response.Cookies["UserName"].Value = username.Text.Trim();
                        Response.Cookies["Password"].Value = userpassword.Text.Trim();
                    }
                    else
                    {
                        Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);

                        Request.Cookies["UserName"].Value = null;
                        Request.Cookies["Password"].Value = null;

                        //Response.Cookies.Remove("UserName");
                        //Response.Cookies.Remove("Password");
                        
                    }



                    var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                    var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();

                    // This doen't count login failures towards account lockout
                    // To enable password failures to trigger lockout, change to shouldLockout: true
                    // Require the user to have a confirmed email before they can log on.
                    var user = manager.FindByName(username.Text);
                    if (user != null)
                    {
                        if (!user.EmailConfirmed || user.UserActive.Equals(0))
                        {
                            FailureText.Text = "Invalid login attempt. You must have a confirmed email account or your account is deactivated.";
                            ErrorMessage.Visible = true;
                            //    ResendConfirm.Visible = true;
                        }
                        else
                        {
                            Session["Current_CenterID"] = null;
                            var result = signinManager.PasswordSignIn(username.Text, userpassword.Text, rememberme.Checked, shouldLockout: true);

                            switch (result)
                            {
                                case SignInStatus.Success:
                                    {

                                        Get_User_Activity(user.Email);
                                        IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                                    }
                                    break;
                                case SignInStatus.LockedOut:
                                    Response.Redirect("/Account/Lockout");
                                    break;
                                case SignInStatus.RequiresVerification:
                                    {
                                        Get_User_Activity(user.Email);
                                        Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}",
                                                                       Request.QueryString["ReturnUrl"],
                                                                       rememberme.Checked), true);
                                    }
                                    break;
                                case SignInStatus.Failure:
                                default:
                                    FailureText.Text = "Invalid login attempt";
                                    ErrorMessage.Visible = true;
                                    break;
                            }
                        }
                    }
                    else
                    {
                        FailureText.Text = "Invalid username or password!";
                    }
                }
               else
                 {
                    FailureText.Text = "Prove to us that you are not a robot!";
                    ErrorMessage.Visible = true;
                }
            }
            else
            {
                FailureText.Text = "Invalid login attempt!";
            }
        }


        public bool ValidateReCaptcha(ref string errorMessage)
        {
            var gresponse = Request["g-recaptcha-response"];
            string secret = "6LfnpjcUAAAAAHcl418ijj4TVKbD6le-iyIIMY2_";
            string ipAddress = GetIpAddress();

            var client = new WebClient();

            string url = string.Format("https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}&remoteip={2}", secret, gresponse, ipAddress);

            var response = client.DownloadString(url);

            var captchaResponse = JsonConvert.DeserializeObject<ReCaptchaResponse>(response);

            if (captchaResponse.Success)
            {
                return true;
            }
            else
            {
                var error = captchaResponse.ErrorCodes[0].ToLower();
                switch (error)
                {
                    case ("missing-input-secret"):
                        errorMessage = "The secret key parameter is missing.";
                        break;
                    case ("invalid-input-secret"):
                        errorMessage = "The given secret key parameter is invalid.";
                        break;
                    case ("missing-input-response"):
                        errorMessage = "The g-recaptcha-response parameter is missing.";
                        break;
                    case ("invalid-input-response"):
                        errorMessage = "The given g-recaptcha-response parameter is invalid.";
                        break;
                    default:
                        errorMessage = "reCAPTCHA Error. Please try again!";
                        break;
                }

                return false;
            }
        }


        string GetIpAddress()
        {
            var ipAddress = string.Empty;

            if (Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
            {
                ipAddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            }
            else if (!string.IsNullOrEmpty(Request.UserHostAddress))
            {
                ipAddress = Request.UserHostAddress;
            }

            return ipAddress;
        }

        public class ReCaptchaResponse
        {
            [JsonProperty("success")]
            public bool Success { get; set; }

            [JsonProperty("error-codes")]
            public List<string> ErrorCodes { get; set; }
        }

    }
}