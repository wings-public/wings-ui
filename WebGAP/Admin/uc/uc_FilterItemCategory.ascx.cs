using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.Admin.uc
{
    public partial class uc_FilterItemCategory : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}

        List<string> sbValues;
        String ResTbl;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                Get_CountOfOprItems();          
        }

        private void Get_CountOfOprItems()
        {

            String connstring = CnnStr;
            SqlConnection conn = new SqlConnection(connstring);
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();

            SqlCommand cmd = new SqlCommand("Sp_Filter_Count_Of_OprItems_Sel", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@CountOfOpr", SqlDbType.Int);
            cmd.Parameters["@CountOfOpr"].Direction = ParameterDirection.Output;

            SqlDataAdptrCmd.SelectCommand = cmd;

            DataTable myDataTable = new DataTable();

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                SqlDataAdptrCmd.Fill(myDataTable);
                Session["CountOfOprItems"] = cmd.Parameters["@CountOfOpr"].Value.ToString();

            }
            finally
            {
                conn.Close();
            }

        }

        protected void RG_FilterItemCat_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Delete"))
            {
                string deleteCommand = "Sp_Filter_Item_Category_Del";
                DS_FilterItemCat.DeleteCommand = deleteCommand;
            }

            if (e.CommandName == RadGrid.PerformInsertCommandName || e.CommandName == RadGrid.UpdateCommandName)
            {
                hdf_RSTblName.Value = ResTbl;

                //Get CheckBox Operation Ids
                var gridEditFormItem = (GridEditFormItem)e.Item;
                var rcb = (RadComboBox)gridEditFormItem.FindControl("OperationIds");
                var collection = rcb.CheckedItems;
                StringBuilder sbValues = new StringBuilder();
                if (collection.Count != 0)
                {
                    foreach (var item in collection)
                    {
                        sbValues.Append(item.Value);
                        sbValues.Append(",");
                    }
                    if (sbValues.ToString().EndsWith(","))
                        sbValues.Remove(sbValues.Length - 1, 1);
                }

                string OperationIds = sbValues.ToString();
                if (OperationIds != null)
                {
                    //rcb.SelectedValue = OperationIds;
                    hdf_OprIds.Value = OperationIds;
                }

                RadComboBox RCB_ResTblColName = (RadComboBox)gridEditFormItem.FindControl("DDL_ResourceTableFieldName");
                RadComboBox RCB_ResTblColValue = (RadComboBox)gridEditFormItem.FindControl("DDL_ResourceTableFieldValue");
                RadTextBox RTB_WhereClause = (RadTextBox)gridEditFormItem.FindControl("RTB_WhereClause");

                if (!String.IsNullOrEmpty(RCB_ResTblColName.SelectedValue))
                    hdf_RTblFieldName.Value = RCB_ResTblColName.SelectedValue;

                if (!String.IsNullOrEmpty(RCB_ResTblColValue.SelectedValue))
                    hdf_RTblFieldValue.Value = RCB_ResTblColValue.SelectedValue;

                if (!String.IsNullOrEmpty(RTB_WhereClause.Text))
                    hdf_WhereClause.Value = RTB_WhereClause.Text;
                else
                    hdf_WhereClause.Value = " ";

            }

            if (e.CommandName == RadGrid.InitInsertCommandName)
            {
                Session["commandName"] = "Insert";
            }


            if (e.CommandName == RadGrid.EditCommandName)
            {
                GridDataItem gridItem = e.Item as GridDataItem;
                //Session["Oprkeys"] = gridItem.GetDataKeyValue("OperationIds").ToString();
                HiddenField hdn_OprId_Sel = (HiddenField)gridItem.FindControl("hdn_OprId_Sel");

                Session["Oprkeys"] = hdn_OprId_Sel.Value;
                sbValues = new List<string>();
                Session["commandName"] = "Edit";

                HiddenField hdn_RSTblName_Sel = (HiddenField)gridItem.FindControl("hdn_RSTblName_Sel");
                ResTbl = hdn_RSTblName_Sel.Value;
                hdf_RSTblName.Value = ResTbl;

                HiddenField hdn_WhereClause_Sel = (HiddenField)gridItem.FindControl("hdn_WhereClause_Sel");

                var ResTblColName = gridItem["ResourceTableFieldName"].Text.Replace("&nbsp;", "");
                var ResTblColValue = gridItem["ResourceTableFieldValue"].Text.Replace("&nbsp;", "");
                var WhereClause = hdn_WhereClause_Sel.Value;

                if (!String.IsNullOrEmpty(ResTblColName))
                    hdf_RTblFieldName.Value = ResTblColName;

                if (!String.IsNullOrEmpty(ResTblColValue))
                    hdf_RTblFieldValue.Value = ResTblColValue;

                if (!String.IsNullOrEmpty(WhereClause))
                    hdf_WhereClause.Value = WhereClause;
                else
                    hdf_WhereClause.Value = " ";

            }

        }

        protected void OperationIds_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
            if (Session["commandName"].Equals("Edit"))
            {
                string Oprkeys = Session["Oprkeys"].ToString();
                RadComboBox rcb = (RadComboBox)sender;

                List<string> OprIds = Oprkeys.Split(',').ToList();
                if (OprIds.Contains(e.Item.Value))
                {
                    e.Item.Checked = true;
                    sbValues.Add(e.Item.Value.ToString());
                    sbValues.Add(",");
                }
                if (rcb.Items.Count == Convert.ToInt32(Session["CountOfOprItems"].ToString()))
                {
                    if (sbValues.ToString().EndsWith(","))
                    {
                        sbValues.RemoveAt(sbValues.Count - 1);

                        string OperationIds = sbValues.ToString();
                        if (OperationIds != null)
                        {
                            for (int i = 0; i < sbValues.Count; i++)
                            {
                                rcb.SelectedValue += sbValues[i];
                            }
                        }
                    }
                }
            }
        }

        protected void DDL_ResourceTableName_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            GridEditableItem editedItem = (sender as RadComboBox).NamingContainer as GridEditableItem;
            RadComboBox DDL_ResourceTableName = (RadComboBox)editedItem.FindControl("DDL_ResourceTableName");
            RadComboBox DDL_ResourceTableFieldName = (RadComboBox)editedItem.FindControl("DDL_ResourceTableFieldName");
            RadComboBox DDL_ResourceTableFieldValue = (RadComboBox)editedItem.FindControl("DDL_ResourceTableFieldValue");

            hdf_RSTblName.Value = DDL_ResourceTableName.SelectedValue;

            DDL_ResourceTableFieldName.Text = "";
            DDL_ResourceTableFieldName.Items.Clear();
            DDL_ResourceTableFieldName.OpenDropDownOnLoad = true;
            DDL_ResourceTableFieldName.HighlightTemplatedItems = true;

            DDL_ResourceTableFieldValue.Text = "";
            DDL_ResourceTableFieldValue.Items.Clear();
            DDL_ResourceTableFieldValue.OpenDropDownOnLoad = true;
            DDL_ResourceTableFieldValue.HighlightTemplatedItems = true;

            AddNewAjaxSetting(DDL_ResourceTableName.ID, DDL_ResourceTableFieldName.ID);
            AddNewAjaxSetting(DDL_ResourceTableName.ID, DDL_ResourceTableFieldValue.ID);

        }

        protected void AddNewAjaxSetting(string AjaxControlId, string AjaxUpdControlId)
        {
            AjaxSetting ajaxSetting = new AjaxSetting();
            ajaxSetting.AjaxControlID = AjaxControlId;

            AjaxUpdatedControl updatedControl = new AjaxUpdatedControl();
            updatedControl.ControlID = AjaxUpdControlId;
            updatedControl.LoadingPanelID = "RadAjaxLoadingPanel1";
            updatedControl.UpdatePanelHeight = Unit.Pixel(200);
            updatedControl.UpdatePanelRenderMode = UpdatePanelRenderMode.Inline;

            ajaxSetting.UpdatedControls.Add(updatedControl);

            RadAjaxManager1.AjaxSettings.Add(ajaxSetting);
        }

        protected void DS_FilterItemCat_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@OperationIds"].Value = hdf_OprIds.Value;
            e.Command.Parameters["@ResourceTableFieldName"].Value = hdf_RTblFieldName.Value;
            e.Command.Parameters["@ResourceTableFieldValue"].Value = hdf_RTblFieldValue.Value;
            e.Command.Parameters["@WhereClause"].Value = hdf_WhereClause.Value;
        }

        protected void DDL_ResourceTableFieldName_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            RadComboBox rcb = (RadComboBox)sender;
            hdf_RTblFieldName.Value = rcb.SelectedValue;

        }
        protected void DDL_ResourceTableFieldValue_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            RadComboBox rcb = (RadComboBox)sender;
            hdf_RTblFieldValue.Value = rcb.SelectedValue;
        }

        protected void DDL_ResourceTableFieldValue_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
            if (!String.IsNullOrEmpty(hdf_RTblFieldValue.Value) && (Session["commandName"].Equals("Edit") || Session["commandName"].Equals("Insert")))
            {
                RadComboBox rcb = (RadComboBox)sender;
                rcb.SelectedValue = hdf_RTblFieldValue.Value;
            }
        }
        
        protected void DDL_ResourceTableFieldName_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
            if (!String.IsNullOrEmpty(hdf_RTblFieldName.Value) && (Session["commandName"].Equals("Edit") || Session["commandName"].Equals("Insert")))
            {
                RadComboBox rcb = (RadComboBox)sender;
                rcb.SelectedValue = hdf_RTblFieldName.Value;

            }
        }

        protected void RB_AddToWhereClausePrev_Click(object sender, EventArgs e)
        {
            GridEditableItem editedItem = (sender as RadButton).NamingContainer as GridEditableItem;
            RadTextBox RTB_WhereClause = (RadTextBox)editedItem.FindControl("RTB_WhereClause");
            RadComboBox RCB_WhereClauseKey = (RadComboBox)editedItem.FindControl("RCB_WhereClauseKey");
            RadComboBox RCB_opration_fixed = (RadComboBox)editedItem.FindControl("RCB_opration_fixed");
            RadComboBox RCB_WhereClauseValue = (RadComboBox)editedItem.FindControl("RCB_WhereClauseValue");
            if (!String.IsNullOrEmpty(RCB_WhereClauseKey.SelectedValue) &&
                !String.IsNullOrEmpty(RCB_opration_fixed.SelectedValue) &&
                !String.IsNullOrEmpty(RCB_WhereClauseValue.SelectedValue))
            {
                if (!String.IsNullOrEmpty(RTB_WhereClause.Text))
                    RTB_WhereClause.Text += " AND "+ RCB_WhereClauseKey.SelectedValue + RCB_opration_fixed.SelectedValue + RCB_WhereClauseValue.SelectedValue;
                else
                    RTB_WhereClause.Text += RCB_WhereClauseKey.SelectedValue + RCB_opration_fixed.SelectedValue + RCB_WhereClauseValue.SelectedValue;

            }
            else
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"alert('Select the key and value of WHERE clause!');", true);

        }

        protected void RTB_WhereClause_DataBinding(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(hdf_WhereClause.Value) && (Session["commandName"].Equals("Edit") || Session["commandName"].Equals("Insert")))
            {
                RadTextBox rtb = (RadTextBox)sender;
                rtb.Text = hdf_WhereClause.Value;
            }
        }
    }
}

