<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Requests.ascx.cs" Inherits="WebGAP.GAP.uc.uc_Requests" %>


<link rel="stylesheet" type="text/css" href="../../assets/css/progress_bar_style.css" />

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="Timer1">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_Requests" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_Requests">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_Requests" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>
﻿
<asp:Timer ID="Timer1" runat="server" Interval="20000" OnTick="Timer1_Tick">
</asp:Timer>



<div class="content-header row">
    <div class="content-header-left col-md-6 col-12">
        <h3 class="content-header-title">
            <asp:PlaceHolder runat="server"><%: Page.Title %> </asp:PlaceHolder>
        </h3>
    </div>
</div>




<div class="content-body pt-1">
    <section id="basic-form-layouts">
        <div class="row match-height">
            <div class="col-12">
                <%-- <telerik:RadTabStrip ID="RadTabStrip1" SelectedIndex="0" runat="server" MultiPageID="RadMultiPage1"
                    Skin="Silk" CssClass="tabStrip" CausesValidation="False" ResolvedRenderMode="Classic">
                    <Tabs>
                        <telerik:RadTab Text="Active Requests" Enabled="true" SelectedImageUrl="../../img/icon/current_active_icon.png"
                            ImageUrl="../../img/icon/current_normal_icon.png" Selected="True" Width="50%">
                        </telerik:RadTab>
                        <telerik:RadTab Text="History" Enabled="true" SelectedImageUrl="../../img/icon/history_active_icon.png"
                            ImageUrl="../../img/icon/history_normal_icon.png"  Width="50%">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>--%>

                <telerik:RadTabStrip ID="RadTabStrip1" runat="server" RenderMode="Lightweight" SelectedIndex="0" MultiPageID="RadMultiPage1" Font-Bold="True"
                    CausesValidation="False" ResolvedRenderMode="Classic" ScrollChildren="True" BorderWidth="0px" Skin="Silk" Align="Justify"  >
                    <Tabs>
                        <telerik:RadTab Text="Active Requests" Enabled="true" SelectedImageUrl="../../img/icon/current_active_icon.png"
                            ImageUrl="../../img/icon/current_normal_icon.png" Selected="True" Width="50%" Height="50px">
                        </telerik:RadTab>
                        <telerik:RadTab Text="History" Enabled="true" SelectedImageUrl="../../img/icon/history_active_icon.png"
                            ImageUrl="../../img/icon/history_normal_icon.png" Width="50%" Height="50px">
                        </telerik:RadTab>

                    </Tabs>
                </telerik:RadTabStrip>

                <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" CssClass="multiPage"
                    Width="100%">
                    <telerik:RadPageView ID="RadPageView1" runat="server">
                        <div class="row col-12 pt-1">
                            <telerik:RadGrid RenderMode="Lightweight" ID="RG_Requests" runat="server" Width="100%" Height="700px" AllowSorting="True" RetainExpandStateOnRebind="true"
                                AutoGenerateColumns="False" DataSourceID="DS_Request"
                                AllowAutomaticDeletes="True"
                                RefannosolvedRenderMode="Classic" OnItemDataBound="RG_Requests_ItemDataBound" OnItemCommand="RG_Requests_ItemCommand" OnDetailTableDataBind="RG_Requests_DetailTableDataBind">
                                <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
                                <ClientSettings AllowKeyboardNavigation="true">
                                    <Selecting AllowRowSelect="false"></Selecting>
                                    <Scrolling AllowScroll="True" ScrollHeight="275px" UseStaticHeaders="True"></Scrolling>
                                </ClientSettings>
                                <MasterTableView AllowMultiColumnSorting="True" CommandItemDisplay="TopAndBottom"
                                    DataSourceID="DS_Request" DataKeyNames="RequestID,RequestTypeID" Name="Master">
                                    <CommandItemSettings ExportToPdfText="Export to PDF" AddNewRecordText="" ShowAddNewRecordButton="False"></CommandItemSettings>
                                    <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"
                                        Created="True">
                                    </ExpandCollapseColumn>



                                    <DetailTables>
                                        <telerik:GridTableView DataKeyNames="CenterID" Name="Centers" Width="100%">
                                            <Columns>
                                                <telerik:GridBoundColumn SortExpression="CenterDesc" HeaderText="CenterDesc" HeaderButtonType="TextButton"
                                                    DataField="CenterDesc">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn SortExpression="DateTimeStats" HeaderText="Date/Time Status" HeaderButtonType="TextButton"
                                                    DataField="DateTimeStats" UniqueName="DateTimeStats">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn SortExpression="CeStatdesc" HeaderText="CeStatdesc" HeaderButtonType="TextButton"
                                                    DataField="CeStatdesc" UniqueName="CeStatdesc">
                                                </telerik:GridBoundColumn>
                                            </Columns>
                                        </telerik:GridTableView>
                                    </DetailTables>





                                    <Columns>
                                        <telerik:GridBoundColumn UniqueName="RequestID" SortExpression="RequestID" HeaderText="Request ID"
                                            DataField="RequestID">
                                            <HeaderStyle Width="70px" HorizontalAlign="Center"></HeaderStyle>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="RequestType" SortExpression="RequestType" HeaderText="Request Type"
                                            DataField="RequestType">
                                            <HeaderStyle Width="70px" HorizontalAlign="Center"></HeaderStyle>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="ReferenceBuildName" SortExpression="ReferenceBuildName" HeaderText="Reference Build"
                                            DataField="ReferenceBuildName">
                                            <HeaderStyle Width="70px" HorizontalAlign="Center"></HeaderStyle>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="RequestDesc" SortExpression="RequestDesc" HeaderText="Description"
                                            DataField="RequestDesc">
                                            <HeaderStyle Width="150px" HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="DateTimeAdd" SortExpression="DateTimeAdd" HeaderText="Date/Time Submit"
                                            DataField="DateTimeAdd">
                                            <HeaderStyle Width="80px" HorizontalAlign="Center"></HeaderStyle>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="DateTimeStatus" SortExpression="DateTimeStatus" HeaderText="Date/Time Last Status"
                                            DataField="DateTimeStatus">
                                            <HeaderStyle Width="80px" HorizontalAlign="Center"></HeaderStyle>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridTemplateColumn UniqueName="tmp_progress" HeaderText="Progress">
                                            <HeaderStyle Width="80px" HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Height="35px"></ItemStyle>
                                            <ItemTemplate>
                                                <progress max="100" value='<%# Eval("progress") %>' class="html5"></progress>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="TemplateColumn5" Groupable="False" HeaderText="Status">
                                            <HeaderStyle Width="30px" HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Height="35px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:HiddenField runat="server" ID="hdn_RStatus" Value='<%# Eval("Status") %>' />
                                                <asp:ImageButton ID="RStatusBtn" BorderWidth="0px" Width="20px" Height="20px"
                                                    runat="server"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="tmp_Results" Groupable="False" HeaderText="">
                                            <HeaderStyle Width="85px" HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Height="35px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Button ID="btn_Results" runat="server" CssClass="btn btn-success dropdown-toggle btn-sm" Text="View Results" CommandName="Navigate" />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                    </Columns>
                                    <EditFormSettings>
                                        <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                                        </EditColumn>
                                    </EditFormSettings>
                                    <PagerStyle PageSizeControlType="RadComboBox"></PagerStyle>
                                </MasterTableView>
                                <FilterMenu EnableImageSprites="False">
                                </FilterMenu>
                            </telerik:RadGrid>
                            <asp:SqlDataSource ID="DS_Request" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                                SelectCommand="Sp_GAP_Active_Requests_Sel" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </telerik:RadPageView>
                    <telerik:RadPageView ID="RadPageView2" runat="server">
                        <div class="row col-12 pt-1">
                        </div>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </div>
        </div>
    </section>
</div>
