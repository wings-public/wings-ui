<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_PI_Individual.ascx.cs" Inherits="WebGAP.ACL.uc.uc_PI_Individual" %>


<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="DDL_Centers">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_Centers" />
                <telerik:AjaxUpdatedControl ControlID="RG_PI_PI" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_PI_Individual" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_PI_PI">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_PI_PI" />
                <telerik:AjaxUpdatedControl ControlID="RG_PI_Individual" LoadingPanelID="RadAjaxLoadingPanel1" />
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
            <div class="btn-group" role="group">
                <telerik:RadComboBox RenderMode="Lightweight" runat="server" ID="DDL_Centers" OnSelectedIndexChanged="DDL_Centers_SelectedIndexChanged" 
                DataTextField="CenterDesc" DataValueField="CenterID" DropDownWidth="200px"
                HighlightTemplatedItems="true" Height="140px" AutoPostBack="true" Width="100%">
                <ItemTemplate>
                    <%# DataBinder.Eval(Container, "Attributes['CenterID']")%>
                </ItemTemplate>
            </telerik:RadComboBox>
            </div>
        </div>
    </div>
</div>
<div class="content-body pt-1">
    <section id="basic-form-layouts">
        <div class="row match-height">
            <script type="text/javascript" id="telerikClientEvents1">
                function OnColumnMouseOut(sender, args) {
                }
            </script>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-content collapse show">
                        <div class="card-body">
                            <div class="form">
                                <div class="form-body">
                                    <h4 class="form-section">PI</h4>
                                    <telerik:RadGrid RenderMode="Lightweight" ID="RG_PI_PI" runat="server" GridLines="Both" OnPreRender="RG_PI_PI_PreRender"
                                        AllowSorting="True" AutoGenerateColumns="False" Height="630px" CellPadding="0" AllowPaging-="true"
                                        ShowStatusBar="True" DataSourceID="Ds_PI_PI" >
                                        <MasterTableView Name="Master" DataSourceID="Ds_PI_PI" AutoGenerateColumns="false" DataKeyNames="PIID">
                                         <PagerStyle Mode="NextPrevAndNumeric" AlwaysVisible="true" />
                                            <Columns>
                                                <telerik:GridBoundColumn DataField="CenterID" DataType="System.Int32" FilterControlAltText="Filter CenterID column" HeaderText="Center ID" SortExpression="CenterID" UniqueName="CenterID">
                                                    <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"  />
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="PIID" DataType="System.Int32" FilterControlAltText="Filter PIID column" HeaderText="PI ID" ReadOnly="True" SortExpression="PIID" UniqueName="PIID">
                                                    <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"  />
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="PIName" FilterControlAltText="Filter PIName column" HeaderText="PI Name" SortExpression="PIName" UniqueName="PIName">
                                                    <HeaderStyle  VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle  VerticalAlign="Middle" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                            </Columns>
                                        </MasterTableView>
                                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                        <ClientSettings EnableRowHoverStyle="true" AllowKeyboardNavigation="true" EnablePostBackOnRowClick="true">
                                            <ClientEvents OnColumnMouseOut="OnColumnMouseOut"></ClientEvents>
                                            <Selecting AllowRowSelect="true" />
                                            <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                                        </ClientSettings>
                                        <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                                    </telerik:RadGrid>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-content collapse show">
                        <div class="card-body">
                            <div class="form">
                                <h4 class="form-section">Individual</h4>
                                <telerik:RadGrid RenderMode="Lightweight" ID="RG_PI_Individual" runat="server" GridLines="Both" AllowPaging="true"
                                    AllowSorting="True" CellSpacing="0" Height="630px" CellPadding="0" ShowStatusBar="True" DataSourceID="Ds_PI_Individual">
                                    <MasterTableView Name="Master" AutoGenerateColumns="false" DataKeyNames="IndividualID" DataSourceID="Ds_PI_Individual">
                                        <PagerStyle Mode="NextPrevAndNumeric" AlwaysVisible="true" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="CenterDesc" FilterControlAltText="Filter CenterDesc column" HeaderText="Center" SortExpression="CenterDesc" UniqueName="CenterDesc">
                                                <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="IndividualID" DataType="System.Int64" FilterControlAltText="Filter IndividualID column" HeaderText="Individual ID" SortExpression="IndividualID" UniqueName="IndividualID">
                                                <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="LocalID" DataType="System.Int32" FilterControlAltText="Filter LocalID column" HeaderText="Local ID" SortExpression="LocalID" UniqueName="LocalID">
                                                <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle  VerticalAlign="Middle" HorizontalAlign="Center"/>
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PIName" FilterControlAltText="Filter PIName column" HeaderText="PIName" SortExpression="PI Name" UniqueName="PIName">
                                                <HeaderStyle  VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle  VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                    <ClientSettings EnableRowHoverStyle="true" EnablePostBackOnRowClick="true">
                                        <ClientEvents OnColumnMouseOut="OnColumnMouseOut"></ClientEvents>
                                        <Selecting AllowRowSelect="true" />
                                        <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                                    </ClientSettings>
                                    <SelectedItemStyle BackColor="Aqua"></SelectedItemStyle>
                                    <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                                </telerik:RadGrid>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<asp:SqlDataSource ID="Ds_PI_PI" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PI_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        <asp:Parameter Name="InputType" Type="Int32" DefaultValue="-1" />
</SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="Ds_PI_Individual" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_Individual_PI_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        <asp:ControlParameter ControlID="RG_PI_PI" Name="PIID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
    </SelectParameters>
</asp:SqlDataSource>

