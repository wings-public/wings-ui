<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Trio_Analysises_list.ascx.cs" Inherits="WebGAP.GAP.Trio.uc.uc_Trio_Analysises_list" %>

<style>
    margin_left {
        margin-left: 3px !important;
    }
</style>
<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_Trio">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_Trio" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RCB_searchTrio">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_Trio" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        


    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>


<div class="content-header row pt-2">
    <table style="width: 100%; background-color: lightgray">

        <tr>
            <td rowspan="2" style="width: 220px">
                <asp:Label runat="server" ID="Sample" Text="Trio Analysis " CssClass="header"> </asp:Label>
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
            <asp:HiddenField ID="hdn_searchTrio" runat="server" />
            <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">

                <telerik:RadGrid RenderMode="Lightweight" ID="RG_Trio" runat="server" GridLines="Both" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="-1" Height="700px"
                    AllowPaging="True" ShowStatusBar="True" OnItemDataBound="RG_Trio_ItemDataBound" DataSourceID="DS_Trio" AllowAutomaticUpdates="True" OnItemCommand="RG_Trio_ItemCommand">
                    <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                    <MasterTableView CommandItemDisplay="Top" Name="Master" DataSourceID="DS_Trio" AutoGenerateColumns="false" NoMasterRecordsText="No records to display." DataKeyNames="FamilyID">
                        <CommandItemTemplate>
                            <%--  <a href="#" onclick="return ShowInsertForm();">Add New Record</a>--%>
                           
                            <telerik:RadButton RenderMode="Lightweight" runat="server" Text="Clear Filter" ID="RTB_DeleteSearch" OnClientClicked="RB_DeleteSearch_Clicked" Height="33px" Font-Size="Smaller">
                                <Icon PrimaryIconUrl="~/img/icon/icon_search_Filter.png" PrimaryHoveredIconUrl="~/img/icon/icon_search_Filter_Hovered.png" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                            </telerik:RadButton>
                            <telerik:RadComboBox RenderMode="Lightweight" ID="RCB_searchTrio" runat="server" AutoPostBack="True" DataSourceID="DS_searchTrio"
                                Width="350px" EmptyMessage="Filter by ID" CssClass="pl-0" Filter="Contains" DataTextField="Family_Info" DataValueField="FamilyID">
                            </telerik:RadComboBox>
                        </CommandItemTemplate>


                        <DetailTables>
                            <telerik:GridTableView EnableHierarchyExpandAll="true" Name="ChildGrid" DataKeyNames="FamilyID, TrioLocalID" DataSourceID="DS_Trio_Detail" Width="100%"
                                runat="server">
                                <ParentTableRelation>
                                    <telerik:GridRelationFields DetailKeyField="FamilyID" MasterKeyField="FamilyID"></telerik:GridRelationFields>
                                </ParentTableRelation>
                                <Columns>
                                    <telerik:GridBoundColumn SortExpression="TrioLocalID" HeaderText="Trio LocalID" HeaderButtonType="TextButton"
                                        DataField="TrioLocalID" UniqueName="TrioLocalID">
                                         <HeaderStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" ></ItemStyle>
                                    </telerik:GridBoundColumn>
                                     <telerik:GridBoundColumn SortExpression="ReferenceBuildName" HeaderText="Ref. Build" HeaderButtonType="TextButton"
                                        DataField="ReferenceBuildName" UniqueName="ReferenceBuildID">
                                          <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" ></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn SortExpression="ProbandFileID" HeaderText="Proband FileID" HeaderButtonType="TextButton"
                                        DataField="ProbandFileID" UniqueName="ProbandFileID">
                                         <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" ></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn SortExpression="FatherFileID" HeaderText="Father FileID" HeaderButtonType="TextButton"
                                        DataField="FatherFileID" UniqueName="FatherFileID">
                                         <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn SortExpression="MotherFileID" HeaderText="Mother FileID" HeaderButtonType="TextButton"
                                        DataField="MotherFileID" UniqueName="MotherFileID">
                                         <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" ></ItemStyle>
                                    </telerik:GridBoundColumn>
                                     <telerik:GridTemplateColumn HeaderText="Status">
                                          <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" ></ItemStyle>
                                         <ItemTemplate>
                                          <asp:Label ID="lbl_status" runat="server" Text='<%# Bind("TrioStatus")%>' />

                                         </ItemTemplate>
                                         </telerik:GridTemplateColumn>


                                    <telerik:GridTemplateColumn HeaderText="Seq. Type">
                                        <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# String.Concat(Eval("SeqTypeName"),Eval("PanelTypeName")) %>' />
                                             <asp:HiddenField ID="hdn_SeqType" runat="server" Value='<%# Bind("SeqTypeName")%>' />
                                            <asp:HiddenField ID="hdn_probandID" runat="server" Value='<%# Bind("ProbandID")%>' />
                                            <asp:HiddenField ID="hdn_fatherID" runat="server"  Value='<%# Bind("FatherID")%>' />
                                            <asp:HiddenField ID="hdn_motherID" runat="server"  Value='<%# Bind("MotherID")%>' />
                                             <asp:HiddenField ID="hdn_RefBuildID" runat="server"  Value='<%# Bind("ReferenceBuildID")%>' />
                                             <asp:HiddenField ID="hdn_status" runat="server"  Value='<%# Bind("TrioStatus")%>' />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn  >
                                        <HeaderStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:ImageButton ID="Trio_Count" BorderWidth="0px" ImageUrl="~/img/icon/trio1.png" Width="35px" Height="35px" CommandName="DoTrio"
                                                runat="server" ToolTip="Trio Count"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                                <SortExpressions>
                                    <telerik:GridSortExpression FieldName="FamilyID" SortOrder="Ascending"></telerik:GridSortExpression>
                                </SortExpressions>
                            </telerik:GridTableView>
                        </DetailTables>
                        <Columns>
                            <telerik:GridBoundColumn DataField="FamilyID" DataType="System.Int64" FilterControlAltText="Filter FamilyID column" HeaderText="Family ID" ReadOnly="True" SortExpression="FamilyID" UniqueName="FamilyID">
                                <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ProbandID" DataType="System.Int64" FilterControlAltText="Filter ProbandID column" HeaderText="Proband ID" ReadOnly="True" SortExpression="ProbandID" UniqueName="ProbandID">
                                <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ProbandFullName" FilterControlAltText="Filter ProbandFullName column" HeaderText="Proband Name" ReadOnly="True" SortExpression="ProbandFullName" UniqueName="ProbandFullName">
                                <HeaderStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="LocalID" FilterControlAltText="Filter LocalID column" HeaderText="Local ID" ReadOnly="True" SortExpression="LocalID" UniqueName="LocalID">
                                <HeaderStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FatherID" FilterControlAltText="Filter FatherID column" HeaderText="Father ID" ReadOnly="True" SortExpression="FatherID" UniqueName="FatherID">
                                <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="MotherID" FilterControlAltText="Filter MotherID column" HeaderText="Mother ID" ReadOnly="True" SortExpression="MotherID" UniqueName="MotherID">
                                <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                          
                            <telerik:GridTemplateColumn >
                                <HeaderStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:ImageButton ID="Family_Unregistered" BorderWidth="0px" ImageUrl="~/img/icon/trio.png" Width="30px" Height="30px" CommandName="Family_Unregistered"
                                        runat="server" ToolTip="Possible Trio Cases"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                        <SortExpressions>
                            <telerik:GridSortExpression FieldName="FamilyID"></telerik:GridSortExpression>
                        </SortExpressions>
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
            </telerik:RadAjaxPanel>
            <telerik:RadWindowManager RenderMode="Lightweight" ID="RadWindowManager2" runat="server" EnableShadow="true" VisibleTitlebar="false"  VisibleStatusbar="false">
                <Windows>
                    <telerik:RadWindow RenderMode="Lightweight" ID="UserListDialog" runat="server" Height="380px"
                        Width="393px" Left="150px" ReloadOnShow="true" ShowContentDuringLoad="false"
                        Modal="true">
                    </telerik:RadWindow>
                </Windows>
            </telerik:RadWindowManager>
            <asp:SqlDataSource ID="DS_searchTrio" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                SelectCommand="Sp_GAP_Trio_All_Search" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
                    <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DS_Trio" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                SelectCommand="Sp_GAP_Trio_All_sel" SelectCommandType="StoredProcedure">

                <SelectParameters>
                    <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
                    <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                    <asp:ControlParameter ControlID="hdn_searchTrio" Name="FamilyID" Type="Int64" DefaultValue="-1" />
                </SelectParameters>



            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DS_Trio_Detail" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                SelectCommand="Sp_GAP_Trios_Family_sel" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
                    <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                    <asp:ControlParameter ControlID="RG_Trio" Name="FamilyID" PropertyName="SelectedValue" />
                    <asp:Parameter Name="Registered" Type="Int32" DefaultValue="1" />

                </SelectParameters>



            </asp:SqlDataSource>
     </div>
    </section>
</div>



<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <script type="text/javascript">



        function ShowInsertForm() {
         <%--   var Center = $('#<%= DDL_Centers.ClientID %> option:selected').val();
                        var PI = $('#<%= DDL_PIs.ClientID %> option:selected').val();--%>

            var oWnd = radopen("Analysis_AssignFamily.aspx", "UserListDialog");
            oWnd.set_height(500);
            oWnd.set_width(1000);
            oWnd.center();
            oWnd.set_modal(true);
            return false;
        }


        function RCB_searchTrioOpening() {
            var grid = $find("<%= RG_Trio.ClientID %>");
            var Com = $telerik.findControl(grid.get_element(), "RCB_searchTrio");
            Com.set_emptyMessage("");
            Com.clearSelection();


        }

        function RB_DeleteSearch_Clicked() {
            var grid = $find("<%= RG_Trio.ClientID %>");
            master = grid.get_masterTableView();
            var Com = $telerik.findControl(grid.get_element(), "RCB_searchTrio");
            Com.clearSelection();
            document.getElementById("<%= hdn_searchTrio.ClientID %>").value = -1;
            master.rebind();
        }

    </script>
</telerik:RadScriptBlock>

