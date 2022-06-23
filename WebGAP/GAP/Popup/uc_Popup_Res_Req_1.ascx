<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Popup_Res_Req_1.ascx.cs" Inherits="WebGAP.GAP.Popup.uc_Popup_Res_Req_1" %>


<style>

    .card-header h6 {
        background: #57BCCE;
        color: white;
        padding: 5px;
        box-shadow: inset 10px 10px 10px 10px rgba(0, 0, 197, 0.1);
    }

</style>


<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_Samples">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_Samples" />
                <telerik:AjaxUpdatedControl ControlID="RG_Phenotypes" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>

<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>
<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <script type="text/javascript">


        function GetRadWindow() {
            var oWindow = null;
            if (window.radWindow) oWindow = window.radWindow;
            else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
            return oWindow;
        }

        function btn_cacel_click() {
            GetRadWindow().close(0);

        }

    </script>
</telerik:RadScriptBlock>


<div class="content-body pt-1">
    <div class="card-content collapse show">
        <div class="card-bodypopup">
            <form class="form">

                <telerik:RadTabStrip ID="RS_Res_Req_1" runat="server" RenderMode="Lightweight" SelectedIndex="1" MultiPageID="MP_Res_Req_1" Width="100%" Font-Bold="True"
                    CausesValidation="False" ResolvedRenderMode="Classic" ScrollChildren="True" BorderWidth="0px" Skin="Silk">
                    <Tabs>
                        <telerik:RadTab Text="Summary" Font-Size="Medium" Selected="True">
                        </telerik:RadTab>
                        <telerik:RadTab Text="Phenotype" Font-Size="Medium">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>



                <telerik:RadMultiPage ID="MP_Res_Req_1" CssClass="RadMultiPage" runat="server" BorderWidth="0px" SelectedIndex="1" Width="100%" Height="100%" Style="overflow: hidden">

                    <telerik:RadPageView ID="RPW_Summary" runat="server" Height="900px" Width="100%">
                        <div class="content-body pt-1">
                            <div class="card-content collapse show">
                                <script type="text/javascript" id="telerikClientEvents1">
                                    function RG_ColumnMouseOut(sender, args) {
                                    }
                                </script>
                                <div class="card-bodypopup">
                                    <telerik:RadGrid RenderMode="Lightweight" ID="RG_Summary" runat="server" BorderWidth="0px" Font-Size="Small"
                                        AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" Height="690" CellSpacing="-1"
                                        ShowStatusBar="True" DataSourceID="DS_Summary">
                                        <PagerStyle Mode="NextPrevAndNumeric" AlwaysVisible="true" />
                                        <MasterTableView CommandItemDisplay="None" Name="Master" AutoGenerateColumns="false" DataSourceID="DS_Summary" DataKeyNames="CenterID">
                                            <Columns>
                                                <telerik:GridBoundColumn DataField="CenterDesc" FilterControlAltText="Filter CenterDesc column" HeaderText="Center" SortExpression="CenterDesc" UniqueName="CenterDesc">
                                                    <HeaderStyle Width="50%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Width="50%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="CountCenterSamples" DataType="System.Int32" FilterControlAltText="Filter CountCenterSamples column" HeaderText="Total Sample" ReadOnly="True" SortExpression="CountCenterSamples" UniqueName="CountCenterSamples">
                                                    <HeaderStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="CSampleshasmutation" DataType="System.Int32" FilterControlAltText="Filter CSampleshasmutation column" HeaderText="Sample has mutation" ReadOnly="True" SortExpression="CSampleshasmutation" UniqueName="CSampleshasmutation">
                                                    <HeaderStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                            </Columns>
                                            <PagerStyle AlwaysVisible="True"></PagerStyle>
                                        </MasterTableView>
                                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                        <ClientSettings EnableRowHoverStyle="true">
                                            <ClientEvents OnColumnMouseOut="RG_ColumnMouseOut"></ClientEvents>
                                            <Selecting AllowRowSelect="true" />
                                            <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                                        </ClientSettings>
                                        <FilterMenu RenderMode="Lightweight"></FilterMenu>
                                        <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                                    </telerik:RadGrid>
                                </div>

                            </div>
                        </div>
                        <asp:SqlDataSource runat="server" ID="DS_Summary" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_GAP_Data_Sharing_Sel_Pos_Summary" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                 <asp:SessionParameter Name="ReqID" SessionField="GapReqId" Type="Int64" />
                                <asp:SessionParameter Name="UID" SessionField="WiNGSMasterID" Type="Int32" />
                                <asp:SessionParameter Name="Chr" SessionField="Chr" Type="string" />
                                <asp:SessionParameter Name="Spos" SessionField="StartPos" Type="Int32" />
                                <asp:SessionParameter Name="Epos" SessionField="EndtPos" Type="Int32" />
                                <asp:SessionParameter Name="Ref" SessionField="Rfrnc" Type="string" />
                                <asp:SessionParameter Name="Alt" SessionField="Alt" Type="string" />
                               
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </telerik:RadPageView>
                    <telerik:RadPageView ID="RPW_Phenotype" runat="server">
                        <div class="card-body">
                            <div class="card-block">
                                <div class="row ">
                                    <div class="col-md-6 mt-2">
                                        <telerik:RadGrid RenderMode="Lightweight" ID="RG_Samples" DataKeyNames="IndividualID" runat="server" GridLines="None" Height="690px"
                                            AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" CellPadding="0"
                                            ShowStatusBar="True" PageSize="15" Font-Size="Small"
                                            DataSourceID="DS_samples">
                                            <MasterTableView Name="Master" DataKeyNames="IndividualID" GridLines="None" DataSourceID="DS_samples">
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="SampleID" DataType="System.Int64" FilterControlAltText="Filter SampleID column" HeaderText="Sample ID" SortExpression="SampleID" UniqueName="SampleID">
                                                        <HeaderStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="IndividualID" DataType="System.Int64" FilterControlAltText="Filter IndividualID column" HeaderText="Individual ID" SortExpression="IndividualID" UniqueName="IndividualID">
                                                        <HeaderStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="LocalID" FilterControlAltText="Filter LocalID column" HeaderText="Local ID" SortExpression="LocalID" UniqueName="LocalID">
                                                        <HeaderStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center" ></HeaderStyle>
                                                        <ItemStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                            </MasterTableView>
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                            <ClientSettings EnableRowHoverStyle="true" Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="true">
                                                <Selecting AllowRowSelect="true" />
                                                <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                                                   <ClientEvents OnColumnMouseOut="RG_ColumnMouseOut"></ClientEvents>
                                            </ClientSettings>
                                            <FilterMenu RenderMode="Lightweight"></FilterMenu>
                                            <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                                        </telerik:RadGrid>
                                      
                                    </div>
                                    <div class="col-md-6 mt-1">
                                        <div class="card-header p-0 ">
                                            <h6 class="card-title">HPO terms you have access</h6>
                                        </div>
                                        <telerik:RadGrid RenderMode="Lightweight" ID="RG_Phenotypes" runat="server" GridLines="None" DataSourceID="DS_Phenotype" Height="340px"
                                            AllowPaging="false" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" Font-Size="Small">
                                            <MasterTableView CommandItemDisplay="None" Name="Master" AutoGenerateColumns="false"
                                                DataSourceID="DS_Phenotype" GridLines="None">
                                                <Columns>
                                                    <telerik:GridTemplateColumn SortExpression="HpoID" HeaderText="Hpo Id" UniqueName="HpoID">
                                                        <HeaderStyle Width="95px" VerticalAlign="Middle" HorizontalAlign="Center" ></HeaderStyle>
                                                        <ItemStyle Width="95px" VerticalAlign="Middle"  HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="txt_phenotypeID" Text='<%# Eval("acc") %>' runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="Hpo_Desc" HeaderText="Features">
                                                        <ItemTemplate>
                                                            <asp:Label ID="txt_phenotypeDesc" Text='<%# Eval("Hpo_Desc") %>' runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                </Columns>

                                            </MasterTableView>
                                              <ClientSettings EnableRowHoverStyle="true" Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="true">
                                                <Selecting AllowRowSelect="true" />
                                                <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                                                   <ClientEvents OnColumnMouseOut="RG_ColumnMouseOut"></ClientEvents>
                                            </ClientSettings>
                                        </telerik:RadGrid>

                                        <div class="card-header p-0 mt-2">
                                            <h6 class="card-title justify-content-md-center">HPO terms you don't have access</h6>
                                        </div>
                                        <telerik:RadGrid RenderMode="Lightweight" ID="RG_Phenotype_NoAccess" runat="server" BorderWidth="0px" Width="100%"
                                            AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="-1" Height="270px" Font-Size="Small"
                                            ShowStatusBar="True" DataSourceID="DS_Phenotype_NoAccess">
                                            <ItemStyle Height="25px" CssClass="pt-0 pb-0" />
                                            <MasterTableView Width="100%" DataSourceID="DS_Phenotype_NoAccess">
                                                <Columns>
                                                    <telerik:GridTemplateColumn SortExpression="HpoID" HeaderText="Hpo Id" UniqueName="HpoID">
                                                        <HeaderStyle Width="95px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle Width="95px" VerticalAlign="Middle"  HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="txt_phenotypeID" Text='<%# Eval("acc") %>' runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="Hpo_Desc" HeaderText="Features">
                                                        <ItemTemplate>
                                                            <asp:Label ID="txt_phenotypeDesc" Text='<%# Eval("Hpo_Desc") %>' runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                </Columns>
                                            </MasterTableView>
                                            <ClientSettings ReorderColumnsOnClient="True" AllowColumnsReorder="True">
                                                <Selecting AllowRowSelect="True"></Selecting>
                                                <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                                                   <ClientEvents OnColumnMouseOut="RG_ColumnMouseOut"></ClientEvents>
                                            </ClientSettings>
                                            <GroupingSettings ShowUnGroupButton="true"></GroupingSettings>
                                            <FilterMenu RenderMode="Lightweight"></FilterMenu>
                                            <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                                        </telerik:RadGrid>

                                    </div>
                                </div>
                            </div>
                        </div>


                        <asp:SqlDataSource runat="server" ID="DS_Samples" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                            SelectCommand="SP_GAP_Data_Sharing_Sel_User_Samples" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                 <asp:SessionParameter Name="ReqID" SessionField="GapReqId" Type="Int64" />
                                <asp:SessionParameter Name="UID" SessionField="WiNGSMasterID" Type="Int32" />
                                <asp:SessionParameter Name="Chr" SessionField="Chr" Type="string" />
                                <asp:SessionParameter Name="Spos" SessionField="StartPos" Type="Int32" />
                                <asp:SessionParameter Name="Epos" SessionField="EndtPos" Type="Int32" />
                                <asp:SessionParameter Name="Ref" SessionField="Rfrnc" Type="string" />
                                <asp:SessionParameter Name="Alt" SessionField="Alt" Type="string" />
                         
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="DS_Phenotype" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                            SelectCommand="Sp_IndividualPhenotype_Desc" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="RG_Samples" Name="IndividualID" PropertyName="SelectedValue" Type="Int64" />
                                <asp:Parameter Name="Distinct" Type="Int32" DefaultValue="0" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <asp:SqlDataSource runat="server" ID="DS_Phenotype_NoAccess" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                            SelectCommand="Sp_GAP_Data_Sharing_Sel_Phenotypes_User_Not_Access" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="ReqID" SessionField="GapReqId" Type="Int64" />
                                <asp:SessionParameter Name="UID" SessionField="WiNGSMasterID" Type="Int32" />
                                <asp:SessionParameter Name="Chr" SessionField="Chr" Type="string" />
                                <asp:SessionParameter Name="Spos" SessionField="StartPos" Type="Int32" />
                                <asp:SessionParameter Name="Epos" SessionField="EndtPos" Type="Int32" />
                                <asp:SessionParameter Name="Ref" SessionField="Rfrnc" Type="string" />
                                <asp:SessionParameter Name="Alt" SessionField="Alt" Type="string" />
                             
                            </SelectParameters>
                        </asp:SqlDataSource>


<%--                        <div class="form-actionspopup center" style="height: 20%">
                            <asp:Button ID="btn_cacel" Text="Close" runat="server" OnClientClick="btn_cacel_click(); return false;"
                                class="btn btn-danger mr-1 ladda-button btn-sm"></asp:Button>
                        </div>--%>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </form>


        </div>

    </div>

</div>

