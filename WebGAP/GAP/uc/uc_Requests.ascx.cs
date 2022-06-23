using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.GAP.uc
{
    public partial class uc_Requests : System.Web.UI.UserControl
    {

        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void RG_Requests_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is Telerik.Web.UI.GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                if (item.OwnerTableView.Name == "Master")
                {
                    Button btn_res = (Button)item.FindControl("btn_Results");

                    //////////////////////////////
                    HiddenField hdnstat = (HiddenField)item.FindControl("hdn_RStatus");
                    int stat = Convert.ToInt32(hdnstat.Value.ToString());
                    ImageButton imgstat = (ImageButton)item.FindControl("RStatusBtn");

              
                    switch (stat)
                    {
                        
                        case 0:
                            imgstat.ImageUrl = "../../img/icon/new.png";
                            imgstat.ToolTip = "New";
                            break;

                        case 1:
                            imgstat.ImageUrl = "../../img/icon/api.png";
                            imgstat.ToolTip = "Send to centers";
                            break;
                        case 2:
                            imgstat.ImageUrl = "../../img/icon/schedule.png";
                            imgstat.ToolTip = "Waiting";
                            break;
                        case 3:
                            imgstat.ImageUrl = "../../img/icon/syncing.png";
                            imgstat.ToolTip = "Syncing results";
                            break;
                        case 4:
                            imgstat.ImageUrl = "../../img/icon/complete.png";
                            imgstat.ToolTip = "Completed";

                            break;
                     
                        default:
                            imgstat.ImageUrl = "../../img/icon/unknown.png";
                            imgstat.ToolTip = "UnKnown";
                            break;
                    }

                    if ( stat.Equals(4))
                    {
                        btn_res.Enabled = true;
                    }
                    else
                    {
                        btn_res.Enabled = false;
                    }




                }
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            RG_Requests.Rebind();
          
        }

        protected void RG_Requests_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "Navigate")
            {

            
                GridDataItem item = (GridDataItem)e.Item;
                string DSID = item.GetDataKeyValue("RequestID").ToString();
              
                string ReqT = item.GetDataKeyValue("RequestTypeID").ToString();

                Session["GapReqId"] = DSID;
             
                Session["ReqType"] = ReqT;

                Response.Redirect(String.Format("Results.aspx"));
            }

         

        }

        protected void RG_Requests_DetailTableDataBind(object sender, GridDetailTableDataBindEventArgs e)
        {

            GridDataItem dataItem = (GridDataItem)e.DetailTableView.ParentItem;
            switch (e.DetailTableView.Name)
            {
                case "Centers":
                    {
                        string RequestID = dataItem.GetDataKeyValue("RequestID").ToString();
                        e.DetailTableView.DataSource = GetDataTable("SELECT * FROM Viw_GAP_Request_Center_Status WHERE RequestID = @RequestID", "RequestID", RequestID);
                        break;
                    }
            
            }
        }

        public DataTable GetDataTable(string query, string selectParameter = "", string parameterValue = "")
        {
            SqlConnection conn = new SqlConnection(CnnStr);
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlCommand command = new SqlCommand(query, conn);

            if (!string.IsNullOrEmpty(selectParameter))
            {
                command.Parameters.Add(new SqlParameter(selectParameter, parameterValue));
            }

            adapter.SelectCommand = command;

            DataTable myDataTable = new DataTable();

            conn.Open();
            try
            {
                adapter.Fill(myDataTable);
            }
            finally
            {
                conn.Close();
            }

            return myDataTable;
        }

    }
}