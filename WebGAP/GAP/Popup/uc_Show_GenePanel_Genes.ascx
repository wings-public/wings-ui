<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Show_GenePanel_Genes.ascx.cs" Inherits="WebGAP.GAP.Popup.uc_Show_GenePanel_Genes" %>
<style>
    .paddingL {
    padding-left:15px !important;
}
</style>
<div class="card  match-height">
    <div class="card-content  show">
        <div class="card-body">
            <div class="form">
                <%--<h4 class="form-sectionpopup">Individual ID:  <%=  Session["IndividualID_For_HPO_SampleDiscovery"].ToString() %> </h4>--%>
                
                <telerik:RadGrid RenderMode="Lightweight" ID="RG_GeneList" runat="server" AllowPaging="True" PageSize="7" CssClass=" pt-2 RG_Min_height"
                             CellPadding="0" DataSourceID="SDS_GeneList" Width="100%" AutoGenerateColumns="False" Font-Size="Small" DataKeyNames="Gene_Symbol" >
                            <MasterTableView DataSourceID="SDS_GeneList" Name="Master" DataKeyNames="Gene_Symbol">
                                <Columns>
                                    <telerik:GridTemplateColumn>
                                        <HeaderTemplate>
                                            <p runat="server">Related genes to panel <%=  Session["PanelID_Name_Filter"].ToString() %></p>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbn_Gene_Symbol" CssClass="paddingL" Text='<%# Bind("Gene_Symbol") %>' AutoPostBack="true" runat="server" UniqueName="lbl_Gene_Symbol"></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                            </MasterTableView>
                            <FilterMenu RenderMode="Lightweight">
                            </FilterMenu>
                            <HeaderContextMenu RenderMode="Lightweight">
                            </HeaderContextMenu>
                            <PagerStyle Mode="NextPrev" Position="Bottom"></PagerStyle>
                        </telerik:RadGrid>
                
            </div>
        </div>
        <div class="form-actionspopup center">
            <asp:Button ID="btn_cacel" Text="Close" runat="server" OnClientClick="CloseWindow(); return false;"
                class="btn btn-danger mr-1 ladda-button btn-sm"></asp:Button>
        </div>
    </div>
</div>

<asp:SqlDataSource ID="SDS_GeneList" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_GAP_Filter_GenePanel_Genes" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="PanelID" SessionField="PanelID_Filter" Type="Int32" />
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
