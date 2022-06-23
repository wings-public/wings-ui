using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.Management.uc
{
    public partial class uc_User_Private_Dataset : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

   
       
        protected void RG_DPS_Dataset_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                if (item.OwnerTableView.Name.Equals("Master"))
                {
                    string DatasetID = item.GetDataKeyValue("UserDatasetID").ToString();

                    ImageButton img = (ImageButton)item.FindControl("newreq");
                    img.Attributes.Add("onclick", "openWin(" + DatasetID + ");return false;");
                    //  item.Selected = true;
                }
            }
        }

        protected void RG_DPS_Dataset_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("newReq"))
            {
                GridDataItem item = (GridDataItem)e.Item;
                Session["PrivateDS_UserDatasetID"] = item["UserDatasetID"].Text;
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", "openWin()", true);

            }

        }
    }
}