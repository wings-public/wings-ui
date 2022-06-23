<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_OMIM_Gene.ascx.cs" Inherits="WebGAP.PhenBook.PopUp.uc_OMIM_Gene" %>
<div class="content-body pt-1">
    <div class="card-content collapse show">
        <div class="card-bodypopup">
            <form class="form">
                <div class="form-body">
                    <h4 class="form-sectionpopup"> <%=  Session["PhenBook_popUp_OMIM"].ToString() %> </h4>
                    <script type="text/javascript" id="telerikClientEvents1">
                        function RG_Individuals_OnColumnMouseOut(sender, args) {
                        }
                    </script>
                    <telerik:RadGrid RenderMode="Lightweight" ID="RG_Gene_Unique" runat="server" AllowPaging="True" Height="300px"
                        RetainExpandStateOnRebind="True" CellPadding="0" DataSourceID="SDS_Gene_Unique" Width="100%" PageSize="5" CssClass="RG_NO_Shadow"
                        AutoGenerateColumns="False" Font-Size="Small"
                        RefannosolvedRenderMode="Classic">
                        <MasterTableView Name="Master" DataSourceID="SDS_Gene_Unique">
                            <Columns>
                                <telerik:GridBoundColumn DataField="Gene_Symbol" FilterControlAltText="Filter Gene_Symbol column" HeaderText="Gene Symbol" SortExpression="Gene_Symbol" UniqueName="Gene_Symbol">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="center" Width="150px"></HeaderStyle>
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="center" Width="150px" />
                                </telerik:GridBoundColumn>

                            </Columns>
                        </MasterTableView>
                        <PagerStyle Mode="NextPrev" Position="Bottom"></PagerStyle>
                        <FilterMenu RenderMode="Lightweight"></FilterMenu>
                        <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                    </telerik:RadGrid>
                </div>
                <div class="form-actionspopup center">
                    <asp:Button ID="btn_cacel" Text="Cancel" runat="server" OnClientClick="CloseWindow(); return false;"
                        class="btn btn-danger mr-1 ladda-button btn-sm"></asp:Button>
                </div>
            </form>
        </div>
    </div>
</div>
<asp:SqlDataSource ID="SDS_Gene_Unique" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PhenBook_OMIM_Gene_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="OMIMID" SessionField="PhenBook_popUp_OMIM" Type="String" />
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
    </script>
</telerik:RadScriptBlock>
