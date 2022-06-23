<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_IndividualSet_Group.ascx.cs" Inherits="WebGAP.ACL.uc.uc_IndividualSet_Group" %>



<style type="text/css">
    .RadWindow2 a.rwIcon {
        background-image: none !important;
    }



    .RadGrid_Bootstrap .rgAltRow {
        background-color: #f9f9f9;
        height: 20px;
    }
</style>

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="DDL_Centers">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_Centers" />
                <telerik:AjaxUpdatedControl ControlID="DDL_PIs" />
                <telerik:AjaxUpdatedControl ControlID="RG_GI_Group" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_GI_Individualset" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_IG_Individualset" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_IG_Group" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="DDL_PIs">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_PIs" />
                <telerik:AjaxUpdatedControl ControlID="RG_GI_Group" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_GI_Individualset" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_IG_Individualset" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_IG_Group" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_GI_Group">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_GI_Group" />
                <telerik:AjaxUpdatedControl ControlID="RG_GI_Individualset" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_IG_Group" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_IG_Individualset">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_IG_Individualset" />
                <telerik:AjaxUpdatedControl ControlID="RG_IG_Group" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_GI_Individualset" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_IG_Individualset">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_IG_Individualset" />
                <telerik:AjaxUpdatedControl ControlID="RG_IG_Group" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>
<script type="text/javascript" id="telerikClientEvents1">
    function OnColumnMouseOut(sender, args) {
    }
</script>
<div class="content-header row">
    <div class="content-header-left col-md-6 col-12">
        <h3 class="content-header-title">
            <asp:PlaceHolder runat="server"><%: Page.Title %> </asp:PlaceHolder>
        </h3>
    </div>
    <div class="content-header-right col-md-6 col-12">
        <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
            <div class="btn-group" role="group">
                <asp:DropDownList ID="DDL_Centers" runat="server" Width="150px" DataSourceID="Ds_Centers" OnSelectedIndexChanged="DDL_Centers_SelectedIndexChanged"
                    AppendDataBoundItems="True" AutoPostBack="true" DataTextField="CenterDesc" DataValueField="CenterID"
                    class="btn btn-outline-info dropdown-toggle dropdown-menu-right mr-1 btn-sm">
                </asp:DropDownList>

                <asp:DropDownList ID="DDL_PIs" runat="server" Width="150px" DataTextField="PIName" DataValueField="PIID" OnSelectedIndexChanged="DDL_PIs_SelectedIndexChanged"
                    AutoPostBack="true" DataSourceID="Ds_PIs" AppendDataBoundItems="true" EnableViewState="false"
                    class="btn btn-outline-info dropdown-toggle dropdown-menu-right mr-1 btn-sm">
                    <asp:ListItem Value="-1">All PIs</asp:ListItem>
                </asp:DropDownList>
                <%--<button class="btn btn-info mr-1 ladda-button btn-sm" data-style="expand-right"><span class="ladda-label"><i class="icon-history white"></i>&nbsp;History</span></button>--%>
            </div>
        </div>
    </div>
</div>

<div class="content-body pt-1">
    <section id="basic-form-layouts">
        <div class="row match-height">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Group - Individualset</h4>
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body">
                            <div class="form">
                                <div class="form-body">
                                    <h4 class="form-section">Group</h4>
                                    <div class="row">
                                        <div class="form-group">
                                            <telerik:RadGrid RenderMode="Lightweight" ID="RG_GI_Group" runat="server" GridLines="Both"
                                                AllowSorting="True" AutoGenerateColumns="False" Height="300px" CellPadding="0"
                                                ShowStatusBar="True" DataSourceID="DS_GI_Group" Font-Size="X-Small" OnItemCommand="RG_GI_Group_ItemCommand">
                                                <MasterTableView Name="Master" DataSourceID="DS_GI_Group" AutoGenerateColumns="false" DataKeyNames="GroupID">
                                                    <ItemStyle Height="20px" />
                                                    <Columns>
                                                        <telerik:GridBoundColumn DataField="GroupID" DataType="System.Int32" FilterControlAltText="Filter GroupID column" HeaderText="ID" ReadOnly="True" SortExpression="GroupID" UniqueName="GroupID">
                                                            <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="GroupName" FilterControlAltText="Filter GroupName column" HeaderText="Name" SortExpression="GroupName" UniqueName="GroupName">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                                                        </telerik:GridBoundColumn>
                                                      
                                                        <telerik:GridTemplateColumn UniqueName="newreq" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" Height="15px"></ItemStyle>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="newreq" BorderWidth="0px" ImageUrl="../../img/icon/icon_add.png" Width="15px" Height="15px" CommandName="listindividualset"
                                                                    ToolTip="Add Individualset" runat="server"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn UniqueName="delete" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" Height="15px"></ItemStyle>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="delete" BorderWidth="0px" ImageUrl="../../img/icon/icon_delete.png" Width="17px" Height="17px" CommandName="deleteAllIndividualsets"
                                                                    OnClientClick="return confirm('Are you sure you want to delete?')" ToolTip="Delete All Individualsets"
                                                                    runat="server"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                    </Columns>
                                                </MasterTableView>
                                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                                <ClientSettings EnableRowHoverStyle="true" AllowKeyboardNavigation="true" EnablePostBackOnRowClick="true">
                                                    <ClientEvents OnColumnMouseOut="OnColumnMouseOut"></ClientEvents>
                                                    <Selecting AllowRowSelect="true" />
                                                    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                                                </ClientSettings>
                                                <FilterMenu RenderMode="Lightweight"></FilterMenu>
                                                <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                                            </telerik:RadGrid>
                                        </div>
                                    </div>
                                    <h4 class="form-section">Individualset</h4>
                                    <div class="row">
                                        <div class="form-group">
                                            <telerik:RadGrid RenderMode="Lightweight" ID="RG_GI_Individualset" runat="server" GridLines="Both" OnItemCommand="RG_GI_Individualset_ItemCommand"
                                                AllowSorting="True" Height="300px" Font-Size="X-Small" CellPadding="0" ShowStatusBar="True" DataSourceID="DS_GI_Individualset" CssClass="Hover_Selected" OnItemDataBound="RG_GI_Individualset_ItemDataBound">
                                                <MasterTableView Name="Master" AutoGenerateColumns="false" DataSourceID="DS_GI_Individualset" DataKeyNames="IndividualsetID" NoMasterRecordsText="No records to display.">
                                                    <ItemStyle Height="20px" />
                                                    <Columns>
                                                        <telerik:GridBoundColumn DataField="IndividualsetID" DataType="System.Int64" FilterControlAltText="Filter IndividualsetID column" HeaderText="IndividualsetID" SortExpression="IndividualsetID" UniqueName="IndividualsetID">
                                                            <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="IndividualsetName" FilterControlAltText="Filter IndividualsetName column" HeaderText="IndividualsetName" SortExpression="IndividualsetName" UniqueName="IndividualsetName">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridTemplateColumn DataType="System.int32" DataField="IndividualsetTypeID" UniqueName="IndividualsetTypeID" Groupable="False"
                                                            HeaderText="Type" HeaderStyle-Width="150px" FilterControlAltText="Filter IndividualsetTypeID column" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:HiddenField runat="server" ID="hdn_Type" Value='<%# Eval("IndividualsetTypeID") %>' />
                                                                <asp:ImageButton ID="Typebtn" BorderWidth="0px" Width="20px" runat="server"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn DataType="System.int32" DataField="IndividualsetStatus" UniqueName="IndividualsetStatus" Groupable="False"
                                                            HeaderText="Status" HeaderStyle-Width="150px" FilterControlAltText="Filter IndividualsetStatus column" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:HiddenField runat="server" ID="hdn_status" Value='<%# Eval("IndividualsetStatus") %>' />
                                                                <asp:ImageButton ID="Statusbtn" BorderWidth="0px" Width="20px" runat="server"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>

                                                        <telerik:GridTemplateColumn UniqueName="delete" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="delete" BorderWidth="0px" ImageUrl="../../img/icon/icon_delete.png" Width="17px" Height="17px" CommandName="DeleteIndividualset"
                                                                    OnClientClick="return confirm('Are you sure you want to delete?')" ToolTip="Delete Individualset"
                                                                    runat="server"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                    </Columns>
                                                </MasterTableView>
                                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                                <ClientSettings EnableRowHoverStyle="true" EnablePostBackOnRowClick="true">
                                                    <ClientEvents OnColumnMouseOut="OnColumnMouseOut"></ClientEvents>
                                                    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                                                </ClientSettings>
                                                <SelectedItemStyle BackColor="Aqua"></SelectedItemStyle>
                                                <FilterMenu RenderMode="Lightweight"></FilterMenu>
                                                <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                                            </telerik:RadGrid>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Individualset - Group</h4>
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body">
                            <div class="form">
                                <div class="form-body">
                                    <h4 class="form-section">Individualset</h4>
                                    <div class="row">
                                        <div class="form-group">
                                            <telerik:RadGrid RenderMode="Lightweight" ID="RG_IG_Individualset" runat="server" GridLines="Both"
                                                AllowSorting="True" CellPadding="0" Height="300px"
                                                ShowStatusBar="True" Font-Size="X-Small" DataSourceID="DS_IG_Individualset">
                                                <MasterTableView Name="Master" AutoGenerateColumns="false" DataSourceID="DS_IG_Individualset" DataKeyNames="IndividualsetID,PIID,CenterID" CssClass="RG_Padding_ACL">
                                                    <ItemStyle Height="20px" />
                                                    <Columns>
                                                        <telerik:GridBoundColumn DataField="IndividualsetID" DataType="System.Int32" FilterControlAltText="Filter IndividualsetID column"
                                                            HeaderText="ID" ReadOnly="True" SortExpression="IndividualsetID" UniqueName="IndividualsetID">
                                                            <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="IndividualsetName" FilterControlAltText="Filter IndividualsetName column" HeaderText="Name" SortExpression="IndividualsetName" UniqueName="IndividualsetName">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="IndividualsetDesc" FilterControlAltText="Filter IndividualsetDesc column" HeaderText="Description" SortExpression="IndividualsetDesc" UniqueName="IndividualsetDesc">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                                                        </telerik:GridBoundColumn>

                                                    </Columns>
                                                </MasterTableView>
                                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                                <ClientSettings EnableRowHoverStyle="true" EnablePostBackOnRowClick="true" Selecting-AllowRowSelect="true">
                                                    <Selecting AllowRowSelect="True"></Selecting>
                                                    <ClientEvents OnColumnMouseOut="OnColumnMouseOut"></ClientEvents>
                                                    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                                                </ClientSettings>
                                                <SelectedItemStyle BackColor="Aqua"></SelectedItemStyle>
                                                <FilterMenu RenderMode="Lightweight"></FilterMenu>
                                                <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                                            </telerik:RadGrid>
                                        </div>
                                    </div>
                                    <h4 class="form-section">Group</h4>
                                    <div class="row">
                                        <div class="form-group">
                                            <telerik:RadGrid RenderMode="Lightweight" ID="RG_IG_Group" runat="server" GridLines="Both"
                                                AllowSorting="True" Font-Size="X-Small" CellPadding="0" Height="300px" AutoGenerateColumns="False" OnItemCommand="RG_IG_Group_ItemCommand" OnItemDataBound="RG_IG_Group_ItemDataBound"
                                                ShowStatusBar="True" DataSourceID="DS_IG_Group" CssClass="Hover_Selected">
                                                <MasterTableView Name="Master" AutoGenerateColumns="false" DataSourceID="DS_IG_Group" DataKeyNames="GroupID" NoMasterRecordsText="No records to display.">
                                                    <ItemStyle Height="20px" />
                                                    <Columns>
                                                        <telerik:GridBoundColumn DataField="GroupID" DataType="System.Int32" FilterControlAltText="Filter GroupID column" HeaderText="GroupID" SortExpression="GroupID" UniqueName="GroupID">
                                                            <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="GroupName" FilterControlAltText="Filter GroupName column" HeaderText="Name" SortExpression="GroupName" UniqueName="GroupName">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="GroupCenterDesc" FilterControlAltText="Filter GroupCenterDesc column" HeaderText="Description" SortExpression="GroupCenterDesc" UniqueName="GroupCenterDesc">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridTemplateColumn DataType="System.int32" DataField="GroupStatusDesc" UniqueName="GroupStatusDesc" Groupable="False"
                                                            HeaderText="Status" HeaderStyle-Width="150px" FilterControlAltText="Filter GroupStatusDesc column" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:HiddenField runat="server" ID="hdn_Status" Value='<%# Eval("GroupStatus") %>' />
                                                                <asp:ImageButton ID="Statusbtn" BorderWidth="0px" Width="20px" runat="server"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn UniqueName="delete" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" Height="15px"></ItemStyle>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="delete" BorderWidth="0px" ImageUrl="../../img/icon/icon_delete.png" Width="17px" Height="17px"
                                                                    CommandName="DeleteGroup" OnClientClick="return confirm('Are you sure you want to delete?')" ToolTip="Delete Group"
                                                                    runat="server"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                    </Columns>
                                                </MasterTableView>
                                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                                <ClientSettings EnableRowHoverStyle="true" Selecting-AllowRowSelect="false" EnablePostBackOnRowClick="true">
                                                    <ClientEvents OnColumnMouseOut="OnColumnMouseOut"></ClientEvents>
                                                    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                                                </ClientSettings>
                                                <SelectedItemStyle BackColor="Aqua"></SelectedItemStyle>
                                                <FilterMenu RenderMode="Lightweight"></FilterMenu>
                                                <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                                            </telerik:RadGrid>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<telerik:RadWindowManager ID="RadWindowManager2" ShowContentDuringLoad="true" RenderMode="Lightweight"
    ReloadOnShow="true" runat="server" EnableShadow="true"
    Skin="Windows7" AutoSize="false" Modal="true" VisibleStatusbar="false" VisibleTitlebar="false">
    <Windows>
        <telerik:RadWindow ID="RadWindow2" runat="server" RenderMode="Lightweight" BorderStyle="None" BorderWidth="1px" CssClass="px-0 pb-0"
            NavigateUrl="/ACL/AddNewIndividualsetToGroup.aspx" OnClientClose="refreshGrid">
        </telerik:RadWindow>
    </Windows>
</telerik:RadWindowManager>

<asp:SqlDataSource ID="Ds_Centers" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_Center_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="Ds_PIs" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_PI_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        <asp:Parameter Name="InputType" Type="Int32" DefaultValue="-1" />

    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="DS_GI_Group" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommandType="StoredProcedure" SelectCommand="Sp_Groups_Active_Sel">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="DS_GI_Individualset" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_IG_Sel_Group_Individualset" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="RG_GI_Group" Name="GroupID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="DS_IG_Individualset" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_Individualset_PI_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:ControlParameter ControlID="DDL_PIs" Name="PIID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="DS_IG_Group" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_IG_Sel_Individualset_Groups" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="RG_IG_Individualset" Name="IndividualsetID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
    <script type="text/javascript">
        function openWin() {
            var Center = $('#<%= DDL_Centers.ClientID %> option:selected').val();
            var PI = $('#<%= DDL_PIs.ClientID %> option:selected').val();

            if (Center === '-1') {
                return radalert("<br /><b> Select a center first! </b><br />");
            }
            if (PI === '-1') {
                return radalert("<br /><b> Select a PI first! </b><br />");
            }
            var oWnd = radopen("/ACL/AddNewIndividualsetToGroup.aspx", "RadWindow2");
            var h = $(document).height();
            var w = $(document).width();
            oWnd.set_height(500);
            oWnd.set_width(0.5 * w);
            oWnd.center();
            oWnd.set_modal(true);
        }

        function refreshGrid(sender, eventArgs) {
            var RG_GI_Group = $find("<%=RG_GI_Group.ClientID%>").get_masterTableView();
            var RG_GI_Individualset = $find("<%=RG_GI_Individualset.ClientID%>").get_masterTableView();
            RG_GI_Group.rebind();
            RG_GI_Individualset.rebind();
        }

        function NewReqclick(index) {
            var masterTable = $find("<%=RG_GI_Group.ClientID%>").get_masterTableView();
            masterTable.fireCommand("Select", index); //will select the row
        }

    </script>
</telerik:RadCodeBlock>
