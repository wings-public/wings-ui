using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.Management.uc
{
    public partial class uc_RequestDataset : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                RG_User_Req.Rebind();
        }

        protected void RG_AvailableDataset_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
          
        }

        protected void RG_AvailableDataset_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if(e.CommandName.Equals("RequestDS"))
            {
                GridDataItem item = (GridDataItem)e.Item;
                string DS = item.GetDataKeyValue("DatasetID").ToString();
                Session["RquestDS_DSID"] = DS;

                Session["RquestDS_PIName"] = DDL_PIs.SelectedItem.Text;

                string message = "openWin();";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);

            }
           
        }

        //protected void btn_Ask_Permission_Sample_Click(object sender, EventArgs e)
        //{
        //    if (DDL_Centers.SelectedValue.Equals("-1") || DDL_PIs.SelectedValue.Equals("-1"))
        //    {
        //       ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b> Please select a center and PI first!!</b><br />');", true);

        //    }
        //    else { 
        //        Session["Ask_Sample_Permision_CenterId"] = DDL_Centers.SelectedValue.ToString();
        //        Session["Ask_Sample_Permision_PIId"] = DDL_PIs.SelectedValue.ToString();
        //        Session["Ask_Sample_Permision_PIName"] = DDL_PIs.SelectedItem.Text;

        //        string SampleList = String.Empty;
        //        string FinalList = String.Empty;
        //        int selectedItem = RG_PI_DS_Samples.MasterTableView.GetSelectedItems().Length;
        //        foreach (GridDataItem item in RG_PI_DS_Samples.SelectedItems)
        //        {
        //            if (((selectedItem > 0) && (selectedItem < 51)))
        //            {
        //                if (selectedItem == 1)
        //                    SampleList = item["SampleID"].Text;
        //                else
        //                {
        //                    SampleList = item["SampleID"].Text + ',' + SampleList;
        //                }
        //            }
        //        }
        //        if (!((selectedItem > 0) && (selectedItem < 51)))
        //        {
        //            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Minimum and Maximum number of samples which can be selected are 0 and 50 respectfully!</b><br />');", true);
        //            return;
        //        }
        //        if (selectedItem > 1)
        //            SampleList = SampleList.Substring(0, SampleList.Length - 1);
        //        Session["Ask_Sample_Permision_SampleList"] = SampleList;
        //        ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", "AskDatasetPermission_Sample()", true);
        //    }

        //}
    }
}