<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_PI.ascx.cs" Inherits="WebGAP.ACL.uc.uc_PI" %>

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="DDL_Centers">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_Centers" />
                <telerik:AjaxUpdatedControl ControlID="RG_PI" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="RG_PI">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_PI" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>

<div class="content-header row">
    <div class="content-header-left col-md-6 col-12">
        <h3 class="content-header-title">
            <asp:PlaceHolder runat="server"><%: Page.Title %> </asp:PlaceHolder>
        </h3>
    </div>
    <div class="content-header-right col-md-6 col-12">
        <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
            <telerik:RadComboBox RenderMode="Lightweight" runat="server" ID="DDL_Centers" 
                DataTextField="CenterDesc" DataValueField="CenterID" DropDownWidth="200px"
                HighlightTemplatedItems="true" Height="140px" AutoPostBack="true" Width="100%">
                <ItemTemplate>
                    <%# DataBinder.Eval(Container, "Attributes['CenterID']")%>
                </ItemTemplate>
            </telerik:RadComboBox>
        </div>
    </div>
</div>

<div class="content-body pt-1">
    <section id="basic-form-layouts">
        <div class="row match-height">
            <script type="text/javascript" id="telerikClientEvents1">
                function RG_PIs_OnColumnMouseOut(sender, args) {
                }
            </script>
            <asp:HiddenField ID="center" runat="server" />
            <telerik:RadGrid ID="RG_PI" runat="server" RenderMode="Lightweight" GridLines="Both" DataSourceID="Ds_PI"
                Height="700px" AllowPaging="true" CssClass="RG_Padding_ACL">
                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <PagerStyle Mode="NextPrevAndNumeric" AlwaysVisible="true" />
                <MasterTableView DataSourceID="Ds_PI" AutoGenerateColumns="False">
                    <Columns>
                        <telerik:GridBoundColumn DataField="CenterID" DataType="System.Int32" FilterControlAltText="Filter CenterID column" HeaderText="Center ID" SortExpression="CenterID" UniqueName="CenterID">
                            <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="PIID" DataType="System.Int32" FilterControlAltText="Filter PIID column" HeaderText="PI ID" ReadOnly="True" SortExpression="PIID" UniqueName="PIID">
                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="PIName" FilterControlAltText="Filter PIName column" HeaderText="PI Name" SortExpression="PIName" UniqueName="PIName">
                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <ClientSettings EnableRowHoverStyle="true">
                    <ClientEvents OnColumnMouseOut="RG_PIs_OnColumnMouseOut"></ClientEvents>
                    <Selecting AllowRowSelect="true" />
                    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                </ClientSettings>
                <FilterMenu RenderMode="Lightweight"></FilterMenu>
                <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
            </telerik:RadGrid>
        </div>
    </section>
</div>


<asp:SqlDataSource ID="Ds_PI" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_PI_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        <asp:Parameter Name="InputType" Type="Int32" DefaultValue="-1" />
    </SelectParameters>
</asp:SqlDataSource>



