<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_PI_Sample.ascx.cs" Inherits="WebGAP.ACL.uc.uc_PI_Sample" %>


<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="DDL_Centers">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_Centers" />
                <telerik:AjaxUpdatedControl ControlID="RG_PS_PI" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_PS_Sample" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_PS_PI">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_PS_PI" />
                <telerik:AjaxUpdatedControl ControlID="RG_PS_Sample" LoadingPanelID="RadAjaxLoadingPanel1" />
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
                <telerik:RadComboBox RenderMode="Lightweight" runat="server" ID="DDL_Centers" 
                    DataTextField="CenterDesc" DataValueField="CenterID" DropDownWidth="200px" OnSelectedIndexChanged="DDL_Centers_SelectedIndexChanged"
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
                                    <telerik:RadGrid RenderMode="Lightweight" ID="RG_PS_PI" runat="server" GridLines="Both" OnPreRender="RG_PS_PI_PreRender"
                                        AllowSorting="True" AutoGenerateColumns="False" Height="700px" CellPadding="0" AllowPaging="true"
                                        ShowStatusBar="True" DataSourceID="Ds_PS_PI">
                                        <MasterTableView Name="Master" DataSourceID="Ds_PS_PI" AutoGenerateColumns="false" DataKeyNames="PIID">
                                            <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                                            <Columns>
                                                <telerik:GridBoundColumn DataField="PIID" DataType="System.Int32" FilterControlAltText="Filter PIID column" HeaderText="PIID" ReadOnly="True" SortExpression="PIID" UniqueName="PIID">
                                                    <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="PIName" FilterControlAltText="Filter PIName column" HeaderText="PIName" SortExpression="PIName" UniqueName="PIName">
                                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
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
                                <h4 class="form-section">Samples</h4>
                                <telerik:RadGrid RenderMode="Lightweight" ID="RG_PS_Sample" runat="server" GridLines="Both" AllowPaging="true"
                                    AllowSorting="True" Height="700px" CellPadding="0" ShowStatusBar="True" DataSourceID="Ds_PS_Sample">
                                    <MasterTableView Name="Master" AutoGenerateColumns="false" DataSourceID="Ds_PS_Sample" DataKeyNames="SampleID">
                                        <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                                        <Columns>
                                            <%--                                            <telerik:GridBoundColumn DataField="CenterID" DataType="System.Int32" FilterControlAltText="Filter CenterID column" HeaderText="CenterID" SortExpression="CenterID" UniqueName="CenterID">
                                                <HeaderStyle Width="50%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="50%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="CenterDesc" FilterControlAltText="Filter CenterDesc column" HeaderText="CenterDesc" SortExpression="CenterDesc" UniqueName="CenterDesc">
                                                <HeaderStyle Width="50%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="50%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                            </telerik:GridBoundColumn>--%>
                                            <telerik:GridBoundColumn DataField="SampleID" DataType="System.Int32" FilterControlAltText="Filter SampleID column" HeaderText="Sample ID" SortExpression="SampleID" UniqueName="SampleID">
                                                <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="LocalID" DataType="System.Int32" FilterControlAltText="Filter LocalID column" HeaderText="Local ID" SortExpression="LocalID" UniqueName="LocalID">
                                                <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>
                                            <%--     <telerik:GridBoundColumn DataField="PIName" FilterControlAltText="Filter PIName column" HeaderText="PI Name" SortExpression="PIName" UniqueName="PIName">
                                                <HeaderStyle  VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PIID" DataType="System.Int32" FilterControlAltText="Filter PIID column" HeaderText="PI ID" SortExpression="PIID" UniqueName="PIID">
                                                <HeaderStyle  Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle  Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>--%>
                                        </Columns>
                                    </MasterTableView>
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                    <ClientSettings EnableRowHoverStyle="true" EnablePostBackOnRowClick="true">
                                        <ClientEvents OnColumnMouseOut="OnColumnMouseOut"></ClientEvents>
                                        <Selecting AllowRowSelect="true" />
                                        <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                                    </ClientSettings>
                                    <SelectedItemStyle BackColor="Aqua"></SelectedItemStyle>

                                    <FilterMenu RenderMode="Lightweight"></FilterMenu>

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




<asp:SqlDataSource ID="Ds_Centers" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_Center_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>


<asp:SqlDataSource ID="Ds_PS_PI" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PI_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        <asp:Parameter Name="InputType" Type="Int32" DefaultValue="-1" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="Ds_PS_Sample" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_Sample_PI_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:ControlParameter ControlID="RG_PS_PI" Name="PIID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
