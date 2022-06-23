using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Newtonsoft.Json;
using SendGrid;
using SendGrid.Helpers.Mail;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebGAP.Models;

namespace WebGAP.Account
{
    public partial class Register : Page
    {

        //static string smtpAddress = "smtp.gmail.com";
        //static int portNumber = 587;
        //static string emailFromAddress = "nasimshabanilalani@gmail.com"; //Sender Email Address  
        //static string password = "#Gorillaz358"; //Sender Password  
        ////static string emailToAddress = "nasimshabanilalani@gmail.com"; //Receiver Email Address  
        //static string subject = "WiNGS : Confirm your account";
        static string mailbody;



        #region "CnnStr"{
        string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}

        protected void CreateUser_Click(object sender, EventArgs e)
        {


            string errorMessage = string.Empty;
            //bool isValidCaptcha = ValidateReCaptcha(ref errorMessage);

            if (!DDL_Centers.SelectedValue.Equals("-1")) {

                if(Password.Text != Password_repeat.Text)
                {
                    ErrorMessage.Text = "Passwords do not match!";
                }
                else { 
               // if (isValidCaptcha)
               // {
                    if (!String.IsNullOrEmpty(DDL_App.SelectedValue.ToString()))
                    {
                        string selectedAppValues = null;
                        foreach (ListItem item in DDL_App.Items)
                        {
                            selectedAppValues += item.Value;
                        }

                        var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                        var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
                        string test = DDL_Centers.SelectedValue;
                        string SelectedAppValue = DDL_App.SelectedValue.ToString();

                        var user = new ApplicationUser()
                        {
                            UserName = Email.Text.Trim(),
                            Email = Email.Text.Trim(),
                            Affiliation = affiliation.Text.Trim(),
                            UserFullName = userfullname.Text.Trim(),
                            CenterID = StringToInt(test),
                            UserActive = 0,
                            PIID = -1,
                            Application = SelectedAppValue.Trim()
                        };



                        //UserPhoto = photo
                        //var user = new ApplicationUser() { UserName = Email.Text.Trim(), Email = Email.Text.Trim(), Affiliation = affiliation.Text.Trim(), UserFullName = userfullname.Text.Trim(), CenterID = StringToInt(test) };
                        IdentityResult result = manager.Create(user, Password.Text);

                    if (result.Succeeded)
                    {
                        string code = manager.GenerateEmailConfirmationToken(user.Id);
                        string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);

                        MailMessage mail = new MailMessage();

                        string filename = Server.MapPath("../confirmEmail.html");
                        mailbody = System.IO.File.ReadAllText(filename);
                        mailbody = mailbody.Replace("##NAME##", user.UserFullName);
                        mailbody = mailbody.Replace("##EMAIL##", user.Email);
                        mailbody = mailbody.Replace("##callbackUrl##", callbackUrl);


                        string to = user.Email;
                        string from = "noreply@WiNGS.be";
                        SmtpClient client = new SmtpClient("mailserv.esat.kuleuven.be");
                        //SmtpClient client = new SmtpClient("ses-smtp-user.wingsdev");

                        //SmtpClient client = new SmtpClient("mailserv.esat.kuleuven.be", 587);
                        //SmtpClient client = new SmtpClient("smtps.kuleuven.be", 465);
                        client.DeliveryMethod = SmtpDeliveryMethod.Network;
                        client.EnableSsl = true;
                        client.UseDefaultCredentials = true;
                        //client.Credentials = new System.Net.NetworkCredential("nshabani", "#Wings2020!");
                        //client.Credentials = new System.Net.NetworkCredential("u0122386", "#Wings2020!");
                        //client.Credentials = new System.Net.NetworkCredential("AKIAVWFPJ7XMF5MGX6OG", "BJOkTTJ7nCoI1umbSn7EOVrHjoQnVE2IezYdbkxVKsdj");
                        MailMessage message = new MailMessage(from, to);
                        message.Subject = "WiNGS : Confirm your account";
                        message.Body = mailbody;
                        message.BodyEncoding = Encoding.UTF8;
                        message.IsBodyHtml = true;





                        try
                        {
                            client.Send(message);
                            //SendEmail(emailFromAddress, user.Email, password, subject, mailbody);

                            // signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                            //IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);

                            SuccessMessage.Text = "An email has been sent to your account. Please view the email and confirm your account to complete the registration process.";

                        }
                        catch (Exception ex)
                        {
                            ErrorMessage.Text = "There is a problem with the mail server." + ex;
                        }

                    }
                    else
                    {
                        ErrorMessage.Text = result.Errors.FirstOrDefault();
                    }
                    }
                    else
                    {
                        ErrorMessage.Text = "Please select at least one application!";
                    }
                    //}
                    //else
                    //{
                    //    ErrorMessage.Text = "Prove to us that you are not a robot!";
                    //}
                }
            }
            else { ErrorMessage.Text = "Please select your center!"; }
        }

        //public static void SendEmail(string emailFromAddress, string emailToAddress, string password, string subject, string mailbody)
        //{
        //    using (MailMessage mail = new MailMessage())
        //    {
        //        mail.From = new MailAddress(emailFromAddress);
        //        mail.To.Add(emailToAddress);
        //        mail.Subject = subject;
        //        mail.Body = mailbody;
        //        mail.IsBodyHtml = true;
        //        //mail.Attachments.Add(new Attachment("D:\\TestFile.txt"));//--Uncomment this to send any attachment  
        //        using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
        //        {
        //            smtp.UseDefaultCredentials = false;
        //            smtp.Credentials = new NetworkCredential(emailFromAddress, password);
        //            smtp.EnableSsl = true;
        //            smtp.Send(mail);
        //        }

        //        //SmtpClient smtp = new SmtpClient();
        //        //smtp.Send(mail);
        //    }
        //}
        public bool ValidateReCaptcha(ref string errorMessage)
        {
            var gresponse = Request["g-recaptcha-response"];
            string secret = "6LfnpjcUAAAAAHcl418ijj4TVKbD6le-iyIIMY2_";
            string ipAddress = GetIpAddress();

            var client = new WebClient();

            string url = string.Format("https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}&remoteip={2}",secret, gresponse, ipAddress);

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

        private int StringToInt(string I)
        {
            int row = getIndexofNumber(I);
            int a = getIndexofNumber(I);
            string Numberpart = I.Substring(a, I.Length - a);
            row = Convert.ToInt32(Numberpart);
            return row;
        }
        private int getIndexofNumber(string cell)
        {
            int indexofNum = -1;
            foreach (char c in cell)
            {
                indexofNum++;
                if (Char.IsDigit(c))
                {
                    return indexofNum;
                }
            }
            return indexofNum;
        }

        protected void DDL_Centers_SelectedIndexChanged(object sender, EventArgs e)
        {
            //CBL_App.Items.Clear();
            //SqlConnection conn = new SqlConnection(CnnStr);
            //string query = "Sp_Sys_Application_PerCenter_Sel " + DDL_Centers.SelectedValue;

            //SqlDataAdapter adapter1 = new SqlDataAdapter();
            //adapter1.SelectCommand = new SqlCommand(query, conn);
            //DataTable myDataTable = new DataTable();
            //conn.Open();
            //try
            //{
            //    adapter1.Fill(myDataTable);
                
            //    foreach (DataRow row in myDataTable.Rows)
            //    {
            //        CBL_App.Items.Add(new ListItem(row["Application_Desc"].ToString(), row["Application"].ToString(), true));
            //    }
            //    foreach (ListItem item in CBL_App.Items)
            //    {
            //        item.Selected = true;
            //        item.Enabled = false;
            //    }
            //}
            //finally
            //{
            //    conn.Close();
            //}

           
        }


        //protected LA_UserStruct LA_User_Info(string UserID)
        //{

        //    String connstring = CnnStr;
        //    SqlConnection conn = new SqlConnection(connstring);
        //    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
        //    SqlCommand cmd = new SqlCommand("Sp_LAdmin_Sel ", conn);
        //    cmd.CommandType = CommandType.StoredProcedure;

        //    cmd.Parameters.Add("@UserID", SqlDbType.VarChar, 200);
        //    cmd.Parameters.Add("@LA_email", SqlDbType.VarChar, 200);
        //    cmd.Parameters.Add("@LA_name", SqlDbType.VarChar, 200);
        //    cmd.Parameters.Add("@User_email", SqlDbType.VarChar, 200);
        //    cmd.Parameters.Add("@User_name", SqlDbType.VarChar, 200);


        //    cmd.Parameters["@UserID"].Value = UserID;
        //    cmd.Parameters["@LA_email"].Direction = ParameterDirection.Output;
        //    cmd.Parameters["@LA_name"].Direction = ParameterDirection.Output;
        //    cmd.Parameters["@User_email"].Direction = ParameterDirection.Output;
        //    cmd.Parameters["@User_name"].Direction = ParameterDirection.Output;

        //    SqlDataAdptrCmd.SelectCommand = cmd;

        //    cmd.Connection.Open();
        //    cmd.ExecuteReader();
        //    cmd.Connection.Close();

        //    LA_UserStruct LA_Userstruct = new LA_UserStruct
        //    {
        //        LA_email = cmd.Parameters["@LA_email"].Value.ToString(),
        //        LA_name = cmd.Parameters["@LA_name"].Value.ToString(),
        //        User_email = cmd.Parameters["@User_email"].Value.ToString(),
        //        User_name = cmd.Parameters["@User_name"].Value.ToString(),

        //    };

        //    return LA_Userstruct;

        //}

        //public struct LA_UserStruct
        //{
        //    public string LA_email;
        //    public string LA_name;
        //    public string User_email;
        //    public string User_name;


        //}


    }



    //public class EmailService : IIdentityMessageService
    //{
    //    public Task SendAsync(IdentityMessage message)
    //    {
    //        return configSendGridasync(message);
    //    }

    //    private Task configSendGridasync(IdentityMessage message)
    //    {
    //        var myMessage = new SendGridMessage();
    //        myMessage.AddTo(message.Destination);
    //        myMessage.From = new System.Net.Mail.MailAddress("haleh.chizari@gmail.com", "Joe S.");
    //        myMessage.Subject = message.Subject;
    //        myMessage.PlainTextContent = message.Body;
    //        myMessage.HtmlContent = message.Body;

    //        var credentials = new NetworkCredential(
    //                   ConfigurationManager.AppSettings["mailAccount"],
    //                   ConfigurationManager.AppSettings["mailPassword"]
    //                   );

    //        // Create a Web transport for sending email.
    //        var transportWeb = new Web(credentials);

    //        // Send the email.
    //        if (transportWeb != null)
    //        {
    //            return transportWeb.DeliverAsync(myMessage);
    //        }
    //        else
    //        {
    //            return Task.FromResult(0);
    //        }
    //    }
    //}

}