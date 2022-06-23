<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_RequestDataset.ascx.cs" Inherits="WebGAP.Management.uc.uc_RequestDataset" %>


<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_User_Req">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_User_Req" LoadingPanelID="RadAjaxLoadingPanel1" />
                 <telerik:AjaxUpdatedControl ControlID="RG_AvailableDataset" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="DDL_Centers">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_Centers" />
                <telerik:AjaxUpdatedControl ControlID="DDL_PIs" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="DDL_PIs">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_PIs" />
                <telerik:AjaxUpdatedControl ControlID="RG_AvailableDataset" LoadingPanelID="RadAjaxLoadingPanel1" />
                 <telerik:AjaxUpdatedControl ControlID="RG_User_Req" LoadingPanelID="RadAjaxLoadingPanel1" />

            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_AvailableDataset">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_AvailableDataset" />
                <telerik:AjaxUpdatedControl ControlID="RG_User_Req" LoadingPanelID="RadAjaxLoadingPanel1" />
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

</div>



<div class="content-body pt-1">
    <section id="basic-form-layouts">
        <div class="row match-height">
            <script type="text/javascript" id="telerikClientEvents1">
                function OnColumnMouseOut(sender, args) {
                }
            </script>



            <%--       <telerik:RadTabStrip ID="RS_RequestDatasetSample" SelectedIndex="0" runat="server" MultiPageID="RequestDatasetSample" Width="100%"
                Align="Justify" Skin="Silk" CssClass="tabStrip" CausesValidation="False" ResolvedRenderMode="Classic">
                <Tabs>
                    <telerik:RadTab Text="Request Data set" Enabled="true" SelectedImageUrl="../../img/icon/Request_Dataset_active_icon.png" Font-Size="Small"
                        ImageUrl="../../img/icon/Request_Dataset_icon.png" Selected="True">
                    </telerik:RadTab>
                    <telerik:RadTab Text="Request sets of Samples" Enabled="true" SelectedImageUrl="../../img/icon/Request_Sample_active_icon.png" Font-Size="Small"
                        ImageUrl="../../img/icon/Request_Sample_icon.png">
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>--%>
            <%--      <telerik:RadMultiPage ID="RequestDatasetSample" CssClass="RadMultiPage" runat="server" BorderWidth="0px" SelectedIndex="0" Width="100%" Height="100%">

            --%>
            <%--  <telerik:RadPageView ID="RequestDataset" runat="server" Height="670px" Width="100%">--%>
            <div class="col-md-12 p-0">
                <div class="card">
                    <div class="card-content collapse show">
                        <div class="card-body">
                            <div class="form">
                                <div class="form-body">
                                    <div class="content-header-right col-md-12 col-12">
                                        <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                                            <div class="btn-group" role="group">
                                                <asp:DropDownList ID="DDL_Centers" runat="server" Width="150px"
                                                    AppendDataBoundItems="True" AutoPostBack="true" DataTextField="CenterDesc" DataValueField="CenterID"
                                                    class="btn btn-outline-info dropdown-toggle dropdown-menu-right mr-1 btn-sm" DataSourceID="Ds_Centers">
                                                    <asp:ListItem Value="-1">All Centers</asp:ListItem>
                                                </asp:DropDownList>

                                                <asp:DropDownList ID="DDL_PIs" runat="server" Width="150px" DataTextField="PIName" DataValueField="PIID"
                                                    AutoPostBack="true" DataSourceID="Ds_PIs" AppendDataBoundItems="true" EnableViewState="false"
                                                    class="btn btn-outline-info dropdown-toggle dropdown-menu-right mr-1 btn-sm">
                                                    <asp:ListItem Value="-1">All PIs</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                        </div>
                                    </div>
                                    <h4 class="form-section">Available Data sets</h4>

                                    <div class="row">
                                        <div class="form-group m-2">
                                            <telerik:RadGrid RenderMode="Lightweight" ID="RG_AvailableDataset" runat="server" GridLines="Both" PageSize="4" 
                                                AllowSorting="True" AutoGenerateColumns="False" Height="260px" CellPadding="0" AllowPaging="true" OnItemCommand="RG_AvailableDataset_ItemCommand"
                                                ShowStatusBar="True" DataSourceID="Ds_AvailableDataset">
                                                <MasterTableView  Name="Master" DataSourceID="Ds_AvailableDataset" AutoGenerateColumns="false" DataKeyNames="DatasetID">
                                                    <PagerStyle Mode="NextPrev" AlwaysVisible="true" />
                                                    <Columns>
                                                        <telerik:GridBoundColumn DataField="CenterDesc" FilterControlAltText="Filter CenterDesc column" HeaderText="Center" SortExpression="CenterDesc" UniqueName="CenterDesc">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="PIName" FilterControlAltText="Filter PIName column" HeaderText="PI Name" SortExpression="PIName" UniqueName="PIName">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="DatasetID" DataType="System.Int32" FilterControlAltText="Filter DatasetID column" HeaderText="Dataset ID" SortExpression="DatasetID" UniqueName="DatasetID">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="DatasetName" FilterControlAltText="Filter DatasetName column" HeaderText="Data set Name" SortExpression="DatasetName" UniqueName="DatasetName">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="DataSetDesc" FilterControlAltText="Filter DataSetDesc column" HeaderText="Description" SortExpression="DataSetDesc" UniqueName="DataSetDesc">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="CountSample" DataType="System.Int32" FilterControlAltText="Filter CountSample column" HeaderText="Nember of Samples" ReadOnly="True" SortExpression="CountSample" UniqueName="CountSample">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridTemplateColumn UniqueName="TemplateColumn5" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" Height="60px"></ItemStyle>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="newreq" BorderWidth="0px" ImageUrl="../../img/icon/icon_askpermission.png" Width="30px" Height="30px" CommandName="RequestDS"
                                                                    runat="server"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                    </Columns>
                                                </MasterTableView><GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
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
                                    <h4 class="form-section">Requests</h4>
                                    <div class="row">
                                        <div class="form-group m-2">
                                            <telerik:RadGrid RenderMode="Lightweight" ID="RG_User_Req" runat="server" GridLines="Both"
                                                AllowSorting="True" AutoGenerateColumns="False" Height="260px" CellPadding="0" PageSize="4"
                                                ShowStatusBar="True" DataSourceID="Ds_User_Req">
                                                <MasterTableView Name="Master" DataSourceID="Ds_User_Req" AutoGenerateColumns="false">
                                                    <PagerStyle Mode="NextPrev" AlwaysVisible="true" />
                                                    <Columns>
                                                        <telerik:GridBoundColumn DataField="ReqID" DataType="System.Int32" FilterControlAltText="Filter ReqID column" HeaderText="ID" SortExpression="ReqID" UniqueName="ReqID">
                                                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="ReqDate" DataType="System.DateTime" FilterControlAltText="Filter ReqDate column" HeaderText="Date" SortExpression="ReqDate" UniqueName="ReqDate">
                                                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="CenterDesc" FilterControlAltText="Filter CenterDesc column" HeaderText="Center" SortExpression="CenterDesc" UniqueName="CenterDesc">
                                                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="DatasetID" DataType="System.Int32" FilterControlAltText="Filter DatasetID column" HeaderText="DatasetID" SortExpression="DatasetID" UniqueName="DatasetID">
                                                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="DatasetName" FilterControlAltText="Filter DatasetName column" HeaderText="Data set Name" SortExpression="DatasetName" UniqueName="DatasetName">
                                                            <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="DatasetDesc" FilterControlAltText="Filter DatasetDesc column" HeaderText="Description" SortExpression="DatasetDesc" UniqueName="DatasetDesc">
                                                            <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="PIName" FilterControlAltText="Filter PIName column" HeaderText="PI Name" SortExpression="PIName" UniqueName="PIName">
                                                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="ReqStateDesc" FilterControlAltText="Filter ReqStateDesc column" HeaderText="State" SortExpression="ReqStateDesc" UniqueName="ReqStateDesc">
                                                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="PIDecisionDesc" FilterControlAltText="Filter PIDecisionDesc column" HeaderText="PI Decision" SortExpression="PIDecisionDesc" UniqueName="PIDecisionDesc">
                                                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                        </telerik:GridBoundColumn>
                                                    </Columns>

                                                </MasterTableView><GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
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
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--  </telerik:RadPageView>--%>

            <%--                <telerik:RadPageView ID="RequestSample" runat="server" Height="670px" Width="100%">
                    <div class="col-md-12 p-0">
                        <div class="card">
                            <div class="card-content collapse show">
                                <div class="card-body">
                                    <div class="form">
                                        <div class="form-body">
                                            <h4 class="form-section">Available Samples</h4>
                                            <div class="row">
                                                <div class="form-group m-2">

                                                    <div style="border-color: gainsboro; display: flex; flex-direction: row; justify-content: flex-end; padding: 4px 4px 4px 4px; font-size: smaller; background-color: #F3F3F3; box-shadow: inset 10px 10px 10px 10px rgba(0, 0, 197, 0.1)">
                                                        <telerik:RadButton ID="btn_Ask_Permission_Sample" runat="server" Text="Ask For Permission"  OnClick="btn_Ask_Permission_Sample_Click"
                                                            ToolTip="Ask For Permission" ButtonType="StandardButton" Checked="true" AutoPostBack="true">
                                                            <Icon PrimaryIconCssClass="" PrimaryIconLeft="4" PrimaryIconTop="4"></Icon>
                                                        </telerik:RadButton>
                                                    </div>
                                                    <telerik:RadGrid RenderMode="Lightweight" ID="RG_PI_DS_Samples" runat="server" GridLines="Both" AllowPaging="true" PageSize="4"
                                                        AllowSorting="True" AutoGenerateColumns="False" Height="260px" CellPadding="0" AllowMultiRowSelection="true" DataKeyNames="SampleID"
                                                        ShowStatusBar="True" DataSourceID="Ds_PI_DS_Samples">
                                                        <MasterTableView Name="Master" AutoGenerateColumns="false">
                                                            <PagerStyle Mode="NextPrev" AlwaysVisible="true"/>
                                                            <Columns>
                                                                <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn1">
                                                                    <HeaderStyle Width="40px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                                    <ItemStyle Width="40px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                                </telerik:GridClientSelectColumn>
                                                                <telerik:GridBoundColumn DataField="SampleID" DataType="System.Int64" FilterControlAltText="Filter SampleID column" HeaderText="SampleID" SortExpression="SampleID" UniqueName="SampleID">
                                                                    <HeaderStyle Width="40%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                                    <ItemStyle Width="40%" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="SampleTypeName" FilterControlAltText="Filter SampleTypeName column" HeaderText="SampleTypeName" SortExpression="SampleTypeName" UniqueName="SampleTypeName">
                                                                    <HeaderStyle Width="40%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                                    <ItemStyle Width="40%" VerticalAlign="Middle" HorizontalAlign="Center" ></ItemStyle>
                                                                </telerik:GridBoundColumn>
                                                            </Columns>
                                                        </MasterTableView><GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
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
                                            <h4 class="form-section">Requests</h4>
                                            <div class="row">
                                                <div class="form-group m-2">
                                                    <telerik:RadGrid RenderMode="Lightweight" ID="RG_User_Req_Samples" runat="server" GridLines="Both"
                                                        AllowSorting="True" AutoGenerateColumns="False" Height="260px" CellPadding="0" AllowPaging="true" PageSize="4"
                                                        ShowStatusBar="True"  DataSourceID="Ds_User_Req_Samples">
                                                        <MasterTableView Name="Master" AutoGenerateColumns="false" DataSourceID="Ds_User_Req_Samples">
                                                            <PagerStyle Mode="NextPrev" AlwaysVisible="true"/>
                                                            <Columns>
                                                                <telerik:GridBoundColumn DataField="ReqID" DataType="System.Int32" FilterControlAltText="Filter ReqID column" HeaderText="Req. ID" SortExpression="ReqID" UniqueName="ReqID">
                                                                    <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                                    <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="CenterDesc" FilterControlAltText="Filter CenterDesc column" HeaderText="Center" SortExpression="CenterDesc" UniqueName="CenterDesc">
                                                                    <HeaderStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                                    <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" ></ItemStyle>
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="DatasetID" DataType="System.Int32" FilterControlAltText="Filter DatasetID column" HeaderText="DatasetID" SortExpression="DatasetID" UniqueName="DatasetID">
                                                                    <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                                    <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="DatasetName" FilterControlAltText="Filter DatasetName column" HeaderText="Dataset Name" SortExpression="DatasetName" UniqueName="DatasetName">
                                                                    <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                                    <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" ></ItemStyle>
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="DatasetDesc" FilterControlAltText="Filter DatasetDesc column" HeaderText="Dataset Desc." SortExpression="DatasetDesc" UniqueName="DatasetDesc">
                                                                    <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                                    <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                                </telerik:GridBoundColumn>
                                                                   <telerik:GridBoundColumn DataField="ReqState" DataType="System.Int32" FilterControlAltText="Filter ReqState column" HeaderText="ReqState" SortExpression="ReqState" UniqueName="ReqState">
                                                                     <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                                    <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" Height="15px"></ItemStyle>
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="ReqStateDesc" FilterControlAltText="Filter ReqStateDesc column" HeaderText="Req. Desc." ReadOnly="True" SortExpression="ReqStateDesc" UniqueName="ReqStateDesc">
                                                                    <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                                    <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" ></ItemStyle>
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="ReqDate" DataType="System.DateTime" FilterControlAltText="Filter ReqDate column" HeaderText="Req. Date" SortExpression="ReqDate" UniqueName="ReqDate" DataFormatString="{0:d}">
                                                                    <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                                    <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" ></ItemStyle>
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="ReqDesc" FilterControlAltText="Filter ReqDesc column" HeaderText="Req. Desc." SortExpression="ReqDesc" UniqueName="ReqDesc">
                                                                    <HeaderStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                                    <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" ></ItemStyle>
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="PIName" FilterControlAltText="Filter PIName column" HeaderText="PI" SortExpression="PIName" UniqueName="PIName">
                                                                    <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                                    <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" ></ItemStyle>
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="PIAnswer" FilterControlAltText="Filter PIAnswer column" HeaderText="PI Answer" SortExpression="PIAnswer" UniqueName="PIAnswer">
                                                                    <HeaderStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                                    <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" ></ItemStyle>
                                                                </telerik:GridBoundColumn>
                                                                <%--<telerik:GridBoundColumn DataField="PIDecision" DataType="System.Int32" FilterControlAltText="Filter PIDecision column" HeaderText="PIDecision" SortExpression="PI Decision" UniqueName="PIDecision">
                                                                     <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                                    <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" Height="15px"></ItemStyle>
                                                                </telerik:GridBoundColumn>
                                                                  <telerik:GridBoundColumn DataField="PIDecisionDesc" FilterControlAltText="Filter PIDecisionDesc column" HeaderText="PI Decision" ReadOnly="True" SortExpression="PIDecisionDesc" UniqueName="PIDecisionDesc">
                                                                     <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                                    <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" Height="15px"></ItemStyle>
                                                                </telerik:GridBoundColumn>
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
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </telerik:RadPageView>
            </telerik:RadMultiPage>--%>
        </div>
    </section>
</div>


<telerik:RadWindowManager ID="RadWindowManager2" ShowContentDuringLoad="true" RenderMode="Lightweight"
    ReloadOnShow="true" runat="server" EnableShadow="true"
    Skin="Windows7" AutoSize="false" Modal="true" VisibleStatusbar="false" VisibleTitlebar="false">
    <Windows>
        <telerik:RadWindow ID="RadWindow2" runat="server" RenderMode="Lightweight" BorderStyle="None" BorderWidth="1px" CssClass="px-0 pb-0"
            NavigateUrl="/Management/AskDatasetPermission.aspx" OnClientClose="refreshGridDS">
        </telerik:RadWindow>
    </Windows>
    <%--<Windows>
        <telerik:RadWindow ID="RadWindow1" runat="server" RenderMode="Lightweight" BorderStyle="None" BorderWidth="1px" CssClass="px-0 pb-0"
            NavigateUrl="/Management/AskDatasetPermission_Sample.aspx" OnClientClose="refreshGridSample">
        </telerik:RadWindow>
    </Windows>--%>
</telerik:RadWindowManager>

<asp:SqlDataSource ID="Ds_AvailableDataset" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_Dataset_Ask_Permission_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" />
        <asp:ControlParameter ControlID="DDL_PIs" Name="PIID" PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="Ds_User_Req" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_User_Dataset_Asked_Permission_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="Ds_PI_DS_Samples" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_Dataset_Ask_Permission_Samples_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        <asp:ControlParameter ControlID="DDL_PIs" Name="PIID" PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="Ds_User_Req_Samples" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_User_Dataset_Asked_Permission_Sample_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>

</asp:SqlDataSource>

<asp:SqlDataSource ID="Ds_Centers" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommandType="StoredProcedure"  SelectCommand="Sp_Center_Sel">
       <SelectParameters>
           <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
           </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="Ds_PIs" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_PI_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" />
        <asp:Parameter DefaultValue="0" Name="UserID" Type="Int32" />
        <asp:Parameter Name="InputType" Type="Int32" DefaultValue="0" />

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
            var oWnd = radopen("/Management/AskDatasetPermission.aspx", "RadWindow2");
            var h = $(document).height();
            var w = $(document).width();
            oWnd.set_height(0.47 * h);
            oWnd.set_width(0.5 * w);
            oWnd.center();
            oWnd.set_modal(true);
        }

        function refreshGridDS(sender, eventArgs) {
            var RG_AvailableDataset = $find("<%=RG_AvailableDataset.ClientID%>").get_masterTableView();
            RG_AvailableDataset.rebind();
         //   console.log("grtyrtrt");
         //   setTimeout(() => { console.log("World!"); }, 20000);
          //  secondgrid();

        }
        function secondgrid() {
            var RG_User_Req = $find("<%=RG_User_Req.ClientID%>").get_masterTableView();
            RG_User_Req.rebind();

        }
     <%--   function refreshGridSample(sender, eventArgs) {
            var RG_PI_DS_Samples = $find("<%=RG_PI_DS_Samples.ClientID%>").get_masterTableView();
            RG_PI_DS_Samples.rebind();

            var RG_User_Req_Samples = $find("<%=RG_User_Req_Samples.ClientID%>").get_masterTableView();
            RG_User_Req_Samples.rebind();
        }--%>

        //function AskDatasetPermission_Sample() {
        //    var oWnd = radopen("AskDatasetPermission_Sample.aspx", "RadWindow1");
        //    var h = $(document).height();
        //    var w = $(document).width();
        //    oWnd.set_height(0.47 * h);
        //    oWnd.set_width(0.5 * w);
        //    oWnd.center();
        //    oWnd.set_modal(true);

        //}
    <%--    function btn_Ask_Permission_Clicking(sender, args) {

            var SampleList = '';
            var Center = $('#<%= DDL_Centers.ClientID %> option:selected').val();
            var PI = $('#<%= DDL_PIs.ClientID %> option:selected').val();
            var grid = $find("<%=RG_PI_DS_Samples.ClientID %>");
            var MasterTable = grid.get_masterTableView();
            var selectedRows = grid.get_selectedItems();
            var cs = selectedRows.length;

            if ((cs > 0) && (cs < 51)) {
                for (var i = 0; i < selectedRows.length; i++) {
                    var row = selectedRows[i];

                    if (i == 0) {
                        cell = MasterTable.getCellByColumnUniqueName(row, "SampleID");

                        SampleList = cell.innerHTML;
                    } else {
                        cell = MasterTable.getCellByColumnUniqueName(row, "SampleID");
                        SampleList = SampleList + ',' + cell.innerHTML;
                    }

                }
                var oWnd = radopen("AskDatasetPermission_Sample.aspx?CenterID=" + Center + "&PIID=" + PI + "&SampleList=" + SampleList, "RadWindow1");
                var h = $(document).height();
                var w = $(document).width();
                oWnd.set_height(0.47 * h);
                oWnd.set_width(0.5 * w);
                oWnd.center();
                oWnd.set_modal(true);
            } else {
                alert("Minimum and Maximum number of samples which can be selected are 0 and 50 respectfully.");
            }
        }--%>
    </script>
</telerik:RadScriptBlock>


