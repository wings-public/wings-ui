<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Show_GeneRelatedToHPO.ascx.cs" Inherits="WebGAP.GAP.Popup.uc_Show_GeneRelatedToHPO" %>
<style>
    .paddingL {
    padding-left:15px !important;
}
</style>
<div class="card  match-height">
    <div class="card-content  show">
        <div class="card-body">
            <div class="form">
                
                <telerik:RadGrid RenderMode="Lightweight" ID="RG_GeneRelatedToHPO" runat="server" AllowPaging="True" PageSize="7" CssClass=" pt-2 RG_Min_height"
                             CellPadding="0" DataSourceID="SDS_GeneRelatedToHPO" Width="100%" AutoGenerateColumns="False" Font-Size="Small" DataKeyNames="Gene_Symbol" >
                            <MasterTableView DataSourceID="SDS_GeneRelatedToHPO" Name="Master" DataKeyNames="Gene_Symbol">
                                <Columns>
                                    <telerik:GridTemplateColumn>
                                        <HeaderTemplate>
                                            <p runat="server">Related genes to HPO <%=  Session["HPOId_Filter"].ToString() %></p>
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

<asp:SqlDataSource ID="SDS_GeneRelatedToHPO" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_GAP_Filter_GeneRelatedToHPO" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="HPOID" SessionField="HPOId_Filter" Type="String" />
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

