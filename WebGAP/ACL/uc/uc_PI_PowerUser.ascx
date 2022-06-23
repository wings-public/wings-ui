<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_PI_PowerUser.ascx.cs" Inherits="WebGAP.ACL.uc.uc_PI_PowerUser" %>



<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="DDL_Centers">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_Centers" />
                <telerik:AjaxUpdatedControl ControlID="RG_PP_PI" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_PP_PowerUser" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_PP_PI">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_PP_PI" />
                <telerik:AjaxUpdatedControl ControlID="RG_PP_PowerUser" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
         <telerik:AjaxSetting AjaxControlID="RG_PP_PowerUser">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_PP_PowerUser" />
                <telerik:AjaxUpdatedControl ControlID="RG_PP_PowerUser" LoadingPanelID="RadAjaxLoadingPanel1" />
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
                                    <h4 class="form-section">PI</h4>

                                    <telerik:RadGrid RenderMode="Lightweight" ID="RG_PP_PI" runat="server" GridLines="Both"
                                        AllowSorting="True" AutoGenerateColumns="False" Height="700px" CellPadding="0" OnItemDataBound="RG_PP_PI_ItemDataBound" OnItemCommand="RG_PP_PI_ItemCommand"
                                        ShowStatusBar="True" DataSourceID="Ds_PP_PI" >
                                        <MasterTableView Name="Master" DataSourceID="Ds_PP_PI" AutoGenerateColumns="false" DataKeyNames="PIID">
                                            <Columns>
                                                <telerik:GridBoundColumn DataField="PIID" DataType="System.Int32" FilterControlAltText="Filter PIID column" HeaderText="PI ID" ReadOnly="True" SortExpression="PIID" UniqueName="PIID">
                                                    <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"  />
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="PIName" FilterControlAltText="Filter PIName column" HeaderText="PI Name" SortExpression="PIName" UniqueName="PIName">
                                                    <HeaderStyle Width="40%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Width="40%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                                <telerik:GridTemplateColumn UniqueName="newreq" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                    <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"  Height="15px"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="newreq" BorderWidth="0px" ImageUrl="../../img/icon/icon_add.png" Width="20px" Height="20px"
                                                            ToolTip="Add Poweruser" runat="server"></asp:ImageButton>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn UniqueName="delete" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                    <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" Height="15px"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="delete" BorderWidth="0px" ImageUrl="../../img/icon/icon_delete.png" Width="20px" Height="20px" CommandName="DeleteAllPowerusers"
                                                            OnClientClick="return confirm('Are you sure you want to delete?')" ToolTip="Delete PowerUser"
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
                                <h4 class="form-section">Power Users</h4>
                                <telerik:RadGrid RenderMode="Lightweight" ID="RG_PP_PowerUser" runat="server" GridLines="Both" OnItemCommand="RG_PP_PowerUser_ItemCommand"
                                    AllowSorting="True" Height="700px" Font-Size="X-Small" CellPadding="0" ShowStatusBar="True" DataSourceID="Ds_PP_PowerUser" AllowAutomaticDeletes="true">
                                    <MasterTableView Name="Master" AutoGenerateColumns="false" DataSourceID="Ds_PP_PowerUser" DataKeyNames="UserID">
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="UserID" DataType="System.Int32" FilterControlAltText="Filter UserID column" HeaderText="UserID" SortExpression="UserID" UniqueName="UserID">
                                                   <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"  />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="UserFullName" FilterControlAltText="Filter UserFullName column" HeaderText="User Name" SortExpression="UserFullName" UniqueName="UserFullName">
                                                 <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                 <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn UniqueName="delete" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"  Height="15px"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="delete" BorderWidth="0px" ImageUrl="../../img/icon/icon_delete.png" Width="20px" Height="20px"
                                                        OnClientClick="return confirm('Are you sure you want to delete?')" ToolTip="Delete PowerUser" CommandName="DeletePoweruser"
                                                        runat="server"></asp:ImageButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                    <ClientSettings EnableRowHoverStyle="true" EnablePostBackOnRowClick="true">
                                        <ClientEvents OnColumnMouseOut="OnColumnMouseOut"></ClientEvents>
                                        <Selecting AllowRowSelect="true" />
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
    ReloadOnShow="true" runat="server" EnableShadow="true" 
    Skin="Windows7" AutoSize="false" Modal="true" VisibleStatusbar="false" VisibleTitlebar="false">
    <Windows>
        <telerik:RadWindow ID="RadWindow2" runat="server" RenderMode="Lightweight" BorderStyle="None" BorderWidth="1px" CssClass="px-0 pb-0"
            NavigateUrl="/ACL/AddPoweruserForPI.aspx" OnClientClose="refreshGrid">
        </telerik:RadWindow>
    </Windows>
</telerik:RadWindowManager>


<asp:SqlDataSource ID="Ds_Centers" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_Center_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>


<asp:SqlDataSource ID="Ds_PP_PI" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PI_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        <asp:Parameter Name="InputType" Type="Int32" DefaultValue="-1" />
  </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="Ds_PP_PowerUser" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PP_PI_PowerUser_Sel" SelectCommandType="StoredProcedure" DeleteCommand="Sp_PP_PI_PowerUser_Del" DeleteCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" />
        <asp:ControlParameter ControlID="RG_PP_PI" Name="PIID" PropertyName="SelectedValue" Type="Int32" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>

</asp:SqlDataSource>



<telerik:RadCodeBlock ID="RadCodeBlock2" runat="server">
    <script type="text/javascript">
        function openWin(PIID, CenterID) {
            var Center = $('#<%= DDL_Centers.ClientID %> option:selected').val();

            if (Center === '-1') {
                return confirm("Select a center first!");
            }
            var h = $(document).height();
            var w = $(document).width();
            var oWnd = radopen("/ACL/AddPoweruserForPI.aspx?PIID=" + PIID + "&CenterID=" + Center, "RadWindow2");
            oWnd.set_height(0.47 * h);
            oWnd.set_width(0.5 * w);
            oWnd.center();
            oWnd.set_modal(true);
        }

        function refreshGrid(sender, eventArgs) {
            var grid = $find("<%=RG_PP_PI.ClientID%>").get_masterTableView();
           grid.rebind();
        }

    </script>
</telerik:RadCodeBlock>
