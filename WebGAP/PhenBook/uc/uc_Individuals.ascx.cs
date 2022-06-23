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

namespace WebGAP.PhenBook.uc
{
    public partial class uc_Individuals : System.Web.UI.UserControl
    {

        #region "CnnStr"{
        string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}


        protected Int64 filterEditmode
        {
            get
            {
                Int64 value = (Int64)ViewState["filterEditmode"];
                return -1 != value ? (Int64)value : -1;
            }
            set
            {
                ViewState["filterEditmode"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                filterEditmode = -1;
            lbl_CenterPI.Text = Session["Current_Center"].ToString() + ", " + Session["Current_PI"].ToString();
           

        }

        protected void RG_Individual_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
          
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                
                HiddenField hdnsp = (HiddenField)item.FindControl("hdn_Gender");
                string sp = hdnsp.Value.ToString();
                ImageButton imgsp = (ImageButton)item.FindControl("Genderbtn");
                switch (sp)
                {
                    case "0":
                        imgsp.ImageUrl = "/img/icon/icon_female.png";
                        imgsp.ToolTip = "Female";
                        break;
                    case "1":
                        imgsp.ImageUrl = "/img/icon/icon_male.png";
                        imgsp.ToolTip = "Male";
                        break;
                    default:
                        imgsp.ImageUrl = "/img/icon/icon_unknown.png";
                        imgsp.ToolTip = "UnKnown";
                        break;
                }
                
                HiddenField hdnsp_Status = (HiddenField)item.FindControl("hdn_Status");
                string sp_Status = hdnsp_Status.Value.ToString();
                ImageButton imgStatus = (ImageButton)item.FindControl("Statusbtn");
                switch (sp_Status)
                {
                    case "0":
                        imgStatus.ImageUrl = "/img/icon/icon_dead.png";
                        imgStatus.ToolTip = "Dead";
                        break;
                    case "1":
                        imgStatus.ImageUrl = "/img/icon/icon_alive.png";
                        imgStatus.ToolTip = "Alive";
                        break;
                    default:
                        imgStatus.ImageUrl = "/img/icon/icon_unknown.png";
                        imgStatus.ToolTip = "UnKnown";
                        break;

                }

                    HiddenField hdUpD = (HiddenField)item.FindControl("hdn_Updatable");
                    string spUpD = hdUpD.Value.ToString();

                    switch (spUpD)
                    {
                        case "0":
                            ImageButton Edit = (ImageButton)item["EditCommandColumn"].Controls[0];
                            Edit.Visible = false;

                            ImageButton NewFile = (ImageButton)item.FindControl("GoToPheno"); //hide the HPO
                            NewFile.Visible = false;

                            ImageButton samplepopup = (ImageButton)item.FindControl("AssignSample"); //hide the assign poup
                            samplepopup.Visible = false;
                            break;

                        
                    }

            }
        }

        private String getItemName(string tableName)
        {
            switch (tableName)
            {
                case ("Master"):
                    {
                        return "Individual";
                    }


                default: return "";
            }
        }

        private void DisplayMessage(string text)
        {
            RG_Individuals.Controls.Add(new LiteralControl(string.Format("<span style='color:red'>{0}</span>", text)));
        }

        protected void RG_Individuals_ItemInserted(object sender, GridInsertedEventArgs e)
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

        protected void RG_Individuals_PreRender(object sender, EventArgs e)
        {
            hdn_searchIndividualID.Value = filterEditmode.ToString();
            checkinsertstatus();
        }

        protected void RG_Individuals_InsertCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;

            RadTextBox SampleID = (RadTextBox)editedItem.FindControl("txt_SampleID");
            RadTextBox LocalID = (RadTextBox)editedItem.FindControl("Txt_Local_ID");
            RadDatePicker DOB = (RadDatePicker)editedItem.FindControl("Txt_Bdate");
            TextBox FN = (TextBox)editedItem.FindControl("Txt_Individual_Fname");
            DropDownList Gender = (DropDownList)editedItem.FindControl("DDL_Gender");
            TextBox LN = (TextBox)editedItem.FindControl("Txt_Individual_Lname");
            DropDownList Status = (DropDownList)editedItem.FindControl("DDL_Status");
            TextBox Clinical_info = (TextBox)editedItem.FindControl("Relevant_Clinical_Info");
            RadComboBox HostID = (RadComboBox)editedItem.FindControl("DDL_HostID");

            SqlConnection cnn = new SqlConnection(CnnStr);
            SqlCommand cmd = new SqlCommand("Sp_Individual_Ins", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlDataAdptrCmd.InsertCommand = cmd;
            SqlParCol = cmd.Parameters;


            Label Feedback = (Label)editedItem.FindControl("feedback");


            SqlParCol.Add(new SqlParameter("@SampleID", SqlDbType.BigInt));
            SqlParCol.Add(new SqlParameter("@IndividualID", SqlDbType.BigInt));
            SqlParCol.Add(new SqlParameter("@LocalID", SqlDbType.NVarChar, 50));
            SqlParCol.Add(new SqlParameter("@IndividualFName", SqlDbType.NVarChar, 50));
            SqlParCol.Add(new SqlParameter("@IndividualLName", SqlDbType.NVarChar, 50));
            SqlParCol.Add(new SqlParameter("@IndividualBirthDate", SqlDbType.NVarChar,-1));
            SqlParCol.Add(new SqlParameter("@IndividualSex", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@IndividualStatus", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@Relevant_Clinical_Info", SqlDbType.NVarChar, -1));
            SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@PIID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@Affected", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@HostID", SqlDbType.Int)); 
            SqlParCol.Add(new SqlParameter("@feedbackOUT", SqlDbType.NVarChar, -1));



            if (SampleID.Text == "" && SampleID.Text.Length != 11)
                SqlParCol["@SampleID"].Value = DBNull.Value;
            else
                SqlParCol["@SampleID"].Value = Convert.ToInt64(SampleID.Text);
            SqlParCol["@IndividualID"].Value = DBNull.Value;

            SqlParCol["@LocalID"].Value = LocalID.Text;
            SqlParCol["@IndividualFName"].Value = FN.Text;
            SqlParCol["@IndividualLName"].Value = LN.Text;
            if (DOB.SelectedDate.Equals(null))
                SqlParCol["@IndividualBirthDate"].Value = DBNull.Value;
            else
                SqlParCol["@IndividualBirthDate"].Value = DOB.SelectedDate;
            SqlParCol["@IndividualSex"].Value = Gender.SelectedValue;
            if (Status.SelectedValue.Equals(""))
                SqlParCol["@IndividualStatus"].Value = DBNull.Value;
            else
                SqlParCol["@IndividualStatus"].Value = Status.SelectedValue;
            SqlParCol["@Relevant_Clinical_Info"].Value = Clinical_info.Text;
            SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
            SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
            SqlParCol["@PIID"].Value = Session["Current_PIID"];
            SqlParCol["@Affected"].Value = DBNull.Value; // should change after change UI (populate from UI)
            SqlParCol["@HostID"].Value = HostID.SelectedValue;
            SqlParCol["@feedbackOUT"].Direction = ParameterDirection.Output;


            try
            {
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                if (!cmd.Parameters["@feedbackOUT"].Value.Equals("Success"))
                {
                    //Feedback.Text = cmd.Parameters["@feedbackOUT"].Value.ToString();
                    //Feedback.ForeColor = System.Drawing.Color.Red;
                    //Feedback.Attributes.Add("style", "font-weight: bold;");
                    string error = cmd.Parameters["@feedbackOUT"].Value.ToString();
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>" + error + " </b>'); height=120,width=250", true);
                    e.Canceled = true;
                }
                else
                { e.Canceled = false; }
                cmd.Connection.Close();
            }
            catch (Exception ex)
            {
                Label lblError = new Label();
                lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
            }
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

        protected void RG_Individuals_ItemDeleted(object sender, GridDeletedEventArgs e)
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

        protected void RG_Individuals_ItemUpdated(object sender, GridUpdatedEventArgs e)
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

 
        protected void RG_Individuals_ItemCommand(object source, GridCommandEventArgs e)
        {
            if (e.CommandName == "GoToPheno")
            {
              
                GridDataItem item = (GridDataItem)e.Item;
                Session["HostID"] = item.GetDataKeyValue("HostID");
                Session["IndividualID"] = item["IndividualID"].Text;
                Session["IndividualLocalID"] = item["LocalID"].Text;
                Response.Redirect("~/PhenBook/Phenotypes.aspx");
             
            }

            if (e.CommandName.Equals("InitInsert") || e.CommandName.Equals("Edit"))
            {

                hdn_searchIndividualID.Value = filterEditmode.ToString();

            }

            if(e.CommandName.Equals("AssignSample"))
            {
                GridDataItem item = (GridDataItem)e.Item;
                Session["IndividualID"] = item["IndividualID"].Text;
                Session["HostID"] = item.GetDataKeyValue("HostID");
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", "OpenWinSampleForINdvidual();", true);
             }

        }

        protected void ImportedFilter_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
            if (e.Item is RadComboBoxItem)
            {
                RadComboBoxItem item = (RadComboBoxItem)e.Item;

            

                HiddenField hdnsp = (HiddenField)item.FindControl("hdn_GenderF");
                string sp = hdnsp.Value.ToString();
                ImageButton imgsp = (ImageButton)item.FindControl("GenderbtnF");

          
                switch (sp)
                {
                    case "0":
                        imgsp.ImageUrl = "/img/icon/icon_female.png";
                        imgsp.ToolTip = "Female";


                        break;
                    case "1":
                        imgsp.ImageUrl = "/img/icon/icon_male.png";
                        imgsp.ToolTip = "Male";
                        break;
                    default:
                        imgsp.ImageUrl = "/img/icon/icon_unknown.png";
                        imgsp.ToolTip = "UnKnown";
                        break;
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

        protected void RG_Individuals_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;

            RadTextBox SampleID = (RadTextBox)editedItem.FindControl("txt_SampleID");
            TextBox IndividualID = (TextBox)editedItem.FindControl("Txt_Individual_ID");
            RadTextBox LocalID = (RadTextBox)editedItem.FindControl("Txt_Local_ID");
            RadDatePicker DOB = (RadDatePicker)editedItem.FindControl("Txt_Bdate");
            TextBox FN = (TextBox)editedItem.FindControl("Txt_Individual_Fname");
            DropDownList Gender = (DropDownList)editedItem.FindControl("DDL_Gender");
            TextBox LN = (TextBox)editedItem.FindControl("Txt_Individual_Lname");
            DropDownList Status = (DropDownList)editedItem.FindControl("DDL_Status");
            RadComboBox Host = (RadComboBox)editedItem.FindControl("DDL_HostID");

            TextBox Clinical_info = (TextBox)editedItem.FindControl("Relevant_Clinical_Info");

            SqlConnection cnn = new SqlConnection(CnnStr);
            SqlCommand cmd = new SqlCommand("Sp_Individual_Upd", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlDataAdptrCmd.InsertCommand = cmd;
            SqlParCol = cmd.Parameters;

           

            Label Feedback = (Label)editedItem.FindControl("feedback");

            SqlParCol.Add(new SqlParameter("@SampleID", SqlDbType.BigInt));
            SqlParCol.Add(new SqlParameter("@IndividualID", SqlDbType.BigInt));
            SqlParCol.Add(new SqlParameter("@LocalID", SqlDbType.NVarChar,50));
            SqlParCol.Add(new SqlParameter("@IndividualFName", SqlDbType.NVarChar, 50));
            SqlParCol.Add(new SqlParameter("@IndividualLName", SqlDbType.NVarChar, 50));
            SqlParCol.Add(new SqlParameter("@IndividualBirthDate", SqlDbType.NVarChar, -1));
            SqlParCol.Add(new SqlParameter("@IndividualSex", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@IndividualStatus", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@Relevant_Clinical_Info", SqlDbType.NVarChar, -1));
            SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@PIID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@Affected", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@HostID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@feedbackOUT", SqlDbType.NVarChar, -1));

            SqlParCol["@SampleID"].Value = DBNull.Value; 
            SqlParCol["@IndividualID"].Value = Convert.ToInt64(IndividualID.Text);
            SqlParCol["@LocalID"].Value = LocalID.Text;
            SqlParCol["@IndividualFName"].Value = FN.Text;
            SqlParCol["@IndividualLName"].Value = LN.Text;
            if (DOB.SelectedDate.Equals(null))
                SqlParCol["@IndividualBirthDate"].Value = DBNull.Value;
            else
            SqlParCol["@IndividualBirthDate"].Value = DOB.SelectedDate;
            SqlParCol["@IndividualSex"].Value = Gender.SelectedValue;
            if(Status.SelectedValue.Equals(""))
            SqlParCol["@IndividualStatus"].Value = DBNull.Value;
            else
            SqlParCol["@IndividualStatus"].Value = Status.SelectedValue;
            SqlParCol["@Relevant_Clinical_Info"].Value = Clinical_info.Text;
            SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
            SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
            SqlParCol["@PIID"].Value = Session["Current_PIID"];
            SqlParCol["@Affected"].Value = DBNull.Value; // should change after change UI (populate from UI)
            SqlParCol["@HostID"].Value = Host.SelectedValue;
            SqlParCol["@feedbackOUT"].Direction = ParameterDirection.Output;


            try
            {
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                if (!cmd.Parameters["@feedbackOUT"].Value.Equals("Success"))
                {
                    Feedback.Text = cmd.Parameters["@feedbackOUT"].Value.ToString();
                    Feedback.ForeColor = System.Drawing.Color.Red;
                    Feedback.Attributes.Add("style", "font-weight: bold;");
                    e.Canceled = true;
                }
                else
                { e.Canceled = false; }
                cmd.Connection.Close();
           
            }
            catch (Exception ex)
            {
                Label lblError = new Label();
                lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void RG_Individuals_ItemCreated(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridEditableItem && e.Item.IsInEditMode)
            {
                GridEditableItem item = (GridEditableItem)e.Item;

                if (!(e.Item is GridEditFormInsertItem || e.Item is GridDataInsertItem))
                {

                    RadTextBox Local_ID = (RadTextBox)item.FindControl("Txt_Local_ID");
                    Local_ID.Enabled = false;

                    Label lbl_SampleID = (Label)item.FindControl("lbl_SampleID");
                    RadTextBox SampleID = (RadTextBox)item.FindControl("txt_SampleID");
                    ImageButton btn_Assign_Sample = (ImageButton)item.FindControl("btn_Assign_Sample");
                    ImageButton imgbtn_Delete = (ImageButton)item.FindControl("imgbtn_Delete");

                    RadComboBox DDL = (RadComboBox)item.FindControl("DDL_HostID");
                    Label lbl = (Label)item.FindControl("lbl_HID");

                    lbl_SampleID.Visible = false;
                    SampleID.Visible = false;
                    btn_Assign_Sample.Visible = false;
                    imgbtn_Delete.Visible = false;
                    DDL.Enabled = false;
                    lbl.Enabled = false;


                   

                }
                RadDatePicker Date = (RadDatePicker)item.FindControl("Txt_Bdate");
                Date.MaxDate = DateTime.Now;
            }
          
        }

        protected void RCB_searchIndividual_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            GridCommandItem commandItem = (GridCommandItem)RG_Individuals.MasterTableView.GetItems(GridItemType.CommandItem)[0];
            RadComboBox rcb = (RadComboBox)commandItem.FindControl("RCB_searchIndividual");
            filterEditmode = Convert.ToInt64(rcb.SelectedValue);
            hdn_searchIndividualID.Value = rcb.SelectedValue;

        
            checkinsertstatus();
        }

        protected void RTB_DeleteSearch_Click(object sender, EventArgs e)
        {
            GridCommandItem commandItem = (GridCommandItem)RG_Individuals.MasterTableView.GetItems(GridItemType.CommandItem)[0];
            RadComboBox rcb = (RadComboBox)commandItem.FindControl("RCB_searchIndividual");
            rcb.ClearSelection();
            filterEditmode = -1;
            RG_Individuals.Rebind();
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

                GridCommandItem commandItem = (GridCommandItem)RG_Individuals.MasterTableView.GetItems(GridItemType.CommandItem)[0];
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

        protected void btn_Assign_Sample_Command(object sender, CommandEventArgs e)
        {
            if(!hdn_InsertModeHostselected.Value.Equals(""))
            {
            Session["HostID"] = hdn_InsertModeHostselected.Value;
            Session["IndividualID"] = -1;
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", "OpenWinSampleForINdvidual();", true);
           
            }
            else
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>  please select a host! </b><br />');", true);

        }

        protected void RCB_searchIndividual_PreRender(object sender, EventArgs e)
        {
            RadComboBox rcb = sender as RadComboBox;
            rcb.SelectedValue = hdn_searchIndividualID.Value;
        }
    }
}