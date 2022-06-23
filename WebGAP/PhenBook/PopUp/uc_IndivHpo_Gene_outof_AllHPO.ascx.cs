using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.PhenBook.PopUp
{
    public partial class uc_IndivHpo_Gene_outof_AllHPO : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RG_HPO_Unique_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                GridDataItem dataItem = e.Item as GridDataItem;

                HiddenField hdnsp = (HiddenField)item.FindControl("hdn_exist");
                string sp = hdnsp.Value.ToString();
                ImageButton imgsp_yes = (ImageButton)item.FindControl("AA_yes");
                if (sp.Equals("1"))
                    imgsp_yes.Visible = true;
            }
        }
    }
}