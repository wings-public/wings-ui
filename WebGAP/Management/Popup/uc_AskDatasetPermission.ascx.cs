using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Net.Mail;
using System.Text;

namespace WebGAP.Management.Popup
{
    public partial class uc_AskDatasetPermission : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Req_Click(object sender, EventArgs e)
        {

            SqlConnection conn = new SqlConnection(CnnStr);
            SqlCommand cmd = new SqlCommand("Sp_User_Ask_Dataset_Permission", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = cmd.Parameters;

            SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@DatasetID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@ReqDesc", SqlDbType.VarChar, 3000));

            SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
            SqlParCol["@DatasetID"].Value = Session["RquestDS_DSID"];
            SqlParCol["@ReqDesc"].Value = Txt_Desc.Text;

            try
            {
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                SendEmail();
            }
            catch (Exception ex)
            {


            }
            ScriptManager.RegisterStartupScript(this, GetType(), "close", "CloseModal();", true);

        }




        public void SendEmail()
        {

            string PI_Mail = string.Empty;
            string User_Name = string.Empty;
            string Center = string.Empty;


            string Mail = string.Empty;
            SqlConnection conn = new SqlConnection(CnnStr);
            SqlCommand cmd = new SqlCommand("Sp_RequestDataset_PIMail_UsrInfo_Sel", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlDataAdptrCmd.SelectCommand = cmd;
            SqlParCol = cmd.Parameters;

            SqlParCol.Add(new SqlParameter("@PIName", SqlDbType.NVarChar, 50));
            SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@UserName", SqlDbType.NVarChar, 50));
            SqlParCol.Add(new SqlParameter("@Center", SqlDbType.NVarChar, 50));
            SqlParCol.Add(new SqlParameter("@MailPI", SqlDbType.NVarChar, 50));


            SqlParCol["@PIName"].Value = Session["RquestDS_PIName"].ToString();
            SqlParCol["@UserID"].Value = Session["WiNGSMasterId"].ToString();
            SqlParCol["@UserName"].Direction = ParameterDirection.Output;
            SqlParCol["@Center"].Direction = ParameterDirection.Output;
            SqlParCol["@MailPI"].Direction = ParameterDirection.Output;

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                PI_Mail = SqlParCol["@MailPI"].Value.ToString();
                User_Name = SqlParCol["@UserName"].Value.ToString();
                Center = SqlParCol["@Center"].Value.ToString();
                conn.Close();

            }
            catch (Exception ex)
            {
            }


            string to = PI_Mail;
            string from = "noreply@WiNGS.be";
            MailMessage message = new MailMessage(from, to);

            string filename = Server.MapPath("../NotifyPI_askDS_Permission.html");
            string mailbody = System.IO.File.ReadAllText(filename);
            mailbody = mailbody.Replace("##NAME##", Session["RquestDS_PIName"].ToString());
            mailbody = mailbody.Replace("##DATASET##", Session["RquestDS_DSID"].ToString());
            mailbody = mailbody.Replace("##USERNAME##", Session["User_Name"].ToString() + " from Center: " + Center);


            message.Subject = "New access request to dataset";
            message.Body = mailbody;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("mailserv.esat.kuleuven.be");
            client.EnableSsl = true;
            client.UseDefaultCredentials = true;
            try
            {
                client.Send(message);
             
            }
            catch (Exception ex)
            {
                Console.Write("There is a problem with the mail server." + ex);
            }

        }
      

    }
}