<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_DataSet_Users.ascx.cs" Inherits="WebGAP.ACL.uc.uc_DataSet_Users" %>


<style type="text/css">
    .RadWindow2 a.rwIcon {
        background-image: none !important;
    }

       .Hover_Selected tr.rgHoveredRow > td {
    color: #000000 !important;
    background: #D5EDF1 !important;
    border-color: #57BCCE !important;
}

  .RG_Padding_ACL .rgRow > td, .RG_Padding_ACL .rgAltRow > td {
    padding: 0px 0 !important;
}
</style>

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="DDL_Centers">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_Centers" />
                <telerik:AjaxUpdatedControl ControlID="DDL_PIs" />
                <telerik:AjaxUpdatedControl ControlID="RG_DU_Dataset" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_DU_Users" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="DDL_PIs">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_PIs" />
                <telerik:AjaxUpdatedControl ControlID="RG_DU_Dataset" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_DU_Users" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_DU_Dataset">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_DU_Dataset" />
                <telerik:AjaxUpdatedControl ControlID="RG_DU_Users" LoadingPanelID="RadAjaxLoadingPanel1" />
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
                <telerik:RadComboBox RenderMode="Lightweight" runat="server" ID="DDL_PIs" 
                    DataTextField="PIName" DataValueField="PIID" DropDownWidth="200px" OnSelectedIndexChanged="DDL_PIs_SelectedIndexChanged"
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
                                    <h4 class="form-section">Data set</h4>
                                    <telerik:RadGrid RenderMode="Lightweight" ID="RG_DU_Dataset" runat="server" GridLines="Both" 
                                        AllowSorting="True" AutoGenerateColumns="False" Height="630px" CellPadding="0" OnItemCommand="RG_DU_Dataset_ItemCommand" AllowPaging="true" CssClass="RG_Padding_ACL"
                                        ShowStatusBar="True" DataSourceID="DS_DU_Dataset" OnItemDataBound="RG_DU_Dataset_ItemDataBound" OnPreRender="RG_DU_Dataset_PreRender">
                                        <MasterTableView Name="Master" DataSourceID="DS_DU_Dataset" AutoGenerateColumns="false" DataKeyNames="DatasetID">
                                             <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                                            <Columns>
                                                <telerik:GridBoundColumn UniqueName="DatasetID" HeaderText="Dataset ID" DataField="DatasetID" FilterControlAltText="Filter DatasetID column" SortExpression="DatasetID" DataType="System.Int32" ReadOnly="True">
                                                    <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"  />
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn UniqueName="CenterID" DataField="CentderID" Visible="false">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn UniqueName="SampleID" DataField="SampleID" Visible="false">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn UniqueName="DatasetName" HeaderText="Dataset Name" DataField="DatasetName" FilterControlAltText="Filter DatasetName column" SortExpression="DatasetName" >
                                                    <HeaderStyle  VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle  VerticalAlign="Middle" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn UniqueName="DatasetDesc" HeaderText="Dataset Desc." DataField="DatasetDesc" FilterControlAltText="Filter DatasetDesc column" SortExpression="DatasetDesc">
                                                    <HeaderStyle  VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle  VerticalAlign="Middle" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                                   <telerik:GridTemplateColumn DataType="System.int32" DataField="DatasetType" UniqueName="DatasetType" Groupable="False"
                                                            HeaderText="Type" HeaderStyle-Width="150px" FilterControlAltText="Filter DatasetType column" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:HiddenField runat="server" ID="hdn_Type" Value='<%# Eval("DatasetType") %>' />
                                                                <asp:ImageButton ID="Typebtn" BorderWidth="0px" Width="20px" runat="server"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn UniqueName="TemplateColumn5" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                    <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" Height="15px"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="newreq" BorderWidth="0px" ImageUrl="../../img/icon/icon_add.png" Width="15px" Height="15px" CommandName="listuser"
                                                            runat="server"></asp:ImageButton>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>

                                                <telerik:GridTemplateColumn UniqueName="delete" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                    <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"  Height="15px"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="delete" BorderWidth="0px" ImageUrl="../../img/icon/icon_delete.png" Width="17px" Height="17px" CommandName="deleteAllUsers"
                                                            OnClientClick="return confirm('Are you sure you want to delete?')" ToolTip="Delete All Users"
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
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-content collapse show">
                        <div class="card-body">
                            <div class="form">
                                <h4 class="form-section">Users</h4>
                                <telerik:RadGrid RenderMode="Lightweight" ID="RG_DU_Users" runat="server" GridLines="Both" OnItemCommand="RG_DU_Users_ItemCommand" CssClass="Hover_Selected" AllowPaging="true"
                                    AllowSorting="True" CellSpacing="0" Height="630px"  CellPadding="0" ShowStatusBar="True" DataSourceID="DS_DU_Users">
                                    <MasterTableView Name="Master" AutoGenerateColumns="false" DataKeyNames="UserID" DataSourceID="DS_DU_Users">
                                           <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                                        <Columns>
                                            <telerik:GridBoundColumn UniqueName="UserID" HeaderText="ID" DataField="UserID" FilterControlAltText="Filter UserID column" SortExpression="UserID">
                                                <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="UserFullName" HeaderText="User Name" DataField="UserFullName" FilterControlAltText="Filter UserFullName column" SortExpression="UserFullName">
                                                <HeaderStyle  VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle  VerticalAlign="Middle" HorizontalAlign="Center"  />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="UserCenterDesc" HeaderText="Center" DataField="UserCenterDesc" FilterControlAltText="Filter UserCenterDesc column" SortExpression="UserCenterDesc">
                                                <HeaderStyle  VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle  VerticalAlign="Middle" HorizontalAlign="Center"  />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn UniqueName="delete" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                <HeaderStyle Width="30" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="30" VerticalAlign="Middle" HorizontalAlign="Center"  Height="15px"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="delete" BorderWidth="0px" ImageUrl="../../img/icon/icon_delete.png" Width="17px" Height="17px" CommandName="deleteSingleUser"
                                                        OnClientClick="return confirm('Are you sure you want to delete?')" ToolTip="Delete User"
                                                        runat="server"></asp:ImageButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                    <ClientSettings EnableRowHoverStyle="true" EnablePostBackOnRowClick="true">
                                        <ClientEvents OnColumnMouseOut="OnColumnMouseOut"></ClientEvents>
                                        <Scrolling AllowScroll="true" UseStaticHeaders="true" /> 
                                        <Selecting AllowRowSelect="true" />
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


<telerik:RadWindowManager ID="RadWindowManager2" ShowContentDuringLoad="true" RenderMode="Lightweight"
    ReloadOnShow="true" runat="server" EnableShadow="true"
    Skin="Windows7" AutoSize="false" Modal="true" VisibleStatusbar="false" VisibleTitlebar="false">
    <Windows>

        <telerik:RadWindow ID="RadWindow2" runat="server" RenderMode="Lightweight" BorderStyle="None" BorderWidth="1px" CssClass="px-0 pb-0"
            NavigateUrl="/ACL/AddNewUserToDataset.aspx" OnClientClose="refreshGrid">
        </telerik:RadWindow>

    </Windows>
</telerik:RadWindowManager>




<asp:SqlDataSource ID="DS_DU_Dataset" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_DataSet_PI_Active_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:ControlParameter ControlID="DDL_PIs" Name="PIID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="DS_DU_Users" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_DU_Sel_DataSets_Users" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        <asp:ControlParameter ControlID="RG_DU_Dataset" Name="DatasetID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1"/>
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

            var w = $(document).width();

            var oWnd = radopen("/ACL/AddNewUserToDataset.aspx", "RadWindow2");

            oWnd.set_height(500);
            oWnd.set_width(0.5 * w);
          

            oWnd.center();

            oWnd.set_modal(true);
        }

        function refreshGrid(sender, eventArgs) {
            var grid = $find("<%=RG_DU_Dataset.ClientID%>").get_masterTableView();
                grid.rebind();
            }


    </script>
</telerik:RadScriptBlock>

