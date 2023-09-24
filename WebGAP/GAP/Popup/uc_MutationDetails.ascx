<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_MutationDetails.ascx.cs" Inherits="WebGAP.GAP.Popup.uc_MutationDetails" %>

<link href=".././assets/css/MutationDetail_style.css" rel="stylesheet" type="text/css" media="screen" runat="server" />

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_SampleVariant_Detail">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_Report_Mutations" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_SampleVariant_Condition">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_SampleVariant_Condition" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30" Skin="Office2007" />

<div class="content-body pt-1">
    <section id="basic-form-layouts">
        <div class="row ">
            <div class="col-md-6">
                <div class="card" style="height:850px !important">
                    <div class="card-content ">
                        <div class="card-body  pt-0 pl-0">
                            <div class="form">
                                <div class="form-body">
                                    <h4 class="form-section">General Details</h4>

           <telerik:RadGrid RenderMode="Lightweight" ID="RG_SampleVariant_Detail" runat="server" GridLines="None" DataSourceID="Ds_SampleVariant_Detail"
                        AllowPaging="false" AllowSorting="True" ShowGroupPanel="true" AutoGenerateColumns="False" CellSpacing="0" CssClass="RG_SampleVariant_Detail"
                        OnItemDataBound="RG_SampleVariant_Detail_ItemDataBound">
                        <MasterTableView CommandItemDisplay="None" Name="Master" AutoGenerateColumns="false" BorderColor="Transparent" HeaderStyle-BorderColor="Transparent"
                            DataSourceID="Ds_SampleVariant_Detail" GridLines="None">

                            <Columns>
                                <telerik:GridTemplateColumn ColumnGroupName="SampleName">
                                    <HeaderStyle Width="18px" CssClass="hidden" />
                                    <ItemTemplate>

                                        <asp:HiddenField runat="server" ID="hdn_other_transcripts" Value='<%# Bind("OTHER_TRANSCRIPTS") %>' />

                                        <telerik:RadTabStrip RenderMode="Lightweight" runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage_DataHolder" Orientation="VerticalRight" Skin="Silk" SelectedIndex="0">
                                            <Tabs>
                                                <telerik:RadTab ImageUrl="/img/tab-icon/sample.png" SelectedImageUrl="/img/tab-icon/sample-hover.png" HoveredImageUrl="/img/tab-icon/sample-hover.png" ToolTip="Sample" Height="48px"></telerik:RadTab>
                                                <telerik:RadTab ImageUrl="/img/tab-icon/transcript.png" SelectedImageUrl="/img/tab-icon/transcript-hover.png" HoveredImageUrl="/img/tab-icon/transcript-hover.png" ToolTip="Transcripts" Height="48px"></telerik:RadTab>
                                                <telerik:RadTab ImageUrl="/img/tab-icon/ClinVar.png" SelectedImageUrl="/img/tab-icon/ClinVar-hover.png" HoveredImageUrl="/img/tab-icon/ClinVar-hover.png" ToolTip="ClinVar" Height="48px"></telerik:RadTab>
                                                <telerik:RadTab ImageUrl="/img/tab-icon/lab.png" SelectedImageUrl="/img/tab-icon/lab-hover.png" HoveredImageUrl="/img/tab-icon/lab-hover.png" ToolTip="Lab Knowledgebase" Height="48px"></telerik:RadTab>
                                                <telerik:RadTab ImageUrl="/img/tab-icon/finding.png" ToolTip="Lab Findings" Height="48px" SelectedImageUrl="/img/tab-icon/finding-hover.png" HoveredImageUrl="/img/tab-icon/finding-hover.png"></telerik:RadTab>
                                                <telerik:RadTab ImageUrl="/img/tab-icon/population.png" ToolTip="Population" Height="48px" SelectedImageUrl="/img/tab-icon/population-hover.png" HoveredImageUrl="/img/tab-icon/population-hover.png"></telerik:RadTab>
                                                <telerik:RadTab ImageUrl="/img/tab-icon/functional.png" ToolTip="Functional" Height="48px" SelectedImageUrl="/img/tab-icon/functional-hover.png" HoveredImageUrl="/img/tab-icon/functional-hover.png"></telerik:RadTab>
                                                <telerik:RadTab ImageUrl="/img/tab-icon/link.png" ToolTip="Link" Height="46px" CssClass="p-l-12" SelectedImageUrl="/img/tab-icon/link-hover.png" HoveredImageUrl="/img/tab-icon/link-hover.png"></telerik:RadTab>

                                            </Tabs>
                                        </telerik:RadTabStrip>

                                        <telerik:RadMultiPage ID="RadMultiPage_DataHolder" runat="server" CssClass="innerMultiPage" SelectedIndex="0">
                                            <telerik:RadPageView ID="RadPageView1" runat="server">
                                                <div class="rgHeader condition_title">
                                                    <span>General Details</span>
                                                </div>
                                                <asp:Panel runat="server" ID="TwoSamples" Visible="False">
                                                    <table class="pt-1 pr-0 pl-0">
                                                        <tr>
                                                            <td>
                                                                <b>Chr:Start-End : </b>
                                                                <asp:Label CssClass="pr-1" runat="server" ID="lbl_chrom" Text='<%# String.Concat(Eval("CHR")," : ",Eval("START")," - ",Eval("END")) %>' />
                                                                <b>GENE : </b>
                                                                <asp:Label runat="server" ID="lbl_gene" Text='<%# Bind("GENE") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>

                                                            <td colspan="3">
                                                                <b>Reference/Alternative : </b>
                                                                <asp:Label runat="server" ID="Lbl_refAlt" Text='<%# String.Concat(Eval("REF")," / ",Eval("ALT")) %>' />
                                                            </td>

                                                        </tr>
                                                    </table>
                                                    <div class="row pt-1">
                                                        <div class="col-6">
                                                            <table class="tbl-container">
                                                                <tr style="background-color: #eafff8">
                                                                    <td colspan="3">
                                                                        <asp:Image runat="server" ID="img_Female_Detail" src="/img/icon/Female_s.png" />
                                                                        <asp:Image ID="img_Male_Detail" src="/img/icon/Male_s.png" runat="server" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <b>Zygosity : </b>
                                                                        <asp:Label runat="server" ID="lbl_geno" Text='<%# Bind("GENO1") %>' />
                                                                    </td>
                                                                    <td>
                                                                        <b>Genotype Quality : </b>
                                                                        <asp:Label runat="server" ID="lbl_genoqual" Text='<%# Bind("GENO_QUAL1") %>' />
                                                                    </td>

                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <b>Filter : </b>
                                                                        <asp:Label runat="server" ID="lbl_filter" Text='<%# Bind("FILTER1") %>' />
                                                                    </td>
                                                                    <td>
                                                                        <b>Quality : </b>
                                                                        <asp:Label runat="server" ID="lbl_qual" Text='<%# Bind("QUAL1") %>' />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2">
                                                                        <b>Coverage (Alternate/Reference) : </b>
                                                                        <asp:Label runat="server" ID="lbl_cov" Text='<%# String.Concat(Eval("COV1")," (",Eval("AO1"),"/",Eval("RO1"),")") %>' />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2">
                                                                        <asp:HiddenField runat="server" ID="hdn_af" Value='<%# Bind("AF1") %>' />

                                                                        <%--<telerik:RadRadialGauge runat="server" ID="RadRadialGauge2" Height="50px" Skin="Bootstrap" Width="100px" CssClass="margin-left">
                                                                    <Pointer Value="2">
                                                                        <Cap Size="0.1" />
                                                                    </Pointer>
                                                                    <Scale Min="0" Max="1" MajorUnit="1" EndAngle="180" StartAngle="0">
                                                                        <Labels Format="{0}" Visible="False" />

                                                                        <Ranges>
                                                                            <telerik:GaugeRange Color="#FF0000" From="0" To="0.25" />
                                                                            <telerik:GaugeRange Color="#FFBF00" From="0.25" To="0.5" />
                                                                            <telerik:GaugeRange Color="#9FE357" From="0.5" To="0.75" />
                                                                            <telerik:GaugeRange Color="#00BF57" From="0.75" To="1" />
                                                                        </Ranges>
                                                                    </Scale>
                                                                </telerik:RadRadialGauge>--%>
                                                                        <b>Variant Allele Frequency :</b>
                                                                        <asp:Label runat="server" ID="Label1" Text='<%# Bind("AF1") %>' CssClass="padding-left" /><br />

                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2"><b>Exon/Intron number : </b>
                                                                        <asp:Label runat="server" ID="lbl_exonIntron" Text='<%# Bind("EXON_INTRON_NUM") %>' />
                                                                    </td>
                                                                </tr>
                                                                <tr class="h-30" style="vertical-align: top">
                                                                    <td colspan="2">
                                                                        <b>Effect : </b>
                                                                        <br />
                                                                        <asp:HiddenField runat="server" ID="hdn_effect1" Value='<%# Bind("Effect1") %>' />
                                                                        <telerik:RadListView runat="server" ID="RLV_effect1" RenderMode="Lightweight"
                                                                            CheckBoxes="false" ShowCheckAll="false">
                                                                        </telerik:RadListView>
                                                                        <%--<asp:Label runat="server" ID="lbl_eff" Text='<%# Bind("Effect") %>' />--%>

                                                                    </td>
                                                                </tr>

                                                            </table>
                                                        </div>
                                                        <div class="col-6">
                                                            <table class="tbl-container">
                                                                <tr style="background-color: #dcf3ff">
                                                                    <td colspan="3">
                                                                        <asp:Image ID="img_Male_Detail_SecondSample" src="/img/icon/Male_s.png" runat="server" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <b>Zygosity : </b>
                                                                        <asp:Label runat="server" ID="Label2" Text='<%# Bind("GENO2") %>' />
                                                                    </td>
                                                                    <td>
                                                                        <b>Genotype Quality : </b>
                                                                        <asp:Label runat="server" ID="Label3" Text='<%# Bind("GENO_QUAL2") %>' />
                                                                    </td>

                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <b>Filter : </b>
                                                                        <asp:Label runat="server" ID="Label4" Text='<%# Bind("FILTER2") %>' />
                                                                    </td>
                                                                    <td>
                                                                        <b>Quality : </b>
                                                                        <asp:Label runat="server" ID="Label5" Text='<%# Bind("QUAL2") %>' />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2">
                                                                        <b>Coverage (Alternate/Reference) : </b>
                                                                        <asp:Label runat="server" ID="Label6" Text='<%# String.Concat(Eval("COV2")," (",Eval("AO2"),"/",Eval("RO2"),")") %>' />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2">
                                                                        <asp:HiddenField runat="server" ID="HiddenField1" Value='<%# Bind("AF2") %>' />

                                                                        <b>Variant Allele Frequency :</b>
                                                                        <asp:Label runat="server" ID="Label7" Text='<%# Bind("AF2") %>' CssClass="padding-left" /><br />

                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                        <td colspan="2"><b>Exon/Intron number : </b>
                                                                            <asp:Label runat="server" ID="Label46" Text='<%# Bind("EXON_INTRON_NUM") %>' />
                                                                        </td>
                                                                </tr>
                                                                <tr class="h-30" style="vertical-align: top">
                                                                    <td colspan="2">
                                                                        <b>Effect : </b>
                                                                        <br />
                                                                        <asp:HiddenField runat="server" ID="hdn_effect2" Value='<%# Bind("EFFECT2") %>' />
                                                                        <telerik:RadListView runat="server" ID="RLV_effect2" RenderMode="Lightweight"
                                                                            CheckBoxes="false" ShowCheckAll="false">
                                                                        </telerik:RadListView>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                                <asp:Panel runat="server" ID="OneSample" Visible="False">
                                                    <table class="tbl-container">
                                                        <tr>
                                                            <td colspan="3">
                                                                <h2>General Details</h2>
                                                                <br />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <b>Zygosity : </b>
                                                                <asp:Label runat="server" ID="Label8" Text='<%# Bind("GENO1") %>' />
                                                            </td>
                                                            <td>
                                                                <b>Genotype Quality : </b>
                                                                <asp:Label runat="server" ID="Label9" Text='<%# Bind("GENO_QUAL1") %>' />
                                                            </td>
                                                            <td>
                                                                <b>Filter : </b>
                                                                <asp:Label runat="server" ID="Label10" Text='<%# Bind("FILTER1") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <b>Coverage (Alternate/Reference) : </b>
                                                                <asp:Label runat="server" ID="Label11" Text='<%# String.Concat(Eval("COV1")," (",Eval("AO1"),"/",Eval("RO1"),")") %>' />
                                                            </td>
                                                            <td>
                                                                <b>Quality : </b>
                                                                <asp:Label runat="server" ID="Label12" Text='<%# Bind("QUAL1") %>' />
                                                            </td>


                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <b>Gene : </b>
                                                                <asp:Label runat="server" ID="Label13" Text='<%# Bind("GENE") %>' />
                                                            </td>
                                                            <td>
                                                                <b>Start Position : </b>
                                                                <asp:Label runat="server" ID="lbl_start" Text='<%# Bind("START") %>' />
                                                            </td>
                                                            <td>
                                                                <b>End Position : </b>
                                                                <asp:Label runat="server" ID="lbl_end" Text='<%# Bind("END") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <b>Chromosome : </b>
                                                                <asp:Label runat="server" ID="Label14" Text='<%# Bind("CHR") %>' />
                                                            </td>
                                                            <td>
                                                                <b>Reference/Alternative : </b>
                                                                <asp:Label runat="server" ID="Label15" Text='<%# String.Concat(Eval("REF")," / ",Eval("ALT")) %>' />
                                                            </td>
                                                            <td>
                                                                <asp:HiddenField runat="server" ID="HiddenField2" Value='<%# Bind("AF1") %>' />
                                                                <div style="width: 145px; text-align: center;">
                                                                  
                                                                    <b>Variant Allele Frequency</b>
                                                                    <asp:Label runat="server" ID="Label16" Text='<%# Bind("AF1") %>' CssClass="padding-left" /><br />
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2"><b>Exon/Intron number : </b>
                                                                <asp:Label runat="server" ID="Label47" Text='<%# Bind("EXON_INTRON_NUM") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr class="h-30" style="vertical-align: top">
                                                            <td colspan="3">
                                                                <b>Effect : </b>
                                                                <br />
                                                                <asp:HiddenField runat="server" ID="HiddenField4" Value='<%# Bind("Effect1") %>' />
                                                                <telerik:RadListView runat="server" ID="RadListView2" RenderMode="Lightweight"
                                                                    CheckBoxes="false" ShowCheckAll="false">
                                                                </telerik:RadListView>

                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </telerik:RadPageView>
                                            <telerik:RadPageView ID="RadPageView2" runat="server">
                                                <div class="rgHeader condition_title">
                                                    <span style="padding-left: 25px">Transcripts</span>

                                                </div>
                                                <table class="tbl-container" runat="server" id="tbl_transcripts">
                                                    <tr>
                                                        <td colspan="2" class="h-30">
                                                            <asp:HiddenField runat="server" ID="hdf_seqFeature" Value='<%# Bind("SEQUENCE_FEATURES") %>' />
                                                            <asp:HiddenField runat="server" ID="hdf_refSeq" Value='<%# Bind("RefSeq_map") %>' />
                                                            Gene name according to the supported Ensembl version : 
                                                            <b>
                                                                <asp:Label runat="server" ID="lbl_ENS_gene" Text='<%# Bind("ENS_GENE") %>' /></b></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" class="h-30">Transcript name according to the supported Ensembl version : 
                                                            <b>
                                                                <asp:Label runat="server" ID="lbl_ENS_transcript" Text='<%# Bind("ENS_TRANSCRIPT") %>' /></b></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" class="h-30">The transcript is canonical according to Ensembl supported version : 
                                                            <b>
                                                                <asp:Label runat="server" ID="lbl_ENS_canonicalTranscript" Text='<%# Bind("ENS_CANONICAL_TRANSCRIPT") %>' /></b></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" class="h-30">Transcription factor binding site motif Id : 
                                                            <b>
                                                                <asp:Label runat="server" ID="lbl_TFBS_Id" Text='<%# Bind("TFBS_Id") %>' /></b></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" class="h-30">Transcription factor name : 
                                                            <b>
                                                                <asp:Label runat="server" ID="lbl_TFBS_name" Text='<%# Bind("TFBS_name") %>' /></b></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" class="h-30">Variant distance from the nearest CDS : 
                                                            <b>
                                                                <asp:Label runat="server" ID="lbl_CDS_DISTANCE" Text='<%# Bind("CDS_DISTANCE") %>' /></b></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="h-30">Seq feature by NextProt db :
                                                            <br />
                                                            <b>
                                                                <telerik:RadListView runat="server" ID="RLV_SeqFeature" RenderMode="Lightweight" Skin="Metro"></telerik:RadListView>
                                                            </b>
                                                        </td>

                                                        <td class="h-30" style="vertical-align: top">RefSeq transcripts :
                                                            <br />
                                                            <b>
                                                                <telerik:RadListView runat="server" ID="RLV_RefSeq" RenderMode="Lightweight" Skin="Metro"></telerik:RadListView>
                                                            </b>
                                                        </td>
                                                    </tr>


                                                    <tr>
                                                        <td class="h-30">Coding HGVS nomenclature : 
                                                            <b>
                                                                <asp:Label runat="server" ID="lbl_HGVS_C" Text='<%# Bind("HGVS_C") %>' /></b></td>
                                                        <td class="h-30">Protein HGVS nomenclature : 
                                                            <b>
                                                                <asp:Label runat="server" ID="lbl_HGVS_P" Text='<%# Bind("HGVS_P") %>' /></b></td>
                                                    </tr>

                                                    <tr>
                                                        <td class="h-30">CDNA length : 
                                                            <b>
                                                                <asp:Label runat="server" ID="lbl_CDS_LEN" Text='<%# Bind("CDS_LEN") %>' /></b></td>
                                                        <td class="h-30">Protein length : 
                                                            <b>
                                                                <asp:Label runat="server" ID="lbl_AA_LEN" Text='<%# Bind("AA_LEN") %>' /></b></td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <table class="tbl-container" runat="server" id="tbl_otherTranscripts">
                                                    <tr>
                                                        <td colspan="3">
                                                            <h5>Other Transcripts</h5>
                                                        </td>
                                                    </tr>
                                                    <tr id="tr_transcripts_count"></tr>
                                                    <tr id="tr_transcripts_collapse_tab"></tr>
                                                    <tr id="tr_transcripts_detail"></tr>

                                                </table>
                                            </telerik:RadPageView>
                                            <telerik:RadPageView ID="RadPageView3" runat="server">
                                                <div class="rgHeader condition_title">
                                                    <span style="padding-left: 25px">ClinVar</span>

                                                </div>
                                                <table class="tbl-container" runat="server">
                                                    <tr>
                                                        <td class="h-30" style="vertical-align: top">
                                                            <h5>Clinical Significance :</h5>
                                                            <asp:HiddenField runat="server" ID="hdn_clinvar_rcv" Value='<%# Bind("ClinVar_RCV") %>' />
                                                            <asp:HiddenField runat="server" ID="hdn_clinvar_clinic" Value='<%# Bind("ClinVar_clinical_significance") %>' />
                                                            <telerik:RadListView runat="server" ID="RLV_clinvar_clincal" RenderMode="Lightweight"
                                                                CheckBoxes="false" ShowCheckAll="false">
                                                            </telerik:RadListView>

                                                        </td>
                                                        <td class="h-30" style="vertical-align: top">
                                                            <h5>List of PUBMED Ids :</h5>
                                                            <asp:HiddenField runat="server" ID="hdn_clinvar_pmids" Value='<%# Bind("ClinVar_PMIDS") %>' />
                                                            <telerik:RadListView runat="server" ID="RLV_clinVar_PMIDS" RenderMode="Lightweight"
                                                                CheckBoxes="false" ShowCheckAll="false">
                                                            </telerik:RadListView>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="h-30" colspan="2">
                                                            <h5>ClinVar hotspot :</h5>
                                                            <asp:HiddenField runat="server" ID="hdn_clinvar_hotspot" Value='<%# Bind("ClinVar_hotSpot") %>' />
                                                            <telerik:RadListView runat="server" ID="RLV_clinVar_hotspot" RenderMode="Lightweight"
                                                                CheckBoxes="false" ShowCheckAll="false">
                                                            </telerik:RadListView>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="h-30" style="vertical-align: top">
                                                            <h5>Review status in ClinVar :</h5>
                                                            <asp:HiddenField runat="server" ID="hdn_clinvar_status" Value='<%# Bind("ClinVar_rev_status") %>' />
                                                            <telerik:RadListView runat="server" ID="RLV_clinvar_status" RenderMode="Lightweight"
                                                                CheckBoxes="false" ShowCheckAll="false">
                                                            </telerik:RadListView>
                                                        </td>
                                                        <td class="h-30" style="vertical-align: top">
                                                            <h5>List of ClinVar submitted traits :</h5>
                                                            <asp:HiddenField runat="server" ID="hdn_clinvar_traits" Value='<%# Bind("ClinVar_traits") %>' />
                                                            <telerik:RadListView runat="server" ID="RLV_clinVar_traits" RenderMode="Lightweight"
                                                                CheckBoxes="false" ShowCheckAll="false">
                                                            </telerik:RadListView>

                                                        </td>

                                                    </tr>
                                                </table>
                                            </telerik:RadPageView>
                                            <telerik:RadPageView ID="RadPageView4" runat="server">
                                                <div class="rgHeader condition_title">
                                                    <span style="padding-left: 25px">Lab Knowledgebase</span>

                                                </div>
                                                <table class="tbl-container" runat="server">
                                                    <tr>
                                                        <td colspan="3">
                                                            <h5>There are no items to be displayed.</h5>
                                                        </td>
                                                    </tr>

                                                </table>
                                            </telerik:RadPageView>
                                            <telerik:RadPageView ID="RadPageView5" runat="server">
                                                <div class="rgHeader condition_title">
                                                    <span style="padding-left: 25px">Lab Findings</span>
                                                </div>
                                                <table class="tbl-container" runat="server">
                                                    <tr>
                                                        <td colspan="3">
                                                            <h5>There are no items to be displayed.</h5>
                                                        </td>
                                                    </tr>

                                                </table>
                                            </telerik:RadPageView>
                                            <telerik:RadPageView ID="RadPageView6" runat="server">
                                                <div class="rgHeader condition_title">
                                                    <span style="padding-left: 25px">Population frequency</span>
                                                </div>
                                                <telerik:RadTabStrip RenderMode="Lightweight" runat="server" ID="RTS_Population" CssClass="RTS_Population" MultiPageID="RadMultiPage_Population" SelectedIndex="0" Skin="Silk">
                                                    <Tabs>
                                                        <telerik:RadTab Text="genomAD" Width="100px"></telerik:RadTab>
                                                        <telerik:RadTab Text="ExAC" Width="80px"></telerik:RadTab>
                                                        <telerik:RadTab Text="dbSNP" Width="80px"></telerik:RadTab>
                                                        <telerik:RadTab Text="Exome Sequence Project" Width="200px"></telerik:RadTab>
                                                       </Tabs>
                                                </telerik:RadTabStrip>
                                                <telerik:RadMultiPage runat="server" ID="RadMultiPage_Population" SelectedIndex="0" CssClass="innerMultiPage">
                                                    <telerik:RadPageView runat="server" ID="RPV_genomAD">
                                                        <table class="tbl-container" runat="server">
                                                            <tr style="background: none; border-bottom: none">
                                                                <td colspan="3">
                                                                    <table class="tbl-container" runat="server">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td>
                                                                                    <h6>Population</h6>
                                                                                </td>
                                                                                <td>
                                                                                    <h6>Number of Homozygotes</h6>
                                                                                </td>
                                                                                <td>
                                                                                    <h6>Allele Frequency</h6>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <h7>African</h7>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label runat="server" ID="Label17" Text='<%# Bind("gnomAD_Hom_AFR") %>' /></td>
                                                                                <td>
                                                                                    <asp:Label runat="server" ID="Label18" Text='<%# Bind("gnomAD_AF_AFR") %>' /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <h7>Ashkenazi Jewish</h7>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label runat="server" ID="Label19" Text='<%# Bind("gnomAD_Hom_ASJ") %>' /></td>
                                                                                <td>
                                                                                    <asp:Label runat="server" ID="Label20" Text='<%# Bind("gnomAD_AF_ASJ") %>' /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <h7>East Asian</h7>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label runat="server" ID="Label21" Text='<%# Bind("gnomAD_Hom_EAS") %>' /></td>
                                                                                <td>
                                                                                    <asp:Label runat="server" ID="Label22" Text='<%# Bind("gnomAD_AF_EAS") %>' /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <h7>European (Finnish)</h7>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label runat="server" ID="Label23" Text='<%# Bind("gnomAD_Hom_FIN") %>' /></td>
                                                                                <td>
                                                                                    <asp:Label runat="server" ID="Label24" Text='<%# Bind("gnomAD_AF_FIN") %>' /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <h7>European (Non-Finnish)</h7>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label runat="server" ID="Label25" Text='<%# Bind("gnomAD_Hom_NFE") %>' /></td>
                                                                                <td>
                                                                                    <asp:Label runat="server" ID="Label26" Text='<%# Bind("gnomAD_AF_NFE") %>' /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <h7>Latino</h7>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label runat="server" ID="Label27" Text='<%# Bind("gnomAD_Hom_AMR") %>' /></td>
                                                                                <td>
                                                                                    <asp:Label runat="server" ID="Label28" Text='<%# Bind("gnomAD_AF_AMR") %>' /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <h7>South Asian</h7>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label runat="server" ID="Label29" Text='<%# Bind("gnomAD_Hom_SAS") %>' /></td>
                                                                                <td>
                                                                                    <asp:Label runat="server" ID="Label30" Text='<%# Bind("gnomAD_AF_SAS") %>' /></td>
                                                                            </tr>
                                                                            <tr style="border-bottom: none">
                                                                                <td>
                                                                                    <h7>Other</h7>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label runat="server" ID="Label31" Text='<%# Bind("gnomAD_Hom_OTH") %>' /></td>
                                                                                <td>
                                                                                    <asp:Label runat="server" ID="Label32" Text='<%# Bind("gnomAD_AF_OTH") %>' /></td>
                                                                            </tr>
                                                                            <tr style="border-top: 1px solid #14AFCA; border-bottom: 1px solid #14AFCA">
                                                                                <td>
                                                                                    <h7><b>Total</b></h7>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label runat="server" ID="Label33" Text='<%# Bind("gnomAD_Hom_ALL") %>' /></td>
                                                                                <td>
                                                                                    <asp:Label runat="server" ID="Label34" Text='<%# Bind("gnomAD_AF_ALL") %>' /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <h7>Female</h7>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label runat="server" ID="Label35" Text='<%# Bind("gnomAD_Hom_Female") %>' /></td>
                                                                                <td>
                                                                                    <asp:Label runat="server" ID="Label36" Text='<%# Bind("gnomAD_AF_Female") %>' /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <h7>Male</h7>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label runat="server" ID="Label37" Text='<%# Bind("gnomAD_Hom_Male") %>' /></td>
                                                                                <td>
                                                                                    <asp:Label runat="server" ID="Label38" Text='<%# Bind("gnomAD_AF_Male") %>' /></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </telerik:RadPageView>
                                                    <telerik:RadPageView runat="server" ID="RPV_ExAC">
                                                        <table class="tbl-container" runat="server">
                                                            <tbody>

                                                                <tr>
                                                                    <td colspan="3" class="h-30">
                                                                        <b>Total number of corrected alleles counted in ExAC database: </b>
                                                                        <asp:Label runat="server" ID="lbl_exac" Text='<%# Bind("ExAC_AN") %>' /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="3" class="h-30">
                                                                        <b>Number of corrected ALT alleles counted in ExAC database: </b>
                                                                        <asp:Label runat="server" ID="Label48" Text='<%# Bind("ExAC_AC") %>' /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="3" class="h-30">
                                                                        <b>ExAC frequency of the ALT allele [0-1]: </b>
                                                                        <asp:Label runat="server" ID="Label49" Text='<%# Bind("ExAC_AF") %>' />

                                                                    </td>

                                                                </tr>
                                                                <tr>
                                                                    <td colspan="3" class="h-30">
                                                                        <b>The genomic locus is covered by ExAC according to the WES design file: 
                                                                        </b>
                                                                        <span style="color: #14AFCA">
                                                                            <asp:Label runat="server" ID="Label50" Text='<%# Bind("ExAC_isTarget") %>' />
                                                                        </span>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </telerik:RadPageView>
                                                    <telerik:RadPageView runat="server" ID="RPV_DBSNP">
                                                        <table class="tbl-container" runat="server">
                                                            <tbody>
                                                                <tr>
                                                                    <td class="h-30">
                                                                        <b>The dbSNP id (no rs) : </b>
                                                                        <asp:Label runat="server" ID="lbl_dbsnp" Text='<%# Bind("DBSNP") %>' /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="h-30">
                                                                        <b>The dbSNP version that first included the variant : </b>
                                                                        <asp:Label runat="server" ID="lbl_dbsnpVer" Text='<%# Bind("DBSNP_VERSION") %>' /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="h-30">
                                                                        <b>1000 genomes project REF allele frequency [0-1] as reported in dbSNP : </b>
                                                                        <asp:Label runat="server" ID="lbl_dbsnp_ref_freq" Text='<%# Bind("DBSNP_1TGP_REF_freq") %>' /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="h-30">
                                                                        <b>1000 genomes project ALT allele frequency [0-1] as reported in dbSNP : </b>
                                                                        <asp:Label runat="server" ID="lbl_dbsnp_1TGP_ALT_freq" Text='<%# Bind("DBSNP_1TGP_ALT_freq") %>' /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="h-30">
                                                                        <b>ALT allele frequency is greater than 1% in at least one population with at least two individuals from different families having the same minor allele : </b>
                                                                        <span style="color: #14AFCA">
                                                                            <asp:Label runat="server" ID="lbl_common_1TGP_1perc" Text='<%# Bind("COMMON_1TGP_1perc") %>' /></span>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </telerik:RadPageView>
                                                    <telerik:RadPageView runat="server" ID="RPV_ExomeSeqProj">
                                                        <table class="tbl-container" runat="server">
                                                            <tr style="background: none; border-bottom: none">
                                                                <td colspan="3">
                                                                    <table class="tbl-container" runat="server">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td>
                                                                                    <h6>Population</h6>
                                                                                </td>
                                                                                <td>
                                                                                    <h6>ALT allele frequency in ESP [0-100]</h6>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <h7>European</h7>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label runat="server" ID="lbl_esp_ea_freq" Text='<%# Bind("ESP_EA_freq") %>' /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <h7>African American</h7>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label runat="server" ID="lbl_esp_aa_freq" Text='<%# Bind("ESP_AA_freq") %>' /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <h7>General Population</h7>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label runat="server" ID="lbl_esp_all_freq" Text='<%# Bind("ESP_All_freq") %>' /></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </telerik:RadPageView>

                                                    <telerik:RadPageView runat="server" ID="RPV_GenAP">
                                                        <table class="tbl-container" runat="server">
                                                            <tbody>
                                                            </tbody>
                                                        </table>
                                                    </telerik:RadPageView>
                                                </telerik:RadMultiPage>
                                            </telerik:RadPageView>
                                            <telerik:RadPageView ID="RadPageView7" runat="server">
                                                <div class="rgHeader condition_title">
                                                    <span style="padding-left: 25px">Functional</span>
                                                </div>
                                                <table class="tbl-container" runat="server">
                                                    <tr style="background: none; border-bottom: none">
                                                        <td colspan="3">
                                                            <table class="tbl-container" runat="server">
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <h6>Name</h6>
                                                                        </td>
                                                                        <td>
                                                                            <h6>Prediction</h6>
                                                                        </td>
                                                                        <td>
                                                                            <h6>Score</h6>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <h7>
                                                                                <asp:Label CssClass="cursor-pointer" runat="server" ID="lbl_PaPI_pred" Text="PaPI" ToolTip="PaPI (http://papi.unipv.it) prediction for this variant to be damaging/tolerated for the protein structure/function. It is the combined prediction given by PolyPhen-2, SIFT and PseeAC-RF classifiers.">
                                                                                </asp:Label>
                                                                            </h7>
                                                                            <telerik:RadToolTip ID="RadToolTip1" runat="server" Font-Size="12px" Width="200px" TargetControlID="lbl_PaPI_pred" RelativeTo="Element" Position="MiddleRight"
                                                                                ShowEvent="OnMouseOver" RenderMode="Lightweight" Skin="Metro" Height="100px">
                                                                            </telerik:RadToolTip>
                                                                        </td>
                                                                        <td>
                                                                            <asp:HiddenField runat="server" ID="hdn_papi" Value='<%# Bind("PaPI_pred") %>' />

                                                                            <asp:Label runat="server" ID="lbl_PaPI_pred_val" Text='<%# Bind("PaPI_pred") %>' />

                                                                        </td>
                                                                        <td>
                                                                            <asp:Label runat="server" ID="Label39" Text='<%# Bind("PaPI_score") %>' /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <h7>
                                                                                <asp:Label CssClass="cursor-pointer" runat="server" ID="lbl_PolyPhn2" Text="PolyPhen 2" ToolTip="PolyPhen-2 (HumVar) prediction for this variant to be damaging/tolerated for the protein structure/function. ">
                                                                                </asp:Label>
                                                                            </h7>
                                                                            <telerik:RadToolTip ID="RadToolTip2" runat="server" Font-Size="12px" Width="200px" TargetControlID="lbl_PolyPhn2" RelativeTo="Element" Position="MiddleRight"
                                                                                ShowEvent="OnMouseOver" RenderMode="Lightweight" Skin="Metro" Height="60px">
                                                                            </telerik:RadToolTip>

                                                                        </td>
                                                                        <td>
                                                                            <asp:HiddenField runat="server" ID="hdn_polyphen" Value='<%# Bind("PolyPhen_2_pred") %>' />
                                                                            <asp:Label runat="server" ID="lbl_PolyPhen2" Text='<%# Bind("PolyPhen_2_pred") %>' /></td>
                                                                        <td>
                                                                            <asp:Label runat="server" ID="Label40" Text='<%# Bind("PolyPhen_2_score") %>' /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <h7>
                                                                                <asp:Label CssClass="cursor-pointer" runat="server" ID="lbl_siftt" Text="SIFT" ToolTip="SIFT prediction for this variant to be damaging/tolerated for the protein structure/function.">
                                                                                </asp:Label>
                                                                            </h7>
                                                                            <telerik:RadToolTip ID="RadToolTip3" runat="server" Font-Size="12px" Width="200px" TargetControlID="lbl_siftt" RelativeTo="Element" Position="MiddleRight"
                                                                                ShowEvent="OnMouseOver" RenderMode="Lightweight" Skin="Metro" Height="60px">
                                                                            </telerik:RadToolTip>
                                                                        </td>
                                                                        <td>
                                                                            <asp:HiddenField runat="server" ID="hdn_sift" Value='<%# Bind("SIFT_pred") %>' />
                                                                            <asp:Label runat="server" ID="lbl_sift" Text='<%# Bind("SIFT_pred") %>' /></td>
                                                                        <td>
                                                                            <asp:Label runat="server" ID="Label41" Text='<%# Bind("SIFT_score") %>' /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <h7>
                                                                                <asp:Label CssClass="cursor-pointer" runat="server" ID="lbl_dbscSNV_AB" Text="dbscSNV (AB)" ToolTip="Probability for this variant (SNV only) to be deleterious for the nearby splicing site. Score computed by AdaBoost machine learning classifier. ">
                                                                                </asp:Label>
                                                                            </h7>
                                                                            <telerik:RadToolTip ID="RadToolTip4" runat="server" Font-Size="12px" Width="200px" TargetControlID="lbl_dbscSNV_AB" RelativeTo="Element" Position="MiddleRight"
                                                                                ShowEvent="OnMouseOver" RenderMode="Lightweight" Skin="Metro" Height="70px">
                                                                            </telerik:RadToolTip>
                                                                        </td>
                                                                        <td>-</td>
                                                                        <td>
                                                                            <asp:Label runat="server" ID="Label42" Text='<%# Bind("dbscSNV_AB_score") %>' /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <h7>
                                                                                <asp:Label runat="server" ID="lbl_dbscSNV_RF" Text="dbscSNV (RF)" ToolTip="Probability for this variant (SNV only) to be deleterious for the nearby splicing site. Score computed by Random Forest machine learning classifier.">
                                                                                </asp:Label>
                                                                            </h7>
                                                                            <telerik:RadToolTip ID="RadToolTip5" runat="server" Font-Size="Small" Width="200px" TargetControlID="lbl_dbscSNV_RF" RelativeTo="Element" Position="MiddleRight"
                                                                                ShowEvent="OnMouseOver" RenderMode="Lightweight" Skin="Metro" Height="70px">
                                                                            </telerik:RadToolTip>

                                                                        </td>
                                                                        <td>-</td>
                                                                        <td>
                                                                            <asp:Label runat="server" ID="Label43" Text='<%# Bind("dbscSNV_RF_score") %>' /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <h7>
                                                                                <asp:Label runat="server" ID="lbl_dann" Text="DANN" ToolTip="Probability for this variant (SNV only) to be deleterious according to DANN score. Both for coding and non-coding genomic variants.">
                                                                                </asp:Label>
                                                                            </h7>
                                                                            <telerik:RadToolTip ID="RadToolTip6" runat="server" Font-Size="Small" Width="200px" TargetControlID="lbl_dann" RelativeTo="Element" Position="MiddleRight"
                                                                                ShowEvent="OnMouseOver" RenderMode="Lightweight" Skin="Metro" Height="70px">
                                                                            </telerik:RadToolTip>
                                                                        </td>
                                                                        <td>-</td>
                                                                        <td>
                                                                            <asp:Label runat="server" ID="Label44" Text='<%# Bind("DANN_score") %>' /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <h7>
                                                                                <asp:Label runat="server" ID="lbl_PseeAC_RF" Text="PseeAC RF" ToolTip="Random Forest Pseudo-Amino acidic classifier prediction for this variant to be damaging/tolerated for the protein structure/function.">
                                                                                </asp:Label>
                                                                            </h7>
                                                                            <telerik:RadToolTip ID="RadToolTip7" runat="server" Font-Size="Small" Width="200px" TargetControlID="lbl_PseeAC_RF" RelativeTo="Element" Position="MiddleRight"
                                                                                ShowEvent="OnMouseOver" RenderMode="Lightweight" Skin="Metro" Height="70px">
                                                                            </telerik:RadToolTip>
                                                                        </td>
                                                                        <td>
                                                                            <asp:HiddenField runat="server" ID="hdn_psee" Value='<%# Bind("PseeAC_RF_pred") %>' />
                                                                            <asp:Label runat="server" ID="lbl_psee" Text='<%# Bind("PseeAC_RF_pred") %>' /></td>
                                                                        <td>
                                                                            <asp:Label runat="server" ID="Label45" Text='<%# Bind("PseeAC_RF_score") %>' /></td>
                                                                    </tr>

                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </telerik:RadPageView>
                                            <telerik:RadPageView ID="RadPageView8" runat="server">
                                                <div class="rgHeader condition_title">
                                                    <span style="padding-left: 25px">External Links</span>
                                                </div>
                                                <table class="tbl-container tbl-container-link" runat="server">
                                                    <tr>
                                                        <td>
                                                            <asp:HyperLink runat="server" ID="hl_varsome_chr_spos" NavigateUrl='<%# string.Format("https://varsome.com/position/hg19/chr{0}-{1}",HttpUtility.UrlEncode(Eval("CHR").ToString()), HttpUtility.UrlEncode(Eval("START").ToString())) %>'
                                                                Text='<%# string.Format("Varsome ( chr: {0}, start position: {1} )", Eval("CHR"), Eval("START")) %>' Target="_blank"></asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:HyperLink runat="server" ID="hl_varsome_gene" NavigateUrl='<%# string.Format("https://varsome.com/gene/{0}",HttpUtility.UrlEncode(Eval("GENE").ToString()) ) %>'
                                                                Text='<%# string.Format("Varsome ( gene: {0} )", Eval("GENE")) %>' Target="_blank"></asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:HyperLink runat="server" ID="hl_genecards_gene" NavigateUrl='<%# string.Format("https://www.genecards.org/cgi-bin/carddisp.pl?gene={0}",HttpUtility.UrlEncode(Eval("GENE").ToString()) ) %>'
                                                                Text='<%# string.Format("GeneCards ( gene: {0} )", Eval("GENE")) %>' Target="_blank"></asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:HyperLink runat="server" ID="hl_ncbl_gene" NavigateUrl='<%# string.Format("https://www.ncbi.nlm.nih.gov/gene/?term={0}",HttpUtility.UrlEncode(Eval("GENE").ToString()) ) %>'
                                                                Text='<%# string.Format("NCBI ( gene: {0} )", Eval("GENE")) %>' Target="_blank"></asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:HiddenField runat="server" ID="hdn_ncbl_dbsnp" Value='<%# Bind("DBSNP") %>' />
                                                            <asp:HyperLink runat="server" ID="hl_ncbl_dbsnp" Target="_blank"></asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:HyperLink runat="server" ID="hl_mastermind_gene" NavigateUrl='<%# string.Format("https://mastermind.genomenon.com/detail?disease=all%20diseases&gene={0}",HttpUtility.UrlEncode(Eval("GENE").ToString()) ) %>'
                                                                Text='<%# string.Format("Master Mind ( gene: {0} )", Eval("GENE")) %>' Target="_blank"></asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:HyperLink runat="server" ID="hl_trapscore_chr_spos" NavigateUrl='<%# string.Format("http://trap-score.org/Search?query={0}-{1}",HttpUtility.UrlEncode(Eval("CHR").ToString()), HttpUtility.UrlEncode(Eval("START").ToString()) ) %>'
                                                                Text='<%# string.Format("TraP Score ( chr: {0}, start position: {1} )", Eval("CHR"), Eval("START")) %>' Target="_blank"></asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:HyperLink runat="server" ID="hl_trapscore_chr_spos_alt_ref" NavigateUrl='<%# string.Format("http://trap-score.org/Search?query={0}-{1}-{2}-{3}",HttpUtility.UrlEncode(Eval("CHR").ToString()), HttpUtility.UrlEncode(Eval("START").ToString()), HttpUtility.UrlEncode(Eval("REF").ToString()), HttpUtility.UrlEncode(Eval("ALT").ToString()) ) %>'
                                                                Text='<%# string.Format("TraP Score ( chr: {0}, start position: {1}, Reference: {2}, Alternative: {3} )", Eval("CHR"), Eval("START"), Eval("REF"), Eval("ALT")) %>' Target="_blank"></asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:HyperLink runat="server" ID="hl_omim" NavigateUrl='<%# string.Format("https://www.omim.org/search/?search={0}",HttpUtility.UrlEncode(Eval("GENE").ToString()) ) %>'
                                                                Text='<%# string.Format("OMIM ( gene: {0} )", Eval("GENE") ) %>' Target="_blank"></asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:HyperLink runat="server" ID="hl_medgen" NavigateUrl='<%# string.Format("https://www.ncbi.nlm.nih.gov/medgen/?term={0}",HttpUtility.UrlEncode(Eval("GENE").ToString()) ) %>'
                                                                Text='<%# string.Format("MedGen ( gene: {0} )", Eval("GENE") ) %>' Target="_blank"></asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:HyperLink runat="server" ID="hl_orphanet" NavigateUrl='<%# string.Format("https://www.ncbi.nlm.nih.gov/medgen/?term={0}",HttpUtility.UrlEncode(Eval("GENE").ToString()) ) %>'
                                                                Text='<%# string.Format("MedGen ( gene: {0} )", Eval("GENE") ) %>' Target="_blank"></asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:HyperLink runat="server" ID="hl_ucsc" NavigateUrl='<%# string.Format("http://genome-euro.ucsc.edu/cgi-bin/hgTracks?db=hg19&lastVirtModeType=default&lastVirtModeExtraState=&virtModeType=default&virtMode=0&nonVirtPosition=&position=chr{0}%3A{1}-{1}",HttpUtility.UrlEncode(Eval("CHR").ToString()), HttpUtility.UrlEncode(Eval("START").ToString())) %>'
                                                                Text='<%# string.Format("Genomics institude - UCSC  ( chr: {0}, start position: {1} )", Eval("CHR"), Eval("START") ) %>' Target="_blank"></asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </telerik:RadPageView>

                                        </telerik:RadMultiPage>

                                    </ItemTemplate>

                                </telerik:GridTemplateColumn>

                            </Columns>

                        </MasterTableView>
                    </telerik:RadGrid>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card" style="height:850px !important">
                    <div class="card-content ">
                        <div class="card-body pt-0 pl-0">
                            <div class="form">
                               <h4 class="form-section">Phenotypes</h4>
                  
                    <telerik:RadGrid RenderMode="Lightweight" ID="RG_SampleVariant_Condition" runat="server" GridLines="None" DataSourceID="Ds_SampleVariant_Condition"
                        AllowPaging="true" AllowSorting="True" ShowGroupPanel="true" AutoGenerateColumns="False" CellSpacing="0" CssClass="RG_SampleVariant_Detail margin-top"
                        OnItemDataBound="RG_SampleVariant_Condition_ItemDataBound" PageSize="7">

                        <MasterTableView BorderColor="Transparent" HeaderStyle-BorderColor="Transparent" GridLines="None" Name="master">

                            <NestedViewTemplate>

                                <table class="tbl-container" runat="server" id="tbl_con">
                                    <tr>
                                        <td>
                                            <b>Classification : </b>
                                            <asp:Label runat="server" ID="lbl_finalClassification" Text='<%# Bind("FINAL_CLASSIFICATION") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b>Pathogenicity Score : </b>
                                            <asp:Label runat="server" ID="lbl_scoreOfPatho" Text='<%# Bind("SCORE_OF_PATHOGENICITY") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b>Triggered Rules : </b>
                                            <asp:Label runat="server" ID="pvs1" Text='<%# Bind("PVS1") %>' />
                                            <asp:Label runat="server" ID="ps1" Text='<%# Bind("PS1") %>' />
                                            <asp:Label runat="server" ID="ps2" Text='<%# Bind("PS2") %>' />
                                            <asp:Label runat="server" ID="ps3" Text='<%# Bind("PS3") %>' />
                                            <asp:Label runat="server" ID="ps4" Text='<%# Bind("PS4") %>' />
                                            <asp:Label runat="server" ID="pm1" Text='<%# Bind("PM1") %>' />
                                            <asp:Label runat="server" ID="pm2" Text='<%# Bind("PM2") %>' />
                                            <asp:Label runat="server" ID="pm3" Text='<%# Bind("PM3") %>' />
                                            <asp:Label runat="server" ID="pm4" Text='<%# Bind("PM4") %>' />
                                            <asp:Label runat="server" ID="pm5" Text='<%# Bind("PM5") %>' />
                                            <asp:Label runat="server" ID="pm6" Text='<%# Bind("PM6") %>' />
                                            <asp:Label runat="server" ID="pp1" Text='<%# Bind("PP1") %>' />
                                            <asp:Label runat="server" ID="pp2" Text='<%# Bind("PP2") %>' />
                                            <asp:Label runat="server" ID="pp3" Text='<%# Bind("PP3") %>' />
                                            <asp:Label runat="server" ID="pp4" Text='<%# Bind("PP4") %>' />
                                            <asp:Label runat="server" ID="pp5" Text='<%# Bind("PP5") %>' />
                                            <asp:Label runat="server" ID="ba1" Text='<%# Bind("BA1") %>' />
                                            <asp:Label runat="server" ID="bs1" Text='<%# Bind("BS1") %>' />
                                            <asp:Label runat="server" ID="bs2" Text='<%# Bind("BS2") %>' />
                                            <asp:Label runat="server" ID="bs3" Text='<%# Bind("BS3") %>' />
                                            <asp:Label runat="server" ID="bs4" Text='<%# Bind("BS4") %>' />
                                            <asp:Label runat="server" ID="bp1" Text='<%# Bind("BP1") %>' />
                                            <asp:Label runat="server" ID="bp2" Text='<%# Bind("BP2") %>' />
                                            <asp:Label runat="server" ID="bp3" Text='<%# Bind("BP3") %>' />
                                            <asp:Label runat="server" ID="bp4" Text='<%# Bind("BP4") %>' />
                                            <asp:Label runat="server" ID="bp5" Text='<%# Bind("BP5") %>' />
                                            <asp:Label runat="server" ID="bp6" Text='<%# Bind("BP6") %>' />
                                            <asp:Label runat="server" ID="bp7" Text='<%# Bind("BP7") %>' />
                                            <asp:Label runat="server" ID="bp8" Text='<%# Bind("BP8") %>' />

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b>Gene : </b>
                                            <asp:Label runat="server" ID="Label59" Text='<%# Bind("GENE") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b>Inheritance : </b>
                                            <asp:Label runat="server" ID="lbl_inhrt" Text='<%# Bind("INHERITANCE") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b>MEDGEN CUI : </b>
                                            <asp:Label runat="server" ID="Label63" Text='<%# Bind("MEDGEN_CUI") %>' />
                                        </td>
                                    </tr>
                                </table>
                            </NestedViewTemplate>
                            <ColumnGroups>
                                <telerik:GridColumnGroup Name="Condition" HeaderText="Phenotypes" HeaderStyle-CssClass="condition_title">
                                </telerik:GridColumnGroup>
                            </ColumnGroups>
                            <Columns>
                                <telerik:GridTemplateColumn ColumnGroupName="Condition">
                                    <HeaderStyle CssClass="hidden" />
                                    <ItemStyle />
                                    <ItemTemplate>

                                        <asp:HiddenField runat="server" ID="hdn_classification" Value='<%# Bind("FINAL_CLASSIFICATION") %>' />
                                        <asp:HiddenField runat="server" ID="hdn_inheritance" Value='<%# Bind("INHERITANCE") %>' />


                                        <asp:Image ID="img_classification" Width="20px" runat="server" CssClass="img_classification" />
                                        <asp:Image ID="img_inheritance" Width="16px" runat="server" CssClass="img_classification" />


                                        <%--<div id="img_inheritance_holder" runat="server" style="float: left">
                                    </div>--%>
                                        <asp:Label ID="lbl_phenotype" runat="server" Text='<%# Bind("PHENOTYPE") %>' CssClass="lbl_phenotype" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>

                        </MasterTableView>
                    </telerik:RadGrid>

                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="form-actionspopup center">
            <asp:Button ID="btn_cacel" Text="Close" runat="server" OnClientClick="CloseWindow(); return false;"
                class="btn btn-danger mr-1 ladda-button btn-sm"></asp:Button>
        </div>
    </section>
</div>



<asp:SqlDataSource ID="Ds_SampleVariant_Detail" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_GAP_Report_Sample_Variant_Detail_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="SampleID" SessionField="Sample_MutationDetail" Type="String" />
        <asp:SessionParameter Name="FemaleID" SessionField="FemaleID" Type="String" DefaultValue="-1" />
        <asp:SessionParameter Name="MaleID" SessionField="MaleID" Type="String" DefaultValue="-1" />
        <asp:SessionParameter Name="InputType" SessionField="DetailType_Mutation" Type="Int32" />
        <asp:SessionParameter Name="CHR" SessionField="CHR_MutationDetail" Type="String" />
        <asp:SessionParameter Name="START" SessionField="START_MutationDetail" Type="String" />
        <asp:SessionParameter Name="END" SessionField="END_MutationDetail" Type="String" />
        <asp:SessionParameter Name="REF" SessionField="Ref_MutationDetail" Type="String" />
        <asp:SessionParameter Name="ALT" SessionField="ALT_MutationDetail" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="Ds_SampleVariant_Condition" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_GAP_Report_Sample_Variant_Condition_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="SampleID" SessionField="Sample_MutationDetail" Type="String" />
        <asp:SessionParameter Name="CHR" SessionField="CHR_MutationDetail" Type="String" />
        <asp:SessionParameter Name="START" SessionField="START_MutationDetail" Type="String" />
        <asp:SessionParameter Name="END" SessionField="END_MutationDetail" Type="String" />
        <asp:SessionParameter Name="REF" SessionField="Ref_MutationDetail" Type="String" />
        <asp:SessionParameter Name="ALT" SessionField="ALT_MutationDetail" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>

<telerik:RadScriptBlock runat="server" ID="RadScriptBlock1">
    <script>
        function GetRadWindow() {
            var oWindow = null;
            if (window.radWindow) oWindow = window.radWindow;
            else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
            return oWindow;
        }
        function CloseWindow() {
            var oWindow = GetRadWindow();  //Obtaining a reference to the current window 
            oWindow.Close();
        }
    </script>
</telerik:RadScriptBlock>
