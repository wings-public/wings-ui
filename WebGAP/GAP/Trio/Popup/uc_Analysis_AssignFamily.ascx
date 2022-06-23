<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Analysis_AssignFamily.ascx.cs" Inherits="WebGAP.GAP.Trio.Popup.uc_Analysis_AssignFamily" %>




<style>
    .RadGrid_Bootstrap .rgRow > td, .RadGrid_Bootstrap .rgAltRow > td {
        border-width: 0 0 1px 0 !important;
        padding: 0 0 0 0;
        height: auto;
    }

    .RadGrid_Bootstrap .rgHeader, .RadGrid_Bootstrap .rgHeader a {
        font-weight: 600;
    }

    .RadGrid_Bootstrap .rgHeader, .RadGrid_Bootstrap th.rgResizeCol, .RadGrid_Bootstrap .rgHeaderWrapper, .RadGrid_Bootstrap .rgMultiHeaderRow th.rgHeader, .RadGrid_Bootstrap .rgMultiHeaderRow th.rgResizeCol {
        border: 0;
        border-bottom: 1px solid #740aa1 !important;
        border-top: 0;
        border-left: 0 !important;
    }

    .RadGrid .rgClipCells .rgHeader, .RadGrid .rgClipCells .rgFilterRow > td, .RadGrid .rgClipCells .rgRow > td, .RadGrid .rgClipCells .rgAltRow > td, .RadGrid .rgClipCells .rgEditRow > td, .RadGrid .rgClipCells .rgFooter > td {
        overflow: hidden;
    }
</style>
<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_Family">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_Family" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="lblError"  />
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
                    <h4 class="form-sectionpopup"><i class="ft-user"></i>Possible Trio Cases</h4>
                    <script type="text/javascript" id="telerikClientEvents1">
                        function RG_Sample_OnColumnMouseOut(sender, args) {
                        }
                    </script>
                    <asp:HiddenField ID="hdn_searchProbandID" runat="server" />
                    <telerik:RadGrid RenderMode="Lightweight" ID="RG_Family" runat="server" GridLines="Both" OnItemCommand="RG_Family_ItemCommand" 
                        AllowSorting="True" AutoGenerateColumns="False" CellSpacing="-1" Height="350px" AllowAutomaticUpdates="true"
                        ShowStatusBar="False" Font-Size="X-Small" DataSourceID="DS_Family">
                        <MasterTableView CommandItemDisplay="None" DataSourceID="DS_Family" Name="Master" AutoGenerateColumns="false" >
                           
                            <Columns>
                                <telerik:GridBoundColumn DataField="TrioLocalID" DataType="System.Int64" FilterControlAltText="Filter TrioLocalID  column" HeaderText="Trio LocalID" ReadOnly="True" SortExpression="TrioLocalID" UniqueName="TrioLocalID">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TrioStatus" FilterControlAltText="Filter TrioStatus column" HeaderText="Status" ReadOnly="True" SortExpression="TrioStatus" UniqueName="TrioStatus">
                                </telerik:GridBoundColumn>
                                
                                 <telerik:GridTemplateColumn HeaderText="Seq. Type">
                                        <HeaderStyle Width="200px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="200px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# String.Concat(Eval("SeqTypeName"),Eval("PanelTypeName")) %>' />

                                        </ItemTemplate>
                                 </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="RegisterFamily" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                    <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" Height="15px"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="RegisterFamily" BorderWidth="0px" ImageUrl="~/img/icon/icon_AddPeople.png" Width="25px" Height="25px" CommandName="insertTrio"
                                            ToolTip="Add into Analysis List"
                                            runat="server"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                            <PagerStyle AlwaysVisible="True"></PagerStyle>
                        </MasterTableView>
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                          <ClientSettings EnableRowHoverStyle="true" EnablePostBackOnRowClick="true">
                            <ClientEvents OnColumnMouseOut="RG_Sample_OnColumnMouseOut"></ClientEvents>
                            <Selecting AllowRowSelect="true" />
                            <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                        </ClientSettings>
                        <FilterMenu RenderMode="Lightweight"></FilterMenu>
                        <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                    </telerik:RadGrid>
                </div>
                <div class="form-actionspopup center" style="height: 20%">
                    <asp:Button ID="btn_cacel" Text="Close" runat="server" OnClientClick="CloseWindow(); return false;"
                        class="btn btn-danger mr-1 ladda-button btn-sm"></asp:Button>
                     <div style="text-align: center; font-size: medium; padding-top: 5px;">
                     <telerik:RadLabel  ID="lblError" runat="server" ForeColor="Red" ></telerik:RadLabel>
                        </div>
                    
                </div>
            </form>
        </div>
    </div>
</div>


<asp:SqlDataSource ID="DS_Family" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_GAP_Trios_Family_sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
       <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
           <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
           <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
           <asp:SessionParameter Name="FamilyID" SessionField="FamilyID_trio_unregisterd" Type="Int64" />
           <asp:Parameter Name="Registered" Type="Int32" DefaultValue="0" /> 
    </SelectParameters>
</asp:SqlDataSource>

<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <script type="text/javascript">

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

