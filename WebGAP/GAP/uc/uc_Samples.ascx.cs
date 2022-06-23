using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.GAP.uc
{
    public partial class uc_Samples : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}
        protected Int64 filterSampleEditmode
        {
            get
            {
                Int64 value = (Int64)ViewState["filterSampleEditmode"];
                return -1 != value ? (Int64)value : -1;
            }
            set
            {
                ViewState["filterSampleEditmode"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                filterSampleEditmode = -1;
            lbl_CenterPI.Text = Session["Current_Center"].ToString() + ", " + Session["Current_PI"].ToString();

        }

        protected void RG_Samples_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.Item is GridDataItem)
            {

                GridDataItem item = (GridDataItem)e.Item;

                if (e.CommandName == "GoToNewFile")
                {
 
                    Session["SampleIDFileDetail"] = item.GetDataKeyValue("SampleID");
                    Session["HostID"] = item.GetDataKeyValue("HostID");
                    Session["SampleLocalIDFileDetail"] = item["LocalID"].Text;
                    Response.Redirect(String.Format("InputFile.aspx"));
               

                }
            }
            if (e.CommandName.Equals("PerformInsert") || e.CommandName.Equals("Update"))
            {


                    GridEditableItem item = (GridEditableItem)e.Item;
                    RadComboBox seqlType = (RadComboBox)item.FindControl("DDL_SeqType");
                    RadDropDownList pt = (RadDropDownList)item.FindControl("DDL_PanelType");
                    if (seqlType.SelectedValue.Equals("3") && (pt.SelectedValue.Equals("-1") || pt.SelectedValue.Equals("")))
                    {
                    string mssg = "please sure you have selected a Panel Type!!";
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", "callAlert('" + mssg + "');", true);

                  //  ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>  please sure you have selected a Panel Type! </b><br />');", true);
                       e.Canceled = true;


                }


            }
            if (e.CommandName.Equals("Edit"))
            {
                hdn_searchSampleID.Value = filterSampleEditmode.ToString();
            }


        }


        private String getFieldName(string tableName)
        {
            switch (tableName)
            {
                case ("Master"):
                    {
                        return "SampleID";
                    }
                default: return "";
            }
        }
        protected void RG_Samples_ItemUpdated(object sender, GridUpdatedEventArgs e)
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
                // DisplayMessage(item + " " + e.Item[field].Text + " updated");
            }
        }
        private String getItemName(string tableName)
        {
            switch (tableName)
            {
                case ("Master"):
                    {
                        return "Sample";
                    }


                default: return "";
            }
        }

        private void DisplayMessage(string text)
        {
            RG_Samples.Controls.Add(new LiteralControl(string.Format("<span style='color:red'>{0}</span>", text)));
        }

        protected void RG_Samples_ItemDataBound(object sender, GridItemEventArgs e)
        {

            string Insertable = String.Empty;

            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;

                HiddenField hdUpD = (HiddenField)item.FindControl("hdn_Updatable");
                string spUpD = hdUpD.Value.ToString();
                Insertable = spUpD;
                switch (spUpD)
                {
                    case "0":
                        ImageButton Edit = (ImageButton)item["EditCommandColumn"].Controls[0];
                        Edit.Visible = false;
                      
                        ImageButton NewFile = (ImageButton)item.FindControl("GoToNewFile"); //hide the new file
                        NewFile.Visible = false;
                        break;
                }

              



                    HiddenField SampleSheetOrUI = (HiddenField)item.FindControl("hdn_SampleSheetOrUI");
                    string SampleSheetOrUI_value = SampleSheetOrUI.Value.ToString();
                //ImageButton img_SampleSheetOrUI = (ImageButton)item.FindControl("img_SampleSheetOrUI");
                Label SheetorUI = (Label)item.FindControl("lbl_SheetOrUI");


                    switch (SampleSheetOrUI_value)
                    {
                        case "0":
                        SheetorUI.Attributes.CssStyle.Add("background-color", "#f78f8f !important");
                        SheetorUI.Attributes.CssStyle.Add("padding", " 3px !important");
                        SheetorUI.Attributes.CssStyle.Add("margin", " 3px !important");
                        SheetorUI.Attributes.CssStyle.Add("cursor", "pointer");
                        SheetorUI.ToolTip = "Imported from Sample sheet";
                            break;
                        case "1":
                        SheetorUI.Attributes.CssStyle.Add("background-color", "#5E98C4  !important");
                        SheetorUI.Attributes.CssStyle.Add("padding", " 3px !important");
                        SheetorUI.Attributes.CssStyle.Add("margin", " 3px !important");
                        SheetorUI.Attributes.CssStyle.Add("cursor", "pointer");
                        SheetorUI.ToolTip = "Imported from WiNGS UI";
                            break;

                    }

            }



            if (e.Item is GridEditableItem && e.Item.IsInEditMode)
            {

                GridEditableItem edit = (GridEditableItem)e.Item;
                HiddenField Count = (HiddenField)edit.FindControl("hdn_count");

                if (e.Item is GridEditFormInsertItem)
                {
                    // insert mode keep it please. do not remove 
                }
                else
                {

                    if (!Count.Value.Equals("0"))
                    {
                        RadComboBox DDL_SeqType = (RadComboBox)edit.FindControl("DDL_SeqType");
                        DDL_SeqType.Enabled = false;

                        RadDropDownList DDL_Panel = (RadDropDownList)edit.FindControl("DDL_PanelType");
                        DDL_Panel.Enabled = false;
                    }


                    RadComboBox SeqType = (RadComboBox)edit.FindControl("DDL_SeqType");

                    if (SeqType.SelectedValue.Equals("1") || SeqType.SelectedValue.Equals("2"))
                    {
                        RadDropDownList DDL_Panel = (RadDropDownList)edit.FindControl("DDL_PanelType");
                        // DDL_Panel.Enabled = false;
                        DDL_Panel.Attributes.CssStyle.Add("pointer-events", "none");
                        DDL_Panel.Attributes.CssStyle.Add("opacity","0.7");
                        DDL_Panel.Attributes.CssStyle.Add("tabindex", "-1");
                    }


                }

            }

        }

        protected void DDL_PIs_DataBound(object sender, EventArgs e)
        {
            //if (!Session["WiNGSUserType"].ToString().Equals("2") && !Session["WiNGSUserType"].ToString().Equals("6"))
            //{
            //    DDL_PIs.Items.Insert(0, new ListItem("All PIs", "-1"));
            //}

        }

        protected void RG_Samples_ItemCreated(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridEditableItem && e.Item.IsInEditMode)
            {
                if (!(e.Item is GridEditFormInsertItem || e.Item is GridDataInsertItem))
                {
                    GridEditableItem item = (GridEditableItem)e.Item;
                    RadComboBox DDL = (RadComboBox)item.FindControl("DDL_DSID");
                    Label lbl = (Label)item.FindControl("lbl_DSID");
                    DDL.Visible = false;
                    lbl.Visible = false;

                    RadTextBox Local_ID = (RadTextBox)item.FindControl("Local_ID");
                    Local_ID.Enabled = false;

                    RadComboBox DDLH = (RadComboBox)item.FindControl("DDL_HostID");
                    Label lblH = (Label)item.FindControl("lbl_HID");
                    DDLH.Enabled = false;
                    lblH.Enabled = false;
                  

                }

            }
        }



        protected void RG_Samples_ItemInserted(object sender, GridInsertedEventArgs e)
        {

            string item = getItemName(e.Item.OwnerTableView.Name);
            string field = getFieldName(e.Item.OwnerTableView.Name);
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                DisplayMessage(item + " " + e.Item[field].Text + " cannot be updated. Reason: " + e.Exception.Message);
            }
            else
            {
            }
        }

        protected void DDL_DSID_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();

            SqlConnection cnn = new SqlConnection(CnnStr);
            SqlCommand cmd = new SqlCommand("Sp_DataSet_ForDefineSample_Sel", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlDataAdptrCmd.SelectCommand = cmd;
            SqlParCol = cmd.Parameters;

            SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@PIID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
            SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
            SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
            SqlParCol["@PIID"].Value = Session["Current_PIID"];
            cnn.Open();
            try
            {
                SqlDataAdptrCmd.Fill(dt);

            }
            finally
            {
                cnn.Close();
            }

            DropDownList theDropDown = sender as DropDownList;
            theDropDown.DataSource = dt;
            theDropDown.DataTextField = "DatasetName";
            theDropDown.DataValueField = "DatasetID";
            theDropDown.DataBind();
        }

      
        protected void RG_Samples_InsertCommand(object sender, GridCommandEventArgs e)
        {

            GridEditableItem editedItem = e.Item as GridEditableItem;
            Hashtable InputValues = new Hashtable();
            e.Item.OwnerTableView.ExtractValuesFromItem(InputValues, editedItem);

            Label Feedback = (Label)editedItem.FindControl("feedback");


            RadComboBox DatasetID = (RadComboBox)editedItem.FindControl("DDL_DSID");
            RadTextBox IndividualID = (RadTextBox)editedItem.FindControl("txt_IndividualID");
            RadComboBox HostID = (RadComboBox)editedItem.FindControl("DDL_HostID");

            Int64 Sample_ID = 0;
            Int64.TryParse(InputValues["SampleTypeID"].ToString(), out Sample_ID);
            SqlConnection cnn = new SqlConnection(CnnStr);
            SqlCommand cmd = new SqlCommand("Sp_Sample_Ins", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlDataAdptrCmd.InsertCommand = cmd;
            SqlParCol = cmd.Parameters;

            SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@PIID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@IndividualID", SqlDbType.BigInt));
            SqlParCol.Add(new SqlParameter("@LocalID", SqlDbType.NVarChar, 50));
            SqlParCol.Add(new SqlParameter("@SampleTypeID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@SeqTypeID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@PanelTypeID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@SeqMachineID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@SeqTargetCov", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@SeqKitModelID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@SeqTargetReadLen", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@SampleID", SqlDbType.BigInt));
            SqlParCol.Add(new SqlParameter("@DatasetID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@SeqDate", SqlDbType.Date));
            SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@HostID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@feedbackOUT", SqlDbType.NVarChar, -1));


            SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
            SqlParCol["@PIID"].Value = Session["Current_PIID"];
            if (IndividualID.Text == "")
            SqlParCol["@IndividualID"].Value = DBNull.Value;
            else
                SqlParCol["@IndividualID"].Value = Convert.ToInt64(IndividualID.Text);
           
            SqlParCol["@LocalID"].Value = InputValues["LocalID"].ToString();
            SqlParCol["@SampleTypeID"].Value = int.Parse(InputValues["SampleTypeID"].ToString());
            SqlParCol["@SeqTypeID"].Value = int.Parse(InputValues["SeqTypeID"].ToString());

            if (int.Parse(InputValues["SeqTypeID"].ToString()) != 3)
                SqlParCol["@PanelTypeID"].Value = -1;
            else
                SqlParCol["@PanelTypeID"].Value = int.Parse(InputValues["PanelTypeID"].ToString());

            SqlParCol["@SeqMachineID"].Value = int.Parse(InputValues["SeqMachineID"].ToString());
            SqlParCol["@SeqTargetCov"].Value = int.Parse(InputValues["SeqTargetCov"].ToString());
            SqlParCol["@SeqKitModelID"].Value = int.Parse(InputValues["SeqKitModelID"].ToString());
            SqlParCol["@SeqTargetReadLen"].Value = int.Parse(InputValues["SeqTargetReadLen"].ToString());
            SqlParCol["@SampleID"].Value = Sample_ID;

            SqlParCol["@DatasetID"].Value = int.Parse(DatasetID.SelectedValue.ToString());
            SqlParCol["@SeqDate"].Value = InputValues["SeqDate"].ToString();
            SqlParCol["@UserID"].Value = int.Parse(Session["WiNGSMasterId"].ToString());
            SqlParCol["@HostID"].Value = int.Parse(HostID.SelectedValue.ToString());
            SqlParCol["@feedbackOUT"].Direction = ParameterDirection.Output;

            try
            {
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                if (!cmd.Parameters["@feedbackOUT"].Value.Equals("Success"))
                {
                    
                   // string error = cmd.Parameters["@feedbackOUT"].Value.ToString();
                    //ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>"+ error + " </b>'); height=120,width=250", true);


                    string mssg = cmd.Parameters["@feedbackOUT"].Value.ToString();
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", "callAlert('" + mssg + "');", true);


                    e.Canceled = true;
                }
                cmd.Connection.Close();
             
         
            }
            catch (Exception ex)
            {
                Label lblError = new Label();
                lblError.Text = "Unable to insert. Reason: " + ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void RG_Samples_PreRender(object sender, EventArgs e)
        {

            hdn_searchSampleID.Value = filterSampleEditmode.ToString();

            checkinsertstatus();
        }

        protected void RG_Samples_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            
            GridEditableItem editedItem = e.Item as GridEditableItem;
            Hashtable InputValues = new Hashtable();
            e.Item.OwnerTableView.ExtractValuesFromItem(InputValues, editedItem);
            HiddenField hdn_vald = (HiddenField)editedItem.FindControl("hdn_validation");
            //if (!hdn_vald.Value.Equals("Invalid"))
            //{

                Label Feedback = (Label)editedItem.FindControl("feedback");
                TextBox SampleID = (TextBox)editedItem.FindControl("Txt_Sample_ID");
                RadComboBox DatasetID = (RadComboBox)editedItem.FindControl("DDL_DSID");
                RadTextBox IndividualID = (RadTextBox)editedItem.FindControl("txt_IndividualID");
                RadComboBox HostID = (RadComboBox)editedItem.FindControl("DDL_HostID");

                string Sample_ID = SampleID.Text;

                SqlConnection cnn = new SqlConnection(CnnStr);
                SqlCommand cmd = new SqlCommand("Sp_Sample_Upd", cnn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                SqlDataAdptrCmd.InsertCommand = cmd;
                SqlParCol = cmd.Parameters;

                SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@PIID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@IndividualID", SqlDbType.BigInt));
                SqlParCol.Add(new SqlParameter("@LocalID", SqlDbType.NVarChar, 50));
                SqlParCol.Add(new SqlParameter("@SampleTypeID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@SeqTypeID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@PanelTypeID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@SeqMachineID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@SeqTargetCov", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@SeqKitModelID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@SeqTargetReadLen", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@SampleID", SqlDbType.BigInt));
                SqlParCol.Add(new SqlParameter("@SeqDate", SqlDbType.Date));
                SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@HostID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@feedbackOUT", SqlDbType.NVarChar, -1));


                SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
                SqlParCol["@PIID"].Value = Session["Current_PIID"];
                if (IndividualID.Text == "")
                    SqlParCol["@IndividualID"].Value = DBNull.Value;
                else
                    SqlParCol["@IndividualID"].Value = Convert.ToInt64(IndividualID.Text);

                SqlParCol["@LocalID"].Value = InputValues["LocalID"].ToString();
                SqlParCol["@SampleTypeID"].Value = int.Parse(InputValues["SampleTypeID"].ToString());
                SqlParCol["@SeqTypeID"].Value = int.Parse(InputValues["SeqTypeID"].ToString());
                if (int.Parse(InputValues["SeqTypeID"].ToString()) != 3)
                    SqlParCol["@PanelTypeID"].Value = -1;
                else
                    SqlParCol["@PanelTypeID"].Value = int.Parse(InputValues["PanelTypeID"].ToString());

                SqlParCol["@SeqMachineID"].Value = int.Parse(InputValues["SeqMachineID"].ToString());
                SqlParCol["@SeqTargetCov"].Value = int.Parse(InputValues["SeqTargetCov"].ToString());
                SqlParCol["@SeqKitModelID"].Value = int.Parse(InputValues["SeqKitModelID"].ToString());
                SqlParCol["@SeqTargetReadLen"].Value = int.Parse(InputValues["SeqTargetReadLen"].ToString());
                SqlParCol["@SampleID"].Value = Convert.ToInt64(Sample_ID);

                SqlParCol["@SeqDate"].Value = InputValues["SeqDate"].ToString();
                SqlParCol["@UserID"].Value = int.Parse(Session["WiNGSMasterId"].ToString());
                SqlParCol["@HostID"].Value = int.Parse(HostID.SelectedValue.ToString());
                SqlParCol["@feedbackOUT"].Direction = ParameterDirection.Output;

                try
                {
                    cmd.Connection.Open();
                    cmd.ExecuteNonQuery();
                    if (!cmd.Parameters["@feedbackOUT"].Value.Equals("Success"))
                    {
                        
                       // string error = cmd.Parameters["@feedbackOUT"].Value.ToString();
                       // ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>" + error + " </b>'); height=120,width=250", true);

                        string mssg = cmd.Parameters["@feedbackOUT"].Value.ToString();
                        ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", "callAlert('" + mssg + "');", true);


                    e.Canceled = true;
                    }
                    cmd.Connection.Close();


                }
                catch (Exception ex)
                {
                    Label lblError = new Label();
                    lblError.Text = "Unable to insert. Reason: " + ex.Message;
                    lblError.ForeColor = System.Drawing.Color.Red;
                }
            //}
           
        }

        protected void RTB_DeleteSearch_Click(object sender, EventArgs e)
        {
            GridCommandItem commandItem = (GridCommandItem)RG_Samples.MasterTableView.GetItems(GridItemType.CommandItem)[0];
            RadComboBox rcb = (RadComboBox)commandItem.FindControl("RCB_searchSample");
            rcb.ClearSelection();
            filterSampleEditmode = -1;
            RG_Samples.Rebind();
            checkinsertstatus();
        }

        protected void RCB_searchSample_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            GridCommandItem commandItem = (GridCommandItem)RG_Samples.MasterTableView.GetItems(GridItemType.CommandItem)[0];
            RadComboBox rcb = (RadComboBox)commandItem.FindControl("RCB_searchSample");
            filterSampleEditmode = Convert.ToInt64(rcb.SelectedValue);
            hdn_searchSampleID.Value = rcb.SelectedValue;
            checkinsertstatus();
        }

        public void checkinsertstatus()
        {
            SqlConnection cnn = new SqlConnection(CnnStr);
            SqlCommand cmd = new SqlCommand("Sp_Samples_Updateble", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlDataAdptrCmd.InsertCommand = cmd;
            SqlParCol = cmd.Parameters;
            SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@PIID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@Updatable", SqlDbType.Int));
            SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
            SqlParCol["@PIID"].Value = Session["Current_PIID"];
            SqlParCol["@UserID"].Value = int.Parse(Session["WiNGSMasterId"].ToString());
            SqlParCol["@Updatable"].Direction = ParameterDirection.Output;

            try

            {
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();

                GridCommandItem commandItem = (GridCommandItem)RG_Samples.MasterTableView.GetItems(GridItemType.CommandItem)[0];
                RadButton btn = (RadButton)commandItem.FindControl("RB_insert");
                if (!cmd.Parameters["@Updatable"].Value.Equals(0))
                {

                    btn.Enabled = true;
                }
                else
                {
                    btn.Enabled = false;
                }

                cmd.Connection.Close();

            }

            catch (Exception ex)

            {

                Label lblError = new Label();
                lblError.Text = "Unable to insert. Reason: " + ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void AssignIndividual_Command(object sender, CommandEventArgs e)
        {
            if (!hdn_InsertModeHostselected.Value.Equals("") && !(string.IsNullOrWhiteSpace(hdn_LocalID.Value.ToString())) )
            {
                Session["HostID"] = hdn_InsertModeHostselected.Value;
                Session["SampleLocalID"] = hdn_LocalID.Value;
                Session["SampleID_popup_Individual"] = hdn_sampleToassign.Value;
                
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", "OpenWinIndividualForSample();", true);

            }
            else
            {
                string mssg = "please sure you selected a host and specified local ID!";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", "callAlert('"+ mssg + "');", true);

            }
            
        }

        protected void RCB_searchSample_PreRender(object sender, EventArgs e)
        {
           
                RadComboBox rcb = sender as RadComboBox;
                rcb.SelectedValue = hdn_searchSampleID.Value;
           
        }
    }
}
