using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.Management.Popup
{
    public partial class uc_AddSampleToPrivate : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Inset_Click(object sender, EventArgs e)
        {
          
            SqlConnection conn = new SqlConnection(CnnStr);

            SqlCommand cmd = new SqlCommand("Sp_UPDS_Count_SampleS_For_Add", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = cmd.Parameters;

            SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@UserDatasetID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@SampleID", SqlDbType.BigInt));
            SqlParCol.Add(new SqlParameter("@OldDatasetID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@Output", SqlDbType.Int));


            SqlParCol["@UserID"].Value = Session["WiNGSMasterID"].ToString();
            SqlParCol["@UserDatasetID"].Value = Request.QueryString["DatasetID"].ToString();
            SqlParCol["@SampleID"].Value = RLB_ADS.SelectedValue;
            SqlParCol["@OldDatasetID"].Value = RCB_UserDataset.SelectedValue;
            cmd.Parameters["@Output"].Direction = ParameterDirection.Output;

            try
            {
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                if (cmd.Parameters["@Output"].Value.Equals(0))
                {
                    AddSample();
                    ScriptManager.RegisterStartupScript(this, GetType(), "close", "CloseModal();", true);
                }
                    cmd.Connection.Close();
                // txt_feedback.Text = "New user inserted";
            }
            catch (Exception ex)
            {
                // txt_feedback.Text = "Unable to insert User. Reason: " + ex.Message;
            }

        }

        public void AddSample()
        {
            List<FSObject> TGList = new List<FSObject>();
            
            foreach (RadListBoxItem item in RLB_YDS.Items)
            {
                string SampleID = item.Value.ToString();
                TGList.Add(new FSObject(Session["WiNGSMasterID"].ToString(), Request.QueryString["DatasetID"].ToString(), SampleID, RCB_UserDataset.SelectedValue));
            }
            ThreadAddFs tTG = new ThreadAddFs(TGList);
            Thread tTGrunner = new Thread(new ThreadStart(tTG.ThreadProc));
            tTGrunner.Start();
            tTGrunner.Join();
        }

        public struct FSObject
        {
            public string UserID;
            public string UserDatasetID;
            public string SampleID;
            public string OldDatasetID;
          
            public FSObject(string UserID, string UserDatasetID, string SampleID, string OldDatasetID)
            {
                this.UserID = UserID;
                this.UserDatasetID = UserDatasetID;
                this.SampleID = SampleID;
                this.OldDatasetID = OldDatasetID;
            }
        }

        public class ThreadAddFs
        {
            private List<FSObject> T_TGList = new List<FSObject>();
            public ThreadAddFs(List<FSObject> TGList)
            {
                for (int i = 0; i <= TGList.Count - 1; i++)
                {
                    T_TGList.Add(new FSObject(TGList[i].UserID, TGList[i].UserDatasetID, TGList[i].SampleID, TGList[i].OldDatasetID));
                }
            }

            public void ThreadProc()
            {
                DataTable TG_table = new DataTable();
                TG_table.Columns.Add("UserID", typeof(Int32));
                TG_table.Columns.Add("UserDatasetID", typeof(Int32));
                TG_table.Columns.Add("SampleID", typeof(Int64));
                TG_table.Columns.Add("OldDatasetID", typeof(Int32));

                for (int i = 0; i <= T_TGList.Count - 1; i++)
                {
                    TG_table.Rows.Add(T_TGList[i].UserID, T_TGList[i].UserDatasetID, T_TGList[i].SampleID, T_TGList[i].OldDatasetID);
                }
                using (SqlConnection Conn = new SqlConnection(CnnStr))
                {
                    Conn.Open();
                    using (SqlBulkCopy s = new SqlBulkCopy(Conn))
                    {
                        s.DestinationTableName = "Tbl_User_Private_Dataset_Sample";
                        s.WriteToServer(TG_table);
                        s.Close();
                    }
                    Conn.Close();
                }
            }
        }
    }
}