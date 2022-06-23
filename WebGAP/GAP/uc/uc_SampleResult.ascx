<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_SampleResult.ascx.cs" Inherits="WebGAP.GAP.uc.uc_SampleResult" %>

<link href=".././assets/css/Filter_Custom.css" rel="stylesheet" type="text/css" runat="server" />
<link href=".././assets/css/sampleResult_style.css" rel="stylesheet" type="text/css" media="screen" runat="server" />

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
     <ClientEvents OnRequestStart="onRequestStart"></ClientEvents>
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_SampleVariant">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_SampleVariant" />
                <telerik:AjaxUpdatedControl ControlID="RG_SampleVariant_Detail" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RLV_Lab_Findings" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_SampleVariant_Condition">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_SampleVariant_Condition" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RLV_Lab_Findings">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLV_Lab_Findings" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_SampleVariant">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_SampleVariant" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="timerRefresh">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Time_Panel_RG" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="Panel_lbl_timeData" />
                <telerik:AjaxUpdatedControl ControlID="Panel_lbl_countDown" />

            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="countDown">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Panel_lbl_countDown" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="btnShowStats">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btnShowStats" />
                <telerik:AjaxUpdatedControl ControlID="RG_SampleVariant_Detail" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
         
    </AjaxSettings>
</telerik:RadAjaxManager>

<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30" Skin="Office2007" />
<style>
    .RadGrid_Bootstrap .rgCommandCell {
        border-bottom-width: 1px !important;
        border-bottom-color: #37AFC4 !important;
        background-color: #fff !important;
        height: 35px !important;
    }

        .RadGrid_Bootstrap .rgCommandCell a, .RadGrid_Bootstrap .rgCommandCell a:active {
            color: darkgreen !important;
            background: #eee;
            padding: 4px !important;
            border-radius: 4px
        }

        .RadGrid_Bootstrap .rgCommandCell img {
            width: 35px !important;
            margin-left: 12px;
            margin-bottom: 3px;
        }

    .no-wrap {
        white-space: nowrap
    }

    .tbl_stat th, .tbl_stat td {
        border-bottom: 1px solid #14afca;
        border-right: 1px solid #14afca;
        padding-bottom: 4px;
        padding-top: 4px;
    }

    .tbl_stat td, .txt-middel {
        text-align: center
    }

    .RadComboBoxDropDown .rcbList {
        font-size: small
    }

    .spinner-box {
        position: absolute;
        z-index: 1;
        padding-top: 110px;
        padding-left: 300px;
        width: 700px;
        height: 280px;
        background-color: #eee;
        opacity: 0.5;
    }

    .lbl-fisherStats {
        background-color: #eee;
        padding: 10px;
        float:left;
    }
</style>

<div class="content-header" style="width: 100%; background-color: lightgray; display: flex; padding: 5px 10px; border-radius: 5px; margin: 15px 0">
    <table style="width: 100%;">
        <tr>
            <td style="width: 50%;">
                <h4 style="margin-bottom: 1px; color: #333; text-shadow: 1px 1px 1px #fff;font-weight:100; font-family: "Muli", Georgia, "Times New Roman", Times, serif; ">
                    <img src="../../img/icon/icon_test_yes_Hovers.png" style="padding-right: 8px" />
                    <asp:PlaceHolder runat="server"><b><%: String.Concat("Sample ID ",Session["SampleID_Filter"]) %> | <%: String.Concat("Individual ID ",Session["IndivID"]) %></b></asp:PlaceHolder>
                </h4>
            </td>
            <td style="text-align: right" class="td_timer">
                <asp:Panel ID="Panel_lbl_timeData" runat="server">
                   <%-- <telerik:RadProgressBar RenderMode="Lightweight" ID="rpbFormCompleteness" MaxValue="100" MinValue="0" runat="server" Width="192px" BarType="Chunk" ShowLabel="false">
                        <ClientEvents OnLoad="progressBar_load" />
                        <AnimationSettings Duration="500" EnableChunkAnimation="true" />
                    </telerik:RadProgressBar>
                    <asp:Label runat="server" ID="lbl_timeData" Text="" CssClass="lblSample"></asp:Label>--%>
                </asp:Panel>
                <asp:Panel ID="Panel_lbl_countDown" runat="server" CssClass="pnl-countDown">
                    <%--<asp:Timer ID="countDown" runat="server" Interval="1000" OnTick="countDown_Tick"></asp:Timer>
                    <asp:Label runat="server" ID="lbl_countdown" Text="" CssClass="lbl_countdown lbl_blink"></asp:Label>--%>
                    <asp:Image ID="img_loading" runat="server" ImageUrl="~/img/icon-loading1.gif" Width="30" />
                    <asp:Label ID="lbl_loading" runat="server" Text="Loading..." CssClass="lbl-loading"></asp:Label>
                </asp:Panel>
            </td>
        </tr>
    </table>
</div>



<br />

<div class="content-body">
    <section id="basic-form-layouts">
        <div class="row" style="margin: 0 auto !important; width: 100%">

            <div style="width: 47%;">
                <asp:Panel ID="Time_Panel_RG" runat="server">
                    <asp:Timer ID="timerRefresh" runat="server" Interval="12000" OnTick="timerRefresh_Tick" >
                    </asp:Timer>
                    
                    <asp:HiddenField ID="HF_VarPhen" runat="server" Value="" />
                    <asp:HiddenField ID="HF_VarNoPhen" runat="server" Value="" />
                    <asp:HiddenField ID="HF_NoVarPhen" runat="server" Value="" />
                    <asp:HiddenField ID="HF_NoVarNoPhen" runat="server" Value="" />
                    <asp:HiddenField ID="HF_Variant" runat="server" Value="" />

                    <asp:Button runat="server" ID="btnShowStats"  Text="" style="display:none;" OnClick="btnShowStats_Click" />

                    <telerik:RadGrid RenderMode="Lightweight" ID="RG_SampleVariant" DataKeyNames="chr,start_pos,stop_pos,ref_all,alt_all" runat="server" GridLines="None" Height="700"
                        AllowPaging="True" AllowSorting="True" ShowGroupPanel="true" AutoGenerateColumns="False" CellSpacing="0" OnPreRender="RG_SampleVariant_PreRender"
                        ShowStatusBar="True" PageSize="20" AllowFilteringByColumn="True" CssClass="RG_SV" DataSourceID="Ds_SampleVariant"   
                        OnItemDataBound="RG_SampleVariant_ItemDataBound" OnExcelMLWorkBookCreated="RG_SampleVariant_ExcelMLWorkBookCreated" 
                        OnItemCommand="RG_SampleVariant_ItemCommand" >
                        <%--OnItemDataBound="RG_SampleVariant_ItemDataBound"  OnItemCommand="RG_SampleVariant_ItemCommand"--%>
                       
                        <MasterTableView Name="Master" DataKeyNames="chr,start_pos,stop_pos,ref_all,alt_all" BorderColor="Transparent" HeaderStyle-BorderColor="Transparent"
                            GridLines="None" DataSourceID="Ds_SampleVariant" CommandItemDisplay="Top" >
                            
                                <CommandItemSettings ShowExportToExcelButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="false" ExportToExcelText="Download Excel file"
                                    ExportToExcelImageUrl="../../img/icon/icon_excel_download.png"  />
                                <HeaderStyle CssClass="brdr-bottom" />
                               
                            <Columns>
                                <%--<telerik:GridBoundColumn DataField="v_type" DataType="System.String" HeaderText="Mutation type" UniqueName="v_type">
                                    <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Small"></HeaderStyle>
                                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>--%>
                                <telerik:GridTemplateColumn DataType="System.String" DataField="alt_cnt">
                                    <HeaderStyle Width="10%" CssClass="none-top-bottom-padding-header-sample" />
                                    <ItemStyle Width="10%"  CssClass="p-l-25" />
                                    <ItemTemplate>
                                        <asp:HiddenField runat="server" ID="hdn_geno" Value='<%# Bind("alt_cnt") %>' />
                                        <asp:Image ID="img_geno"  runat="server" CssClass="p-l-25" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                             
                                 <telerik:GridTemplateColumn DataType="System.String" DataField="v_type">
                                    <HeaderStyle Width="10%" CssClass="none-top-bottom-padding-header-sample" />
                                    <ItemStyle Width="10%" />
                                    <ItemTemplate>
                                        <asp:HiddenField runat="server" ID="hdn_mutationtype" Value='<%# Bind("v_type") %>' />
                                        <asp:Image ID="img_mutationtype" Width="26px" runat="server" CssClass="padding" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                 <telerik:GridTemplateColumn DataField="alt_cnt" DataType="System.String" HeaderText="Geno" UniqueName="alt_cnt" Display="false" HeaderStyle-Width="0" ItemStyle-Width="0">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lbl_alt_cnt"  />
                                    </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                 <telerik:GridBoundColumn DataField="v_type" DataType="System.String" HeaderText="Variant Type" UniqueName="v_type" Display="false" HeaderStyle-Width="0" ItemStyle-Width="0">
                                </telerik:GridBoundColumn>  
                                 <telerik:GridBoundColumn DataField="gene_name_list" DataType="System.Int64" HeaderText="Gene" >
                                    <HeaderStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Medium"></HeaderStyle>
                                    <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Small" />
                                </telerik:GridBoundColumn>

                                <telerik:GridTemplateColumn DataField="chr" DataType="System.Int32" UniqueName="chr" HeaderText="Chr">
                                    <HeaderStyle Width="10%" Font-Size="Medium" VerticalAlign="Middle" HorizontalAlign="Center" CssClass="padding-left-four none-top-bottom-padding-header-sample" />
                                    <ItemStyle Width="10%" Font-Size="Small" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lbl_chr" Text='<%# Bind("chr") %>' CssClass="bgAlt"  />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <%--<telerik:GridBoundColumn DataField="chr" DataType="System.String" HeaderText="Chr" UniqueName="chr">
                                    <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Small"></HeaderStyle>
                                    <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>--%>
                                <telerik:GridBoundColumn DataField="start_pos" DataType="System.Int64" HeaderText="Start" UniqueName="start_pos">
                                    <HeaderStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Medium"></HeaderStyle>
                                    <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Small" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="stop_pos" DataType="System.Int64" HeaderText="End" UniqueName="stop_pos">
                                    <HeaderStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Medium"></HeaderStyle>
                                    <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Small" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ref_all" DataType="System.String" HeaderText="Ref" UniqueName="ref_all">
                                    <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Medium"></HeaderStyle>
                                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Small" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="alt_all" DataType="System.String" HeaderText="Alt" UniqueName="alt_all">
                                    <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Medium"></HeaderStyle>
                                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Small" />
                                </telerik:GridBoundColumn>

                                 <telerik:GridBoundColumn DataField="gnomAD" DataType="System.String" HeaderText="gnomAD" UniqueName="gnomAD" HeaderStyle-Width="0" ItemStyle-Width="0" ItemStyle-CssClass="no-wrap">
                                </telerik:GridBoundColumn>
                                 <telerik:GridBoundColumn DataField="gene_annotations" DataType="System.String" HeaderText="gene annotations" UniqueName="gene_annotations" HeaderStyle-Width="0" ItemStyle-Width="0" ItemStyle-CssClass="no-wrap">
                                </telerik:GridBoundColumn>
                                 <telerik:GridBoundColumn DataField="ref_depth" DataType="System.String" HeaderText="ref depth" UniqueName="ref_depth"  HeaderStyle-Width="0" ItemStyle-Width="0" ItemStyle-CssClass="no-wrap">
                                </telerik:GridBoundColumn>
                                 <telerik:GridBoundColumn DataField="alt_depth" DataType="System.String" HeaderText="alt depth" UniqueName="alt_depth"  HeaderStyle-Width="0" ItemStyle-Width="0" ItemStyle-CssClass="no-wrap">
                                </telerik:GridBoundColumn>
                                 <telerik:GridBoundColumn DataField="phred_genotype" DataType="System.String" HeaderText="phred genotype" UniqueName="phred_genotype" HeaderStyle-Width="0" ItemStyle-Width="0" ItemStyle-CssClass="no-wrap">
                                </telerik:GridBoundColumn>
                                 <telerik:GridBoundColumn DataField="filter" DataType="System.String" HeaderText="Filter" UniqueName="filter"  HeaderStyle-Width="0" ItemStyle-Width="0" ItemStyle-CssClass="no-wrap">
                                </telerik:GridBoundColumn>
                                 <telerik:GridBoundColumn DataField="phred_score" DataType="System.String" HeaderText="phred score" UniqueName="phred_score"  HeaderStyle-Width="0" ItemStyle-Width="0" ItemStyle-CssClass="no-wrap">
                                </telerik:GridBoundColumn>
                            </Columns>

                            <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                        </MasterTableView>
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings EnableRowHoverStyle="true" Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="true">
                            <Selecting AllowRowSelect="true" />
                            <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                            <ClientEvents OnRowClick="getVariantDetail" />

                        </ClientSettings>


                        <FilterMenu RenderMode="Lightweight"></FilterMenu>
                        <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                    </telerik:RadGrid>


                </asp:Panel>
            </div>

            <div style="width: 50%; float: right; margin-left: 10px">

                <telerik:RadGrid RenderMode="Lightweight" ID="RG_SampleVariant_Detail" runat="server" GridLines="None" DataSourceID="Ds_SampleVariant_Detail"
                    AllowPaging="false" AllowSorting="True" ShowGroupPanel="true" AutoGenerateColumns="False" CellSpacing="0" CssClass="RG_SampleVariant_Detail" OnItemDataBound="RG_SampleVariant_Detail_ItemDataBound">
                    <MasterTableView CommandItemDisplay="None" Name="Master" AutoGenerateColumns="false" BorderColor="Transparent" HeaderStyle-BorderColor="Transparent"
                        DataSourceID="Ds_SampleVariant_Detail" GridLines="None">
                        <Columns>
                            <telerik:GridTemplateColumn DataField="gnomAD" DataType="System.string" UniqueName="gnomAD" Visible="false">
                                <ItemTemplate>
                                    <asp:HiddenField runat="server" ID="hdn_gnomAD" Value='<%# Bind("gnomAD") %>' />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn DataField="gene_annotations" DataType="System.string" UniqueName="gene_annotations" Visible="false">
                                <HeaderStyle Width="10%" Font-Size="Small" />
                                <ItemStyle Width="10%" />
                                <ItemTemplate>
                                    <asp:HiddenField runat="server" ID="hdn_geneAnnot" Value='<%# Bind("gene_annotations") %>' />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn ColumnGroupName="SampleName">
                                <HeaderStyle Width="18px" CssClass="hidden" />
                                <ItemTemplate>
                                    <telerik:RadTabStrip RenderMode="Lightweight" runat="server" ID="RadTabStrip2" CssClass="float-l-width-44" MultiPageID="RadMultiPage_DataHolder" Orientation="VerticalRight" Skin="Silk" SelectedIndex="0">
                                        <Tabs>
                                            <telerik:RadTab ImageUrl="../../img/tab-icon/sample.png" SelectedImageUrl="../../img/tab-icon/sample-hover.png" HoveredImageUrl="../../img/tab-icon/sample-hover.png" ToolTip="Sample" Height="48px"></telerik:RadTab>
                                            <telerik:RadTab ImageUrl="../../img/tab-icon/transcript.png" SelectedImageUrl="../../img/tab-icon/transcript-hover.png" HoveredImageUrl="../../img/tab-icon/transcript-hover.png" ToolTip="Transcripts" Height="48px"></telerik:RadTab>
                                            <telerik:RadTab ImageUrl="../../img/tab-icon/lab.png" SelectedImageUrl="../../img/tab-icon/lab-hover.png" HoveredImageUrl="../../img/tab-icon/lab-hover.png" ToolTip="Lab Knowledgebase" Height="48px"></telerik:RadTab>
                                            <telerik:RadTab ImageUrl="../../img/tab-icon/finding.png" ToolTip="Lab Findings" Height="48px" SelectedImageUrl="../../img/tab-icon/finding-hover.png" HoveredImageUrl="../../img/tab-icon/finding-hover.png"></telerik:RadTab>

                                            <telerik:RadTab ImageUrl="../../img/tab-icon/population.png" ToolTip="Population" Height="48px" SelectedImageUrl="../../img/tab-icon/population-hover.png" HoveredImageUrl="../../img/tab-icon/population-hover.png"></telerik:RadTab>
                                            <telerik:RadTab ImageUrl="../../img/tab-icon/functional.png" ToolTip="Functional" Height="48px" SelectedImageUrl="../../img/tab-icon/functional-hover.png" HoveredImageUrl="../../img/tab-icon/functional-hover.png"></telerik:RadTab>
                                            <telerik:RadTab ImageUrl="../../img/tab-icon/link.png" ToolTip="Link" Height="46px" CssClass="p-l-12" SelectedImageUrl="../../img/tab-icon/link-hover.png" HoveredImageUrl="../../img/tab-icon/link-hover.png"></telerik:RadTab>
                                        </Tabs>
                                    </telerik:RadTabStrip>

                                    <telerik:RadMultiPage ID="RadMultiPage_DataHolder" runat="server" CssClass="innerMultiPage" SelectedIndex="0">
                                        <telerik:RadPageView ID="RadPageView1" runat="server">
                                            <div class="rgHeader condition_title">
                                                <span style="padding-left: 25px">General Details</span>

                                            </div>
                                            <table class="tbl-container">
                                                <tr class="h-30">
                                                    <td>
                                                        <b>Chromosome : </b>
                                                        <asp:Label runat="server" ID="lbl_chrom" Text='<%# Bind("chr") %>' />

                                                    </td>
                                                    <td>
                                                        <b>Reference/Alternative : </b>
                                                        <asp:Label runat="server" ID="Lbl_refAlt" Text='<%# String.Concat(Eval("ref_all")," / ",Eval("alt_all")) %>' />
                                                    </td>
                                                </tr>
                                                <tr class="h-30">

                                                    <td>
                                                        <b>Start Position : </b>
                                                        <asp:Label runat="server" ID="lbl_start" Text='<%# Bind("start_pos") %>' />
                                                    </td>
                                                    <td>
                                                        <b>End Position : </b>
                                                        <asp:Label runat="server" ID="lbl_end" Text='<%# Bind("stop_pos") %>' />
                                                    </td>
                                                </tr>
                                                <tr class="h-30">

                                                    <td>
                                                        <b>Zygosity : </b>
                                                        <asp:Label runat="server" ID="lbl_geno" Text='<%# Bind("zygo") %>' />
                                                    </td>
                                                    <td style="width: 50%; padding-left: 7px">
                                                        <b>Coverage (Reference/Alternate) : </b>
                                                        <asp:Label runat="server" ID="Label1" Text='<%# String.Concat(" (",Eval("ref_depth"),"/",Eval("alt_depth")," )") %>' />
                                                    </td>
                                                    <%--<td>
                                                            <b>Gene : </b>
                                                            <asp:Label runat="server" ID="lbl_gene" Text='<%# Bind("GENE") %>' />
                                                        </td>--%>
                                                </tr>

                                                <tr class="h-30">

                                                    <td>
                                                        <b>Genotype Quality : </b>
                                                        <asp:Label runat="server" ID="lbl_genoqual" Text='<%# Bind("phred_genotype") %>' />
                                                    </td>
                                                    <td>
                                                        <b>Filter : </b>
                                                        <asp:Label runat="server" ID="lbl_filter" Text='<%# Bind("filter") %>' />
                                                    </td>
                                                </tr>
                                                <%--<tr class="h-30" style="vertical-align: top">
                                                        <td colspan="3">
                                                            <b>Effect : </b>
                                                            <br />
                                                            <asp:HiddenField runat="server" ID="hdn_effect" Value='<%# Bind("Effect") %>' />
                                                            <telerik:RadListView runat="server" ID="RLV_effect" RenderMode="Lightweight"
                                                                CheckBoxes="false" ShowCheckAll="false">
                                                            </telerik:RadListView>
                                                        </td>
                                                    </tr>--%>
                                            </table>
                                            <br />
                                        </telerik:RadPageView>
                                        <telerik:RadPageView ID="RadPageView2" runat="server">
                                            <div class="rgHeader condition_title" >
                                                <span style="padding-left: 25px">Transcripts</span>

                                            </div>
                                            <table class="tbl-container" style="width: 100%; overflow-x: scroll; height: 272px; display:inline-block">
                                                <tbody>
                                                    <tr style="background: none; border-bottom: none">
                                                        <td colspan="5">
                                                            <asp:GridView ID="GrdJSONTranscript" runat="server" CssClass="tbl_transcript tbl-container" CellPadding="5" CellSpacing="5" GridLines="none">
                                                                <%-- BackColor="White" BorderColor="#3399ff" BorderStyle="Dotted" BorderWidth="1px"--%>
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </telerik:RadPageView>
                                        <telerik:RadPageView ID="RadPageView4" runat="server">
                                            <div class="rgHeader condition_title">
                                                <span style="padding-left: 25px">Lab Knowledgebase</span>
                                            </div>
                                            <table class="tbl-container" runat="server">
                                                <tr>
                                                    <td colspan="3">
                                                        <h5>There is No data to display. </h5>
                                                    </td>
                                                </tr>

                                            </table>
                                            <%--<telerik:RadGrid RenderMode="Lightweight" ID="RG_LabKnowledge" runat="server" GridLines="Both" CssClass="RG_LabKnowledge"
                                                    AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="-1" Height="330px" OnItemUpdated="RG_LabKnowledge_ItemUpdated"
                                                    ShowStatusBar="True" AllowAutomaticDeletes="True" AllowAutomaticInserts="true" Width="100%" OnItemDataBound="RG_LabKnowledge_ItemDataBound"
                                                    AllowAutomaticUpdates="True" DataSourceID="Ds_SampleVariant_Lab_Knowledge" DataKeyNames="SampleID" PageSize="6">
                                                    <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                                                    <MasterTableView CommandItemDisplay="Top" Name="Master" AutoGenerateColumns="false" DataSourceID="Ds_SampleVariant_Lab_Knowledge" DataKeyNames="SampleID" NoMasterRecordsText="No records to display.">

                                                        <CommandItemTemplate>
                                                            <telerik:RadButton RenderMode="Lightweight" runat="server" ID="RB_insert" CommandName="InitInsert" Text="Add New Comment" Height="22px" Font-Size="Smaller">
                                                                <Icon PrimaryIconUrl="~/img/icon/icon_insert_Sample.png" PrimaryHoveredIconUrl="~/img/icon/icon_insert_Sample_Hovered.png" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                                                            </telerik:RadButton>
                                                        </CommandItemTemplate>

                                                        <Columns>
                                                            <telerik:GridBoundColumn DataField="SampleID" DataType="System.Int64" HeaderText="Sample ID" UniqueName="SampleID">
                                                                <HeaderStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                                <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="UserName" DataType="System.String" HeaderText="User" UniqueName="UserName">
                                                                <HeaderStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="left"></HeaderStyle>
                                                                <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="left" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Comment" HeaderText="Description" UniqueName="Comment">
                                                                <HeaderStyle Width="35%" VerticalAlign="Middle" HorizontalAlign="left"></HeaderStyle>
                                                                <ItemStyle Width="35%" VerticalAlign="Middle" HorizontalAlign="left" CssClass="p-l-5" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="State" HeaderText="State" UniqueName="State">
                                                                <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="left"></HeaderStyle>
                                                                <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="left" CssClass="p-l-5" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="GDateAdd" HeaderText="Date" UniqueName="Date" DataType="System.DateTime"
                                                                DataFormatString="{0:dd/MM/yyyy}">
                                                                <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="left"></HeaderStyle>
                                                                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="left" CssClass="p-l-5" />
                                                            </telerik:GridBoundColumn>
                                                        </Columns>
                                                        <EditFormSettings EditFormType="Template" FormStyle-CssClass=".width-fix ">
                                                            <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
                                                            <FormTemplate>

                                                                <div class="col-md-12">
                                                                    <div class="card cardEditMode">
                                                                        <div class="card-content collpase show">
                                                                            <div class="card-body card-bodyEditMode">
                                                                                <form class="form form-horizontal">
                                                                                    <div class="form-body">
                                                                                        <div class="form-group row">
                                                                                            <label class="col-md-2 label-control" for="projectinput1">Description:</label>
                                                                                            <div class="col-md-4">
                                                                                                <asp:TextBox ValidationGroup="SubmitGroup" ID="Txt_Desc" class="form-control" Font-Size="Smaller"
                                                                                                    runat="server" Text='<%# Bind("Comment")%>' TextMode="MultiLine" Height="50px"></asp:TextBox>
                                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_Desc" runat="server" Display="Dynamic"
                                                                                                    ValidationGroup="SubmitGroup" ControlToValidate="Txt_Desc" ErrorMessage="!" ForeColor="#CC0000">
                                                                                                </asp:RequiredFieldValidator>
                                                                                            </div>

                                                                                            <label class="col-md-2 label-control" for="projectinput1">State:</label>
                                                                                            <div class="col-md-3">
                                                                                                <asp:DropDownList ValidationGroup="SubmitGroup" ID="DDL_St" runat="server" DataSourceID="Sql_Lab_Knowledge_DDL_St"
                                                                                                    Width="100px" SelectedValue='<%# Bind("State")%>' AppendDataBoundItems="True" class="form-control"
                                                                                                    DataTextField="txt_St" DataValueField="val_St" Font-Size="Smaller" Height="25px">
                                                                                                    <asp:ListItem Value="">Select one</asp:ListItem>
                                                                                                </asp:DropDownList>
                                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                                                                                    ValidationGroup="SubmitGroup" ControlToValidate="DDL_St" ErrorMessage="!" ForeColor="#CC0000">
                                                                                                </asp:RequiredFieldValidator>
                                                                                            </div>

                                                                                        </div>

                                                                                    </div>

                                                                                    <div class="form-actions m-0 pt-1 pb-1 center">
                                                                                        <asp:Button ID="btnUpdate" ValidationGroup="SubmitGroup" Text='<%# (Container is GridEditFormInsertItem) ? "Insert" : "Update" %>' class="btn btn-success mr-1 ladda-button btn-sm" data-style="expand-right"
                                                                                            runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'></asp:Button>&nbsp;
                                                                <asp:Button ID="Button1" Text="Cancel" runat="server" class="btn btn-danger mr-1 ladda-button btn-sm" data-style="expand-right"
                                                                    CommandName="Cancel" CausesValidation="False"></asp:Button>
                                                                                    </div>
                                                                                </form>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>



                                                                </div>
                                                            </FormTemplate>

                                                            <PopUpSettings KeepInScreenBounds="True"></PopUpSettings>
                                                        </EditFormSettings>
                                                        <PagerStyle AlwaysVisible="True"></PagerStyle>
                                                    </MasterTableView>
                                                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                                                    <ClientSettings EnableRowHoverStyle="true">
                                                        <Selecting AllowRowSelect="true" />
                                                        <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                                                    </ClientSettings>

                                                    <FilterMenu RenderMode="Lightweight"></FilterMenu>

                                                    <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                                                </telerik:RadGrid>--%>
                                        </telerik:RadPageView>
                                        <telerik:RadPageView ID="RadPageView5" runat="server">
                                            
                                            <div class="rgHeader condition_title">
                                                <span style="padding-left: 25px">Statistic</span>
                                            </div>

                                            <div id="div_loading" runat="server" class="spinner-box displyNon">
                                                            <div class="pulse-container">
                                                                <div class="pulse-bubble pulse-bubble-1"></div>
                                                                <div class="pulse-bubble pulse-bubble-2"></div>
                                                                <div class="pulse-bubble pulse-bubble-3"></div>
                                                            </div>
                                             </div>

                                            <table class="tbl-container" runat="server" style="width: 90% !important;">
                                                <tr><td colspan="3">
                                                    <h5><asp:Label runat="server" ID="lbl_StatTitle" /></h5>
                                                    </td></tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <telerik:RadComboBox RenderMode="Lightweight" ID="RCB_HpoList" runat="server" Height="200" Width="315" 
                                                            DropDownWidth="200" EmptyMessage="Choose a HPO" HighlightTemplatedItems="true"
                                                            EnableLoadOnDemand="true" OnClientSelectedIndexChanged="onClick_GetReqId" 
                                                             Filter="StartsWith" Label="HPO: " DataSourceID="DS_Hpo_PerIndv" DataTextField="HPOID" 
                                                            DataValueField="HPOID"  Skin="Silk" >
                                                        </telerik:RadComboBox>
                                                        
                                                    </td>
                                                    <td style="background-color: white;"></td>
                                                    
                                                </tr>
                                                <tr><td colspan="3"><hr /></td></tr>
                                                <tr>
                                                    <td colspan="2">
                                                         
                                                        <table class="tbl_stat">
                                                          <tr>
                                                            <th></th>
                                                            <th class="txt-middel" scope="col">Variant</th>
                                                            <th class="txt-middel" scope="col">No Variant</th>
                                                            <th class="txt-middel" scope="col">Marginal Row Totals</th>
                                                          </tr>
                                                          <tr>
                                                            <th scope="row">Phenotype</th>
                                                            <td><asp:Label runat="server" ID="lbl_VP" /></td>
                                                            <td><asp:Label runat="server" ID="lbl_NVP" /></td>
                                                            <td><asp:Label runat="server" ID="lbl_TotalPhen" /></td>
                                                          </tr>
                                                          <tr>
                                                            <th scope="row">No Phenotype</th>
                                                            <td><asp:Label runat="server" ID="lbl_VNP" /></td>
                                                            <td><asp:Label runat="server" ID="lbl_NVNP" /></td>
                                                            <td><asp:Label runat="server" ID="lbl_TotalNoPhen" /></td>
                                                          </tr>
                                                          <tr>
                                                            <th scope="row">Marginal Column Totals</th>
                                                            <td><asp:Label runat="server" ID="lbl_TotalVar" /></td>
                                                            <td><asp:Label runat="server" ID="lbl_TotalNoVar" /></td>
                                                            <td><asp:Label runat="server" ID="lbl_Total" /></td>
                                                          </tr>
                                                        </table>
                                                    </td>

                                                    <td style="vertical-align: text-top; padding: 10px 0 0 25px !important; background-color: white;">
                                                        <h6 style="background: #14afca;
                                                            color: #fff;
                                                            padding: 5px;
                                                            border-bottom-left-radius: 10px;
                                                            border-top-right-radius: 10px;
                                                            margin-right: 5px;
                                                            margin-top: 5px;">Statistics result/FisherExact Test:</h6>
                                                        <hr />
                                                        <asp:Label runat="server" ID="lbl_FisherStats" CssClass="lbl-fisherStats" />
                                                    </td>
                                                </tr>
                                                <tr><td colspan="3">
                                                        <asp:Label runat="server" ID="lbl_msgRelatedToAssembly" CssClass="displyNon" />
                                                    </td></tr>
                                            </table>
                                        </telerik:RadPageView>
                                        <telerik:RadPageView ID="RadPageView6" runat="server">
                                            <div class="rgHeader condition_title">
                                                <span style="padding-left: 25px">Population frequency</span>
                                            </div>
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
                                                                        <h6>Number of Alleles</h6>
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
                                                                        <asp:Label runat="server" ID="lbl_AN_AFR" Text="" /></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbl_AF_AFR" Text="" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <h7>Ashkenazi Jewish</h7>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbl_AN_ASJ" /></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbl_AF_ASJ" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <h7>East Asian</h7>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbl_AN_EAS" /></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbl_AF_EAS" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <h7>European (Finnish)</h7>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbl_AN_FIN" /></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbl_AF_FIN" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <h7>European (Non-Finnish)</h7>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbl_AN_NFE" /></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbl_AF_NFE" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <h7>Latino</h7>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbl_AN_AMR" /></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbl_AF_AMR" /></td>
                                                                </tr>

                                                                <tr style="border-bottom: none">
                                                                    <td>
                                                                        <h7>Other</h7>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbl_AN_OTH" /></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbl_AF_OTH" /></td>
                                                                </tr>
                                                                <tr style="border-top: 1px solid #14AFCA;
        border-bottom: 1px solid #14AFCA
">
                                                                    <td>
                                                                        <h7><b>Total</b></h7>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbl_AN" /></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbl_AF" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <h7>Female</h7>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbl_AN_Female" /></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbl_AF_Female" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <h7>Male</h7>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbl_AN_Male" /></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbl_AF_Male" /></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                        </telerik:RadPageView>

                                        <telerik:RadPageView ID="RadPageView7" runat="server">
                                            <div class="rgHeader condition_title">
                                                <span style="padding-left: 25px">Functional</span>
                                            </div>
                                            <table class="tbl-container" runat="server">
                                                <tr>
                                                    <td colspan="3">
                                                        <h5><b>CADD Score:</b>
                                                            <asp:Label runat="server" ID="lbl_phred_score" Text='<%# Bind("phred_score") %>' /></h5>


                                                    </td>
                                                </tr>

                                            </table>
                                        </telerik:RadPageView>
                                        <telerik:RadPageView ID="RadPageView8" runat="server">
                                            <div class="rgHeader condition_title">
                                                <span style="padding-left: 25px ">External Links</span>
                                            </div>
                                            <table class="tbl-container tbl-container-link" runat="server">
                                                <tr>
                                                    <td>
                                                        <asp:HyperLink runat="server" ID="hl_varsome_chr_spos" NavigateUrl='<%# string.Format("https://varsome.com/position/hg19/chr{0}-{1}",HttpUtility.UrlEncode(Eval("chr").ToString()), HttpUtility.UrlEncode(Eval("start_pos").ToString())) %>'
                                                            Text='<%# string.Format("Varsome ( chr: {0}, start position: {1} )", Eval("chr"), Eval("start_pos")) %>' Target="_blank"></asp:HyperLink>
                                                    </td>
                                                </tr>
                                                <%-- <tr>
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
                                                            <asp:HyperLink runat="server" ID="hl_mastermind_gene" NavigateUrl='<%# string.Format("https://mastermind.genomenon.com/detail?disease=all%20diseases&gene={0}",HttpUtility.UrlEncode(Eval("GENE").ToString()) ) %>'
                                                                Text='<%# string.Format("Master Mind ( gene: {0} )", Eval("GENE")) %>' Target="_blank"></asp:HyperLink>
                                                        </td>
                                                    </tr>--%>
                                                <tr>
                                                    <td>
                                                        <asp:HyperLink runat="server" ID="hl_trapscore_chr_spos" NavigateUrl='<%# string.Format("http://trap-score.org/Search?query={0}-{1}",HttpUtility.UrlEncode(Eval("chr").ToString()), HttpUtility.UrlEncode(Eval("start_pos").ToString()) ) %>'
                                                            Text='<%# string.Format("TraP Score ( chr: {0}, start position: {1} )", Eval("chr"), Eval("start_pos")) %>' Target="_blank"></asp:HyperLink>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:HyperLink runat="server" ID="hl_trapscore_chr_spos_alt_ref" NavigateUrl='<%# string.Format("http://trap-score.org/Search?query={0}-{1}-{2}-{3}",HttpUtility.UrlEncode(Eval("chr").ToString()), HttpUtility.UrlEncode(Eval("start_pos").ToString()), HttpUtility.UrlEncode(Eval("ref_all").ToString()), HttpUtility.UrlEncode(Eval("alt_all").ToString()) ) %>'
                                                            Text='<%# string.Format("TraP Score ( chr: {0}, start position: {1}, Reference: {2}, Alternative: {3} )", Eval("chr"), Eval("start_pos"), Eval("ref_all"), Eval("alt_all")) %>' Target="_blank"></asp:HyperLink>
                                                    </td>
                                                </tr>
                                                <%--<tr>
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
                                                    </tr>--%>
                                                <tr>
                                                    <td>
                                                        <asp:HyperLink runat="server" ID="hl_ucsc" NavigateUrl='<%# string.Format("http://genome-euro.ucsc.edu/cgi-bin/hgTracks?db=hg19&lastVirtModeType=default&lastVirtModeExtraState=&virtModeType=default&virtMode=0&nonVirtPosition=&position=chr{0}%3A{1}-{1}",HttpUtility.UrlEncode(Eval("chr").ToString()), HttpUtility.UrlEncode(Eval("start_pos").ToString())) %>'
                                                            Text='<%# string.Format("Genomics institude - UCSC  ( chr: {0}, start position: {1} )", Eval("chr"), Eval("start_pos") ) %>' Target="_blank"></asp:HyperLink>
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
               
                
               <%-- <br />
                <div style="width:80%">
                    <ul class="reqIdsLst"></ul>
                    <ul class="timeLst"></ul>
                     <telerik:RadLabel ID="lbl_Status" runat="server" Text="" CssClass="lbl-status" />
                    <hr />
                    <div id="VP_holder"></div><hr />
                    <ul class="variantPhenResultLst"></ul>
                </div>
            </div>--%>

        </div>
        <telerik:RadWindowManager ID="RadWindowManager2" ShowContentDuringLoad="true" RenderMode="Lightweight"
            ReloadOnShow="true" runat="server" EnableShadow="true"
            Skin="Windows7" AutoSize="false" VisibleTitlebar="false">
            <Windows>
                <telerik:RadWindow ID="RadWindow2" runat="server" RenderMode="Lightweight" BorderStyle="None" BorderWidth="1px" CssClass="px-0 pb-0" Modal="true" Behaviors="Close">
                </telerik:RadWindow>
            </Windows>
        </telerik:RadWindowManager>

        <asp:SqlDataSource ID="Ds_SampleVariant" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
            SelectCommand="Sp_Filter_Result_Variant_Grid_Sel" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="SampleID" SessionField="SampleID_Filter" Type="String" />
                <asp:SessionParameter Name="FilterID" SessionField="FilterID_Filter" Type="String" />
                <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="String" />
                <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="String" />
                <asp:SessionParameter Name="FileID" SessionField="FileID_Filter" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="Ds_SampleVariant_Detail" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
            SelectCommand="Sp_Filter_Result_Variant_Detail_Sel" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="TblN" SessionField="TblName" Type="String" />
                <%--<asp:SessionParameter Name="SampleID" SessionField="SampleID_Filter" Type="String" />--%>
                <asp:ControlParameter ControlID="RG_SampleVariant" Name="CHR" PropertyName="SelectedValues['chr']" Type="String" />
                <asp:ControlParameter ControlID="RG_SampleVariant" Name="START" PropertyName="SelectedValues['start_pos']" Type="String" />
                <asp:ControlParameter ControlID="RG_SampleVariant" Name="END" PropertyName="SelectedValues['stop_pos']" Type="String" />
                <asp:ControlParameter ControlID="RG_SampleVariant" Name="REF" PropertyName="SelectedValues['ref_all']" Type="String" />
                <asp:ControlParameter ControlID="RG_SampleVariant" Name="ALT" PropertyName="SelectedValues['alt_all']" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="DS_Hpo_PerIndv" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
            SelectCommand="Sp_Filter_Result_Individual_HPOs_Sel" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="IndividualID" SessionField="IndvId_Filter" Type="Int64" />
                <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <%--        <asp:SqlDataSource ID="Ds_SampleVariant_Detail" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
            SelectCommand="Sp_Sample_Varinat_Detail_Sel" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="SampleID" SessionField="SampleID_Filter" Type="String" />
                <asp:ControlParameter ControlID="RG_SampleVariant" Name="CHR" PropertyName="SelectedValues['CHR']" Type="String" />
                <asp:ControlParameter ControlID="RG_SampleVariant" Name="START" PropertyName="SelectedValues['START']" Type="Int32" />
                <asp:ControlParameter ControlID="RG_SampleVariant" Name="END" PropertyName="SelectedValues['END']" Type="String" />
                <asp:ControlParameter ControlID="RG_SampleVariant" Name="REF" PropertyName="SelectedValues['REF']" Type="String" />
                <asp:ControlParameter ControlID="RG_SampleVariant" Name="ALT" PropertyName="SelectedValues['ALT']" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="Ds_SampleVariant_Condition" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
            SelectCommand="Sp_Sample_Varinat_Condition_Sel" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="SampleID" SessionField="SampleID_Filter" Type="String" />
                <asp:ControlParameter ControlID="RG_SampleVariant" DefaultValue="" Name="CHR" PropertyName="SelectedValues['CHR']" Type="String" />
                <asp:ControlParameter ControlID="RG_SampleVariant" Name="START" PropertyName="SelectedValues['START']" Type="Int32" />
                <asp:ControlParameter ControlID="RG_SampleVariant" Name="END" PropertyName="SelectedValues['END']" Type="Int32" />
                <asp:ControlParameter ControlID="RG_SampleVariant" Name="REF" PropertyName="SelectedValues['REF']" Type="String" />
                <asp:ControlParameter ControlID="RG_SampleVariant" Name="ALT" PropertyName="SelectedValues['ALT']" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>--%>
    </section>
</div>

<%--<telerik:RadGrid runat="server" ID="RG_CenterList" DataSourceID="Ds_CenterList" DataKeyNames="HostID,CenterID,CenterIP">
<MasterTableView Name="Master" DataKeyNames="HostID,CenterID,CenterIP" ></MasterTableView>
</telerik:RadGrid>

<asp:SqlDataSource ID="Ds_CenterList" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="SELECT * FROM Tbl_Center_Host"></asp:SqlDataSource>--%>

<script type="text/javascript" src="../../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../assets/js/jquery.dataTables.min.js"></script>

<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <script type="text/javascript">
        <%--$(document).ready(function () {
            console.log("indvId: " + '<%= Session["IndvId_Filter"] %>');
            console.log("userId: " + '<%= Session["WiNGSMasterId"] %>');
            console.log("centerId: " + '<%= Session["Current_CenterID"] %>');
            console.log("hostId: " + '<%= Session["HostID"] %>');
        });--%>

        function onRequestStart(sender, args) {
            if (args.get_eventTarget().indexOf("ExportTo") >= 0) {
                args.set_enableAjax(false);
            }
        }

        function OpenWin_IGV() {
            var oWnd = radopen("/GAP/IGV.aspx", "RadWindow2");
            var h = $(document).height();
            var w = $(document).width();
            oWnd.set_height(0.90 * h);
            oWnd.set_width(0.90 * w);
            oWnd.center();
        }

        var varPhen = 0;
        var varNoPhen = 0;
        var noVarPhen = 0;
        var noVarNoPhen = 0;
        var totalVar = 0;
        var totalNoVar = 0;
        var totalPhen = 0;
        var totalNoPhen = 0;
        var total = 0;
        var err = 0; // No error

        function getVariantDetail(sender, args) {
            varPhen = 0;
            varNoPhen = 0;
            noVarPhen = 0;
            noVarNoPhen = 0;
            var grid = $find("<%= RG_SampleVariant.ClientID %>");
            var masterTable = grid.get_masterTableView();
            var row = masterTable.get_dataItems()[args.get_itemIndexHierarchical()];

            var chr = masterTable.getCellByColumnUniqueName(row, "chr").innerText;
            var start = masterTable.getCellByColumnUniqueName(row, "start_pos").innerText;
            var ref = masterTable.getCellByColumnUniqueName(row, "ref_all").innerText;
            var alt = masterTable.getCellByColumnUniqueName(row, "alt_all").innerText;

            if ((chr === null || chr === '') || (start === null || start === '') ||
                (ref === null || ref === '') || (alt === null || alt === '')) {
                alert("Error! Invalid variant format.\n Expected chr - pos - ref - alt");
                err = 1; // Has error
            }

            var Variant = chr + '-' + start + '-' + ref + '-' + alt;
            var hd_variant = document.getElementById('<%= HF_Variant.ClientID%>');
            hd_variant.value = Variant;


        }

        var counter = 0;
        function onClick_GetReqId() {

            var grid = $find("<%=RG_SampleVariant_Detail.ClientID %>");
            var MasterTable = grid.get_masterTableView();
            var row = MasterTable.get_dataItems()[0];

            row.findElement("lbl_VP").innerText = "";
            row.findElement("lbl_NVP").innerText = "";
            row.findElement("lbl_VNP").innerText = "";
            row.findElement("lbl_NVNP").innerText = "";
            row.findElement("lbl_TotalPhen").innerText = "";
            row.findElement("lbl_TotalNoPhen").innerText = "";
            row.findElement("lbl_TotalVar").innerText = "";
            row.findElement("lbl_TotalNoVar").innerText = "";
            row.findElement("lbl_Total").innerText = "";

            if (counter === Number('<%= Session["NumberOfCentersAndHosts"] %>')) {
                $('.reqIdsLst').empty();
                $('.variantPhenResultLst').empty();
                $('#VP_holder').empty();
                counter = 0;
            }
            var url = "/Upload/centerList.json";
            var UserId = '<%= Session["WiNGSMasterId"] %>';
            var CenterIdOfUsr = '<%= Session["Current_CenterID"] %>';
            var HostIdOfUser = '<%= Session["HostID"] %>';

            var masterTable = $find("<%=RG_SampleVariant_Detail.ClientID%>").get_masterTableView();
            var comboHpo = masterTable.get_dataItems()[0].findControl('RCB_HpoList');

            var hd_variant = document.getElementById('<%= HF_Variant.ClientID%>');

            //var Variant = chr + '-' + start + '-' + ref + '-' + alt;          
            var PhenTerm = comboHpo.get_value(); //'HP:0010704'; //
            var SeqType = '<%= Session["SeqType"] %>';
            var RefBuild = '<%= Session["RefBuild"] %>';

            $.getJSON(url, function (data) {
                $.each(data, function (HostId, model) {

                    var HostId = model.HostId;
                    var CenterId = model.CenterId;
                    //var IpCenter = model.IpCenter;
                    if (err === 1) {
                        alert("Error! Invalid variant format.\n Expected chr - pos - ref - alt");
                        row.findElement("lbl_FisherStats").innerText = "Error! Try it again.";
                        return false; // breaks
                    }
                    else {
                        row.findElement("lbl_FisherStats").innerText = "in progress...";

                        var list = [CenterId, HostId, hd_variant.value, PhenTerm, SeqType, RefBuild];
                        var jsonText = JSON.stringify({ list: list });

                        $.ajax({
                            type: 'POST',
                            contentType: 'application/json; charset=utf-8',
                            data: jsonText,
                            async: true,
                            dataType: 'JSON',
                            url: '/GAP/Service/se_SampleResult.asmx/GetReqIdAsync',
                            success: function (result) {
                                res = JSON.parse(result.d);
                                //$('.reqIdsLst').append('<li> CenterId: ' + res["0"].centerId + ' HostId: ' + res["0"].hostId + ' ReqId: ' + res["0"].reqId + '</li>');
                                counter++;
                                get_variantPhenResultAsync(res["0"].centerId, res["0"].hostId, res["0"].reqId);

                            },
                            error: function (jqXHR, exception) {
                                var msg = '';
                                if (jqXHR.status === 0) {
                                    msg = 'Not connect.\n Verify Network.';
                                } else if (jqXHR.status == 404) {
                                    msg = 'Requested page not found. [404]';
                                } else if (jqXHR.status == 500) {
                                    msg = 'Internal Server Error [500].';
                                } else if (exception === 'parsererror') {
                                    msg = 'Requested JSON parse failed.';
                                } else if (exception === 'timeout') {
                                    msg = 'Time out error.';
                                } else if (exception === 'abort') {
                                    msg = 'Ajax request aborted.';
                                } else {
                                    msg = 'Uncaught Error.\n' + jqXHR.responseText;
                                }
                                alert(msg);
                            }

                        });
                    }
                })
            });
        }


        function get_variantPhenResultAsync(centerId, hostId, reqId) {
            //sleep(2000);
            var st;
            //var element = document.getElementById('VP_lbl' + centerId + hostId);

            //if (typeof (element) == 'undefined' || element == null) {
            //    //console.log('new element: ' + 'VP_lbl' + centerId + hostId);
            //    var br = document.createElement("br");
            //    var lbl = document.createElement("Label");
            //    lbl.setAttribute("id", "VP_lbl" + centerId + hostId);
            //    lbl.style.backgroundColor = "#f1d9d5";
            //    lbl.innerHTML = "Center " + centerId + " and Host " + hostId + ": Calculation in progress!";
            //    VP_holder.appendChild(lbl);
            //    VP_holder.appendChild(br);
            //}



            var list = [centerId, hostId, reqId];
            var jsonText = JSON.stringify({ list: list });

            var grid = $find("<%=RG_SampleVariant_Detail.ClientID %>");
            var MasterTable = grid.get_masterTableView();
            var row = MasterTable.get_dataItems()[0];

            jQuery.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                data: jsonText,
                async: true,
                dataType: 'JSON',
                url: '/GAP/Service/se_SampleResult.asmx/GetVariantPhenResultAsync',
                beforeSend: function () {
                    var element = row.findElement("div_loading");
                    element.classList.remove("displyNon");
                    console.log('Calculation in progress!');
                    //sleepVer2(2000);

                },
                success: function (result) {
                    var res = JSON.parse(result.d);
                    st = res["0"].st;

                    if (st == 'inprogress') {
                        sleepVer2(2000);
                        setInterval(get_variantPhenResultAsync(centerId, hostId, reqId), 2000);
                    }
                    else if (st == 'completed') {
                        //$('.variantPhenResultLst').append('<li> CenterId: ' + res["0"].centerId + ' HostId: ' + res["0"].hostId +
                        //    ' variant-phenotype: ' + res["0"].VP +
                        //    ' variant-no-phenotype: ' + res["0"].VNP +
                        //    ' no-variant-phenotype: ' + res["0"].NVP +
                        //    ' no-variant-no-phenotype: ' + res["0"].NVNP +
                        //    '</li><hr/>');
                        varPhen = varPhen + Number(res["0"].VP);
                        varNoPhen = varNoPhen + Number(res["0"].VNP);
                        noVarPhen = noVarPhen + Number(res["0"].NVP);
                        noVarNoPhen = noVarNoPhen + Number(res["0"].NVNP);

                        row.findElement("lbl_VP").innerText = varPhen;
                        row.findElement("lbl_NVP").innerText = noVarPhen;
                        row.findElement("lbl_VNP").innerText = varNoPhen;
                        row.findElement("lbl_NVNP").innerText = noVarNoPhen;

                        if (res["0"].msg != "") {
                            row.findElement("lbl_msgRelatedToAssembly").classList.remove("displyNon");
                            row.findElement("lbl_msgRelatedToAssembly").innerText = res["0"].msg;
                        }
                        else {
                            row.findElement("lbl_msgRelatedToAssembly").innerText = "";
                            row.findElement("lbl_msgRelatedToAssembly").classList.add("displyNon");
                        }

                        //console.log("vp:" + varPhen + ", vnp: " + varNoPhen + ", nvp: " + noVarPhen + ", nvnp: " + noVarNoPhen);
                    }
                },
                error: function (jqXHR, exception) {
                    var msg = '';
                    if (jqXHR.status === 0) {
                        msg = 'Not connect.\n Verify Network.';
                    } else if (jqXHR.status == 404) {
                        msg = 'Requested page not found. [404]';
                    } else if (jqXHR.status == 500) {
                        msg = 'Internal Server Error [500].';
                    } else if (exception === 'parsererror') {
                        msg = 'Requested JSON parse failed.';
                    } else if (exception === 'timeout') {
                        msg = 'Time out error.';
                    } else if (exception === 'abort') {
                        msg = 'Ajax request aborted.';
                    } else {
                        msg = 'Uncaught Error.\n' + jqXHR.responseText;
                    }
                    alert(msg);
                },
                complete: function () {
                    if (st == 'completed') {
                        //var lblId = "VP_lbl" + centerId + hostId;
                        //$("#" + lblId).delay(1000).css("background-color", "#D5EDF1");
                        //document.getElementById(lblId).innerHTML = "Center " + centerId + " and Host " + hostId + ": Done!";

                       <%-- var grid = $find("<%=RG_SampleVariant_Detail.ClientID %>");
                        var MasterTable = grid.get_masterTableView();
                        var row = MasterTable.get_dataItems()[0];
                        var element = row.findElement("div_loading");
                        element.classList.add("displyNon");--%>
                        console.log('Done!');

                        document.getElementById("<%= HF_VarPhen.ClientID %>").value = varPhen;
                        document.getElementById("<%= HF_VarNoPhen.ClientID %>").value = varNoPhen;
                        document.getElementById("<%= HF_NoVarPhen.ClientID %>").value = noVarPhen;
                        document.getElementById("<%= HF_NoVarNoPhen.ClientID %>").value = noVarNoPhen;

                        document.getElementById("<%= btnShowStats.ClientID %>").click();

                    }

                }
            });
        }

        //function sleep(milliseconds) {
        //    var start = new Date().getTime();
        //    for (var i = 0; i < 17; i++) {
        //        if ((new Date().getTime() - start) > milliseconds) {
        //            break;
        //        }
        //    }
        //}

        function sleepVer2(milliseconds) {
            const date = Date.now();
            let currentDate = null;
            do {
                currentDate = Date.now();
            } while (currentDate - date < milliseconds);
        }

    </script>
</telerik:RadScriptBlock>
