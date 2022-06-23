<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_DataSet_Samples.ascx.cs" Inherits="WebGAP.ACL.uc.uc_DataSet_Samples" %>

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
             
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="DDL_PIs">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_PIs" />
                <telerik:AjaxUpdatedControl ControlID="RG_DS_Dataset" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_SD_Samples" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_DS_Samples" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_SD_Dataset" LoadingPanelID="RadAjaxLoadingPanel1" />

            </UpdatedControls>
        </telerik:AjaxSetting>
      <telerik:AjaxSetting AjaxControlID="RG_DS_Dataset">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_DS_Dataset" />
                <telerik:AjaxUpdatedControl ControlID="RG_DS_Samples" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
      <%--    <telerik:AjaxSetting AjaxControlID="RG_DS_Dataset">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_DS_Dataset" />
                <telerik:AjaxUpdatedControl ControlID="RG_DS_Samples" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>--%>
   
       
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
                    <div class="card-header p-0">
                        <div style="background-color:aliceblue">Dataset - Samples</div>
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body">
                            <div class="form">
                                <div class="form-body">
                                    <h4 class="form-section">Dataset</h4>
                                    <div class="row">
                                        <div class="form-group">
                                            <telerik:RadGrid RenderMode="Lightweight" ID="RG_DS_Dataset" runat="server" GridLines="Both" OnItemCommand="RG_DS_Dataset_ItemCommand" PageSize="8"
                                                AllowSorting="True" AutoGenerateColumns="False" Height="300px" CellPadding="0" AllowPaging="true" OnPreRender="RG_DS_Dataset_PreRender"
                                                ShowStatusBar="True" DataSourceID="DS_Dataset" Font-Size="X-Small" OnItemDataBound="RG_DS_Dataset_ItemDataBound">
                                                <MasterTableView Name="Master" DataSourceID="DS_Dataset" AutoGenerateColumns="false" DataKeyNames="DatasetID,PIID,CenterID">
                                                    <ItemStyle Height="20px" />
                                                    <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                                                    <Columns>
                                                        <telerik:GridBoundColumn UniqueName="DatasetID" HeaderText="ID" DataField="DatasetID" FilterControlAltText="Filter DatasetID column" SortExpression="DatasetID" DataType="System.Int32" ReadOnly="True">
                                                            <HeaderStyle Width="120px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="120px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="CenterID" DataField="CenterID" Visible="false">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="SampleID" DataField="SampleID" Visible="false">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="DatasetName" HeaderText="Name" DataField="DatasetName" FilterControlAltText="Filter DatasetName column" SortExpression="DatasetName">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="DatasetDesc" HeaderText="Description" DataField="DatasetDesc" FilterControlAltText="Filter DatasetDesc column" SortExpression="DatasetDesc">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridTemplateColumn DataType="System.int32" DataField="DefaultDataset" UniqueName="DefaultDataset" Visible="false">
                                                            <HeaderStyle Width="40px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="40px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:HiddenField runat="server" ID="hdn_DefaultDataset" Value='<%# Eval("DefaultDataset") %>' />
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn DataType="System.int32" DataField="DatasetType" UniqueName="DatasetType" Groupable="False"
                                                            HeaderText="Type" HeaderStyle-Width="150px" FilterControlAltText="Filter DatasetType column" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="40px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="40px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:HiddenField runat="server" ID="hdn_Type" Value='<%# Eval("DatasetType") %>' />
                                                                <asp:ImageButton ID="Typebtn" BorderWidth="0px" Width="20px" runat="server"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn UniqueName="TemplateColumn5" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" Height="15px"></ItemStyle>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="newreq" BorderWidth="0px" ImageUrl="../../img/icon/icon_add.png" Width="15px" Height="15px" ToolTip="Add Sample"
                                                                    runat="server" CommandName="listsample"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn UniqueName="delete" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" Height="15px"></ItemStyle>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="delete" BorderWidth="0px" ImageUrl="../../img/icon/icon_delete.png" Width="17px" Height="17px" CommandName="deleteAllSamples" ToolTip="Delete All Samples"
                                                                    OnClientClick="return confirm('Are you sure you want to delete?')"
                                                                    runat="server"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                    </Columns>
                                                </MasterTableView>
                                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                                <ClientSettings EnableRowHoverStyle="true" AllowKeyboardNavigation="true" EnablePostBackOnRowClick="true">
                                                    <ClientEvents OnColumnMouseOut="OnColumnMouseOut" ></ClientEvents>
                                                    <Selecting AllowRowSelect="true" />
                                                    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                                                </ClientSettings>
                                                <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                                            </telerik:RadGrid>
                                        </div>
                                    </div>
                                    <h4 class="form-section">Samples</h4>
                                    <div class="row">
                                        <div class="form-group">
                                            <telerik:RadGrid RenderMode="Lightweight" ID="RG_DS_Samples" runat="server" GridLines="Both" OnItemDataBound="RG_DS_Samples_ItemDataBound" OnItemCommand="RG_DS_Samples_ItemCommand" AllowPaging="true" PageSize="8"
                                                AllowSorting="True" CellSpacing="0" Height="300px" Font-Size="X-Small" CellPadding="0" ShowStatusBar="True" DataSourceID="DS_DS_Samples" CssClass="Hover_Selected" >
                                                <MasterTableView Name="Master" AutoGenerateColumns="false" DataKeyNames="SampleID" DataSourceID="DS_DS_Samples">
                                                    <ItemStyle Height="20px" />
                                                    <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                                                    <Columns>
                                                        <telerik:GridBoundColumn UniqueName="SampleID" HeaderText="Sample ID" DataField="SampleID" FilterControlAltText="Filter SampleID column" SortExpression="SampleID" DataType="System.Int64">
                                                            <HeaderStyle Width="40%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="40%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="LocalID" HeaderText="Sample Local ID" DataField="LocalID" FilterControlAltText="Filter LocalID column" SortExpression="LocalID">
                                                            <HeaderStyle  Width="50%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle  Width="50%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <%--<telerik:GridBoundColumn UniqueName="SampleCenterDesc" HeaderText="Center" DataField="SampleCenterDesc" FilterControlAltText="Filter SampleCenterDesc column" SortExpression="SampleCenterDesc">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="PIName" HeaderText="PI Name" DataField="PIName" FilterControlAltText="Filter PIName column" SortExpression="PIName">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>--%>
                                                         <telerik:GridTemplateColumn UniqueName="delete" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                            <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" Height="15px"></ItemStyle>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="delete" BorderWidth="0px" ImageUrl="../../img/icon/icon_delete.png" Width="17px" Height="17px" CommandName="DeleteSingleSample"
                                                                    OnClientClick="return confirm('Are you sure you want to delete?')" ToolTip="Delete Sample"
                                                                    runat="server"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                         <telerik:GridTemplateColumn DataType="System.int32" DataField="DefaultDataset" UniqueName="DefaultDataset" Visible="false">
                                                            <HeaderStyle Width="40px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="40px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:HiddenField runat="server" ID="hdn_DefaultDataset" Value='<%# Eval("DefaultDataset") %>' />
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                       

                                                        <%--  --%>
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
                       <div style="background-color:aliceblue">Sample - Datasets</div>
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body">
                            <div class="form">
                                <div class="form-body">
                                    <h4 class="form-section">Sample</h4>

                                    <div class="row">

                                        <div class="form-group">
                                            <telerik:RadGrid RenderMode="Lightweight" ID="RG_SD_Samples" runat="server" GridLines="Both" AllowSorting="True" CellPadding="0" Height="300px" PageSize="8"
                                                ShowStatusBar="True" Font-Size="X-Small" DataSourceID="DS_SD_Samples" AllowPaging="true" CssClass="RG_Padding_ACL" OnPreRender="RG_SD_Samples_PreRender" OnItemCommand="RG_SD_Samples_ItemCommand">
                                                <MasterTableView Name="Master" AutoGenerateColumns="false" DataKeyNames="SampleID" DataSourceID="DS_SD_Samples">
                                                    <ItemStyle Height="20px" />
                                                    <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                                                    <Columns>
                                                        <telerik:GridBoundColumn UniqueName="SampleID" HeaderText="ID" DataField="SampleID" FilterControlAltText="Filter SampleID column" SortExpression="SampleID">
                                                            <HeaderStyle Width="50%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="50%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="LocalID" HeaderText="Local ID" DataField="LocalID" FilterControlAltText="Filter LocalID column" SortExpression="LocalID">
                                                            <HeaderStyle  Width="50%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle  Width="50%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                       <%-- <telerik:GridBoundColumn UniqueName="CenterDesc" HeaderText="Center" DataField="CenterDesc" FilterControlAltText="Filter CenterDesc column" SortExpression="CenterDesc">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="PIName" HeaderText="PI Name" DataField="PIName" FilterControlAltText="Filter PIName column" SortExpression="PIName">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>--%>
                                                       
                                                    </Columns>
                                                </MasterTableView>
                                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                                <ClientSettings EnableRowHoverStyle="true" AllowKeyboardNavigation="true" EnablePostBackOnRowClick="true" Selecting-AllowRowSelect="true">
                                                    <ClientEvents OnColumnMouseOut="OnColumnMouseOut" ></ClientEvents>
                                                    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                                                </ClientSettings>
                                                <SelectedItemStyle BackColor="Aqua"></SelectedItemStyle>
                                                <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                                            </telerik:RadGrid>
                                        </div>

                                    </div>
                                    <h4 class="form-section">Datasets</h4>
                                    <div class="row">

                                        <div class="form-group">
                                            <telerik:RadGrid RenderMode="Lightweight" ID="RG_SD_Dataset" runat="server" GridLines="Both" OnItemCommand="RG_SD_Dataset_ItemCommand" PageSize="8" AllowPaging="true"
                                                AllowSorting="True" CellSpacing="0" Font-Size="X-Small" CellPadding="0" Height="300px" AutoGenerateColumns="false" CssClass="Hover_Selected"
                                                ShowStatusBar="True" DataSourceID="DS_SD_Dataset" OnItemDataBound="RG_SD_Dataset_ItemDataBound">
                                                <MasterTableView Name="Master" AutoGenerateColumns="false" DataKeyNames="DataSetID" DataSourceID="DS_SD_Dataset">
                                                    <ItemStyle Height="20px" />
                                                    <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                                                    <Columns>
                                                        <telerik:GridBoundColumn UniqueName="DataSetID" HeaderText="Dataset ID" DataField="DataSetID" FilterControlAltText="Filter DataSetID column" SortExpression="DataSetID">
                                                            <HeaderStyle Width="80px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="80px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn UniqueName="DataSetName" HeaderText="Name" DataField="DataSetName" FilterControlAltText="Filter DataSetName column" SortExpression="DataSetName">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                                        </telerik:GridBoundColumn>
                                                       

                                                        <telerik:GridBoundColumn UniqueName="DatasetDesc" HeaderText="Description" DataField="DatasetDesc" FilterControlAltText="Filter DatasetDesc column" SortExpression="DatasetDesc">
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
                                                           <telerik:GridTemplateColumn DataType="System.int32" DataField="DefaultDataset" UniqueName="DefaultDataset" Visible="false">
                                                            <HeaderStyle Width="40px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                            <ItemStyle Width="40px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:HiddenField runat="server" ID="hdn_DefaultDataset" Value='<%# Eval("DefaultDataset") %>' />
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
                                                            <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" Height="15px"></ItemStyle>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="delete" BorderWidth="0px" ImageUrl="../../img/icon/icon_delete.png" Width="17px" Height="17px" CommandName="DeleteSingleSample"
                                                                    OnClientClick="return confirm('Are you sure you want to delete?')" ToolTip="Delete Dataset"
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
            NavigateUrl="/ACL/AddNewSampleToDataset.aspx" OnClientClose="refreshGrid">
        </telerik:RadWindow>
    </Windows>
</telerik:RadWindowManager>



<asp:SqlDataSource ID="DS_Dataset" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_DataSet_PI_Active_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:ControlParameter ControlID="DDL_PIs" Name="PIID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="DS_DS_Samples" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_DS_DataSet_Samples_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="RG_DS_Dataset" Name="DatasetID" PropertyName="SelectedValues['DatasetID']" Type="Int32" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="DS_SD_Samples" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_Sample_PI_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:ControlParameter ControlID="DDL_PIs" Name="PIID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="DS_SD_Dataset" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_DS_Sample_DataSetS_Sel" SelectCommandType="StoredProcedure" runat="server">
    <SelectParameters>
        <asp:ControlParameter ControlID="RG_SD_Samples" Name="SampleID" PropertyName="SelectedValue" Type="Int64" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <script type="text/javascript">


        function openWin() {

            var combo = $find("<%= DDL_Centers.ClientID %>");
            Center = combo.get_selectedItem().get_value();

            var comboPI = $find("<%= DDL_PIs.ClientID %>");
            PI = comboPI.get_selectedItem().get_value();

            if (Center === '-1') {
                return radalert("<br /><b> Select a center first! </b><br />");
            }
            if (PI === '-1') {
                return radalert("<br /><b> Select a PI first! </b><br />");
            }

            var h = $(document).height();
            var w = $(document).width();
            var oWnd = radopen("/ACL/AddNewSampleToDataset.aspx", "RadWindow2");
            oWnd.set_height(500);
            oWnd.set_width(0.5 * w);
            oWnd.center();
            oWnd.set_modal(true);
        }

        function refreshGrid(sender, eventArgs) {
            var grid = $find("<%=RG_DS_Dataset.ClientID%>").get_masterTableView();
            grid.rebind();
        }

    </script>
</telerik:RadScriptBlock>
