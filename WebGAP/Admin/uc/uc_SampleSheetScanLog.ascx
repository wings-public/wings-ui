<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_SampleSheetScanLog.ascx.cs" Inherits="WebGAP.Admin.uc.uc_SampleSheetScanLog" %>


<style type="text/css">
    .tttttt {
        font-size: x-large !important;
    }


    .rowColor .rgExpandCol {
        background-color: #b8e8e2 !important;
    }

    .parentRow td {
        background-color: #b8e8e2 !important;
    }

    .RadGrid table.rgMasterTable tr .rgExpandCol {
        vertical-align: top
    }
</style>
<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_SampleSheet">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_SampleSheet" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_SampleSheetLOG">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_SampleSheetLOG" />
            </UpdatedControls>
        </telerik:AjaxSetting>


    </AjaxSettings>
</telerik:RadAjaxManager>
<div class="content-header row pt-2">
    <table style="width: 100%; background-color: lightgray">

        <tr>
            <td rowspan="2" style="width: 400px">
                <h3 style="color: white; text-shadow: 2px 2px 4px #000000;">
                    <asp:Label runat="server" ID="Sample" CssClass="header" Text="Log Sample Sheet Scanning"> </asp:Label></h3>
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
                function RG_Samples_OnColumnMouseOut(sender, args) {
                }
            </script>

            <telerik:RadGrid RenderMode="Lightweight" ID="RG_SampleSheetLOG" ShowStatusBar="true" CssClass="Noborder_Clip"
                DataSourceID="SqlDataSource1" runat="server" AutoGenerateColumns="False" PageSize="10" OnItemCommand="RG_SampleSheetLOG_ItemCommand"
                AllowSorting="True" AllowMultiRowSelection="False" AllowPaging="True" GridLines="None" Height="500">
                <PagerStyle Mode="NumericPages"></PagerStyle>
                <MasterTableView EnableHierarchyExpandAll="true" DataSourceID="SqlDataSource1" DataKeyNames="LogID" AllowMultiColumnSorting="True" Name="Master">
                    <%--    <DetailTables>
                        <telerik:GridTableView EnableHierarchyExpandAll="true" DataKeyNames="LogID" DataSourceID="SqlDataSource2" Width="100%" Name="Detail"
                            runat="server">
                            <ParentTableRelation>
                                <telerik:GridRelationFields DetailKeyField="LogID" MasterKeyField="LogID"></telerik:GridRelationFields>
                            </ParentTableRelation>
                            <DetailTables>
                                <telerik:GridTableView EnableHierarchyExpandAll="true" DataKeyNames="localID" DataSourceID="SqlDataSource3" Width="100%" Name="Detaillog" 
                                    runat="server" >
                                    <ParentTableRelation>
                                        <telerik:GridRelationFields DetailKeyField="LogID" MasterKeyField="LogID"></telerik:GridRelationFields>
                                    </ParentTableRelation>
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
                                                <asp:HiddenField ID="hdn_errorType" runat="server" Value='<%# Bind("ErrorType") %>' />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="status" BorderWidth="0px" ImageUrl="../../img/icon/ReleaseSample.png" CommandName="ReportAPI" runat="server" Height="40px" Width="40" ToolTip="Release Sample"></asp:ImageButton>

                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                    </Columns>
                                    <SortExpressions>
                                        <telerik:GridSortExpression FieldName="LocalID" SortOrder="Descending"></telerik:GridSortExpression>
                                    </SortExpressions>
                                </telerik:GridTableView>
                            </DetailTables>

                            <Columns>
                                <telerik:GridBoundColumn SortExpression="LocalID" HeaderText="LocalID" HeaderButtonType="TextButton" Visible="false"
                                    DataField="LocalID" UniqueName="LocalID">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="LogID" HeaderText="Host" HeaderButtonType="TextButton" Visible="false"
                                    DataField="LogID" UniqueName="LogID">
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn>
                                    <ItemTemplate>
                                        <itemstyle verticalalign="Middle" />
                                        <asp:Label runat="server" ID-="lbl_OverallLog"></asp:Label>
                                        <asp:HiddenField runat="server" ID="hdn_OverallLog" Value='<%# Bind("OverallLog") %>' />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>

                        </telerik:GridTableView>

                    </DetailTables>--%>
                    <Columns>
                        <telerik:GridBoundColumn SortExpression="HostDesc" HeaderText="Host" HeaderButtonType="TextButton"
                            DataField="HostDesc" UniqueName="HostDesc">
                            <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn SortExpression="LogID" HeaderText="Log ID" HeaderButtonType="TextButton"
                            DataField="LogID" UniqueName="LogID">
                            <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn SortExpression="DateAdded" HeaderText="Date" HeaderButtonType="TextButton"
                            DataField="DateAdded" UniqueName="DateAdded" DataFormatString="{0:dd/MM/yyyy}">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn SortExpression="TotalSamples" HeaderText="Total Samples" HeaderButtonType="TextButton"
                            DataField="TotalSamples" UniqueName="TotalSamples">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn SortExpression="FailedSamples" HeaderText="Failed Samples" HeaderButtonType="TextButton"
                            DataField="FailedSamples" UniqueName="FailedSamples">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn SortExpression="ErrorDescription" HeaderText="Description" HeaderButtonType="TextButton"
                            DataField="ErrorDescription" UniqueName="ErrorDescription">
                            <HeaderStyle Width="35%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="35%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn>
                            <ItemTemplate>
                                <headerstyle width="5%" verticalalign="Middle" horizontalalign="Center"></headerstyle>
                                <itemstyle width="5%" verticalalign="Middle" horizontalalign="Center" />
                                <asp:ImageButton ID="status" BorderWidth="0px" ImageUrl="../../img/icon/icon_log_detail.png" CommandName="Detaillog" runat="server" Height="30px" Width="30" ToolTip="Log in detail"></asp:ImageButton>

                            </ItemTemplate>
                        </telerik:GridTemplateColumn>


                    </Columns>
                    <SortExpressions>
                        <telerik:GridSortExpression FieldName="DateAdded" SortOrder="Descending"></telerik:GridSortExpression>
                    </SortExpressions>
                </MasterTableView>
                <ClientSettings>
                    <Scrolling AllowScroll="true" UseStaticHeaders="true" SaveScrollPosition="true" />
                    <ClientEvents OnGridCreated="GridCreated" />
                    <Selecting AllowRowSelect="true" />
                </ClientSettings>
            </telerik:RadGrid>
        </div>
    </section>
</div>


<telerik:RadWindowManager ID="RadWindowManager2" ShowContentDuringLoad="true" RenderMode="Lightweight"
    ReloadOnShow="true" runat="server" EnableShadow="true"
    Skin="Windows7" AutoSize="false" Modal="true" VisibleStatusbar="false" VisibleTitlebar="false">
    <Windows>
        <telerik:RadWindow ID="RadWindow2" runat="server" RenderMode="Lightweight" BorderStyle="None" BorderWidth="1px" CssClass="RadWindow_Media px-0 pb-0" Modal="true" CenterIfModal="true">
<%--      <ScrollViewer HorizontalScrollBarVisibility="Visible" VerticalScrollBarVisibility="Visible"></ScrollViewer>--%>
            </telerik:RadWindow>

    </Windows>
</telerik:RadWindowManager>


<asp:SqlDataSource ID="DS_SamplesheetLog" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommandType="StoredProcedure" SelectCommand="Sp_SampleSheetLog_Sel">
    <SelectParameters>
        <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommandType="StoredProcedure"
    ProviderName="System.Data.SqlClient" SelectCommand="Sp_SampleSheetLog_Sel"
    runat="server">
    <SelectParameters>
        <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
        <asp:Parameter Name="LogID" DefaultValue="-1" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource2" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommandType="StoredProcedure"
    ProviderName="System.Data.SqlClient" SelectCommand="Sp_SampleSheetLog_Sel"
    runat="server">
    <SelectParameters>
        <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
        <asp:ControlParameter ControlID="RG_SampleSheetLOG" Name="logID" PropertyName="SelectedValue" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource3" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_SampleSheetLog_detail_Sel" SelectCommandType="StoredProcedure"
    runat="server">
    <SelectParameters>
        <asp:ControlParameter ControlID="RG_SampleSheetLOG" Name="logID" PropertyName="SelectedValue" />
    </SelectParameters>
</asp:SqlDataSource>

<script type="text/javascript">
    function GridCreated(sender, eventArgs) {
        //gets the main table scrollArea HTLM element  
        var scrollArea = document.getElementById(sender.get_element().id + "_GridData");
        var row = sender.get_masterTableView().get_selectedItems()[0];

        //if the position of the selected row is below the viewable grid area  
        if (row) {
            if ((row.get_element().offsetTop - scrollArea.scrollTop) + row.get_element().offsetHeight + 20 > scrollArea.offsetHeight) {
                //scroll down to selected row  
                scrollArea.scrollTop = scrollArea.scrollTop + ((row.get_element().offsetTop - scrollArea.scrollTop) +
                    row.get_element().offsetHeight - scrollArea.offsetHeight) + row.get_element().offsetHeight;
            }
            //if the position of the the selected row is above the viewable grid area  
            else if ((row.get_element().offsetTop - scrollArea.scrollTop) < 0) {
                //scroll the selected row to the top  
                scrollArea.scrollTop = row.get_element().offsetTop;
            }
        }
    }


    function OpenLog() {

        var size = 80;
        var browserWidth = $telerik.$(window).width();
        var width = Math.ceil(browserWidth * size / 100);
        var height = 750;
        var oWnd = radopen("/Admin/SamplesheetLog_detail.aspx", "RadWindow2");

        oWnd.setSize(width, height);
        oWnd.center();

        oWnd.set_modal(true);
    }


</script>
