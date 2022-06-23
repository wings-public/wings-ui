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

namespace WebGAP.ACL.Popup
{
    public partial class uc_AddNewUserToDataset : System.Web.UI.UserControl
    {

        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion} 

        protected void Page_Load(object sender, EventArgs e)
        {
            //  DDL_Centers.Attributes["style"] = "visibility: hidden;";
            if (!IsPostBack)
            {
                ListItem li = new ListItem();
                li.Text = "All Centers";
                li.Value = "-1";
                DDL_Centers.Items.Add(li);
                DDL_Centers.SelectedIndex = 0;


            }


        }

        protected void btn_Insert_Click(object sender, EventArgs e)
        {

            string SelectedDataset = DDL_Centers.SelectedValue.ToString();

            if (SelectedDataset == "-1")
            {
                RL_feedback.Text = "Please select a Center";
            }
            else if (RLB_User.Items.Count.Equals(0))
            {
                RL_feedback.Text = "Please select a User";
            }
            else
            {
                List<FSObject> TGList = new List<FSObject>();

                foreach (RadListBoxItem item in RLB_User.Items)
                {
                    string UserID = item.Value.ToString();
                    TGList.Add(new FSObject(Session["DatasetID_User"].ToString(), UserID, Session["WiNGSMasterID"].ToString()));
                }
                ThreadAddFs tTG = new ThreadAddFs(TGList);
                Thread tTGrunner = new Thread(new ThreadStart(tTG.ThreadProc));
                tTGrunner.Start();
                tTGrunner.Join();
                RL_feedback.Text = "Inserted";
                ScriptManager.RegisterStartupScript(this, GetType(), "close", "CloseModal();", true);
            }
        }


        public struct FSObject
        {
            public string DatasetID;
            public string UserID;
            public string CreatorID;

            public FSObject(string DatasetID, string UserID, string CreatorID)
            {
                this.DatasetID = DatasetID;
                this.UserID = UserID;
                this.CreatorID = CreatorID;

            }
        }

        public class ThreadAddFs
        {
            private List<FSObject> T_TGList = new List<FSObject>();
            public ThreadAddFs(List<FSObject> TGList)
            {
                for (int i = 0; i <= TGList.Count - 1; i++)
                {
                    T_TGList.Add(new FSObject(TGList[i].DatasetID, TGList[i].UserID, TGList[i].CreatorID));
                }
            }

            public void ThreadProc()
            {
                DataTable TG_table = new DataTable();
                TG_table.Columns.Add("DatasetID", typeof(Int32));
                TG_table.Columns.Add("UserID", typeof(Int32));
                TG_table.Columns.Add("CreatorID", typeof(Int32));

                for (int i = 0; i <= T_TGList.Count - 1; i++)
                {
                    TG_table.Rows.Add(T_TGList[i].DatasetID, T_TGList[i].UserID, T_TGList[i].CreatorID);
                }
                using (SqlConnection Conn = new SqlConnection(CnnStr))
                {
                    Conn.Open();
                    using (SqlBulkCopy s = new SqlBulkCopy(Conn))
                    {
                        s.DestinationTableName = "Tbl_Dataset_Users";
                        s.WriteToServer(TG_table);
                        s.Close();
                    }
                    Conn.Close();
                }
            }
        }

    }
}