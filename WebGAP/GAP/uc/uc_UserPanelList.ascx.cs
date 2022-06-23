using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.GAP.uc
{
    public partial class uc_UserPanelList : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void RG_UPanel_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "EditUP")
            {

                GridDataItem item = (GridDataItem)e.Item;
                Session["UPanel_Id"] = item.GetDataKeyValue("UPanelID").ToString();
                Session["SelectedRefBuild"] = item.GetDataKeyValue("RefBuild").ToString();

                if (!String.IsNullOrEmpty(item.GetDataKeyValue("UPanelID").ToString()) &&
                    !String.IsNullOrEmpty(item.GetDataKeyValue("RefBuild").ToString()) &&
                    Session["WiNGSMasterId"] != null && Session["Current_CenterID"]!= null)
                {
                    string message = "OpenWin_EditPanelList();";
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"alert('The session is not authenticated! <br/> Please go back to the homepage and select your center!');", true);
                }
            }
        }

        protected void RadAjaxManager1_AjaxRequest(object sender, AjaxRequestEventArgs e)
        {
            RG_UPanel.Rebind();
        }

        protected void RCB_RefBuild_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            GridItem cmdItem = RG_UPanel.MasterTableView.GetItems(GridItemType.CommandItem)[0];
            RadButton RTB_AddUP = cmdItem.FindControl("RTB_AddUP") as RadButton;
            RTB_AddUP.CssClass = RTB_AddUP.CssClass.Replace("disabledDiv", "");
            
        }

        protected void RTB_AddUP_Click(object sender, EventArgs e)
        {
            GridItem cmdItem = RG_UPanel.MasterTableView.GetItems(GridItemType.CommandItem)[0];
            RadComboBox RCB_RefBuild = cmdItem.FindControl("RCB_RefBuild") as RadComboBox;

            Session["RefBuild"] = RCB_RefBuild.SelectedValue;

            string message = "RB_AddUP_Clicked();";
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
        }
    }
}