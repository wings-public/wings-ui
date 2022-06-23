<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Sample_Quality.ascx.cs" Inherits="WebGAP.GAP.uc.uc_Sample_Quality" %>

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
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


<div class="content-header row pt-2">
    <table style="width: 100%; background-color: lightgray">

        <tr>
            <td rowspan="2" style="width: 220px">
                <asp:Label runat="server" ID="Sample" Text="Sample Quality" CssClass="header"> </asp:Label>
            </td>

            <td style="float: right; padding-right: 27px; font-size: unset; color: white; padding: 10px; display: inline-table; background-color: #5e98c4; /* margin: 6px; *//* margin-top: 6px; */margin-right: 16px;">
                <asp:Label runat="server" ID="lbl_CenterPI">  </asp:Label>
            </td>
        </tr>

    </table>
</div>


   <section id="basic-form-layouts">
        <div class="row match-height">
            <script type="text/javascript" id="telerikClientEvents1">
                function RG_Individualset_OnColumnMouseOut(sender, args) {
                }
            </script>

            <asp:HiddenField ID="hdn_searchSampleID" runat="server" />
            <telerik:RadGrid RenderMode="Lightweight" ID="RG_Samples_Quality" runat="server" GridLines="Both" OnItemCommand="RG_Samples_Quality_ItemCommand" Font-Size="Smaller"
                AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="-1" Height="700px" 
                ShowStatusBar="True" AllowAutomaticDeletes="True" AllowAutomaticInserts="True"
                AllowAutomaticUpdates="True" DataSourceID="DS_Samples">
                <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                <MasterTableView CommandItemDisplay="Top" Name="Master" AutoGenerateColumns="false" DataKeyNames="SampleID" DataSourceID="DS_Samples" ClientDataKeyNames="SampleID">
                   <CommandItemTemplate>
                        <telerik:RadButton RenderMode="Lightweight" runat="server" Text="Clear Filter" ID="RTB_DeleteSearch" OnClientClicked="RB_DeleteSearch_Clicked"  Height="33px" Font-Size="Smaller">
                            <Icon PrimaryIconUrl="~/img/icon/icon_search_Filter.png" PrimaryHoveredIconUrl="~/img/icon/icon_search_Filter_Hovered.png" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                        </telerik:RadButton>
                        <telerik:RadComboBox RenderMode="Lightweight" ID="RCB_searchSample" runat="server" AutoPostBack="True" DataSourceID="DS_searchSample"
                            OnClientDropDownOpened="RCB_searchSampleOpening" ChangeTextOnKeyBoardNavigation="true" OnClientSelectedIndexChanged="RCB_searchSampleIndexChange" 
                            Width="350px"  EmptyMessage="Filter by ID and Local ID" CssClass="pl-0" Filter="Contains" DataTextField="Sample_Info" DataValueField="SampleID">
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
                        <telerik:GridBoundColumn DataField="SampleTypeName" FilterControlAltText="Filter SampleTypeName column" HeaderText="Type" SortExpression="SampleTypeName" UniqueName="SampleTypeName">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SeqTypeName" FilterControlAltText="Filter SeqTypeName column" HeaderText="Seq. Type" SortExpression="SeqTypeName" UniqueName="SeqTypeName">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SeqMachineName" FilterControlAltText="Filter SeqMachineName column" HeaderText="Seq. Machine" SortExpression="SeqMachineName" UniqueName="SeqMachineName">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SeqKitModelName" FilterControlAltText="Filter SeqKitModelName column" HeaderText="Seq. Kit Model" SortExpression="SeqKitModelName" UniqueName="SeqKitModelName">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SeqTargetCov" FilterControlAltText="Filter SeqTargetCov column" HeaderText="Coverage" SortExpression="SeqTargetCov" UniqueName="SeqTargetCov">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SeqTargetReadLen" DataType="System.Int32" FilterControlAltText="Filter SeqTargetReadLen column" HeaderText="Read Lenght" SortExpression="SeqTargetReadLen" UniqueName="SeqTargetReadLen">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SeqDate" DataType="System.DateTime" FilterControlAltText="Filter SeqDate column" HeaderText="Seq. Date" SortExpression="SeqDate" UniqueName="SeqDate" DataFormatString="{0:M/d/yyyy}">

                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>

                        <telerik:GridTemplateColumn UniqueName="TemplateColumn5" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                            <HeaderStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                            <ItemTemplate>
                                <asp:ImageButton ID="GoToQuality" BorderWidth="0px" ImageUrl="../../img/icon/icon_quality.png" Width="30px" Height="30px" CommandName="GoToQuality"
                                    runat="server" ToolTip="Quality"></asp:ImageButton>
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

            <telerik:RadWindowManager RenderMode="Lightweight" ID="RadWindowManager1" ShowContentDuringLoad="false" 
                ReloadOnShow="true" runat="server" EnableShadow="true"  Skin="Windows7">
                <Windows>
                    <telerik:RadWindow RenderMode="Lightweight" ID="RadWindow1" runat="server" BorderStyle="None" BorderWidth="1px" CssClass="px-0 pb-0" >
                    </telerik:RadWindow>
                </Windows>
            </telerik:RadWindowManager>

              <asp:SqlDataSource ID="DS_searchSample" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                SelectCommand="Sp_Samples_Search" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32"  />
                    <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />

                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DS_Samples" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommandType="StoredProcedure" SelectCommand="Sp_Samples_Sel">
                <SelectParameters>
                    <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32"  />
                    <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                    <asp:ControlParameter ControlID="hdn_searchSampleID" Name="SampleID" Type="Int64" DefaultValue="-1" />

                </SelectParameters>
            </asp:SqlDataSource>
            <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
                <script>  


                    function openWinquality() {
                         var h = $(document).height();
                         var w = $(document).width();
                        

                        var oWnd = radopen("/GAP/QualityControl.aspx", "RadWindow1");
                        oWnd.set_height(0.90 * h);
                        oWnd.set_width(0.90 * w);
                        oWnd.center();

                        oWnd.set_modal(true);
                    }

                      function RCB_searchSampleIndexChange(sender, eventArgs) {
                        var grid = $find("<%= RG_Samples_Quality.ClientID %>");
                        var radcomboBox = $telerik.findControl(grid.get_element(), "RCB_searchSample");

                        document.getElementById("<%= hdn_searchSampleID.ClientID %>").value = radcomboBox.get_value();
                    }

                    function RCB_searchSampleOpening() {
                        var grid = $find("<%= RG_Samples_Quality.ClientID %>");
                        var Com = $telerik.findControl(grid.get_element(), "RCB_searchSample");
                          Com.set_emptyMessage(""); 
                        Com.clearSelection();

                    }


                    function RB_DeleteSearch_Clicked() {
                        var grid = $find("<%= RG_Samples_Quality.ClientID %>");
                        master = grid.get_masterTableView();
                        var Com = $telerik.findControl(grid.get_element(), "RCB_searchSample");
                        Com.clearSelection();
                        document.getElementById("<%= hdn_searchSampleID.ClientID %>").value = -1;
                        master.rebind();
                    }

                    function openWin(SampleID) {
                        alert(SampleID);
                        if (Center === '-1') {
                            return confirm("Select a center first!");
                        }
                        if (PI === '-1') {
                            return confirm("Select a PI first!");
                        }

                        var oWnd = radopen("/GAP/Upload_QualityFile.aspx?SampleID=" + SampleID, "RadWindow2");
                        // var h = $(document).height();
                        // var w = $(document).width();
                        //  oWnd.set_height(0.47 * h);
                        //  oWnd.set_width(0.5 * w);
                        oWnd.center();
                        oWnd.set_modal(true);
                    }
                </script>
            </telerik:RadCodeBlock>




        </div>
    </section>
</div>
