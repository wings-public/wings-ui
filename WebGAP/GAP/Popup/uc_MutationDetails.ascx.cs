using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.GAP.Popup
{
    public partial class uc_MutationDetails : System.Web.UI.UserControl
    {
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
                        img_classification.ImageUrl = "/img/clinvar/likely pathogenic.png";
                        img_classification.ToolTip = "Likely Pathogenic";
                        break;
                    case "Uncertain significance":
                        img_classification.ImageUrl = "/img/clinvar/Uncertain significance.png";
                        img_classification.ToolTip = "Uncertain significance";
                        break;
                    case "Conflicting data":
                        img_classification.ImageUrl = "/img/clinvar/conflicting-data.gif";
                        img_classification.ToolTip = "Conflicting data";
                        break;
                    case "Benign":
                        img_classification.ImageUrl = "/img/clinvar/benign.png";
                        img_classification.ToolTip = "Benign";
                        break;
                    case "Likely Benign":
                        img_classification.ImageUrl = "/img/clinvar/likely benign.png";
                        img_classification.ToolTip = "Likely Benign";
                        break;
                    default:
                        img_classification.ImageUrl = "/img/clinvar/other.gif";
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
                        //lbl_inhrt.Text = "Null";
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


        protected void RG_SampleVariant_Detail_ItemDataBound(object sender, GridItemEventArgs e)
        {
            string refSeq = null;
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;

                //RadRadialGauge rg = (RadRadialGauge)item.FindControl("RadRadialGauge2");
                if (Session["InWhichOneExists"].Equals(2)) // in both exist
                {
                    Image img_M_Detail = (Image)item.FindControl("img_Male_Detail");
                    img_M_Detail.Visible = false;
                }
                if (!Session["InWhichOneExists"].Equals(2)) // in both exist
                {
                    Image img_M_Detail = (Image)item.FindControl("img_Male_Detail_SecondSample");
                    img_M_Detail.Visible = false;
                    //img_Female_Detail.Visible = false;
                }
                if (Session["InWhichOneExists"].Equals(1)) // only female
                {
                    Image img_F_Detail = (Image)item.FindControl("img_Male_Detail");
                    img_F_Detail.Visible = false;
                }
                if (Session["InWhichOneExists"].Equals(0)) // only male
                {
                    Image img_F_Detail = (Image)item.FindControl("img_Female_Detail");
                    img_F_Detail.Visible = false;
                }
                if (Session["InWhichOneExists"].Equals(2))
                {
                    Panel GeneralDetail = (Panel)item.FindControl("TwoSamples");
                    GeneralDetail.Visible = true;
                }
                else
                {
                    Panel GeneralDetail = (Panel)item.FindControl("OneSample");
                    GeneralDetail.Visible = true;
                }

                HiddenField hdn_af = (HiddenField)item.FindControl("hdn_af");

                //RadRadialGauge rg_dnn = (RadRadialGauge)item.FindControl("RG_DANN");
                HiddenField hdn_dnn = (HiddenField)item.FindControl("hdn_scoreD");

                // rg.Pointer.Value = Convert.ToDecimal(hdn_af.Value.ToString());
                // rg_dnn.Pointer.Value = Convert.ToDecimal(hdn_dnn.Value.ToString());
                HiddenField hdn_papi = (HiddenField)item.FindControl("hdn_papi");
                Label lbl_papi = (Label)item.FindControl("lbl_PaPI_pred_val");
                if (!String.IsNullOrEmpty(hdn_papi.Value))
                    lbl_papi.Text = FirstCharToUpper(hdn_papi.Value.ToLower());
                else
                    lbl_papi.Text = "<span>-</span>";


                HiddenField hdn_polyphen = (HiddenField)item.FindControl("hdn_polyphen");
                Label lbl_polyphen2 = (Label)item.FindControl("lbl_polyphen2");
                if (hdn_polyphen.Value == "D")
                    lbl_polyphen2.Text = "Damaging";
                else if (hdn_polyphen.Value == "T")
                    lbl_polyphen2.Text = "Tolerated";
                else
                    lbl_polyphen2.Text = "<span>-</span>";

                HiddenField hdn_sift = (HiddenField)item.FindControl("hdn_sift");
                Label lbl_sift = (Label)item.FindControl("lbl_sift");
                if (hdn_sift.Value == "D")
                    lbl_sift.Text = "Damaging";
                else if (hdn_sift.Value == "T")
                    lbl_sift.Text = "Tolerated";
                else
                    lbl_sift.Text = "<span>-</span>";

                HiddenField hdn_psee = (HiddenField)item.FindControl("hdn_psee");
                Label lbl_psee = (Label)item.FindControl("lbl_psee");
                if (hdn_psee.Value == "D")
                    lbl_psee.Text = "Damaging";
                else if (hdn_psee.Value == "T")
                    lbl_psee.Text = "Tolerated";
                else
                    lbl_psee.Text = "<span>-</span>";

                RadListView RLV_SeqFeature = (RadListView)item.FindControl("RLV_SeqFeature");
                HiddenField hdn_seqFeature = (HiddenField)item.FindControl("hdf_seqFeature");
                string value_seqFeature = hdn_seqFeature.Value.ToString();
                List<string> splitedValue_seqFeature = value_seqFeature.Split(',').Distinct().ToList();
                RLV_SeqFeature.Items.Clear();

                foreach (var splited in splitedValue_seqFeature)
                {
                    Label lbl = new Label();
                    lbl.Text = "&#9656; " + splited.ToString().Replace('_', ' ');
                    RLV_SeqFeature.Controls.Add(lbl);
                    RLV_SeqFeature.Controls.Add(new Literal() { Text = "<br/>" });
                }

                RadListView RLV_RefSeq = (RadListView)item.FindControl("RLV_RefSeq");
                HiddenField hdf_refSeq = (HiddenField)item.FindControl("hdf_refSeq");
                string value_refSeq = hdf_refSeq.Value.ToString();
                List<string> splitedValue_refSeq = value_refSeq.Split('|').Distinct().ToList();
                RLV_RefSeq.Items.Clear();

                foreach (var splited in splitedValue_refSeq)
                {
                    Label lbl = new Label();
                    lbl.Text = "&#9656; " + splited.ToString().Replace('_', ' ');
                    RLV_RefSeq.Controls.Add(lbl);
                    RLV_RefSeq.Controls.Add(new Literal() { Text = "<br/>" });
                }

                //-----------------------------General detail - Effect
                RadListView RLV_effect = (RadListView)item.FindControl("RLV_effect1");
                HiddenField hdf_effect = (HiddenField)item.FindControl("hdn_effect1");
                string value_effect = hdf_effect.Value.ToString();
                List<string> splitedValue_effect = value_effect.Split('&').Distinct().ToList();
                RLV_effect.Items.Clear();

                foreach (var splited in splitedValue_effect)
                {
                    Label lbl = new Label();
                    lbl.Text = "&#9656; " + splited.ToString().Replace('_', ' ');
                    RLV_effect.Controls.Add(lbl);
                    RLV_effect.Controls.Add(new Literal() { Text = "<br/>" });
                }

                RadListView RLV_effect2 = (RadListView)item.FindControl("RLV_effect2");
                HiddenField hdf_effect2 = (HiddenField)item.FindControl("hdn_effect2");
                string value_effect2 = hdf_effect2.Value.ToString();
                List<string> splitedValue_effect2 = value_effect2.Split('&').Distinct().ToList();
                RLV_effect2.Items.Clear();

                foreach (var splited in splitedValue_effect2)
                {
                    Label lbl = new Label();
                    lbl.Text = "&#9656; " + splited.ToString().Replace('_', ' ');
                    RLV_effect2.Controls.Add(lbl);
                    RLV_effect2.Controls.Add(new Literal() { Text = "<br/>" });
                }

                //-----------------------------ClinVar Clinical significance and ClinVar RCV
                RadListView listvw_clinvar_clincal = (RadListView)item.FindControl("RLV_clinvar_clincal");
                HiddenField hdn_clinvar_clinic = (HiddenField)item.FindControl("hdn_clinvar_clinic");
                HiddenField hdn_clinvar_rcv = (HiddenField)item.FindControl("hdn_clinvar_rcv");


                string value_clinvar_clinic = hdn_clinvar_clinic.Value.ToString();
                string value_clinvar_rcv = hdn_clinvar_rcv.Value.ToString();

                string[] splitedValue_clinvar_clinic = value_clinvar_clinic.Split('|');
                string[] splitedValue_clinvar_rcv = value_clinvar_rcv.Split('|');

                listvw_clinvar_clincal.Items.Clear();

                for (int i = 0; i < splitedValue_clinvar_clinic.Length; i++)
                {
                    Label lbl = new Label();
                    string _samplestring = "<a href='{0}' target='{1}'> {2} </a>";
                    string _url = "https://www.ncbi.nlm.nih.gov/clinvar/" + splitedValue_clinvar_rcv[i].ToString();
                    string _target = "_blank";
                    lbl.Text = "&#9656; " + string.Format(_samplestring, _url, _target, splitedValue_clinvar_rcv[i].ToString() + " : " + splitedValue_clinvar_clinic[i]);

                    //lbl.Text = "&#9656; " + splitedValue_clinvar_rcv[i].ToString() + " : "+ splitedValue_clinvar_clinic[i];
                    listvw_clinvar_clincal.Controls.Add(lbl);
                    listvw_clinvar_clincal.Controls.Add(new Literal() { Text = "<br/>" });
                }
                //-----------------------------ClinVar PMIDS
                RadListView listvw_clinvar_pmids = (RadListView)item.FindControl("RLV_clinVar_PMIDS");
                HiddenField hdn_clinvar_pmids = (HiddenField)item.FindControl("hdn_clinvar_pmids");
                string value_clinvar_pmids = hdn_clinvar_pmids.Value.ToString();
                List<string> splitedValue_clinvar_pmids = value_clinvar_pmids.Split(',').Distinct().ToList();

                listvw_clinvar_pmids.Items.Clear();

                foreach (var splited in splitedValue_clinvar_pmids)
                {
                    Label lbl = new Label();
                    string _samplestring = "<a href='{0}' target='{1}'> {2} </a>";
                    string _url = "https://www.ncbi.nlm.nih.gov/pubmed/" + splited.ToString();
                    string _target = "_blank";
                    lbl.Text = "&#9656; " + string.Format(_samplestring, _url, _target, splited.ToString());

                    //lbl.Text = "&#9656; " + splited.ToString();
                    listvw_clinvar_pmids.Controls.Add(lbl);
                    listvw_clinvar_pmids.Controls.Add(new Literal() { Text = "<br/>" });
                }

                //-----------------------------ClinVar hotSpot
                RadListView listvw_clinvar_hotspot = (RadListView)item.FindControl("RLV_clinVar_hotspot");
                HiddenField hdn_clinvar_hotspot = (HiddenField)item.FindControl("hdn_clinvar_hotspot");
                string value_clinvar_hotspot = hdn_clinvar_hotspot.Value.ToString();
                string[] splitedValue_clinvar_hotspot = value_clinvar_hotspot.Split('|');
                listvw_clinvar_hotspot.Items.Clear();

                for (int i = 0; i < splitedValue_clinvar_hotspot.Length; i++)
                {
                    switch (i)
                    {
                        case 0:
                            Label lbl1 = new Label();
                            lbl1.Text = "The length in bases of the hotspot region : " + splitedValue_clinvar_hotspot[0].ToString();
                            listvw_clinvar_hotspot.Controls.Add(lbl1);
                            listvw_clinvar_hotspot.Controls.Add(new Literal() { Text = "<br/>" });
                            break;
                        case 1:
                            Label lbl2 = new Label();
                            lbl2.Text = "The number of pathogenic variants clustered in the hotspot : " + splitedValue_clinvar_hotspot[1].ToString();
                            listvw_clinvar_hotspot.Controls.Add(lbl2);
                            listvw_clinvar_hotspot.Controls.Add(new Literal() { Text = "<br/>" });
                            break;
                        case 2:
                            Label lbl3 = new Label();
                            lbl3.Text = "The percentage of altered bases in the hotspot region : " + splitedValue_clinvar_hotspot[2].ToString();
                            listvw_clinvar_hotspot.Controls.Add(lbl3);
                            listvw_clinvar_hotspot.Controls.Add(new Literal() { Text = "<br/>" });
                            break;
                        default:
                            Label lbl = new Label();
                            lbl.Text = "-";
                            listvw_clinvar_hotspot.Controls.Add(lbl);
                            listvw_clinvar_hotspot.Controls.Add(new Literal() { Text = "<br/>" });
                            break;
                    }

                }

                //-----------------------------ClinVar rev Status
                RadListView RLV_clinvar_status = (RadListView)item.FindControl("RLV_clinvar_status");
                HiddenField hdn_clinvar_status = (HiddenField)item.FindControl("hdn_clinvar_status");
                string value_clinvar_status = hdn_clinvar_status.Value.ToString();
                List<string> splitedValue_clinvar_status = value_clinvar_status.Split('|').Distinct().ToList();
                RLV_clinvar_status.Items.Clear();

                foreach (var splited in splitedValue_clinvar_status)
                {
                    Label lbl = new Label();
                    lbl.Text = "&#9656; " + splited.ToString();
                    RLV_clinvar_status.Controls.Add(lbl);
                    RLV_clinvar_status.Controls.Add(new Literal() { Text = "<br/>" });
                }


                //-----------------------------ClinVar traits
                RadListView RLV_clinVar_traits = (RadListView)item.FindControl("RLV_clinVar_traits");
                HiddenField hdn_clinvar_traits = (HiddenField)item.FindControl("hdn_clinvar_traits");
                string value_clinvar_traits = hdn_clinvar_traits.Value.ToString();
                List<string> splitedValue_clinvar_traits = value_clinvar_traits.Split('|').Distinct().ToList();
                RLV_clinVar_traits.Items.Clear();

                foreach (var splited in splitedValue_clinvar_traits)
                {
                    Label lbl = new Label();
                    lbl.Text = "&#9656; " + splited.ToString();
                    RLV_clinVar_traits.Controls.Add(lbl);
                    RLV_clinVar_traits.Controls.Add(new Literal() { Text = "<br/>" });
                }

                //-----------------------------External link - dbSNP
                HyperLink hl_ncbl_dbsnp = (HyperLink)item.FindControl("hl_ncbl_dbsnp");
                HiddenField hdn_ncbl_dbsnp = (HiddenField)item.FindControl("hdn_ncbl_dbsnp");
                if (hdn_ncbl_dbsnp.Value.Equals("."))
                {
                    hl_ncbl_dbsnp.NavigateUrl = "#";
                    hl_ncbl_dbsnp.Text = "no item";
                    //hl_ncbl_dbsnp.Visible = false;
                }
                else
                {
                    //hl_ncbl_dbsnp.Visible = true;
                    hl_ncbl_dbsnp.NavigateUrl = "https://www.ncbi.nlm.nih.gov/snp/rs" + hdn_ncbl_dbsnp.Value;
                    hl_ncbl_dbsnp.Text = "NCBI(dbSNP: RS" + hdn_ncbl_dbsnp.Value + " )";
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

        protected string FirstCharToUpper(string input)
        {
            switch (input)
            {
                case null: throw new ArgumentNullException(nameof(input));
                case "": throw new ArgumentException($"{nameof(input)} cannot be empty", nameof(input));
                default: return input.First().ToString().ToUpper() + input.Substring(1);
            }
        }

    }
}