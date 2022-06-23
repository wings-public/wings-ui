using System;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using Microsoft.Owin.Security;
using WebGAP.Models;
using WebGAP.Account;
using SendGrid;
using SendGrid.Helpers.Mail;
using System.Configuration;
using System.Diagnostics;


using System.Web;
using static WebGAP.Account.Confirm;
using System.Net.Mail;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace WebGAP
{
    
    public class EmailService : IIdentityMessageService
    {
        #region "CnnStr"{
        string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}

        public async Task SendAsync(IdentityMessage message)
        {
            await configSendGridasync(message);
           // return Task.FromResult(0);
        }

        // Use NuGet to install SendGrid (Basic C# client lib) 
        private async Task configSendGridasync(IdentityMessage message)
        {
            //var myMessage = new SendGrid.SendGridMessage();
            //myMessage.AddTo(message.Destination);
            //myMessage.From = new System.Net.Mail.MailAddress(
            //                    "Royce@contoso.com", "Royce Sellars (Contoso Admin)");
            //myMessage.Subject = message.Subject;
            //myMessage.PlainTextContent = message.Body;
            //myMessage.HtmlContent = message.Body;

            //var credentials = new NetworkCredential(
            //           ConfigurationManager.AppSettings["emailServiceUserName"],
            //           ConfigurationManager.AppSettings["emailServicePassword"]
            //           );

            //// Create a Web transport for sending email.
            //var transportWeb = new Web(credentials);

            //// Send the email.
            //if (transportWeb != null)
            //{
            //    await transportWeb.DeliverAsync(myMessage);
            //}
            //else
            //{
            //    Trace.TraceError("Failed to create Web transport.");
            //    await Task.FromResult(0);
            //}
            
            //var client = new SendGridClient(ConfigurationManager.AppSettings["MailAPISendGrid"]);
            //var msg = new SendGridMessage()
            //{
            //    From = new EmailAddress("noreply@WiNGS.be", "WiNGS"),
            //    Subject = message.Subject,
            //    PlainTextContent = message.Body,
            //    HtmlContent = message.Body
            //};

            //msg.AddTo(new EmailAddress(message.Destination));
            //var response = await client.SendEmailAsync(msg);

          // string userId = IdentityHelper.GetUserIdFromRequest();
          
            string USER_email = message.Destination;
            MailMessage mailMessage = new MailMessage();
            mailMessage.From = new MailAddress("noreply@WiNGS.be");
            mailMessage.To.Add(USER_email);
            mailMessage.Subject = message.Subject;
            mailMessage.Body = message.Body;
            SmtpClient smtpClient = new SmtpClient("mailserv.esat.kuleuven.be");
            smtpClient.Send(mailMessage);

     }

    }


  //  public class SmsService : IIdentityMessageService
  //  {


       // public Task SendAsync(IdentityMessage message)
       // {


       //     var Twilio = new TwilioRestClient(
       //     ConfigurationManager.AppSettings["SMSSID"],
       //     ConfigurationManager.AppSettings["SMSAuthToken"]
       //  );
       //     var result = Twilio.SendMessage(
       //         ConfigurationManager.AppSettings["SMSPhoneNumber"],
       //        message.Destination, message.Body);

       //  //   Status is one of Queued, Sending, Sent, Failed or null if the number is not valid
       //     Trace.TraceInformation(result.Status);

       ////     Twilio doesn't currently have an async API, so return success.
       //     return Task.FromResult(0);


       // }
   // }
    
   
    //public override async Task<bool> SendTwoFactorCodeAsync(string provider)
    //{
    //    int userId = 0;
    //    try
    //    {
    //        userId = await SignInManager.GetVerifiedUserIdAsync();
    //        if (userId == 0)
    //        {
    //            userId = Convert.ToInt32(HttpContext.Current.User.Identity.GetUserId());
    //        }

    //        if (userId == 0)
    //            return false;
    //    }
    //    catch
    //    {
    //        return false;
    //    }

    //    var token = await UserManager.GenerateTwoFactorTokenAsync(userId, provider);

    //    // See IdentityConfig.cs to plug in Email/SMS services to actually send the code
    //    await UserManager.NotifyTwoFactorTokenAsync(userId, provider, token);
    //    return true;

    //    //return base.SendTwoFactorCodeAsync(provider);
    //}
    // Configure the application user manager used in this application. UserManager is defined in ASP.NET Identity and is used by the application.
    public class ApplicationUserManager : UserManager<ApplicationUser>
    {
        public ApplicationUserManager(IUserStore<ApplicationUser> store)
            : base(store)
        {
        }

        public static ApplicationUserManager Create(IdentityFactoryOptions<ApplicationUserManager> options, IOwinContext context)
        {
            var manager = new ApplicationUserManager(new UserStore<ApplicationUser>(context.Get<ApplicationDbContext>()));
            // Configure validation logic for usernames
            manager.UserValidator = new UserValidator<ApplicationUser>(manager)
            {
                AllowOnlyAlphanumericUserNames = false,
                RequireUniqueEmail = true
            };

            // Configure validation logic for passwords
            manager.PasswordValidator = new PasswordValidator
            {
                RequiredLength = 6,
                RequireNonLetterOrDigit = true,
                RequireDigit = true,
                RequireLowercase = true,
                RequireUppercase = true,
            };

            // Register two factor authentication providers. This application uses Phone and Emails as a step of receiving a code for verifying the user
            // You can write your own provider and plug it in here.
            manager.RegisterTwoFactorProvider("Phone Code", new PhoneNumberTokenProvider<ApplicationUser>
            {
                MessageFormat = "Your security code is {0}"
            });
            manager.RegisterTwoFactorProvider("Email Code", new EmailTokenProvider<ApplicationUser>
            {
                Subject = "Security Code",
                BodyFormat = "Your security code is {0}"
            });

            // Configure user lockout defaults
            manager.UserLockoutEnabledByDefault = true;
            manager.DefaultAccountLockoutTimeSpan = TimeSpan.FromMinutes(5);
            manager.MaxFailedAccessAttemptsBeforeLockout = 5;

            manager.EmailService = new EmailService();
         //   manager.SmsService = new SmsService();
            var dataProtectionProvider = options.DataProtectionProvider;
            if (dataProtectionProvider != null)
            {
                manager.UserTokenProvider = new DataProtectorTokenProvider<ApplicationUser>(dataProtectionProvider.Create("ASP.NET Identity"));
            }
            return manager;
        }
    }

    public class ApplicationSignInManager : SignInManager<ApplicationUser, string>
    {
        public ApplicationSignInManager(ApplicationUserManager userManager, IAuthenticationManager authenticationManager) :
            base(userManager, authenticationManager) { }

        public override Task<ClaimsIdentity> CreateUserIdentityAsync(ApplicationUser user)
        {
            return user.GenerateUserIdentityAsync((ApplicationUserManager)UserManager);
        }

        public static ApplicationSignInManager Create(IdentityFactoryOptions<ApplicationSignInManager> options, IOwinContext context)
        {
            return new ApplicationSignInManager(context.GetUserManager<ApplicationUserManager>(), context.Authentication);
        }
    }


}
