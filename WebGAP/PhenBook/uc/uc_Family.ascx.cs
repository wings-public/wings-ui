using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.PhenBook.uc
{
    public partial class uc_Family : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}


        protected Int64 filterFamilySearchmode
        {
            get
            {
                Int64 value = (Int64)ViewState["filterFamilySearchmode"];
                return -1 != value ? (Int64)value : -1;
            }
            set
            {
                ViewState["filterFamilySearchmode"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                filterFamilySearchmode = -1;
            lbl_CenterPI.Text = Session["Current_Center"].ToString() + ", " + Session["Current_PI"].ToString();

        }

        protected void RG_Family_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
            

                HiddenField hdUpD = (HiddenField)item.FindControl("hdn_Updatable");
                string spUpD = hdUpD.Value.ToString();

                switch (spUpD)
                {
                    case "0":
                        ImageButton Edit = (ImageButton)item["EditCommandColumn"].Controls[0];
                        Edit.Visible = false;

                        ImageButton History = (ImageButton)item.FindControl("FamilyHealthHistory"); //hide the FamilyHealthHistory
                        History.Visible = false;

                        //ImageButton Pedigree = (ImageButton)item.FindControl("DrawPedigree"); //hide the DrawPedigree
                        //Pedigree.Visible = false;
                        break;
                }
            }
        }

        protected void RG_Family_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "FamilyHealthHistory")
            {
                
                  GridDataItem item = (GridDataItem)e.Item;
                Session["FamilyID"] = item["FamilyID"].Text;
                Session["HostID_ForFamilyMember"] = item.GetDataKeyValue("HostID");
                Session["ProbandID"] = item["IndividualID"].Text.Length == 11 ? item["IndividualID"].Text : "";
                  Response.Redirect("~/PhenBook/FamilyHealthHistory.aspx");

                if (e.Item is GridDataItem)
                {

                    HiddenField hdUpD = (HiddenField)item.FindControl("hdn_Updatable");
                    string spUpD = hdUpD.Value.ToString();

                    switch (spUpD)
                    {
                        case "0":
                            ImageButton editbutton = (ImageButton)item["EditCommandColumn"].Controls[0]; //hide the EditCommandColumn
                            editbutton.Visible = false;

                            ImageButton Pheno = (ImageButton)item["GoToNewFile"].Controls[0]; //hide the EditCommandColumn
                            Pheno.Visible = false;
                            break;

                    }
                }

            }


            if (e.CommandName == "ShowPedigree")
            {
                GridDataItem item = (GridDataItem)e.Item;
                Session["ID_drawPedigree"] = item["FamilyID"].Text;
                Session["HostID"] = item.GetDataKeyValue("HostID");
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", "openWinPedigree();", true);
                     

            }

            if (e.CommandName.Equals("Edit"))
            {
                hdn_searchFamilyID.Value = filterFamilySearchmode.ToString();
            }

      
        }

        protected void RG_Family_ItemUpdated(object sender, GridUpdatedEventArgs e)
        {
           
            if (e.Exception != null)
            {
                e.KeepInEditMode = true;
                e.ExceptionHandled = true;
            }
            else
            {
                // DisplayMessage(item + " " + e.Item[field].Text + " updated");
            }
        }

     

        protected void RG_Family_PreRender(object sender, EventArgs e)
        {
            hdn_searchFamilyID.Value = filterFamilySearchmode.ToString();
            checkinsertstatus();
        }

        protected void RCB_searchFamily_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            GridCommandItem commandItem = (GridCommandItem)RG_Family.MasterTableView.GetItems(GridItemType.CommandItem)[0];
            RadComboBox rcb = (RadComboBox)commandItem.FindControl("RCB_searchFamily");
            hdn_searchFamilyID.Value = rcb.SelectedValue;
            filterFamilySearchmode = Convert.ToInt64(rcb.SelectedValue);

            checkinsertstatus();
        }

        protected void RTB_DeleteSearch_Click(object sender, EventArgs e)
        {
            GridCommandItem commandItem = (GridCommandItem)RG_Family.MasterTableView.GetItems(GridItemType.CommandItem)[0];
            RadComboBox rcb = (RadComboBox)commandItem.FindControl("RCB_searchFamily");
            rcb.ClearSelection();
            filterFamilySearchmode = -1;
            RG_Family.Rebind();
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

                GridCommandItem commandItem = (GridCommandItem)RG_Family.MasterTableView.GetItems(GridItemType.CommandItem)[0];
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

        protected void RG_Family_ItemInserted(object sender, GridInsertedEventArgs e)
        {
        
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
              //  DisplayMessage(item + " cannot be inserted. Reason: " + e.Exception.Message);
            }
            else
            {
                //DisplayMessage(item + " inserted");
            }
        }

        protected void RG_Family_InsertCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;

            
            TextBox FD = (TextBox)editedItem.FindControl("Txt_Family_Desc");
            RadComboBox HostID = (RadComboBox)editedItem.FindControl("DDL_HostID");

            SqlConnection cnn = new SqlConnection(CnnStr);
            SqlCommand cmd = new SqlCommand("Sp_Family_Ins", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlDataAdptrCmd.InsertCommand = cmd;
            SqlParCol = cmd.Parameters;


            Label Feedback = (Label)editedItem.FindControl("feedback");


            SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@PIID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@FamilyDesc", SqlDbType.NVarChar,-1));
            SqlParCol.Add(new SqlParameter("@HostID", SqlDbType.Int));



            SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
            SqlParCol["@PIID"].Value = Session["Current_PIID"];
            SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
            SqlParCol["@FamilyDesc"].Value = FD.Text;
            SqlParCol["@HostID"].Value = HostID.SelectedValue;

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

        protected void RG_Family_ItemCreated(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridEditableItem && e.Item.IsInEditMode)
            {
                if (!(e.Item is GridEditFormInsertItem || e.Item is GridDataInsertItem))
                {
                    GridEditableItem item = (GridEditableItem)e.Item;
                    RadComboBox DDL = (RadComboBox)item.FindControl("DDL_HostID");
                    Label lbl = (Label)item.FindControl("lbl_HID");
                    DDL.Visible = false;
                    lbl.Visible = false;

                }
            }

        }

        protected void RCB_searchFamily_PreRender(object sender, EventArgs e)
        {
            RadComboBox rcb = sender as RadComboBox;
            rcb.SelectedValue = hdn_searchFamilyID.Value;
        }
    }
 }
