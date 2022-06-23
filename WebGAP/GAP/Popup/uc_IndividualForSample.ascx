<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_IndividualForSample.ascx.cs" Inherits="WebGAP.GAP.Popup.uc_IndividualForSample" %>
<link href=".././assets/css/IndvForSample_style.css" rel="stylesheet" type="text/css" media="screen" runat="server" />

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_Individuals">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_Individuals" LoadingPanelID="RadAjaxLoadingPanel1" />
                 <telerik:AjaxUpdatedControl ControlID="RL_feedback" LoadingPanelID="RadAjaxLoadingPanel1" />

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
                    <h4 class="form-sectionpopup"><i class="ft-user"></i>Assign Individual To Sample</h4>
                    <script type="text/javascript" id="telerikClientEvents1">
                        function RG_Individual_OnColumnMouseOut(sender, args) {
                        }
                    </script>
                    <asp:HiddenField ID="hdn_searchIndividualID" runat="server" />
                     <telerik:RadLabel runat="server" ID="RL_feedback" ForeColor="Red"></telerik:RadLabel>
                    <telerik:RadGrid RenderMode="Lightweight" ID="RG_Individuals" runat="server" GridLines="Both" 
                        AllowSorting="True" AutoGenerateColumns="False" CellSpacing="-1" Height="350px" OnItemCommand="RG_Individuals_ItemCommand"
                        ShowStatusBar="True" DataKeyNames="IndividualID" Font-Size="X-Small" OnItemDataBound="RG_Individuals_ItemDataBound"
                        DataSourceID="DS_Individuals">
                        <MasterTableView CommandItemDisplay="Top" DataSourceID="DS_Individuals" Name="Master" AutoGenerateColumns="false" ClientDataKeyNames="IndividualID">
                            <CommandItemTemplate>
                                <div>
                                    <telerik:RadButton RenderMode="Lightweight" runat="server" Text="Clear Filter" ID="RTB_DeleteSearch" OnClientClicked="RB_DeleteSearch_Clicked" Height="33px" Font-Size="Smaller">
                                        <Icon PrimaryIconUrl="~/img/icon/icon_search_Filter.png" PrimaryHoveredIconUrl="~/img/icon/icon_search_Filter_Hovered.png" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                                    </telerik:RadButton>
                                    <telerik:RadComboBox RenderMode="Lightweight" ID="RCB_searchIndividual" runat="server" AutoPostBack="True" DataSourceID="DS_searchIndividual"
                                        OnClientDropDownOpened="RCB_searchIndividualOpening" ChangeTextOnKeyBoardNavigation="true" OnClientSelectedIndexChanged="RCB_searchIndividualIndexChange"
                                        Width="350px" Height="150px" EmptyMessage="Filter by ID and Local ID" CssClass="pl-0" Filter="Contains" DataTextField="Individual_Info" DataValueField="IndividualID">
                                    </telerik:RadComboBox>
                                </div>
                            </CommandItemTemplate>
                            <Columns>
                                <telerik:GridBoundColumn DataField="IndividualID" DataType="System.Int64" FilterControlAltText="Filter IndividualID column" HeaderText="IndividualID" SortExpression="IndividualID" UniqueName="IndividualID">
                                    <HeaderStyle Width="50%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="50%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="LocalID" FilterControlAltText="Filter LocalID column" HeaderText="Local ID" ReadOnly="True" SortExpression="LocalID" UniqueName="LocalID">
                                    <HeaderStyle Width="40%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="40%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn UniqueName="AddIndividual" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                    <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" Height="15px"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="AddIndividual" BorderWidth="0px" ImageUrl="~/img/icon/icon_AddPeople.png" Width="25px" Height="25px"
                                            ToolTip="Assign Individual"
                                            runat="server"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                  <telerik:GridTemplateColumn>
                                    <ItemTemplate>
                                       <asp:HiddenField runat="server" ID="hdn_MultiIndividual" Value='<%# Eval("MultiIndividual") %>' />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                
                            </Columns>
                            <PagerStyle AlwaysVisible="True"></PagerStyle>
                        </MasterTableView>
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                         <ClientSettings EnableRowHoverStyle="true" EnablePostBackOnRowClick="true">
                            <ClientEvents OnColumnMouseOut="RG_Individual_OnColumnMouseOut"></ClientEvents>
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


<asp:SqlDataSource ID="DS_Individuals" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_IndividualForSample_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters> 
        <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
        <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterID" Type="Int32" />
        <asp:ControlParameter ControlID="hdn_searchIndividualID" Name="IndividualID" Type="Int64" DefaultValue="-1" />
        <asp:SessionParameter Name="HostID" SessionField="HostID" Type="Int32" />
        <asp:SessionParameter Name="SampleLocalID" SessionField="SampleLocalID" Type="string" />
          <asp:SessionParameter Name="SampleID" SessionField="SampleID_popup_Individual" Type="string" DefaultValue="-1" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="DS_searchIndividual" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_IndividualForSample_search_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
        <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        <asp:SessionParameter Name="HostID" SessionField="HostID" Type="Int32" />
          <asp:SessionParameter Name="SampleLocalID" SessionField="SampleLocalID" Type="string" />
        <asp:SessionParameter Name="SampleID" SessionField="SampleID_popup_Individual" Type="string" DefaultValue="-1" />
    </SelectParameters>
</asp:SqlDataSource>

<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <script type="text/javascript">

        function RCB_searchIndividualIndexChange(sender, eventArgs) {
            var grid = $find("<%= RG_Individuals.ClientID %>");
                var radcomboBox = $telerik.findControl(grid.get_element(), "RCB_searchIndividual");

                document.getElementById("<%= hdn_searchIndividualID.ClientID %>").value = radcomboBox.get_value();
        }

        function RCB_searchIndividualOpening() {
            var grid = $find("<%= RG_Individuals.ClientID %>");
            var Com = $telerik.findControl(grid.get_element(), "RCB_searchIndividual");
            Com.set_emptyMessage("");
            Com.clearSelection();

        }

        function RB_DeleteSearch_Clicked() {
            var grid = $find("<%= RG_Individuals.ClientID %>");
                        master = grid.get_masterTableView();
                        var Com = $telerik.findControl(grid.get_element(), "RCB_searchIndividual");
                        Com.clearSelection();
                        document.getElementById("<%= hdn_searchIndividualID.ClientID %>").value = -1;
            master.rebind();
        }

        function returnToParent(IndividualID) {
            var oWnd = GetRadWindow();
            oWnd.close(IndividualID);
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
