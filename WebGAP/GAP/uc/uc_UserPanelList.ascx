<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_UserPanelList.ascx.cs" Inherits="WebGAP.GAP.uc.uc_UserPanelList" %>
<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_UPanel" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_UPanel">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_UPanel" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RTB_AddUP">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RTB_AddUP" />
                <telerik:AjaxUpdatedControl ControlID="RG_UPanel" LoadingPanelID="RadAjaxLoadingPanel1" />
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
</div>


<div class="content-header row pt-2">
    <table style="width: 100%; background-color: lightgray">
        <tr>
            <td style="width: 220px">
                <asp:Label runat="server" ID="lbl_UPanelList" Text="User Panel List" CssClass="header"> </asp:Label>
            </td>
        </tr>
    </table>
</div>

<div class="content-body pt-1">
    <section id="basic-form-layouts">
        <div class="row match-height">
            <script type="text/javascript" id="telerikClientEvents1">
                function RG_UPanel_OnColumnMouseOut(sender, args) {
                }
            </script>

            <telerik:RadGrid RenderMode="Lightweight" ID="RG_UPanel" runat="server" GridLines="Both" Font-Size="Smaller"
                AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="-1" Height="700px"
                ShowStatusBar="True" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" OnItemCommand="RG_UPanel_ItemCommand"
                AllowAutomaticUpdates="True" DataSourceID="DS_UPanel">
                <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                <MasterTableView CommandItemDisplay="Top" Name="Master" AutoGenerateColumns="false" DataSourceID="DS_UPanel" DataKeyNames="UserID,UPanelID,RefBuild" ClientDataKeyNames="UPanelID">
                    <CommandItemTemplate>
                        <div style="width: 180px; float: left;">
                            <telerik:RadComboBox CssClass="btn-sm rddl_filter" ID="RCB_RefBuild" runat="server" Width="177px" AutoPostBack="true"
                                EmptyMessage="Select Ref. build" HighlightTemplatedItems="true" EnableLoadOnDemand="true" Height="100px" 
                                DataValueField="Textcode" DataTextField="ReferenceBuildName" DataSourceID="Ds_FilterRefBuild" OnSelectedIndexChanged="RCB_RefBuild_SelectedIndexChanged">
                            </telerik:RadComboBox>
                        </div>
                        <div style="padding-top:8px">
                        <telerik:RadButton RenderMode="Lightweight" runat="server" Text="Add new panel" ID="RTB_AddUP" Width="140px" OnClick="RTB_AddUP_Click" 
                            CssClass="disabledDiv" Height="35px" Font-Size="Small"> <%--OnClientClicked="RB_AddUP_Clicked"--%>
                            <Icon PrimaryIconUrl="../../img/icon/icon_add_command.png" PrimaryHoveredIconUrl="~/img/icon/icon_add_command_Hovered.png" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                        </telerik:RadButton>
                        </div>
                    </CommandItemTemplate>
                    <Columns>
                        <telerik:GridBoundColumn DataField="RefBuild" FilterControlAltText="Filter RefBuild column" HeaderText="Reference Build" SortExpression="RefBuild" UniqueName="RefBuild">
                            <HeaderStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="UPanelName" FilterControlAltText="Filter UPanelName column" HeaderText="User Panel Name" SortExpression="UPanelName" UniqueName="UPanelName">
                            <HeaderStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="Stat" FilterControlAltText="Filter Stat column" HeaderText="Status" SortExpression="Stat" UniqueName="Stat">
                            <HeaderStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="DateAdd" DataType="System.DateTime" FilterControlAltText="Filter DateAdd column" HeaderText="Created Date" SortExpression="DateAdd" UniqueName="DateAdd" DataFormatString="{0:M/d/yyyy}">
                            <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>

                        <telerik:GridTemplateColumn UniqueName="" Groupable="False">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                            <ItemTemplate>

                                <asp:ImageButton ID="EditUPanel" BorderWidth="0px" ImageUrl="~/img/icon/icon_edit.png" Width="25px" Height="25px" CommandName="EditUP"
                                    runat="server" ToolTip="Edit"></asp:ImageButton>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                    </Columns>
                    <PagerStyle AlwaysVisible="True"></PagerStyle>
                </MasterTableView>
                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <ClientSettings EnableRowHoverStyle="true">
                    <Selecting AllowRowSelect="true" />
                    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                </ClientSettings>
                <FilterMenu RenderMode="Lightweight"></FilterMenu>
                <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
            </telerik:RadGrid>

            <telerik:RadWindowManager ID="RadWindowManager2" ShowContentDuringLoad="true" RenderMode="Lightweight"
                ReloadOnShow="true" runat="server" EnableShadow="true"
                Skin="Windows7" AutoSize="false" Modal="true" VisibleStatusbar="false" VisibleTitlebar="false">
                <Windows>
                    <telerik:RadWindow ID="RadWindow2" runat="server" RenderMode="Lightweight" BorderStyle="None" BorderWidth="1px" CssClass="RadWindow_Media px-0 pb-0" Modal="true" CenterIfModal="true">
                    </telerik:RadWindow>
                    <telerik:RadWindow RenderMode="Lightweight" runat="server" ID="RW_UPanel" Width="450" Height="515" Top="50px" Modal="true" CenterIfModal="true" OnClientClose="OnClientCloseUPanel">
                    </telerik:RadWindow>
                </Windows>
            </telerik:RadWindowManager>

            <asp:SqlDataSource ID="DS_UPanel" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommandType="StoredProcedure"
                SelectCommand="Sp_GAP_Filter_UPanel_Sel">
                <SelectParameters>
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="Ds_FilterRefBuild" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_GAP_Filter_UPanel_RefBuild_Sel"
                SelectCommandType="StoredProcedure" />

            <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

                <script>  
                    function OpenWin_CreatePanelList() {
                        var size = 80;
                        var browserWidth = $telerik.$(window).width();
                        var width = Math.ceil(browserWidth * size / 100);
                        var height = 650;
                        var oWnd = radopen("/GAP/Create_UserPanelList.aspx", "RW_UPanel");
                        oWnd.setSize(width, height);
                        oWnd.center();
                    }

                    function OpenWin_EditPanelList() {
                        var size = 80;
                        var browserWidth = $telerik.$(window).width();
                        var width = Math.ceil(browserWidth * size / 100);
                        var height = 650;
                        var oWnd = radopen("/GAP/Edit_UserPanelList.aspx", "RW_UPanel");
                        oWnd.setSize(width, height);
                        oWnd.center();
                    }

                    function OnClientCloseUPanel(oWnd, args) {

                        $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest();

                    }

                    function RB_AddUP_Clicked() {
                        var size = 80;
                        var browserWidth = $telerik.$(window).width();
                        var width = Math.ceil(browserWidth * size / 100);
                        var height = 650;
                        var oWnd = radopen("/GAP/Create_UserPanelList.aspx", "RW_UPanel");
                        oWnd.setSize(width, height);
                        oWnd.center();
                    }



                </script>
            </telerik:RadCodeBlock>

        </div>
    </section>
</div>


