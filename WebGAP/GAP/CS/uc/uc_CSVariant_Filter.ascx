<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_CSVariant_Filter.ascx.cs" Inherits="WebGAP.GAP.CS.uc.uc_CSVariant_Filter" %>


<link href="../../assets/css/Filter_Custom.css" rel="stylesheet" type="text/css" runat="server" />



<telerik:RadFormDecorator RenderMode="Lightweight" ID="FormDecorator1" runat="server" DecoratedControls="all" DecorationZoneID="decorationZone"></telerik:RadFormDecorator>
<telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" runat="server" DecoratedControls="all" DecorationZoneID="decorationZoneRight"></telerik:RadFormDecorator>
<telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator2" runat="server" DecoratedControls="all" DecorationZoneID="decorationZoneMiddle"></telerik:RadFormDecorator>

<telerik:RadToolTipManager runat="server" ID="RTTM_PathogenScore" AutoTooltipify="true" />
<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>

        <telerik:AjaxSetting AjaxControlID="RTV_Filter">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RTV_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="myPanel" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RBAddAcmg">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RBAddAlleleFreq">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RBAddScores">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RBAddPapipred">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RBAddOtherPred">
            <UpdatedControls>
                <%--<telerik:AjaxUpdatedControl ControlID="RBAddOtherPred" />--%>
                <%--<telerik:AjaxUpdatedControl ControlID="lbl_err_otherpapi" />--%>
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RBAddClinvar">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RBAddPPS">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RBAddChrPos">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>
             <telerik:AjaxSetting AjaxControlID="RBPathogen">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RBPathogen" />
                <telerik:AjaxUpdatedControl ControlID="lbl_err_phatogen_score" />

                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RS_Ticks_Pathogen_Score" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RBPathogenClass">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RBPathogenClass" />
                <telerik:AjaxUpdatedControl ControlID="lbl_err_phatogen" />
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RBZygosity">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RBFunc">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RBAddGene">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RBAddFilterStat">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RBAddMutation">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RBAddFilterAllele">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RBAddInheritance">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RBAddGeneCount">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="RBAddPhenotype">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RBAddHPOToList">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RBADDGenePanelList">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RBADDUserPanelList">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="RBADDCS_GenePanelList">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RBAddHPO">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RBAddHPO" />
                <telerik:AjaxUpdatedControl ControlID="RLB_SelectedHPO" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RBAddHPOCount">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RBAddPanelList">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RBAddPanelList" />
                <telerik:AjaxUpdatedControl ControlID="RLB_SelectedPanelList" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="btnShow">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btnShow" />
                <telerik:AjaxUpdatedControl ControlID="PanelOrgChart" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RDDL_SelectChild" />
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" />
                <telerik:AjaxUpdatedControl ControlID="RDDL_Parent" />
                <telerik:AjaxUpdatedControl ControlID="RLB_Condition" />

            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="RLB_Condition">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="PanelOrgChart" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RLB_Condition" />
                <telerik:AjaxUpdatedControl ControlID="RDDL_Parent" />

            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="RDD_FilterSet">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RDD_FilterSet" LoadingPanelID="RadAjaxLoadingPanel1" />
                <%--<telerik:AjaxUpdatedControl ControlID="Del_RDD_FilterSet" />--%>
                <telerik:AjaxUpdatedControl ControlID="rightTabDiv" />
                <telerik:AjaxUpdatedControl ControlID="leftTabDiv" />
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="AddNewFilter">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="AddNewFilter" />
                <telerik:AjaxUpdatedControl ControlID="RDD_FilterSet" LoadingPanelID="RadAjaxLoadingPanel1" />
                <%--<telerik:AjaxUpdatedControl ControlID="Del_RDD_FilterSet" />--%>
                <%--<telerik:AjaxUpdatedControl ControlID="RPB_NewFilter" />--%>
                <%-- <telerik:AjaxUpdatedControl ControlID="PanelOrgChart" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" />
                <telerik:AjaxUpdatedControl ControlID="RDDL_Parent" />
                <telerik:AjaxUpdatedControl ControlID="RLB_Condition" />
                <telerik:AjaxUpdatedControl ControlID="RLB_Sample_Condition" />--%>
                <telerik:AjaxUpdatedControl ControlID="leftTabDiv" />
                <telerik:AjaxUpdatedControl ControlID="rightTabDiv" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="Del_RDD_FilterSet">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RDD_FilterSet" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="Del_RDD_FilterSet" />
                <telerik:AjaxUpdatedControl ControlID="rightTabDiv" />
                <telerik:AjaxUpdatedControl ControlID="leftTabDiv" />
            </UpdatedControls>

        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RB_Delete_Condition">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RB_Delete_Condition" />
                <telerik:AjaxUpdatedControl ControlID="RLB_Condition" />
                <telerik:AjaxUpdatedControl ControlID="RDD_FilterSet" />
                <telerik:AjaxUpdatedControl ControlID="PanelOrgChart" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" />
                <telerik:AjaxUpdatedControl ControlID="RDDL_Parent" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RBAddSelectedItem">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RLB_SelectedPanelList">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_SelectedPanelList" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RLB_SelectedHPO">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_SelectedHPO" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RB_ADDOMIM">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RBAddOMIMCount">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RBAddSelectedItem" />
            </UpdatedControls>
        </telerik:AjaxSetting>
         <telerik:AjaxSetting AjaxControlID="RB_Preview_SavedFilterItem">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RB_Preview_SavedFilterItem" />
                <telerik:AjaxUpdatedControl ControlID="RLB_SavedFilterItem" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RCB_UPanel">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RCB_UPanel" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="ShowResultCondition">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="selectedDataHolder" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RadTabStrip">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadMultiPage_DataHolder" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30" Skin="Office2007" />


<div class="content-header row pt-1">
    <div class="content-header-left col-md-12 col-12">
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


<div class="demo-container gray-bg pt-2" id="decorationZone" style="width: 45%; float: left">
    <asp:HiddenField runat="server" ID="SessionID" />
    <fieldset>
        <legend>Your Filter Sets</legend>
        <table style="width: 100%" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 85%">
                    <telerik:RadComboBox CssClass="btn-sm rddl_filter" ID="RDD_FilterSet" runat="server" Height="200px" Width="100%"
                        EmptyMessage="Select your filter set" AppendDataBoundItems="true" AutoPostBack="true" DropDownCssClass="RDD_FilterSet"
                        DataValueField="FilterID" DataTextField="FilterName" DataSourceID="Ds_FilterSet" OnSelectedIndexChanged="RDD_FilterSet_SelectedIndexChanged">
                        <HeaderTemplate>
                            <table style="width: 100%; text-align: left; background-color: #F0F8FF; font-size: 13px; font-weight: bold;">
                                <tr>

                                    <td style="width: 30%; padding: 10px 5px 10px 10px;">Filter name
                                    </td>

                                    <td style="width: 65%; padding: 10px 5px 10px 10px">Description
                                    </td>
                                </tr>
                            </table>

                            </ItemTemplate>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 100%; border-bottom: 1px solid #ccc; border-radius: 5px;">
                                <tr>
                                    <td>
                                        <table style="width: 100%; font-size: small; text-align: left">
                                            <tr>

                                                <td style="width: 30%; padding: 5px 5px 5px 10px;">
                                                    <%# DataBinder.Eval(Container.DataItem, "FilterName")%> 
                                                </td>

                                                <td style="width: 65%; padding: 5px 5px 5px 10px">
                                                    <%# DataBinder.Eval(Container.DataItem, "Description")%>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>

                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadComboBox>
                </td>
                <td style="width: 15%; text-align: right; padding-right: 13px">
                    <telerik:RadButton runat="server" ID="Del_RDD_FilterSet" AutoPostBack="true" Text="delete" Skin="Material"
                        RenderMode="Lightweight" Font-Size="Small" Icon-PrimaryIconLeft="8px" Icon-PrimaryIconTop="12px" Width="93px" CssClass="delBtn" OnClick="Del_RDD_FilterSet_Click">
                        <%-- --%>
                        <Icon PrimaryIconUrl="/img/icon/icon_del-trash.gif" />
                    </telerik:RadButton>
                </td>
            </tr>
        </table>
        <div class="demo-container size-wide no-bg" style="font-size: 13px !important; margin-left: 10px">
            <telerik:RadPanelBar RenderMode="Lightweight" runat="server" ID="RPB_NewFilter" Width="98%" Skin="Metro">
                <Items>
                    <telerik:RadPanelItem Text="Click me if you want to make a new filter" Value="clps" Expanded="false">
                        <ContentTemplate>
                            <telerik:RadMultiPage runat="server" ID="RMP_NewFilter" SelectedIndex="0" CssClass="multiPage">
                                <telerik:RadPageView runat="server" ID="RPV_NewFilter">
                                    <table class="tbl-container" runat="server" style="width: 100%; margin: 0 auto;">
                                        <tbody>
                                            <tr>
                                                <td style="padding: 10px 15px 10px 15px;">Filter Name: 
                                                </td>
                                                <td style="padding: 10px 15px 10px 15px;">
                                                    <asp:TextBox runat="server" ID="txtbox_FilterName" Height="24px" Style="width: -webkit-fill-available"></asp:TextBox>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td style="padding: 10px 15px 10px 15px;">Description :
                                                </td>
                                                <td style="padding: 10px 15px 10px 15px;">
                                                    <asp:TextBox runat="server" ID="Txt_Desc" Height="110px" Width="99%" TextMode="MultiLine"></asp:TextBox>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td style="padding: 10px 15px 10px 15px;">
                                                    <asp:Label runat="server" ID="lbl_added" Text="" ForeColor="#339933" Font-Size="small"></asp:Label>
                                                </td>
                                                <td style="padding: 10px 15px 10px 15px; text-align: left; float: right">
                                                    <telerik:RadButton runat="server" ID="AddNewFilter" AutoPostBack="true" Text="Add new filter" Skin="Material" OnClick="AddNewFilter_Click"
                                                        RenderMode="Lightweight" Font-Size="Small" Width="150px" Icon-PrimaryIconLeft="10px" Icon-PrimaryIconTop="12px">
                                                        <Icon PrimaryIconUrl="~/img/icon/icon_add-filter.gif" />
                                                    </telerik:RadButton>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </telerik:RadPageView>
                            </telerik:RadMultiPage>
                        </ContentTemplate>
                    </telerik:RadPanelItem>
                </Items>
                <ExpandAnimation Type="Linear" />
                <CollapseAnimation Type="Linear" />
            </telerik:RadPanelBar>
        </div>

    </fieldset>
    <div id="leftTabDiv" runat="server">
        <fieldset class="fieldSet_left_tab" runat="server" id="leftTab" style="padding: .71428571em 1.07142857em !important">
            <legend>Filter Item</legend>

            <telerik:RadTabStrip RenderMode="Lightweight" CssClass="left-float RTS_filter" Height="450px" Width="21%" runat="server" ID="RadTabStrip"
                MultiPageID="RadMultiPage_DataHolder" Orientation="VerticalRight" Skin="Silk" SelectedIndex="0" OnTabClick="RadTabStrip_TabClick">
                <Tabs>
                    <telerik:RadTab Text="ACMG Rules" ToolTip="ACMG Rules"></telerik:RadTab>
                    <telerik:RadTab Text="Allele Frequencies" ToolTip="Allele Frequencies"></telerik:RadTab>
                    <telerik:RadTab Text="Scores" ToolTip="Scores"></telerik:RadTab>
                    <telerik:RadTab Text="ClinVar Class" ToolTip="ClinVar Class"></telerik:RadTab>
                    <telerik:RadTab Text="Chr and Pos" ToolTip="Chromosome and Position"></telerik:RadTab>
                    <telerik:RadTab Text="Pathogenicity Class" ToolTip="Pathogenicity Class"></telerik:RadTab>
                    <telerik:RadTab Text="Zygosity" ToolTip="Zygosity"></telerik:RadTab>
                    <telerik:RadTab Text="Effect" ToolTip="Effect"></telerik:RadTab>
                    <telerik:RadTab Text="Gene List" ToolTip="Gene List"></telerik:RadTab>
                    <telerik:RadTab Text="Panel" ToolTip="Panel"></telerik:RadTab>
                    <telerik:RadTab Text="Call Status" ToolTip="Call Status"></telerik:RadTab>
                    <telerik:RadTab Text="Inheritance" ToolTip="Inheritance"></telerik:RadTab>
                    <telerik:RadTab Text="HPO" ToolTip="Human Phenotype Ontology"></telerik:RadTab>
                    <telerik:RadTab Text="OMIM" ToolTip="Online Mendelian Inheritance in Man"></telerik:RadTab>


                </Tabs>
            </telerik:RadTabStrip>
            <telerik:RadMultiPage ID="RadMultiPage_DataHolder" runat="server" CssClass="innerMultiPage RMP_filter" SelectedIndex="0">
                <telerik:RadPageView ID="RadPageView1" runat="server">
                    <table class="tbl-filter-container">
                        <tr>
                            <td>
                                <h4>ACMG Rules</h4>

                                <telerik:RadComboBox RenderMode="Classic" ID="RCB_Acmg" runat="server" Height="190px" Width="100%" Font-Size="13px"
                                    DropDownCssClass="multipleRowsColumns" DropDownWidth="400px" DataSourceID="SDS_Filter_Tab_ACMG"
                                    DataTextField="Description" DataValueField="Field" EmptyMessage="Select the criteria..." />
                                <br />
                                <div style="font-size: 12px; margin-top: 15px; border-top: 1px solid #e8e8e8; padding-top: 11px; padding-bottom: 11px;">
                                    <div class="custom-control custom-checkbox" style="border-bottom: 1px solid #eaeaea">
                                        <input type="checkbox" class="custom-control-input" name="acmg" id="True" value="True">
                                        <label class="custom-control-label" for="True">True</label>
                                    </div>
                                    <div class="custom-control custom-checkbox" style="border-bottom: 1px solid #eaeaea">
                                        <input type="checkbox" class="custom-control-input" name="acmg" id="False" value="False">
                                        <label class="custom-control-label" for="False">False</label>
                                    </div>
                                    <div class="custom-control custom-checkbox" style="border-bottom: 1px solid #eaeaea">
                                        <input type="checkbox" class="custom-control-input" name="acmg" id="N.A." value="N.A.">
                                        <label class="custom-control-label" for="N.A.">N.A.</label>
                                    </div>
                                </div>
                                <asp:Label ID="lbl_err" runat="server" ForeColor="#cc3300" Font-Bold="true" Font-Size="12px"></asp:Label>
                                <label class="custom-desc-label">
                                    ACMG Criteria. In case PVS1 is declassed to Strong level of evidence, "true(strong)" is reported.
                                </label>
                                <br />

                                <telerik:RadButton CssClass="btn btn-info mr-1 ladda-button btn-sm RBAddAcmgRules" runat="server" ForeColor="White"
                                    Value="acmg" ID="RBAddAcmg" CausesValidation="false" Text="&#10003; Add to filter" OnClick="RBAdd_Click" />
                                <%-- --%>
                            </td>
                        </tr>
                    </table>

                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView2" runat="server">
                    <table class="tbl-filter-container">
                        <tr>
                            <td colspan="5">
                                <h4>Allele Frequencies | <span style="font-size: 16px; color: #27A2CF; font-weight: bold">genomAD frequency</span></h4>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <h3>Frequency</h3>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 23%">
                                <telerik:RadTextBox ID="fromAFreq" CssClass="form-control" runat="server" EmptyMessage="eq.0.00100033"></telerik:RadTextBox>
                                <%--<input type="text"  value="eq.0.00100033" style="width: 100%; font-size: 12px" />--%>
                            </td>
                            <td>
                                <div class="conditionDiv"><=</div>
                            </td>
                            <td style="width: 40%">
                                <telerik:RadComboBox RenderMode="Classic" ID="RCB_Freq" runat="server" Height="190px" Width="100%" Font-Size="12px"
                                    DropDownCssClass="multipleRowsColumns" DropDownWidth="400px" DataSourceID="SDS_Filter_Tab_Freq" DataTextField="Description" DataValueField="Field" />
                            </td>
                            <td>
                                <div class="conditionDiv">=></div>
                            </td>
                            <td>
                                <telerik:RadTextBox runat="server" ID="toAFreq" CssClass="form-control" EmptyMessage="eq.0.0031348"></telerik:RadTextBox>
                                <%--<input type="text"   style="width: 100%; font-size: 12px" />--%>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="5">
                                <asp:Label ID="lbl_err_freq" runat="server" ForeColor="#cc3300" Font-Bold="true" Font-Size="12px"></asp:Label>
                                <label class="custom-desc-label" style="padding-top: 0px">
                                    Frequency filter using gnomAD exome and genome frequencies, based on the ethnicity of the sample provided, 
                                or the general frequency if ethnicity is not provided. 
                                In analyses done before 6 May 2017, the ExAC and 1000 genomes frequencies are used.
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5" style="padding-top: 15px">
                                <telerik:RadButton CssClass="btn btn-info mr-1 ladda-button btn-sm RBAddFreq" runat="server" ForeColor="White"
                                    Value="alleleFreq" ID="RBAddAlleleFreq" CausesValidation="false" Text="&#10003; Add to filter" OnClick="RBAdd_Click" />
                                <%----%>
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView3" runat="server">
                    <table class="tbl-filter-container">
                        <tr>
                            <td colspan="5">
                                <h4>Functional Prediction Scores</h4>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="5">
                                <h3>Score</h3>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 23%">
                                <telerik:RadTextBox CssClass="form-control" runat="server" ID="siftSFrom" EmptyMessage="eq.0.015802068" />
                            </td>
                            <td>
                                <div class="conditionDiv"><=</div>
                            </td>
                            <td style="width: 40%">
                                <telerik:RadComboBox RenderMode="Classic" ID="RCB_Scores" runat="server" Height="190px" Width="100%" Font-Size="12px"
                                    DropDownCssClass="multipleRowsColumns" DropDownWidth="400px" DataSourceID="SDS_Filter_Tab_Scores" DataTextField="Description" DataValueField="Field" />
                            </td>
                            <td>
                                <div class="conditionDiv">=></div>
                            </td>
                            <td>
                                <telerik:RadTextBox CssClass="form-control" runat="server" ID="siftSTo" EmptyMessage="eq.0.03775487" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5" style="padding-top: 15px">
                                <asp:Label ID="lbl_err_score" runat="server" ForeColor="#cc3300" Font-Bold="true" Font-Size="12px"></asp:Label>
                                <br />
                                <telerik:RadButton CssClass="btn btn-info mr-1 ladda-button btn-sm RBAddScore" runat="server" ForeColor="White"
                                    Value="scores" ID="RBAddScores" CausesValidation="false" Text="&#10003; Add to filter" OnClick="RBAdd_Click" />
                                <%----%>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="5">
                                <hr />
                                <h3>PaPI_pred</h3>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <div style="font-size: 12px; padding-top: 5px; padding-bottom: 11px;">
                                    <div class="custom-control custom-checkbox" style="border-bottom: 1px solid #eaeaea">
                                        <input type="checkbox" class="custom-control-input" name="PaPIpred" id="Damaging" value="Damaging">
                                        <label class="custom-control-label" for="Damaging">Damaging</label>
                                    </div>
                                    <div class="custom-control custom-checkbox" style="border-bottom: 1px solid #eaeaea">
                                        <input type="checkbox" class="custom-control-input" name="PaPIpred" id="Tolerated" value="Tolerated">
                                        <label class="custom-control-label" for="Tolerated">Tolerated</label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <asp:Label ID="lbl_err_papi" runat="server" ForeColor="#cc3300" Font-Bold="true" Font-Size="12px"></asp:Label>

                                <label class="custom-control-label" style="padding-top: 0px">
                                    PaPI prediction for this variant to be damaging/tolerated for the protein structure/function. 
                                It is the combined prediction given by PolyPhen-2, SIFT and PseeAC-RF classifiers.
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5" style="padding-top: 15px">
                                <telerik:RadButton CssClass="btn btn-info mr-1 ladda-button btn-sm RBAddPapipred" runat="server" ForeColor="White"
                                    Value="Papipred" ID="RBAddPapipred" CausesValidation="false" Text="&#10003; Add to filter" OnClick="RBAdd_Click" />
                                <asp:HiddenField ID="hdnSelectedPapipred" runat="server" ClientIDMode="Static" />

                                <%----%>

                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <hr />
                                <h3>Other Prediction</h3>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <telerik:RadComboBox RenderMode="Classic" ID="RCB_otherPred" runat="server" Height="90px" Width="100%" Font-Size="12px"
                                    DropDownCssClass="multipleRowsColumns" DropDownWidth="400px" ExpandDirection="Down" EmptyMessage="Select the criteria...">
                                    <Items>
                                        <telerik:RadComboBoxItem Text="PolyPhen_2_pred" Value="PolyPhen_2_pred" runat="server" />
                                        <telerik:RadComboBoxItem Text="SIFT_pred" Value="SIFT_pred" runat="server" />
                                        <telerik:RadComboBoxItem Text="PseeAC_RF_pred" Value="PseeAC_RF_pred" runat="server" />
                                    </Items>
                                </telerik:RadComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <div style="font-size: 12px; margin-top: 5px; padding-top: 11px; padding-bottom: 11px;">
                                    <div class="custom-control custom-checkbox" style="border-bottom: 1px solid #eaeaea">
                                        <input type="checkbox" class="custom-control-input" name="OtherPred" id="D" value="D">
                                        <label class="custom-control-label" for="D">D</label>
                                    </div>
                                    <div class="custom-control custom-checkbox" style="border-bottom: 1px solid #eaeaea">
                                        <input type="checkbox" class="custom-control-input" name="OtherPred" id="B" value="B">
                                        <label class="custom-control-label" for="B">B</label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">

                                <asp:Label ID="lbl_err_otherpapi" runat="server" ForeColor="#cc3300" Font-Bold="true" Font-Size="12px"></asp:Label>

                                <label class="custom-desc-label" style="padding-top: 0px">
                                    PolyPhen-2 (HumVar) prediction for this variant to be damaging/tolerated for the protein structure/function.
                                <br />
                                    SIFT prediction for this variant to be damaging/tolerated for the protein structure/function.
                                <br />
                                    Random Forest Pseudo-Amino acidic classifier prediction for this variant to be damaging/tolerated for the protein structure/function.
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5" style="padding-top: 15px">
                                <telerik:RadButton CssClass="btn btn-info mr-1 ladda-button btn-sm RBAddOtherPred" runat="server" ForeColor="White"
                                    Value="OtherPred" ID="RBAddOtherPred" Text="&#10003; Add to filter" OnClick="RBAdd_Click" />
                                <%----%>
                                <hr />
                                <br />
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView4" runat="server">
                    <asp:HiddenField ID="hdnSelectedClinvar" runat="server" ClientIDMode="Static" />
                    <table class="tbl-filter-container">
                        <tr>
                            <td>
                                <h4>ClinVar Class</h4>

                                <telerik:RadComboBox RenderMode="Classic" ID="RCB_Clinvar" runat="server" Height="190px" Width="100%" Font-Size="13px"
                                    DropDownCssClass="multipleRowsColumns" DropDownWidth="400px" DataSourceID="SDS_Filter_Tab_Clinvar"
                                    DataTextField="Description" DataValueField="Field" EmptyMessage="Select the criteria..." />
                                <br />

                                <asp:Label ID="lbl_err_clinvar" runat="server" ForeColor="#cc3300" Font-Bold="true" Font-Size="12px"></asp:Label>

                                <label class="custom-desc-label">
                                    Variant classifciation reported in ClinVar according to different submissions (RCVs).
                                </label>
                                <br />
                                <telerik:RadButton CssClass="btn btn-info mr-1 ladda-button btn-sm RBADDClinvar" runat="server" ForeColor="White"
                                    Value="clinvar" ID="RBADDClinvar" CausesValidation="false" Text="&#10003; Add to filter" OnClick="RBAdd_Click" />
                                <%----%>
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView5" runat="server">
                    <table class="tbl-filter-container">
                        <tr>
                            <td colspan="2">
                                <h4>Chromosome and Position</h4>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <telerik:RadTextBox runat="server" ID="chrom" EmptyMessage="Chromosome" CssClass="form-control" Width="100%"></telerik:RadTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <h5>Position</h5>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadTextBox runat="server" ID="Spos" EmptyMessage="Start" CssClass="form-control" Width="100%"></telerik:RadTextBox>
                            </td>
                            <td>
                                <telerik:RadTextBox runat="server" ID="Epos" EmptyMessage="End" CssClass="form-control" Width="100%"></telerik:RadTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lbl_err_chr" runat="server" ForeColor="#cc3300" Font-Bold="true" Font-Size="12px"></asp:Label>
                                <br />
                                <telerik:RadButton CssClass="btn btn-info mr-1 ladda-button btn-sm RBAddChrPos" runat="server" ForeColor="White"
                                    ID="RBAddChrPos" Value="ChrPos" CausesValidation="false" Text="&#10003; Add to filter" OnClick="RBAdd_Click" />
                                <%----%> 
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView6" runat="server">
                    <table class="tbl-filter-container">
                        <tr>
                            <td>
                                <h4>Pathogenicity class</h4>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadComboBox RenderMode="Classic" ID="RCB_Pathogen" runat="server" Height="120px" Width="100%" Font-Size="13px"
                                    DropDownCssClass="multipleRowsColumns" DropDownWidth="400px" EmptyMessage="Select the criteria..." />
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <label class="custom-control-label">
                                    ACMG/AMP variant classification.
                                </label>
                                <asp:Label ID="lbl_err_phatogen" runat="server" ForeColor="#cc3300" Font-Bold="true" Font-Size="12px"></asp:Label><br />
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <telerik:RadButton CssClass="btn btn-info mr-1 ladda-button btn-sm RBPathogenClass" runat="server" ForeColor="White"
                                    ID="RBPathogenClass" Value="pathogenClass" OnClick="RBAdd_Click" CausesValidation="false" Text="&#10003; Add to filter" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h5>Pathogenicity Score</h5>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadSlider RenderMode="Classic" ID="RS_Ticks_Pathogen_Score" runat="server" AutoToolTipPrecision="0.5"
                                    SmallChange="0.5" LargeChange="0.5" ItemType="Item" Height="70px" Width="400px" Skin="Silk" AutoPostBack="true"
                                    DragText="Set the minimum" OnClientLoad="OnClientLoad" OnValueChanged="RS_Ticks_Pathogen_Score_ValueChanged"
                                    AnimationDuration="400" CssClass="ItemsSlider" ThumbsInteractionMode="Free">
                                    <ItemBinding TextField="Score" ToolTipField="ScoreTxt" ValueField="Score"></ItemBinding>
                                </telerik:RadSlider>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="custom-control-label">
                                    Weighted score of pathogenicity based on triggered ACMG criteria and their level of evidence. 
                                </label>
                                <asp:Label ID="lbl_err_phatogen_score" runat="server" ForeColor="#cc3300" Font-Bold="true" Font-Size="12px"></asp:Label><br />

                            </td>
                        </tr>

                        <tr>
                            <td>
                                <telerik:RadButton CssClass="btn btn-info mr-1 ladda-button btn-sm RBPathogen" runat="server" ForeColor="White"
                                    ID="RBPathogen" Value="pathogen" OnClick="RBAdd_Click" CausesValidation="false" Text="&#10003; Add to filter" />
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView7" runat="server">
                    <table class="tbl-filter-container">
                        <tr>
                            <td>
                                <h4>Zygosity</h4>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadComboBox RenderMode="Classic" ID="RCB_Zygosity" runat="server" Height="80px" Width="100%" Font-Size="13px"
                                    DropDownCssClass="multipleRowsColumns" DropDownWidth="400px" EmptyMessage="Select the criteria..." />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_err_zygo" runat="server" ForeColor="#cc3300" Font-Bold="true" Font-Size="12px"></asp:Label>

                                <label class="custom-control-label" style="padding: 5px; text-align: justify">
                                    The zygosity corresponding to REF/ALT allele. hom=ALT/ALT; het=ALT/REF; 
                                    multi= multiple alleles (not only REF and ALT) occur at this genomic locus. Extracted from VCF SAMPLE GT if available. 
                                <br />
                                    <br />
                                    <i>NOTE: Family Annotation file replicate this field and the other [$SAMPLE].</i><br />
                                    <br />
                                    <span style="color: #CA7173">* fields for each family member with the exception of inheritance fields that are for affected members only. </span>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadButton CssClass="btn btn-info mr-1 ladda-button btn-sm RBZygosity" runat="server" ForeColor="White"
                                    ID="RBZygosity" Value="zygosity" CausesValidation="false" Text="&#10003; Add to filter" OnClick="RBAdd_Click" />
                                <%----%> 
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView8" runat="server">
                    <asp:HiddenField ID="hdnSelectedFunc" runat="server" ClientIDMode="Static" />
                    <table class="tbl-filter-container">
                        <tr>
                            <td>
                                <h4>Effect</h4>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadComboBox RenderMode="Classic" ID="RCB_Effect" runat="server" Height="190px" Width="100%" Font-Size="13px"
                                    DropDownCssClass="multipleRowsColumns" DropDownWidth="400px" DataSourceID="SDS_Filter_Tab_Effect" CheckBoxes="true"
                                    DataTextField="Description" DataValueField="Field" OnItemDataBound="RCB_Effect_ItemDataBound" EmptyMessage="Select the criteria..." />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_err_effect" runat="server" ForeColor="#cc3300" Font-Bold="true" Font-Size="12px"></asp:Label>
                                <br />
                                <label class="custom-control-label" style="padding: 5px">
                                    Variant effect on transcript based on MISO 
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>

                                <telerik:RadButton CssClass="btn btn-info mr-1 ladda-button btn-sm RBFunc" runat="server" ForeColor="White"
                                    ID="RBFunc" Value="func" CausesValidation="false" Text="&#10003; Add to filter" OnClick="RBAdd_Click" />
                                <%----%>
                            </td>
                        </tr>
                    </table>

                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView9" runat="server">
                    <table class="tbl-filter-container">
                        <tr>
                            <td>
                                <h4>Gene List</h4>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h3>List</h3>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadAutoCompleteBox RenderMode="Lightweight" CssClass="RACB_gene" runat="server" ID="RACB_Gene" EmptyMessage="Please select your gene ... "
                                    DataSourceID="SDS_Panel_Gene" AllowCustomEntry="true" DataTextField="Gene_Name" DataValueField="Gene_Name" InputType="Token" Width="100%" DropDownWidth="50%" Skin="Silk">
                                </telerik:RadAutoCompleteBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_err_gene" runat="server" ForeColor="#cc3300" Font-Bold="true" Font-Size="12px"></asp:Label>
                                <br />
                                <label class="custom-control-label">
                                    Gene symbol according to HUGO Gene Nomenclature.
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />

                                <telerik:RadButton CssClass="btn btn-info mr-1 ladda-button btn-sm RBAddGene" runat="server" ForeColor="White"
                                    ID="RBAddGene" Value="geneList" Text="&#10003; Add to filter" CausesValidation="false" OnClick="RBAdd_Click" />
                                <%----%>
                                <br />
                                <br />
                            </td>
                        </tr>

                        <%--         <tr>
                            <td>
                                <h3>From patient phenotype</h3>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadDataForm RenderMode="Lightweight" runat="server" ID="RAF_PhenotypeCount" DataSourceID="DS_RAF_GeneCount_phenotype_ForIndividual"
                                    DataKeyNames="GeneCount">
                                    <ItemTemplate>
                                        <div class="count_gene_holder">
                                            <asp:CheckBox runat="server" ID="selectGeneCount" CssClass="chkbox" />
                                            <b style="font-size: 13px">Number of genes from patient phenotype : </b>
                                            <asp:Label runat="server" ID="lbl_GeneCount" class="form-control" Text='<%# Eval("GeneCount") %>'></asp:Label>
                                        </div>
                                    </ItemTemplate>
                                </telerik:RadDataForm>

                            </td>
                        </tr>
                        <tr style="background-color: white !important">
                            <td>

                                <telerik:RadButton CssClass="btn btn-info mr-1 ladda-button btn-sm" runat="server" ForeColor="White"
                                    ID="RBAddGeneCount" Value="geneCount" Text="&#10003; Add to filter" CausesValidation="false" OnClick="RBAdd_Click" />
                          

                                <telerik:RadButton ID="ShowResultGenePhenotype" RenderMode="Lightweight" CssClass="rb_geneCount" Skin="Material" runat="server"
                                    Text="Show detail" OnClick="ShowResultGenePhenotype_Click">
                                    <Icon PrimaryIconUrl="~/img/icon/icon_HPO_min.png" />
                                </telerik:RadButton>

                          
                            </td>
                        </tr>
                        --%>
                    </table>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView10" runat="server">
                    <table class="tbl-filter-container">
                        <tr>
                            <td>
                                <h4>Panel List</h4>
                                <telerik:RadComboBox RenderMode="Classic" ID="RCB_PanelList" runat="server" Height="190px" Width="88%" Font-Size="13px" CssClass="float_left"
                                    DropDownCssClass="multipleRowsColumns" DropDownWidth="400px" DataSourceID="SDS_Filter_Tab_PanelList" DataTextField="name"
                                    DataValueField="id" EmptyMessage="Select the criteria..." />

                                <telerik:RadButton BorderStyle="Solid" BorderColor="#cacaca" BorderWidth="1px" runat="server" ID="RBAddPanelList" Width="9%"
                                    Height="33px" CausesValidation="false" Text="Add" Skin="Metro" CssClass="float_right" OnClick="RBAddPanelList_Click" />
                                <%----%>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top: 15px">
                                <telerik:RadListBox RenderMode="Lightweight" ID="RLB_SelectedPanelList" runat="server" AutoPostBack="true"
                                    OnSelectedIndexChanged="RLB_SelectedPanelList_SelectedIndexChanged" Skin="Material" Width="100%" AllowDelete="true">
                                    <ButtonSettings AreaHeight="30" Position="Left" HorizontalAlign="Center" />
                                </telerik:RadListBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_err_panel" runat="server" ForeColor="#cc3300" Font-Bold="true" Font-Size="12px"></asp:Label><br />

                                <label class="custom-control-label" style="padding: 5px">
                                    For the 100,000 Genomes Project, gene panels are mapped to one or more recruitment categories, 
                                indicated by the gene panel name and/or listed under ‘relevant disorders’ for each panel in WiNGs.
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadButton CssClass="btn btn-info mr-1 ladda-button btn-sm RBADDGenePanelList" runat="server" ForeColor="White"
                                    ID="RBADDGenePanelList" Value="genePanelList" CausesValidation="false" Text="&#10003; Add to filter" OnClick="RBAdd_Click" />
                                <%----%>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top: 5px">
                                <h5>User panel list</h5>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadComboBox RenderMode="Classic" ID="RCB_UPanel" runat="server" Height="190px" Width="98%" Font-Size="13px" CssClass="float_left"
                                    DropDownCssClass="multipleRowsColumns" DropDownWidth="400px" DataSourceID="DS_UPanel" DataTextField="UPanelName"
                                    DataValueField="UPanelID" EmptyMessage="Select your created panel..." AutoPostBack="true" EnableLoadOnDemand="true" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" Display="Dynamic"
                                    ControlToValidate="RCB_UPanel" ErrorMessage="* Select your created panel." ForeColor="#CC0000" ValidationGroup="UPanel"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <telerik:RadButton CssClass="btn btn-info mr-1 ladda-button btn-sm RBADDCreatePanelList" runat="server" ForeColor="White"
                                    ID="RBCreatePanelList" Value="createPanelList" CausesValidation="false" Text="Create" OnClick="RBCreatePanelList_Click" />

                                <telerik:RadButton CssClass="btn btn-info mr-1 ladda-button btn-sm RBADDCreatePanelList" runat="server" ForeColor="White"
                                    ID="RBEditPanelList" Value="EditPanelList" ValidationGroup="UPanel" Text="Edit" OnClick="RBEditPanelList_Click" />

                                <telerik:RadButton CssClass="btn btn-info mr-1 ladda-button btn-sm RBADDUserPanelList" runat="server" ForeColor="White"
                                    ID="RBADDUserPanelList" Value="uPanelList" OnClick="RBAdd_Click" ValidationGroup="UPanel" Text="&#10003; Add to filter" />
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <h4>Carrier Screening Gene Panel</h4>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" value="Yes" id="Yes" name="CS_genePanelList">
                                    <label class="custom-control-label" for="Yes">True</label>
                                </div>

                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" value="No" id="No" name="CS_genePanelList">
                                    <label class="custom-control-label" for="No">False</label>
                                </div>
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <telerik:RadButton CssClass="btn btn-info mr-1 ladda-button btn-sm RBADDGenePanelList" runat="server" ForeColor="White"
                                    ID="RBADDCS_GenePanelList" Value="CS_genePanelList" CausesValidation="false" Text="&#10003; Add to filter" OnClick="RBAdd_Click" />
                                <%----%>
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView11" runat="server">
                    <table class="tbl-filter-container">
                        <tr>
                            <td colspan="5">
                                <h4>Call Status</h4>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <h3>Filter </h3>
                                <asp:HiddenField ID="hdnSelectedfilterStat" runat="server" ClientIDMode="Static" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" value="PASS" id="pass" name="filterStat">
                                    <label class="custom-control-label" for="pass">Pass</label>
                                </div>
                            </td>
                            <td colspan="4">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" value="FAIL" id="fail" name="filterStat">
                                    <label class="custom-control-label" for="fail">Fail</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <telerik:RadButton CssClass="btn btn-info mr-1 ladda-button btn-sm filterStats" runat="server" ForeColor="White"
                                    ID="RBAddFilterStat" Value="filterStats" Text="&#10003; Add to filter" CausesValidation="false" OnClick="RBAdd_Click" />
                                <%-- --%>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <h3>Mutation Type</h3>
                                <asp:HiddenField ID="hdnSelectedMutationType" runat="server" ClientIDMode="Static" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" value="SNP" id="snp" name="mutationT">
                                    <label class="custom-control-label" for="snp">SNP</label>
                                </div>
                            </td>
                            <td colspan="2">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" value="Deletion" id="deletion" name="mutationT">
                                    <label class="custom-control-label" for="deletion">Deletion</label>
                                </div>
                            </td>
                            <td colspan="2">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" value="Insertion" id="insertion" name="mutationT">
                                    <label class="custom-control-label" for="insertion">Insertion</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <telerik:RadButton CssClass="btn btn-info mr-1 ladda-button btn-sm mutationType" runat="server" ForeColor="White"
                                    ID="RBAddMutation" Value="mutationType" Text="&#10003; Add to filter" CausesValidation="false" OnClick="RBAdd_Click" />
                                <%----%>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <h3>Allele</h3>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 23%">
                                <telerik:RadTextBox runat="server" ID="filterAFrom" CssClass="form-control" EmptyMessage="eq.0.03125"></telerik:RadTextBox>
                            </td>
                            <td>
                                <div class="conditionDiv"><=</div>
                            </td>
                            <td style="width: 40%">
                                <telerik:RadComboBox RenderMode="Classic" ID="RCB_filterAllele" runat="server" Height="190px" Width="100%" Font-Size="12px"
                                    DropDownCssClass="multipleRowsColumns" DropDownWidth="400px">
                                    <Items>
                                        <telerik:RadComboBoxItem runat="server" Text="AF" ToolTip="ALT allele frequency. Extracted from VCF if available or inferred." Value="AF" />
                                        <telerik:RadComboBoxItem runat="server" Text="AO" ToolTip="Read depth for the ALT allele. Extracted from VCF if available or inferred." Value="AO" />
                                        <telerik:RadComboBoxItem runat="server" Text="RO" ToolTip="Read depth for the REF allele. Extracted from VCF if available or inferred." Value="RO" />
                                        <telerik:RadComboBoxItem runat="server" Text="COV" ToolTip="Read depth for the genomic locus. Extracted from VCF if available or inferred." Value="COV" />
                                    </Items>
                                </telerik:RadComboBox>
                            </td>
                            <td>
                                <div class="conditionDiv">=></div>
                            </td>
                            <td>
                                <telerik:RadTextBox runat="server" ID="filterATo" CssClass="form-control" EmptyMessage="eq.0.03125"></telerik:RadTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <asp:Label ID="lbl_err_allele" runat="server" ForeColor="#cc3300" Font-Bold="true" Font-Size="12px"></asp:Label>
                                <br />
                                <telerik:RadButton CssClass="btn btn-info mr-1 ladda-button btn-sm filterAllele" runat="server" ForeColor="White"
                                    ID="RBAddFilterAllele" Value="filterAllele" Text="&#10003; Add to filter" CausesValidation="false" OnClick="RBAdd_Click" />
                                <%----%>
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView12" runat="server">
                    <table class="tbl-filter-container">
                        <tr>
                            <td>
                                <h4>Inheritance</h4>

                                <telerik:RadComboBox RenderMode="Classic" ID="RCB_Inheritance" runat="server" Height="190px" Width="100%" Font-Size="13px"
                                    DropDownCssClass="multipleRowsColumns" DropDownWidth="400px" DataSourceID="SDS_Filter_Tab_Inheritance" DataTextField="Description"
                                    DataValueField="Field" EmptyMessage="Select the criteria..." />
                                <br />
                                <asp:Label ID="lbl_err_inhrt" runat="server" ForeColor="#cc3300" Font-Bold="true" Font-Size="12px"></asp:Label>

                                <label class="custom-desc-label">
                                    For Family Annotation file and for affected individuals only. Possible inheritance patterns for the variant according to the family analysis.
                                </label>
                                <br />
                                <telerik:RadButton CssClass="btn btn-info mr-1 ladda-button btn-sm RBAddInheritance" runat="server" ForeColor="White"
                                    Value="inheritance" ID="RBAddInheritance" CausesValidation="false" Text="&#10003; Add to filter" OnClick="RBAdd_Click" />
                                <%----%>
                            </td>
                        </tr>

                    </table>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView13" runat="server">
                    <table class="tbl-filter-container">
                        <tr>
                            <td>
                                <h4>Human Phenotype Ontology</h4>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h3>Phenotype</h3>
                                <p>(Based on the sample anotation)</p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadAutoCompleteBox RenderMode="Lightweight" CssClass="RACB_gene" runat="server" ID="RACB_Phenotype" EmptyMessage="Select the criteria... "
                                    DataSourceID="SDS_Filter_Tab_Phenotype" AllowCustomEntry="true" DataTextField="Phenotype" DataValueField="Phenotype" InputType="Token"
                                    Width="100%" DropDownWidth="50%" Skin="Silk">
                                </telerik:RadAutoCompleteBox>

                                <%--                             <telerik:RadComboBox RenderMode="Classic" ID="RCB_Phenotype" runat="server" Height="190px" Width="100%" Font-Size="13px"
                                DropDownCssClass="multipleRowsColumns" DropDownWidth="400px" DataSourceID="SDS_Filter_Tab_Phenotype"  CheckBoxes="true"
                                 DataTextField="Phenotype" DataValueField="Phenotype"  OnItemDataBound="RCB_Effect_ItemDataBound"  />--%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="custom-control-label" style="padding: 5px">
                                    Disease description accordingly to MedGen 
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_err_phen" runat="server" ForeColor="#cc3300" Font-Bold="true" Font-Size="12px"></asp:Label>
                                <br />

                                <telerik:RadButton CssClass="btn btn-info mr-1 ladda-button btn-sm RBPenotype" runat="server" ForeColor="White"
                                    ID="RBAddPhenotype" Value="phenotype" CausesValidation="false" Text="&#10003; Add to filter" OnClick="RBAdd_Click" />
                                <%-- --%>
                            </td>
                        </tr>
                        <tr style="background-color: white">
                            <td><span style="height: 20px; display: block"></span></td>
                        </tr>
                        <tr>
                            <td>
                                <h3>HPO Term</h3>
                            </td>
                        </tr>
                        <tr>
                            <td>

                                <telerik:RadComboBox RenderMode="Classic" ID="RCB_SearchHPO" runat="server" Height="190px" Width="88%" Font-Size="13px"
                                    Font-Bold="true" DataSourceID="SDS_RCB_SearchHPO" DataTextField="HPO_Des" EmptyMessage="Search the criteria..." Filter="Contains" DataValueField="HPOID"
                                    EnableAutomaticLoadOnDemand="True" ItemsPerRequest="5" AutoPostBack="false" OnClientDropDownOpening="RCB_SearchHPO_DropDownOpening"
                                    ShowMoreResultsBox="true" EnableVirtualScrolling="true" CssClass="float_left">
                                    <ItemTemplate>
                                        <table style="width: 100%">
                                            <tr style="font: Small; padding: 0">
                                                <td style="width: 100%"><%# DataBinder.Eval(Container.DataItem, "HPO_Des") %></td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </telerik:RadComboBox>
                                <telerik:RadButton BorderStyle="Solid" BorderColor="#cacaca" BorderWidth="1px" runat="server" ID="RBAddHPO" Width="8%"
                                    Height="33px" CausesValidation="false" Text="Add" Skin="Metro" CssClass="float_right padding_right_marginTop" OnClick="RBAddHPO_Click" />

                                <%----%>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top: 15px">
                                <asp:Label ID="lbl_err_hpo" runat="server" ForeColor="#cc3300" Font-Bold="true" Font-Size="12px"></asp:Label><br />

                                <%--Radlistbox to show list of selected hpo--%>
                                <telerik:RadListBox RenderMode="Lightweight" ID="RLB_SelectedHPO" runat="server" Skin="Material" AutoPostBack="true"
                                    Width="100%" AllowDelete="true" OnSelectedIndexChanged="RLB_SelectedHPO_SelectedIndexChanged">
                                    <ButtonSettings AreaHeight="30" Position="Left" HorizontalAlign="Center" />
                                </telerik:RadListBox>

                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label class="custom-control-label" style="padding: 5px">
                                    The Human Phenotype Ontology (HPO) provides a standardized vocabulary of phenotypic abnormalities encountered in human disease. 
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadButton CssClass="btn btn-info mr-1 ladda-button btn-sm RBAddHPOToList" runat="server" ForeColor="White"
                                    ID="RBAddHPOToList" Value="hpo" CausesValidation="false" Text="&#10003; Add to filter" OnClick="RBAdd_Click" />
                                <%----%>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                        <tr style="background-color: white">
                            <td><span style="height: 20px; display: block"></span></td>
                        </tr>
                        <%--   <tr>
                            <td>
                                <h3>From patient phenotype profile</h3>
                            </td>
                        </tr>--%>
                        <%--     <tr>
                            <td>
                                <telerik:RadDataForm RenderMode="Lightweight" runat="server" ID="RAF_HPOPhenotypeCount" DataSourceID="DS_RAF_HPOCount_phenotype_ForIndividual"
                                    DataKeyNames="HPOCount">
                                    <ItemTemplate>
                                        <div class="count_gene_holder">
                                            <asp:CheckBox runat="server" ID="selectHPOCount" CssClass="chkbox" />
                                            <b style="font-size: 13px">Number of HPOs from patient phenotype : </b>
                                            <asp:Label runat="server" ID="lbl_HPOCount" class="form-control" Text='<%# Eval("HPOCount") %>'></asp:Label>
                                        </div>
                                    </ItemTemplate>
                                </telerik:RadDataForm>

                            </td>
                        </tr>
                        <tr style="background-color: white !important">
                            <td>

                                <telerik:RadButton CssClass="btn btn-info mr-1 ladda-button btn-sm" runat="server" ForeColor="White"
                                    ID="RBAddHPOCount" Value="HPOCount"  Text="&#10003; Add to filter" CausesValidation="false"  OnClick="RBAdd_Click"/>
                          
                                <telerik:RadButton ID="ShowResultHPOPhenotype" RenderMode="Lightweight" CssClass="rb_geneCount" Skin="Material" runat="server"
                                    Text="Show detail" OnClick="ShowResultHPOPhenotype_Click">
                                    <Icon PrimaryIconUrl="~/img/icon/icon_HPO_min.png" />
                                </telerik:RadButton>
                            </td>
                        </tr>--%>
                    </table>

                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView14" runat="server">
                    <table class="tbl-filter-container">

                        <tr>
                            <td>
                                <h4>OMIM</h4>
                                <telerik:RadComboBox RenderMode="Classic" ID="RCB_OMIM" runat="server" Height="190px" Width="88%" Font-Size="13px" CssClass="float_left"
                                    EnableAutomaticLoadOnDemand="True" ItemsPerRequest="20" ShowMoreResultsBox="true" EmptyMessage="Select the criteria..."
                                    DropDownCssClass="multipleRowsColumns" DropDownWidth="400px" DataSourceID="SDS_Filter_Tab_OMIM" DataTextField="OMIM_Name" DataValueField="OMIMID" />

                                <telerik:RadButton BorderStyle="Solid" BorderColor="#cacaca" BorderWidth="1px" runat="server" ID="RBADDOMIM" Width="9%"
                                    Height="33px" CausesValidation="false" Text="Add" Skin="Metro" CssClass="float_right" OnClick="RBADDOMIM_Click" />
                                <%----%>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top: 15px">

                                <telerik:RadListBox RenderMode="Lightweight" ID="RLB_SelectedOMIM" runat="server" AutoPostBack="true"
                                    OnSelectedIndexChanged="RLB_SelectedOMIM_SelectedIndexChanged" Skin="Material" Width="100%" AllowDelete="true">
                                    <ButtonSettings AreaHeight="30" Position="Left" HorizontalAlign="Center" />
                                </telerik:RadListBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_err_omim" runat="server" ForeColor="#cc3300" Font-Bold="true" Font-Size="12px"></asp:Label><br />
                                <label class="custom-control-label" style="padding: 5px">
                                    (Based on the sample anotation)
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadButton CssClass="btn btn-info mr-1 ladda-button btn-sm RB_ADDOMIM" runat="server" ForeColor="White"
                                    ID="RB_ADDOMIM" Value="omim" CausesValidation="false" Text="&#10003; Add to filter" OnClick="RBAdd_Click" />
                                <%----%>
                                <br />
                                <br />
                            </td>
                        </tr>
                        <%--               <tr>
                            <td>
                                <h3>From patient phenotype profile</h3>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadDataForm RenderMode="Lightweight" runat="server" ID="RAF_OMIMPhenotypeCount" DataSourceID="DS_RAF_OMIMCount_phenotype_ForIndividual"
                                    DataKeyNames="OMIMCount">
                                    <ItemTemplate>
                                        <div class="count_gene_holder">
                                            <asp:CheckBox runat="server" ID="selectOmimCount" CssClass="chkbox" />
                                            <b style="font-size: 13px">Number of genes from patient phenotype profile : </b>
                                            <asp:Label runat="server" ID="lbl_OmimCount" class="form-control" Text='<%# Eval("OMIMCount") %>'></asp:Label>
                                        </div>
                                    </ItemTemplate>
                                </telerik:RadDataForm>

                            </td>
                        </tr>
                        <tr style="background-color: white !important">
                            <td>

                                <telerik:RadButton CssClass="btn btn-info mr-1 ladda-button btn-sm" runat="server" ForeColor="White"
                                    ID="RBAddOMIMCount" Value="OmimCount" Text="&#10003; Add to filter" CausesValidation="false" OnClick="RBAdd_Click" />
                             

                                <telerik:RadButton ID="ShowResultOmim" RenderMode="Lightweight" CssClass="rb_geneCount" Skin="Material" runat="server" OnClick="ShowResultOmim_Click"
                                    Text="Show detail">
                                  
                                    <Icon PrimaryIconUrl="~/img/icon/icon_HPO_min.png" />
                                </telerik:RadButton>
                            </td>
                        </tr>--%>
                    </table>
                </telerik:RadPageView>

            </telerik:RadMultiPage>
        </fieldset>
    </div>
</div>

<div class="demo-container gray-bg pt-2" id="decorationZoneRight" style="width: 52%; float: right;">
    <div id="rightTabDiv" runat="server">
        <fieldset class="fieldSet_left_tab" id="rightTab" runat="server" style="padding: .71428571em 1.07142857em !important">

            <legend>Select your filter and parent level</legend>
            <div style="padding-top: 20px; padding-left: 15px; min-height: 190px">

                           <div class="demo-container size-wide no-bg" style="font-size: 13px !important; margin-bottom: 5px">
                    <telerik:RadPanelBar RenderMode="Lightweight" BackColor="#eeeeee" runat="server" ID="RPB_SelectedItemPreview" CssClass="RPB_SelectedItemPreview" Width="99%" Skin="Metro">
                        <Items>
                            <telerik:RadPanelItem Text="Click me if you want to get a priview of your selected filter items or to delete it." Value="clps" Expanded="false">
                                <ContentTemplate>
                                    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="multiPage">
                                        <telerik:RadPageView runat="server" ID="RadPageView15">


                                            <table class="tbl-container" runat="server" style="width: 100%; margin: 0 auto;">
                                                <tbody>
                                                    <tr>
                                                        <td style="padding: 10px 15px 10px 15px;">
                                                            <telerik:RadListBox RenderMode="Lightweight" ID="RLB_SavedFilterItem" CssClass="RLB_SavedFilter"
                                                                runat="server" Width="100%" Height="117px" Skin="Material" AllowDelete="true"  AutoPostBack="True"
                                                                OnDeleting="RLB_SavedFilterItem_Deleting" AutoPostBackOnDelete="true" >
                                                                <HeaderTemplate>
                                                                    <span>Saved filters List</span>
                                                                </HeaderTemplate>
                                                                <ButtonSettings Position="Bottom" HorizontalAlign="Left" ShowDelete="true" RenderButtonText="true" AreaHeight="60px" />
                                                            </telerik:RadListBox>
                                                            <telerik:RadButton ID="RB_Preview_SavedFilterItem" runat="server" Skin="Material" Icon-PrimaryIconTop="12px" Height="16px" ToolTip="Preview" OnClick="RB_Preview_SavedFilterItem_Click"
                                                                AutoPostBack="true" RenderMode="Lightweight" Font-Size="11px" Icon-PrimaryIconLeft="8px" Text="Preview" Width="16px" CssClass="rb_marginTop">
                                                                <Icon PrimaryIconUrl="../../img/icon/icon_preview.png" />
                                                            </telerik:RadButton>
                                                        </td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </telerik:RadPageView>
                                    </telerik:RadMultiPage>
                                </ContentTemplate>
                            </telerik:RadPanelItem>
                        </Items>
                        <ExpandAnimation Type="Linear" />
                        <CollapseAnimation Type="Linear" />
                    </telerik:RadPanelBar>
                </div>


                <div class="div_selected_filter_list">
                    <telerik:RadListBox RenderMode="Lightweight" ID="RLB_Filter" SelectionMode="Multiple" runat="server" Width="100%" Height="117px" Skin="Material" AllowDelete="true">
                        <HeaderTemplate>
                            <span class="span-lvl-one">Selected filters List</span>
                        </HeaderTemplate>
                        <ButtonSettings Position="Bottom" HorizontalAlign="Left" ShowDelete="true" RenderButtonText="true" AreaHeight="60px" />
                    </telerik:RadListBox>

                    <telerik:RadButton ID="RBAddSelectedItem" RenderMode="Lightweight" CssClass="rb_show_result rb_marginTop" Skin="Material"
                        runat="server" OnClick="RBAddSelectedItem_Click" Text="Save your selected list" AutoPostBack="true" ToolTip="First select your conditions and add them to chart, then save them before clicking on Show Result.">
                        <Icon PrimaryIconUrl="~/img/icon/icon_save_selected_condition.png" />
                    </telerik:RadButton>
                </div>

                <div class="div_select_parent">
                    <p>Select the parent level</p>
                    <div class="rddl_holder">
                        <telerik:RadDropDownList DefaultMessage="Parent level" runat="server" ValidationGroup="gParent" CssClass="rddl_parent_lvl" ID="RDDL_Parent" Width="100%" Skin="Material" RenderMode="Lightweight">
                        </telerik:RadDropDownList>
                        <asp:RequiredFieldValidator ControlToValidate="RDDL_Parent" ID="RequiredFieldValidator1"
                            ValidationGroup="gParent" CssClass="errMsg" ErrorMessage="Please select the parent" runat="server" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                    <telerik:RadButton runat="server" OnClick="btnShow_Click" ValidationGroup="gParent" ID="btnShow" CssClass="float_right" Text="Add to chart" Skin="Material" RenderMode="Lightweight" />
                </div>

                <span style="width: 93%; height: 1px; display: table; padding-top: 15px;"></span>

                <div class="holder-selectedcondition-and-orgchart">
                    <p>Preview result filter</p>
                    <div class="containerRLB_Condition">
                        <telerik:RadListBox RenderMode="Lightweight" ID="RLB_Condition" runat="server" Skin="Material" Width="100%" CheckBoxes="true"
                            AutoPostBackOnDelete="true" CausesValidation="false" CssClass="rlbCondition">

                            <HeaderTemplate>
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 10%; text-align: left; padding-right: 7px">Result</td>
                                        <td style="width: 70%; text-align: left; padding-left: 10px; border-left: 1px solid #ccc;">Selected condition</td>
                                        <td style="width: 15%; text-align: left; padding-left: 10px; border-left: 1px solid #ccc;">Remove</td>
                                    </tr>
                                </table>

                            </HeaderTemplate>
                            <ItemTemplate>
                                <div style="float: right; width: 35px">
                                    <telerik:RadButton ID="RB_Delete_Condition" RenderMode="Lightweight" CssClass="rb_show_result" Skin="Metro" runat="server"
                                        AutoPostBack="true" OnClick="RB_Delete_Condition_Click">
                                        <Icon PrimaryIconUrl="/img/icon/icon_del-trash.gif" />
                                    </telerik:RadButton>
                                </div>
                            </ItemTemplate>
                        </telerik:RadListBox>
                        <div style="margin-top: 1px; padding-top: 12px; border-top: 1px solid #ccc">

                            <telerik:RadButton ID="ShowResultCondition" RenderMode="Lightweight" CssClass="rb_show_result" Skin="Material" runat="server"
                                ToolTip="You should check at least one condition (color one)" OnClick="ShowResultCondition_Click" Text="Show results">
                                <Icon PrimaryIconUrl="~/img/icon/icon_show_result.png" />
                            </telerik:RadButton>

                        </div>

                    </div>

                    <telerik:RadAjaxPanel runat="server" ID="PanelOrgChart" CssClass="panelOrgChart" ViewStateMode="Disabled">
                        <ul class="orgchart" runat="server">
                            <li class="root" id="rootLi" runat="server">
                                <div class="nodecontent"><span class="spanState">S0</span>Sample<asp:Label runat="server" ID="lbl_Root" CssClass="lblCount" /></div>
                                <asp:HiddenField runat="server" ID="hdf_rootCount" Value="" />
                            </li>
                        </ul>

                    </telerik:RadAjaxPanel>
                </div>

                <span style="width: 93%; height: 1px; display: table; padding-top: 15px;"></span>
            </div>
        </fieldset>
    </div>
</div>


<telerik:RadListBox ID="RLB_Sample_Condition" runat="server" CheckBoxes="false"
    ShowCheckAll="false" Width="0" Height="0" BorderColor="Transparent">
    <ItemTemplate>
        <table style="width: 100%;">
            <tr>
                <td style="width: 75%; text-align: left">
                    <asp:Label ID="lbl_Sel_condition_selectedCondition" runat="server" Text=""></asp:Label>
                    <%--'<%# DataBinder.Eval(Container, "Text") %>'--%>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</telerik:RadListBox>

<telerik:RadWindowManager ID="RadWindowManager2" ShowContentDuringLoad="true" RenderMode="Lightweight"
    ReloadOnShow="true" runat="server" EnableShadow="true"
    Skin="Windows7" AutoSize="false" Modal="true" VisibleStatusbar="false" VisibleTitlebar="false">
    <Windows>
        <telerik:RadWindow ID="RadWindow2" runat="server" RenderMode="Lightweight" BorderStyle="None" BorderWidth="1px" CssClass="RadWindow_Media px-0 pb-0" Modal="true" CenterIfModal="true">
        </telerik:RadWindow>
        <telerik:RadWindow RenderMode="Lightweight" runat="server" ID="RW_Gene" Width="450" Height="515" Top="50px" Modal="true" CenterIfModal="true" />

    </Windows>
</telerik:RadWindowManager>

<asp:SqlDataSource ID="Ds_FilterSet" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_GAP_CS_Filter_Set_Sel"
    SelectCommandType="StoredProcedure">
    <SelectParameters>
        <%--<asp:ControlParameter Name="UserID" DefaultValue="28" Type="Int32" ControlID="RDD_FilterSet" PropertyName="SelectedValue" />--%>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SDS_Panel_CS_Gene" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_GAP_CS_Gene_Filter_Sel" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

<asp:SqlDataSource ID="SDS_Panel_Gene" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="SELECT * FROM Tbl_Genes"></asp:SqlDataSource>

<asp:SqlDataSource ID="SDS_Panel" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="SELECT * FROM Tbl_GAP_Panel"></asp:SqlDataSource>

<asp:SqlDataSource ID="SDS_Filter_Tab_ACMG" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="SELECT * FROM Tbl_GAP_Filter_Tab Where Active = 1 AND Model = 'ACMG Rules'"></asp:SqlDataSource>

<asp:SqlDataSource ID="SDS_Filter_Tab_Freq" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="SELECT * FROM Tbl_GAP_Filter_Tab Where Active = 1 AND Model = 'Allele Frequencies'"></asp:SqlDataSource>

<asp:SqlDataSource ID="SDS_Filter_Tab_Scores" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="SELECT * FROM Tbl_GAP_Filter_Tab Where Active = 1 AND Model = 'Scores'"></asp:SqlDataSource>

<asp:SqlDataSource ID="SDS_Filter_Tab_Clinvar" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="SELECT * FROM Tbl_GAP_Filter_Tab Where Active = 1 AND Model = 'ClinVar Class'"></asp:SqlDataSource>

<asp:SqlDataSource ID="SDS_Filter_Tab_Effect" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="SELECT * FROM Tbl_GAP_Filter_Tab Where Active = 1 AND Model = 'Effect'"></asp:SqlDataSource>

<asp:SqlDataSource ID="SDS_Filter_Tab_Inheritance" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="SELECT * FROM Tbl_GAP_Filter_Tab Where Active = 1 AND Model = 'INHERITANCE'"></asp:SqlDataSource>

<asp:SqlDataSource ID="SDS_Filter_Tab_Phenotype" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_GAP_Filter_Tab_Phenotype" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="SampleID" SessionField="SampleID_Filter" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="DS_UPanel" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_GAP_Filter_UPanel_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SDS_RCB_SearchHPO" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PhenBook_SearchHPO" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

<asp:SqlDataSource ID="SDS_Filter_Tab_PanelList" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="SELECT id, name FROM Tbl_GAP_Filter_GenePanel"></asp:SqlDataSource>

<asp:SqlDataSource ID="SDS_Filter_Tab_OMIM" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="SELECT OMIMID, OMIM_Name FROM Tbl_PhenBook_OMIM"></asp:SqlDataSource>

<asp:SqlDataSource ID="DS_RAF_GeneCount_phenotype_ForIndividual" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_GAP_Filter_GeneCount_phenotype_ForIndividual" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="IndividualID" SessionField="IndividualID_Filter" Type="Int64" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="DS_RAF_OMIMCount_phenotype_ForIndividual" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_GAP_Filter_OMIMCount_phenotype_ForIndividual" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="IndividualID" SessionField="IndividualID_Filter" Type="Int64" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="DS_RAF_HPOCount_phenotype_ForIndividual" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_GAP_Filter_HPOCount_phenotype_ForIndividual" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="IndividualID" SessionField="IndividualID_Filter" Type="Int64" />
    </SelectParameters>
</asp:SqlDataSource>

<%--<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.1.js"></script>--%>




<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
    <script type="text/javascript"> 
        function pageLoad() {

            window.$ = $telerik.$;
            $(".rlbButton").each(function (b) {
                var className = this.className;

                if (className.indexOf("Delete") > -1) {
                    this.title = "Delete the selected row";
                    return;
                }
            });

        }

        $(document).ready(function () {

            listBox = $find("<%= RLB_Condition.ClientID %>");

            //$('input:checkbox').click(function () {
            //    $('input:checkbox').not(this).prop('checked', false);
            //});

            $('input:checkbox[name=acmg]').on('change', function () {
                //$('#hdnSelectedacmg').val($(this).attr('id'));
                $('input:checkbox[name=acmg]').not(this).prop('checked', false);
            });

            $('input:checkbox[name=PaPIpred]').on('change', function () {
                $('#hdnSelectedPapipred').val($(this).attr('id'));
                $('input:checkbox[name=PaPIpred]').not(this).prop('checked', false);
            });

            $('input:checkbox[name=OtherPred]').on('change', function () {
                // $('#hdnSelectedOtherPred').val($(this).attr('id'));
                $('input:checkbox[name=OtherPred]').not(this).prop('checked', false);
            });

            $('input:checkbox[name=func]').on('change', function () {
                $('#hdnSelectedFunc').val($(this).attr('id'));
                $('input:checkbox[name=func]').not(this).prop('checked', false);
            });

            $('input:checkbox[name=filterStat]').on('change', function () {
                $('#hdnSelectedfilterStat').val($(this).attr('id'));
                $('input:checkbox[name=filterStat]').not(this).prop('checked', false);
            });

            $('input:checkbox[name=mutationT]').on('change', function () {
                $('#hdnSelectedMutationType').val($(this).attr('id'));
                $('input:checkbox[name=mutationT]').not(this).prop('checked', false);
            });

            $("input:text").each(function () {
                // store default value
                var v = this.value;

                $(this).blur(function () {
                    // if input is empty, reset value to default 
                    if (this.value.length == 0) this.value = v;
                }).focus(function () {
                    // when input is focused, clear its contents
                    this.value = "";
                });
            });
        });

        function RLB_ConditionIndexChanging(sender, eventArgs) {

            //eventArgs.set_cancel(true);
            //eventArgs.get_selectedItem.get_text();
            listBox = $find("<%= RLB_Condition.ClientID %>");
            var selectedItem = listBox.get_selectedItem();
            alert(selectedItem.value);
        }

        function OnClientLoad(sender, args) {
            var tooltipManager = $find("<%= RTTM_PathogenScore.ClientID %>");
            tooltipManager.tooltipify(sender.get_element());
        }

        function OnClientSelectedIndexChanged(sender, args) {
            if (args.get_item().get_checked() == false) {
                args.get_item().set_checked(args.get_item().get_selected());
            }
            else {
                args.get_item().set_checked(false);
            }
        }

        function RCB_SearchHPO_DropDownOpening(sender, args) {
            var combo = $find('<%= RCB_SearchHPO.ClientID%>');
            combo.clearSelection();
        }

        function deleteItem() {
            if (listBox.get_items().get_count() < 1) {
                alert("The listBox is empty.");
                return false;
            }

            var selectedItem = listBox.get_selectedItem();
            if (!selectedItem) {
                alert("You need to select a item first.");
                return false;
            }

            if (listBox.get_items().get_count().length == 1) {
                if (!confirm("This is the last item in the listBox. Are you sure you want to delete it?"))
                    return false;
            }

            listBox.deleteItem(selectedItem);
            return false;
        }

        function OpenWin_Gene() {
            var oWnd = radopen("/GAP/HPO_SampleDiscovery.aspx", "RadWindow2");
        }

        function OpenWin_Show_GenePanel() {
            var oWnd = radopen("/GAP/Show_GenePanel_Genes.aspx", "RW_Gene");
            oWnd.center();
        }

        function OpenWin_Show_GeneRelatedToHPO() {
            var oWnd = radopen("/GAP/Show_GeneRelatedToHPO.aspx", "RW_Gene");
            oWnd.center();
        }

        function OpenWin_Show_GeneRelatedToOMIM() {
            var oWnd = radopen("/GAP/Show_GeneRelatedToOMIM.aspx", "RW_Gene");
            oWnd.center();
        }

        function OpenWin_CreatePanelList() {
            var size = 80;
            var browserWidth = $telerik.$(window).width();
            var width = Math.ceil(browserWidth * size / 100);
            var height = 650;
            var oWnd = radopen("/GAP/Create_UserPanelList.aspx", "RW_UPanel");
            oWnd.setSize(width, height);
            oWnd.center();
        }

        function OpenWin_EditPanelList() {
            var size = 80;
            var browserWidth = $telerik.$(window).width();
            var width = Math.ceil(browserWidth * size / 100);
            var height = 650;
            var oWnd = radopen("/GAP/Edit_UserPanelList.aspx", "RW_UPanel");
            oWnd.setSize(width, height);
            oWnd.center();
        }


    </script>

</telerik:RadCodeBlock>
