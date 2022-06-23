using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Telerik.Web.UI;

namespace WebGAP.GAP.uc
{
    public partial class uc_Sample_Quality : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_CenterPI.Text = Session["Current_Center"].ToString() + ", " + Session["Current_PI"].ToString();
          
        }

        protected void RG_Samples_Quality_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "GoToQuality")
            {
                GridDataItem item = (GridDataItem)e.Item;
                string SampleID = item.GetDataKeyValue("SampleID").ToString();
                Session["SampleIDQuality_FASTQC"] = SampleID;
                // Response.Write("<script>window.open('QualityControl.aspx','_blank');</script>");
                String script = "window.open('QualityControl.aspx', 'myPopup')";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "someId", script, true);

            }
        }
    }
}