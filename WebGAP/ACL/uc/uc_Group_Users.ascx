<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Group_Users.ascx.cs" Inherits="WebGAP.ACL.uc.uc_Group_Users" %>

<style type="text/css">
    .RadWindow2 a.rwIcon {
        background-image: none !important;
    }

    .Hover_Selected tr.rgHoveredRow > td {
        color: #000000 !important;
        background: #D5EDF1 !important;
        border-color: #57BCCE !important;
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
                <telerik:AjaxUpdatedControl ControlID="RG_GU_Groups" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_GU_Users" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_UG_Users" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_UG_Groups" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="RG_GU_Groups">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_GU_Groups" />
                <telerik:AjaxUpdatedControl ControlID="RG_GU_Users" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_UG_Groups" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_UG_Users">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_UG_Users" />
                <telerik:AjaxUpdatedControl ControlID="RG_UG_Groups" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_GU_Users" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_GU_Users">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_GU_Users" />
                <telerik:AjaxUpdatedControl ControlID="RG_UG_Groups" LoadingPanelID="RadAjaxLoadingPanel1" />
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
                    <telerik:RadComboBox RenderMode="Lightweight" runat="server" ID="DDL_Centers" OnSelectedIndexChanged="DDL_Centers_SelectedIndexChanged" 
                    DataTextField="CenterDesc" DataValueField="CenterID" DropDownWidth="200px" 
                    HighlightTemplatedItems="true" Height="140px" AutoPostBack="true" Width="100%">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container, "Attributes['CenterID']")%>
                    </ItemTemplate>
                </telerik:RadComboBox>

            </div>
        </div>
    </div>
</div>



<div class="content-body pt-1">
    <section id="basic-form-layouts">
        <div class="row match-height">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header p-0">
                        <div style="background-color:aliceblue;">Group - Users</div>
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body p-0">
                            <div class="form">
                                <div class="form-body">
                                    <h4 class="form-section">Group</h4>
                                    <div class="row">
                                        <div class="form-group">
                                            <telerik:RadGrid RenderMode="Lightweight" ID="RG_GU_Groups" runat="server" GridLines="Both" OnItemCommand="RG_GU_Groups_ItemCommand"
                                                AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" Height="300px" CellPadding="0" PageSize="8" AllowPaging="true" OnPreRender="RG_GU_Groups_PreRender"
                                                ShowStatusBar="True" DataSourceID="DS_Groups" Font-Size="X-Small">
                                                <MasterTableView Name="Master" DataSourceID="DS_Groups" AutoGenerateColumns="false" DataKeyNames="GroupID">
                                                    <ItemStyle Height="20px" />
                                                    <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                                                    <Columns>
                                                        <telerik:GridBoundColumn UniqueName="GroupID" HeaderText="ID" DataField="GroupID" FilterControlAltText="Filter GroupID column" SortExpression="GroupID" DataType="System.Int32" ReadOnly="True">
                                                            <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="GroupName" HeaderText="Name" DataField="GroupName" FilterControlAltText="Filter GroupName column" SortExpression="GroupName">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>

                                                        <telerik:GridTemplateColumn UniqueName="add" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="newreq" BorderWidth="0px" ImageUrl="../../img/icon/icon_add.png" Width="17px" Height="17px" CommandName="userslist"
                                                                    ToolTip="Add Users"
                                                                    runat="server"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn UniqueName="delete" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="delete" BorderWidth="0px" ImageUrl="../../img/icon/icon_delete.png" Width="17px" Height="17px" CommandName="deleteAllUser"
                                                                    OnClientClick="return confirm('Are you sure you want to delete?')" ToolTip="Delete All Users"
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
                                                <SelectedItemStyle BackColor="Aqua"></SelectedItemStyle>
                                                <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                                            </telerik:RadGrid>
                                        </div>
                                    </div>
                                    <h4 class="form-section">Users</h4>
                                    <div class="row">
                                        <div class="form-group">
                                            <telerik:RadGrid RenderMode="Lightweight" ID="RG_GU_Users" runat="server" GridLines="Both" AllowPaging="true" PageSize="8"
                                                AllowSorting="True" CellSpacing="0" Height="300px" Font-Size="X-Small" CellPadding="0" OnItemCommand="RG_GU_Users_ItemCommand" CssClass="Hover_Selected"
                                                ShowStatusBar="True" DataSourceID="DS_GU_Users">
                                                <MasterTableView Name="Master" AutoGenerateColumns="false" DataKeyNames="UserID" DataSourceID="DS_GU_Users">
                                                    <ItemStyle Height="20px" />
                                                    <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                                                    <Columns>
                                                        <telerik:GridBoundColumn UniqueName="UserID" HeaderText="User ID" DataField="UserID" FilterControlAltText="Filter UserID column" SortExpression="UserID" DataType="System.Int32" ReadOnly="True">
                                                            <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="UserFullName" HeaderText="User Name" DataField="UserFullName" FilterControlAltText="Filter UserFullName column" SortExpression="UserFullName">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="UserCenterDesc" HeaderText="Center" DataField="UserCenterDesc" FilterControlAltText="Filter UserCenterDesc column" SortExpression="UserCenterDesc">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridTemplateColumn UniqueName="delete" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="delete" BorderWidth="0px" ImageUrl="../../img/icon/icon_delete.png" Width="17px" Height="17px"
                                                                    CommandName="DeleteSingleUser" ToolTip="Delete User" OnClientClick="return confirm('Are you sure you want to delete?')"
                                                                    runat="server"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                    </Columns>
                                                </MasterTableView>
                                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                                <ClientSettings EnableRowHoverStyle="true" AllowKeyboardNavigation="true" EnablePostBackOnRowClick="true">
                                                    <ClientEvents OnColumnMouseOut="OnColumnMouseOut"></ClientEvents>
                                                    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                                                </ClientSettings>
                                                <SelectedItemStyle BackColor="Aqua"></SelectedItemStyle>
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
                    <div class="card-header p-0">
                       <div  style="background-color:aliceblue">User - Groups</div>
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body p-0">
                            <div class="form">
                                <div class="form-body">
                                    <h4 class="form-section">User</h4>
                                    <div class="row">
                                        <div class="form-group">
                                            <telerik:RadGrid RenderMode="Lightweight" ID="RG_UG_Users" runat="server" GridLines="Both" OnItemCommand="RG_UG_Users_ItemCommand"  
                                                AllowSorting="True" CellSpacing="0" CellPadding="0" Height="300px" AllowPaging="true" PageSize="8" CssClass="RG_Padding_ACL" OnPreRender="RG_UG_Users_PreRender"
                                                ShowStatusBar="True" DataSourceID="DS_UG_Users" Font-Size="X-Small" >
                                                <MasterTableView Name="Master" DataSourceID="DS_UG_Users" AutoGenerateColumns="false" DataKeyNames="UserID">
                                                    <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                                                    <ItemStyle Height="20px" CssClass="pt-0 pb-0" />
                                                    <Columns>
                                                        <telerik:GridBoundColumn UniqueName="UserID" HeaderText="ID" DataField="UserID" FilterControlAltText="Filter UserID column" SortExpression="UserID" DataType="System.Int32" ReadOnly="True">
                                                            <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="UserFullName" HeaderText="Name" DataField="UserFullName" FilterControlAltText="Filter UserFullName column" SortExpression="UserFullName">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                    </Columns>
                                                </MasterTableView>
                                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                                <ClientSettings EnableRowHoverStyle="true" AllowKeyboardNavigation="true" EnablePostBackOnRowClick="true" Selecting-AllowRowSelect="true">
                                                    <ClientEvents OnColumnMouseOut="OnColumnMouseOut"></ClientEvents>
                                                    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                                                </ClientSettings>
                                                <SelectedItemStyle BackColor="Aqua"></SelectedItemStyle>
                                                <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                                            </telerik:RadGrid>
                                        </div>
                                    </div>
                                    <h4 class="form-section">Groups</h4>
                                    <div class="row">
                                        <div class="form-group">
                                            <telerik:RadGrid RenderMode="Lightweight" ID="RG_UG_Groups" runat="server" GridLines="Both" OnItemCommand="RG_UG_Groups_ItemCommand" AllowPaging="true" PageSize="8"
                                                AllowSorting="True" CellSpacing="0" Font-Size="X-Small" CellPadding="0" Height="300px" AutoGenerateColumns="false" CssClass="Hover_Selected" OnItemDataBound="RG_UG_Groups_ItemDataBound"
                                                ShowStatusBar="True" DataSourceID="DS_UG_Groups">
                                                <MasterTableView Name="Master" AutoGenerateColumns="false" DataKeyNames="GroupID" DataSourceID="DS_UG_Groups">
                                                    <ItemStyle Height="20px" />
                                                    <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                                                    <Columns>
                                                        <telerik:GridBoundColumn UniqueName="GroupID" HeaderText="Group ID" DataField="GroupID" FilterControlAltText="Filter GroupID column" SortExpression="GroupID">
                                                            <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="GroupName" HeaderText="Group" DataField="GroupName" FilterControlAltText="Filter GroupName column" SortExpression="GroupName">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="GroupCenterDesc" HeaderText="Center" DataField="GroupCenterDesc" FilterControlAltText="Filter GroupCenterDesc column" SortExpression="GroupCenterDesc">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridTemplateColumn DataType="System.int32" DataField="GroupStatusDesc" UniqueName="GroupStatusDesc" Groupable="False"
                                                            HeaderText="Status" HeaderStyle-Width="150px" FilterControlAltText="Filter GroupStatusDesc column" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:HiddenField runat="server" ID="hdn_Status" Value='<%# Eval("GroupStatus") %>' />
                                                                <asp:ImageButton ID="Statusbtn" BorderWidth="0px" Width="30px" runat="server"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn UniqueName="delete" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" Height="15px"></ItemStyle>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="delete" BorderWidth="0px" ImageUrl="../../img/icon/icon_delete.png" Width="17px" Height="17px" CommandName="DeleteGroup"
                                                                    ToolTip="Delete Group" OnClientClick="return confirm('Are you sure you want to delete?')"
                                                                    runat="server"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                    </Columns>
                                                </MasterTableView>
                                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                                <ClientSettings EnableRowHoverStyle="true" AllowKeyboardNavigation="true" EnablePostBackOnRowClick="true">
                                                    <ClientEvents OnColumnMouseOut="OnColumnMouseOut"></ClientEvents>
                                                    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                                                </ClientSettings>
                                                <SelectedItemStyle BackColor="Aqua"></SelectedItemStyle>
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
<asp:Button runat="server" ID="test" OnClientClick="showWindowInPercentage(40); return false;" />


<telerik:RadWindowManager ID="RadWindowManager2" ShowContentDuringLoad="true" RenderMode="Lightweight" AutoSizeBehaviors="Height, Width"
    ReloadOnShow="true" runat="server" EnableShadow="true"
    Skin="Windows7" AutoSize="false" Modal="true" VisibleStatusbar="false" VisibleTitlebar="false">
    <Windows>
        <telerik:RadWindow ID="RadWindow2" runat="server" RenderMode="Lightweight" BorderStyle="None"
            BorderWidth="1px" CssClass="px-0 pb-0" Height="300"
            KeepInScreenBounds="false"
            NavigateUrl="/ACL/AddNewUserToGroup.aspx" OnClientClose="refreshGrid">
        </telerik:RadWindow>

    </Windows>
</telerik:RadWindowManager>

<asp:SqlDataSource ID="Ds_Centers" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_Center_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="DS_Groups" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_Groups_Active_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="DS_GU_Users" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_GU_Groups_User_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="RG_GU_Groups" Name="GroupID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="DS_UG_Users" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_GU_User_Sel" SelectCommandType="StoredProcedure" runat="server">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="DS_UG_Groups" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_GU_Users_Groups_Sel" SelectCommandType="StoredProcedure" runat="server">
    <SelectParameters>
        <asp:ControlParameter ControlID="RG_UG_Users" Name="UserID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
    </SelectParameters>
</asp:SqlDataSource>
-

    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script type="text/javascript">


            function openWin() {


                var combo = $find("<%= DDL_Centers.ClientID %>");
                Center = combo.get_selectedItem().get_value();


                if (Center === '-1') {
                    return radalert("<br /><b> Select a center first! </b><br />");
                }
                var w = $(document).width();
                var oWnd = radopen("/ACL/AddNewUserToGroup.aspx", "RadWindow2");
                oWnd.set_height(500);
                oWnd.set_width(0.5 * w);
                oWnd.center();
                oWnd.set_modal(true);
            }

            function refreshGrid(sender, eventArgs) {
                var grid_1 = $find("<%=RG_GU_Groups.ClientID%>").get_masterTableView();
                var grid_2 = $find("<%=RG_GU_Users.ClientID%>").get_masterTableView();
                var grid_3 = $find("<%=RG_UG_Users.ClientID%>").get_masterTableView();
                var grid_4 = $find("<%=RG_UG_Groups.ClientID%>").get_masterTableView();
                if (grid_1 && grid_2 && grid_3 && grid_4) {
                    grid_1.rebind();
                    grid_2.rebind();
                    grid_3.rebind();
                    grid_4.rebind();
                }

            }


        </script>
    </telerik:RadScriptBlock>
