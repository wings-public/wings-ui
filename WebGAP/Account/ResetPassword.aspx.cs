using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using WebGAP.Models;

namespace WebGAP.Account
{
    public partial class ResetPassword : Page
    {
       // private ApplicationSignInManager signinManager;
      //  private ApplicationUserManager manager;

        protected string StatusMessage
        {
            get;
            private set;
        }

      
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }


        protected void Reset_Click(object sender, EventArgs e)
        {
            
            bool rememberMe = false;
            bool.TryParse(Request.QueryString["RememberMe"], out rememberMe);


            string code = IdentityHelper.GetCodeFromRequest(Request);
        
            if (code != null)
            {
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();

                var user = manager.FindByName(Email.Text);
                if (user == null)
                {
                    ErrorMessage.Text = "No user found";
                    return;
                }
               
                var result = manager.ResetPassword(user.Id, code, Password.Text);
                if (result.Succeeded)
                {
                    Response.Redirect("~/Account/ResetPasswordConfirmation");
                    return;
                }
                ErrorMessage.Text = result.Errors.FirstOrDefault();
                return;
            }

            ErrorMessage.Text = "An error has occurred";
        }
    }
    }
