using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.GAP.Popup
{
    public partial class uc_IndividualForSample : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void RG_Individuals_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem && !IsPostBack)
            {
                GridDataItem item = (GridDataItem)e.Item;
                if (item.OwnerTableView.Name.Equals("Master"))
                {
                    string IndividualID = item.GetDataKeyValue("IndividualID").ToString();
                    ImageButton img = (ImageButton)item.FindControl("AddIndividual");
                    img.Attributes.Add("onclick", "returnToParent(" + IndividualID + ");return false;");

                    HiddenField MIndividual = (HiddenField)item.FindControl("hdn_MultiIndividual");
                    string MultiIndividual = MIndividual.Value.ToString();
                    if (MultiIndividual == "1")
                    {
                        RL_feedback.Attributes.Add("style", "padding: 8px;    background-color: #c5e9ea; border-radius: 26px; ");
                        RL_feedback.Text = "Warning: There an ambiguity in Individual";
                    }
                   
                }
            }
          
        }

        protected void RG_Individuals_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("RowClick"))
            {
                GridDataItem item = (GridDataItem)e.Item;
                string IndividualID = item.GetDataKeyValue("IndividualID").ToString();
                //  ImageButton img = (ImageButton)item.FindControl("AddIndividual");


                string message = "returnToParent(" + IndividualID + ");";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);


            }
        }
    }
}