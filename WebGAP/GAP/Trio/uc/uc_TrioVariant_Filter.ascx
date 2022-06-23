<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_TrioVariant_Filter.ascx.cs" Inherits="WebGAP.GAP.Trio.uc.uc_TrioVariant_Filter"  %>


<link href="../../assets/css/sampleQuery_style.css" rel="stylesheet" type="text/css" media="screen" runat="server" />
<link href="../../assets/css/Filter_Custom.css" rel="stylesheet" type="text/css" runat="server" />
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
                 <telerik:AjaxUpdatedControl ControlID="basedonIndividual" />
                
            </UpdatedControls>
        </telerik:AjaxSetting>


        <telerik:AjaxSetting AjaxControlID="RTS_FilterTab">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RTS_FilterTab"></telerik:AjaxUpdatedControl>
                <telerik:AjaxUpdatedControl ControlID="RMP_FItems" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RCB_Individuals">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RCB_Individuals"></telerik:AjaxUpdatedControl>
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
                <telerik:AjaxUpdatedControl ControlID="RCB_Individuals"/>
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
                <telerik:AjaxUpdatedControl ControlID="RCB_Individuals"/>
                <telerik:AjaxUpdatedControl ControlID="basedonIndividual"/>
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

            <td>
                  <asp:Label runat="server" ID="basedonIndividual" ></asp:Label>
            </td>
        

                <td  style="text-align: left; padding-left: 30px; float:right" Class="lblTrio">
                <asp:Label runat="server" ID="lbl_sampleID" Text=""  ForeColor="#333333" Font-Size="Medium"></asp:Label>
                    <img runat="server" id="img_Proband" width="25" visible="false">
                    <asp:Label runat="server" ID="lbl_Proband" ForeColor="#5d5f60" Font-Size="Medium" CssClass="pr-1"></asp:Label>

                    <img id="img_C1" runat="server" width="25" visible="false">
                    <asp:Label runat="server" ID="lbl_C1" ForeColor="#5d5f60" Font-Size="Medium" CssClass="pr-1"></asp:Label>

                    <img id="img_C2" runat="server" width="25" visible="false">
                    <asp:Label runat="server" ID="lbl_C2" ForeColor="#5d5f60" Font-Size="Medium" CssClass="pr-1"></asp:Label>
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
<asp:Label runat="server" ID="lbl_BasedOnIndividual"></asp:Label>
<div class="demo-container gray-bg" id="decorationZone" style="width: 45%; float: left">

    <fieldset>
        <legend>Your Filter Sets</legend>
        <table style="width: 100%" cellpadding="0" cellspacing="0">
            <tr>

                <td>
                    <telerik:RadComboBox CssClass="btn-sm rddl_filter" ID="RDD_FilterSet" runat="server" Height="200px" Width="100%" AutoPostBack="true" AllowCustomText="false"
                        EmptyMessage="Select your filter set" HighlightTemplatedItems="true" DropDownCssClass="RDD_FilterSet" Filter="None" OnClientLoad="OnClientLoadHandler" OnPreRender="RDD_FilterSet_PreRender" 
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
                                                <asp:HiddenField runat="server" ID="hdn_basedonIndividual" Value=' <%# DataBinder.Eval(Container.DataItem, "BasedOnIndividual")%>' />

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
                                                 <td style="padding: 10px 15px 10px 15px;">Individual: 
                                                </td>
                                                <td style="padding: 0px 0px 0px 0px;">
                                                    <telerik:RadComboBox ID="RCB_Individuals" runat="server" Width="100%" AutoPostBack="true" AllowCustomText="false"
                                                        EmptyMessage="Analysis based on Individual" HighlightTemplatedItems="true" Filter="None"
                                                        DataValueField="IndividualID" DataTextField="Individual" DataSourceID="DS_Individuals"  OnPreRender="RCB_Individuals_PreRender">
                                                        <HeaderTemplate>
                                                            <table style="width: 100%; text-align: left; background-color: #F0F8FF; font-size: 10px; ">
                                                                <tr>

                                                                    <td style="width: 30%; padding: 10px 5px 10px 10px; font-size: small;">Individual
                                                                    </td>

                                                                    <td style="width: 65%; padding: 10px 5px 10px 10px; font-size: small;"> ID
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
                                                                                    <%# DataBinder.Eval(Container.DataItem, "Individual")%> 
                                                                                </td>

                                                                                <td style="width: 65%; padding: 5px 5px 5px 10px">
                                                                                    <%# DataBinder.Eval(Container.DataItem, "IndividualID")%>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>

                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                    </telerik:RadComboBox>
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
                    runat="server" Width="100%" Height="117px" Skin="Material" AllowDelete="true" AutoPostBackOnDelete="true"   OnClientSelectedIndexChanging="RLBFilterItmCheckingClient" >
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
                                    <Icon PrimaryIconUrl="../../../img/icon/icon_del-trash.gif" />
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
        <asp:Parameter Name="AnalysisType" Type="String" DefaultValue="B" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="DS_Individuals" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_GAP_Trio_IndividualsInfo_Sel"
    SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="TriolocalID" SessionField="TriolocalID" Type="String" />
        <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
        <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
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

        function RLBFilterItmCheckingClient() {
            document.getElementById("<%= RDDL_Parent.ClientID %>").classList.remove("disabledDiv"); 
            document.getElementById("<%= btnShow.ClientID %>").classList.remove("disabledDiv");
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

        function btnShow_ClientClick(selectedItem) {
            //var dropdownList = $find('<%=RDDL_Parent.ClientID %>');
            //var selectedItem = dropdownList.get_selectedItem().get_value();
            //var selectedItem = '<%= Session["SelectedItem_Parent"] %>';
            // console.log('selectedItem: ' + selectedItem);
            get_reqId(selectedItem);
        }

        function get_reqId_savedFilter(FilterId, basedonIndividual) {

            var TrioLocalID = '<%= Session["TriolocalID_Filter"] %>';
            var TrioCode = '<%= Session["InWhichOneExists"] %>';
            //var FilterId = '<%= Session["FilterID_Filter"] %>';
            var UserId = '<%= Session["WiNGSMasterId"] %>';
            var CenterId = '<%= Session["Current_CenterID"] %>';
            var RefBuild = '<%= Session["Trio_Refbuild_ID"] %>';

            
         
            var IndividulID = basedonIndividual;


         
            var list = [TrioLocalID, TrioCode, FilterId, UserId, CenterId, RefBuild, IndividulID];
            var jsonText = JSON.stringify({ list: list });


            //console.log('TrioLocalID:' + TrioLocalID + ' TrioCode:' + TrioCode + ' RefBuild:' + RefBuild + ' IndividulID:' + IndividulID);


            jQuery.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                data: jsonText,
                async: true,
                dataType: 'JSON',
                url: '/GAP/Service/se_TrioQuery.asmx/GetReqId_SavedFilter',
                success: function (result) {
                    res = JSON.parse(result.d);
               /*     console.log('res' + res);*/
                    var reqId = Number(res["0"].req_id);
                   /* console.log('reqID: ' + reqId);*/
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
            console.log('heello');

            var UserId = '<%= Session["WiNGSMasterId"] %>';
            var CenterId = '<%= Session["Current_CenterID"] %>';
            var TrioLocalID = '<%= Session["TriolocalID_Filter"] %>';

            // console.log('UserId:' + UserId + ' CenterId:' + CenterId + ' HostId:' + HostId + ' FilterId:' + FilterId + ' ReqId:' + reqId );

            var list = [FilterId, UserId, CenterId, TrioLocalID, reqId];
            var jsonText = JSON.stringify({ list: list });

          /*  console.log('TrioLocalID:' + TrioLocalID + ' FilterId:' + FilterId + ' UserId:' + UserId);*/

            jQuery.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                data: jsonText,
                async: true,
                dataType: 'JSON',
                url: '/GAP/Service/se_TrioQuery.asmx/GetResult_SavedFilter',
                beforeSend: function () {
                    var element = document.getElementById("<%= div_loading.ClientID  %>");
                    element.classList.remove("displyNon");
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
                    var element = document.getElementById("<%= div_loading.ClientID  %>");
                    element.classList.add("displyNon");
                }

            });

        }

        function get_reqId(selectedItem, basedonIndividual) {

            var TrioLocalID = '<%= Session["TriolocalID_Filter"] %>';
            var TrioCode = '<%= Session["InWhichOneExists"] %>';
            var UserId = '<%= Session["WiNGSMasterId"] %>';
            var CenterId = '<%= Session["Current_CenterID"] %>';
            var RefBuild = '<%= Session["Trio_Refbuild_ID"] %>';
            var SelectedLevel = selectedItem;
            //var FilterId = '<%= Session["FilterID_Filter"] %>';
            var rddFilterSet = $find("<%= RDD_FilterSet.ClientID %>");
            var FilterId = rddFilterSet.get_selectedItem().get_value();


            var IndividulID = basedonIndividual;

            //console.log('UserId:' + UserId + ' TrioCode:' + TrioCode + ' FilterId:' + FilterId + ' SelectedLevel:' + SelectedLevel + ' IndividulID:' + IndividulID);

            var list = [TrioLocalID, TrioCode, FilterId, UserId, CenterId, RefBuild, SelectedLevel, IndividulID];
            var jsonText = JSON.stringify({ list: list });

            jQuery.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                data: jsonText,
                async: true,
                dataType: 'JSON',
                url: '/GAP/Service/se_TrioQuery.asmx/GetReqId',
                success: function (result) {
                    res = JSON.parse(result.d);
                   /* console.log('reqIaaaD: ' + res);*/
                    var reqId = Number(res["0"].reqid);
                 /*   console.log('reqID: ' + reqId);*/
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
            var TrioLocalID = '<%= Session["TriolocalID_Filter"] %>';


            var list = [FilterId, UserId, CenterId, TrioLocalID, reqId];
            var jsonText = JSON.stringify({ list: list });

            jQuery.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                data: jsonText,
                async: true,
                dataType: 'JSON',
                url: '/GAP/Service/se_TrioQuery.asmx/GetResult',
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





