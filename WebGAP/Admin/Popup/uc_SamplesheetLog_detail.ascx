<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_SamplesheetLog_detail.ascx.cs" Inherits="WebGAP.Admin.Popup.uc_SamplesheetLog_detail" %>
<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_SampleSheetLOG_detail">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_SampleSheetLOG_detail" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="Notify">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_SampleSheetLOG_detail_system" LoadingPanelID="RadAjaxLoadingPanel1"/>
            </UpdatedControls>
        </telerik:AjaxSetting>
           <telerik:AjaxSetting AjaxControlID="RG_SampleSheetLOG_detail_system">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_SampleSheetLOG_detail_system" LoadingPanelID="RadAjaxLoadingPanel1"/>
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>
<style>
    #test {
        overflow: auto;
        display: grid;
    }

    .multiPage {
        overflow: auto;
        display: grid;
        padding-left:25px !important;
        padding-right:25px !important;
    }
</style>

<div class="content-header row pt-2">
    <table style="width: 100%; background-color: lightgray">
      
        <tr>

            <td colspan="3" style="width: 400px">
                <h3 style="color: white; text-shadow: 2px 2px 4px #000000; margin-left:25px">
                    <asp:Label runat="server" ID="summary" CssClass="header"> </asp:Label></h3>
            </td>
            <td>
                <asp:Button ID="btn_cancel" Text="X" runat="server" OnClientClick="btn_cacel_click(); return false;"
                    class="btn btn-danger mr-1 ladda-button btn-sm" ToolTip="Close window"></asp:Button>


            </td>
        </tr>
    </table>
</div>


<div class="card-content collapse show">
    <div class="card-bodypopup">
        <form class="form">
            <div class="form-body" id="test">
                <h4 class="form-sectionpopup"></h4>
                <div class="row">
                    <script type="text/javascript" id="telerikClientEvents1">
                        function RG_Samples_OnColumnMouseOut(sender, args) {
                        }
                    </script>



                    <div class="demo-container size-wide no-bg" runat="server" id="div_Description" style="font-size: 13px !important; margin-left: 10px; width:100%; margin-bottom:20px;">
                        <telerik:RadPanelBar RenderMode="Lightweight" runat="server" Width="98%" Skin="Metro" ExpandMode="MultipleExpandedItems" ExpandAnimation-Duration="200"
                            ExpandAnimation-Type="InExpo" CollapseAnimation-Duration="350" CollapseAnimation-Type="InExpo">
                            <Items>
                                <telerik:RadPanelItem Text="To see the summary of log, click here" runat="server" PostBack="true" Value="clps" Expanded="false" Width="100%">
                                    <ContentTemplate>
                                        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="multiPage">
                                            <telerik:RadPageView runat="server" ID="RadPageView1">
                                                <asp:Label runat="server" ID="Description" Style="margin-right: 30px; padding: 50px; margin-left: 30px; margin-bottom: 20px; font-size: small"></asp:Label>

                                            </telerik:RadPageView>
                                        </telerik:RadMultiPage>
                                    </ContentTemplate>
                                </telerik:RadPanelItem>
                            </Items>
                            <ExpandAnimation Type="Linear" />
                            <CollapseAnimation Type="Linear" />
                        </telerik:RadPanelBar>
                    </div>



                    <telerik:RadTabStrip ID="RS_RequestDatasetSample" SelectedIndex="0" runat="server" MultiPageID="RequestDatasetSample" Width="100%"
                        Align="Justify" Skin="Silk" CssClass="tabStrip" CausesValidation="False" ResolvedRenderMode="Classic">
                        <Tabs>
                            <telerik:RadTab Text="User Error" Enabled="true" SelectedImageUrl="../../img/icon/icon_user_error_selected.png" Font-Size="Medium"
                                ImageUrl="../../img/icon/icon_user_error.png" Selected="True">
                            </telerik:RadTab>
                            <telerik:RadTab Text="System Error" Enabled="true" SelectedImageUrl="../../img/icon/icon_system_error_selected.png" Font-Size="Medium"
                                ImageUrl="../../img/icon/icon_system_error.png">
                            </telerik:RadTab>
                        </Tabs>
                    </telerik:RadTabStrip>
                    <telerik:RadMultiPage ID="RequestDatasetSample" runat="server" BorderWidth="0px" SelectedIndex="0" Width="100%" Height="100%">

                        <telerik:RadPageView ID="RequestDataset" runat="server" Height="670px" Width="100%">


                            <telerik:RadGrid RenderMode="Lightweight" ID="RG_SampleSheetLOG_detail" runat="server" GridLines="Both" DataSourceID="SqlDataSource3">
                                <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                                <MasterTableView Name="Master" AutoGenerateColumns="false" DataKeyNames="LocalID" DataSourceID="SqlDataSource3" NoMasterRecordsText="No records to display.">

                                    <Columns>
                                        <telerik:GridBoundColumn SortExpression="LocalID" HeaderButtonType="TextButton" HeaderText="Local ID"
                                            DataField="LocalID" UniqueName="LocalID">
                                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn SortExpression="SeqTypeName" HeaderText="Seq. Type"
                                            DataField="SeqTypeName" UniqueName="SeqTypeName">
                                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn SortExpression="ErrorDescription" HeaderButtonType="TextButton" HeaderText="Description"
                                            DataField="ErrorDescription" UniqueName="ErrorDescription">
                                            <ItemStyle Width="70%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <HeaderStyle Width="70%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                        </telerik:GridBoundColumn>



                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>


                        </telerik:RadPageView>

                        <telerik:RadPageView ID="RequestSample" runat="server" Height="670px" Width="100%">


                            <telerik:RadGrid RenderMode="Lightweight" ID="RG_SampleSheetLOG_detail_system" runat="server" GridLines="Both" DataSourceID="SqlDataSource2"
                                OnItemCommand="RG_SampleSheetLOG_detail_system_ItemCommand" OnItemDataBound="RG_SampleSheetLOG_detail_system_ItemDataBound">
                                <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                                <MasterTableView Name="Master" AutoGenerateColumns="false" DataKeyNames="LocalID" DataSourceID="SqlDataSource2" NoMasterRecordsText="No records to display.">

                                    <Columns>
                                        <telerik:GridBoundColumn SortExpression="LocalID" HeaderButtonType="TextButton" HeaderText="Local ID"
                                            DataField="LocalID" UniqueName="LocalID">
                                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn SortExpression="SeqTypeName" HeaderText="Seq. Type"
                                            DataField="SeqTypeName" UniqueName="SeqTypeName">
                                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn SortExpression="ErrorDescription" HeaderButtonType="TextButton" HeaderText="Description"
                                            DataField="ErrorDescription" UniqueName="ErrorDescription">
                                            <ItemStyle Width="70%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <HeaderStyle Width="70%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                        </telerik:GridBoundColumn>

                                        <telerik:GridTemplateColumn>
                                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:ImageButton ID="Notify" BorderWidth="0px" ImageUrl="~/img/icon/notify_admin.png" Width="25px" Height="25px" CommandName="notifySys_admin"
                                                    runat="server" ToolTip="Notify System Admin"></asp:ImageButton>
                                                <asp:ImageButton ID="sendfeedbacktoAPI" BorderWidth="0px" ImageUrl="~/img/icon/ReleaseSample.png" Width="25px" Height="25px" CommandName="sendfeedbacktoAPI"
                                                    runat="server" ToolTip="Release Sample"></asp:ImageButton>
                                                <asp:Label runat="server" ID="lbl_errordesc"></asp:Label>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn>
                                            <ItemTemplate>
                                                <asp:HiddenField ID="hdn_SeqTypeID" runat="server" Value='<%# Bind("SeqTypeID") %>' />
                                                <asp:HiddenField ID="hdn_PanelTypeID" runat="server" Value='<%# Bind("PanelTypeID") %>' />
                                                <asp:HiddenField ID="hdn_FileTypeID" runat="server" Value='<%# Bind("FileTypeID") %>' />
                                                <asp:HiddenField ID="hdn_ReferenceBuildID" runat="server" Value='<%# Bind("ReferenceBuildID") %>' />
                                                <asp:HiddenField ID="hdn_LogID" runat="server" Value='<%# Bind("LogID") %>' />
                                                <asp:HiddenField ID="hdn_HostID" runat="server" Value='<%# Bind("HostID") %>' />
                                                <asp:HiddenField ID="hdn_errorType" runat="server" Value='<%# Bind("ErrorType") %>' />
                                                <asp:HiddenField ID="hdn_I_LocalID" runat="server" Value='<%# Bind("I_LocalID") %>' />


                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>


                        </telerik:RadPageView>
                    </telerik:RadMultiPage>

                </div>
            </div>

        </form>

    </div>
</div>

<asp:SqlDataSource ID="SqlDataSource2" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_SampleSheetLog_detail_systemError_Sel" SelectCommandType="StoredProcedure"
    runat="server">
    <SelectParameters>
        <asp:SessionParameter Name="logID" SessionField="LogID" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource3" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_SampleSheetLog_detail_UserError_Sel" SelectCommandType="StoredProcedure"
    runat="server">
    <SelectParameters>
        <asp:SessionParameter Name="logID" SessionField="LogID" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_SampleSheetLog_Sel" SelectCommandType="StoredProcedure"
    runat="server">
    <SelectParameters>
        <asp:SessionParameter Name="logID" SessionField="LogID" Type="String" />
        <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<script type="text/javascript">
    function GetRadWindow() {
        var oWindow = null;
        if (window.radWindow) oWindow = window.radWindow;
        else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
        return oWindow;
    }

    function btn_cacel_click() {
        GetRadWindow().close();

    }

    function CloseModal() {
        var oWnd = GetRadWindow();
        if (oWnd) setTimeout(function () { oWnd.close(); }, 1500);
    }





</script >

<%--                    <telerik:RadGrid RenderMode="Lightweight" ID="RG_SampleSheetLOG" ShowStatusBar="true" DataSourceID="SqlDataSource3" runat="server" AutoGenerateColumns="False" PageSize="10" 
                        AllowSorting="True" AllowMultiRowSelection="False" AllowPaging="True" GridLines="None" Height="500" OnItemCommand="RG_SampleSheetLOG_ItemCommand" OnItemDataBound="RG_SampleSheetLOG_ItemDataBound">
                        <PagerStyle Mode="NumericPages"></PagerStyle>
                        <MasterTableView EnableHierarchyExpandAll="true" DataSourceID="SqlDataSource3" DataKeyNames="localID" AllowMultiColumnSorting="True" Name="Master">

                            <Columns>
                                <telerik:GridBoundColumn SortExpression="LocalID" HeaderButtonType="TextButton" HeaderText="Local ID"
                                    DataField="LocalID" UniqueName="LocalID">
                                    <ItemStyle Width="200" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <HeaderStyle Width="200" VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="SeqTypeName" HeaderText="Seq. Type"
                                    DataField="SeqTypeName" UniqueName="SeqTypeName">
                                    <ItemStyle Width="200" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <HeaderStyle Width="200" VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="ErrorDescription" HeaderButtonType="TextButton" HeaderText="Description"
                                    DataField="ErrorDescription" UniqueName="ErrorDescription">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="ErrorType" HeaderButtonType="TextButton" HeaderText="Description"
                                    DataField="ErrorType" UniqueName="ErrorType">
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn>
                                    <ItemTemplate>
                                        <asp:HiddenField ID="hdn_SeqTypeID" runat="server" Value='<%# Bind("SeqTypeID") %>' />
                                        <asp:HiddenField ID="hdn_PanelTypeID" runat="server" Value='<%# Bind("PanelTypeID") %>' />
                                        <asp:HiddenField ID="hdn_FileTypeID" runat="server" Value='<%# Bind("FileTypeID") %>' />
                                        <asp:HiddenField ID="hdn_ReferenceBuildID" runat="server" Value='<%# Bind("ReferenceBuildID") %>' />
                                        <asp:HiddenField ID="hdn_LogID" runat="server" Value='<%# Bind("LogID") %>' />
                                        <asp:HiddenField ID="hdn_HostID" runat="server" Value='<%# Bind("HostID") %>' />
                                       
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn>
                                    <ItemTemplate>
                                         <asp:HiddenField ID="hdn_errorType" runat="server" Value='<%# Eval("ErrorType") %>' />
                                        <asp:ImageButton ID="status" BorderWidth="0px" ImageUrl="../../img/icon/ReleaseSample.png" CommandName="ReportAPI" runat="server" Height="40px" Width="40" ToolTip="Release Sample"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>

                        </MasterTableView>
                        <ClientSettings>
                            <Scrolling AllowScroll="true" UseStaticHeaders="true" SaveScrollPosition="true" />
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                    </telerik:RadGrid>--%>