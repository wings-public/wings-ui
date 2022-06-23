<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_PI_User.ascx.cs" Inherits="WebGAP.ACL.uc.uc_PI_User" %>


<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="DDL_Centers">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_Centers" />
                <telerik:AjaxUpdatedControl ControlID="RG_PU_PI" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_PU_User" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_PU_PI">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_PU_PI" />
                <telerik:AjaxUpdatedControl ControlID="RG_PU_User" LoadingPanelID="RadAjaxLoadingPanel1" />
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
                    <div class="card-content collapse show">
                        <div class="card-body">
                            <div class="form">
                                <div class="form-body">
                                    <h4 class="form-section">PI</h4>
                                    <telerik:RadGrid RenderMode="Lightweight" ID="RG_PU_PI" runat="server" GridLines="Both" OnPreRender="RG_PU_PI_PreRender" 
                                        AllowSorting="True" AutoGenerateColumns="False" Height="700px" CellPadding="0" OnItemCommand="RG_PU_PI_ItemCommand"
                                        ShowStatusBar="True" DataSourceID="Ds_PU_PI">
                                        <MasterTableView Name="Master" DataSourceID="Ds_PU_PI" AutoGenerateColumns="false" DataKeyNames="PIID" ClientDataKeyNames="PIID">
                                            <Columns>
                                                <%-- <telerik:GridBoundColumn DataField="CenterID" DataType="System.Int32" FilterControlAltText="Filter CenterID column" HeaderText="CenterID" SortExpression="CenterID" UniqueName="CenterID">
                                                    <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                </telerik:GridBoundColumn>--%>
                                                <%--  <telerik:GridBoundColumn DataField="PIID" DataType="System.Int32" FilterControlAltText="Filter PIID column" HeaderText="PI ID" ReadOnly="True" SortExpression="PIID" UniqueName="PIID">
                                                    <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                </telerik:GridBoundColumn>--%>
                                                <telerik:GridBoundColumn DataField="PIName" FilterControlAltText="Filter PIName column" HeaderText="PI Name" SortExpression="PIName" UniqueName="PIName">
                                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                                <telerik:GridTemplateColumn UniqueName="TemplateColumn5" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                    <HeaderStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center" Height="15px"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="newreq" BorderWidth="0px" ImageUrl="../../img/icon/icon_add.png" Width="17px" Height="17px" ToolTip="Add User" CommandName="AddnewUser"
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
                                <h4 class="form-section">Users</h4>
                                <telerik:RadGrid RenderMode="Lightweight" ID="RG_PU_User" runat="server" GridLines="Both" OnItemCommand="RG_PU_User_ItemCommand"
                                    AllowSorting="True" Height="700px" CellPadding="0" ShowStatusBar="True" DataSourceID="Ds_PU_User" OnItemDataBound="RG_PU_User_ItemDataBound">
                                    <MasterTableView Name="Master" AutoGenerateColumns="false" DataSourceID="Ds_PU_User" DataKeyNames="UserID">
                                        <Columns>
                                            <%--  <telerik:GridBoundColumn DataField="PIID" DataType="System.Int32" FilterControlAltText="Filter PIID column" HeaderText="PI ID" SortExpression="PIID" UniqueName="PIID">
                                                <HeaderStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Smaller" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="UserID" DataType="System.Int32" FilterControlAltText="Filter UserID column" HeaderText="User ID" SortExpression="UserID" UniqueName="UserID">
                                                <HeaderStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Smaller" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="CenterID" DataType="System.Int32" FilterControlAltText="Filter CenterID column" HeaderText="Center ID" SortExpression="CenterID" UniqueName="CenterID">
                                                <HeaderStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Smaller" />
                                            </telerik:GridBoundColumn>--%>
                                            <telerik:GridTemplateColumn DataType="System.int32" DataField="WhichTbl" UniqueName="WhichTbl" Visible="false">
                                                <HeaderStyle Width="40px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="40px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <asp:HiddenField runat="server" ID="hdn_WhichTbl" Value='<%# Eval("WhichTbl") %>' />
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="UserFullName" FilterControlAltText="Filter UserFullName column" HeaderText="User Name" SortExpression="UserFullName" UniqueName="UserFullName">
                                                <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PIName" FilterControlAltText="Filter PIName column" HeaderText="PIName" SortExpression="PI Name" UniqueName="PIName">
                                                <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn UniqueName="delete" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="delete" BorderWidth="0px" ImageUrl="../../img/icon/icon_delete.png" Width="17px" Height="17px" ToolTip="Delete User"
                                                        CommandName="deleteUser" OnClientClick="return confirm('Are you sure you want to delete?')"
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




<asp:SqlDataSource ID="Ds_Centers" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_Center_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>


<asp:SqlDataSource ID="Ds_PU_PI" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PI_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        <asp:Parameter Name="InputType" Type="Int32" DefaultValue="-1" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="Ds_PU_User" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PU_PI_User_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:ControlParameter ControlID="RG_PU_PI" Name="PIID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<telerik:RadWindowManager ID="RadWindowManager2" ShowContentDuringLoad="true" RenderMode="Lightweight"
    ReloadOnShow="true" runat="server" EnableShadow="true"
    Skin="Windows7" AutoSize="false" Modal="true" VisibleStatusbar="false" VisibleTitlebar="false">
    <Windows>

        <telerik:RadWindow ID="RadWindow2" runat="server" RenderMode="Lightweight" BorderStyle="None" BorderWidth="1px" CssClass="px-0 pb-0"
            OnClientClose="refreshGrid">
        </telerik:RadWindow>

    </Windows>
</telerik:RadWindowManager>

<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <script type="text/javascript">


        function openWin(PIID) {

            var combo = $find("<%= DDL_Centers.ClientID %>");
            Center = combo.get_selectedItem().get_value();

            if (Center === '-1') {
                return radalert("<br /><b> Select a center first! </b><br />");
            }
            var h = $(document).height();
            var w = $(document).width();
            var oWnd = radopen("/ACL/AddNewUserForPI.aspx", "RadWindow2");
            oWnd.set_height(0.47 * h);
            oWnd.set_width(0.5 * w);
            oWnd.center();
            oWnd.set_modal(true);
        }

        function refreshGrid(sender, eventArgs) {
            var grid = $find("<%=RG_PU_User.ClientID%>").get_masterTableView();
            grid.rebind();
        }

    </script>
</telerik:RadScriptBlock>
