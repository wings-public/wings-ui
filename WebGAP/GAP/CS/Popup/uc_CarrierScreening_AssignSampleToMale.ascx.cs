using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.GAP.CS.Popup
{
    public partial class uc_CarrierScreening_AssignSampleToMale : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void RG_SampleForMale_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem && !IsPostBack)
            {
                GridDataItem item = (GridDataItem)e.Item;
                if (item.OwnerTableView.Name.Equals("Master"))
                {
                    string SampleID = item.GetDataKeyValue("SampleID").ToString();
                    ImageButton img = (ImageButton)item.FindControl("AddSample");
                    img.Attributes.Add("onclick", "returnToParent(" + SampleID + ");return false;");

                }
            }

        }


        protected void RG_SampleForMale_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("RowClick"))
            {
                GridDataItem item = (GridDataItem)e.Item;
                string SampleID = item.GetDataKeyValue("SampleID").ToString();


                string message = "returnToParent(" + SampleID + ");";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);


            }
        }
    }
}