<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_SampleQuery.ascx.cs" Inherits="WebGAP.GAP.uc.uc_SampleQuery" %>

<link href=".././assets/css/sampleQuery_style.css" rel="stylesheet" type="text/css" media="screen" runat="server" />
<link href=".././assets/css/Filter_Custom.css" rel="stylesheet" type="text/css" runat="server" />
<style>
    .rlbTemplate table {
        width: auto !important
    }
</style>
<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RadTabStrip">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadMultiPage_DataHolder" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="AddNewFilter">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="leftTabDiv" />
                <telerik:AjaxUpdatedControl ControlID="RDD_FilterSet" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" />
                <telerik:AjaxUpdatedControl ControlID="PanelOrgChart" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RLB_Condition" />
                <telerik:AjaxUpdatedControl ControlID="RDDL_Parent" />
                <telerik:AjaxUpdatedControl ControlID="lbl_Root" />
                <telerik:AjaxUpdatedControl ControlID="RPB_NewFilter" />
                <telerik:AjaxUpdatedControl ControlID="ShowResultCondition" />
                <telerik:AjaxUpdatedControl ControlID="btnShow" />
                <telerik:AjaxUpdatedControl ControlID="Del_RDD_FilterSet" />
                <telerik:AjaxUpdatedControl ControlID="AddNewFilter" />
            </UpdatedControls>
        </telerik:AjaxSetting>


        <telerik:AjaxSetting AjaxControlID="RTS_FilterTab">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RTS_FilterTab"></telerik:AjaxUpdatedControl>
                <telerik:AjaxUpdatedControl ControlID="RMP_FItems" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="RadMultiPage1">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RMP_FItems"></telerik:AjaxUpdatedControl>
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="btn_RACB_test">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RLB_Filter">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                       <telerik:AjaxUpdatedControl ControlID="RDDL_Parent" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="btnShow"  />
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="btnShow">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btnShow" />
                <telerik:AjaxUpdatedControl ControlID="PanelOrgChart" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" />
                <telerik:AjaxUpdatedControl ControlID="RDDL_Parent" />
                <telerik:AjaxUpdatedControl ControlID="RLB_Condition" />
                <telerik:AjaxUpdatedControl ControlID="lbl_Root" />
                <telerik:AjaxUpdatedControl ControlID="lbl_Status" />
                <telerik:AjaxUpdatedControl ControlID="btnFetchCountPerItem" />


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
                <telerik:AjaxUpdatedControl ControlID="RDD_FilterSet" />
                <telerik:AjaxUpdatedControl ControlID="leftTabDiv" />
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="PanelOrgChart" />
                <telerik:AjaxUpdatedControl ControlID="RLB_Condition" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RDDL_Parent" />
                <telerik:AjaxUpdatedControl ControlID="lbl_Root" />
                <telerik:AjaxUpdatedControl ControlID="RPB_NewFilter" />
                <telerik:AjaxUpdatedControl ControlID="ShowResultCondition" />
                <telerik:AjaxUpdatedControl ControlID="btnShow" />
                <telerik:AjaxUpdatedControl ControlID="Del_RDD_FilterSet" />
                <telerik:AjaxUpdatedControl ControlID="RB_ShowCount" />
                <telerik:AjaxUpdatedControl ControlID="lbl_Status" />


            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="Del_RDD_FilterSet">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RDD_FilterSet" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="PanelOrgChart" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RDDL_Parent" />
                <telerik:AjaxUpdatedControl ControlID="RLB_Condition" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="lbl_Root" />
                <telerik:AjaxUpdatedControl ControlID="Del_RDD_FilterSet" />
                <telerik:AjaxUpdatedControl ControlID="RPB_NewFilter" />
                <telerik:AjaxUpdatedControl ControlID="RB_ShowCount" />
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
        <telerik:AjaxSetting AjaxControlID="ShowResultCondition">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="ShowResultCondition" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>

        <%--    <telerik:AjaxSetting AjaxControlID="RCB_RefBuild">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RCB_RefBuild" />
                <telerik:AjaxUpdatedControl ControlID="RDD_FilterSet" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="MakeNewFilterHolder" />
            </UpdatedControls>
        </telerik:AjaxSetting>--%>

        <telerik:AjaxSetting AjaxControlID="btnFetchCount">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btnFetchCount" />
                <%--<telerik:AjaxUpdatedControl ControlID="PanelOrgChart" />
                <telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />--%>
                <telerik:AjaxUpdatedControl ControlID="RDDL_Parent" />
                <telerik:AjaxUpdatedControl ControlID="RLB_Condition" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="lbl_Root" />
                <telerik:AjaxUpdatedControl ControlID="lbl_Status" />
                <telerik:AjaxUpdatedControl ControlID="ShowResultCondition" />
                <telerik:AjaxUpdatedControl ControlID="btnShow" />

            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="btnFetchCountPerItem">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btnFetchCountPerItem" />
                <telerik:AjaxUpdatedControl ControlID="PanelOrgChart" />
                <%--<telerik:AjaxUpdatedControl ControlID="RLB_Filter" LoadingPanelID="RadAjaxLoadingPanel1" />--%>
                <telerik:AjaxUpdatedControl ControlID="RDDL_Parent" />
                <telerik:AjaxUpdatedControl ControlID="RLB_Condition" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="lbl_Root" />
                <telerik:AjaxUpdatedControl ControlID="lbl_Status" />
                <telerik:AjaxUpdatedControl ControlID="ShowResultCondition" />
                <telerik:AjaxUpdatedControl ControlID="btnShow" />

            </UpdatedControls>
        </telerik:AjaxSetting>

    </AjaxSettings>
</telerik:RadAjaxManager>

<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30" Skin="Metro">
</telerik:RadAjaxLoadingPanel>
<%--<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30" MinDisplayTime="300" >
                <asp:Image ID="Image1" runat="server" ImageUrl="~/img/icon-loading1.gif" AlternateText="loading" Width="25px"></asp:Image>
        </telerik:RadAjaxLoadingPanel>--%>

<%--<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Silk">
    <img alt="Loading..." src='<%= RadAjaxLoadingPanel.GetWebResourceUrl(Page,
     "Telerik.Web.UI.Skins.Default.Ajax.loading.gif") %>' />
</telerik:RadAjaxLoadingPanel>--%>

<telerik:RadFormDecorator RenderMode="Lightweight" ID="FormDecorator1" runat="server" DecoratedControls="all" DecorationZoneID="decorationZone"></telerik:RadFormDecorator>

<div class="content-header" style="width: 100%; background-color: lightgray; display: flex; padding: 5px 10px; border-radius: 5px; margin: 15px 0">
    <table style="width: 100%;">
        <tr>
            <td style="width: 100px">
                <h3 style="margin-bottom: 1px">
                    <img src="../../img/icon/icon_add-filter.gif" style="padding-right: 8px" />
                    Filter </h3>
            </td>
            <td style="text-align: right">
                <asp:Label runat="server" ID="lbl_sampleID" Text="" CssClass="lblSample"></asp:Label>
            </td>
        </tr>
    </table>
</div>


<%--<asp:UpdatePanel ID="updatePnl" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
                <asp:Label runat="server" ID="lbl_waiting" Text="" CssClass="lbl-waiting"></asp:Label>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="RDD_FilterSet" EventName="SelectedIndexChanged" />
    </Triggers>
</asp:UpdatePanel>--%>

<div class="demo-container gray-bg" id="decorationZone" style="width: 45%; float: left">

    <fieldset>
        <legend>Your Filter Sets</legend>
        <table style="width: 100%" cellpadding="0" cellspacing="0">
            <tr>

                <td>
                    <telerik:RadComboBox CssClass="btn-sm rddl_filter" ID="RDD_FilterSet" runat="server" Height="200px" Width="100%" AutoPostBack="true" AllowCustomText="false"
                        EmptyMessage="Select your filter set" HighlightTemplatedItems="true" DropDownCssClass="RDD_FilterSet" Filter="None" OnClientLoad="OnClientLoadHandler"
                        DataValueField="FilterID" DataTextField="FilterName" DataSourceID="Ds_FilterSet" OnClientSelectedIndexChanged="RDD_FilterSet_ClientSelectedIndexChanged"
                        OnSelectedIndexChanged="RDD_FilterSet_SelectedIndexChanged">
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
                <td style="width: 17%; text-align: right; padding-right: 13px">
                    <telerik:RadButton runat="server" OnClick="Del_RDD_FilterSet_Click" ID="Del_RDD_FilterSet" AutoPostBack="true" Text="delete" Skin="Material"
                        RenderMode="Lightweight" Font-Size="Small" Icon-PrimaryIconLeft="8px" Icon-PrimaryIconTop="12px" Width="93px" CssClass="delBtn" Enabled="false">
                        <Icon PrimaryIconUrl="~/img/icon/icon_del-trash.gif" />
                    </telerik:RadButton>

                </td>
            </tr>
        </table>
        <div class="demo-container size-wide no-bg" runat="server" id="MakeNewFilterHolder" style="font-size: 13px !important; margin-left: 10px">
            <telerik:RadPanelBar RenderMode="Lightweight" runat="server" ID="RPB_NewFilter" Width="98%" Skin="Metro" ExpandMode="MultipleExpandedItems" ExpandAnimation-Duration="300"
                ExpandAnimation-Type="InExpo" CollapseAnimation-Duration="350" CollapseAnimation-Type="InExpo">
                <Items>
                    <telerik:RadPanelItem Text="Click me if you want to make a new filter" runat="server" PostBack="true" Value="clps" Expanded="false">
                        <ContentTemplate>
                            <telerik:RadMultiPage runat="server" ID="RMP_NewFilter" SelectedIndex="0" CssClass="multiPage">
                                <telerik:RadPageView runat="server" ID="RPV_NewFilter">
                                    <table class="tbl-container" runat="server" style="width: 100%; margin: 0 auto;">
                                        <tbody>
                                            <tr>
                                                <td style="padding: 10px 15px 10px 15px;">Filter Name: 
                                                </td>
                                                <td style="padding: 5px 0 0 0  !important;">
                                                    <asp:TextBox runat="server" ID="txtbox_FilterName" Height="26px" Style="width: -webkit-fill-available; margin-top: 8px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" InitialValue="" ForeColor="#CC0000" ControlToValidate="txtbox_FilterName"
                                                        ErrorMessage="* Enter the filter name." ValidationGroup="validName"></asp:RequiredFieldValidator>
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
                                                <td style="padding: 10px 15px 0px 15px; text-align: left; float: right">
                                                    <telerik:RadButton runat="server" OnClick="AddNewFilter_Click" ID="AddNewFilter" AutoPostBack="true" Text="Add new filter" Skin="Material"
                                                        RenderMode="Lightweight" Font-Size="Small" Width="150px" Icon-PrimaryIconLeft="10px" Icon-PrimaryIconTop="12px" ValidationGroup="validName">
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
    <div id="leftTabDiv" runat="server" class="disabledDiv">
        <fieldset class="fieldSet_left_tab" runat="server" id="leftTab" style="padding: .71428571em 1.07142857em !important">
            <legend>Filter Item</legend>
            <telerik:RadTabStrip RenderMode="Lightweight" ID="RTS_FilterTab" runat="server" ScrollChildren="True" OnTabClick="RTS_FilterTab_TabClick"
                SelectedIndex="0" Skin="Silk" Orientation="VerticalLeft" Height="400px">
                <%--Width="100%" OnClientTabSelecting="onTabSelecting" --%>
            </telerik:RadTabStrip>
            <telerik:RadMultiPage runat="server" ID="RMP_FItems" SelectedIndex="0" CssClass="innerMultiPage RMP_filter">
            </telerik:RadMultiPage>
        </fieldset>
    </div>
</div>


<div class="demo-container gray-bg" id="decorationZoneRight" style="width: 52%; float: right;">
    <fieldset class="fieldSet_left_tab" id="rightTab" runat="server" style="padding: .71428571em 1.07142857em !important">
        <legend>Select your filter and parent level</legend>
        <div style="padding-left: 15px; min-height: 190px">
            <%--padding-top: 20px;--%>

            <div class="div_selected_filter_list">
                <telerik:RadListBox RenderMode="Lightweight" ID="RLB_Filter" ValidationGroup="VG_RLB_Filter" CssClass="RLB_Filter disabledDiv" SelectionMode="Multiple"
                    runat="server" Width="100%" Height="117px" Skin="Material" AllowDelete="true" AutoPostBackOnDelete="true" OnClientSelectedIndexChanging="RLBFilterItmCheckingClient" >
                    <HeaderTemplate>
                        <span class="span-lvl-one">Selected filters List</span>
                    </HeaderTemplate>
                    <ButtonSettings Position="Bottom" HorizontalAlign="Left" ShowDelete="true" RenderButtonText="true" AreaHeight="60px" />
                </telerik:RadListBox>

                <%-- <telerik:RadButton ID="RBAddSelectedItem" RenderMode="Lightweight" CssClass="rb_show_result rb_marginTop" Skin="Material" ValidationGroup="gRBAddSelectedItem"
                        runat="server" OnClick="RBAddSelectedItem_Click" Text="Save your selected list" AutoPostBack="true">
                        <Icon PrimaryIconUrl="~/img/icon/icon_save_selected_condition.png" />
                    </telerik:RadButton>--%>

                <asp:RequiredFieldValidator ControlToValidate="RLB_Filter" ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                    ValidationGroup="VG_RLB_Filter" CssClass="errMsg errMsgFilter" ErrorMessage="* Please select the filter">
                </asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="RLB_Filter" ID="RFV_SelectedFilter" runat="server" Display="Dynamic"
                    ValidationGroup="gRBAddSelectedItem" CssClass="errMsg errMsgFilter" ErrorMessage="* Select the items!">
                </asp:RequiredFieldValidator>
            </div>

            <div class="div_select_parent">
                <p>Select the parent level</p>
                <div class="rddl_holder">
                    <telerik:RadDropDownList DefaultMessage="Parent level" runat="server" ValidationGroup="gParent"
                        CssClass="rddl_parent_lvl disabledDiv" ID="RDDL_Parent" Width="100%" Skin="Material" RenderMode="Lightweight">
                    </telerik:RadDropDownList>
                    <asp:RequiredFieldValidator ControlToValidate="RDDL_Parent" ID="RequiredFieldValidator1"
                        ValidationGroup="gParent" CssClass="errMsg" ErrorMessage="* Please select the parent" runat="server" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </div>
                <telerik:RadButton runat="server" ValidationGroup="gParent" ID="btnShow" CssClass="float_right disabledDiv" Text="Add to chart"
                    Skin="Material" RenderMode="Lightweight" OnClick="btnShow_Click" />
                <%-- OnClientClicked="btnShow_ClientClick"--%>
            </div>

            <span style="width: 93%; height: 1px; display: table; padding-top: 15px;"></span>

            <div class="holder-selectedcondition-and-orgchart">

                <telerik:RadLabel ID="lbl_Status" runat="server" Text="" CssClass="lbl-status" />

                <!-- LOADING DOTS... -->
                <div id="div_loading" runat="server" class="spinner-box displyNon">
                    <div class="pulse-container">
                        <div class="pulse-bubble pulse-bubble-1"></div>
                        <div class="pulse-bubble pulse-bubble-2"></div>
                        <div class="pulse-bubble pulse-bubble-3"></div>
                    </div>
                </div>
                <%--<div id="div_loading" runat="server" class="lds-ellipsis displyNon"><div></div><div></div><div></div><div></div></div>--%>

                <asp:Panel runat="server" ID="pnlCountHolder"></asp:Panel>
                <p>Preview result filter</p>
                <div class="containerRLB_Condition">
                    <telerik:RadListBox RenderMode="Lightweight" ID="RLB_Condition" runat="server" Skin="Material" Width="100%" CheckBoxes="true"
                        AutoPostBackOnDelete="true" CausesValidation="false" CssClass="rlbCondition disabledDiv">
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
                                    <Icon PrimaryIconUrl="../../img/icon/icon_del-trash.gif" />
                                </telerik:RadButton>
                            </div>
                        </ItemTemplate>
                    </telerik:RadListBox>
                    <div style="margin-top: 1px; padding-top: 12px; border-top: 1px solid #ccc">

                        <telerik:RadButton ID="ShowResultCondition" RenderMode="Lightweight" CssClass="rb_show_result disabledDiv" Skin="Material" runat="server"
                            ToolTip="You should check at least one condition (color one)" Text="Show results" OnClick="ShowResultCondition_Click">

                            <Icon PrimaryIconUrl="~/img/icon/icon_show_result.png" />
                        </telerik:RadButton>
                    </div>

                </div>

                <telerik:RadAjaxPanel runat="server" ID="PanelOrgChart" CssClass="panelOrgChart disabledDiv" ViewStateMode="Disabled">
                    <ul class="orgchart" runat="server">
                        <li class="root" id="rootLi" runat="server">
                            <div class="nodecontent"><span class="spanState">S0</span>Sample<asp:Label runat="server" ID="lbl_Root" CssClass="lblCount" /></div>
                            <asp:HiddenField runat="server" ID="hdf_rootCount" Value="" />
                        </li>
                    </ul>

                </telerik:RadAjaxPanel>

            </div>

        </div>
    </fieldset>

</div>

<div id="div_Holder_hdns" runat="server">
</div>


<telerik:RadListBox ID="RLB_Sample_Condition" runat="server" CheckBoxes="false"
    ShowCheckAll="false" Width="0" Height="0" BorderColor="Transparent">
    <ItemTemplate>
        <table style="width: 100%;">
            <tr>
                <td style="width: 75%; text-align: left">
                    <asp:Label ID="lbl_Sel_condition_selectedCondition" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</telerik:RadListBox>

<telerik:RadButton runat="server" ID="btnFetchCount" Text="" Style="display: none;" OnClick="btnFetchCount_Click" />
<asp:Button runat="server" ID="btnFetchCountPerItem" Text="" Style="display: none;" OnClick="btnFetchCountPerItem_Click" />


<%--<asp:Button runat="server" ID="asyncBtnTest" Text="Click me!" OnClick="asyncBtnTestie_Click" />
<telerik:RadListBox runat="server" ID="rlbRes" Width="200" Height="300"></telerik:RadListBox>--%>

<%--<asp:Button  runat="server" ID="asyncBtnTestie" Text="Click me!" OnClick="asyncBtnTestie_Click" />
<asp:ListBox runat="server" ID="lbRes" Width="200" Height="300"></asp:ListBox>--%>


<%--<asp:TextBox runat="server" TextMode="MultiLine" ID="resultsTextBox"  Width="200" Height="300"></asp:TextBox>--%>


<asp:SqlDataSource ID="Ds_FilterSet" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_GAP_Filter_Set_Sel"
    SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        <asp:Parameter Name="AnalysisType" Type="string" DefaultValue="A" />

    </SelectParameters>
</asp:SqlDataSource>
<%--<asp:SqlDataSource ID="Ds_FilterRefBuild" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_GAP_Filter_RefBuild_Sel"
    SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="SampleID" SessionField="SampleID_Filter" Type="Int64" />
    </SelectParameters>
</asp:SqlDataSource>--%>


<%--<asp:SqlDataSource ID="DS_Resource_Table" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_GAP_Filter_Resource_Table_Sel"
    SelectCommandType="StoredProcedure">
    <SelectParameters>
       =----- <asp:SessionParameter Name="TblName" SessionField="ResTblName" Type="string" /> 
        <asp:ControlParameter ControlID="hdf_ResTblName" Name="TblName" PropertyName="Value" Type="string" />
    </SelectParameters>
</asp:SqlDataSource>--%>



<telerik:RadScriptBlock ID="radSript1" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {
           // document.getElementById("<%= div_loading.ClientID  %>").style.display = "none";
            //            $("#div_loading").hide();
        });

        function onTabSelecting(sender, args) {

            if (args.get_tab().get_pageViewID()) {
                args.get_tab().set_postBack(false);
                init();
            }
        }

        function OnClientLoadHandler(sender) {
            sender.get_inputDomElement().readOnly = "readonly";
        }

        function RDD_FilterSet_ClientSelectedIndexChanged(sender, eventArgs) {

            document.getElementById("<%= lbl_Status.ClientID  %>").innerText = " ";
            var listBox = $find('<%=RLB_Condition.ClientID %>');
            var items = listBox.get_items();
            items.clear();

            <%--var RLBFilter = $find('<%=RLB_Filter.ClientID %>');
            var filterItems = RLBFilter.get_items();
            var cnt = filterItems.get_count();
            if (cnt)
                console.log("truee!");
            else
                console.log("falsee!");--%>

            <%--if ($("#<%= RLB_Filter.ClientID  %>").val() === null) {
                console.log("ffff!");
                get_reqId_savedFilter();
            }--%>
        }


        function RLBFilterItmCheckingClient() {
            document.getElementById("<%= RDDL_Parent.ClientID %>").classList.remove("disabledDiv"); 
            document.getElementById("<%= btnShow.ClientID %>").classList.remove("disabledDiv");
        }

        function btnShow_ClientClick(selectedItem) {
            //var dropdownList = $find('<%=RDDL_Parent.ClientID %>');
            //var selectedItem = dropdownList.get_selectedItem().get_value();
            //var selectedItem = '<%= Session["SelectedItem_Parent"] %>';
            // console.log('selectedItem: ' + selectedItem);
            get_reqId(selectedItem);
        }

        function get_reqId_savedFilter(FilterId) {
             var SampleId = '<%= Session["SampleID_Filter"] %>';
            var FileId = '<%= Session["FileID_Filter"] %>';
            //var FilterId = '<%= Session["FilterID_Filter"] %>';
            var UserId = '<%= Session["WiNGSMasterId"] %>';
            var CenterId = '<%= Session["Current_CenterID"] %>';
            var RefBuild = '<%= Session["RefBuild"] %>';
            var HostId = '<%= Session["HostID"] %>';

            //var rddFilterSet = $find("<%= RDD_FilterSet.ClientID %>");
            //var FilterId = rddFilterSet.get_selectedItem().get_value();
           // var element = document.getElementById("<%= div_loading.ClientID  %>");
            //element.classList.remove("displyNon");
            var list = [SampleId, FileId, FilterId, UserId, CenterId, RefBuild, HostId];
            var jsonText = JSON.stringify({ list: list });

            jQuery.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                data: jsonText,
                async: true,
                dataType: 'JSON',
                url: '/GAP/Service/se_SampleQuery.asmx/GetReqId_SavedFilter',
                success: function (result) {
                    res = JSON.parse(result.d);

                    var reqId = Number(res["0"].reqid);
                    //console.log('reqID: '+reqId);
                    get_resultAsync_savedFilter(reqId, FilterId);
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

        function get_resultAsync_savedFilter(reqId, FilterId) {

            var UserId = '<%= Session["WiNGSMasterId"] %>';
            var CenterId = '<%= Session["Current_CenterID"] %>';
            var HostId = '<%= Session["HostID"] %>';

            // console.log('UserId:' + UserId + ' CenterId:' + CenterId + ' HostId:' + HostId + ' FilterId:' + FilterId + ' ReqId:' + reqId );

            var list = [FilterId, UserId, CenterId, HostId, reqId];
            var jsonText = JSON.stringify({ list: list });

            jQuery.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                data: jsonText,
                async: true,
                dataType: 'JSON',
                url: '/GAP/Service/se_SampleQuery.asmx/GetResult_SavedFilter',
                beforeSend: function () {
                   // var element = document.getElementById("<%= div_loading.ClientID  %>");
                   // element.classList.remove("displyNon");
                    document.getElementById("<%= lbl_Status.ClientID  %>").innerText = "Calculation in progress!";
                },
                success: function (result) {
                    document.getElementById("<%= btnFetchCount.ClientID  %>").click();
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
                    document.getElementById("<%= lbl_Status.ClientID  %>").innerText = "Almost done!";
                   // var element = document.getElementById("<%= div_loading.ClientID  %>");
                   // element.classList.add("displyNon");
                }

            });

        }

        function get_reqId(selectedItem) {

            var SampleId = '<%= Session["SampleID_Filter"] %>';
            var FileId = '<%= Session["FileID_Filter"] %>';
            var UserId = '<%= Session["WiNGSMasterId"] %>';
            var CenterId = '<%= Session["Current_CenterID"] %>';
            var RefBuild = '<%= Session["RefBuild"] %>';
            var HostId = '<%= Session["HostID"] %>';
            var SelectedLevel = selectedItem;
            //var FilterId = '<%= Session["FilterID_Filter"] %>';
            var rddFilterSet = $find("<%= RDD_FilterSet.ClientID %>");
            var FilterId = rddFilterSet.get_selectedItem().get_value();

            // console.log('UserId:' + UserId + ' CenterId:' + CenterId + ' HostId:' + HostId + ' FilterId:' + FilterId + ' SelectedLevel:' + SelectedLevel);

            var list = [SampleId, FileId, FilterId, UserId, CenterId, RefBuild, HostId, SelectedLevel];
            var jsonText = JSON.stringify({ list: list });

            jQuery.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                data: jsonText,
                async: true,
                dataType: 'JSON',
                url: '/GAP/Service/se_SampleQuery.asmx/GetReqId',
                success: function (result) {
                    res = JSON.parse(result.d);

                    var reqId = Number(res["0"].reqid);
                   /* console.log('reqID: ' + reqId);*/
                    get_resultAsync(reqId, FilterId);
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

        function get_resultAsync(reqId, FilterId) {
            //document.getElementById("<%= div_loading.ClientID  %>").style.display = "block";
            var element = document.getElementById("<%= div_loading.ClientID  %>");
            element.classList.remove("displyNon");

            var UserId = '<%= Session["WiNGSMasterId"] %>';
            var CenterId = '<%= Session["Current_CenterID"] %>';
            var HostId = '<%= Session["HostID"] %>';

            //console.log('UserId:' + UserId + ' CenterId:' + CenterId + ' HostId:' + HostId + ' FilterId:' + FilterId + ' ReqId:' + reqId);

            var list = [FilterId, UserId, CenterId, HostId, reqId];
            var jsonText = JSON.stringify({ list: list });

            jQuery.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                data: jsonText,
                async: true,
                dataType: 'JSON',
                url: '/GAP/Service/se_SampleQuery.asmx/GetResult',
                beforeSend: function () {
                    var element = document.getElementById("<%= div_loading.ClientID  %>");
                    element.classList.remove("displyNon");
                    document.getElementById("<%= lbl_Status.ClientID  %>").innerText = "Calculation in progress!";
                },
                success: function (result) {
                    document.getElementById("<%= btnFetchCountPerItem.ClientID  %>").click();
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
                    document.getElementById("<%= lbl_Status.ClientID  %>").innerText = "Almost done!";
                    var element = document.getElementById("<%= div_loading.ClientID  %>");
                    element.classList.add("displyNon");
                }

            });

        }

    </script>

</telerik:RadScriptBlock>

















<%--<div class="wrapper">
    <div class="row">
        <div class="col" style="background: #eee; width: 52%">
            <div class="row" style="border-bottom: 1px solid #14afca; padding: 20px 15px">
                <div class="w-95">
                    <h4>
                        <img src="../../img/icon/icon-level-one.png" style="margin-right: 5px" />
                        Filter Category</h4>
                    <p>
                        <telerik:RadTabStrip RenderMode="Lightweight" ID="RadTabStrip" runat="server" Width="100%" ScrollChildren="True"
                            SelectedIndex="3" Skin="Silk">
                            <Tabs>
                                <telerik:RadTab Text="Genotyping metrics">
                                </telerik:RadTab>
                                <telerik:RadTab Text="Population Frequencies">
                                </telerik:RadTab>
                                <telerik:RadTab Text="Individual Pathogenicity">
                                </telerik:RadTab>
                                <telerik:RadTab Text="Effect" Selected="True">
                                </telerik:RadTab>
                                <telerik:RadTab Text="Gene sets and Phenotypes">
                                </telerik:RadTab>
                                <telerik:RadTab Text="All ClinVar data">
                                </telerik:RadTab>
                                <telerik:RadTab Text="All ACMG data">
                                </telerik:RadTab>
                            </Tabs>
                        </telerik:RadTabStrip>
                    </p>

                    <telerik:RadMultiPage runat="server" ID="RadMultiPage_DataHolder" SelectedIndex="3" CssClass="innerMultiPage">
                        <telerik:RadPageView runat="server" ID="RadPageView1">
                            <p>Genotyping metrics ...</p>
                        </telerik:RadPageView>
                        <telerik:RadPageView runat="server" ID="RadPageView2">
                            <p>Population Frequencies ...</p>
                        </telerik:RadPageView>
                        <telerik:RadPageView runat="server" ID="RadPageView3">
                            <p>Individual Pathogenicity ...</p>
                        </telerik:RadPageView>
                        <telerik:RadPageView runat="server" ID="RadPageView4">
                            <h5>Effect</h5>

                            <telerik:RadComboBox RenderMode="Classic" ID="RCB_Effect" runat="server" Height="190px" Width="100%" Font-Size="13px"
                                DropDownCssClass="multipleRowsColumns" DropDownWidth="400px" DataSourceID="SDS_Filter_Tab_Effect" CheckBoxes="true"
                                DataTextField="Description" DataValueField="Field" EmptyMessage="Select the criteria..." />

                            <label class="custom-control-label" style="padding: 5px">
                                Variant effect on transcript based on MISO 
                            </label>

                        </telerik:RadPageView>
                        <telerik:RadPageView runat="server" ID="RadPageView5">
                            <p>Gene sets and Phenotypes ...</p>
                        </telerik:RadPageView>
                        <telerik:RadPageView runat="server" ID="RadPageView6">
                            <p>All ClinVar data ...</p>
                        </telerik:RadPageView>
                        <telerik:RadPageView runat="server" ID="RadPageView7">
                            <p>All ACMG data ...</p>
                        </telerik:RadPageView>
                    </telerik:RadMultiPage>
                </div>
            </div>
            <div class="row" style="border-bottom: 1px solid #14afca; padding: 20px 15px">
                <h5>
                    <img src="../../img/icon/icon-level-two.png" style="margin-right: 5px" />
                    Select the parent level</h5>

                <telerik:RadDropDownList DefaultMessage="Parent level" runat="server" ValidationGroup="gParent" CssClass="rddl_parent_lvl" ID="RDDL_Parent" Width="100%" Skin="Material" RenderMode="Lightweight">
                </telerik:RadDropDownList>
                <asp:RequiredFieldValidator ControlToValidate="RDDL_Parent" ID="RequiredFieldValidator1"
                    ValidationGroup="gParent" CssClass="errMsg" ErrorMessage="* Please select the parent" runat="server" Display="Dynamic">
                </asp:RequiredFieldValidator>

                <br />
                <br />
                <telerik:RadButton ID="RBAddSelectedItem" RenderMode="Lightweight" CssClass="rb_show_result rb_marginTop" Skin="Material" ValidationGroup="gRBAddSelectedItem"
                    runat="server" Text="Add to selected items" AutoPostBack="true">
                    <Icon PrimaryIconUrl="~/img/icon/icon_save_selected_condition.png" />
                </telerik:RadButton>

            </div>
            <div class="row" style="border-bottom: 1px solid #14afca; padding: 20px 15px">
                <h5>
                    <img src="../../img/icon/icon-level-three.png" style="margin-right: 5px" />
                    Selected Items</h5>

                <telerik:RadListBox RenderMode="Lightweight" ID="RLB_Filter" ValidationGroup="VG_RLB_Filter" CssClass="RLB_Filter" SelectionMode="Multiple"
                    runat="server" Width="100%" Height="117px" Skin="Material" AllowDelete="true" AutoPostBackOnDelete="true">
                </telerik:RadListBox>
            </div>

        </div>
        <div class="col" style="background: #e9e9e9; width: 45%; padding: 20px 15px">
            <h5>Preview result filter</h5>
        </div>
    </div>
</div>


<asp:SqlDataSource ID="SDS_Filter_Tab_Effect" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="SELECT * FROM Tbl_GAP_Filter_Tab Where Active = 1 AND Model = 'Effect'"></asp:SqlDataSource>--%>
