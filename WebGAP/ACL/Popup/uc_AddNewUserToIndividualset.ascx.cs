﻿using System;
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
    public partial class uc_AddNewUserToIndividualset : System.Web.UI.UserControl
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
                    string UserID = item.Value.ToString();
                    TGList.Add(new FSObject(Session["IndividualsetID_User"].ToString(), UserID, Session["WiNGSMasterID"].ToString()));
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
            public string IndividualsetID;
            public string UserID;
            public string CreatorID;

            public FSObject(string IndividualsetID, string UserID, string CreatorID)
            {
                this.IndividualsetID = IndividualsetID;
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
                    T_TGList.Add(new FSObject(TGList[i].IndividualsetID, TGList[i].UserID, TGList[i].CreatorID));
                }
            }

            public void ThreadProc()
            {
                DataTable TG_table = new DataTable();
                TG_table.Columns.Add("IndividualsetID", typeof(Int32));
                TG_table.Columns.Add("UserID", typeof(Int32));
                TG_table.Columns.Add("CreatorID", typeof(Int32));

                for (int i = 0; i <= T_TGList.Count - 1; i++)
                {
                    TG_table.Rows.Add(T_TGList[i].IndividualsetID, T_TGList[i].UserID, T_TGList[i].CreatorID);
                }
                using (SqlConnection Conn = new SqlConnection(CnnStr))
                {
                    Conn.Open();
                    using (SqlBulkCopy s = new SqlBulkCopy(Conn))
                    {
                        s.DestinationTableName = "Tbl_Individualset_Users";
                        s.WriteToServer(TG_table);
                        s.Close();
                    }
                    Conn.Close();
                }
            }
        }
    }
}