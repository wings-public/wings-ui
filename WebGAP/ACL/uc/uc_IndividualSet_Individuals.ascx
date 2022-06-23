<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_IndividualSet_Individuals.ascx.cs" Inherits="WebGAP.ACL.uc.uc_IndividualSet_Individuals" %>

<style type="text/css">
    .RadWindow2 a.rwIcon {
        background-image: none !important;
    }

    .RadGrid_Bootstrap .rgAltRow {
        background-color: #f9f9f9;
        height: 20px;
    }
</style>
<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="DDL_Centers">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_Centers" />
                <telerik:AjaxUpdatedControl ControlID="DDL_PIs" />
                <telerik:AjaxUpdatedControl ControlID="RG_IsetI_Individualset" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_IsetI_Individuals" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_IIset_Individuals" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_IIset_Individualset" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="DDL_PIs">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_PIs" />
                <telerik:AjaxUpdatedControl ControlID="RG_IsetI_Individualset" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_IsetI_Individuals" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_IIset_Individuals" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_IIset_Individualset" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_IsetI_Individualset">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_IsetI_Individualset" />
                <telerik:AjaxUpdatedControl ControlID="RG_IsetI_Individuals" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_IIset_Individuals" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_IIset_Individuals">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_IIset_Individuals" />
                <telerik:AjaxUpdatedControl ControlID="RG_IIset_Individualset" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_IsetI_Individuals" LoadingPanelID="RadAjaxLoadingPanel1" />
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
                <asp:DropDownList ID="DDL_Centers" runat="server" Width="150px" DataTextField="CenterDesc" DataValueField="CenterID"
                    AutoPostBack="true" DataSourceID="Ds_Centers" AppendDataBoundItems="true" OnSelectedIndexChanged="DDL_Centers_SelectedIndexChanged"
                    class="btn btn-outline-info dropdown-toggle dropdown-menu-right mr-1 btn-sm">
                </asp:DropDownList>

                <asp:DropDownList ID="DDL_PIs" runat="server" Width="150px" DataTextField="PIName" DataValueField="PIID" DataSourceID="Ds_PIs" OnSelectedIndexChanged="DDL_PIs_SelectedIndexChanged"
                    AutoPostBack="true" class="btn btn-outline-info dropdown-toggle dropdown-menu-right mr-1 btn-sm" AppendDataBoundItems="true" EnableViewState="false">
                    <asp:ListItem Value="-1">All PIs</asp:ListItem>
                </asp:DropDownList>
                <%--<button class="btn btn-info mr-1 ladda-button btn-sm" data-style="expand-right"><span class="ladda-label"><i class="icon-history white"></i>&nbsp;History</span></button>--%>
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
                    <div class="card-header">
                        <h4 class="card-title">Individualset - Individuals</h4>
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body">
                            <div class="form">
                                <div class="form-body">
                                    <h4 class="form-section"><%--<img src="../../img/icon/icon_Individualset_Header.png" width="40" height="40" class="mr-1" />--%>Individualset</h4>
                                    <div class="row">
                                        <div class="form-group">
                                            <telerik:RadGrid RenderMode="Lightweight" ID="RG_IsetI_Individualset" runat="server" GridLines="Both" OnItemDataBound="RG_IsetI_Individualset_ItemDataBound"
                                                AllowSorting="True" AutoGenerateColumns="False" Height="300px" CellPadding="0" OnItemCommand="RG_IsetI_Individualset_ItemCommand" PageSize="8" AllowPaging="true"  DataKeyNames="IndividualsetID"
                                                ShowStatusBar="True" DataSourceID="DS_Individualset" Font-Size="X-Small" MasterTableView-NoDetailRecordsText="nothing">
                                                <ItemStyle Height="20px" />
                                                <MasterTableView Name="Master" AutoGenerateColumns="false" DataKeyNames="IndividualsetID,PIID,CenterID">
                                                    <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                                                    <Columns>
                                                        <telerik:GridBoundColumn UniqueName="IndividualID" DataField="IndividualID" Visible="false">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="CenterID" DataField="CenterID" Visible="false">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="IndividualsetID" DataType="System.Int32" FilterControlAltText="Filter IndividualsetID column" HeaderText="ID" ReadOnly="True" SortExpression="IndividualsetID" UniqueName="IndividualsetID">
                                                            <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="IndividualsetName" FilterControlAltText="Filter IndividualsetName column" HeaderText="Name" SortExpression="IndividualsetName" UniqueName="IndividualsetName">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="IndividualsetDesc" FilterControlAltText="Filter IndividualsetDesc column" HeaderText="Description" SortExpression="IndividualsetDesc" UniqueName="IndividualsetDesc">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridTemplateColumn DataType="System.int32" DataField="IndividualsetTypeID" UniqueName="IndividualsetTypeID" Groupable="False"
                                                            HeaderText="Type" HeaderStyle-Width="150px" FilterControlAltText="Filter IndividualsetTypeID column" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:HiddenField runat="server" ID="hdn_Type" Value='<%# Eval("IndividualsetTypeID") %>' />
                                                                <asp:ImageButton ID="Typebtn" BorderWidth="0px" Width="20px" runat="server"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn UniqueName="TemplateColumn5" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="newreq" BorderWidth="0px" ImageUrl="../../img/icon/icon_add.png" Width="15px" Height="15px" CommandName="AddIndividual"
                                                                    runat="server" ToolTip="Add Individual"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn UniqueName="delete" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="delete" BorderWidth="0px" ImageUrl="../../img/icon/icon_delete.png" Width="17px" Height="17px" ToolTip="Delete All Individuals"
                                                                    CommandName="deleteAllIndividuals" OnClientClick="return confirm('Are you sure you want to delete?')"
                                                                    runat="server"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                    </Columns>
                                                </MasterTableView>
                                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                                <ClientSettings EnableRowHoverStyle="true" AllowKeyboardNavigation="true" EnablePostBackOnRowClick="true">
                                                    <ClientEvents OnColumnMouseOut="OnColumnMouseOut"></ClientEvents>
                                                    <Selecting AllowRowSelect="true" />
                                                    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                                                </ClientSettings>
                                                <FilterMenu RenderMode="Lightweight"></FilterMenu>
                                                <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                                            </telerik:RadGrid>
                                        </div>
                                    </div>
                                    <h4 class="form-section"><%-- <img src="../../img/icon/icon_Individual_Header.png" width="35" height="35" class="mr-1" />--%>Individuals</h4>
                                    <div class="row">
                                        <div class="form-group">
                                            <telerik:RadGrid RenderMode="Lightweight" ID="RG_IsetI_Individuals" runat="server" GridLines="Both" OnItemCommand="RG_IsetI_Individuals_ItemCommand" AutoGenerateColumns="False" PageSize="10" AllowPaging="true"
                                                AllowSorting="True" Height="300px" Font-Size="X-Small" CellPadding="0" ShowStatusBar="True" DataSourceID="DS_IsetI_Individuals" MasterTableView-NoDetailRecordsText="nothing" CssClass="Hover_Selected">
                                                <ItemStyle Height="20px" />
                                                <MasterTableView Name="Master" AutoGenerateColumns="false" DataKeyNames="IndividualID">
                                                    <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                                                    <Columns>
                                                        <telerik:GridBoundColumn UniqueName="IndividualID" HeaderText="IndividualID" DataField="IndividualID" FilterControlAltText="Filter IndividualID column" SortExpression="IndividualID" DataType="System.Int64">
                                                            <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="LocalID" HeaderText="LocalID" DataField="LocalID" FilterControlAltText="Filter LocalID column" SortExpression="LocalID" DataType="System.Int32">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="IndividualCenterDesc" HeaderText="Center" DataField="IndividualCenterDesc" FilterControlAltText="Filter IndividualCenterDesc column" SortExpression="IndividualCenterDesc">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="IndividualPIName" HeaderText="PI Name" DataField="IndividualPIName" FilterControlAltText="Filter IndividualPIName column" SortExpression="IndividualPIName">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridTemplateColumn UniqueName="delete" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" Height="15px"></ItemStyle>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="delete" BorderWidth="0px" ImageUrl="../../img/icon/icon_delete.png" Width="17px" Height="17px" CommandName="deleteSingleIndividual"
                                                                    OnClientClick="return confirm('Are you sure you want to delete?')" ToolTip="Delete Individual"
                                                                    runat="server"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                    </Columns>
                                                </MasterTableView>
                                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                                <ClientSettings EnableRowHoverStyle="true" EnablePostBackOnRowClick="true">
                                                    <ClientEvents OnColumnMouseOut="OnColumnMouseOut"></ClientEvents>
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
                </div>
            </div>

            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Individuals - Individualset</h4>
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body">
                            <div class="form">
                                <div class="form-body">
                                    <h4 class="form-section"><%--<img src="../../img/icon/icon_Individual_Header.png" width="35" height="35" class="mr-1" />--%>Individuals</h4>
                                    <div class="row">
                                        <div class="form-group">
                                            <telerik:RadGrid RenderMode="Lightweight" ID="RG_IIset_Individuals" runat="server" GridLines="Both"
                                                AllowSorting="True" CellPadding="0" Height="300px" AllowPaging="true" PageSize="8" CssClass="RG_Padding_ACL"
                                                ShowStatusBar="True" Font-Size="X-Small" DataSourceID="DS_IIset_Individuals">
                                                <MasterTableView Name="Master_Individuals" AutoGenerateColumns="false" DataKeyNames="IndividualID">
                                                    <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                                                    <ItemStyle Height="20px" />
                                                    <Columns>
                                                        <telerik:GridBoundColumn UniqueName="IndividualID" HeaderText="Individual ID" DataField="IndividualID" FilterControlAltText="Filter IndividualID column" SortExpression="IndividualID" DataType="System.Int64">
                                                            <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="LocalID" HeaderText="Local ID" DataField="LocalID" FilterControlAltText="Filter LocalID column" SortExpression="LocalID" DataType="System.Int32">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="CenterDesc" HeaderText="Center" DataField="CenterDesc" FilterControlAltText="Filter CenterDesc column" SortExpression="CenterDesc">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="PIName" HeaderText="PI Name" DataField="PIName" FilterControlAltText="Filter PIName column" SortExpression="PIName">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                    </Columns>
                                                </MasterTableView>
                                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                                <ClientSettings EnableRowHoverStyle="true" EnablePostBackOnRowClick="true" AllowKeyboardNavigation="true">
                                                    <Selecting AllowRowSelect="True"></Selecting>
                                                    <ClientEvents OnColumnMouseOut="OnColumnMouseOut"></ClientEvents>
                                                    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                                                </ClientSettings>
                                                <SelectedItemStyle BackColor="Aqua"></SelectedItemStyle>
                                                <FilterMenu RenderMode="Lightweight"></FilterMenu>
                                                <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                                            </telerik:RadGrid>
                                        </div>
                                    </div>
                                    <h4 class="form-section"><%--<img src="../../img/icon/icon_Individualset_Header.png" width="40" height="40" class="mr-1" />--%>Individualset</h4>
                                    <div class="row">

                                        <div class="form-group">
                                            <telerik:RadGrid RenderMode="Lightweight" ID="RG_IIset_Individualset" runat="server" GridLines="Both" OnItemCommand="RG_IIset_Individualset_ItemCommand" OnItemDataBound="RG_IIset_Individualset_ItemDataBound"
                                                AllowSorting="True" Font-Size="X-Small" CellPadding="0" Height="300px" AutoGenerateColumns="False" CssClass="Hover_Selected" PageSize="8" AllowPaging="true"
                                                ShowStatusBar="True" DataSourceID="DS_IIset_Individualset">
                                                <MasterTableView Name="Master" AutoGenerateColumns="false" DataKeyNames="IndividualsetID">
                                                    <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                                                    <ItemStyle Height="20px" />
                                                    <Columns>
                                                        <telerik:GridBoundColumn UniqueName="IndividualsetID" HeaderText="ID" DataField="IndividualsetID" FilterControlAltText="Filter IndividualsetID column" SortExpression="IndividualsetID" DataType="System.Int32">
                                                            <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="IndividualsetName" HeaderText="Name" DataField="IndividualsetName" FilterControlAltText="Filter IndividualsetName column" SortExpression="IndividualsetName">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="IndividualsetCenterDesc" HeaderText="Center" DataField="IndividualsetCenterDesc" FilterControlAltText="Filter IndividualsetCenterDesc column" SortExpression="IndividualsetCenterDesc">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="IndividualsetDesc" HeaderText="Individualset Desc." DataField="IndividualsetDesc" FilterControlAltText="Filter IndividualsetDesc column" SortExpression="IndividualsetDesc">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridTemplateColumn DataType="System.int32" DataField="IndividualsetTypeID" UniqueName="IndividualsetTypeID" Groupable="False"
                                                            HeaderText="Type" HeaderStyle-Width="150px" FilterControlAltText="Filter IndividualsetTypeID column" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:HiddenField runat="server" ID="hdn_Type" Value='<%# Eval("IndividualsetTypeID") %>' />
                                                                <asp:ImageButton ID="Typebtn" BorderWidth="0px" Width="20px" runat="server"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn DataType="System.int32" DataField="IndividualsetStatus" UniqueName="IndividualsetStatus" Groupable="False"
                                                            HeaderText="Status" HeaderStyle-Width="150px" FilterControlAltText="Filter IndividualsetStatus column" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:HiddenField runat="server" ID="hdn_status" Value='<%# Eval("IndividualsetStatus") %>' />
                                                                <asp:ImageButton ID="Statusbtn" BorderWidth="0px" Width="30px" runat="server"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn UniqueName="delete" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" Height="15px"></ItemStyle>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="delete" BorderWidth="0px" ImageUrl="../../img/icon/icon_delete.png" Width="17px" Height="17px"
                                                                    CommandName="DeleteSingleIndividual" OnClientClick="return confirm('Are you sure you want to delete?')" ToolTip="Delete Individualset"
                                                                    runat="server"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                    </Columns>
                                                </MasterTableView>
                                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                                <ClientSettings EnableRowHoverStyle="true" EnablePostBackOnRowClick="true">
                                                    <ClientEvents OnColumnMouseOut="OnColumnMouseOut"></ClientEvents>
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
                </div>

            </div>
        </div>
    </section>
</div>




<telerik:RadWindowManager ID="RadWindowManager2" ShowContentDuringLoad="true" RenderMode="Lightweight"
    ReloadOnShow="true" runat="server" EnableShadow="true" Width="500px" Height="350px"
    Skin="Windows7" AutoSize="false" Modal="true" VisibleStatusbar="false" VisibleTitlebar="false">
    <Windows>
        <telerik:RadWindow ID="RadWindow2" runat="server" RenderMode="Lightweight" BorderStyle="None" BorderWidth="1px" CssClass="px-0 pb-0"
            NavigateUrl="/ACL/AddNewIndividualToIndividualset.aspx" OnClientClose="refreshGrid">
        </telerik:RadWindow>
    </Windows>
</telerik:RadWindowManager>


<asp:SqlDataSource ID="Ds_Centers" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_Center_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="Ds_PIs" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_PI_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        <asp:Parameter Name="InputType" Type="Int32" DefaultValue="-1" />

    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="DS_Individualset" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_Individualset_PI_Active_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:ControlParameter ControlID="DDL_PIs" Name="PIID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="DS_IsetI_Individuals" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_II_Individualset_Individual_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="RG_IsetI_Individualset" Name="IndividualsetID" PropertyName="SelectedValues['IndividualsetID']" Type="Int32" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="DS_IIset_Individuals" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_Individual_PI_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:ControlParameter ControlID="DDL_PIs" Name="PIID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="DS_IIset_Individualset" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_II_Individual_IndividulsetS_Sel" SelectCommandType="StoredProcedure" runat="server">
    <SelectParameters>
        <asp:ControlParameter ControlID="RG_IIset_Individuals" Name="IndividualID" PropertyName="SelectedValue" Type="Int64" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <script type="text/javascript">
        function openWin() {
            var Center = $('#<%= DDL_Centers.ClientID %> option:selected').val();
            var PI = $('#<%= DDL_PIs.ClientID %> option:selected').val();

            if (Center === '-1') {
                return radalert("<br /><b> Select a center first! </b><br />");
            }
            if (PI === '-1') {
                return radalert("<br /><b> Select a PI first! </b><br />");
            }

            var oWnd = radopen("/ACL/AddNewIndividualToIndividualset.aspx", "RadWindow2");
            var h = $(document).height();
            var w = $(document).width();
            oWnd.set_height(500);
            oWnd.set_width(0.5 * w);
            oWnd.center();
            oWnd.set_modal(true);
        }

        function refreshGrid(sender, eventArgs) {

            var RG_Individualset = $find("<%=RG_IsetI_Individualset.ClientID%>").get_masterTableView();
            RG_Individualset.rebind();

        }

        function NewReqclick(index) {
            var masterTable = $find("<%=RG_IsetI_Individualset.ClientID%>").get_masterTableView();
            masterTable.fireCommand("Select", index); //will select the row
        }

    </script>
</telerik:RadScriptBlock>
