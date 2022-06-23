using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.GAP.Popup
{
    public partial class uc_HPO_SampleDiscovery : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion} 

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Tab_Selected"] = "";
            if ((Session["Tab_Selected"].ToString().Length > 1))
            {
                if (Session["Tab_Selected"].Equals("GenePhenotype_Selected"))
                {
                    //MP_Individual_Phenotypes.SelectedPageView = RPW_SelectedGene_Individual;
                    RTS_HPO_Indidivdual.SelectedIndex = 2;
                    RPW_SelectedGene_Individual.Selected = true;
                }
                else if (Session["Tab_Selected"].Equals("HPOPhenotype_Selected"))
                {
                    //MP_Individual_Phenotypes.SelectedPageView = RPW_SelectedGene_Individual;
                    RTS_HPO_Indidivdual.SelectedIndex = 0;
                    RPW_SelectedHPO_Individual.Selected = true;
                }
                else if (Session["Tab_Selected"].Equals("OMIMPhenotype_Selected"))
                {
                    RTS_HPO_Indidivdual.SelectedIndex = 1;
                    RPW_SelectedOMIM_Individual.Selected = true;
                }

            }
            else
            {
                RTS_HPO_Indidivdual.SelectedIndex = 0;
                RPW_SelectedHPO_Individual.Selected = true;
            }
        }

            protected void RG_SelectedHPO_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;

                GridDataItem dataItem = e.Item as GridDataItem;

                RadSlider SeverityVal = (RadSlider)item.FindControl("RS_Severity");
                HiddenField hdnseverityval = (HiddenField)item.FindControl("hdn_severityvaforshow");
                SeverityVal.SelectedValue = hdnseverityval.Value;

                LinkButton HPOID_LB = (LinkButton)item.FindControl("lbn_HPOID");
                string Txt_HPO = HPOID_LB.Text.ToString();


                string URL = "https://hpo.jax.org/app/browse/term/" + Txt_HPO;
                HPOID_LB.Attributes.Add("href", URL);
                HPOID_LB.Attributes.Add("target", "_blank");


                Label HpoId = (Label)item.FindControl("txt_HPOID");
                Label HpoName = (Label)item.FindControl("txt_HPO_Name");
                Label HpoStatus = (Label)item.FindControl("txt_HPO_Status");
                HiddenField hdnsp = (HiddenField)item.FindControl("hdn_HPO_Status");
                string sp = hdnsp.Value.ToString();
                ImageButton imgsp_yes = (ImageButton)item.FindControl("AA_yes");
                ImageButton imgsp_no = (ImageButton)item.FindControl("AA_no");
                ImageButton imgsp_na = (ImageButton)item.FindControl("AA_na");

                switch (sp)
                {
                    case "1":
                        HpoStatus.Attributes.CssStyle.Add("background-color", "#0CA29C !important");
                        HpoStatus.Attributes.CssStyle.Add("border-bottom-left-radius", " 10px !important");
                        HpoStatus.Attributes.CssStyle.Add("border-top-left-radius", " 10px !important");
                        HpoStatus.Attributes.CssStyle.Add("border-top-right-radius", " 10px !important");
                        HpoStatus.Attributes.CssStyle.Add("border-bottom-right-radius", " 10px !important");
                        HpoStatus.Attributes.CssStyle.Add("padding", " 5px !important");
                        HpoStatus.Attributes.CssStyle.Add("cursor", "pointer");
                        HpoStatus.ToolTip = "Seen";
                        imgsp_yes.ImageUrl = "/img/icon/icon_test_yes_selected_15.png";

                        break;
                    case "0":

                        HpoStatus.Attributes.CssStyle.Add("background-color", "#f78f8f !important");
                        HpoStatus.Attributes.CssStyle.Add("border-bottom-left-radius", " 10px !important");
                        HpoStatus.Attributes.CssStyle.Add("border-top-left-radius", " 10px !important");
                        HpoStatus.Attributes.CssStyle.Add("border-top-right-radius", " 10px !important");
                        HpoStatus.Attributes.CssStyle.Add("border-bottom-right-radius", " 10px !important");
                        HpoStatus.Attributes.CssStyle.Add("padding", " 5px !important");
                        HpoStatus.Attributes.CssStyle.Add("cursor", "pointer");
                        HpoStatus.ToolTip = "Not Seen";
                        imgsp_no.ImageUrl = "/img/icon/icon_test_no_selected.png";
                        break;
                    case "2":
                        //imgsp.ImageUrl = "/img/icon/icon_NA.png";
                        //imgsp.ToolTip = "Not Applicable";
                        HpoStatus.Attributes.CssStyle.Add("background-color", "#6EB4E3 !important");
                        HpoStatus.Attributes.CssStyle.Add("border-bottom-left-radius", " 10px !important");
                        HpoStatus.Attributes.CssStyle.Add("border-top-left-radius", " 10px !important");
                        HpoStatus.Attributes.CssStyle.Add("border-top-right-radius", " 10px !important");
                        HpoStatus.Attributes.CssStyle.Add("border-bottom-right-radius", " 10px !important");
                        HpoStatus.Attributes.CssStyle.Add("padding", " 5px !important");
                        HpoStatus.Attributes.CssStyle.Add("cursor", "pointer");
                        HpoStatus.ToolTip = "Not Applicable";
                        imgsp_na.ImageUrl = "/img/icon/icon_test_NA_selected.png";
                        break;
                }

            }
        }

    
   
        protected void RG_OMIM_Association_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                LinkButton OMIM_LB = (LinkButton)item.FindControl("lbn_OMIMID");
                string Txt_Omim = OMIM_LB.Text.ToString();
                int startIndex = 5;
                int length = 6;
                String substring = Txt_Omim.Substring(startIndex, length);
                string URL = "https://omim.org/entry/" + substring;
                OMIM_LB.Attributes.Add("href", URL);
                OMIM_LB.Attributes.Add("target", "_blank");
            }
        }

    
        protected void RG_Gene_Association_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                LinkButton Gene_LB = (LinkButton)item.FindControl("lbn_Gene_Symbol");
                string Txt_Gene = Gene_LB.Text.ToString();

                string URL = "https://www.genecards.org/cgi-bin/carddisp.pl?gene=" + Txt_Gene;
                Gene_LB.Attributes.Add("href", URL);
                Gene_LB.Attributes.Add("target", "_blank");
            }

        }
    }
}