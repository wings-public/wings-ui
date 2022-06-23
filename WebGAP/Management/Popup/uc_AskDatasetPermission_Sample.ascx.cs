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
    public partial class uc_AskDatasetPermission_Sample : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion} 

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Req_Click(object sender, EventArgs e)
        {
            string DS = string.Empty;
            SqlConnection Conn = new SqlConnection(CnnStr);
            SqlCommand Cmd = new SqlCommand("Sp_User_Ask_Sample_Permision", Conn);
            Cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = Cmd.Parameters;
            
            SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@Desc", SqlDbType.VarChar, 4000));
            SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@PIID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@SampleList", SqlDbType.VarChar, 4000));
            SqlParCol.Add(new SqlParameter("@DSID_created", SqlDbType.Int));


            SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
            SqlParCol["@CenterID"].Value = Session["Ask_Sample_Permision_CenterId"].ToString();
            SqlParCol["@PIID"].Value = Session["Ask_Sample_Permision_PIId"].ToString();
            SqlParCol["@SampleList"].Value = Session["Ask_Sample_Permision_SampleList"].ToString();
            SqlParCol["@Desc"].Value = Txt_Desc.Text.Trim();
            SqlParCol["@DSID_created"].Direction = ParameterDirection.Output;
            ScriptManager.RegisterStartupScript(this, GetType(), "close", "CloseModal();", true);


            try
            {
                Cmd.Connection.Open();
                Cmd.ExecuteNonQuery();
                DS = SqlParCol["@DSID_created"].Value.ToString();
                Cmd.Connection.Close();
                SendEmail(DS);
            }
            catch (Exception ex)
            {


            }

        }


        public void SendEmail(string DS)
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


            SqlParCol["@PIName"].Value = Session["Ask_Sample_Permision_PIName"].ToString();
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
            mailbody = mailbody.Replace("##NAME##", Session["Ask_Sample_Permision_PIName"].ToString());
            mailbody = mailbody.Replace("##DATASET##", DS);
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