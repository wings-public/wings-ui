<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_ExoneLoss_AllSamples.ascx.cs" Inherits="WebGAP.GAP.uc.uc_ExoneLoss_AllSamples" %>


<link rel="stylesheet" type="text/css" href="../../assets/css/progress_bar_style.css" />
<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_Samples_Exoneloss">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_Samples_Exoneloss" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>

<%--<div class="content-header row">
    <div class="content-header-left col-md-6 col-12">
        <h3 class="content-header-title">
            <asp:PlaceHolder runat="server"><%: Page.Title %> </asp:PlaceHolder>
        </h3>
    </div>
    <div class="content-header-right col-md-6 col-12">
        <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
            <div class="btn-group" role="group">
                <asp:DropDownList ID="DDL_Centers" runat="server" Width="150px" DataTextField="CenterDesc" DataValueField="CenterID"
                    AutoPostBack="true" DataSourceID="Ds_Centers" AppendDataBoundItems="true"
                    class="btn btn-outline-info dropdown-toggle dropdown-menu-right mr-1 btn-sm">
                    <asp:ListItem Value="-1">All Centers</asp:ListItem>
                </asp:DropDownList>

                <asp:DropDownList ID="DDL_PIs" runat="server" Width="150px" DataTextField="PIName" DataValueField="PIID" DataSourceID="Ds_PIs"
                    AutoPostBack="true" class="btn btn-outline-info dropdown-toggle dropdown-menu-right mr-1 btn-sm" AppendDataBoundItems="true" EnableViewState="false">
                    <asp:ListItem Value="-1">All PIs</asp:ListItem>
                </asp:DropDownList>
                <%--<button class="btn btn-info mr-1 ladda-button btn-sm" data-style="expand-right"><span class="ladda-label"><i class="icon-history white"></i>&nbsp;History</span></button>--%>
            </div>
        </div>
    </div>
</div>--%>

<div class="content-header row pt-2">
       <table style="width: 100%; background-color: lightgray">

            <tr>
                <td rowspan="2" style="width: 220px">
                    <asp:Label runat="server" ID="Family" Text="Family " CssClass="header"> </asp:Label>
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

            <asp:HiddenField ID="hdn_searchSampleID" runat="server" />

            <telerik:RadGrid RenderMode="Lightweight" ID="RG_Samples_Exoneloss" runat="server" GridLines="Both" OnItemCommand="RG_Samples_Exoneloss_ItemCommand" Font-Size="Smaller"
                AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="-1" Height="700px" OnItemDataBound="RG_Samples_Exoneloss_ItemDataBound"
                ShowStatusBar="True" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" 
                AllowAutomaticUpdates="True" DataSourceID="DS_Samples">
                <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                <MasterTableView CommandItemDisplay="Top" Name="Master" AutoGenerateColumns="false" DataSourceID="DS_Samples" DataKeyNames="SampleID, IndividualID"
                    ClientDataKeyNames="SampleID">
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
                       <telerik:GridBoundColumn DataField="SampleID" DataType="System.Int64" FilterControlAltText="Filter SampleID column" HeaderText="Sample ID" ReadOnly="True" SortExpression="SampleID" UniqueName="SampleID">
                            <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="IndividualID" DataType="System.Int64" FilterControlAltText="Filter IndividualID column" HeaderText="Individual ID" SortExpression="IndividualID" UniqueName="IndividualID">
                            <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
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
                         
                        <telerik:GridTemplateColumn DataType="System.int32" DataField="HasExoneLoss" UniqueName="HasExoneLoss" Groupable="False" EnableHeaderContextMenu="false" Visible="false">
                            <ItemTemplate>
                                <asp:HiddenField runat="server" ID="hdn_HasExoneLoss" Value='<%# Bind("HasExoneLoss") %>' />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="" HeaderText="Exone loss" Groupable="False">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                            <ItemTemplate>
                                <asp:ImageButton ID="GoToExoneLoss" BorderWidth="0px" ImageUrl="../../img/icon/icon-Exoneloss.png" Width="36px" Height="16px" CommandName="GoToExoneLoss"
                                    runat="server" ToolTip="Exone Loss"></asp:ImageButton>&nbsp;                                                              
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

                </Windows>
            </telerik:RadWindowManager>
            <%--<asp:SqlDataSource ID="Ds_Centers" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_Center_Sel_ForSample" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="Ds_PIs" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_PI_Sel_ForSample" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" />
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>--%>
            <asp:SqlDataSource ID="DS_searchSample" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                SelectCommand="Sp_Samples_Search" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
                    <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />

                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DS_Samples" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommandType="StoredProcedure"
                SelectCommand="Sp_Samples_Sel">
                <SelectParameters>
                    <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
                    <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                    <asp:ControlParameter ControlID="hdn_searchSampleID" Name="SampleID" Type="Int64" DefaultValue="-1" />

                </SelectParameters>
            </asp:SqlDataSource>
            <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
                <script>  
                    function RCB_searchSampleIndexChange(sender, eventArgs) {
                        var grid = $find("<%= RG_Samples_Exoneloss.ClientID %>");
                        var radcomboBox = $telerik.findControl(grid.get_element(), "RCB_searchSample");

                        document.getElementById("<%= hdn_searchSampleID.ClientID %>").value = radcomboBox.get_value();
                    }

                    function RCB_searchSampleOpening() {
                        var grid = $find("<%= RG_Samples_Exoneloss.ClientID %>");
                        var Com = $telerik.findControl(grid.get_element(), "RCB_searchSample");
                        Com.Text = string.Empty;
                        Com.clearSelection();

                    }


                    function RB_DeleteSearch_Clicked() {
                        var grid = $find("<%= RG_Samples_Exoneloss.ClientID %>");
                        master = grid.get_masterTableView();
                        var Com = $telerik.findControl(grid.get_element(), "RCB_searchSample");
                        Com.clearSelection();
                        document.getElementById("<%= hdn_searchSampleID.ClientID %>").value = -1;
                        master.rebind();
                    }


                </script>
            </telerik:RadCodeBlock>

        </div>
    </section>
</div>
