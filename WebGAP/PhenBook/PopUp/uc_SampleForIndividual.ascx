<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_SampleForIndividual.ascx.cs" Inherits="WebGAP.PhenBook.PopUp.uc_SampleForIndividual" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<link href=".././assets/css/SampleForIndv_style.css" rel="stylesheet" type="text/css" media="screen" runat="server" />

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_Samples">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_Samples" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_SampleAssigned" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RL_feedback" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_SampleAssigned">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_SampleAssigned" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_Samples" LoadingPanelID="RadAjaxLoadingPanel1" />
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

                    <script type="text/javascript" id="telerikClientEvents1">
                        function RG_Samples_OnColumnMouseOut(sender, args) {
                        }
                    </script>
                    <asp:HiddenField ID="hdn_searchSampleID" runat="server" />
                    <table>
                        <tr>
                            <td style="width: 30%">
                                <h4 class="form-sectionpopup"><i class="ft-user"></i>Samples are already assigned</h4>
                                <telerik:RadGrid RenderMode="Lightweight" ID="RG_SampleAssigned" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="-1" OnItemCommand="RG_SampleAssigned_ItemCommand"
                                    ShowStatusBar="True" DataKeyNames="SampleID" Font-Size="X-Small" DataSourceID="DS_assigned" CssClass="Grid_No_Border_Padding RG_NO_Shadow" >
                                    <MasterTableView DataSourceID="DS_assigned" Name="Master" AutoGenerateColumns="false" DataKeyNames="SampleID" ClientDataKeyNames="SampleID">

                                        <Columns>
                                            <telerik:GridBoundColumn FilterControlWidth="120px" DataField="SampleID" HeaderText="Sample ID" DataType="System.String"
                                                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false">
                                                <HeaderStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="LocalID" HeaderText="Local ID" DataField="LocalID" SortExpression="LocalID" DataType="System.String" ShowFilterIcon="false">
                                                <HeaderStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="SeqTypeName" FilterControlAltText="Filter SeqTypeName column" HeaderText="Seq. Type"
                                                DataType="System.String" SortExpression="SeqTypeName" UniqueName="SeqTypeName">
                                                <HeaderStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn UniqueName="deleteSample" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" Height="15px"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="UnassignSample" BorderWidth="0px" ImageUrl="../../img/icon/icon_del-trash.gif" Width="16px" Height="16px" CommandName="UnassignSample"
                                                        ToolTip="Unassign sample from Individual"
                                                        runat="server"></asp:ImageButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                          
                                        </Columns>
                                    </MasterTableView>
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                    <ClientSettings EnableRowHoverStyle="true" EnablePostBackOnRowClick="true">
                                        <ClientEvents OnColumnMouseOut="RG_Samples_OnColumnMouseOut"></ClientEvents>
                                        <Selecting AllowRowSelect="true" />
                                        <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                                    </ClientSettings>
                                    <FilterMenu RenderMode="Lightweight"></FilterMenu>
                                    <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                                </telerik:RadGrid>

                            </td>
                            <td style="width: 2%"></td>
                            <td style="width: 65%">
                                <h4 class="form-sectionpopup"><i class="ft-user"></i>Select sample to assign to individual</h4>
                                <telerik:RadGrid RenderMode="Lightweight" ID="RG_Samples" runat="server" GridLines="Both" OnItemCommand="RG_Samples_ItemCommand" OnItemDataBound="RG_Samples_ItemDataBound"
                                    AllowSorting="True" AutoGenerateColumns="False" CellSpacing="-1" Height="350px" ShowStatusBar="True" DataKeyNames="SampleID" Font-Size="X-Small"
                                    DataSourceID="DS_Samples">
                                    <MasterTableView CommandItemDisplay="Top" DataSourceID="DS_Samples" Name="Master" AutoGenerateColumns="false" DataKeyNames="SampleID" ClientDataKeyNames="SampleID">
                                        <CommandItemTemplate>
                                            <telerik:RadButton RenderMode="Lightweight" runat="server" Text="Clear Filter" ID="RTB_DeleteSearch" OnClientClicked="RB_DeleteSearch_Clicked" Height="33px" Font-Size="Smaller">
                                                <Icon PrimaryIconUrl="~/img/icon/icon_search_Filter.png" PrimaryHoveredIconUrl="~/img/icon/icon_search_Filter_Hovered.png" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                                            </telerik:RadButton>
                                            <telerik:RadComboBox RenderMode="Lightweight" ID="RCB_searchSample" runat="server" AutoPostBack="True" DataSourceID="DS_searchSample"
                                                OnClientDropDownOpened="RCB_searchSampleOpening" ChangeTextOnKeyBoardNavigation="true" OnClientSelectedIndexChanged="RCB_searchSampleIndexChange"
                                                Width="350px" Height="150px" EmptyMessage="Filter by ID and Local ID" CssClass="pl-0" Filter="Contains" DataTextField="Sample_Info" DataValueField="SampleID">
                                            </telerik:RadComboBox>
                                        </CommandItemTemplate>

                                        <Columns>
                                            <telerik:GridBoundColumn FilterControlWidth="120px" DataField="SampleID" HeaderText="Sample ID" DataType="System.String"
                                                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false">
                                                <HeaderStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn UniqueName="CenterDesc" HeaderText="Center" DataField="CenterDesc" FilterControlAltText="Filter CenterDesc column"
                                                SortExpression="CenterDesc" DataType="System.String" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false">
                                                <HeaderStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PIName" FilterControlAltText="Filter PIName column" HeaderText="PI" SortExpression="PIName"
                                                UniqueName="PIName" DataType="System.String" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                                                ShowFilterIcon="false">
                                                <HeaderStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="LocalID" HeaderText="Local ID" CurrentFilterFunction="Contains" ShowFilterIcon="false"
                                                AutoPostBackOnFilter="true" SortExpression="LocalID" DataField="LocalID" DataType="System.String">
                                                <HeaderStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="SampleTypeName" FilterControlAltText="Filter SampleTypeName column" HeaderText="Sample Type"
                                                CurrentFilterFunction="Contains" ShowFilterIcon="false" DataType="System.String"
                                                AutoPostBackOnFilter="true" SortExpression="SampleTypeName" UniqueName="SampleTypeName">
                                                <HeaderStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn UniqueName="AddSample" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" Height="15px"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="AddSample" BorderWidth="0px" ImageUrl="~/img/icon/icon_AddPeople.png" Width="25px" Height="25px"
                                                        ToolTip="Assign sample to Individual" CommandName="AssignSample"
                                                        runat="server"></asp:ImageButton>
                                                </ItemTemplate>

                                            </telerik:GridTemplateColumn>
                                              <telerik:GridTemplateColumn>
                                                <ItemTemplate>
                                                    <asp:HiddenField runat="server" ID="hdn_MultiIndividual" Value='<%# Eval("MultiIndividual") %>' />
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                    <ClientSettings EnableRowHoverStyle="true" EnablePostBackOnRowClick="true">
                                        <ClientEvents OnColumnMouseOut="RG_Samples_OnColumnMouseOut"></ClientEvents>
                                        <Selecting AllowRowSelect="true" />
                                        <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                                    </ClientSettings>
                                    <FilterMenu RenderMode="Lightweight"></FilterMenu>
                                    <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                                </telerik:RadGrid>
                            </td>
                        </tr>
                    </table>

                </div>
                <div class="form-actionspopup center" style="height: 20%">
                    <asp:Button ID="btn_cacel" Text="Cancel" runat="server" OnClientClick="CloseWindow(); return false;"
                        class="btn btn-danger mr-1 ladda-button btn-sm"></asp:Button>
                    <div style="text-align: center; font-size: medium; padding-top: 5px;">
                        <telerik:RadLabel runat="server" ID="RL_feedback" ForeColor="Red"></telerik:RadLabel>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<asp:SqlDataSource ID="DS_Samples" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_SampleForIndividual_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
        <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        <asp:ControlParameter ControlID="hdn_searchSampleID" Name="SampleID" Type="Int64" DefaultValue="-1" />
        <asp:SessionParameter Name="IndividualID" SessionField="IndividualID" Type="Int64" />
        <asp:SessionParameter Name="HostID" SessionField="HostID" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="DS_searchSample" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_SampleForIndividual_search_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
        <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        <asp:SessionParameter Name="IndividualID" SessionField="IndividualID" Type="Int64" />
        <asp:SessionParameter Name="HostID" SessionField="HostID" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="DS_assigned" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_Individual_Sample_assigned" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="IndividualID" SessionField="IndividualID" Type="Int64" />
        <asp:SessionParameter Name="HostID" SessionField="HostID" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <script type="text/javascript">

        function RCB_searchSampleIndexChange(sender, eventArgs) {
            var grid = $find("<%= RG_Samples.ClientID %>");
            var radcomboBox = $telerik.findControl(grid.get_element(), "RCB_searchSample");

            document.getElementById("<%= hdn_searchSampleID.ClientID %>").value = radcomboBox.get_value();
        }

        function RCB_searchSampleOpening() {
            var grid = $find("<%= RG_Samples.ClientID %>");
            var Com = $telerik.findControl(grid.get_element(), "RCB_searchSample");
            Com.set_emptyMessage("");
            Com.clearSelection();

        }

        function RB_DeleteSearch_Clicked() {
            var grid = $find("<%= RG_Samples.ClientID %>");
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
