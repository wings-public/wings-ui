<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_ExoneLoss_PerSample.ascx.cs" Inherits="WebGAP.GAP.uc.uc_ExoneLoss_PerSample" %>

<style>
    .RadGrid {
        padding: 0px
    }

    .rgCommandRow {
        background: #eee;
        width: 100%;
        float: left;
        padding: 3px;
        margin-bottom: 3px;
        border-bottom: 1px solid #d8d8d8
    }

    .RadGrid_Bootstrap .rgMultiHeaderRow th.rgHeader, .RadGrid_Bootstrap .rgMultiHeaderRow th.rgHeader {
        border: none !important;
    }

    .RadGrid_Bootstrap .rgHeaderWrapper {
        border-bottom: 1px solid #aaa !important
    }

    .RadGrid_Bootstrap .rgMultiHeaderRow th.bgColor-aliceblue {
        background: #D5EDF1 !important;
        color: #555 !important;
        border-left: 5px solid #f3f3f3 !important;
        border-radius: 10px;
        border-bottom: 1px solid #57BCCE !important
    }

    div.RadGrid .rgRefresh {
        display: none;
    }

    .RadGrid .rgMasterTable thead {
        /*margin: 7px 2px 5px 2px;
        display: block;*/
        border-bottom: 1px solid #ccc;
    }

    .RadGrid .rgPagerCell {
        padding: 10px 10px 16px 10px !important
    }

    .p-r-35-l-30 {
        padding-right: 35px !important;
        padding-left: 30px !important;
    }

    .p-r-30 {
        padding-right: 30px !important
    }

    .p-r-35-l-26 {
        padding-right: 35px !important;
        padding-left: 26px !important;
    }

    .p-r-40-l-26 {
        padding-right: 40px !important;
        padding-left: 26px !important;
    }

    .rgHeaderDiv, .rgHeaderDiv table {
        border: none !important;
    }

    .td-SID {
        float: right;
        padding-right: 27px;
        font-size: unset;
        color: white;
        display: inline-table;
        background-color: #57BCCE;
        margin-right: 16px;
        border-radius: 5px
    }

        .td-SID label, .td-SID span {
            padding: 5px
        }

    .rgMasterTable {
        background-color: whitesmoke;
        border: none !important;
        margin-bottom: 0px
    }

    .lft {
        float: left;
        margin-left: 5px
    }

    .RadInput {
        float: left;
        margin-left: 5px
    }

    .RadInput_Bootstrap.riSingle .riTextBox {
        height: 30px;
        font-size: 12px;
        color: #777;
    }
    /*.rgFilterRow {border-top:1px solid #D5EDF1; border-bottom:none; border-left:none; border-right:none}*/
    .RadGrid_Bootstrap .rgFilterBox {
        height: 23px
    }

    .RadGrid .rgFilter {
        height: 13px
    }

    .RadGrid_Bootstrap .rgActionButton {
        color: #888
    }

    .RadGrid_Bootstrap .rgFilter {
        padding: 3px 6px 5px 6px
    }

    .RadGrid_Bootstrap .rgFilterRow {
        background: #eee;
    }

        .RadGrid_Bootstrap .rgFilterRow > td {
            border-top: 1px solid #bbb;
            border-bottom: none;
            border-left: none;
            border-right: none;
            padding-top: 8px;
            padding-bottom: 8px;
        }

    .RadGrid_Bootstrap .rgFilter:hover, .RadGrid_Bootstrap .rgFilter:focus {
        color: #57BCCE;
    }

    .RadMenu_Bootstrap .rmGroup .rmLink {
        font-size: smaller
    }

    .RadGrid_Bootstrap .rgGroupHeader td {
        background: #f6fcfd !important;
        border: none;
        border-bottom: 1px solid #57BCCE !important;
    }

     /*.RG_ByGene .rgRow td:first-child, .RG_ByGene .rgAltRow td:first-child {
        display: none
    }
   .RG_ByGene .rgRow td:nth-child(2), .RG_ByGene  .rgAltRow td:nth-child(2) { padding-left:8px  !important}*/
    .RG_ByGene .rgMultiHeaderRow th {
        cursor: default !important
    }
    /*.RG_ByGene .rgMasterTable .rgMultiHeaderRow th:nth-child(2) { padding-left:8px !important; }
    .RG_ByGene .rgMasterTable .rgMultiHeaderRow th:nth-child(3), .RG_ByGene .rgMasterTable .rgMultiHeaderRow th:nth-child(4) { padding-left:0px !important}*/

    .card-body ul.nav {
        background-size: auto 4em;
        background-repeat: no-repeat;
        background-image: linear-gradient(top, white 35%,#D5EDF1 40%, white 40%);
        background-image: -webkit-linear-gradient(top, white 35%,#D5EDF1 40%, white 40%);
        background-image: -moz-linear-gradient(top, white 35%,#D5EDF1 40%, white 40%);
        /*background-image: -ms-linear-gradient(top, transparent 50px,rgba(39,39,39,.5) 10px, rgba(39,39,39,.5) 100%);*/
        background-image: -o-linear-gradient(top, white 35%,#D5EDF1 40%, white 40%);
        width: 2500px
    }

    .p-details {
        /*margin-left: 34px;*/
        background: white;
        padding: 0 15px;
        float: left;
        border-radius: 5px;
        box-shadow: 1px 2px 4px rgba(0,0,0,.09);
        font-size: x-small
    }

    .mt-5px {
        margin-top: 5px
    }

    .scrolling-wrapper {
        overflow-x: scroll;
        overflow-y: hidden;
        white-space: nowrap;
    }


    /*.progress-bar {
        box-shadow:none !important
    }*/
    .progress-bar {
        float: left;
        width: 0;
        height: 100%;
        font-size: 12px;
        line-height: 20px;
        color: #fff;
        text-align: center;
        background-color: #337ab7;
        -webkit-box-shadow: inset 0 -1px 0 rgba(0,0,0,.15);
        box-shadow: inset 0 -1px 0 rgba(0,0,0,.15);
        -webkit-transition: width .6s ease;
        -o-transition: width .6s ease;
        transition: width .6s ease;
    }

    .vertical {
        display: inline-block;
        width: 8%;
        height: 8px;
        -webkit-transform: rotate(-90deg); /* Chrome, Safari, Opera */
        transform: rotate(-90deg);
        float: left
    }

    .vertical {
        box-shadow: inset 0px 0px 1px #ccc;
    }

    .progress-bar {
        box-shadow: inset 0px 0px 2px rgba(100,100,100,0.6);
    }

    .progress-bar-info {
        background-color: #5bc0de;
    }

    .progress-bar-title-per-row {
        width: 20px;
        float: left;
        margin-top: -3px
    }

    .RadGrid_Bootstrap .rgGroupHeader td {
        box-shadow: 0;
    }
    /*.tooltip { pointer-events: none !important;  transition: ease-in-out; }*/
    .tooltip-arrow {
    }

    .tooltip-inner {
        background-color: #eee;
        font-size: 11px;
        color: black;
        padding: 5px 8px
    }

    .exoneBtn {
        border: none;
        outline: none;
        font-size: 9px;
        cursor: pointer;
        color: black;
        text-align: center;
    }

        .exoneBtn:focus {
            border: none;
            outline: none;
        }
</style>
<%--<link rel="stylesheet" type="text/css" href="../../assets/css/progress_bar_style.css" />--%>


<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_ByGene">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_ByGene" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="content_wrapper" LoadingPanelID="RadAjaxLoadingPanel1" />

            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="RG_ExonLoss">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_ExonLoss" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="content_wrapper" LoadingPanelID="RadAjaxLoadingPanel1" />
                <%--<telerik:AjaxUpdatedControl ControlID="sketch_holder" />--%>
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="RS_ExoneLoss">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RS_ExoneLoss" />
                <%--<telerik:AjaxUpdatedControl ControlID="RMP_ExoneLoss" />
                <telerik:AjaxUpdatedControl ControlID="content_wrapper" LoadingPanelID="RadAjaxLoadingPanel1" />--%>
            </UpdatedControls>
        </telerik:AjaxSetting>


    </AjaxSettings>
</telerik:RadAjaxManager>

<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" InitialDelayTime="0" MinDisplayTime="1000" Transparency="30" Skin="Office2007">
</telerik:RadAjaxLoadingPanel>

<div class="content-header" style="width: 100%; background-color: lightgray; display: flex; padding: 5px 10px; border-radius: 5px; margin: 15px 0">
    <table style="width: 100%;">
        <tr>
            <td style="width: 100px">
                <h4 style="margin-bottom: 1px">Exon Loss</h4>
            </td>
            <td class="td-SID">
                <asp:Label runat="server" ID="lbl_SampleID"></asp:Label>
            </td>
        </tr>
    </table>
</div>



<div id="sketch_holder" class="card" style="overflow-x: scroll; width: 100%; margin-bottom: 20px; display: none;">
    <div class="card-header" id="Div1" runat="server">
        <h4 class="card-title">Gene:
            <asp:Label runat="server" ID="lbl_geneName"></asp:Label></h4>
    </div>
</div>



<telerik:RadTabStrip ID="RS_ExoneLoss" runat="server" RenderMode="Lightweight" SelectedIndex="0" MultiPageID="RMP_ExoneLoss" Font-Bold="True"
    CausesValidation="False" ResolvedRenderMode="Classic" ScrollChildren="True" BorderWidth="0px" Skin="Silk" CssClass="tabStrip" Width="100%">
    <Tabs>
        <telerik:RadTab Text="Losses per exone" Enabled="true" Selected="True" Font-Size="Small" Width="20%" Height="50px">
        </telerik:RadTab>
        <telerik:RadTab Text="Losses per gene" Enabled="true" Selected="True" Font-Size="Small" Width="20%" Height="50px">
        </telerik:RadTab>
    </Tabs>
</telerik:RadTabStrip>

<asp:HiddenField ID="hdn_searchGene" runat="server" />
<asp:HiddenField ID="hdn_searchGene_Tab2" runat="server" />


<telerik:RadMultiPage ID="RMP_ExoneLoss" CssClass="RadMultiPage" runat="server" BorderWidth="0px" SelectedIndex="0" Width="100%"
    Height="100%" Style="overflow: hidden">

    <telerik:RadPageView ID="RPW_Alldata" runat="server" Height="" Width="100%">

        <div class="content-body pt-1">
            <section id="basic-form-layouts">
                <div class="row match-height" style="margin: 0">

                    <telerik:RadGrid RenderMode="Lightweight" ID="RG_ExonLoss" runat="server" GridLines="Both" Font-Size="Smaller" OnNeedDataSource="RG_ExonLoss_NeedDataSource"
                        AutoGenerateColumns="false" AllowSorting="true" AllowPaging="true" PageSize="10" CellSpacing="-1" ShowStatusBar="True" Height="610px"
                        AllowAutomaticUpdates="True" AllowFilteringByColumn="True">
                        <%--AllowCustomPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="-1" ShowStatusBar="false" AllowAutomaticInserts="false"--%>
                        <%-- Height="600px"  DataSourceID="DS_ExonLoss"--%>
                        <%--<PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>--%>
                        <img  src="" width="" alt="" />
                        <MasterTableView Name="Master" AutoGenerateColumns="false" DataKeyNames="chr,gstart,gend,genename" AllowSorting="true"
                            ClientDataKeyNames="genename" CommandItemSettings-ShowAddNewRecordButton="false"
                            HierarchyLoadMode="ServerOnDemand" AllowMultiColumnSorting="false" AllowNaturalSort="true" CommandItemDisplay="Top">
                            <CommandItemTemplate>
                                <div style="width: 100%; float: left">
                                    <telerik:RadButton CssClass="lft" RenderMode="Lightweight" runat="server" Text="Clear Filter" ID="RTB_DeleteSearch" OnClientClicked="RB_DeleteSearch_Clicked"
                                        Height="33px" Font-Size="Smaller" AutoPostBack="false">
                                        <Icon PrimaryIconUrl="~/img/icon/icon_search_Filter.png" PrimaryHoveredIconUrl="~/img/icon/icon_search_Filter_Hovered.png" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                                    </telerik:RadButton>
                                    <telerik:RadComboBox RenderMode="Lightweight" ID="RCB_searchGene" runat="server" AutoPostBack="false" DataSourceID="DS_searchGene" EnableItemCaching="true"
                                        OnClientDropDownOpened="RCB_searchGeneOpening" ChangeTextOnKeyBoardNavigation="true" OnClientSelectedIndexChanged="RCB_searchGeneIndexChange" EnableAutomaticLoadOnDemand="True"
                                        Width="180px" Height="150px" EmptyMessage="Filter by Gene" CssClass="pl-0 lft" Filter="Contains" DataTextField="genename" DataValueField="genename" ItemsPerRequest="10">
                                    </telerik:RadComboBox>
                                    <%--<div id="spacer" class="lft" style="width: 5px; margin: 6px 5px 6px 10px">|</div>
                            <telerik:RadNumericTextBox runat="server" DisplayText="From" ID="RTB_FFrom" Type="Number"></telerik:RadNumericTextBox>
                            <div id="graterThan" class="lft" style="width: 15px; margin: 1px 0px 0px 5px; font-size: 21px; color: #777;"><</div>
                            <telerik:RadDropDownList CssClass="lft" RenderMode="Lightweight" ID="RDDL_Fraction" runat="server" DropDownHeight="200px" Width="190px" DefaultMessage="Select the fraction for" DropDownWidth="200px">
                                <Items>
                                    <telerik:DropDownListItem Text="Fraction covered full" Value="fraction_covared_Full" />
                                    <telerik:DropDownListItem Text="Fraction covered q1" Value="fraction_covared_q1" />
                                    <telerik:DropDownListItem Text="Fraction covered q2" Value="fraction_covared_q2" />
                                    <telerik:DropDownListItem Text="Fraction covered q3" Value="fraction_covared_q3" />
                                    <telerik:DropDownListItem Text="Fraction covered q4" Value="fraction_covared_q4" />
                                </Items>
                            </telerik:RadDropDownList>
                            <div id="lessThan" class="lft" style="width: 15px; margin: 1px 0px 0px 6px; font-size: 21px; color: #777;">></div>
                            <telerik:RadNumericTextBox runat="server" DisplayText="To" ID="RTB_FTo" Type="Number"></telerik:RadNumericTextBox>--%>
                                </div>

                            </CommandItemTemplate>

                            <ColumnGroups>
                                <telerik:GridColumnGroup Name="Full" HeaderText="Full"
                                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="bgColor-aliceblue" />
                                <telerik:GridColumnGroup Name="q1" HeaderText="q1"
                                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="bgColor-aliceblue" />
                                <telerik:GridColumnGroup Name="q2" HeaderText="q2"
                                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="bgColor-aliceblue" />
                                <telerik:GridColumnGroup Name="q3" HeaderText="q3"
                                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="bgColor-aliceblue" />
                                <telerik:GridColumnGroup Name="q4" HeaderText="q4"
                                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="bgColor-aliceblue" />
                            </ColumnGroups>

                            <Columns>
                                <telerik:GridBoundColumn DataField="chr" HeaderText="Chr" ReadOnly="True"
                                    SortExpression="chr" UniqueName="chr" AllowFiltering="false">
                                    <%-- FilterControlAltText="Filter chr_Full column"--%>
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" CssClass="p-r-35-l-30"></HeaderStyle>
                                    <%-- CssClass="p-r-35-l-30"--%>
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="genid" HeaderText="Gene ID" ReadOnly="True"
                                    SortExpression="genid" UniqueName="genid" AllowFiltering="false">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" CssClass="p-r-35-l-30"></HeaderStyle>
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="genename" HeaderText="Gene Name" ReadOnly="True"
                                    SortExpression="genename" UniqueName="genename" AllowFiltering="false">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" CssClass="p-r-35-l-30"></HeaderStyle>
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="gstart" FilterControlAltText="Filter gstart column" HeaderText="Start" ReadOnly="True"
                                    SortExpression="gstart" UniqueName="gstart">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" CssClass="p-r-30"></HeaderStyle>
                                    <%--CssClass="p-r-30"--%>
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="gend" FilterControlAltText="Filter gend column" HeaderText="End" ReadOnly="True"
                                    SortExpression="gend" UniqueName="gend">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" CssClass="p-r-35-l-26"></HeaderStyle>
                                    <%--CssClass="p-r-35-l-26"--%>
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                               <%-- <telerik:GridBoundColumn DataField="exone_Full" HeaderText="Full Exone" ReadOnly="True"
                                    SortExpression="exone_Full" UniqueName="exone_Full" AllowFiltering="false">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>--%>
                             
                                <telerik:GridBoundColumn DataField="depthcoverage_Full" FilterControlAltText="Filter depthcoverage_Full column" HeaderText="Depth Coverage"
                                    ReadOnly="True" SortExpression="depthcoverage_Full" UniqueName="depthcoverage_Full" ColumnGroupName="Full">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="num_bases_Full" FilterControlAltText="Filter num_bases_Full column" HeaderText="Num bases"
                                    ReadOnly="True" SortExpression="num_bases_Full" UniqueName="num_bases_Full" ColumnGroupName="Full">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="size_feature_Full" FilterControlAltText="Filter size_feature_Full column" HeaderText="Size Feature"
                                    ReadOnly="True" SortExpression="size_feature_Full" UniqueName="size_feature_Full" ColumnGroupName="Full">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="fraction_covared_Full" FilterControlAltText="Filter fraction_covared_Full column" HeaderText="Fraction Covared"
                                    ReadOnly="True" SortExpression="fraction_covared_Full" UniqueName="fraction_covared_Full" ColumnGroupName="Full">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="depthcoverage_q1" FilterControlAltText="Filter depthcoverage_q1 column" HeaderText="Depth Coverage"
                                    ReadOnly="True" SortExpression="depthcoverage_q1" UniqueName="depthcoverage_q1" ColumnGroupName="q1">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="num_bases_q1" FilterControlAltText="Filter num_bases_q1 column" HeaderText="Num bases"
                                    ReadOnly="True" SortExpression="num_bases_q1" UniqueName="num_bases_q1" ColumnGroupName="q1">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="size_feature_q1" FilterControlAltText="Filter size_feature_q1 column" HeaderText="Size Feature"
                                    ReadOnly="True" SortExpression="size_feature_q1" UniqueName="size_feature_q1" ColumnGroupName="q1">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="fraction_covared_q1" FilterControlAltText="Filter fraction_covared_q1 column" HeaderText="Fraction Covared"
                                    ReadOnly="True" SortExpression="fraction_covared_q1" UniqueName="fraction_covared_q1" ColumnGroupName="q1">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="depthcoverage_q2" FilterControlAltText="Filter depthcoverage_q2 column" HeaderText="Depth Coverage"
                                    ReadOnly="True" SortExpression="depthcoverage_q2" UniqueName="depthcoverage_q2" ColumnGroupName="q2">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="num_bases_q2" FilterControlAltText="Filter num_bases_q2 column" HeaderText="Num bases"
                                    ReadOnly="True" SortExpression="num_bases_q2" UniqueName="num_bases_q2" ColumnGroupName="q2">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="size_feature_q2" FilterControlAltText="Filter size_feature_q2 column" HeaderText="Size Feature"
                                    ReadOnly="True" SortExpression="size_feature_q2" UniqueName="size_feature_q2" ColumnGroupName="q2">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="fraction_covared_q2" FilterControlAltText="Filter fraction_covared_q2 column" HeaderText="Fraction Covared"
                                    ReadOnly="True" SortExpression="fraction_covared_q2" UniqueName="fraction_covared_q2" ColumnGroupName="q2">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="depthcoverage_q3" FilterControlAltText="Filter depthcoverage_q3 column" HeaderText="Depth Coverage"
                                    ReadOnly="True" SortExpression="depthcoverage_q3" UniqueName="depthcoverage_q3" ColumnGroupName="q3">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="num_bases_q3" FilterControlAltText="Filter num_bases_q3 column" HeaderText="Num bases"
                                    ReadOnly="True" SortExpression="num_bases_q3" UniqueName="num_bases_q3" ColumnGroupName="q3">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="size_feature_q3" FilterControlAltText="Filter size_feature_q3 column" HeaderText="Size Feature"
                                    ReadOnly="True" SortExpression="size_feature_q3" UniqueName="size_feature_q3" ColumnGroupName="q3">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="fraction_covared_q3" FilterControlAltText="Filter fraction_covared_q3 column" HeaderText="Fraction Covared"
                                    ReadOnly="True" SortExpression="fraction_covared_q3" UniqueName="fraction_covared_q3" ColumnGroupName="q3">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="depthcoverage_q4" FilterControlAltText="Filter depthcoverage_q4 column" HeaderText="Depth Coverage"
                                    ReadOnly="True" SortExpression="depthcoverage_q4" UniqueName="depthcoverage_q4" ColumnGroupName="q4">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="num_bases_q4" FilterControlAltText="Filter num_bases_q4 column" HeaderText="Num bases"
                                    ReadOnly="True" SortExpression="num_bases_q4" UniqueName="num_bases_q4" ColumnGroupName="q4">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="size_feature_q4" FilterControlAltText="Filter size_feature_q4 column" HeaderText="Size Feature"
                                    ReadOnly="True" SortExpression="size_feature_q4" UniqueName="size_feature_q4" ColumnGroupName="q4">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="fraction_covared_q4" FilterControlAltText="Filter fraction_covared_q4 column" HeaderText="Fraction Covared"
                                    ReadOnly="True" SortExpression="fraction_covared_q4" UniqueName="fraction_covared_q4" ColumnGroupName="q4">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                            </Columns>
                            <PagerStyle AlwaysVisible="True"></PagerStyle>
                        </MasterTableView>

                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <%--<ClientSettings ReorderColumnsOnClient="true" AllowColumnsReorder="true" ColumnsReorderMethod="Reorder">
                    <Virtualization EnableVirtualization="true" InitiallyCachedItemsCount="50"
                        LoadingPanelID="RadAjaxLoadingPanel1" ItemsPerView="20"  />
                    <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" FrozenColumnsCount="2" ScrollHeight="500px"></Scrolling>
                </ClientSettings>--%>
                        <FilterMenu RenderMode="Lightweight"></FilterMenu>
                        <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                        <PagerStyle Mode="NextPrevNumericAndAdvanced"></PagerStyle>

                        <ClientSettings ReorderColumnsOnClient="true" AllowColumnsReorder="true" ColumnsReorderMethod="Reorder"
                            EnableRowHoverStyle="true" EnablePostBackOnRowClick="true">
                            <Selecting AllowRowSelect="true" />
                            <ClientEvents OnRowSelected="RowSelected" />
                            <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="400px" />
                            <%-- <Virtualization EnableVirtualization="true" InitiallyCachedItemsCount="50" EnableCurrentPageScrollOnly="true"
                                LoadingPanelID="RadAjaxLoadingPanel1" ItemsPerView="20" />--%>
                        </ClientSettings>

                        <PagerStyle Mode="NextPrevNumericAndAdvanced"></PagerStyle>
                        <FilterMenu RenderMode="Lightweight"></FilterMenu>
                        <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                    </telerik:RadGrid>
                </div>
            </section>
        </div>
    </telerik:RadPageView>
    <telerik:RadPageView ID="RPW_Genes" runat="server" Height="" Width="100%">
        <div class="content-body pt-1">
            <section>
                <div class="row match-height" style="margin: 0">

                    <telerik:RadGrid RenderMode="Lightweight" ID="RG_ByGene" runat="server" GridLines="Both" Font-Size="Smaller" OnNeedDataSource="RG_ByGene_NeedDataSource"
                        AutoGenerateColumns="false" AllowSorting="true" AllowPaging="true" CellSpacing="-1" ShowStatusBar="True" CssClass="RG_ByGene"
                        AllowAutomaticUpdates="True" AllowFilteringByColumn="false" ShowGroupPanel="false" Height="540px">
                        <MasterTableView Name="Master" AutoGenerateColumns="false" DataKeyNames="chr,gstart,gend,genid,genename" AllowSorting="true"
                            ClientDataKeyNames="genename" CommandItemSettings-ShowAddNewRecordButton="false"
                            GroupHeaderItemStyle-BackColor="aliceblue" GroupHeaderItemStyle-Font-Size="Smaller"
                            HierarchyLoadMode="ServerOnDemand" AllowMultiColumnSorting="false" AllowNaturalSort="true" CommandItemDisplay="Top">
                            <%--GroupsDefaultExpanded="false"--%>
                            <%--<GroupByExpressions>
                                <telerik:GridGroupByExpression>
                                    <SelectFields>
                                        <telerik:GridGroupByField FieldAlias="Gene" FieldName="gene_Full"></telerik:GridGroupByField>
                                    </SelectFields>
                                    <GroupByFields>
                                        <telerik:GridGroupByField FieldName="gene_Full"></telerik:GridGroupByField>
                                    </GroupByFields>
                                </telerik:GridGroupByExpression>
                            </GroupByExpressions>--%>

                            <CommandItemTemplate>
                                <div style="width: 100%; float: left">
                                    <telerik:RadButton CssClass="lft" RenderMode="Lightweight" runat="server" Text="Clear Filter" ID="RTB_Tab2_DeleteSearch" OnClientClicked="RB_Tab2_DeleteSearch_Clicked"
                                        Height="33px" Font-Size="Smaller" AutoPostBack="false">
                                        <Icon PrimaryIconUrl="~/img/icon/icon_search_Filter.png" PrimaryHoveredIconUrl="~/img/icon/icon_search_Filter_Hovered.png" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                                    </telerik:RadButton>
                                    <telerik:RadComboBox RenderMode="Lightweight" ID="RCB_Tab2_searchGene" runat="server" AutoPostBack="false" DataSourceID="DS_searchGene" EnableItemCaching="true"
                                        OnClientDropDownOpened="RCB_Tab2_searchGeneOpening" ChangeTextOnKeyBoardNavigation="true" OnClientSelectedIndexChanged="RCB_Tab2_searchGeneIndexChange" EnableAutomaticLoadOnDemand="True"
                                        Width="180px" Height="150px" EmptyMessage="Filter by Gene" CssClass="pl-0 lft" Filter="Contains" DataTextField="genename" DataValueField="genename" ItemsPerRequest="10">
                                    </telerik:RadComboBox>
                                </div>

                            </CommandItemTemplate>

                           <%-- <ColumnGroups>
                                <telerik:GridColumnGroup Name="Full" HeaderText="Full"
                                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="bgColor-aliceblue" />
                                <telerik:GridColumnGroup Name="q1" HeaderText="q1"
                                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="bgColor-aliceblue" />
                                <telerik:GridColumnGroup Name="q2" HeaderText="q2"
                                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="bgColor-aliceblue" />
                                <telerik:GridColumnGroup Name="q3" HeaderText="q3"
                                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="bgColor-aliceblue" />
                                <telerik:GridColumnGroup Name="q4" HeaderText="q4"
                                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="bgColor-aliceblue" />
                            </ColumnGroups>--%>

                            <Columns>
                                <telerik:GridBoundColumn DataField="chr" HeaderText="Chr" ReadOnly="True"
                                    SortExpression="chr" UniqueName="chr" AllowFiltering="false">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" ></HeaderStyle>
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="genename" FilterControlAltText="Filter genename column" HeaderText="Gene Name" ReadOnly="True"
                                    SortExpression="genename" UniqueName="genename">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="20%"></HeaderStyle>
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="20%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="gstart" FilterControlAltText="Filter gstart column" HeaderText="Start" ReadOnly="True"
                                    SortExpression="gstart" UniqueName="gstart">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="20%"></HeaderStyle>
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="20%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="gend" FilterControlAltText="Filter gend column" HeaderText="End" ReadOnly="True"
                                    SortExpression="gend" UniqueName="gend">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="20%"></HeaderStyle>
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="20%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="numberofexons" HeaderText="Number of exons" ReadOnly="True"
                                    SortExpression="numberofexons" UniqueName="numberofexons" AllowFiltering="false">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" ></HeaderStyle>
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="avgoffullcovared" HeaderText="Average of full covared" ReadOnly="True"
                                    SortExpression="avgoffullcovared" UniqueName="avgoffullcovared" AllowFiltering="false">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%"></HeaderStyle>
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                                </telerik:GridBoundColumn>
                                
                            </Columns>
                            <PagerStyle AlwaysVisible="True"></PagerStyle>
                        </MasterTableView>

                        <%--<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>--%>
                        <FilterMenu RenderMode="Lightweight"></FilterMenu>
                        <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                        <PagerStyle Mode="NextPrevNumericAndAdvanced"></PagerStyle>

                        <ClientSettings ReorderColumnsOnClient="true" AllowColumnsReorder="true" ColumnsReorderMethod="Reorder"
                            EnableRowHoverStyle="true" EnablePostBackOnRowClick="true">
                            <Selecting AllowRowSelect="true" />
                            <ClientEvents OnRowClick="RowSelected" />
                            <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="400px" />
                            <%-- <Virtualization EnableVirtualization="true" InitiallyCachedItemsCount="50" EnableCurrentPageScrollOnly="true"
                                LoadingPanelID="RadAjaxLoadingPanel1" ItemsPerView="20" />--%>
                        </ClientSettings>

                        <PagerStyle Mode="NextPrevNumericAndAdvanced"></PagerStyle>
                        <FilterMenu RenderMode="Lightweight"></FilterMenu>
                        <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>

                    </telerik:RadGrid>
                </div>
            </section>
        </div>
    </telerik:RadPageView>
</telerik:RadMultiPage>

<asp:SqlDataSource ID="DS_searchGene" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_GAP_ExoneLoss_Search_Gene_ToDefine" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="" Name="SampleID" QueryStringField="SampleID" Type="Int64" />
        <%--<asp:ControlParameter ControlID="hdn_searchGene" Name="Gene" PropertyName="Text" Type="String" DefaultValue="" />--%>
    </SelectParameters>
</asp:SqlDataSource>

<%--<script src="../../assets/js/Sketch.js" charset="utf-8" type="text/javascript"></script>--%>
<script src="https://cdn.jsdelivr.net/npm/p5@0.10.2/lib/p5.js"></script>

<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <script type="text/javascript">

        // object containing all of our data!
        var resData = 0;

        // chart edges
        var chartTop = 0;
        var chartBottom = 35;
        //var chartLeft = 50;
        //var chartRight = 2950;

        var chartDomainMin = 0;
        var chartDomainMax = 1;
        var barWidth = 10;
        var rowCount = 0;

        var arr = [];
        var horizPoint = 0;
        var shiftToRight = 0;
        var wMap = 0;
        var distanceMap = 0;

        var btnCount;
        var geneName;
        const params = new URLSearchParams(window.location.search);
        const SId = params.get("SampleID");

        function setup() {
            //var canvas = createCanvas(70, 30);
            //var x = (windowWidth - width) - 220;

            if (horizPoint !== null && horizPoint !== 0) {
                var x = horizPoint + 20;
            }
            else {
                var x = 100;
            }

            var y = 100;
            var cnv = createCanvas(x, y);

            cnv.parent('sketch_holder');
            background(255, 255, 255);

            noLoop();

        }

        function draw() {

            clear();
            if (btnCount > 0) {
                for (var i = 0; i < btnCount; i++) {
                    document.getElementById("exoneBtn" + i).remove();
                }
            }

            setup();


            horizPoint = 120;

            if (rowCount > 0) {

                //Min & Max----------------------
                var maxx = Math.max.apply(Math, resData.map(function (el) {
                    return (el.eend - el.estart);

                }));

                var minn = Math.min.apply(Math, resData.map(function (el) {
                    return (el.eend - el.estart);
                }));

                var distanceMax = Math.max.apply(Math, arr.map(function (el) {
                    return (Number(el));
                }));

                var distanceMin = Math.min.apply(Math, arr.map(function (el) {
                    return (Number(el));
                }));

                var tmpDist = resData[0].estart;


                for (var r = 0; r < rowCount; r++) {

                    let bluecolor = color(213, 237, 241);
                    fill(bluecolor);
                    noStroke();
                    var w = resData[r].eend - resData[r].estart;

                    if (minn == maxx && maxx == w)
                        wMap = maxx;

                    else
                        wMap = map(w, minn, maxx, 80, 150);

                    rect(horizPoint, 35, wMap, 20, 5);

                    shiftToRight = Number(wMap - 55) / 2;

                    $('[data-toggle="tooltip"]').tooltip({ container: 'body' });

                    btn = createButton('Start: ' + resData[r].estart + ' - End: ' + resData[r].eend);
                    btn.position(horizPoint + 30, 96);
                    btn.style('background-color', bluecolor);
                    btn.style('width', wMap + 'px');
                    btn.class('exoneBtn');

                    btn.attribute("type", "button");
                    btn.attribute("title", resData[r].exonid);
                    btn.attribute("data-toggle", "tooltip");
                    btn.attribute("data-placement", "bottom");
                    btn.attribute("tooltip-trigger", "none");
                    btn.attribute("ID", "exoneBtn" + r);

                    btn.parent('sketch_holder');

                    // --q1--
                    showCoverageQ(0, resData[r].fraction_covared_q1);
                    // --q2--
                    showCoverageQ(17, resData[r].fraction_covared_q2);
                    // --q3--
                    showCoverageQ(34, resData[r].fraction_covared_q3);
                    // --q4--
                    showCoverageQ(51, resData[r].fraction_covared_q3);


                    var dist = Number(resData[r].estart) - Number(tmpDist);

                    if (distanceMin == distanceMax && distanceMax == dist)
                        distanceMap = wMap;

                    else
                        distanceMap = map(dist, distanceMin, distanceMax, 150, 350);


                    horizPoint += distanceMap + shiftToRight;
                    tmpDist = Number(resData[r].eend);
                }

                btnCount = rowCount;

                line_color = color(213, 237, 241);
                stroke(line_color);

                circle(50, 45, 10);
                circle(horizPoint, 45, 10)

                strokeWeight(2);
                line(50, 45, horizPoint, 45);
            }
            else {
                textSize(20);
                text('There is no Exone loss!', 150, 30);
            }

        }

        function showCoverageQ(ptoRight, pq) {
            var x = horizPoint + shiftToRight + ptoRight;
            var q = JSON.stringify(pq);
            var y = map(q,
                chartDomainMin, chartDomainMax,
                chartBottom, chartTop);

            strokeWeight(barWidth);
            strokeCap(SQUARE);
            stroke(238);
            line(x, y, x, 0);

            strokeWeight(barWidth);
            strokeCap(SQUARE);
            stroke(91, 192, 222);
            line(x, y, x, chartBottom);
        }

        function clicked(pindx) {

            background(255, 255, 255);

            line_color = color(213, 237, 241);
            stroke(line_color);
            Stroke(ROUND);
            textAlign(CENTER);
            fill(100);
            textSize(12);
            text("Start position: " + resData[pindx].estart, horizPoint + shiftToRight + 10, 50);
        }

        function RowSelected(sender, eventArgs) {

            document.getElementById("sketch_holder").style.display = 'block';
            var grid = sender;
            var MasterTable = grid.get_masterTableView();
            var row = MasterTable.get_dataItems()[eventArgs.get_itemIndexHierarchical()];
            var cell = MasterTable.getCellByColumnUniqueName(row, "genename");
            geneName = cell.innerHTML;

            var cell_chr = MasterTable.getCellByColumnUniqueName(row, "chr");

            document.getElementById('<%=lbl_geneName.ClientID %>').innerHTML = geneName;

            get_jqueryData(SId, geneName, cell_chr.innerHTML);

            callMethod = true;
        }

        function get_jqueryData(SampleId, gene, chr) {

            var list = [SampleId, gene, chr];
            var jsonText = JSON.stringify({ list: list });

            xmlhttp = new XMLHttpRequest();
            xmlhttp.open("POST", '/GAP/Service/se_GAP.asmx/getExoneLoss_Details_PerGene', true);

            jQuery.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                data: jsonText,
                async: false,
                dataType: 'JSON',
                url: '/GAP/Service/se_GAP.asmx/getExoneLoss_Details_PerGene',
                success: function (result) {

                    resData = JSON.parse(result.d);

                    rowCount = resData.length;
                    //var j = 0;
                    var tmp = resData[0].estart;
                    for (var i = 0; i < resData.length; i++) {
                        //j++;
                        //arr.push(Number(JSON.stringify(resData[j].start_Full)) - Number(resData[i].stop_Full));
                        arr.push(Number(resData[i].estart) - tmp);
                        tmp = Number(resData[i].eend);
                    }

                    // await new Promise(resolve => setTimeout(resolve, 3000)); // 3 sec
                },
                error: function () {
                    alert('Error on binding the data');
                }

            }).done(function () {
                console.log('DONE!');
                redraw(5);
            });

        }









        function RB_DeleteSearch_Clicked() {
            var grid = $find("<%= RG_ExonLoss.ClientID %>");
            master = grid.get_masterTableView();
            var Com = $telerik.findControl(grid.get_element(), "RCB_searchGene");
            Com.clearSelection();
            document.getElementById("<%= hdn_searchGene.ClientID %>").value = '0';
            master.DataSource = null;
            master.rebind();
        }
        function RCB_searchGeneIndexChange(sender, eventArgs) {
            var grid = $find("<%= RG_ExonLoss.ClientID %>");
            master = grid.get_masterTableView();
            var radcomboBox = $telerik.findControl(grid.get_element(), "RCB_searchGene");
            document.getElementById("<%= hdn_searchGene.ClientID %>").value = radcomboBox.get_value();
            master.DataSource = null;
            master.rebind();
        }

        function RCB_searchGeneOpening() {
            var grid = $find("<%= RG_ExonLoss.ClientID %>");
            var Com = $telerik.findControl(grid.get_element(), "RCB_searchGene");
            Com.set_emptyMessage("");
            Com.clearSelection();
        }

        function RB_Tab2_DeleteSearch_Clicked() {
            var grid = $find("<%= RG_ByGene.ClientID %>");
            master = grid.get_masterTableView();
            var Com = $telerik.findControl(grid.get_element(), "RCB_Tab2_searchGene");
            Com.clearSelection();
            document.getElementById("<%= hdn_searchGene_Tab2.ClientID %>").value = '0';
            master.DataSource = null;
            master.rebind();
        }

        function RCB_Tab2_searchGeneIndexChange(sender, eventArgs) {
            var grid = $find("<%= RG_ByGene.ClientID %>");
            master = grid.get_masterTableView();
            var radcomboBox = $telerik.findControl(grid.get_element(), "RCB_Tab2_searchGene");
            document.getElementById("<%= hdn_searchGene_Tab2.ClientID %>").value = radcomboBox.get_value();
            master.DataSource = null;
            master.rebind();

        }

        function RCB_Tab2_searchGeneOpening() {
            var grid = $find("<%= RG_ByGene.ClientID %>");
            var Com = $telerik.findControl(grid.get_element(), "RCB_Tab2_searchGene");
            Com.set_emptyMessage("");
            Com.clearSelection();

        }

    </script>
</telerik:RadScriptBlock>


