using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.GAP.uc
{
    public partial class uc_ExoneLoss_AllSamples : System.Web.UI.UserControl
    {

        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion} 


        protected void Page_Load(object sender, EventArgs e)
        { }

        protected void RG_Samples_Exoneloss_ItemCommand(object sender, GridCommandEventArgs e)
        {

            if (e.CommandName == "GoToExoneLoss")
            {
                GridDataItem item = (GridDataItem)e.Item;
                string SampleID = item.GetDataKeyValue("SampleID").ToString();
                Response.Redirect(String.Format("/GAP/ExoneLoss_PerSample.aspx?SampleID=" + SampleID));
            }

        }


        protected void RG_Samples_Exoneloss_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;

                HiddenField hdUpD = (HiddenField)item.FindControl("hdn_HasExoneLoss");
                string spUpD = hdUpD.Value.ToString();

                ImageButton imgBtn_EL = (ImageButton)item.FindControl("GoToExoneLoss");

                switch (spUpD)
                {
                    case "0":
                        imgBtn_EL.Enabled = false;
                        imgBtn_EL.Style.Add("opacity", "0.2");
                        imgBtn_EL.Style.Add("cursor", "not-allowed");
                        //imgBtn_EL.Visible = false;
                        break;
                    case "1":
                        imgBtn_EL.Enabled = true;
                        imgBtn_EL.Attributes.Remove("Class");
                        imgBtn_EL.Style.Add("opacity", "1");
                        imgBtn_EL.Style.Add("cursor", "pointer");
                        //imgBtn_EL.Visible = true;
                        break;
                }

            }
        }

        
    }
}