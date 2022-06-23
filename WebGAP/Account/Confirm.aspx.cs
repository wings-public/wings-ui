using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;

using System.Net.Mail;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;

namespace WebGAP.Account
{
    public partial class Confirm : Page
    {

        #region "CnnStr"{
        string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}


        protected string StatusMessage
        {
            get;
            private set;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            string code = IdentityHelper.GetCodeFromRequest(Request);
            string userId = IdentityHelper.GetUserIdFromRequest(Request);

            if (code != null && userId != null)
            {
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var result = manager.ConfirmEmail(userId, code);

                if (result.Succeeded)
                {
                    LA_UserStruct LA_Userstruct = new LA_UserStruct { };
                    LA_Userstruct = LA_User_Info(userId);

                    string to = LA_Userstruct.LA_email;
                    string from = "noreply@WiNGS.be";
                    MailMessage message = new MailMessage(from, to);

                    string filename = Server.MapPath("../confirmEmailToAdmin.html");
                    string mailbody = System.IO.File.ReadAllText(filename);
                    mailbody = mailbody.Replace("##NAME##", LA_Userstruct.LA_name);
                    mailbody = mailbody.Replace("##EMAIL##", LA_Userstruct.User_email);
                    mailbody = mailbody.Replace("##USERNAME##", LA_Userstruct.User_name);


                    message.Subject = "New User request";
                    message.Body = mailbody;
                    message.BodyEncoding = Encoding.UTF8;
                    message.IsBodyHtml = true;
                    SmtpClient client = new SmtpClient("mailserv.esat.kuleuven.be");
                    client.EnableSsl = true;
                    client.UseDefaultCredentials = true;
                    try
                    {
                        client.Send(message);
                        successPanel.Visible = true;
                    }
                    catch (Exception ex)
                    {
                        Console.Write("There is a problem with the mail server." + ex);
                    }

                }
                else
                {
                    Console.Write("There is a problem.");
                    errorPanel.Visible = true;

                }
            }

        }
    












        //    if (result.Succeeded)
        //     {

        //    LA_UserStruct LA_Userstruct = new LA_UserStruct { };
        //    LA_Userstruct = LA_User_Info(userId);
        //    MailMessage mailMessage = new MailMessage();
        //    string sbj = "New User request";

        //    mailMessage.From = new MailAddress("noreply@WiNGS.be");
        //    mailMessage.To.Add(LA_Userstruct.LA_email);
        //    mailMessage.Subject = "WiNGS : " + sbj;

        //    StringBuilder sb = new StringBuilder();
        //    sb.Append(Environment.NewLine);
        //    sb.AppendLine("Dear " + LA_Userstruct.LA_name + ",");
        //    sb.Append(Environment.NewLine);
        //    sb.AppendLine("There is a new user account request for the WiNGS web application.");
        //    sb.Append(Environment.NewLine);
        //    sb.AppendLine("User name is: " + LA_Userstruct.User_name);
        //    sb.AppendLine("User Email is: " + LA_Userstruct.User_email);
        //    sb.Append(Environment.NewLine);
        //     sb.Append("WiNGS Team");
        //     mailMessage.Body = sb.ToString();
        //     mailMessage.IsBodyHtml = true;

        //    SmtpClient smtpClient = new SmtpClient("mailserv.esat.kuleuven.be");
        //    smtpClient.Send(mailMessage);

        //    successPanel.Visible = true;
        //    return;
        //    }
        //     }
        //    successPanel.Visible = false;
        //    errorPanel.Visible = true;
        //}

        protected LA_UserStruct LA_User_Info(string UserID)
            {

                String connstring = CnnStr;
                SqlConnection conn = new SqlConnection(connstring);
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlCommand cmd = new SqlCommand("Sp_LAdmin_Sel ", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@UserID", SqlDbType.VarChar, 200);
                cmd.Parameters.Add("@LA_email", SqlDbType.VarChar, 200);
                cmd.Parameters.Add("@LA_name", SqlDbType.VarChar, 200);
                cmd.Parameters.Add("@User_email", SqlDbType.VarChar, 200);
                cmd.Parameters.Add("@User_name", SqlDbType.VarChar, 200);


                cmd.Parameters["@UserID"].Value = UserID;
                cmd.Parameters["@LA_email"].Direction = ParameterDirection.Output;
                cmd.Parameters["@LA_name"].Direction = ParameterDirection.Output;
                cmd.Parameters["@User_email"].Direction = ParameterDirection.Output;
                cmd.Parameters["@User_name"].Direction = ParameterDirection.Output;

                SqlDataAdptrCmd.SelectCommand = cmd;

                cmd.Connection.Open();
                cmd.ExecuteReader();
                cmd.Connection.Close();

            LA_UserStruct LA_Userstruct = new LA_UserStruct
            {
                    LA_email = cmd.Parameters["@LA_email"].Value.ToString(),
                    LA_name = cmd.Parameters["@LA_name"].Value.ToString(),
                    User_email = cmd.Parameters["@User_email"].Value.ToString(),
                    User_name = cmd.Parameters["@User_name"].Value.ToString(),

             };
 
                return LA_Userstruct;

            }
        
        public struct LA_UserStruct
        {
            public string LA_email;
            public string LA_name;
            public string User_email;
            public string User_name;

         
        }

        private int StringToInt(string I)
        {
            int row, a = getIndexofNumber(I);
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
    }
}