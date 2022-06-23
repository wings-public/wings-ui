<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Analysis_AssignSample.ascx.cs" Inherits="WebGAP.GAP.Trio.Popup.uc_Analysis_AssignSample" %>




<style>
    .RadGrid_Bootstrap .rgRow > td, .RadGrid_Bootstrap .rgAltRow > td {
        border-width: 0 0 1px 0 !important;
        padding: 0 0 0 0;
        height: auto;
    }

    .RadGrid_Bootstrap .rgHeader, .RadGrid_Bootstrap .rgHeader a {
        font-weight: 600;
    }

    .RadGrid_Bootstrap .rgHeader, .RadGrid_Bootstrap th.rgResizeCol, .RadGrid_Bootstrap .rgHeaderWrapper, .RadGrid_Bootstrap .rgMultiHeaderRow th.rgHeader, .RadGrid_Bootstrap .rgMultiHeaderRow th.rgResizeCol {
        border: 0;
        border-bottom: 1px solid #740aa1 !important;
        border-top: 0;
        border-left: 0 !important;
    }

    .RadGrid .rgClipCells .rgHeader, .RadGrid .rgClipCells .rgFilterRow > td, .RadGrid .rgClipCells .rgRow > td, .RadGrid .rgClipCells .rgAltRow > td, .RadGrid .rgClipCells .rgEditRow > td, .RadGrid .rgClipCells .rgFooter > td {
        overflow: hidden;
    }
</style>
<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_Sample">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_Sample" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>

<div class="content-body pt-1">
    <div class="card-content collapse show">
        <div class="card-bodypopup">
            <form class="form">
                <div class="form-body">
                    <h4 class="form-sectionpopup"><i class="ft-user"></i>Assign Sample To Analysis</h4>
                    <script type="text/javascript" id="telerikClientEvents1">
                        function RG_Sample_OnColumnMouseOut(sender, args) {
                        }
                    </script>
                    <asp:HiddenField ID="hdn_searchSampleID" runat="server" />
                    <telerik:RadGrid RenderMode="Lightweight" ID="RG_Sample" runat="server" GridLines="Both" OnItemCommand="RG_Sample_ItemCommand" OnItemDataBound="RG_Sample_ItemDataBound"
                        AllowSorting="True" AutoGenerateColumns="False" CellSpacing="-1" Height="350px" DataKeyNames="SampleID" AllowAutomaticUpdates="true"
                        ShowStatusBar="True" Font-Size="X-Small" DataSourceID="DS_Sample">
                        <MasterTableView CommandItemDisplay="Top" DataSourceID="DS_Sample" Name="Master" AutoGenerateColumns="false" ClientDataKeyNames="SampleID" DataKeyNames="SampleID">
                            <CommandItemTemplate>
                                <div>
                                      <telerik:RadButton RenderMode="Lightweight" runat="server" Text="Clear Filter" ID="RTB_DeleteSearch" OnClientClicked="RB_DeleteSearch_Clicked" Height="33px" Font-Size="Smaller">
                                        <Icon PrimaryIconUrl="~/img/icon/icon_search_Filter.png" PrimaryHoveredIconUrl="~/img/icon/icon_search_Filter_Hovered.png" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                                    </telerik:RadButton>
                                    <telerik:RadComboBox RenderMode="Lightweight" ID="RCB_searchSample" runat="server" AutoPostBack="True" DataSourceID="DS_searchSample"
                                        ChangeTextOnKeyBoardNavigation="true" OnClientSelectedIndexChanged="RCB_searchSampleIndexChange" OnClientDropDownOpening="RCB_searchSampleOpening"
                                        Width="350px" Height="150px" EmptyMessage="Filter by ID and Local ID" CssClass="pl-0" Filter="Contains" DataTextField="Sample_Info" DataValueField="SampleID">
                                    </telerik:RadComboBox>
                                </div>
                            </CommandItemTemplate>
                      
                            <Columns>
                                <telerik:GridBoundColumn DataField="SampleID" DataType="System.Int64" FilterControlAltText="Filter SampleID column" HeaderText="SampleID" ReadOnly="True" SortExpression="SampleID" UniqueName="SampleID">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="LocalID" FilterControlAltText="Filter LocalID column" HeaderText="Local ID" ReadOnly="True" SortExpression="LocalID" UniqueName="LocalID">
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn UniqueName="AddSample" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                    <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" Height="15px"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="AddSample" BorderWidth="0px" ImageUrl="~/img/icon/icon_AddPeople.png" Width="25px" Height="25px"
                                            ToolTip="Assign sample"
                                            runat="server"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                      
                            <PagerStyle AlwaysVisible="True"></PagerStyle>
                        </MasterTableView>
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                          <ClientSettings EnableRowHoverStyle="true" EnablePostBackOnRowClick="true">
                            <ClientEvents OnColumnMouseOut="RG_Sample_OnColumnMouseOut"></ClientEvents>
                            <Selecting AllowRowSelect="true" />
                            <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                        </ClientSettings>
                        <FilterMenu RenderMode="Lightweight"></FilterMenu>
                        <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                    </telerik:RadGrid>
                </div>
                <div class="form-actionspopup center" style="height: 20%">
                    <asp:Button ID="btn_cacel" Text="Cancel" runat="server" OnClientClick="CloseWindow(); return false;"
                        class="btn btn-danger mr-1 ladda-button btn-sm"></asp:Button>
                </div>
            </form>
        </div>
    </div>
</div>


<asp:SqlDataSource ID="DS_Sample" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_GAP_Trio_AssignSample_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
            <asp:SessionParameter SessionField="CenterID_Trio_AssigneSample" Name="CenterID" Type="Int32" />
        <asp:SessionParameter SessionField="PIID_Trio_AssigneSample" Name="PIID" Type="Int32" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterID" Type="Int32" />
        <asp:ControlParameter ControlID="hdn_searchSampleID" Name="SampleID" PropertyName="Value" Type="Int64" DefaultValue="-1"/>
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="DS_searchSample" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_GAP_Trio_AssignSample_Search" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter SessionField="CenterID_Trio_AssigneSample" Name="CenterID" Type="Int32" />
        <asp:SessionParameter SessionField="PIID_Trio_AssigneSample" Name="PIID" Type="Int32" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>


<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <script type="text/javascript">
        
        function RCB_searchSampleIndexChange(sender, eventArgs) {
            var grid = $find("<%= RG_Sample.ClientID %>");
            var radcomboBox = $telerik.findControl(grid.get_element(), "RCB_searchSample");

            document.getElementById("<%= hdn_searchSampleID.ClientID %>").value = radcomboBox.get_value();
        }

        function RCB_searchSampleOpening() {
            var grid = $find("<%= RG_Sample.ClientID %>");
            var Com = $telerik.findControl(grid.get_element(), "RCB_searchSample");
            Com.set_emptyMessage("");
            Com.clearSelection();

        }

        function RB_DeleteSearch_Clicked() {
            var grid = $find("<%= RG_Sample.ClientID %>");
            master = grid.get_masterTableView();
            var Com = $telerik.findControl(grid.get_element(), "RCB_searchSample");
            Com.clearSelection();
            document.getElementById("<%= hdn_searchSampleID.ClientID %>").value = -1;
            master.rebind();
        }

      

        function returnToParent(SampleID) {
            var oWnd = GetRadWindow();
            oWnd.close(SampleID);
        }

        function GetRadWindow() {
            var oWindow = null;
            if (window.radWindow) oWindow = window.radWindow;
            else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
            return oWindow;
        }

        function CloseWindow() {
            var oWindow = GetRadWindow();  //Obtaining a reference to the current window 
            oWindow.Close(0);
        }
    </script>
</telerik:RadScriptBlock>

