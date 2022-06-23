using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.GAP.uc
{
    public partial class uc_Res_Req_1 : System.Web.UI.UserControl
    {
        bool firstLoadRG = false;

        #region "CnnStr"{
        string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}

        protected void Page_Load(object sender, EventArgs e)
        {
            foreach (GridDataItem item in RG_SampleVariant_Condition.MasterTableView.Items)
            {
                if (!item.Expanded)
                {
                    GridNestedViewItem nestedItem = (GridNestedViewItem)item.ChildItem;
                    setTriggeredItemValue(nestedItem, "pvs1");
                    setTriggeredItemValue(nestedItem, "ps1");
                    setTriggeredItemValue(nestedItem, "ps2");
                    setTriggeredItemValue(nestedItem, "ps3");
                    setTriggeredItemValue(nestedItem, "ps4");
                    setTriggeredItemValue(nestedItem, "pm1");
                    setTriggeredItemValue(nestedItem, "pm2");
                    setTriggeredItemValue(nestedItem, "pm3");
                    setTriggeredItemValue(nestedItem, "pm4");
                    setTriggeredItemValue(nestedItem, "pm5");
                    setTriggeredItemValue(nestedItem, "pm6");
                    setTriggeredItemValue(nestedItem, "pp1");
                    setTriggeredItemValue(nestedItem, "pp2");
                    setTriggeredItemValue(nestedItem, "pp3");
                    setTriggeredItemValue(nestedItem, "pp4");
                    setTriggeredItemValue(nestedItem, "pp5");
                    setTriggeredItemValue(nestedItem, "ba1");
                    setTriggeredItemValue(nestedItem, "bs1");
                    setTriggeredItemValue(nestedItem, "bs2");
                    setTriggeredItemValue(nestedItem, "bs3");
                    setTriggeredItemValue(nestedItem, "bs4");
                    setTriggeredItemValue(nestedItem, "bp1");
                    setTriggeredItemValue(nestedItem, "bp2");
                    setTriggeredItemValue(nestedItem, "bp3");
                    setTriggeredItemValue(nestedItem, "bp4");
                    setTriggeredItemValue(nestedItem, "bp5");
                    setTriggeredItemValue(nestedItem, "bp6");
                    setTriggeredItemValue(nestedItem, "bp7");
                    setTriggeredItemValue(nestedItem, "bp8");

                    /* Label lbl_ps1 = (Label)nestedItem.FindControl("lbl_ps1");
                     if (lbl_ps1.Text == "n.a.") 
                         lbl_ps1.Attributes.Add("Class", "naTriggerd");
                     else if ((lbl_ps1.Text.ToLower()).Contains("true")) 
                         lbl_ps1.Attributes.Add("Class", "trueTriggerd");
                     else if ((lbl_ps1.Text.ToLower()).Contains("false"))
                         lbl_ps1.Attributes.Add("Class", "falseTriggerd");
                     lbl_ps1.Text = "PS1";*/

                }
            }

            if (!IsPostBack)
            {
                firstLoadRG = true;

            }
        }

        protected void setTriggeredItemValue(GridNestedViewItem nestedItem, string lblID)
        {
            Label lbl = (Label)nestedItem.FindControl(lblID);
            if (lbl.Text == "n.a.")
                lbl.Attributes.Add("Class", "naTriggerd");
            else if ((lbl.Text.ToLower()).Contains("true"))
                lbl.Attributes.Add("Class", "trueTriggerd");
            else if ((lbl.Text.ToLower()).Contains("false"))
                lbl.Attributes.Add("Class", "falseTriggerd");
            lbl.Text = lblID.ToUpper();
        }

        protected void RG_GapDataSharing_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;

                Label lbl_freq = (Label)item.FindControl("lbl_freq");
                var pg = (HtmlControl)item.FindControl("divBar");
                string percentage = Convert.ToUInt32(Convert.ToDecimal(lbl_freq.Text) * 100) + "px";
                pg.Style.Add("width", percentage);

                HiddenField hdn_access = (HiddenField)item.FindControl("hdn_access");
                string access = hdn_access.Value.ToString();
                Image img_access = (Image)item.FindControl("img_access");
                switch (access)
                {
                    case "1":
                        img_access.ImageUrl = "/img/icon/icon_active.png";
                        img_access.ToolTip = "You have access.";
                        break;
                    case "0":
                        img_access.ImageUrl = "/img/icon/icon_inactive.png";
                        img_access.ToolTip = "You do not have access.";
                        break;
                    default:
                        img_access.ImageUrl = "/img/icon/notfound.png";
                        img_access.ToolTip = "Unknown";
                        break;
                }


            }
        }

        protected void RG_GapDataSharing_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "StatsNav")
            {
                GridDataItem item = (GridDataItem)e.Item;

                string chr = item.GetDataKeyValue("CHR").ToString();
                string start_pos = item.GetDataKeyValue("START").ToString();
                string end_pos = item.GetDataKeyValue("END").ToString();
                string alt = item.GetDataKeyValue("ALT").ToString();
                string reference = item.GetDataKeyValue("REF").ToString();


                Session["Chr"] = chr;
                Session["StartPos"] = start_pos;
                Session["EndtPos"] = end_pos;
                Session["Alt"] = alt;
                Session["Rfrnc"] = reference;

                string message = "OpenWin_Request_1();";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);

                //Response.Redirect(String.Format("Results.aspx"));
            }

        }

        protected void RG_SampleVariant_Condition_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                //GridNestedView gnv = (GridNestedViewItem)e.Item.n

                Image img_classification = (Image)item.FindControl("img_classification");
                HiddenField hdn_classification = (HiddenField)item.FindControl("hdn_classification");
                string phenotype = hdn_classification.Value.ToString();
                switch (phenotype)
                {
                    case "pathogenic":
                        img_classification.ImageUrl = "/img/clinvar/pathogenic.png";
                        img_classification.ToolTip = "Pathogenic";
                        break;
                    case "Likely pathogenic":
                        img_classification.ImageUrl = "/img/clinvar/likely-pathogenic.png";
                        img_classification.ToolTip = "Likely Pathogenic";
                        break;
                    case "Uncertain significance":
                        img_classification.ImageUrl = "/img/clinvar/unknown-significance.png";
                        img_classification.ToolTip = "Uncertain significance";
                        break;
                    case "Conflicting data":
                        img_classification.ImageUrl = "/img/clinvar/conflicting-data.png";
                        img_classification.ToolTip = "Conflicting data";
                        break;
                    case "Benign":
                        img_classification.ImageUrl = "/img/clinvar/benign.png";
                        img_classification.ToolTip = "Benign";
                        break;
                    case "Likely Benign":
                        img_classification.ImageUrl = "/img/clinvar/likely-benign.png";
                        img_classification.ToolTip = "Likely Benign";
                        break;
                    default:
                        img_classification.ImageUrl = "/img/clinvar/other.png";
                        img_classification.ToolTip = "Other";
                        break;
                }
                Image img_inheritance = (Image)item.FindControl("img_inheritance");
                HiddenField hdn_inheritance = (HiddenField)item.FindControl("hdn_inheritance");



                string inheritance = hdn_inheritance.Value.ToString();
                if (inheritance.Contains("|"))
                {
                    string[] splitedWithLineValue = inheritance.Split('|');
                    if (splitedWithLineValue.Length <= 2 && (splitedWithLineValue[0] == "null" || splitedWithLineValue[1] == "null"))
                    {
                        img_inheritance.ImageUrl = "/img/icon/icon_null.png";
                        img_inheritance.ToolTip = "Null";
                    }
                    else
                    {
                        foreach (var item_inheritance in splitedWithLineValue)
                        {
                            switch (item_inheritance)
                            {
                                case "Autosomal dominant":
                                    img_inheritance.ImageUrl = "/img/icon/icon_autoDom.png";
                                    img_inheritance.ToolTip = "Autosomal dominant";
                                    //lbl_inhrt.Text = "Autosomal dominant";
                                    break;
                                case "Autosomal recessive":
                                    img_inheritance.ImageUrl = "/img/icon/icon_autoReces.png";
                                    img_inheritance.ToolTip = "Autosomal recessive";
                                    //lbl_inhrt.Text = "Autosomal recessive";
                                    break;
                                case "Digenic recessive":
                                    img_inheritance.ImageUrl = "/img/icon/icon_recessive.png";
                                    img_inheritance.ToolTip = "Digenic recessive";
                                    //lbl_inhrt.Text = "Digenic recessive";
                                    break;
                                case "X-linked":
                                    img_inheritance.ImageUrl = "/img/icon/icon_xlinked.png";
                                    img_inheritance.ToolTip = "X-linked";
                                    //lbl_inhrt.Text = "X-linked";
                                    break;
                                    //default:
                                    //    Image img_inheritance_default = new Image();
                                    //    img_inheritance_default.ImageUrl = "/img/icon/icon_null.png";
                                    //    img_inheritance_default.ToolTip = "Null";
                                    //    div_img_inheritance_holder.Controls.Add(img_inheritance_default);
                                    //    break;
                            }
                        }
                    }
                }
            }
        }

        protected void RG_GapDataSharing_PreRender(object sender, EventArgs e)
        {
                var con = RG_GapDataSharing.MasterTableView.Items.Count;
                if (RG_GapDataSharing.MasterTableView.Items.Count > 0 && firstLoadRG)
                {
                RG_GapDataSharing.MasterTableView.Items[0].Selected = true;
                    RG_SampleVariant_Detail.DataBind();
                    RG_SampleVariant_Condition.DataBind();
                    firstLoadRG = false;
                }
        }

        protected void RG_SampleVariant_Detail_ItemDataBound(object sender, GridItemEventArgs e)
        {
            string refSeq = null;

            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;

               

                RadRadialGauge rg_dnn = (RadRadialGauge)item.FindControl("RG_DANN");
                HiddenField hdn_dnn = (HiddenField)item.FindControl("hdn_scoreD");

                
                rg_dnn.Pointer.Value = Convert.ToDecimal(hdn_dnn.Value.ToString());

                HiddenField hdn_polyphen = (HiddenField)item.FindControl("hdn_polyphen");
                Label lbl_polyphen2 = (Label)item.FindControl("lbl_polyphen2");
                if (hdn_polyphen.Value == "D")
                    lbl_polyphen2.Text = "DAMAGING";
                else if (hdn_polyphen.Value == "T")
                    lbl_polyphen2.Text = "TOLERATED";
                else
                    lbl_polyphen2.Text = "<h5>There are no items to be displayed.</h5>";

                HiddenField hdn_sift = (HiddenField)item.FindControl("hdn_sift");
                Label lbl_sift = (Label)item.FindControl("lbl_sift");
                if (hdn_sift.Value == "D")
                    lbl_sift.Text = "DAMAGING";
                else if (hdn_sift.Value == "T")
                    lbl_sift.Text = "TOLERATED";
                else
                    lbl_sift.Text = "<h5>There are no items to be displayed.</h5>";


                RadListView listvw = (RadListView)item.FindControl("UnorderedListView");
                HiddenField hdn_clinvar_clinic = (HiddenField)item.FindControl("hdn_clinvarr_clinical");
                string value = hdn_clinvar_clinic.Value.ToString();
                string[] splitedValue = value.Split('/');
                listvw.Items.Clear();

                foreach (var splited in splitedValue)
                {
                    Label lbl = new Label();

                    lbl.Text = splited.ToString();
                    listvw.Controls.Add(lbl);
                    listvw.Controls.Add(new Literal() { Text = "<br/>" });
                }

                HtmlTable tbl = (HtmlTable)item.FindControl("tbl_transcripts");
                HtmlTableRow tr_transcripts_count = (HtmlTableRow)item.FindControl("tr_transcripts_count");
                HtmlTableRow tr_transcripts_tab = (HtmlTableRow)item.FindControl("tr_transcripts_collapse_tab");
                HtmlTableRow tr_transcripts_detail = (HtmlTableRow)item.FindControl("tr_transcripts_detail");

                HtmlTableCell cell_tab = new HtmlTableCell();
                HtmlGenericControl div_cell_tab = new HtmlGenericControl("div");

                HiddenField hdn_other_transcript = (HiddenField)item.FindControl("hdn_other_transcripts");
                string valueTranscripts = hdn_other_transcript.Value.ToString();

                if (valueTranscripts.Contains("|"))
                {
                    string[] splitedWithLineValue = valueTranscripts.Split('|');

                    HtmlTableCell cell_count = new HtmlTableCell();
                    HtmlTableRow row_count = new HtmlTableRow();

                    var lbl_count = new Label();
                    lbl_count.Text = "<b>Number of Transcpripts : </b>" + splitedWithLineValue.Length.ToString();
                    cell_count.ColSpan = 3;
                    cell_count.Controls.Add(lbl_count);
                    tr_transcripts_count.Cells.Add(cell_count);
                    tbl.Rows.Add(row_count);
                    var index = 0;
                    foreach (var splitedWithLine in splitedWithLineValue)
                    {
                        if (splitedWithLine.Contains(":"))
                        {

                            string[] splitedWithDoubleDotValue = splitedWithLine.Split(':');
                            index++;
                            HtmlTableCell cell = new HtmlTableCell();
                            HtmlTableRow row = new HtmlTableRow();

                            HtmlTableRow row_icon = new HtmlTableRow();
                            HtmlTableCell cell_icon = new HtmlTableCell();
                            HtmlInputButton btn_icon = new HtmlInputButton();
                            cell_icon.ColSpan = 3;
                            //btn_icon.Attributes.Add("onclick", "onClickCollapseBtn()");
                            btn_icon.Attributes.Add("id", "btn_collapse");
                            btn_icon.Attributes.Add("data-toggle", "collapse");
                            btn_icon.Attributes.Add("data-target", "#collapseExample");
                            btn_icon.Attributes.Add("class", "btnCollapse");
                            btn_icon.Attributes.Add("aria-expanded", "false");
                            btn_icon.Attributes.Add("aria-controls", "collapseExample");
                            btn_icon.Value = splitedWithDoubleDotValue[2].ToString();

                            div_cell_tab.Controls.Add(btn_icon);
                            div_cell_tab.Style.Add("padding-bottom", "30px");
                            div_cell_tab.Style.Add("padding-top", "20px");

                            if (index >= splitedWithLineValue.Length)
                            {
                                cell_tab.Controls.Add(div_cell_tab);
                                tr_transcripts_tab.Cells.Add(cell_tab);
                            }

                            //tr_transcripts_detail.Cells.Add(cell_icon);
                            ////tbl_transcripts.Rows.Add(row_icon);

                            HtmlGenericControl div = new HtmlGenericControl("div");
                            div.Attributes.Add("runat", "server");
                            div.Attributes.Add("class", "collapse");
                            div.Attributes.Add("id", "collapseExample");

                            var lbl_gene = new Label();
                            var lbl_ref = new Label();
                            var lbl_effect = new Label();
                            var lbl_exonIntron = new Label();

                            // < a href = "#" runat = "server" id = "ncbi" >< img src = "../../img/tab-icon/ncbi.png" alt = "NCBI" /></ a >

                            //< a href = "#" runat = "server" id = "genecode" >< img src = "../../img/tab-icon/genecards.png" alt = "GeneCards" /></ a >

                            HtmlAnchor a_ncbi = new HtmlAnchor();
                            HtmlAnchor a_genecard = new HtmlAnchor();

                            HtmlImage img_ncbi = new HtmlImage();
                            HtmlImage img_genecard = new HtmlImage();

                            a_ncbi.Target = "_blank";
                            a_ncbi.HRef = "https://www.ncbi.nlm.nih.gov/gene/?term=" + splitedWithDoubleDotValue[0].ToString();

                            a_genecard.Target = "_blank";
                            a_genecard.HRef = "https://www.genecards.org/cgi-bin/carddisp.pl?gene=" + splitedWithDoubleDotValue[0].ToString();


                            img_ncbi.Attributes.Add("alt", "NCBI");
                            img_ncbi.Attributes.Add("src", "../../img/tab-icon/ncbi.png");
                            img_ncbi.Style.Add("width", "20px");

                            img_genecard.Attributes.Add("alt", "GeneCards");
                            img_genecard.Attributes.Add("src", "../../img/tab-icon/genecards.png");
                            img_genecard.Style.Add("width", "20px");

                            a_ncbi.Controls.Add(img_ncbi);
                            a_ncbi.Controls.Add(img_genecard);

                            lbl_gene.Text = "<b>Gene : </b>" + splitedWithDoubleDotValue[0].ToString() + "&nbsp;&nbsp;&nbsp;";
                            lbl_effect.Text = "<br/><b>Effect : </b>" + splitedWithDoubleDotValue[5].ToString() + "<br/>";
                            if (splitedWithDoubleDotValue[4].ToString() == "refSeq=.")
                            {
                                refSeq = "N/A";
                            }
                            else
                            {
                                refSeq = splitedWithDoubleDotValue[4].ToString();
                                string[] splitedrefSeqValue = valueTranscripts.Split('=');
                                refSeq = splitedrefSeqValue[1].ToString();
                            }
                            lbl_ref.Text = "<br/><b>RefSeq ID : </b>" + refSeq + "&nbsp;&nbsp;&nbsp;";

                            lbl_exonIntron.Text = "<br/><b>Exon/Intron : </b>" + splitedWithDoubleDotValue[1].ToString();


                            div.Controls.Add(lbl_gene);
                            div.Controls.Add(a_ncbi);
                            div.Controls.Add(lbl_effect);
                            div.Controls.Add(lbl_ref);
                            div.Controls.Add(lbl_exonIntron);

                            cell.ColSpan = 3;

                            cell.Controls.Add(div);

                            if (index >= splitedWithLineValue.Length)
                            {

                                tr_transcripts_tab.Cells.Add(cell);
                            }
                            //tbl_transcripts.Rows.Add(tr_transcripts_detail);
                        }
                    }
                }
                else
                {
                    Label lbl = new Label();
                    lbl.Text = "<h5>There are no items to be displayed. </h5>";
                    HtmlTableCell cell = new HtmlTableCell();
                    cell.Controls.Add(lbl);
                    tr_transcripts_tab.Cells.Add(cell);
                }
            }
        }



        protected void UnorderedListView_ItemDataBound(object sender, RadListBoxItemEventArgs e)
        {
            RadListBoxItem item = (RadListBoxItem)e.Item;
            RadListBox listvw = (RadListBox)sender;
            HiddenField hdn_clinvar_clinic = (HiddenField)listvw.Header.FindControl("hdn_clinvarr_clinical");
            string value = hdn_clinvar_clinic.Value.ToString();
            string[] splitedValue = value.Split('/');
            listvw.Items.Clear();

            foreach (var splited in splitedValue)
            {

                RadListBoxItem listvw_item = new RadListBoxItem(splited);

                Label lbl = (Label)listvw_item.FindControl("lbl_clinvarclinical");
                lbl.Text = splited.ToString();
                listvw.Items.Add(listvw_item);

            }

        }
    }
}