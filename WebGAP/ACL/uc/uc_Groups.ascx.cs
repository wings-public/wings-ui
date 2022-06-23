using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.ACL.uc
{
    public partial class uc_Groups : System.Web.UI.UserControl
    {

        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string UserID = Session["WiNGSMasterId"].ToString();

                if (!IsPostBack)
                {

                    SqlCommand Cmd = new SqlCommand("Sp_Center_Sel", new SqlConnection(CnnStr));
                    Cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = Cmd.Parameters;
                    SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));

                    SqlParCol["@UserID"].Value = Session["WiNGSMasterId"].ToString();


                    SqlConnection conn = new SqlConnection(CnnStr);
                    SqlDataAdapter adapter = new SqlDataAdapter();
                    SqlDataAdptrCmd.SelectCommand = Cmd;


                    DataTable Data = new DataTable();

                    Cmd.Connection.Open();
                    try
                    {
                        SqlDataAdptrCmd.Fill(Data);
                    }
                    finally
                    {
                        Cmd.Connection.Close();
                    }

                    DDL_Centers.Items.Clear();
                    // Clear the default Item that has been re-created from ViewState at this point.
                    if (Session["WiNGSUserType"].ToString() == "0")
                    {
                        RadComboBoxItem item = new RadComboBoxItem();
                        item.Text = "All Centers";
                        item.Value = "-1";
                        item.Attributes.Add("CenterID", item.Text);
                        DDL_Centers.Items.Add(item);
                        item.DataBind();
                    }


                    foreach (DataRow row in Data.Rows)
                    {
                        RadComboBoxItem item = new RadComboBoxItem();
                        item.Text = row["CenterDesc"].ToString();
                        item.Value = row["CenterID"].ToString();
                        item.Attributes.Add("CenterID", row["CenterDesc"].ToString());
                        DDL_Centers.Items.Add(item);

                        item.DataBind();
                    }


                    if (DDL_Centers.Items.Count.Equals(1))
                    {
                        DDL_Centers.Enabled = false;

                    }

                    DDL_Centers.SelectedIndex = 0;

                }
            }
            }

      
        protected void RG_Groups_ItemUpdated(object sender, Telerik.Web.UI.GridUpdatedEventArgs e)
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

        private String getItemName(string tableName)
{
    switch (tableName)
    {
        case ("Master"):
            {
                return "RG_Groups";
            }


        default: return "";
    }
}

       private void DisplayMessage(string text)
{
            RG_Groups.Controls.Add(new LiteralControl(string.Format("<span style='color:red'>{0}</span>", text)));
}
       private String getFieldName(string tableName)
{
    switch (tableName)
    {
        case ("Master"):
            {
                return "GroupID";
            }
        default: return "";
    }
}


        protected void RG_Groups_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Edit") || e.CommandName.Equals("InitInsert"))
            {
                if (DDL_Centers.SelectedValue.Equals("-1") )
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('Please select a center first!');", true);
                    e.Canceled = true;
                }

            }
          

        }

        protected void RG_Groups_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                Telerik.Web.UI.GridDataItem item = (GridDataItem)e.Item;
                HiddenField hdnsp_Status = (HiddenField)item.FindControl("hdn_Status");
                string sp_Status = hdnsp_Status.Value.ToString();
                ImageButton imgStatus = (ImageButton)item.FindControl("Statusbtn");
                switch (sp_Status)
                {
                    case "0":
                        imgStatus.ImageUrl = "/img/icon/icon_inactive.png";
                        imgStatus.ToolTip = "Inactive";
                        imgStatus.Width = 25;
                        break;
                    case "1":
                        imgStatus.ImageUrl = "/img/icon/icon_active.png";
                        imgStatus.ToolTip = "Active";
                        imgStatus.Width = 25;
                        break;
                    default:
                        break;

                }
            }
        }
    }
    
    }
