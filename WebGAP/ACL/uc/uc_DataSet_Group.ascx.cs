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
    public partial class uc_DataSet_Group : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion} 

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Center_Datasource();
                PI_Datasource();
                Session["selectedItemRight_DSgroup"] = 0;
                Session["selectedItemLeft_DSgroup"] = 0;
            }
        }

        protected void Center_Datasource()
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

        protected void PI_Datasource()
        {

            SqlCommand Cmd = new SqlCommand("Sp_PI_Sel", new SqlConnection(CnnStr));
            Cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = Cmd.Parameters;
            SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@InputType", SqlDbType.Int));

            SqlParCol["@CenterID"].Value = DDL_Centers.SelectedValue;
            SqlParCol["@UserID"].Value = Session["WiNGSMasterId"].ToString();
            SqlParCol["@InputType"].Value = -1;

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

            DDL_PIs.Items.Clear();
            // Clear the default Item that has been re-created from ViewState at this point.
            if (Session["WiNGSUserType"].ToString() == "0" || Session["WiNGSUserType"].ToString() == "1")
            {
                RadComboBoxItem item = new RadComboBoxItem();
                item.Text = "All PIs";
                item.Value = "-1";
                item.Attributes.Add("PIID", item.Text);
                DDL_PIs.Items.Add(item);
                item.DataBind();
            }


            foreach (DataRow row in Data.Rows)
            {
                RadComboBoxItem item = new RadComboBoxItem();
                item.Text = row["PIName"].ToString();
                item.Value = row["PIID"].ToString();
                item.Attributes.Add("PIID", row["PIName"].ToString());
                DDL_PIs.Items.Add(item);
                item.DataBind();
            }


            if (DDL_PIs.Items.Count.Equals(1))
            {
                DDL_PIs.Enabled = false;
            }
            if (!IsPostBack)
            {
                DDL_PIs.SelectedIndex = 0;
            }

        }


        protected void RG_GD_Group_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("RowClick"))
            {
                GridDataItem item = (GridDataItem)e.Item;
                Session["selectedItemLeft_DSgroup"] = item.ItemIndex;


            }
            if (e.CommandName.Equals("ListDataset"))
            {
                GridDataItem item = (GridDataItem)e.Item;
                string GroupID = item.GetDataKeyValue("GroupID").ToString();
                Session["GroupID_Dataset"] = GroupID;
                Session["CenterID_GroupDataset"] = DDL_Centers.SelectedValue.ToString();
                Session["PIID_GroupDataset"] = DDL_PIs.SelectedValue.ToString();

                string message = "openWin();";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
            }

            if (e.CommandName.Equals("deleteAllDatasets"))
            {
                    GridDataItem item = (GridDataItem)e.Item;
                    SqlConnection conn = new SqlConnection(CnnStr);
                    SqlCommand cmd = new SqlCommand("Sp_DG_Delete_DataSet_From_Group", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = cmd.Parameters;

                    SqlParCol.Add(new SqlParameter("@Type", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@DatasetID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@GroupID", SqlDbType.Int));

                    SqlParCol["@Type"].Value = 1;
                    SqlParCol["@DatasetID"].Value = 0;
                    SqlParCol["@GroupID"].Value = item.GetDataKeyValue("GroupID").ToString();


                    try
                    {
                        cmd.Connection.Open();
                        cmd.ExecuteNonQuery();
                        cmd.Connection.Close();
                    }
                    catch (Exception ex)
                    {
                        Label lblError = new Label();
                        lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                        lblError.ForeColor = System.Drawing.Color.Red;

                    }

                RG_GD_Group.Rebind();
                RG_GD_Dataset.Rebind();



            }
        }

        protected void RG_DG_Dataset_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("RowClick"))
            {
                GridDataItem item = (GridDataItem)e.Item;
                Session["selectedItemRight_DSgroup"] = item.ItemIndex;
            }
           
        }

        protected void RG_GD_Dataset_ItemCommand(object sender, GridCommandEventArgs e)
        {


            if (e.CommandName.Equals("deleteSingleDataset"))
            {
                GridDataItem item = (GridDataItem)e.Item;

                int selectedGroup = RG_GD_Group.SelectedItems.Count;
                string DatasetID = item.GetDataKeyValue("DatasetID").ToString();

                if (selectedGroup == 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Please select a group first!</b><br />');", true);
                }
               

                if (selectedGroup != 0)
                {
                  
                    SqlConnection conn = new SqlConnection(CnnStr);

                    SqlCommand cmd = new SqlCommand("Sp_DG_Delete_Dataset_From_Group", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = cmd.Parameters;

                    SqlParCol.Add(new SqlParameter("@Type", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@DatasetID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@GroupID", SqlDbType.Int));

                    SqlParCol["@Type"].Value = 0;
                    SqlParCol["@DatasetID"].Value = DatasetID;
                    SqlParCol["@GroupID"].Value = RG_GD_Group.SelectedValue;

                    try
                    {
                        cmd.Connection.Open();
                        cmd.ExecuteNonQuery();
                        cmd.Connection.Close();
                    }
                    catch (Exception ex)
                    {
                        Label lblError = new Label();
                        lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                        lblError.ForeColor = System.Drawing.Color.Red;

                    }

                    RG_GD_Group.Rebind();
                    RG_GD_Dataset.Rebind();
                }
            }
        }

        protected void RG_GD_Dataset_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is Telerik.Web.UI.GridDataItem)
            {
                Telerik.Web.UI.GridDataItem item = (Telerik.Web.UI.GridDataItem)e.Item;

                HiddenField hdnsp = (HiddenField)item.FindControl("hdn_Type");
                string sp = hdnsp.Value.ToString();
                ImageButton imgsp = (ImageButton)item.FindControl("Typebtn");
                switch (sp)
                {
                    case "0":
                        imgsp.ImageUrl = "/img/icon/icon_Public.png";
                        imgsp.ToolTip = "Public";
                        break;
                    case "1":
                        imgsp.ImageUrl = "/img/icon/icon_Private.png";
                        imgsp.ToolTip = "Private";
                        break;
                    case "2":
                        imgsp.ImageUrl = "/img/icon/icon_PrivatetoCenter.png";
                        imgsp.ToolTip = "Private to center";
                        break;
                    case "3":
                        imgsp.ImageUrl = "/img/icon/icon_Requested.png";
                        imgsp.ToolTip = "Requested by user";
                        break;
                    default:

                        break;
                }

                HiddenField hdnsp_Status = (HiddenField)item.FindControl("hdn_Status");
                string sp_Status = hdnsp_Status.Value.ToString();
                ImageButton imgStatus = (ImageButton)item.FindControl("Statusbtn");
                switch (sp_Status)
                {
                    case "0":
                        imgStatus.ImageUrl = "/img/icon/icon_inactive.png";
                        imgStatus.ToolTip = "Inactive";
                        break;
                    case "1":
                        imgStatus.ImageUrl = "/img/icon/icon_active.png";
                        imgStatus.ToolTip = "Active";
                        break;
                    default:

                        break;

                }
            }
        }

      
        protected void RG_DG_Group_ItemDataBound(object sender, GridItemEventArgs e)
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

        protected void DDL_Centers_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            PI_Datasource();
        }

        protected void DDL_PIs_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            Session["selectedItemRight_DSgroup"] = 0;
            Session["selectedItemLeft_DSgroup"] = 0;
            RG_GD_Group.Rebind();
            RG_GD_Dataset.Rebind();
            RG_DG_Dataset.Rebind();
            RG_DG_Group.Rebind();
        }

        protected void RG_DG_Group_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("DeleteDataset"))
            {
                GridDataItem item = (GridDataItem)e.Item;

                string GroupID = item.GetDataKeyValue("GroupID").ToString();
                int selectedDataset = RG_DG_Dataset.SelectedItems.Count;

                if (selectedDataset == 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"alert('Please select a dataset!');", true);
                }

                if (selectedDataset != 0)
                {

                    SqlConnection conn = new SqlConnection(CnnStr);

                    SqlCommand cmd = new SqlCommand("Sp_DG_Delete_Dataset_From_Group", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = cmd.Parameters;

                    SqlParCol.Add(new SqlParameter("@Type", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@DatasetID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@GroupID", SqlDbType.Int));

                    SqlParCol["@Type"].Value = 0;
                    SqlParCol["@DatasetID"].Value = RG_DG_Dataset.SelectedValue;
                    SqlParCol["@GroupID"].Value = GroupID;

                    try
                    {
                        cmd.Connection.Open();
                        cmd.ExecuteNonQuery();
                        cmd.Connection.Close();
                    }
                    catch (Exception ex)
                    {
                        Label lblError = new Label();
                        lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                        lblError.ForeColor = System.Drawing.Color.Red;

                    }
                }


                RG_DG_Group.Rebind();
                RG_GD_Dataset.Rebind();
            }
        }

        protected void RG_GD_Group_PreRender(object sender, EventArgs e)
        {
            if (Session["selectedItemLeft_DSgroup"] != null && (RG_GD_Group.MasterTableView.Items.Count > 0))
            {
                int index = Convert.ToInt32(Session["selectedItemLeft_DSgroup"].ToString());
                RG_GD_Group.MasterTableView.Items[index].Selected = true;
                Session["selectedItemLeft_DSgroup"] = index;
                RG_GD_Dataset.Rebind();


            }
        }

        protected void RG_DG_Dataset_PreRender(object sender, EventArgs e)
        {
            if (Session["selectedItemRight_DSgroup"] != null && (RG_DG_Dataset.MasterTableView.Items.Count > 0))
            {
                int index = Convert.ToInt32(Session["selectedItemRight_DSgroup"].ToString());
                RG_DG_Dataset.MasterTableView.Items[index].Selected = true;
                Session["selectedItemRight_DSgroup"] = index;
                RG_DG_Group.Rebind();


            }
        }
    }
}