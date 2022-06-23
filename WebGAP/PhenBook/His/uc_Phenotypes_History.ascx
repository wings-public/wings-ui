<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Phenotypes_History.ascx.cs" Inherits="WebGAP.PhenBook.His.uc_Phenotypes_History" %>




<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_Phenotypes_History">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_Phenotypes_History" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>

<div class="content-body pt-1">
    <div class="card-content collapse show">
        <div class="card-bodypopup">
            <form class="form">
                <div class="form-body">
                    <%--<h4 class="form-sectionpopup">Individual ID <%=  Session["IndividualID"].ToString() %> </h4>--%>
                    <script type="text/javascript" id="telerikClientEvents1">
                        function RG_Individuals_OnColumnMouseOut(sender, args) {
                        }
                    </script>

                        <telerik:RadGrid RenderMode="Lightweight" ID="RG_Phenotypes_History" runat="server" DataSourceID="DS_RG_Phenotypes_History"
                            CellSpacing="-1" GridLines="Both" OnItemDataBound="RG_Phenotypes_History_ItemDataBound" Height="700" Font-Size="Small" CssClass="Noborder_Clip">
                            <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                            <MasterTableView DataSourceID="DS_RG_Phenotypes_History" AutoGenerateColumns="False">
                                <GroupByExpressions>
                                    <telerik:GridGroupByExpression>
                                        <SelectFields>
                                             <telerik:GridGroupByField FieldName="HPOID"  FormatString="{0:D}" HeaderText="HPO ID"></telerik:GridGroupByField>
                                            <telerik:GridGroupByField FieldName="HPO_Name" HeaderText="Name"></telerik:GridGroupByField>
                                        </SelectFields>
                                        <GroupByFields>
                                            <telerik:GridGroupByField FieldName="HPOID" SortOrder="Ascending"></telerik:GridGroupByField>
                                        </GroupByFields>
                                    </telerik:GridGroupByExpression>
                                </GroupByExpressions>
                                <Columns>
                                    <telerik:GridTemplateColumn DataType="System.int32" DataField="HPO_Status" UniqueName="HPO_Status" Groupable="False" EnableHeaderContextMenu="false"
                                        HeaderText="Status" FilterControlAltText="Filter HPO_Status column">
                                        <HeaderStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:HiddenField runat="server" ID="hdn_Status" Value='<%# Bind("HPO_Status") %>' />
                                            <asp:ImageButton ID="Statusbtn" BorderWidth="0px" Width="20px" runat="server"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="HPO Severity">
                                        <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                               <ItemTemplate>
                                        <asp:HiddenField runat="server" ID="hdn_Severity" Value='<%# Bind("HPO_Severity") %>' />
                                        <asp:Label runat="server" ID="lbl_severity"></asp:Label>
                                                   </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="UserName_insert" DataType="System.String" FilterControlAltText="Filter UserName_insert column" HeaderText="User ID" SortExpression="UserName_insert" UniqueName="UserName_insert">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="DateAdd" DataType="System.DateTime" FilterControlAltText="Filter DateAdd column" HeaderText="DateAdd" SortExpression="DateAdd" UniqueName="DateAdd" DataFormatString="{0:d}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="UserName_Update" FilterControlAltText="Filter UserName_Update column" HeaderText="User Updated" SortExpression="UserName_Update" UniqueName="UserName_Update">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="DateUpdate" DataType="System.DateTime" FilterControlAltText="Filter DateUpdate column" HeaderText="DateUpdate" SortExpression="DateUpdate" UniqueName="DateUpdate" DataFormatString="{0:d}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Operation" FilterControlAltText="Filter Operation column" HeaderText="Operation" SortExpression="Operation" UniqueName="Operation">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>

                            <FilterMenu RenderMode="Lightweight"></FilterMenu>
                             <ClientSettings EnableRowHoverStyle="true" EnablePostBackOnRowClick="true">
                            <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                        </ClientSettings>
                            <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                        </telerik:RadGrid>
                </div>
                <div class="form-actionspopup center">
                    <asp:Button ID="btn_cacel" Text="Close" runat="server" OnClientClick="CloseWindow(); return false;"
                        class="btn btn-danger mr-1 ladda-button btn-sm"></asp:Button>
                </div>
            </form>
        </div>
    </div>
</div>
<asp:SqlDataSource ID="DS_RG_Phenotypes_History" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_His_PhenBook_Individual_HPOs_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="IndividualID" SessionField="IndividualID" Type="Int64" />
         <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
         <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
        <asp:SessionParameter Name="HostID" SessionField="HostID" Type="Int32" />
    </SelectParameters>

</asp:SqlDataSource>

<telerik:RadScriptBlock runat="server" ID="RadScriptBlock1">
    <script>
        function GetRadWindow() {
            var oWindow = null;
            if (window.radWindow) oWindow = window.radWindow;
            else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
            return oWindow;
        }
        function CloseWindow() {
            var oWindow = GetRadWindow();  //Obtaining a reference to the current window 
            oWindow.Close();
        }

      function pageLoad() {

          var h = $(document).height();
          var w = $(document).width();

          var RG_Phenotypes_History = $find("<%=RG_Phenotypes_History.ClientID%>");
           var masterTableView = RG_Phenotypes_History.get_masterTableView();
          var NewH = 0.85 * h;
          if (NewH < 730)
          masterTableView.set_pageSize(5);
          RG_Phenotypes_History.get_element().style.height = NewH + "px"; 

        }

   
 
    </script>
</telerik:RadScriptBlock>
