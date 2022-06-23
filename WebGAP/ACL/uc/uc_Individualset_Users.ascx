<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Individualset_Users.ascx.cs" Inherits="WebGAP.ACL.uc.uc_Individualset_Users" %>

<style type="text/css">
    .RadWindow2 a.rwIcon {
        background-image: none !important;
    }

    .Hover_Selected tr.rgHoveredRow > td {
        color: #000000 !important;
        background: #D5EDF1 !important;
        border-color: #57BCCE !important;
    }
</style>

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="DDL_Centers">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_Centers" />
                <telerik:AjaxUpdatedControl ControlID="DDL_PIs" />
                <telerik:AjaxUpdatedControl ControlID="RG_IU_Individualset" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_IU_Users" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="DDL_PIs">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_PIs" />
                <telerik:AjaxUpdatedControl ControlID="RG_IU_Individualset" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_IU_Users" LoadingPanelID="RadAjaxLoadingPanel1" />

            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_IU_Individualset">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_IU_Individualset" />
                <telerik:AjaxUpdatedControl ControlID="RG_IU_Users" LoadingPanelID="RadAjaxLoadingPanel1" />

            </UpdatedControls>
        </telerik:AjaxSetting>


    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>


<div class="content-header row">
    <div class="content-header-left col-md-6 col-12">
        <h3 class="content-header-title">
            <asp:PlaceHolder runat="server"><%: Page.Title %> </asp:PlaceHolder>
        </h3>
    </div>
    <div class="content-header-right col-md-6 col-12">
        <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
            <div class="btn-group" role="group">
                <asp:DropDownList ID="DDL_Centers" runat="server" Width="150px"
                    AppendDataBoundItems="True" AutoPostBack="true" DataTextField="CenterDesc" DataValueField="CenterID" DataSourceID="Ds_Centers"
                    class="btn btn-outline-info dropdown-toggle dropdown-menu-right mr-1 btn-sm">
                  
                </asp:DropDownList>

                <asp:DropDownList ID="DDL_PIs" runat="server" Width="150px" DataTextField="PIName" DataValueField="PIID"
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
            <script type="text/javascript" id="telerikClientEvents1">
                function OnColumnMouseOut(sender, args) {
                }
            </script>
            <div class="col-md-6">
                <div class="card">

                    <div class="card-content collapse show">
                        <div class="card-body">
                            <div class="form">
                                <div class="form-body">
                                    <h4 class="form-section">Individualset</h4>
                                    <telerik:RadGrid RenderMode="Lightweight" ID="RG_IU_Individualset" runat="server" GridLines="Both"  OnItemCommand="RG_IU_Individualset_ItemCommand"
                                        AllowSorting="True" AutoGenerateColumns="False" Height="630px" CellPadding="0" AllowPaging="true"
                                        ShowStatusBar="True" DataSourceID="Ds_IU_Individualset">
                                        <MasterTableView Name="Master" AutoGenerateColumns="false" DataKeyNames="IndividualsetID,PIID,CenterID" DataSourceID="Ds_IU_Individualset">
                                             <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                                            <Columns>
                                                <telerik:GridBoundColumn DataField="IndividualsetID" DataType="System.Int32" FilterControlAltText="Filter IndividualsetID column" HeaderText="ID" ReadOnly="True" SortExpression="IndividualsetID" UniqueName="IndividualsetID">
                                                    <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" ></ItemStyle>
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="IndividualsetName" FilterControlAltText="Filter IndividualsetName column" HeaderText="Name" SortExpression="IndividualsetName" UniqueName="IndividualsetName">
                                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle  VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="IndividualsetDesc" FilterControlAltText="Filter IndividualsetDesc column" HeaderText="Desccription" SortExpression="IndividualsetDesc" UniqueName="IndividualsetDesc">
                                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Height="15px"></ItemStyle>
                                                </telerik:GridBoundColumn>
                                                <telerik:GridTemplateColumn UniqueName="TemplateColumn5" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                    <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"  ></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="newreq" BorderWidth="0px" ImageUrl="../../img/icon/icon_add.png" Width="15px" Height="15px" ToolTip="Add User"
                                                            runat="server" CommandName="listusers"></asp:ImageButton>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn UniqueName="delete" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                    <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" Height="30px"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="delete" BorderWidth="0px" ImageUrl="../../img/icon/icon_delete.png" Width="20px" Height="20px" ToolTip="Delete Users"
                                                            CommandName="deleteAllUsers" OnClientClick="return confirm('Are you sure you want to delete?')"
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
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-content collapse show">
                        <div class="card-body">
                            <div class="form">
                                <h4 class="form-section">Users</h4>
                                <telerik:RadGrid RenderMode="Lightweight" ID="RG_IU_Users" runat="server" GridLines="Both" DataSourceID="DS_IU_Users" OnItemCommand="RG_IU_Users_ItemCommand"
                                    AllowSorting="True" Height="630px" CellPadding="0" ShowStatusBar="True" CssClass="Hover_Selected" AllowPaging="true">
                                    <MasterTableView Name="Master" AutoGenerateColumns="false" DataKeyNames="UserID">
                                         <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="UserID" DataType="System.Int32" FilterControlAltText="Filter UserID column" HeaderText="ID" ReadOnly="True" SortExpression="UserID" UniqueName="UserID">
                                                <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="UserFullName" FilterControlAltText="Filter UserFullName column" HeaderText="Name" ReadOnly="True" SortExpression="UserFullName" UniqueName="UserFullName">
                                                <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle  VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="UserCenterDesc" FilterControlAltText="Filter UserCenterDesc column" HeaderText="Center" ReadOnly="True" SortExpression="UserCenterDesc" UniqueName="UserCenterDesc">
                                                <HeaderStyle  VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle  VerticalAlign="Middle" HorizontalAlign="Center" ></ItemStyle>
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn UniqueName="delete" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"  ></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="delete" BorderWidth="0px" ImageUrl="../../img/icon/icon_delete.png" Width="20px" ToolTip="Delete User"
                                                        Height="20px" CommandName="deleteSingleUser" OnClientClick="return confirm('Are you sure you want to delete?')"
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
    </section>
</div>


<telerik:RadWindowManager ID="RadWindowManager2" ShowContentDuringLoad="true" RenderMode="Lightweight"
    ReloadOnShow="true" runat="server" EnableShadow="true" Width="500px" Height="350px"
    Skin="Windows7" AutoSize="false" Modal="true" VisibleStatusbar="false" VisibleTitlebar="false">
    <Windows>
        <telerik:RadWindow ID="RadWindow2" runat="server" RenderMode="Lightweight" BorderStyle="None" BorderWidth="1px" CssClass="px-0 pb-0"
            NavigateUrl="/ACL/AddNewUserToDataset.aspx" OnClientClose="refreshGrid">
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
<asp:SqlDataSource ID="Ds_IU_Individualset" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_Individualset_Active_PI_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:ControlParameter ControlID="DDL_PIs" Name="PIID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="DS_IU_Users" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_IU_Sel_Individualset_Users" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        <asp:ControlParameter ControlID="RG_IU_Individualset" Name="IndividualsetID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
    </SelectParameters>
</asp:SqlDataSource>
<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
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
            var oWnd = radopen("/ACL/AddNewUserToIndividualset.aspx", "RadWindow2");

            var h = $(document).height();
            var w = $(document).width();

            oWnd.set_height(500);
            oWnd.set_width(0.5 * w);
            oWnd.center();

            oWnd.set_modal(true);
        }
        function refreshGrid(sender, eventArgs) {
            var grid = $find("<%=RG_IU_Individualset.ClientID%>").get_masterTableView();
            grid.rebind();
        }
    </script>
</telerik:RadScriptBlock>

