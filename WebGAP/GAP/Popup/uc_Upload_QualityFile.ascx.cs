
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using Telerik.Web.UI;

namespace WebGAP.GAP.Popup
{
   
    public partial class uc_Upload_QualityFile : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion} 

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Btn_AddFileForQuality_Click(object sender, EventArgs e)
        {
            

            if (RADUPT_Quality.UploadedFiles.Count > 0)
            {
                foreach (UploadedFile f2 in RADUPT_Quality.UploadedFiles)
               {
                    string InputFile_Type = InputFileType.SelectedValue.ToString();
                    string targetFolder = Server.MapPath("~/Upload/");
                    f2.SaveAs(targetFolder + "\\" + f2.GetName() + ".json",  true);
                 
                }
                
            }
        }

        protected void readfile( string path, string InputFile_Type)
        {

            SqlConnection conn = new SqlConnection(CnnStr);
            StreamReader sr = new StreamReader(path);
            string line;
            ////Read the first line of text
            line = sr.ReadLine();
            //JObject json = JObject.Parse(line);
            SqlCommand cmd = new SqlCommand("Sp_SampleQuality_File_Ins", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = cmd.Parameters;
            SqlParCol.Add(new SqlParameter("@SampleID", SqlDbType.BigInt));
            SqlParCol.Add(new SqlParameter("@InputFileTypeID", SqlDbType.VarChar, 1));
            SqlParCol.Add(new SqlParameter("@MetricsValue", SqlDbType.NVarChar));

            SqlParCol["@SampleID"].Value = Request.QueryString["SampleID"];
            SqlParCol["@InputFileTypeID"].Value = InputFile_Type;

            //string quality = json.ToString().Replace("\r\n"," ");
            //quality = quality.Replace("      ", " ");
            //quality = quality.Replace("          ", " ");
            //quality = quality.Replace("      ", " ");
            //quality = quality.Replace("\"", " ");

            SqlParCol["@MetricsValue"].Value = line;

            try
            {
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();

            }
            catch (Exception ex)
            {
                Label lblError = new Label();
                lblError.Text = "Unable to insert . Reason: " + ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;

            }
        
        }

      
    }
}