using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.ACL.uc
{
    public partial class uc_IndividualSet : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["WiNGSUserType"].ToString().Equals("0"))
            {
                ListItem li = new ListItem();
                li.Text = "All Centers";
                li.Value = "-1";
                DDL_Centers.Items.Add(li);
                DDL_Centers.SelectedIndex = 0;
            }
        }

        protected void RG_Individualset_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                Telerik.Web.UI.GridDataItem item = (GridDataItem)e.Item;

                HiddenField hdnsp = (HiddenField)item.FindControl("hdn_Type");
                string sp = hdnsp.Value.ToString();
                ImageButton imgsp = (ImageButton)item.FindControl("Typebtn");
                switch (sp)
                {
                    case "0":
                        imgsp.ImageUrl = "/img/icon/icon_public.png";
                        imgsp.ToolTip = "Public";
                        imgsp.Width = 25;
                        break;
                    case "1":
                        imgsp.ImageUrl = "/img/icon/icon_private.png";
                        imgsp.ToolTip = "Private";
                        imgsp.Width = 25;
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

        protected void RG_Individualset_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Edit") || e.CommandName.Equals("InitInsert"))
            {

                if (DDL_Centers.SelectedValue.Equals("-1") || DDL_PIs.SelectedValue.Equals("-1"))
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Please select a center/PI first!</b><br />');", true);
                    e.Canceled = true;
                }
               
            }
        }
    }
}