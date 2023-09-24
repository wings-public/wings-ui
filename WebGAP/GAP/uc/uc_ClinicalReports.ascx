<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_ClinicalReports.ascx.cs" Inherits="WebGAP.GAP.uc.uc_ClinicalReports" %>


<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <%-- <telerik:AjaxSetting AjaxControlID="DDL_Centers">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_Centers" />
                <telerik:AjaxUpdatedControl ControlID="DDL_PIs" />
                <telerik:AjaxUpdatedControl ControlID="RG_ClincalReports" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="DDL_PIs">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_PIs" />
                <telerik:AjaxUpdatedControl ControlID="RG_ClincalReports" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>--%>
        <telerik:AjaxSetting AjaxControlID="RG_ClincalReports">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_ClincalReports" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>

<style>
    .lbl_alignment {
        vertical-align: super !important;
    }
</style>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>

<div class="content-header row">
   
<%--    <div class="content-header-right col-md-6 col-12">
        <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
            <div class="btn-group" role="group">
                <asp:DropDownList ID="DDL_Centers" runat="server" Width="150px" DataTextField="CenterDesc" DataValueField="CenterID" EnableViewState="false"
                    AutoPostBack="true" DataSourceID="Ds_Centers" AppendDataBoundItems="true"
                    class="btn btn-outline-info dropdown-toggle dropdown-menu-right mr-1 btn-sm">
                </asp:DropDownList>

                <asp:DropDownList ID="DDL_PIs" runat="server" Width="150px" DataTextField="PIName" DataValueField="PIID" DataSourceID="Ds_PIs" OnDataBound="DDL_PIs_DataBound"
                    AutoPostBack="true" class="btn btn-outline-info dropdown-toggle dropdown-menu-right mr-1 btn-sm" EnableViewState="false">
                </asp:DropDownList>


            </div>
        </div>
    </div>--%>
</div>
<div class="content-header row pt-2">
       <table style="width: 100%; background-color: lightgray">

            <tr>
                <td rowspan="2" style="width: 220px">
                    <asp:Label runat="server" ID="Sample" Text="Clinical Report " CssClass="header"> </asp:Label>
                </td>
             
                <td style="float: right; padding-right: 27px; font-size: unset; color: white; padding: 10px; display: inline-table; background-color: #5e98c4; /* margin: 6px; *//* margin-top: 6px; */margin-right: 16px;">
                    <asp:Label runat="server" ID="lbl_CenterPI">  </asp:Label>
                </td>
            </tr>

        </table>
</div>
<div class="content-body pt-1">
    <section id="basic-form-layouts">
        <div class="row match-height">
            <script type="text/javascript" id="telerikClientEvents1">
                function RG_Individualset_OnColumnMouseOut(sender, args) {
                }
            </script>

            <asp:HiddenField ID="hdn_searchReportID" runat="server" />
            <asp:HiddenField ID="hdn_searchReportType" runat="server" />
            <asp:HiddenField runat="server" ID="hdn_RowID" />
            <telerik:RadGrid RenderMode="Lightweight" ID="RG_ClincalReports" runat="server" GridLines="Both" DataSourceID="DS_ClinicalReports" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="-1" Height="700px"
                AllowPaging="True" ShowStatusBar="True" DataKeyNames="ReportID" OnItemCommand="RG_ClincalReports_ItemCommand" OnItemDataBound="RG_ClincalReports_ItemDataBound">
                <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                <MasterTableView CommandItemDisplay="Top" Name="Master" AutoGenerateColumns="false" DataKeyNames="ReportID,Report_Type, Report_Version" DataSourceID="DS_ClinicalReports"
                    NoMasterRecordsText="No records to display." ClientDataKeyNames="ReportID">
                    <GroupHeaderTemplate>
                        <asp:HiddenField runat="server" ID="hdn_Report_Type" Value='<%# Bind("Report_Type") %>' />
                        <asp:ImageButton ID="img_Report_Type" BorderWidth="0px" Width="30px" runat="server"></asp:ImageButton>
                        <asp:Label runat="server" ID="Label3" Text='<%# Eval("ReportID") %>' CssClass="lbl_alignment"></asp:Label>
                    </GroupHeaderTemplate>
                    <CommandItemTemplate>
                        <telerik:RadButton RenderMode="Lightweight" runat="server" Text="Clear Filter" ID="RTB_DeleteSearch" OnClientClicked="RB_DeleteSearch_Clicked" Height="33px" Font-Size="Smaller">
                            <Icon PrimaryIconUrl="~/img/icon/icon_search_Filter.png" PrimaryHoveredIconUrl="~/img/icon/icon_search_Filter_Hovered.png" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                        </telerik:RadButton>
                        <telerik:RadComboBox RenderMode="Lightweight" ID="RCB_searchReport" runat="server" AutoPostBack="True" DataSourceID="DS_searchReport"
                            OnClientDropDownOpened="RCB_searchReportOpening" ChangeTextOnKeyBoardNavigation="true" OnClientSelectedIndexChanged="RCB_searchReportIndexChange"
                            Width="350px" EmptyMessage="Filter by ID" CssClass="pl-0" Filter="Contains" DataTextField="Report_Info" DataValueField="ReportID">
                        </telerik:RadComboBox>
                        <telerik:RadComboBox RenderMode="Lightweight" ID="RCB_searchReportType" runat="server" AutoPostBack="True" DataSourceID="DS_searchReportType"
                            OnClientDropDownOpened="RCB_searchReportTypeOpening" ChangeTextOnKeyBoardNavigation="true" OnClientSelectedIndexChanged="RCB_searchReportTypeIndexChange"
                            Width="350px" EmptyMessage="Filter by Report Type" CssClass="pl-0" Filter="Contains" DataTextField="Report_Type_Desc" DataValueField="Report_Type">
                        </telerik:RadComboBox>
                    </CommandItemTemplate>

                    <GroupByExpressions>
                        <telerik:GridGroupByExpression>
                            <SelectFields>
                                <telerik:GridGroupByField FieldName="Report_Type"></telerik:GridGroupByField>

                                <telerik:GridGroupByField FieldName="ReportID" FormatString="{0:D}" HeaderText="ReportID ID"></telerik:GridGroupByField>
                            </SelectFields>
                            <GroupByFields>
                                <telerik:GridGroupByField FieldName="ReportID" SortOrder="Ascending"></telerik:GridGroupByField>
                            </GroupByFields>
                        </telerik:GridGroupByExpression>
                    </GroupByExpressions>
                    <Columns>


                        <telerik:GridBoundColumn DataField="ReportID" DataType="System.Int64" FilterControlAltText="Filter ReportID column" HeaderText="ID" ReadOnly="True" SortExpression="ReportID" UniqueName="ReportID">
                            <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Report_Version" FilterControlAltText="Filter Report_Version column" HeaderText="Version" SortExpression="Report_Version" UniqueName="Report_Version">
                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="IndividualID" FilterControlAltText="Filter IndividualID column" HeaderText="Individual ID" ReadOnly="True" SortExpression="IndividualID" UniqueName="IndividualID">
                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="LocalID" FilterControlAltText="Filter LocalID column" HeaderText="Local ID" ReadOnly="True" SortExpression="LocalID" UniqueName="LocalID">
                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>

                        <%--<telerik:GridBoundColumn DataField="CenterID" DataType="System.Int32" FilterControlAltText="Filter CenterID column" HeaderText="CenterID" SortExpression="CenterID" UniqueName="CenterID">
                        </telerik:GridBoundColumn>--%>



                        <%--  <telerik:GridBoundColumn DataField="UserID_Generate" DataType="System.Int32" FilterControlAltText="Filter UserID_Generate column" HeaderText="UserID_Generate" SortExpression="UserID_Generate" UniqueName="UserID_Generate">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UserID_Approve" DataType="System.Int32" FilterControlAltText="Filter UserID_Approve column" HeaderText="UserID_Approve" SortExpression="UserID_Approve" UniqueName="UserID_Approve">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>--%>
                        <%-- <telerik:GridBoundColumn DataField="UserID_Change" DataType="System.Int32" FilterControlAltText="Filter UserID_Change column" HeaderText="UserID_Change" SortExpression="UserID_Change" UniqueName="UserID_Change">
                        </telerik:GridBoundColumn>--%>

                        <%-- <telerik:GridBoundColumn DataField="Message_To_PI" FilterControlAltText="Filter Message_To_PI column" HeaderText="Message_To_PI" SortExpression="Message_To_PI" UniqueName="Message_To_PI">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Message_To_User" FilterControlAltText="Filter Message_To_User column" HeaderText="Message_To_User" SortExpression="Message_To_User" UniqueName="Message_To_User">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="Date_Generate" DataType="System.DateTime" FilterControlAltText="Filter Date_Generate column" HeaderText="Date Generated" SortExpression="Date_Generate" UniqueName="Date_Generate" DataFormatString="{0:M/d/yyyy}">
                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Date_Approve" DataType="System.DateTime" FilterControlAltText="Filter Date_Approve column" HeaderText="Date Approved" SortExpression="Date_Approve" UniqueName="Date_Approve" DataFormatString="{0:M/d/yyyy}">
                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <%--  <telerik:GridBoundColumn DataField="Date_Change" DataType="System.DateTime" FilterControlAltText="Filter Date_Change column" HeaderText="Date_Change" SortExpression="Date_Change" UniqueName="Date_Change">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="Referal_MD" FilterControlAltText="Filter Referal_MD column" HeaderText="Referal MD" SortExpression="Referal_MD" UniqueName="Referal_MD">
                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn DataType="System.int32" DataField="Status" UniqueName="Status" Groupable="False" EnableHeaderContextMenu="false"
                            HeaderText="Status" FilterControlAltText="Filter Status column">
                            <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:HiddenField runat="server" ID="hdn_Status" Value='<%# Bind("Status") %>' />
                                <asp:Label ID="Status" BorderWidth="0px" runat="server"></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="ReportDescription" EditFormHeaderTextFormat="">
                            <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <asp:ImageButton ID="img_Description" runat="server" ImageUrl="../../img/icon/icon_Description.png" ToolTip="Description" CommandName="Report_Decs"></asp:ImageButton>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn>
                            <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:ImageButton ID="GoToReportItems" BorderWidth="0px" ImageUrl="~/img/icon/icon_file.png" Width="25px" Height="25px" CommandName="GoToReportItems"
                                    runat="server" ToolTip="Go To Detail"></asp:ImageButton>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn>
                            <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:ImageButton ID="Delete" BorderWidth="0px" ImageUrl="~/img/icon/icon_delete.png" Width="25px" Height="25px" CommandName="Delete"
                                    runat="server" ToolTip="Delete"></asp:ImageButton>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                    </Columns>

                    <PagerStyle AlwaysVisible="True"></PagerStyle>
                </MasterTableView>
                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <ClientSettings EnableRowHoverStyle="true">
                    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                    <Scrolling UseStaticHeaders="True" />
                    <Selecting AllowRowSelect="true"></Selecting>
                </ClientSettings>
                <FilterMenu RenderMode="Lightweight"></FilterMenu>
                <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
            </telerik:RadGrid>

        <%--    <asp:SqlDataSource ID="Ds_Centers" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_Center_Sel" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="Ds_PIs" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_PI_Sel"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                    <asp:Parameter Name="InputType" Type="Int32" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>--%>
            <asp:SqlDataSource ID="DS_searchReport" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                SelectCommand="Sp_GAP_Reports_Search" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
                    <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DS_searchReportType" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                SelectCommand="Sp_GAP_Reports_Type_Search" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
                    <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DS_ClinicalReports" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                SelectCommand="Sp_GAP_Reports_Sel" SelectCommandType="StoredProcedure">
                <SelectParameters>
                   <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32"  />
                    <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                    <asp:ControlParameter ControlID="hdn_searchReportID" Name="ReportID" Type="Int64" DefaultValue="-1" />
                    <asp:ControlParameter ControlID="hdn_searchReportType" Name="Report_Type" Type="Int64" DefaultValue="-1" />
                </SelectParameters>

            </asp:SqlDataSource>
        </div>
    </section>
</div>

<telerik:RadWindowManager ID="RadWindowManager2" ShowContentDuringLoad="true" RenderMode="Lightweight" ReloadOnShow="true" runat="server" EnableShadow="true"
    Skin="Windows7" VisibleTitlebar="true" VisibleStatusbar="true" Behaviors="Close">
    <Windows>
        <telerik:RadWindow ID="RadWindow2" VisibleTitlebar="false" runat="server" RenderMode="Lightweight" BorderStyle="None" BorderWidth="1px" CssClass="px-0 py-0" Modal="true">
        </telerik:RadWindow>


    </Windows>
</telerik:RadWindowManager>
<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <script type="text/javascript">



        function RCB_searchReportIndexChange(sender, eventArgs) {
            var grid = $find("<%= RG_ClincalReports.ClientID %>");
            var radcomboBox = $telerik.findControl(grid.get_element(), "RCB_searchReport");
            document.getElementById("<%= hdn_searchReportID.ClientID %>").value = radcomboBox.get_value();
        }

        function RCB_searchReportTypeIndexChange(sender, eventArgs) {
            var grid = $find("<%= RG_ClincalReports.ClientID %>");
            var radcomboBox = $telerik.findControl(grid.get_element(), "RCB_searchReportType");
            document.getElementById("<%= hdn_searchReportType.ClientID %>").value = radcomboBox.get_value();
        }

        function RCB_searchReportOpening() {
            var grid = $find("<%= RG_ClincalReports.ClientID %>");
            var Com = $telerik.findControl(grid.get_element(), "RCB_searchReport");
            Com.set_emptyMessage("");
            Com.clearSelection();


        }

        function RCB_searchReportTypeOpening() {
            var grid = $find("<%= RG_ClincalReports.ClientID %>");
            var Com = $telerik.findControl(grid.get_element(), "RCB_searchReportType");
            Com.set_emptyMessage("");
            Com.clearSelection();


        }

        function RB_DeleteSearch_Clicked() {
            var grid = $find("<%= RG_ClincalReports.ClientID %>");
            master = grid.get_masterTableView();
            var ComReport = $telerik.findControl(grid.get_element(), "RCB_searchReport");
            var ComReportType = $telerik.findControl(grid.get_element(), "RCB_searchReportType");
            ComReport.clearSelection();
            ComReportType.clearSelection();
            document.getElementById("<%= hdn_searchReportID.ClientID %>").value = -1;
            document.getElementById("<%= hdn_searchReportType.ClientID %>").value = -1;
            master.rebind();
        }

        function OpenWinReport_Desc() {

            var oWnd = radopen("/GAP/ReportDescription.aspx", "RadWindow2");
            oWnd.set_height(470);
            oWnd.set_width(600);
            oWnd.center();
            oWnd.set_modal(true);

        }
    </script>
</telerik:RadScriptBlock>
