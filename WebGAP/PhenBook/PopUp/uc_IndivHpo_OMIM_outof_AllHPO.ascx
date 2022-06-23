<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_IndivHpo_OMIM_outof_AllHPO.ascx.cs" Inherits="WebGAP.PhenBook.PopUp.uc_IndivHpo_OMIM_outof_AllHPO" %>


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
                    <telerik:RadGrid RenderMode="Lightweight" ID="RG_OMIM_HPO" runat="server" AllowPaging="True" Height="300px"
                        RetainExpandStateOnRebind="True" CellPadding="0" DataSourceID="SDS_OMIM_Unique" Width="100%" PageSize="5" CssClass="RG_NO_Shadow"
                        AutoGenerateColumns="False" Font-Size="Small" OnItemDataBound="RG_OMIM_HPO_ItemDataBound"
                        RefannosolvedRenderMode="Classic">
                        <MasterTableView Name="Master" DataSourceID="SDS_OMIM_Unique">
                            <Columns>
                                <telerik:GridBoundColumn DataField="HPOID" FilterControlAltText="Filter HPOID column" HeaderText="HPO id" SortExpression="HPOID" UniqueName="HPOID">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="center" Width="110px"></HeaderStyle>
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="center" Width="110px" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="HPO_Name" FilterControlAltText="Filter HPO_Name column" HeaderText="HPO Name" SortExpression="HPO_Name" UniqueName="HPO_Name">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="left"></HeaderStyle>
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="left" />
                                </telerik:GridBoundColumn>
                               <telerik:GridTemplateColumn DataField="exist">
                                   <ItemTemplate>
                                   <asp:HiddenField ID="hdn_exist" runat="server" Value='<%# Bind("exist") %>' />
                                   <asp:ImageButton Visible="false"  ID="AA_yes" ImageUrl="/img/icon/icon_yes_selected.png" BorderWidth="0px" runat="server" Height="15px"></asp:ImageButton>
                                   </ItemTemplate>
                               </telerik:GridTemplateColumn>

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
<asp:SqlDataSource ID="SDS_OMIM_Unique" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PhenBook_Individual_HPOs_OMIM_outof_all_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
         <asp:SessionParameter Name="IndividualID" SessionField="IndividualID" Type="Int64" />
        <asp:SessionParameter Name="OMIMID" SessionField="PhenBook_popUp_OMIM" Type="String" />
         <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterID" Type="Int32" />
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
    </script>
</telerik:RadScriptBlock>
