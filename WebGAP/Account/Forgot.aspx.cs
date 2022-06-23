
using System;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using WebGAP.Models;

namespace WebGAP.Account
{
    public partial class ForgotPassword : Page
    {
        private ApplicationSignInManager signinManager;
        private ApplicationUserManager manager_2FA;

        public ForgotPassword()
        {
            manager_2FA = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Forgot(object sender, EventArgs e)
        {
            if (IsValid)
            {

                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                ApplicationUser user = manager.FindByName(Email.Text);
                if (user == null || !manager.IsEmailConfirmed(user.Id))
                {
                    FailureText.Text = "The user either does not exist or is not confirmed.";
                    ErrorMessage.Visible = true;
                    return;
                }

                string code = manager.GeneratePasswordResetToken(user.Id);
                string callbackUrl = IdentityHelper.GetResetPasswordRedirectUrl(code, Request);

                MailMessage mail = new MailMessage();

                string filename = Server.MapPath("../forgetPassword.html");
                string mailbody = System.IO.File.ReadAllText(filename);
                mailbody = mailbody.Replace("##NAME##", user.UserFullName);
                //mailbody = mailbody.Replace("##EMAIL##", user.Email);
                mailbody = mailbody.Replace("##callbackUrl##", callbackUrl);


                string to = user.Email;
                string from = "noreply@WiNGS.be";
                MailMessage message = new MailMessage(from, to);
                message.Subject = "WiNGS: Reset Password";
                message.Body = mailbody;
                message.BodyEncoding = Encoding.UTF8;
                message.IsBodyHtml = true;
                SmtpClient client = new SmtpClient("mailserv.esat.kuleuven.be");
                client.EnableSsl = true;
                client.UseDefaultCredentials = true;
                try
                {
                    client.Send(message);
                    loginForm.Visible = false;
                    DisplayEmail.Visible = true;
                }
                catch (Exception ex)
                {
                    FailureText.Text = "There is a problem with the mail server." + ex;
                }

            }
            else
                FailureText.Text = "It is not valid.";

        }
    }
}