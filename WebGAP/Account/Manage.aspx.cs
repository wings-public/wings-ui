using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Owin;
using WebGAP.Models;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using Telerik.Web.UI;
using System.Web.UI.HtmlControls;

namespace WebGAP.Account
{
    public partial class Manage : System.Web.UI.Page
    {
        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}

        protected string SuccessMessage
        {
            get;
            private set;
        }

        private bool HasPassword(ApplicationUserManager manager)
        {
            return manager.HasPassword(User.Identity.GetUserId());
        }

        public bool HasPhoneNumber { get; private set; }

        public bool TwoFactorEnabled { get; private set; }

        public bool TwoFactorBrowserRemembered { get; private set; }

        public int LoginsCount { get; set; }

        protected void Page_Load()
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();

            fillTextBox(User.Identity.GetUserId());

            HasPhoneNumber = String.IsNullOrEmpty(manager.GetPhoneNumber(User.Identity.GetUserId()));

            // Enable this after setting up two-factor authentientication
            // PhoneNumber.Text = manager.GetPhoneNumber(User.Identity.GetUserId()) ?? String.Empty;

            //if (!PhoneNumber.Text.Equals(""))
            //      PhoneNumber.Text = HideNumber(PhoneNumber.Text);

            TwoFactorEnabled = manager.GetTwoFactorEnabled(User.Identity.GetUserId());

            LoginsCount = manager.GetLogins(User.Identity.GetUserId()).Count;

            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;

            if (!IsPostBack)
            {
                // Determine the sections to render
                //if (HasPassword(manager))
                //{
                //    ChangePassword.Visible = true;
                //}
                //else
                //{
                //    CreatePassword.Visible = true;
                //    ChangePassword.Visible = false;
                //}

                // Render success message
                var message = Request.QueryString["m"];
                if (message != null)
                {
                    // Strip the query string from action
                    Form.Action = ResolveUrl("~/Account/Manage");

                    SuccessMessage =
                        message == "ChangePwdSuccess" ? "Your password has been changed."
                        : message == "SetPwdSuccess" ? "Your password has been set."
                        : message == "RemoveLoginSuccess" ? "The account was removed."
                        : message == "AddPhoneNumberSuccess" ? "Phone number has been added"
                        : message == "RemovePhoneNumberSuccess" ? "Phone number was removed"
                        : String.Empty;
                    successMessage.Visible = !String.IsNullOrEmpty(SuccessMessage);
                }
            }
        }

        protected string HideNumber(string number)
        {
            string hiddenString = number.Substring(number.Length - 4)
               .PadLeft(number.Length, '*');
            
            return hiddenString;
        }

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        // Remove phonenumber from user
        protected void RemovePhone_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var result = manager.SetPhoneNumber(User.Identity.GetUserId(), null);
            if (!result.Succeeded)
            {
                return;
            }
            var user = manager.FindById(User.Identity.GetUserId());
            if (user != null)
            {
                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                Response.Redirect("/Account/Manage?m=RemovePhoneNumberSuccess");
            }
        }

        // DisableTwoFactorAuthentication
        protected void TwoFactorDisable_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            manager.SetTwoFactorEnabled(User.Identity.GetUserId(), false);

            Response.Redirect("/Account/Manage");
        }

        //EnableTwoFactorAuthentication 
        protected void TwoFactorEnable_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();

            manager.SetTwoFactorEnabled(User.Identity.GetUserId(), true);


            Response.Redirect("/Account/Manage");
        }

        protected void btn_Inset_Click(object sender, EventArgs e)
        {
             SqlConnection conn = new SqlConnection(CnnStr);
           
            SqlCommand cmd = new SqlCommand("Sp_UserProfile_UpD", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = cmd.Parameters;

            SqlParCol.Add(new SqlParameter("@Id", SqlDbType.NVarChar, 128));
            SqlParCol.Add(new SqlParameter("@UserFullName", SqlDbType.NVarChar, 250));

            SqlParCol["@Id"].Value = User.Identity.GetUserId();
            SqlParCol["@UserFullName"].Value = UserFullName.Text;

            if (AsyncUploadProfileImg.UploadedFiles.Count > 0)
            {
                lbl_err.Visible = false;
                UploadedFile file = AsyncUploadProfileImg.UploadedFiles[0];
                byte[] fileData = new byte[file.InputStream.Length];
                file.InputStream.Read(fileData, 0, (int)file.InputStream.Length);
                cmd.Parameters.Add("@UserPhoto", SqlDbType.Image);
                cmd.Parameters["@UserPhoto"].Value = fileData;
            }
            else
            {
                lbl_err.Visible = true;               
                //HtmlGenericControl span = new HtmlGenericControl("span");
                //span.Attributes.Add("class", "icon-bullet-red") ;
                //span.InnerText = "This file is not supported.";
                //lbl_err.Controls.Add(span);
            }
            try
            {
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                ScriptManager.RegisterStartupScript(this, GetType(), "close", "CloseEditProfile()", true);

                //ScriptManager.RegisterStartupScript(this, GetType(), "close", "RefreshParent()", true);
                // txt_feedback.Text = "New user inserted";

            }
            catch (Exception ex)
            {
                Console.Write("Unable to insert User. Reason: " + ex.Message);
                //   txt_feedback.Text = "Unable to insert User. Reason: " + ex.Message;
            }
        }

        protected void fillTextBox(string UserID)
        {
            if (!IsPostBack)
            {
                String connstring = CnnStr;
                SqlConnection conn = new SqlConnection(connstring);
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlCommand cmd = new SqlCommand("Sp_SingleUser_Sel", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Id", SqlDbType.NVarChar, 128);
                cmd.Parameters["@Id"].Value = UserID;
                SqlDataAdptrCmd.SelectCommand = cmd;
                DataTable myDataTable = new DataTable();
                conn.Open();
                try
                {
                    SqlDataAdptrCmd.Fill(myDataTable);
                    UserFullName.Text = myDataTable.Rows[0]["UserFullName"].ToString();
                    if (!String.IsNullOrEmpty(myDataTable.Rows[0]["UserPhoto"].ToString()))
                        RBImg_userProfile.DataValue = (byte[])myDataTable.Rows[0]["UserPhoto"];
                    else
                        RBImg_userProfile.ImageUrl = "../img/defaultAvatar.png";
                }
                finally
                {
                    conn.Close();
                }
            }
        }







    }
}