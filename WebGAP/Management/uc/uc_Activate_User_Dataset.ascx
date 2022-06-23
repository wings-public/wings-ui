<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Activate_User_Dataset.ascx.cs" Inherits="WebGAP.Management.uc.uc_Activate_User_Dataset" %>


<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="btn_Activate">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btn_Activate" />
                <telerik:AjaxUpdatedControl ControlID="RG_AA_Available_Dataset" />
                <telerik:AjaxUpdatedControl ControlID="RG_AA_Active_Dataset" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="btn_Deactivate">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btn_Deactivate" />
                <telerik:AjaxUpdatedControl ControlID="RG_AA_Available_Dataset" />
                <telerik:AjaxUpdatedControl ControlID="RG_AA_Active_Dataset" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_AA_Available_Dataset">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_AA_Available_Dataset" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_AA_Active_Dataset">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_AA_Active_Dataset" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>


</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>

<script type="text/javascript" id="telerikClientEvents1">
    function OnColumnMouseOut(sender, args) {
    }
</script>


<div class="content-body pt-1">
    <section id="basic-form-layouts">
        <div class="row match-height">

            <div class="col-md-12">
                <div class="card">
                   
                    <div class="card-content collapse show">
                        <div class="card-body">
                            <div class="form">
                                <div class="form-body">
                                    <h4 class="form-section">Deactivated Dataset</h4>
                                    <div class="row">
                                        <div class="form-group">
                                            <div style="border-color: gainsboro; display: flex; flex-direction: row; justify-content: flex-end; padding: 4px 4px 4px 4px; font-size: smaller; background-color: #F3F3F3; box-shadow: inset 10px 10px 10px 10px rgba(0, 0, 197, 0.1)">
                                                <telerik:RadButton ID="btn_Activate" runat="server" Text="Activate data set(s)" ToolTip="Activate" OnClick="btn_Activate_Click" ButtonType="StandardButton" Checked="true" AutoPostBack="true">
                                                    <Icon PrimaryIconCssClass="" PrimaryIconLeft="4" PrimaryIconTop="4"></Icon>
                                                </telerik:RadButton>
                                            </div>
                                            <telerik:RadGrid RenderMode="Lightweight" ID="RG_AA_Available_Dataset" runat="server" GridLines="Both"
                                                AllowSorting="True" CellPadding="0" Height="300px"  ShowStatusBar="True"  DataSourceID="Ds_AA_Available_Dataset" AllowMultiRowSelection="true">
                                                <MasterTableView Name="Master" AutoGenerateColumns="false" DataSourceID="Ds_AA_Available_Dataset" DataKeyNames="DatasetID,TypeDS">
                                                    <Columns>
                                                        <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn1">
                                                             <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="40px"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="40px" />
                                                        </telerik:GridClientSelectColumn>
                                                        <telerik:GridBoundColumn DataField="DatasetID" DataType="System.Int32" FilterControlAltText="Filter DatasetID column" HeaderText="Data set ID" ReadOnly="True" SortExpression="DatasetID" UniqueName="DatasetID">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="CenterDesc" FilterControlAltText="Filter CenterDesc column" HeaderText="Center" ReadOnly="True" SortExpression="CenterDesc" UniqueName="CenterDesc">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="PIName" FilterControlAltText="Filter PIName column" HeaderText="PI Name" ReadOnly="True" SortExpression="PIName" UniqueName="PIName">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="DatasetName" FilterControlAltText="Filter DatasetName column" HeaderText="Dataset Name" ReadOnly="True" SortExpression="DatasetName" UniqueName="DatasetName">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="15%"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="15%" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="DatasetDesc" FilterControlAltText="Filter DatasetDesc column" HeaderText="Description" ReadOnly="True" SortExpression="DatasetDesc" UniqueName="DatasetDesc">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="200px"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="200px" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="TypeDS" FilterControlAltText="Filter TypeDS column" HeaderText="Dataset Type" ReadOnly="True" SortExpression="TypeDS" UniqueName="TypeDS">
                                                             <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                                                       </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="CountSample" DataType="System.Int32" FilterControlAltText="Filter CountSample column" HeaderText="Number of Sample" ReadOnly="True" SortExpression="CountSample" UniqueName="CountSample">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                                                        </telerik:GridBoundColumn>
                                                    </Columns>
                                                </MasterTableView>
                                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                                <ClientSettings EnableRowHoverStyle="true" AllowKeyboardNavigation="true" EnablePostBackOnRowClick="true" Selecting-AllowRowSelect="true">
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
                                    <h4 class="form-section">Activated Datasets</h4>
                                    <div class="row">
                                        <div class="form-group">
                                            <div style="border-color: gainsboro; display: flex; flex-direction: row; justify-content: flex-end; padding: 4px 4px 4px 4px; font-size: smaller; background-color: #F3F3F3; box-shadow: inset 10px 10px 10px 10px rgba(0, 0, 197, 0.1)">
                                                <telerik:RadButton ID="btn_Deactivate" runat="server" Text="Deactivate data set(s)" ToolTip="Deactivate" Font-Size="Small" OnClick="btn_Deactivate_Click">
                                                    <Icon PrimaryIconCssClass="" PrimaryIconLeft="4" PrimaryIconTop="4"></Icon>
                                                </telerik:RadButton>
                                            </div>
                                            <telerik:RadGrid RenderMode="Lightweight" ID="RG_AA_Active_Dataset" runat="server" GridLines="Both"
                                                AllowSorting="True" CellPadding="0" Height="300px"  ShowStatusBar="True" DataSourceID="Ds_AA_Active_Dataset" AllowMultiRowSelection="true">
                                                <MasterTableView Name="Master" AutoGenerateColumns="false" DataSourceID="Ds_AA_Active_Dataset" DataKeyNames="DatasetID,TypeDS">
                                                    <Columns>
                                                        <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn2">
                                                             <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="40px"></HeaderStyle>
                                                             <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="40px" />
                                                        </telerik:GridClientSelectColumn>
                                                        <telerik:GridBoundColumn DataField="DatasetID" DataType="System.Int32" FilterControlAltText="Filter DatasetID column" HeaderText="Dataset ID" ReadOnly="True" SortExpression="DatasetID" UniqueName="DatasetID">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="CenterDesc" FilterControlAltText="Filter CenterDesc column" HeaderText="Center" ReadOnly="True" SortExpression="CenterDesc" UniqueName="CenterDesc">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="PIName" FilterControlAltText="Filter PIName column" HeaderText="PI Name" ReadOnly="True" SortExpression="PIName" UniqueName="PIName">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="DatasetName" FilterControlAltText="Filter DatasetName column" HeaderText="Dataset Name" ReadOnly="True" SortExpression="DatasetName" UniqueName="DatasetName">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="15%"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="15%" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="DatasetDesc" FilterControlAltText="Filter DatasetDesc column" HeaderText="Description" ReadOnly="True" SortExpression="DatasetDesc" UniqueName="DatasetDesc">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="200px"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="200px" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="TypeDS" FilterControlAltText="Filter TypeDS column" HeaderText="Dataset Type" ReadOnly="True" SortExpression="TypeDS" UniqueName="TypeDS">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="CountSample" DataType="System.Int32" FilterControlAltText="Filter CountSample column" HeaderText="Number of Samples" ReadOnly="True" SortExpression="CountSample" UniqueName="CountSample">
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%"></HeaderStyle>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                                                        </telerik:GridBoundColumn>
                                                    </Columns>
                                                </MasterTableView>
                                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                                <ClientSettings EnableRowHoverStyle="true" AllowKeyboardNavigation="true" EnablePostBackOnRowClick="true" Selecting-AllowRowSelect="true">
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
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
</div>

<asp:SqlDataSource ID="Ds_AA_Available_Dataset" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommandType="StoredProcedure" SelectCommand="Sp_AA_Avail_DataSet_To_ActivateDS_Sel">
    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="Ds_AA_Active_Dataset" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommandType="StoredProcedure" SelectCommand="Sp_AA_User_Active_Dataset_Sel">
    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
