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
    public partial class uc_DataSet_Samples : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Center_Datasource();
                PI_Datasource();
                Session["selectedItemRight_DS"] = 0;
                Session["selectedItemLeft_DS"] = 0;

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

        
   

        protected void RG_DS_Dataset_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

            if (e.CommandName.Equals("RowClick"))
            {
                GridDataItem item = (GridDataItem)e.Item;
                Session["selectedItemLeft_DS"] = item.ItemIndex;
              

            }
                if (e.CommandName.Equals("listsample"))
            {
                GridDataItem item = (GridDataItem)e.Item;
                string DatasetID = item.GetDataKeyValue("DatasetID").ToString();
                Session["DatasetID_Sample"] = DatasetID;
                Session["CenterID_DatasetSample"] = DDL_Centers.SelectedValue.ToString();
                Session["PIID_DatasetSample"] = DDL_PIs.SelectedValue.ToString();

                string message = "openWin();";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
            }

             if (e.CommandName.Equals("deleteAllSamples"))
            {
                int Count_SelectedRow = RG_DS_Dataset.SelectedItems.Count;


                if (Count_SelectedRow == 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Please select a dataset first!</b><br />');", true);
                }


                if (Count_SelectedRow != 0)
                {
                    GridDataItem item = (GridDataItem)e.Item;

                    SqlConnection conn = new SqlConnection(CnnStr);

                    SqlCommand cmd = new SqlCommand("Sp_DS_Del_Sample_From_Dataset", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = cmd.Parameters;

                    SqlParCol.Add(new SqlParameter("@Type", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@DatasetID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@SampleID", SqlDbType.Int));

                    SqlParCol["@Type"].Value = 1;
                    SqlParCol["@DatasetID"].Value = item.GetDataKeyValue("DatasetID").ToString();
                    SqlParCol["@SampleID"].Value = 0;



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

            }
        }

      
        protected void RG_DS_Samples_ItemCommand(object sender, GridCommandEventArgs e)
        {
           
            if (e.CommandName.Equals("DeleteSingleSample"))
            {
                GridDataItem item = (GridDataItem)e.Item;

               string SampleID = item.GetDataKeyValue("SampleID").ToString();

                int SelectedDatasetcount = RG_DS_Dataset.SelectedItems.Count;

                if (SelectedDatasetcount == 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Please select a dataset first!</b><br />');", true);
                }

                if (SelectedDatasetcount != 0 )
                {
                    
                    SqlConnection conn = new SqlConnection(CnnStr);

                    SqlCommand cmd = new SqlCommand("Sp_DS_Del_Sample_From_Dataset", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = cmd.Parameters;

                    SqlParCol.Add(new SqlParameter("@Type", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@DatasetID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@SampleID", SqlDbType.BigInt));

                    SqlParCol["@Type"].Value =0;
                    SqlParCol["@DatasetID"].Value = RG_DS_Dataset.SelectedValue.ToString();
                    SqlParCol["@SampleID"].Value = SampleID;

                    try
                    {
                        cmd.Connection.Open();
                        cmd.ExecuteNonQuery();
                        cmd.Connection.Close();
                        RG_DS_Samples.Rebind();
                        RG_SD_Dataset.Rebind();
                    }
                    catch (Exception ex)
                    {
                        Label lblError = new Label();
                        lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                        lblError.ForeColor = System.Drawing.Color.Red;

                    }

                }
            }
           
        }

        protected void RG_SD_Dataset_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("DeleteSingleSample"))
            {
                GridDataItem item = (GridDataItem)e.Item;

                int SelectedSampleCount = RG_SD_Samples.SelectedItems.Count;
               string DatasetID = item.GetDataKeyValue("DataSetID").ToString();

                if (SelectedSampleCount == 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Please select a sample first!</b><br />');", true);
                }
               

                if ( SelectedSampleCount != 0)
                {
                   
                    SqlConnection conn = new SqlConnection(CnnStr);

                    SqlCommand cmd = new SqlCommand("Sp_DS_Del_Sample_From_Dataset", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = cmd.Parameters;

                    SqlParCol.Add(new SqlParameter("@Type", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@DatasetID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@SampleID", SqlDbType.BigInt));

                    SqlParCol["@Type"].Value = 0;
                    SqlParCol["@DatasetID"].Value = DatasetID;
                    SqlParCol["@SampleID"].Value = RG_SD_Samples.SelectedValue;

                    try
                    {
                        cmd.Connection.Open();
                        cmd.ExecuteNonQuery();
                        cmd.Connection.Close();
                        RG_SD_Dataset.Rebind();
                        RG_DS_Samples.Rebind();
                    }
                    catch (Exception ex)
                    {
                        Label lblError = new Label();
                        lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                        lblError.ForeColor = System.Drawing.Color.Red;

                    }

                }
            }
        }

        protected void DDL_Centers_SelectedIndexChanged(object sender, EventArgs e)
        {
            PI_Datasource();
   
           
              
         
        }


        protected void RG_SD_Dataset_ItemDataBound(object sender, GridItemEventArgs e)
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

                HiddenField hdnDSdefault = (HiddenField)item.FindControl("hdn_DefaultDataset");
                string ds = hdnDSdefault.Value.ToString();
                if (ds == "1")
                {
                    ImageButton btn_delete = (ImageButton)item.FindControl("delete");
                    btn_delete.Visible = false;


                }
            }

           
        }

        protected void RG_DS_Dataset_ItemDataBound(object sender, GridItemEventArgs e)
        {

            if (e.Item is Telerik.Web.UI.GridDataItem)
            {
                Telerik.Web.UI.GridDataItem item = (Telerik.Web.UI.GridDataItem)e.Item;

                //RG_DS_Dataset.SelectedItems[0].Style.Add("class", "rgSelectedRow");
              //  RG_DS_Dataset.MasterTableView.Items[index].Style.Add("class", "rgSelectedRow");


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

                HiddenField hdnDSdefault = (HiddenField)item.FindControl("hdn_DefaultDataset");
                string ds = hdnDSdefault.Value.ToString();
                if(ds == "1")
                { 
                    ImageButton btn_delete = (ImageButton)item.FindControl("delete");
                    btn_delete.Visible = false;
                    ImageButton btn_add = (ImageButton)item.FindControl("newreq");
                    btn_add.Visible = false;
                    
                }

            }
         }

        protected void RG_DS_Samples_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is Telerik.Web.UI.GridDataItem)
            {
                Telerik.Web.UI.GridDataItem item = (Telerik.Web.UI.GridDataItem)e.Item;
                HiddenField hdnDSdefault = (HiddenField)item.FindControl("hdn_DefaultDataset");
                string ds = hdnDSdefault.Value.ToString();
                if (ds == "1")
                {
                    ImageButton btn_delete = (ImageButton)item.FindControl("delete");
                    btn_delete.Visible = false;
                  

                }
            }
        }

        protected void RG_DS_Dataset_PreRender(object sender, EventArgs e)
        {
            
            if (Session["selectedItemLeft_DS"] != null && (RG_DS_Dataset.MasterTableView.Items.Count > 0))
            {
                int index = Convert.ToInt32( Session["selectedItemLeft_DS"].ToString());
                RG_DS_Dataset.MasterTableView.Items[index].Selected = true;
                Session["selectedItemLeft_DS"] = index;
                RG_DS_Samples.Rebind();
                //  RG_DS_Dataset.MasterTableView.Items[0].Style.Add("class", "rgSelectedRow");
                // RG_DS_Dataset.MasterTableView.Items[0].Attributes.CssStyle.Add("background-color", "red");


            }

        }

        
        protected void RG_SD_Samples_PreRender(object sender, EventArgs e)
        {
            if (Session["selectedItemRight_DS"] != null && (RG_SD_Samples.MasterTableView.Items.Count > 0))
            {
                int index = Convert.ToInt32(Session["selectedItemRight_DS"].ToString());
                RG_SD_Samples.MasterTableView.Items[index].Selected = true;
                RG_SD_Dataset.Rebind();
            }
        }

        protected void RG_SD_Samples_ItemCommand(object sender, GridCommandEventArgs e)
        {

            if (e.CommandName.Equals("RowClick"))
            {
                GridDataItem item = (GridDataItem)e.Item;
                Session["selectedItemRight_DS"] = item.ItemIndex;
            }
        }

        protected void DDL_PIs_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            Session["selectedItemRight_DS"] = 0;
            Session["selectedItemLeft_DS"] = 0;
            RG_DS_Dataset.Rebind();
            RG_DS_Samples.Rebind();
            RG_SD_Samples.Rebind();
            RG_SD_Dataset.Rebind();
        }
    }
}



//HiddenField hdnDSdefault = (HiddenField)item.FindControl("hdn_DefaultDataset");
//string ds = hdnDSdefault.Value.ToString();
//                if(ds == "1")
//                { 
//                    ImageButton btn_delete = (ImageButton)item.FindControl("delete");
//btn_delete.Visible = false;
//                    ImageButton btn_add = (ImageButton)item.FindControl("newreq");
//btn_add.Visible = false;
                    
//                }