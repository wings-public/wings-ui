<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_CSVariant.ascx.cs" Inherits="WebGAP.GAP.CS.uc.uc_CSVariant" %>


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

    .row div .RadAjaxPanel {
        width: 100%;
    }

    .RadAjaxPanel:nth-of-type(1) {
        width: 50%;
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
        zoom: 1;
        position: relative;
        margin-bottom: -3px;
        margin-left: -3px;
        width: 90%;
    }

    .holder {
        padding: 20px 10px 10px 10px
    }

    .RG_SampleVariant_Detail {
        /*margin-left: 10px;*/
        width: 100% !important;
    }

        .RG_SampleVariant_Detail .rgRow > td, .RG_SampleVariant_Detail .rgAltRow > td {
            padding: 0 !important
        }

    .RadTabStrip .rtsLink {
        padding: 9px 4px 8px 10px;
    }

    .RadMultiPage .rmpView {
        /*padding: 20px*/
    }

    .tbl-container-link td {
        padding-top: 7px;
        padding-bottom: 7px;
    }

    .tbl-container {
        width: 90%;
        margin-top: 10px;
    }

        .tbl-container td {
            width: 32%;
            text-align: left;
            padding-left: 7px
        }

            .tbl-container td:first-child {
                padding-left: 25px
            }

        .tbl-container tr {
            border-bottom: 1px solid #ddd;
        }

            .tbl-container tr:last-child {
                border-bottom: none;
            }

            .tbl-container tr:last-child {
                border-bottom: none;
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
        background: url('/img/tab-icon/collapse.png') no-repeat;
        cursor: pointer;
        padding-left: 20px;
        border: none
    }

    .collapsed:before {
        padding-left: 20px;
        background: url('/img/tab-icon/collapse.png') no-repeat;
    }

    .btnCollapse:focus,
    .btnCollapse:hover,
    .btnCollapse:active {
        color: #1ea9e3;
        background: url('/img/tab-icon/expand.png') no-repeat;
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

    .btnBack {
        margin-right: 10px;
    }

    .RL_MutationSammary_Num_padding {
        padding-left: 16px;
    }

    .holder_RB_AddToReport .rbImageButton {
        margin-top: 10px
    }

    .RTS_Population ul li {
        line-height: 1.5;
    }

    .RTS_Population .rtsLink {
        padding: 5px 4px 8px 10px;
    }

    .h-30 {
        height: 30px !important;
        padding: 6px 0;
    }

    .cursor-pointer {
        cursor: pointer;
    }

    .tbl_cov tr {
        border-bottom: none;
        padding-left: 0px;
    }

    .p-l-12 .rtsLink {
        padding-left: 12px
    }

    .float-l-width-44 {
        width: 44px;
        float: left
    }

    .rtsRight .rtsLevel1 {
        border-left-width: 0;
        float: none;
        width: 48px;
    }

    .RadTabStrip .rtsLI {
        width: 45px;
    }
</style>

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <%-- <ClientEvents OnRequestStart="onRequestStart"></ClientEvents>--%>

    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_SampleVariant">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_SampleVariant" />
                <telerik:AjaxUpdatedControl ControlID="RG_SampleVariant_Detail" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_SampleVariant_Condition" LoadingPanelID="RadAjaxLoadingPanel1" />

            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_SampleVariant_Condition">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_SampleVariant_Condition" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="CB_SelectToReport">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="CB_SelectToReport" />
                <telerik:AjaxUpdatedControl ControlID="RG_SampleVarian" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="RB_AddReport">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RB_AddReport" />
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
                <telerik:AjaxUpdatedControl ControlID="RB_AddReport" LoadingPanelID="RadAjaxLoadingPanel1" />

            </UpdatedControls>
        </telerik:AjaxSetting>
           <telerik:AjaxSetting AjaxControlID="RCB_ReportVersion">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RCB_ReportVersion" />
                <telerik:AjaxUpdatedControl ControlID="RL_MutationSammary_Num" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
         <telerik:AjaxSetting AjaxControlID="RB_AddMutation">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RB_AddMutation" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30" Skin="Office2007" />

<div class="content-header row pt-1">
    <div class="content-header-left col-md-12 col-12 pl-0">
        <h3 class="content-header-title"></h3>
        <table style="width: 100%; background-color: lightgray">


            <tr>
                <td rowspan="2" style="width: 220px">
                    <asp:Label runat="server" ID="lbl_Analysis_Type" Text="Carrier Screening" CssClass="header"> </asp:Label>
                </td>
                <td rowspan="2" style="text-align: left; padding-left: 30px">
                    <%-- <img runat="server" id="img_Precondition">
                    <asp:Label runat="server" ID="lbl_PreCondition" CssClass="pr-1"></asp:Label>--%>
                    <img runat="server" id="img_Female" src="/img/icon/Female_s.png">
                    <asp:Label runat="server" ID="lbl_FemaleID" ForeColor="#333333" Font-Size="Medium" CssClass="pr-1"></asp:Label>

                    <img id="img_Male" src="/img/icon/Male_s.png" runat="server">
                    <asp:Label runat="server" ID="lbl_MaleID" ForeColor="#333333" Font-Size="Medium" CssClass="pr-1"></asp:Label>
                </td>
                <td style="float: right; padding-right: 27px; font-size: unset; color: white; padding: 10px; display: inline-table; background-color: #cc4e4e; /* margin: 6px; *//* margin-top: 6px; */margin-right: 16px;">
                    <asp:Label runat="server" ID="lbl_AnalysisID"></asp:Label>
                </td>
            </tr>

        </table>
    </div>

</div>
<div class="content-header row">
    <div class="content-header-left" style="width: 98%">
        <br />
        <div style="border-color: gainsboro; display: flex; padding: 4px 4px 4px 4px; font-size: smaller; background-color: #F3F3F3; border: 1px solid lightgray;">
            <div style="padding: 10px">
                <telerik:RadButton runat="server" ID="RB_Back" OnClick="RB_Back_Click" Width="25" Height="25" ToolTip="Back to filter" CssClass="btnBack">
                    <Image ImageUrl="~/img/icon/icon_back.png" HoveredImageUrl="~/img/icon/icon_back_Hover.png" />
                </telerik:RadButton>
            </div>
            <table id="Div_ClinicalReport" style="width: 500px; border-left: 1px solid #dedede; padding: 10px; border-right: 1px solid #dedede;">
                <tr>
                    <td class="holder_RB_AddToReport" style="width: 15%">
                        <telerik:RadButton RenderMode="Lightweight" ID="RB_AddReport" runat="server" OnClientClicking="RadConfirm_create" Image-ImageUrl="~/img/icon/Report_30.png" Image-HoveredImageUrl="~/img/icon/Report_30_hover.png"
                            OnClick="RB_AddReport_Click" Font-Size="Smaller" Width="30" Height="30" ToolTip="Create Report">
                        </telerik:RadButton>
                    </td>
                    <td class="holder_RB_AddToReport" style="width: 40%">
                        <asp:Label ID="lbl_text" runat="server" Font-Bold="true" Visible="false" Text="Report is created"></asp:Label>
                        <telerik:RadLabel runat="server" ID="RL_MutationSammary_Num" Width="100px" ForeColor="darkturquoise" Visible="false"></telerik:RadLabel>
                    </td>
                    <td class="holder_RB_AddToReport" style="width: 10%">
                        <telerik:RadComboBox runat="server" ID="RCB_ReportVersion" Width="60" Height="150" ItemsPerRequest="5" OnSelectedIndexChanged="RCB_ReportVersion_SelectedIndexChanged" AutoPostBack="true"
                            DataSourceID="DS_Report_Version" DataTextField="Report_version_Desc" DataValueField="Report_version" ToolTip="Select the version of report">
                        </telerik:RadComboBox>
                    </td>
                    <td class="holder_RB_AddToReport" style="width: 20%">
                        <telerik:RadButton RenderMode="Lightweight" ID="RB_GoToDetail" runat="server" Text="Go to detail" ToolTip="Go To Detail" OnClick="RB_GoToDetail_Click" Height="20">
                            <Icon PrimaryIconUrl="~/img/icon/icon_reportDetail.png" PrimaryHoveredIconUrl="~/img/icon/icon_reportDetail_Hover.png" PrimaryIconWidth="16px" PrimaryIconHeight="16px" />
                        </telerik:RadButton>
                    </td>
                    <td class="holder_RB_AddToReport" style="width: 15%">
                        <telerik:RadButton RenderMode="Lightweight" ID="RB_AddMutation" runat="server" Text="Add Mutation" OnClientClicking="RadConfirm_AddMutation"
                            ToolTip="Add mutation to report" OnClick="RB_AddMutation_Click">
                            <Icon PrimaryIconUrl="~/img/icon/icon_ReportDEtail_ADD.png" PrimaryHoveredIconUrl="~/img/icon/icon_ReportDEtail_ADD_Hover.png" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                        </telerik:RadButton>
                    </td>
                </tr>
            </table>
        </div>

    </div>
</div>
<div class="content-body">

    <section id="basic-form-layouts">
        <div class="row">
            <div class="row" style="margin: 0 auto !important; width: 100%">
                <div style="width: 47%;">

                    <telerik:RadGrid RenderMode="Lightweight" ID="RG_SampleVariant" DataKeyNames="CHR,START,END,REF,ALT" runat="server" GridLines="None" Height="700"
                        AllowPaging="True" AllowSorting="True" ShowGroupPanel="true" AutoGenerateColumns="False" CellSpacing="0" OnItemDataBound="RG_SampleVariant_ItemDataBound"
                        ShowStatusBar="True" AllowAutomaticDeletes="True" PageSize="15" AllowFilteringByColumn="True" CssClass="RG_SV" OnPreRender="RG_SampleVariant_PreRender" OnItemCommand="RG_SampleVariant_ItemCommand"
                        DataSourceID="Ds_SampleVariant">

                        <MasterTableView Name="Master" DataKeyNames="CHR,START,END,GENE,REF,ALT" BorderColor="Transparent" HeaderStyle-BorderColor="Transparent"
                            GridLines="None" DataSourceID="Ds_SampleVariant">

                            <Columns>
                                <telerik:GridTemplateColumn DataType="System.int32" Visible="false">
                                    <ItemTemplate>
                                        <asp:HiddenField runat="server" ID="hdn_FilterPath" Value='<%# Bind("FilterPath") %>' />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn>
                                    <HeaderStyle Width="3%" HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Height="3%" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CB_SelectToReport" runat="server" AutoPostBack="True" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn UniqueName="tmp_Results" Groupable="False" HeaderText="">
                                    <HeaderStyle Width="5%" HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Height="5%" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btn_Results" ImageUrl="/img/icon/icon_IGV.png" Width="25" Height="25" runat="server" Text="View Results" CommandName="Navigate" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataType="System.int32" DataField="Pathogen" UniqueName="Pathogen">
                                    <HeaderStyle Width="5%" CssClass="none-top-bottom-padding-header-sample"></HeaderStyle>
                                    <ItemStyle Width="5%" />
                                    <ItemTemplate>
                                        <asp:HiddenField runat="server" ID="hdn_clinvar" Value='<%# Bind("pathogen") %>' />
                                        <asp:Image ID="img_clinvar" Width="20px" runat="server" Style="margin-left: 6px;" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn DataType="System.int32" DataField="Geno" UniqueName="Geno">
                                    <HeaderStyle Width="5%" CssClass="none-top-bottom-padding-header-sample" />
                                    <ItemStyle Width="5%" />
                                    <ItemTemplate>
                                        <asp:HiddenField runat="server" ID="hdn_geno" Value='<%# Bind("GENO") %>' />
                                        <asp:Image ID="img_geno" Width="35px" runat="server" CssClass="padding" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn DataType="System.int32" DataField="mutationtype" UniqueName="mutationtype">
                                    <HeaderStyle Width="5%" CssClass="none-top-bottom-padding-header-sample" />
                                    <ItemStyle Width="5%" />
                                    <ItemTemplate>
                                        <asp:HiddenField runat="server" ID="hdn_mutationtype" Value='<%# Bind("mutationtype") %>' />
                                        <asp:Image ID="img_mutationtype" Width="26px" runat="server" CssClass="padding" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridBoundColumn DataField="GENE" UniqueName="GENE" HeaderText="Gene">
                                    <HeaderStyle Width="10%" Font-Size="Small" HorizontalAlign="Left" CssClass="padding-left-four none-top-bottom-padding-header-sample" />
                                    <ItemStyle Width="10%" />
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn DataField="CHR" UniqueName="CHR" HeaderText="Chr">
                                    <HeaderStyle Width="5%" Font-Size="Small" HorizontalAlign="Left" CssClass="padding-left-four none-top-bottom-padding-header-sample" />
                                    <ItemStyle Width="5%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="START" UniqueName="START" HeaderText="Start">
                                    <HeaderStyle Width="10%" Font-Size="Small" HorizontalAlign="Left" CssClass="padding-left-four none-top-bottom-padding-header-sample" />
                                    <ItemStyle Width="10%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="END" UniqueName="END" HeaderText="End">
                                    <HeaderStyle Width="10%" Font-Size="Small" HorizontalAlign="Left" CssClass="padding-left-four none-top-bottom-padding-header-sample" />
                                    <ItemStyle Width="10%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn DataField="ALT" UniqueName="ALT" HeaderText="ALT">
                                    <HeaderStyle Width="18%" Font-Size="Small" HorizontalAlign="Left" CssClass="padding-left-four none-top-bottom-padding-header-sample" />
                                    <ItemStyle Width="18%" />
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lbl_alt" Text='<%# Bind("ALT") %>' CssClass="bgAlt" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="ALT" UniqueName="REF" HeaderText="REF">
                                    <HeaderStyle Width="18%" Font-Size="Small" HorizontalAlign="Left" CssClass="padding-left-four none-top-bottom-padding-header-sample" />
                                    <ItemStyle Width="18%" />
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lbl_ref" Text='<%# Bind("REF") %>' CssClass="bgAlt" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
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
                <div style="width: 50%; float: right; margin-left: 10px">

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
                                                                        <%--<asp:Label runat="server" ID="lbl_eff" Text='<%# Bind("Effect") %>' />--%>

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
                                                                <%--<asp:Label runat="server" ID="lbl_eff" Text='<%# Bind("Effect") %>' />--%>

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



                    <telerik:RadWindowManager ID="RadWindowManager2" ShowContentDuringLoad="true" RenderMode="Lightweight"
                        ReloadOnShow="true" runat="server" EnableShadow="true"
                        Skin="Windows7" AutoSize="false" VisibleStatusbar="false" VisibleTitlebar="false">
                        <Windows>
                            <telerik:RadWindow ID="RadWindow2" runat="server" RenderMode="Lightweight" BorderStyle="None" BorderWidth="1px" CssClass="px-0 pb-0" Modal="true">
                            </telerik:RadWindow>
                        </Windows>
                    </telerik:RadWindowManager>

                    <asp:SqlDataSource ID="Ds_SampleVariant" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                        SelectCommand="Sp_GAP_CS_Result_SqlQuery" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="SampleID" SessionField="SampleID_Filter" Type="String" />
                            <asp:SessionParameter Name="InFilterID" SessionField="FilterID_Filter" Type="String" />
                            <asp:SessionParameter Name="FiterItemIDAsString" SessionField="Selected_FiterItemIDs_AsString" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="DS_Report_Version" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                        SelectCommand="Sp_GAP_Report_Version_Sel" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="ReportID" SessionField="CarrierScreeningID_Filter" Type="String" />
                        </SelectParameters>

                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="Ds_SampleVariant_Detail" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                        SelectCommand="Sp_GAP_CS_Sample_Variant_Detail_Sel" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="SampleID" SessionField="SampleID_Filter" Type="String" />
                            <asp:SessionParameter Name="FemaleID" SessionField="CS_FemaleID" Type="String" />
                            <asp:SessionParameter Name="MaleID" SessionField="CS_MaleID" Type="String" />
                            <asp:SessionParameter Name="InputType" SessionField="InWhichOneExists" Type="Int32" />
                            <asp:ControlParameter ControlID="RG_SampleVariant" Name="CHR" PropertyName="SelectedValues['CHR']" Type="String" />
                            <asp:ControlParameter ControlID="RG_SampleVariant" Name="START" PropertyName="SelectedValues['START']" Type="Int32" />
                            <asp:ControlParameter ControlID="RG_SampleVariant" Name="END" PropertyName="SelectedValues['END']" Type="String" />
                            <asp:ControlParameter ControlID="RG_SampleVariant" Name="REF" PropertyName="SelectedValues['REF']" Type="String" />
                            <asp:ControlParameter ControlID="RG_SampleVariant" Name="ALT" PropertyName="SelectedValues['ALT']" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="Ds_SampleVariant_Condition" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                        SelectCommand="Sp_GAP_CS_Sample_Variant_Condition_Sel" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="SampleID" SessionField="SampleID_Filter" Type="String" />
                            <asp:ControlParameter ControlID="RG_SampleVariant" DefaultValue="" Name="CHR" PropertyName="SelectedValues['CHR']" Type="String" />
                            <asp:ControlParameter ControlID="RG_SampleVariant" Name="START" PropertyName="SelectedValues['START']" Type="Int32" />
                            <asp:ControlParameter ControlID="RG_SampleVariant" Name="END" PropertyName="SelectedValues['END']" Type="Int32" />
                            <asp:ControlParameter ControlID="RG_SampleVariant" Name="REF" PropertyName="SelectedValues['REF']" Type="String" />
                            <asp:ControlParameter ControlID="RG_SampleVariant" Name="ALT" PropertyName="SelectedValues['ALT']" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </section>
</div>


<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">

    <script type="text/javascript">
        RadConfirm_create

        function RadConfirm_create(sender, args) {
            var callBackFunction = function (shouldSubmit) {
                if (shouldSubmit) {
                    //initiate the original postback again
                    sender.click();
                    if (Telerik.Web.Browser.ff) { //work around a FireFox issue with form submission, see http://www.telerik.com/support/kb/aspnet-ajax/window/details/form-will-not-submit-after-radconfirm-in-firefox
                        sender.get_element().click();
                    }
                }
            };

            var text = "Are you sure you want to create new report?";
            radconfirm(text, callBackFunction, 300, 200, null, "RadConfirm_create");
            //always prevent the original postback so the RadConfirm can work, it will be initiated again with code in the callback function
            args.set_cancel(true);
        }

        function RadConfirm_AddMutation(sender, args) {
            var callBackFunction = function (shouldSubmit) {
                if (shouldSubmit) {
                    //initiate the original postback again
                    sender.click();
                    if (Telerik.Web.Browser.ff) { //work around a FireFox issue with form submission, see http://www.telerik.com/support/kb/aspnet-ajax/window/details/form-will-not-submit-after-radconfirm-in-firefox
                        sender.get_element().click();
                    }
                }
            };


            var text = "Are you sure you want to Add the variant to report " + document.getElementById("<%= RCB_ReportVersion.ClientID %>").value;
          radconfirm(text, callBackFunction, 300, 200, null, "RadConfirm_AddMutation");
          //always prevent the original postback so the RadConfirm can work, it will be initiated again with code in the callback function
          args.set_cancel(true);
      }

        function ShowToolTip(divHolderID) {

            document.getElementById(divHolderID).style.visibility = "visible";
            document.getElementById(divHolderID).style.left = event.clientX;
            document.getElementById(divHolderID).style.top = event.clientY;
            document.getElementById(divHolderID).style.zIndex = "0";
        }

        function hideToolTip(divHolderID) {

            document.getElementById(divHolderID).style.visibility = "hidden";
        }


        function OpenWin_IGV() {

            var oWnd = radopen("/GAP/IGV.aspx", "RadWindow2"); //1 for  carrier screening
            var h = $(document).height();
            var w = $(document).width();
            oWnd.set_height(0.90 * h);
            oWnd.set_width(0.90 * w);
            oWnd.center();

        }

        //function onRequestStart(sender, args) {
        //    console.log(args);
        //        if (args.get_eventTarget().indexOf("btn_Results") >= 0) {
        //            args.set_enableAjax(false);
        //        }
        //    }

        function RedirectToReport(arg) {
            window.location.href = "../../GAP/ClinicalReport.aspx";
        }



    </script>
</telerik:RadScriptBlock>






