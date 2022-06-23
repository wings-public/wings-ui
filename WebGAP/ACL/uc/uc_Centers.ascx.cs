using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.ACL.uc
{
    public partial class uc_Centers : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RG_Centers_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
           
                if (e.Item is GridDataItem)
                {
                    GridDataItem item = (GridDataItem)e.Item;
                    if (item.OwnerTableView.Name == "Master")
                    {
                        HiddenField hdn = (HiddenField)item.FindControl("hdn_CenStat");
                        int stat = Convert.ToInt32(hdn.Value.ToString());
                        ImageButton img = (ImageButton)item.FindControl("CenterStatusbtn");
                        switch (stat)
                        {
                            case 0:
                                img.ImageUrl = "/img/icon/icon_offline.png";
                                img.ToolTip = "Offline";
                                break;
                            case 1:
                                img.ImageUrl = "/img/icon/icon_online.png";
                             img.ToolTip = "Online";
                                break;
                            default:
                                img.ImageUrl = "/img/icon/icon_unknown.ico";
                                img.ToolTip = "UnKnown";
                                break;
                        }
                                          


                    }
 
            }
        }

        protected void RG_Centers_ItemCommand(object sender, GridCommandEventArgs e)
        {
            


            if (e.CommandName == RadGrid.InitInsertCommandName) //"Add new" button clicked
            {
                GridEditCommandColumn editColumn = (GridEditCommandColumn)RG_Centers.MasterTableView.GetColumn("EditCommandColumn");
                editColumn.Visible = false;
                System.Collections.Specialized.ListDictionary newValues = new System.Collections.Specialized.ListDictionary();
                newValues["CenterStatus"] = 0;
                e.Item.OwnerTableView.InsertItem(newValues);
            }
            else if (e.CommandName == RadGrid.RebindGridCommandName && e.Item.OwnerTableView.IsItemInserted)
            {
                e.Canceled = true;
            }
            else
            {
                GridEditCommandColumn editColumn = (GridEditCommandColumn)RG_Centers.MasterTableView.GetColumn("EditCommandColumn");
                if (!editColumn.Visible)
                    editColumn.Visible = true;
            }



        }

        private String getItemName(string tableName)
        {
            switch (tableName)
            {
                case ("Master"):
                    {
                        return "Center";
                    }
               

                default: return "";
            }
        }

        private void DisplayMessage(string text)
        {
            RG_Centers.Controls.Add(new LiteralControl(string.Format("<span style='color:red'>{0}</span>", text)));
        }


        protected void RG_Centers_ItemInserted(object sender, GridInsertedEventArgs e)
        {
            string item = getItemName(e.Item.OwnerTableView.Name);
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                DisplayMessage(item + " cannot be inserted. Reason: " + e.Exception.Message);
            }
            else
            {
                DisplayMessage(item + " inserted");
            }
        }

        private void SetMessage(string message)
        {
            gridMessage = message;
        }

        private string gridMessage = null;

        protected void RG_Centers_PreRender(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(gridMessage))
            {
                DisplayMessage(gridMessage);
            }
        }

        protected void RG_Centers_InsertCommand(object sender, GridCommandEventArgs e)
        {
            




        }


        private String getFieldName(string tableName)
        {
            switch (tableName)
            {
                case ("Master"):
                    {
                        return "CenterID";
                    }
                default: return "";
            }
        }

        protected void RG_Centers_ItemDeleted(object sender, GridDeletedEventArgs e)
        {
            string item = getItemName(e.Item.OwnerTableView.Name);
            string field = getFieldName(e.Item.OwnerTableView.Name);
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                DisplayMessage(item + " " + e.Item[field].Text + " cannot be deleted. Reason: " + e.Exception.Message);
            }
            else
            {
                DisplayMessage(item + " " + e.Item[field].Text + " deleted");
            }
        }

        protected void RG_Centers_ItemUpdated(object sender, GridUpdatedEventArgs e)
        {
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
                DisplayMessage(item + " " + e.Item[field].Text + " updated");
            }
        }

        protected void RG_Centers_FilterCheckListItemsRequested(object sender, GridFilterCheckListItemsRequestedEventArgs e)
        {
            string DataField = (e.Column as IGridDataColumn).GetActiveDataField();

            e.ListBox.DataSource = GetDataTable(DataField);
            e.ListBox.DataKeyField = DataField;
            e.ListBox.DataTextField = DataField;
            e.ListBox.DataValueField = DataField;
            e.ListBox.DataBind();
        }

        public DataTable GetDataTable(string field)
        {
            string query = string.Format("SELECT DISTINCT {0} FROM Tbl_Center", field);

            
            SqlConnection conn = new SqlConnection(CnnStr);
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = new SqlCommand(query, conn);

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