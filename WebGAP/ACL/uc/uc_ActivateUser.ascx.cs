using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.ACL.uc
{
    public partial class uc_ActivateUser : System.Web.UI.UserControl
    {

        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}


        protected void Page_Init(object sender, EventArgs e)
        {

        }

        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["WiNGSUserType"].ToString().Equals("1"))
            {
                DDL_Centers.Attributes["style"] = "visibility: hidden;";
                DDL_Centers.Items.Insert(0, new ListItem(Session["WiNGSCenterID"].ToString()));
                DDL_Centers.SelectedIndex = 0;

            }

        }


        protected void RG_ActivateUsers_ItemUpdated(object sender, Telerik.Web.UI.GridUpdatedEventArgs e)
        {

            GridEditFormItem itemGrid = e.Item as GridEditFormItem;

            string email = itemGrid.GetDataKeyValue("Email").ToString();

            RadDropDownList RDDL_UserStatus;
            RDDL_UserStatus = ((RadDropDownList)e.Item.FindControl("DDL_UserActive"));
            string RUserStatus = RDDL_UserStatus.SelectedItem.Text.ToString();

            


            string item = getItemName(e.Item.OwnerTableView.Name);
            string field = getFieldName(e.Item.OwnerTableView.Name);
            if (e.Exception != null)
            {
                e.KeepInEditMode = true;
                e.ExceptionHandled = true;
                DisplayMessage(item + " " + e.Item[field].Text + " cannot be updated. Reason: " + e.Exception.Message);
            }
            else
            {
                string to = email;
                string from = "noreply@WiNGS.be";

                MailMessage message = new MailMessage(from, to);

                string filename = Server.MapPath("../userStatus.html");
                string mailbody = System.IO.File.ReadAllText(filename);
                mailbody = mailbody.Replace("##USERSTATUS##", RUserStatus);

                message.Subject = "Your account is" + RUserStatus;
                message.Body = mailbody;
                message.BodyEncoding = Encoding.UTF8;
                message.IsBodyHtml = true;
                SmtpClient client = new SmtpClient("mailserv.esat.kuleuven.be");
                client.EnableSsl = true;
                client.UseDefaultCredentials = true;
                try
                {
                    client.Send(message);
                    DisplayMessage(item + " " + e.Item[field].Text + " updated");

                }
                catch (Exception ex)
                {
                    Console.Write("There is a problem with the mail server.");
                }

            }
        }

        private String getItemName(string tableName)
        {
            switch (tableName)
            {
                case ("Master"):
                    {
                        return "ActivateUsers";
                    }


                default: return "";
            }
        }

        private void DisplayMessage(string text)
        {
            RG_ActivateUsers.Controls.Add(new LiteralControl(string.Format("<span style='color:red'>{0}</span>", text)));
        }
        private String getFieldName(string tableName)
        {
            switch (tableName)
            {
                case ("Master"):
                    {
                        return "UserID";
                    }
                default: return "";
            }
        }

        protected void RG_ActivateUsers_ItemCommand(object sender, GridCommandEventArgs e)
        {

            
            if (e.CommandName.Equals("Edit"))
            {

                if (DDL_Centers.SelectedValue.Equals(""))
                {

                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Please select a center first!</b><br />');", true);
                    e.Canceled = true;
                }


            }
         
        }


        protected void CustomValidator1_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            string value = forValidation.Value;
           if ((args.Value == "Select One" & value == "PI") || (args.Value != "Select One" & args.Value.Length != 0))
                args.IsValid = true;
            else
                args.IsValid = false;
        }

        protected void RG_ActivateUsers_ItemDataBound(object sender, GridItemEventArgs e)
        {
          
            if (e.Item is GridEditableItem && e.Item.IsInEditMode)
            {
                HiddenField hdn_UserType = (HiddenField)e.Item.FindControl("hdn_UserType");
                RadDropDownList RDD_PI = (RadDropDownList)e.Item.FindControl("DDL_PIID");
                if (hdn_UserType.Value.Equals("2"))
                {

                    RDD_PI.Enabled = false;
                    RadDropDownList RDDL_UserType = (RadDropDownList)e.Item.FindControl("RDDL_UserType");
                    RDDL_UserType.Enabled = false;
                }
                if (!hdn_UserType.Value.Equals(""))
                    RDD_PI.Enabled = false;
            }  
        }

       
    }
}