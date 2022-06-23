<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_DataSet_Group.ascx.cs" Inherits="WebGAP.ACL.uc.uc_DataSet_Group" %>


<style type="text/css">
    .RadWindow2 a.rwIcon {
        background-image: none !important;
    }


    .Hover_Selected tr.rgHoveredRow > td {
        color: #000000 !important;
        background: #D5EDF1 !important;
        border-color: #57BCCE !important;
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
                <telerik:AjaxUpdatedControl ControlID="RG_GD_Group" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_GD_Dataset" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_DG_Dataset" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_DG_Group" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="DDL_PIs">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_PIs" />
                <telerik:AjaxUpdatedControl ControlID="RG_DG_Dataset" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_DG_Group" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_GD_Group" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_GD_Dataset" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_GD_Group">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_GD_Group" />
                <telerik:AjaxUpdatedControl ControlID="RG_GD_Dataset" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_DG_Dataset" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_DG_Group" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_DG_Dataset">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_DG_Dataset" />
                <telerik:AjaxUpdatedControl ControlID="RG_DG_Group" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_GD_Dataset" LoadingPanelID="RadAjaxLoadingPanel1" />
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
                <div>
                 <telerik:RadComboBox RenderMode="Lightweight" runat="server" ID="DDL_Centers" 
                    DataTextField="CenterDesc" DataValueField="CenterID" DropDownWidth="200px" OnSelectedIndexChanged="DDL_Centers_SelectedIndexChanged"
                    HighlightTemplatedItems="true" Height="140px" AutoPostBack="true" Width="100%">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container, "Attributes['CenterID']")%>
                    </ItemTemplate>
                </telerik:RadComboBox>
               </div>
               <div style="padding-left:10px">
                <telerik:RadComboBox RenderMode="Lightweight" runat="server" ID="DDL_PIs" OnSelectedIndexChanged="DDL_PIs_SelectedIndexChanged"
                    DataTextField="PIName" DataValueField="PIID" DropDownWidth="200px" 
                    HighlightTemplatedItems="true" Height="140px" AutoPostBack="true" Width="100%">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container, "Attributes['PIID']")%>
                    </ItemTemplate>
                </telerik:RadComboBox>
                   </div> 

            </div>
        </div>
    </div>
</div>

<script type="text/javascript" id="telerikClientEvents1">
    function OnColumnMouseOut(sender, args) {
    }
</script>
<div class="content-body pt-1">
    <section id="basic-form-layouts">
        <div class="row match-height">


            <div class="col-md-6">
                <div class="card">
                    <div class="card-header p-0">
                         <div style="background-color:aliceblue">Groups - Dataset </div>
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body">
                            <div class="form">
                                <div class="form-body">
                                    <h4 class="form-section">Group</h4>
                                    <div class="row">
                                        <div class="form-group">
                                            <telerik:RadGrid RenderMode="Lightweight" ID="RG_GD_Group" runat="server" GridLines="Both" OnItemCommand="RG_GD_Group_ItemCommand" PageSize="8"
                                                AllowSorting="True" AutoGenerateColumns="False" Height="300px" CellPadding="0" AllowPaging="true" OnPreRender="RG_GD_Group_PreRender"
                                                ShowStatusBar="True" DataSourceID="DS_GD_Group" Font-Size="X-Small">
                                                <MasterTableView Name="Master" DataSourceID="DS_GD_Group" AutoGenerateColumns="false" DataKeyNames="GroupID,CenterID">
                                                    <ItemStyle Height="20px" />
                                                    <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                                                    <Columns>
                                                        <telerik:GridBoundColumn UniqueName="GroupID" HeaderText="ID" DataField="GroupID" FilterControlAltText="Filter GroupID column" SortExpression="GroupID" DataType="System.Int32" ReadOnly="True">
                                                            <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>

                                                        <telerik:GridBoundColumn UniqueName="GroupName" HeaderText="Name" DataField="GroupName" FilterControlAltText="Filter GroupName column" SortExpression="GroupName">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                      
                                                        <telerik:GridTemplateColumn UniqueName="TemplateColumn5" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="newreq" BorderWidth="0px" ImageUrl="../../img/icon/icon_add.png" Width="15px" Height="15px" ToolTip="Add Dataset"
                                                                    runat="server" CommandName="ListDataset"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>

                                                        <telerik:GridTemplateColumn UniqueName="delete" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" Height="15px"></ItemStyle>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="delete" BorderWidth="0px" ImageUrl="../../img/icon/icon_delete.png" Width="17px" Height="17px" CommandName="deleteAllDatasets"
                                                                    OnClientClick="return confirm('Are you sure you want to delete?')" ToolTip="Delete All Datasets"
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
                                                <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                                            </telerik:RadGrid>
                                        </div>
                                    </div>
                                    <h4 class="form-section">Datasets</h4>
                                    <div class="row">
                                        <div class="form-group">

                                            <telerik:RadGrid RenderMode="Lightweight" ID="RG_GD_Dataset" runat="server" GridLines="Both" OnItemCommand="RG_GD_Dataset_ItemCommand" AllowPaging="true" PageSize="8"
                                                AllowSorting="True" CellSpacing="0" Height="300px" Font-Size="X-Small" CellPadding="0" ShowStatusBar="True" DataSourceID="DS_GD_Dataset" CssClass="Hover_Selected" OnItemDataBound="RG_GD_Dataset_ItemDataBound">
                                                <MasterTableView Name="Master" AutoGenerateColumns="false" DataKeyNames="DatasetID" DataSourceID="DS_GD_Dataset">
                                                    <ItemStyle Height="20px" />
                                                    <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                                                    <Columns>
                                                        <telerik:GridBoundColumn UniqueName="DatasetID" HeaderText="Dataset ID" DataField="DatasetID" FilterControlAltText="Filter DatasetID column" SortExpression="DatasetID">
                                                            <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="DatasetName" HeaderText="Name" DataField="DatasetName" FilterControlAltText="Filter DatasetName column" SortExpression="DatasetName">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>

                                                        <telerik:GridBoundColumn UniqueName="PIName" HeaderText="PI Name" DataField="PIName" FilterControlAltText="Filter PIName column" SortExpression="PIName">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridTemplateColumn DataType="System.int32" DataField="DatasetType" UniqueName="DatasetType" Groupable="False"
                                                            HeaderText="Type" HeaderStyle-Width="150px" FilterControlAltText="Filter DatasetType column" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="40px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="40px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:HiddenField runat="server" ID="hdn_Type" Value='<%# Eval("DatasetType") %>' />
                                                                <asp:ImageButton ID="Typebtn" BorderWidth="0px" Width="20px" runat="server"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn DataType="System.int32" DataField="DatasetStatus" UniqueName="DatasetStatus" Groupable="False"
                                                            HeaderText="Status" HeaderStyle-Width="150px" FilterControlAltText="Filter DatasetStatus column" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:HiddenField runat="server" ID="hdn_status" Value='<%# Eval("DatasetStatus") %>' />
                                                                <asp:ImageButton ID="Statusbtn" BorderWidth="0px" Width="20px" runat="server"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn UniqueName="delete" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="delete" BorderWidth="0px" ImageUrl="../../img/icon/icon_delete.png" Width="17px" Height="17px"
                                                                    CommandName="deleteSingleDataset" OnClientClick="return confirm('Are you sure you want to delete?')" ToolTip="Delete Dataset"
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
                    <div class="card-header p-0">
                         <div style="background-color:aliceblue">Dataset - Groups</div>
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body">
                            <div class="form">
                                <div class="form-body">
                                    <h4 class="form-section">Dataset</h4>

                                    <div class="row">

                                        <div class="form-group">
                                            <telerik:RadGrid RenderMode="Lightweight" ID="RG_DG_Dataset" runat="server" GridLines="Both" CssClass="RG_Padding_ACL" PageSize="8"
                                                AllowSorting="True" CellPadding="0" Height="300px" OnItemCommand="RG_DG_Dataset_ItemCommand" AllowPaging="true" OnPreRender="RG_DG_Dataset_PreRender"
                                                ShowStatusBar="True" Font-Size="X-Small" DataSourceID="DS_DG_Dataset">
                                                <MasterTableView Name="Master" AutoGenerateColumns="false" DataKeyNames="DatasetID" DataSourceID="DS_DG_Dataset">
                                                    <ItemStyle Height="20px" />
                                                    <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                                                    <Columns>
                                                        <telerik:GridBoundColumn UniqueName="DatasetID" HeaderText="ID" DataField="DatasetID" FilterControlAltText="Filter DatasetID column" SortExpression="DatasetID">
                                                            <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="DatasetName" HeaderText="Name" DataField="DatasetName" FilterControlAltText="Filter DatasetName column" SortExpression="DatasetName">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="DatasetDesc" HeaderText="Description" DataField="DatasetDesc" FilterControlAltText="Filter DatasetDesc column" SortExpression="DatasetDesc">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                     
                                                    </Columns>
                                                </MasterTableView>
                                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                                <ClientSettings EnableRowHoverStyle="true" AllowKeyboardNavigation="true" EnablePostBackOnRowClick="true">
                                                    <ClientEvents OnColumnMouseOut="OnColumnMouseOut"></ClientEvents>
                                                    <Selecting AllowRowSelect="true" />
                                                    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                                                </ClientSettings>
                                                <SelectedItemStyle BackColor="Aqua"></SelectedItemStyle>
                                                <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                                            </telerik:RadGrid>
                                        </div>
                                    </div>
                                    <h4 class="form-section">Groups</h4>
                                    <div class="row">
                                        <div class="form-group">
                                            <telerik:RadGrid RenderMode="Lightweight" ID="RG_DG_Group" runat="server" GridLines="Both" OnItemCommand="RG_DG_Group_ItemCommand" AllowPaging="true"
                                                AllowSorting="True" CellSpacing="0" Font-Size="X-Small" CellPadding="0" Height="300px" AutoGenerateColumns="false" CssClass="Hover_Selected" PageSize="8"
                                                ShowStatusBar="True" DataSourceID="DS_DG_Group" OnItemDataBound="RG_DG_Group_ItemDataBound">
                                                <MasterTableView Name="Master" AutoGenerateColumns="false" DataKeyNames="GroupID" DataSourceID="DS_DG_Group">
                                                    <ItemStyle Height="20px" />
                                                    <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle> <%--RG_DG_Dataset_ItemCommand--%>
                                                    <Columns>
                                                        <telerik:GridBoundColumn UniqueName="GroupID" HeaderText="Group ID" DataField="GroupID" FilterControlAltText="Filter GroupID column" SortExpression="GroupID">
                                                            <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="GroupName" HeaderText="Name" DataField="GroupName" FilterControlAltText="Filter GroupName column" SortExpression="GroupName">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="GroupCenterDesc" HeaderText="Center" DataField="GroupCenterDesc" FilterControlAltText="Filter GroupCenterDesc column" SortExpression="GroupCenterDesc">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridTemplateColumn DataType="System.int32" DataField="GroupStatusDesc" UniqueName="GroupStatusDesc" Groupable="False"
                                                            HeaderText="Status" HeaderStyle-Width="150px" FilterControlAltText="Filter GroupStatusDesc column" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:HiddenField runat="server" ID="hdn_Status" Value='<%# Eval("GroupStatus") %>' />
                                                                <asp:ImageButton ID="Statusbtn" BorderWidth="0px" Width="30px" runat="server"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn UniqueName="delete" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" Height="15px"></ItemStyle>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="delete" BorderWidth="0px" ImageUrl="../../img/icon/icon_delete.png" Width="17px" Height="17px"
                                                                    CommandName="DeleteDataset" OnClientClick="return confirm('Are you sure you want to delete?')" ToolTip="Delete Dataset"
                                                                    runat="server"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                    </Columns>
                                                </MasterTableView>
                                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                                <ClientSettings EnableRowHoverStyle="true" Selecting-AllowRowSelect="false" EnablePostBackOnRowClick="true">
                                                    <ClientEvents OnColumnMouseOut="OnColumnMouseOut"></ClientEvents>
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
                </div>
            </div>

        </div>
    </section>
</div>


<telerik:RadWindowManager ID="RadWindowManager2" ShowContentDuringLoad="true" RenderMode="Lightweight"
    ReloadOnShow="true" runat="server" EnableShadow="true"
    Skin="Windows7" AutoSize="false" Modal="true" VisibleStatusbar="false" VisibleTitlebar="false">
    <Windows>
        <telerik:RadWindow ID="RadWindow2" runat="server" RenderMode="Lightweight" BorderStyle="None" BorderWidth="1px" CssClass="px-0 pb-0"
            NavigateUrl="/ACL/AddNewDatasetToGroup.aspx" OnClientClose="refreshGrid">
        </telerik:RadWindow>
    </Windows>
</telerik:RadWindowManager>

<asp:SqlDataSource ID="DS_GD_Group" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_Groups_Active_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="DS_GD_Dataset" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_DG_Sel_Group_Datasets" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        <asp:ControlParameter ControlID="RG_GD_Group" Name="GroupID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="DS_DG_Dataset" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_DataSet_PI_Active_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:ControlParameter ControlID="DDL_PIs" Name="PIID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="DS_DG_Group" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_DG_Sel_Dataset_Groups" SelectCommandType="StoredProcedure" runat="server">
    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        <asp:ControlParameter ControlID="RG_DG_Dataset" Name="DatasetID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
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

            var h = $(document).height();
            var w = $(document).width();

            var oWnd = radopen("/ACL/AddNewDatasetToGroup.aspx", "RadWindow2");
            oWnd.set_height(500);
            oWnd.set_width(0.5 * w);
            oWnd.center();

            oWnd.set_modal(true);
        }

        function refreshGrid(sender, eventArgs) {
            var grid = $find("<%=RG_GD_Dataset.ClientID%>").get_masterTableView();
            grid.rebind();
        }

        function confirmCallBackFn(arg) {
            radalert("Confirm returned the following result: " + arg);
        }

    </script>
</telerik:RadScriptBlock>

<%--OnClientClick="radconfirm('<br /><b>Are you sure you want to delete?</b><br />', confirmCallBackFn); return false;"--%>