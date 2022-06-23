using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.ACL.Popup
{
    public partial class uc_AddNewUserForPI : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion} 

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Insert_Click(object sender, EventArgs e)
        {
           
                if (RLB_User.Items.Count.Equals(0))
                {
                    RL_feedback.Text = "Please select a User";
                }
                else
                {
                    List<FSObject> TGList = new List<FSObject>();

                    foreach (RadListBoxItem item in RLB_User.Items)
                    {
                        string PowerUserID = item.Value.ToString();
                        TGList.Add(new FSObject(Session["PU_PI"].ToString(), PowerUserID));
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
            public string PIID;
            public string PowerUserID;



            public FSObject(string PIID, string PowerUserID)
            {
                this.PIID = PIID;
                this.PowerUserID = PowerUserID;


            }
        }

        public class ThreadAddFs
        {
            private List<FSObject> T_TGList = new List<FSObject>();
            public ThreadAddFs(List<FSObject> TGList)
            {
                for (int i = 0; i <= TGList.Count - 1; i++)
                {
                    T_TGList.Add(new FSObject(TGList[i].PIID, TGList[i].PowerUserID));
                }
            }

            public void ThreadProc()
            {
                DataTable TG_table = new DataTable();
                TG_table.Columns.Add("PIID", typeof(Int32));
                TG_table.Columns.Add("UserID", typeof(Int32));

                for (int i = 0; i <= T_TGList.Count - 1; i++)
                {
                    TG_table.Rows.Add(T_TGList[i].PowerUserID , T_TGList[i].PIID);
                }
                using (SqlConnection Conn = new SqlConnection(CnnStr))
                {
                    Conn.Open();
                    using (SqlBulkCopy s = new SqlBulkCopy(Conn))
                    {
                        s.DestinationTableName = "Tbl_User_PI";
                        s.WriteToServer(TG_table);
                        s.Close();
                    }
                    Conn.Close();
                }
            }
        }
    }
  
}