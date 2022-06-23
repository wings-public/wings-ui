<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Res_Req_1.ascx.cs" Inherits="WebGAP.GAP.uc.uc_Res_Req_1" %>

<%--Added By Nasim--%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

<style>
    body {
        font-size: 12px
    }

    .RadGrid_Bootstrap .rgRow > td, .RadGrid_Bootstrap .rgAltRow > td {
        border-width: 0 0 0 0;
        padding: 0 0 0 8px;
        height: auto;
    }

    .sampleName_title {
        font-size: 20px;
        font-weight: bold !important;
        padding-left: 0 !important;
    }

    .condition_title {
        font-size: 22px;
        padding-left: 0 !important;
    }

    .RG_holder {
        width: 50% !important;
    }

    .row div .RadAjaxPanel {
        width: 100%;
    }

    .RadGrid .rgDataDiv {
        /*height:700px !important;*/
        padding: 0
    }

    .hidden {
        display: none
    }

    .RadGrid .rgGroupPanel {
        padding: 0 0 0 0;
    }

    .padding {
        padding: 0 5px;
    }

    .t-container {
        padding: 0;
        margin: 0;
    }
    /*.innerMultiPage { width:90%; padding-top:20px; float:right }*/

    .outerMultiPage {
        height: 387px;
        width: 593px;
    }

    .innerMultiPage {
        display: inline-block;
        *display: inline;
        zoom: 1;
        position: relative;
        margin-bottom: -3px;
        width: 90%;
    }

    .holder {
        padding: 20px 10px 10px 10px
    }

    .RG_SampleVariant_Detail {
        margin-left: 10px;
        width: 100% !important;
    }

        .RG_SampleVariant_Detail .rgRow > td, .RG_SampleVariant_Detail .rgAltRow > td {
            padding: 0 !important
        }

    .RadTabStrip .rtsLink {
        padding: 9px 4px 8px 10px;
    }

    .RadMultiPage .rmpView {
        padding: 20px
    }

    .tbl-container {
        width: 100%
    }

        .tbl-container td {
            width: 32%;
            text-align: left;
            padding-left: 7px
        }

        .tbl-container tr {
            border-bottom: 1px solid #ddd;
        }

            .tbl-container tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            .tbl-container tr td .tbl-container h6 {
                background: #14AFCA;
                color: white;
                padding: 5px;
                border-bottom-left-radius: 10px;
                border-top-right-radius: 10px;
                margin-right: 5px;
                margin-top: 5px
            }

        .tbl-container .blueBg {
            background: #14AFCA;
            color: white;
            padding: 4px;
            border-bottom-left-radius: 5px;
            border-top-right-radius: 5px;
        }

    .RadListView {
        border: none
    }

    .listItem {
        margin-left: 0;
        padding-left: 0 !important
    }

    .btnCollapse {
        content: "";
        display: inline-block;
        margin-right: 10px;
        position: relative;
        top: 4px;
        background: url('../../img/tab-icon/collapse.png') no-repeat;
        cursor: pointer;
        padding-left: 20px;
        border: none
    }

    .collapsed:before {
        padding-left: 20px;
        background: url('../../img/tab-icon/collapse.png') no-repeat;
    }

    .btnCollapse:focus,
    .btnCollapse:hover,
    .btnCollapse:active {
        color: #1ea9e3;
        background: url('../../img/tab-icon/expand.png') no-repeat;
        text-decoration: none;
    }

    .collapse.show {
        border-left: 1px solid;
        padding-left: 15px;
        border-color: #ddd;
        padding-top: 10px;
        padding-bottom: 10px;
    }

    circle, g, path, rect {
        transform-origin: 0% 0%;
    }

    .padding-left {
        padding-left: 20px;
    }

    .padding-left-four {
        padding-left: 4px !important;
    }

    .margin-left {
        margin-left: 32px;
    }

    .margin-top {
        margin-top: 15px
    }

    .tooltip_holder {
        height: auto;
        width: 250px;
        /*border: solid 1px #14AFCA;*/
        background: #000;
        position: absolute;
        visibility: hidden;
        padding: 10px 15px;
        border-bottom-left-radius: 15px;
        border-top-right-radius: 15px;
        color: white;
        z-index: 9999 !important;
        line-height: 18px;
    }

    .img_classification {
        float: left;
        margin-top: -1px;
        margin-right: 8px
    }

    .lbl_phenotype {
        padding-left: 10px;
    }

    .RG_SV tr.rgFilterRow {
        visibility: collapse
    }

    .bgAlt {
        background-color: #f1f1f1;
        border-bottom-left-radius: 10px;
        border-top-right-radius: 10px;
        padding: 2px 5px;
        color: black
    }

    .none-top-bottom-padding-header-sample {
        padding-top: 5px !important;
        padding-bottom: 5px !important;
    }

    .trueTriggerd {
        background-color: #FF6666;
        border-radius: 5px;
        padding: 3px;
        text-align: center;
        margin: 2px 2px;
        display: inline-block;
        font-size: 10px;
    }

    .falseTriggerd {
        background-color: #9FDE8E;
        border-radius: 5px;
        padding: 3px;
        text-align: center;
        margin: 2px 2px;
        display: inline-block;
        font-size: 10px;
    }

    .naTriggerd {
        background-color: #cacaca;
        border-radius: 5px;
        padding: 3px;
        text-align: center;
        margin: 2px 2px;
        display: inline-block;
        font-size: 10px;
    }
    /* Container for skill bars */
    .bar-container {
        width: 100%; /* Full width */
        background-color: #ddd; /* Grey background */
        margin: 0 10px 5px 0;
        height: 16px
    }

    .skills {
        text-align: left;
        color: white;
        margin: 0 10px 5px 0;
        height: 16px;
        padding-left: 3px;
        background-color: #2196F3;
    }
</style>

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_GapDataSharing">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_GapDataSharing" />
                <telerik:AjaxUpdatedControl ControlID="RG_SampleVariant_Detail" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_SampleVariant_Condition" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
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
        <div class="row match-height">
            <div class="RG_holder">
                <telerik:RadGrid RenderMode="Lightweight" ID="RG_GapDataSharing" DataKeyNames="CHR,START,END,ALT,REF" runat="server" GridLines="None" Height="700"
                    AllowPaging="True" AllowSorting="True" ShowGroupPanel="true" AutoGenerateColumns="False" CellSpacing="0" OnItemDataBound="RG_GapDataSharing_ItemDataBound"
                    ShowStatusBar="True" AllowAutomaticDeletes="True" PageSize="15" AllowFilteringByColumn="True" CssClass="RG_SV" DataSourceID="Ds_GapDataSharing"
                    OnItemCommand="RG_GapDataSharing_ItemCommand" OnPreRender="RG_GapDataSharing_PreRender">

                    <MasterTableView Name="Master" DataKeyNames="CHR,START,END,ALT,REF" BorderColor="Transparent" HeaderStyle-BorderColor="Transparent"
                        GridLines="None" DataSourceID="Ds_GapDataSharing">

                        <Columns>


                            <telerik:GridBoundColumn DataField="CHR" UniqueName="CHR" HeaderText="Chr">
                                <HeaderStyle Width="7%" Font-Size="14px" HorizontalAlign="Center" CssClass="none-top-bottom-padding-header-sample" />
                                <ItemStyle Width="7%" HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="START" UniqueName="START" HeaderText="Start">
                                <HeaderStyle Width="15%" Font-Size="14px" HorizontalAlign="Center" CssClass="none-top-bottom-padding-header-sample" />
                                <ItemStyle Width="15%" HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="END" UniqueName="END" HeaderText="End">
                                <HeaderStyle Width="15%" Font-Size="14px" HorizontalAlign="Center" CssClass="none-top-bottom-padding-header-sample" />
                                <ItemStyle Width="15%" HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="GENE" UniqueName="GENE" HeaderText="Gene">
                                <HeaderStyle Width="15%" Font-Size="14px" HorizontalAlign="Center" CssClass="none-top-bottom-padding-header-sample" />
                                <ItemStyle Width="15%" HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn DataType="System.int32" DataField="freq" UniqueName="freq" HeaderText="Freq">
                                <HeaderStyle Width="10%" Font-Size="14px" HorizontalAlign="Center" CssClass="none-top-bottom-padding-header-sample" />
                                <ItemStyle Width="10%" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <div class="bar-container">
                                        <div runat="server" id="divBar" class="skills">
                                            <asp:Label runat="server" ID="lbl_freq" Text='<%# Bind("freq") %>'></asp:Label>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="access" HeaderText="Access">
                                <HeaderStyle Width="12%" Font-Size="14px" HorizontalAlign="Center" CssClass="none-top-bottom-padding-header-sample"></HeaderStyle>
                                <ItemStyle Height="12%" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:HiddenField runat="server" ID="hdn_access" Value='<%# Bind("access") %>' />
                                    <asp:Image runat="server" ID="img_access" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="stats" HeaderText="Statistic">
                                <HeaderStyle Width="10%" Font-Size="14px" HorizontalAlign="Center" CssClass="none-top-bottom-padding-header-sample"></HeaderStyle>
                                <ItemStyle Height="10%" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%--<asp:HiddenField runat="server" ID="hdn_data_stats" Value='<%# String.Concat(Eval("CHR"),"|",Eval("START"),"|",Eval("END"),"|",Eval("ALT"),"|",Eval("REF")) %>' />--%>
                                    <asp:ImageButton  ID="btn_stats" runat="server" ImageUrl="~/img/icon/icon_stats.png" CommandName="StatsNav" />
                                    <%--<asp:Button ID="btn_stats" runat="server" CssClass="btn btn-success dropdown-toggle btn-sm" Text="Stats" CommandName="StatsNav" />--%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn DataField="ALT" UniqueName="ALT" HeaderText="ALT">
                                <HeaderStyle Width="7%" HorizontalAlign="Center" Font-Size="14px" CssClass="none-top-bottom-padding-header-sample" />
                                <ItemStyle Width="7%" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lbl_alt" Text='<%# Bind("ALT") %>' CssClass="bgAlt" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="REF" UniqueName="REF" HeaderText="Ref">
                                <HeaderStyle Width="12%" Font-Size="14px" HorizontalAlign="Center" CssClass="padding-left-four none-top-bottom-padding-header-sample" />
                                <ItemStyle Width="12%" HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                        </Columns>


                        <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                    </MasterTableView>
                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                    <ClientSettings EnableRowHoverStyle="true" Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="true">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" />

                    </ClientSettings>
                    <FilterMenu RenderMode="Lightweight"></FilterMenu>
                    <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                </telerik:RadGrid>
            </div>
            <div style="width: 50%; float: right">

                <telerik:RadGrid RenderMode="Lightweight" ID="RG_SampleVariant_Detail" runat="server" GridLines="None" DataSourceID="Ds_SampleVariant_Detail"
                    AllowPaging="false" AllowSorting="True" ShowGroupPanel="true" AutoGenerateColumns="False" CellSpacing="0" CssClass="RG_SampleVariant_Detail"
                    OnItemDataBound="RG_SampleVariant_Detail_ItemDataBound">
                    <MasterTableView CommandItemDisplay="None" Name="Master" AutoGenerateColumns="false" BorderColor="Transparent" HeaderStyle-BorderColor="Transparent"
                        DataSourceID="Ds_SampleVariant_Detail" GridLines="None">

                        <Columns>
                            <telerik:GridTemplateColumn ColumnGroupName="SampleName">
                                <HeaderStyle Width="18px" CssClass="hidden" />
                                <ItemTemplate>

                                    <asp:HiddenField runat="server" ID="hdn_clinvarr_clinical" Value='<%# Bind("ClinVar_clinical_significance") %>' />
                                    <asp:HiddenField runat="server" ID="hdn_other_transcripts" Value='<%# Bind("OTHER_TRANSCRIPTS") %>' />

                                    <telerik:RadTabStrip RenderMode="Lightweight" runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage_DataHolder" Orientation="VerticalRight" Skin="Silk" SelectedIndex="0">
                                        <Tabs>
                                            <telerik:RadTab ImageUrl="../../img/tab-icon/sample.png" SelectedImageUrl="../../img/tab-icon/sample-hover.png" HoveredImageUrl="../../img/tab-icon/sample-hover.png" ToolTip="Sample" Height="48px"></telerik:RadTab>
                                            <telerik:RadTab ImageUrl="../../img/tab-icon/transcript.png" SelectedImageUrl="../../img/tab-icon/transcript-hover.png" HoveredImageUrl="../../img/tab-icon/transcript-hover.png" ToolTip="Transcripts" Height="48px"></telerik:RadTab>
                                            <telerik:RadTab ImageUrl="../../img/tab-icon/ClinVar.png" SelectedImageUrl="../../img/tab-icon/ClinVar-hover.png" HoveredImageUrl="../../img/tab-icon/ClinVar-hover.png" ToolTip="ClinVar" Height="48px"></telerik:RadTab>
                                            <telerik:RadTab ImageUrl="../../img/tab-icon/lab.png" SelectedImageUrl="../../img/tab-icon/lab-hover.png" HoveredImageUrl="../../img/tab-icon/lab-hover.png" ToolTip="Lab Knowledgebase" Height="48px"></telerik:RadTab>
                                            <telerik:RadTab ImageUrl="../../img/tab-icon/finding.png" ToolTip="Lab Findings" Height="48px" SelectedImageUrl="../../img/tab-icon/finding-hover.png" HoveredImageUrl="../../img/tab-icon/finding-hover.png"></telerik:RadTab>
                                            <telerik:RadTab ImageUrl="../../img/tab-icon/population.png" ToolTip="Population" Height="48px" SelectedImageUrl="../../img/tab-icon/population-hover.png" HoveredImageUrl="../../img/tab-icon/population-hover.png"></telerik:RadTab>
                                            <telerik:RadTab ImageUrl="../../img/tab-icon/functional.png" ToolTip="Functional" Height="48px" SelectedImageUrl="../../img/tab-icon/functional-hover.png" HoveredImageUrl="../../img/tab-icon/functional-hover.png"></telerik:RadTab>

                                        </Tabs>
                                    </telerik:RadTabStrip>

                                    <telerik:RadMultiPage ID="RadMultiPage_DataHolder" runat="server" CssClass="innerMultiPage" SelectedIndex="0">
                                        <telerik:RadPageView ID="RadPageView1" runat="server">
                                            <table class="tbl-container">
                                                <tr>
                                                    <td>
                                                        <h2>General Details</h2>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <telerik:RadHtmlChart runat="server" DataSourceID="Ds_GapDataSharing_General" ID="PieChart1" Width="100%" Height="200" Transitions="true" Skin="Silk">
                                                            <PlotArea>
                                                                <Series>
                                                                    <telerik:ColumnSeries DataFieldY="cc" Name="Genotypes">
                                                                        <TooltipsAppearance Color="White" />
                                                                    </telerik:ColumnSeries>
                                                                </Series>
                                                                <XAxis DataLabelsField="GENO">
                                                                    <LabelsAppearance RotationAngle="0">
                                                                    </LabelsAppearance>
                                                                    <TitleAppearance Text="Genotype">
                                                                    </TitleAppearance>
                                                                </XAxis>
                                                                <YAxis>
                                                                    <TitleAppearance Text="Count">
                                                                    </TitleAppearance>
                                                                </YAxis>
                                                            </PlotArea>
                                                            <Legend>
                                                                <Appearance Visible="false">
                                                                </Appearance>
                                                            </Legend>
                                                            <ChartTitle Text="Variant Frequency">
                                                            </ChartTitle>
                                                        </telerik:RadHtmlChart>
                                                    </td>
                                                </tr>

                                            </table>

                                        </telerik:RadPageView>
                                        <telerik:RadPageView ID="RadPageView2" runat="server">
                                            <table class="tbl-container" runat="server" id="tbl_transcripts">
                                                <tr>
                                                    <td colspan="3">
                                                        <h2>Transcripts</h2>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr id="tr_transcripts_count"></tr>
                                                <tr id="tr_transcripts_collapse_tab"></tr>
                                                <tr id="tr_transcripts_detail"></tr>

                                            </table>
                                        </telerik:RadPageView>
                                        <telerik:RadPageView ID="RadPageView3" runat="server">
                                            <table class="tbl-container" runat="server">
                                                <tr>
                                                    <td colspan="3">
                                                        <h2>ClinVar</h2>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <telerik:RadListView runat="server" ID="UnorderedListView" RenderMode="Lightweight" AllowPaging="True" DataSourceID="Ds_SampleVariant_Detail"
                                                            CheckBoxes="false" ShowCheckAll="false">
                                                        </telerik:RadListView>

                                                    </td>
                                                </tr>
                                            </table>
                                        </telerik:RadPageView>
                                        <telerik:RadPageView ID="RadPageView4" runat="server">
                                            <table class="tbl-container" runat="server">
                                                <tr>
                                                    <td colspan="3">
                                                        <h2>Lab Knowledgebase</h2>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <h5>There are no items to be displayed.</h5>
                                                    </td>
                                                </tr>

                                            </table>
                                        </telerik:RadPageView>
                                        <telerik:RadPageView ID="RadPageView5" runat="server">
                                            <table class="tbl-container" runat="server">
                                                <tr>
                                                    <td colspan="3">
                                                        <h2>Lab Findings</h2>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <h5>There are no items to be displayed.</h5>
                                                    </td>
                                                </tr>

                                            </table>
                                        </telerik:RadPageView>
                                        <telerik:RadPageView ID="RadPageView6" runat="server">
                                            <table class="tbl-container" runat="server">
                                                <tr>
                                                    <td colspan="3">
                                                        <h2>Population frequency</h2>
                                                        <br />
                                                    </td>
                                                </tr>
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
                                                                        <asp:Label runat="server" ID="Label26" Text='<%# Bind("gnomAD_Hom_AFR") %>' /></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="Label27" Text='<%# Bind("gnomAD_AF_AFR") %>' /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <h7>Ashkenazi Jewish</h7>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="Label28" Text='<%# Bind("gnomAD_Hom_ASJ") %>' /></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="Label29" Text='<%# Bind("gnomAD_AF_ASJ") %>' /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <h7>East Asian</h7>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="Label30" Text='<%# Bind("gnomAD_Hom_EAS") %>' /></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="Label31" Text='<%# Bind("gnomAD_AF_EAS") %>' /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <h7>European (Finnish)</h7>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="Label32" Text='<%# Bind("gnomAD_Hom_FIN") %>' /></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="Label33" Text='<%# Bind("gnomAD_AF_FIN") %>' /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <h7>European (Non-Finnish)</h7>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="Label34" Text='<%# Bind("gnomAD_Hom_NFE") %>' /></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="Label35" Text='<%# Bind("gnomAD_AF_NFE") %>' /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <h7>Latino</h7>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="Label36" Text='<%# Bind("gnomAD_Hom_AMR") %>' /></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="Label37" Text='<%# Bind("gnomAD_AF_AMR") %>' /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <h7>South Asian</h7>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="Label38" Text='<%# Bind("gnomAD_Hom_SAS") %>' /></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="Label39" Text='<%# Bind("gnomAD_AF_SAS") %>' /></td>
                                                                </tr>
                                                                <tr style="border-bottom: none">
                                                                    <td>
                                                                        <h7>Other</h7>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="Label40" Text='<%# Bind("gnomAD_Hom_OTH") %>' /></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="Label41" Text='<%# Bind("gnomAD_AF_OTH") %>' /></td>
                                                                </tr>
                                                                <tr style="border-top: 1px solid #14AFCA; border-bottom: 1px solid #14AFCA">
                                                                    <td>
                                                                        <h7><b>Total</b></h7>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="Label42" Text='<%# Bind("gnomAD_Hom_ALL") %>' /></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="Label43" Text='<%# Bind("gnomAD_AF_ALL") %>' /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <h7>Female</h7>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="Label44" Text='<%# Bind("gnomAD_Hom_Female") %>' /></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="Label45" Text='<%# Bind("gnomAD_AF_Female") %>' /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <h7>Male</h7>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="Label46" Text='<%# Bind("gnomAD_Hom_Male") %>' /></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="Label47" Text='<%# Bind("gnomAD_AF_Male") %>' /></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <br />
                                                        <h4>ExAC</h4>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <b>Total number of corrected alleles counted in ExAC database : </b>
                                                        <asp:Label runat="server" ID="lbl_exac" Text='<%# Bind("ExAC_AN") %>' /></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <b>Number of corrected ALT alleles counted in ExAC database : </b>
                                                        <asp:Label runat="server" ID="Label48" Text='<%# Bind("ExAC_AC") %>' /></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <b>ExAC frequency of the ALT allele 
                                                        <span class="blueBg">[0-1]</span> : </b>
                                                        <asp:Label runat="server" ID="Label49" Text='<%# Bind("ExAC_AF") %>' />
                                                        <span style="color: #14AFCA">(
                                                    <asp:Label runat="server" ID="Label50" Text='<%# Bind("ExAC_isTarget") %>' />
                                                            )</span>
                                                    </td>
                                                </tr>

                                            </table>
                                        </telerik:RadPageView>
                                        <telerik:RadPageView ID="RadPageView7" runat="server">
                                            <table class="tbl-container" runat="server">
                                                <tr>
                                                    <td colspan="2">
                                                        <h2>Functional</h2>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <b>Prediction : </b>
                                                        <asp:Label runat="server" ID="Label56" Text='<%# Bind("PaPI_pred") %>' />
                                                        <asp:Image ID="Image1" runat="server" ImageUrl="../../img/icon/icon_info.png" Height="16px" Width="16px" onmouseover="ShowToolTip('div_img_papi');" onmouseout="hideToolTip('div_img_papi');" />
                                                        <div id="div_img_papi" class="tooltip_holder">
                                                            <span>PaPI (<a href="http://papi.unipv.it" target="_blank">http://papi.unipv.it</a>) prediction for this variant to be damaging/tolerated for the protein structure/function. It is the combined prediction given by PolyPhen-2, SIFT and PseeAC-RF classifiers.</span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <b>Score : </b>
                                                        <asp:Label runat="server" ID="Label57" Text='<%# Bind("PaPI_score") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <b>PolyPhen2 : </b>
                                                        <asp:HiddenField runat="server" ID="hdn_polyphen" Value='<%# Bind("PolyPhen_2_pred") %>' />
                                                        <asp:Label runat="server" ID="lbl_polyphen2" Text="" />
                                                        <asp:Image ID="Image2" runat="server" ImageUrl="../../img/icon/icon_info.png" Height="16px" Width="16px" onmouseover="ShowToolTip('div_img_polyphen');" onmouseout="hideToolTip('div_img_polyphen');" />
                                                        <div id="div_img_polyphen" class="tooltip_holder">
                                                            <span>PolyPhen-2 (HumVar) prediction for this variant to be damaging/tolerated for the protein structure/function. </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <b>Score : </b>
                                                        <asp:Label runat="server" ID="lbl_poly2_score" Text='<%# Bind("PolyPhen_2_score") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <b>SIFT : </b>
                                                        <asp:HiddenField runat="server" ID="hdn_sift" Value='<%# Bind("SIFT_pred") %>' />
                                                        <asp:Label runat="server" ID="lbl_sift" Text="" />
                                                        <asp:Image ID="Image3" runat="server" ImageUrl="../../img/icon/icon_info.png" Height="16px" Width="16px" onmouseover="ShowToolTip('div_img_sift');" onmouseout="hideToolTip('div_img_sift');" />
                                                        <div id="div_img_sift" class="tooltip_holder">
                                                            <span>SIFT prediction for this variant to be damaging/tolerated for the protein structure/function.</span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <b>Score : </b>
                                                        <asp:Label runat="server" ID="lbl_sift_score" Text='<%# Bind("SIFT_score") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <b>dbscSNV score <span class="blueBg">(AB)</span> : </b>
                                                        <asp:Label runat="server" ID="Label60" Text='<%# Bind("dbscSNV_AB_score") %>' />
                                                        <asp:Image ID="Image4" runat="server" ImageUrl="../../img/icon/icon_info.png" Height="16px" Width="16px" onmouseover="ShowToolTip('div_img_dbscSNV_AB');" onmouseout="hideToolTip('div_img_dbscSNV_AB');" />
                                                        <div id="div_img_dbscSNV_AB" class="tooltip_holder">
                                                            <span>Probability for this variant (SNV only) to be deleterious for the nearby splicing site. Score computed by AdaBoost machine learning classifier. </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <b>dbscSNV score <span class="blueBg">(RF)</span> : </b>
                                                        <asp:Label runat="server" ID="Label61" Text='<%# Bind("dbscSNV_RF_score") %>' />
                                                        <asp:Image ID="Image5" runat="server" ImageUrl="../../img/icon/icon_info.png" Height="16px" Width="16px" onmouseover="ShowToolTip('div_img_dbscSNV_RF');" onmouseout="hideToolTip('div_img_dbscSNV_RF');" />
                                                        <div id="div_img_dbscSNV_RF" class="tooltip_holder">
                                                            <span>Probability for this variant (SNV only) to be deleterious for the nearby splicing site. Score computed by Random Forest machine learning classifier. </span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:HiddenField runat="server" ID="hdn_scoreD" Value='<%# Bind("DANN_score") %>' />
                                                        <div style="width: 145px; text-align: center; margin: 0">
                                                            <telerik:RadRadialGauge runat="server" ID="RG_DANN" Height="90px" Skin="Bootstrap" Width="170px" Font-Size="10px">
                                                                <Pointer Value="0">
                                                                    <Cap Size="0.1" />
                                                                </Pointer>
                                                                <Scale Min="0" Max="1" MajorUnit="0.25" EndAngle="180" StartAngle="0">
                                                                    <Labels Format="{0}" Visible="true" Position="Outside" Font="10px" />

                                                                    <Ranges>
                                                                        <telerik:GaugeRange Color="#FF0000" From="0" To="0.25" />
                                                                        <telerik:GaugeRange Color="#FFBF00" From="0.25" To="0.5" />
                                                                        <telerik:GaugeRange Color="#9FE357" From="0.5" To="0.75" />
                                                                        <telerik:GaugeRange Color="#00BF57" From="0.75" To="1" />
                                                                    </Ranges>
                                                                </Scale>
                                                            </telerik:RadRadialGauge>
                                                            <asp:Label runat="server" ID="lbl_dann" Text='<%# Bind("DANN_score") %>' /><br />
                                                            <b>DANN score</b>
                                                            <asp:Image ID="Image6" runat="server" ImageUrl="../../img/icon/icon_info.png" Height="16px" Width="16px" onmouseover="ShowToolTip('div_img_dann');" onmouseout="hideToolTip('div_img_dann');" />
                                                            <div id="div_img_dann" class="tooltip_holder">
                                                                <span>Probability for this variant (SNV only) to be deleterious according to DANN score. Both for coding and non-coding genomic variants. </span>
                                                            </div>
                                                        </div>
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

                <telerik:RadGrid RenderMode="Lightweight" ID="RG_SampleVariant_Condition" runat="server" GridLines="None" DataSourceID="Ds_SampleVariant_Condition"
                    AllowPaging="false" AllowSorting="True" ShowGroupPanel="true" AutoGenerateColumns="False" CellSpacing="0" CssClass="RG_SampleVariant_Detail margin-top"
                    OnItemDataBound="RG_SampleVariant_Condition_ItemDataBound">

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
                            <telerik:GridColumnGroup Name="Condition" HeaderText="Conditions" HeaderStyle-CssClass="condition_title">
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

            <asp:SqlDataSource ID="Ds_GapDataSharing" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                SelectCommand="Sp_GAP_Data_Sharing_Sel_Ditinct_Pos" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="ReqID" SessionField="GapReqId" Type="Int64" />
                    <asp:SessionParameter Name="UID" SessionField="WiNGSMasterId" Type="Int16" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="Ds_SampleVariant_Detail" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                SelectCommand="Sp_GAP_Data_Sharing_Varinat_Detail_Sel" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="ReqID" SessionField="GapReqId" Type="Int64" />
                    <asp:ControlParameter ControlID="RG_GapDataSharing" Name="CHR" PropertyName="SelectedValues['CHR']" Type="String" />
                    <asp:ControlParameter ControlID="RG_GapDataSharing" Name="Spos" PropertyName="SelectedValues['START']" Type="String" />
                    <asp:ControlParameter ControlID="RG_GapDataSharing" Name="Epos" PropertyName="SelectedValues['END']" Type="String" />
                    <asp:ControlParameter ControlID="RG_GapDataSharing" Name="REF" PropertyName="SelectedValues['REF']" Type="String" />
                    <asp:ControlParameter ControlID="RG_GapDataSharing" Name="ALT" PropertyName="SelectedValues['ALT']" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="Ds_SampleVariant_Condition" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                SelectCommand="Sp_GAP_Data_Sharing_Varinat_Condition_Sel" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="ReqID" SessionField="GapReqId" Type="Int64" />
                    <asp:ControlParameter ControlID="RG_GapDataSharing" DefaultValue="" Name="CHR" PropertyName="SelectedValues['CHR']" Type="String" />
                    <asp:ControlParameter ControlID="RG_GapDataSharing" Name="START" PropertyName="SelectedValues['START']" Type="String" />
                    <asp:ControlParameter ControlID="RG_GapDataSharing" Name="END" PropertyName="SelectedValues['END']" Type="String" />
                    <asp:ControlParameter ControlID="RG_GapDataSharing" Name="REF" PropertyName="SelectedValues['REF']" Type="String" />
                    <asp:ControlParameter ControlID="RG_GapDataSharing" Name="ALT" PropertyName="SelectedValues['ALT']" Type="String" />

                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="Ds_GapDataSharing_General" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                SelectCommand="Sp_GAP_Data_Sharing_Varinat_Detail_General_Sel" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="ReqID" SessionField="GapReqId" Type="Int64" />
                    <asp:ControlParameter ControlID="RG_GapDataSharing" Name="CHR" PropertyName="SelectedValues['CHR']" Type="String" />
                    <asp:ControlParameter ControlID="RG_GapDataSharing" Name="Spos" PropertyName="SelectedValues['START']" Type="String" />
                    <asp:ControlParameter ControlID="RG_GapDataSharing" Name="Epos" PropertyName="SelectedValues['END']" Type="String" />
                    <asp:ControlParameter ControlID="RG_GapDataSharing" Name="REF" PropertyName="SelectedValues['REF']" Type="String" />
                    <asp:ControlParameter ControlID="RG_GapDataSharing" Name="ALT" PropertyName="SelectedValues['ALT']" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </section>
</div>
<telerik:RadWindowManager ID="RadWindowManager2" ShowContentDuringLoad="true" RenderMode="Lightweight"
    ReloadOnShow="true" runat="server" EnableShadow="true"
    Skin="Windows7" AutoSize="false" Modal="true" VisibleStatusbar="false" VisibleTitlebar="true">
    <Windows>
        <telerik:RadWindow ID="RadWindow2" runat="server" RenderMode="Lightweight" Behaviors="Close" BorderStyle="None" BorderWidth="1px" CssClass="px-0 pb-0">
        </telerik:RadWindow>
    </Windows>
</telerik:RadWindowManager>

<script type="text/javascript">

    function ShowToolTip(divHolderID) {

        document.getElementById(divHolderID).style.visibility = "visible";
        document.getElementById(divHolderID).style.left = event.clientX;
        document.getElementById(divHolderID).style.top = event.clientY;
        document.getElementById(divHolderID).style.zIndex = "0";
    }

    function hideToolTip(divHolderID) {

        document.getElementById(divHolderID).style.visibility = "hidden";
    }


    function OpenWin_Request_1() {

        var h = $(document).height();
        var w = $(document).width();
        var oWnd = radopen("/GAP/Popup_Res_Req_1.aspx", "RadWindow2");
        var H = h - 150;
        var W = w - 150;
        oWnd.set_height(H);
        oWnd.set_width(W);
        oWnd.center();

        oWnd.set_modal(true);
    }




</script>

