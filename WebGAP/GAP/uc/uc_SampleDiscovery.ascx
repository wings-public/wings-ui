<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_SampleDiscovery.ascx.cs" Inherits="WebGAP.GAP.uc.uc_SampleDiscovery" %>

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <%--<telerik:AjaxSetting AjaxControlID="DDL_Centers">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_Centers" />
                <telerik:AjaxUpdatedControl ControlID="DDL_PIs" />
                <telerik:AjaxUpdatedControl ControlID="RG_IndividualSample" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="DDL_PIs">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_PIs" />
                <telerik:AjaxUpdatedControl ControlID="RG_IndividualSample" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>--%>
        <telerik:AjaxSetting AjaxControlID="RG_IndividualSample">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_IndividualSample" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>

    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel2" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>

<div class="content-header row pt-2">
    <table style="width: 100%; background-color: lightgray">
        <tr>
            <td rowspan="2" style="width: 220px">
                <h4 style="margin-bottom: 1px; color: white; text-shadow: 1px 1px 1px #444;">
                    <asp:Label runat="server" ID="Sample" Text="Sample Discovery" CssClass="header"> </asp:Label></h4>
            </td>

            <td style="float: right; padding-right: 27px; font-size: unset; color: white; padding: 10px; display: inline-table; background-color: #5e98c4; /* margin: 6px; *//* margin-top: 6px; */margin-right: 16px;">
                <asp:Label runat="server" ID="lbl_CenterPI">  </asp:Label>
            </td>
        </tr>

    </table>
</div>
<div class="content-body pt-1">
    <div class="row match-height">
        <script type="text/javascript" id="telerikClientEvents1">
            function RG_IndividualSample_OnColumnMouseOut(sender, args) {
            }
        </script>
        <asp:HiddenField ID="hdn_searchIndividualID" runat="server" />

        <telerik:RadGrid RenderMode="Lightweight" ID="RG_IndividualSample" ShowStatusBar="true" OnItemCommand="RG_IndividualSample_ItemCommand"
            DataSourceID="DS_IndividualSample" runat="server" AutoGenerateColumns="False" PageSize="7" OnPreRender="RG_IndividualSample_PreRender" 
            AllowSorting="True" AllowMultiRowSelection="False" AllowPaging="True" GridLines="None" OnItemDataBound="RG_IndividualSample_ItemDataBound">
            <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
            <MasterTableView CommandItemDisplay="Top" EnableHierarchyExpandAll="true" DataSourceID="DS_IndividualSample" DataKeyNames="IndividualID,HostID" AllowMultiColumnSorting="True">
                <CommandItemTemplate>

                    <telerik:RadButton RenderMode="Lightweight" runat="server" Text="Clear Filter" ID="RTB_DeleteSearch" AutoPostBack="True" OnClick="RTB_DeleteSearch_Click" Height="33px" Font-Size="Smaller">
                        <Icon PrimaryIconUrl="~/img/icon/icon_search_Filter.png" PrimaryHoveredIconUrl="~/img/icon/icon_search_Filter_Hovered.png" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                    </telerik:RadButton>
                    <telerik:RadComboBox RenderMode="Lightweight" ID="RCB_searchIndividual" runat="server" AutoPostBack="true" DataSourceID="DS_searchIndivitual"
                       ChangeTextOnKeyBoardNavigation="true" OnSelectedIndexChanged="RCB_searchIndividual_SelectedIndexChanged" OnPreRender="RCB_searchIndividual_PreRender"  
                        Width="350px" Height="150px" EmptyMessage="Filter by Individual ID or Local ID" CssClass="pl-0" Filter="Contains" DataTextField="Individual_Info" DataValueField="IndividualID">
                    </telerik:RadComboBox>
          
                </CommandItemTemplate>
                <DetailTables>
                    <telerik:GridTableView Name="DetailTableView1" EnableHierarchyExpandAll="true" DataKeyNames="SampleID" DataSourceID="Ds_Samples" Width="100%"
                        runat="server">
                        <ParentTableRelation>
                            <telerik:GridRelationFields DetailKeyField="IndividualID" MasterKeyField="IndividualID"></telerik:GridRelationFields>
                        </ParentTableRelation>
                        <DetailTables>
                            <telerik:GridTableView EnableHierarchyExpandAll="true" DataKeyNames="SampleID,SampleFileID,ReferenceBuildName" DataSourceID="Ds_SampleFiles" Width="100%"
                                runat="server">
                                <ParentTableRelation>
                                    <telerik:GridRelationFields DetailKeyField="SampleID" MasterKeyField="SampleID"></telerik:GridRelationFields>
                                </ParentTableRelation>
                                <Columns>
                                    <telerik:GridBoundColumn SortExpression="SampleFileID" HeaderText="SampleFileID" HeaderButtonType="TextButton"
                                        DataField="SampleFileID" UniqueName="SampleFileID">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn SortExpression="FileTypeName" HeaderText="FileTypeName" HeaderButtonType="TextButton"
                                        DataField="FileTypeName" UniqueName="FileTypeName">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn SortExpression="ReferenceBuildName" HeaderText="ReferenceBuildName" HeaderButtonType="TextButton"
                                        DataField="ReferenceBuildName" UniqueName="ReferenceBuildName">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn SortExpression="StatusDescription" HeaderText="StatusDescription" HeaderButtonType="TextButton"
                                        DataField="StatusDescription" UniqueName="StatusDescription">
                                    </telerik:GridBoundColumn>
                                <%--    <telerik:GridBoundColumn SortExpression="Activated" HeaderText="Activated" HeaderButtonType="TextButton"
                                        DataField="Activated" UniqueName="Activated">
                                    </telerik:GridBoundColumn>--%>
                                    <telerik:GridTemplateColumn UniqueName="TemplateColumn5" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                        <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="GoSampleDiscovery" BorderWidth="0px" ImageUrl="../../img/icon/icon_quality.png" Width="30px" Height="30px" CommandName="Navigate"
                                                runat="server" ToolTip="Sample Discovery"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                                <SortExpressions>
                                    <telerik:GridSortExpression FieldName="SampleID" SortOrder="Ascending"></telerik:GridSortExpression>
                                </SortExpressions>
                            </telerik:GridTableView>
                        </DetailTables>
                        <Columns>
                            <telerik:GridBoundColumn SortExpression="SampleID" HeaderText="SampleID" HeaderButtonType="TextButton"
                                DataField="SampleID" UniqueName="SampleID">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SampleTypeName" FilterControlAltText="Filter SampleTypeName column" HeaderText="Sample Type" SortExpression="SampleTypeName" UniqueName="SampleTypeName">
                                <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SeqTypeName" FilterControlAltText="Filter SeqTypeName column" HeaderText="Seq. Type" SortExpression="SeqTypeName" UniqueName="SeqTypeName">
                                <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SeqMachineName" FilterControlAltText="Filter SeqMachineName column" HeaderText="Seq. Machine" SortExpression="SeqMachineName" UniqueName="SeqMachineName">
                                <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SeqKitModelName" FilterControlAltText="Filter SeqKitModelName column" HeaderText="Seq. Kit Model" SortExpression="SeqKitModelName" UniqueName="SeqKitModelName">
                                <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SeqTargetCov" FilterControlAltText="Filter SeqTargetCov column" HeaderText="Coverage" SortExpression="SeqTargetCov" UniqueName="SeqTargetCov">
                                <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SeqTargetReadLen" DataType="System.Int32" FilterControlAltText="Filter Read Lenght column" HeaderText="SeqTargetReadLen" SortExpression="SeqTargetReadLen" UniqueName="SeqTargetReadLen">
                                <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SeqDate" DataType="System.DateTime" FilterControlAltText="Filter SeqDate column" HeaderText="Seq. Date" SortExpression="SeqDate" UniqueName="SeqDate" DataFormatString="{0:M/d/yyyy}">
                                <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn UniqueName="TemplateColumn5" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                                <ItemTemplate>
                                    <asp:HiddenField ID="hdn_CountImportFile" runat="server" Value='<%# Bind("CountImportFile")%>' />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            
                        </Columns>
                        <SortExpressions>
                            <telerik:GridSortExpression FieldName="SampleID"></telerik:GridSortExpression>
                        </SortExpressions>
                    </telerik:GridTableView>
                </DetailTables>
                <Columns>
                    <telerik:GridBoundColumn SortExpression="IndividualID" HeaderText="Individual ID" HeaderButtonType="TextButton"
                        DataField="IndividualID" UniqueName="IndividualID">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn SortExpression="LocalIndividualID" HeaderText="Local ID" HeaderButtonType="TextButton"
                        DataField="LocalIndividualID" UniqueName="LocalIndividualID">
                             <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle  HorizontalAlign="Center" />
                    </telerik:GridBoundColumn>

                    <telerik:GridTemplateColumn UniqueName="" Groupable="False">
                        <HeaderStyle Width="110px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton ID="GoToHPO" BorderWidth="0px" ImageUrl="../../img/icon/icon_HPO.png" Width="25px" Height="25px" CommandName="GoToHPO"
                                runat="server" ToolTip="HPO"></asp:ImageButton>&nbsp;
                                
                                            <asp:ImageButton ID="ShowPedigree" BorderWidth="0px" ImageUrl="../../img/icon/icon_pedigree.png" Width="25px" Height="25px" CommandName="ShowPedigree"
                                                runat="server" ToolTip="Go To Pedigree"></asp:ImageButton>&nbsp;
                              
                                            <%--  <asp:ImageButton ID="GoToPedigree" BorderWidth="0px" ImageUrl="../../img/icon/icon_pedigree.png" Width="25px" Height="25px" CommandName="GoToPedigree"
                                          runat="server" ToolTip="Go To Pedigree"></asp:ImageButton>--%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="tmiCom_hostId" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                <ItemTemplate>
                                    <asp:HiddenField ID="hdn_HostId" runat="server" Value='<%# Bind("HostID")%>' />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                    
                </Columns>
                <SortExpressions>
                    <telerik:GridSortExpression FieldName="IndividualID"></telerik:GridSortExpression>
                </SortExpressions>
                <PagerStyle  AlwaysVisible="True"></PagerStyle>

            </MasterTableView>
        </telerik:RadGrid>
    </div>


    <telerik:RadWindowManager ID="RadWindowManager2" ShowContentDuringLoad="true" RenderMode="Lightweight"
        ReloadOnShow="true" runat="server" EnableShadow="true"
        Skin="Windows7" AutoSize="false" Modal="true" VisibleStatusbar="false" VisibleTitlebar="false">
        <Windows>
            <telerik:RadWindow ID="RadWindow2" runat="server" RenderMode="Lightweight" BorderStyle="None" BorderWidth="1px" CssClass="RadWindow_Media px-0 pb-0" Modal="true" CenterIfModal="true">
            </telerik:RadWindow>
            <telerik:RadWindow ID="RadWindow1" runat="server" RenderMode="Lightweight" BorderStyle="None" BorderWidth="1px" CssClass="px-0 pb-0" Modal="true" CenterIfModal="true">
            </telerik:RadWindow>
        </Windows>
    </telerik:RadWindowManager>


    <asp:SqlDataSource ID="DS_IndividualSample" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommandType="StoredProcedure"
        ProviderName="System.Data.SqlClient" SelectCommand="Sp_Gap_Individuals_Sel_ForAnalysis"
        runat="server">
        <SelectParameters>
            <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
            <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
            <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterID" Type="Int32" />
            <%--<asp:Parameter Name="IndividualID" DefaultValue="-1" />--%>
            <asp:ControlParameter ControlID="hdn_searchIndividualID" Name="IndividualID" Type="Int64" DefaultValue="-1" />

        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Ds_Samples" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommandType="StoredProcedure"
        ProviderName="System.Data.SqlClient" SelectCommand="Sp_GAP_Samples_Sel_ForAnalysis"
        runat="server">
        <SelectParameters>
            <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
            <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
            <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterID" Type="Int32" />
            <asp:Parameter Name="SampleID" DefaultValue="-1" />
            <asp:ControlParameter ControlID="RG_IndividualSample" Name="IndividualID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Ds_SampleFiles" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_GAP_SamplesFiles_Sel_ForAnalysis" SelectCommandType="StoredProcedure"
        runat="server">
        <SelectParameters>
            <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
            <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
            <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterID" Type="Int32" />
            <asp:ControlParameter ControlID="RG_IndividualSample" Name="SampleID" PropertyName="SelectedValue" />

        </SelectParameters>
    </asp:SqlDataSource>

      <asp:SqlDataSource ID="DS_searchIndivitual" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                SelectCommand="Sp_Gap_Individuals_Sel_Search_ForAnalysis" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
                    <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
    
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script>  


            function RB_DeleteSearch_Clicked() {
                var grid = $find("<%= RG_IndividualSample.ClientID %>");
                        master = grid.get_masterTableView();
                        var Com = $telerik.findControl(grid.get_element(), "RCB_searchIndividual");
                        Com.clearSelection();
                        document.getElementById("<%= hdn_searchIndividualID.ClientID %>").value = -1;
                master.rebind();
            }

            function OpenWin_HPO() {
                var oWnd = radopen("/GAP/HPO_SampleDiscovery.aspx", "RadWindow2");
            }


            function openWinPedigree() {

                var h = $(document).height();
                var w = $(document).width();

                var oWnd = radopen("/PhenBook/DrawPedigree.aspx", "RadWindow1");
                oWnd.set_height(770);
                oWnd.set_width(800);
                oWnd.center();

                oWnd.set_modal(true);
            }

                </script>
    </telerik:RadCodeBlock>

</div>

