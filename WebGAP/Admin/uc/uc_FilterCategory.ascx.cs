using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.Admin.uc
{
    public partial class uc_FilterCategory : System.Web.UI.UserControl
    {
        List<string> sbValues;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RG_FilterCat_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Delete"))
            {
                string deleteCommand = "Sp_Filter_Category_Del";
                DS_FilterCat.DeleteCommand = deleteCommand;
            }

            if (e.CommandName == RadGrid.PerformInsertCommandName || e.CommandName == RadGrid.UpdateCommandName)
            {

                //Get CheckBox Analysis types
                var gridEditFormItem = (GridEditFormItem)e.Item;
                var rcb = (RadComboBox)gridEditFormItem.FindControl("AnalysisType");
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

                string AnalysisTypes = sbValues.ToString();
                if (AnalysisTypes != null)
                {
                    //rcb.SelectedValue = OperationIds;
                    hdf_AnalysTyps.Value = AnalysisTypes;
                }

            }

            if (e.CommandName == RadGrid.InitInsertCommandName)
            {
                Session["commandName"] = "Insert";
            }

            if (e.CommandName == RadGrid.EditCommandName)
            {
                GridDataItem gridItem = e.Item as GridDataItem;
                HiddenField hdn_analysTyps_Sel = (HiddenField)gridItem.FindControl("hdn_analysTyps_Sel");

                Session["analysTyps"] = hdn_analysTyps_Sel.Value;
                sbValues = new List<string>();
                Session["commandName"] = "Edit";
            }

        }

        protected void RCB_AnalysisTyp_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
            if (Session["commandName"].Equals("Edit"))
            {
                string AnalysTyps = Session["analysTyps"].ToString();
                RadComboBox rcb = (RadComboBox)sender;

                List<string> AnalysTyps_list = AnalysTyps.Split(',').ToList();
                if (AnalysTyps_list.Contains(e.Item.Value))
                {
                    e.Item.Checked = true;
                    sbValues.Add(e.Item.Value.ToString());
                    sbValues.Add(",");
                }

                if (sbValues.ToString().EndsWith(","))
                {
                    sbValues.RemoveAt(sbValues.Count - 1);

                    string AnalysisTypes = sbValues.ToString();
                    if (AnalysisTypes != null)
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
}