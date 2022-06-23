<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_User_Private_Dataset.ascx.cs" Inherits="WebGAP.Management.uc.uc_User_Private_Dataset" %>



<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_DPS_Dataset">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_DPS_Dataset" />
                <telerik:AjaxUpdatedControl ControlID="RG_DPS_Sample" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_DPS_Sample">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_DPS_Sample" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_DPS_Dataset">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_DPS_Dataset" />
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

<div class="content-header row">
    <div class="content-header-left col-md-6 col-12">
        <h3 class="content-header-title">
            <asp:PlaceHolder runat="server"><%: Page.Title %> </asp:PlaceHolder>
        </h3>
    </div>
    <div class="content-header-right col-md-6 col-12">
        <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
            <div class="btn-group" role="group">
            </div>
        </div>
    </div>
</div>
<div class="content-body pt-1">
    <section id="basic-form-layouts">
        <div class="row match-height">
            <div class="col-md-6">
                <div class="card">

                    <div class="card-content collapse show">
                        <div class="card-body">
                            <div class="form">
                                <div class="form-body">
                                    <h4 class="form-section">Dataset</h4>
                                    <telerik:RadGrid RenderMode="Lightweight" ID="RG_DPS_Dataset" runat="server" GridLines="Both"  AllowAutomaticDeletes="True"
                                        AllowSorting="True" AutoGenerateColumns="False" Height="700px" CellPadding="0" OnItemCommand="RG_DPS_Dataset_ItemCommand"
                                        ShowStatusBar="True" DataSourceID="Ds_DPS_Dataset" AllowAutomaticInserts="True">
                                        <MasterTableView Name="Master" DataSourceID="Ds_DPS_Dataset" CommandItemDisplay="Top" AutoGenerateColumns="false" DataKeyNames="UserDatasetID, UserID">
                                            <Columns>
                                                <telerik:GridBoundColumn DataField="UserID" DataType="System.Int32" FilterControlAltText="Filter UserID column" HeaderText="User ID" SortExpression="UserID" UniqueName="UserID">
                                                    <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="UserDatasetID" DataType="System.Int32" FilterControlAltText="Filter UserDatasetID column" HeaderText="Dataset ID" SortExpression="UserDatasetID" UniqueName="UserDatasetID">
                                                    <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="UserDatasetName" FilterControlAltText="Filter UserDatasetName column" HeaderText="Dataset Name" SortExpression="UserDatasetName" UniqueName="UserDatasetName">
                                                    <HeaderStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="UserDatasetDesc" FilterControlAltText="Filter UserDatasetDesc column" HeaderText="Description" SortExpression="UserDatasetDesc" UniqueName="UserDatasetDesc">
                                                    <HeaderStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="CountSample" DataType="System.Int32" FilterControlAltText="Filter CountSample column" HeaderText="No. of Samples" ReadOnly="True" SortExpression="CountSample" UniqueName="CountSample">
                                                    <HeaderStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>

                                                <telerik:GridTemplateColumn UniqueName="TemplateColumn5" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                    <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" Height="15px"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="newreq" BorderWidth="0px" ImageUrl="../../img/icon/icon_add.png" Width="15px" Height="15px" ToolTip="Add Sample" CommandName="newReq"
                                                            runat="server"></asp:ImageButton>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                   <telerik:GridTemplateColumn UniqueName="delete" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                                    <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"  Height="15px"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="delete" BorderWidth="0px" ImageUrl="../../img/icon/icon_delete.png" Width="17px" Height="17px" CommandName="Delete"
                                                            OnClientClick="return confirm('Are you sure you want to delete?')" ToolTip="Delete"
                                                            runat="server"></asp:ImageButton>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>

                                            </Columns>
                                            <CommandItemSettings ShowRefreshButton="false" />

                                            <EditFormSettings EditFormType="Template">
                                                <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
                                                <FormTemplate>
                                                    <div class="row">
                                                        <div class="col-md-12 ">
                                                            <div class="card">

                                                                <div class="card-body">
                                                                    <div class="card-block">
                                                                        <div class="form form-horizontal">
                                                                            <div class="form-body">
                                                                                <div class="row mt-1">
                                                                                    <div class="col-md-6">
                                                                                        <div class="form-group row">
                                                                                            <label class="col-md-4 label-control" for="Txt_DatasetName"> Name</label>
                                                                                            <div class="col-md-7">
                                                                                                <asp:TextBox ID="Txt_DatasetName" Text='<%# Bind("UserDatasetName")%>' class="form-control" runat="server"></asp:TextBox>
                                                                                            </div>
                                                                                             <div class="col-md-1">
                                                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" Display="Dynamic"
                                                                                                    ControlToValidate="Txt_DatasetName" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-md-6">
                                                                                        <div class="form-group row">
                                                                                            <label class="col-md-4 label-control" for="txt_DatasetDesc"> Description</label>
                                                                                            <div class="col-md-7">
                                                                                                <asp:TextBox ID="txt_DatasetDesc" runat="server" Text='<%# Bind("UserDatasetDesc")%>' class="form-control"></asp:TextBox>
                                                                                            </div>
                                                                                            <div class="col-md-1">
                                                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator7" runat="server" Display="Dynamic"
                                                                                                    ControlToValidate="txt_DatasetDesc" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="form-actions m-0 pt-1 pb-0 center">
                                                                                    <asp:Button ID="btnUpdate" ValidationGroup="SubmitGroup" Text='<%# (Container is GridEditFormInsertItem) ? "Insert" : "Update" %>' class="btn btn-success mr-1 ladda-button btn-sm" data-style="expand-right"
                                                                                        runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'></asp:Button>&nbsp;
                                                                                    <asp:Button ID="Button1" Text="Cancel" runat="server" CausesValidation="False" class="btn btn-danger mr-1 ladda-button btn-sm" data-style="expand-right"
                                                                                      CommandName="Cancel"></asp:Button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </FormTemplate>
                                            </EditFormSettings>
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
            <div class="col-md-6">
                <div class="card">
                    <div class="card-content collapse show">
                        <div class="card-body">
                            <div class="form">
                                <h4 class="form-section">Samples</h4>
                                <telerik:RadGrid RenderMode="Lightweight" ID="RG_DPS_Sample" runat="server" GridLines="Both"
                                    AllowSorting="True" Height="700px" CellPadding="0" ShowStatusBar="True" DataSourceID="Ds_DPS_Sample" AllowAutomaticDeletes="true">
                                    <MasterTableView Name="Master" AutoGenerateColumns="false" DataSourceID="Ds_DPS_Sample" DataKeyNames="UserDatasetID, SampleID" NoMasterRecordsText="No record to display.">
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="UserDatasetID" DataType="System.Int32" FilterControlAltText="Filter UserDatasetID column" HeaderText="User ID" SortExpression="UserDatasetID" UniqueName="UserDatasetID">
                                                <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="SampleID" DataType="System.Int64" FilterControlAltText="Filter SampleID column" HeaderText="Sample ID" SortExpression="SampleID" UniqueName="SampleID">
                                                <HeaderStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="CenterDesc" FilterControlAltText="Filter CenterDesc column" HeaderText="Center" SortExpression="CenterDesc" UniqueName="CenterDesc">
                                                <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="LocalID" DataType="System.Int32" FilterControlAltText="Filter LocalID column" HeaderText="Local ID" SortExpression="LocalID" UniqueName="LocalID">
                                                <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="OldDatasetID" DataType="System.Int32" FilterControlAltText="Filter OldDatasetID column" HeaderText="Old Dataset ID" SortExpression="OldDatasetID" UniqueName="OldDatasetID">
                                                <HeaderStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>
                                            <%-- <telerik:GridBoundColumn DataField="DatasetName" FilterControlAltText="Filter DatasetName column" HeaderText="DatasetName" SortExpression="DatasetName" UniqueName="DatasetName">
                                            </telerik:GridBoundColumn>--%>
                                            <telerik:GridBoundColumn DataField="PIName" FilterControlAltText="Filter PIName column" HeaderText="PI" SortExpression="PIName" UniqueName="PIName">
                                                <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridButtonColumn CommandName="Delete" Text="Delete Sample" UniqueName="Delete" EnableHeaderContextMenu="false"
                                                ButtonType="ImageButton" ImageUrl="~/img/icon/icon_delete.png" ConfirmText="Are you sure?">
                                                <HeaderStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </telerik:GridButtonColumn>
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


<telerik:RadWindowManager ID="RadWindowManager2" ShowContentDuringLoad="true" RenderMode="Lightweight"
    ReloadOnShow="true" runat="server" EnableShadow="true"
    Skin="Windows7" AutoSize="false" Modal="true" VisibleStatusbar="false" VisibleTitlebar="false">
    <Windows>
        <telerik:RadWindow ID="RadWindow2" runat="server" RenderMode="Lightweight" BorderStyle="None" BorderWidth="1px" CssClass="px-0 pb-0"
            NavigateUrl="/Management/AddSampleToPrivate.aspx" OnClientClose="refreshGrid">
        </telerik:RadWindow>
    </Windows>
</telerik:RadWindowManager>

<asp:SqlDataSource ID="Ds_DPS_Dataset" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    DeleteCommand="Sp_User_Private_Dataset_Del" DeleteCommandType="StoredProcedure"
    InsertCommand="Sp_User_Private_Dataset_Ins" InsertCommandType="StoredProcedure"
    SelectCommand="Sp_User_Private_Dataset_Sel" SelectCommandType="StoredProcedure"
    UpdateCommand="Sp_User_Private_Dataset_Upd" UpdateCommandType="StoredProcedure">
    <InsertParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        <asp:Parameter Name="UserDatasetName" Type="String" />
        <asp:Parameter Name="UserDatasetDesc" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        <asp:Parameter Name="UserDatasetID" Type="Int32" />
        <asp:Parameter Name="UserDatasetName" Type="String" />
        <asp:Parameter Name="UserDatasetDesc" Type="String" />
    </UpdateParameters>
    <DeleteParameters>
        <asp:Parameter Name="Type" Type="Int16" DefaultValue="1" />
        <asp:Parameter Name="UserDatasetID" Type="Int32" />
        <asp:Parameter Name="UserID" Type="Int32" DefaultValue="0" />
    </DeleteParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="Ds_DPS_Sample" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_UPDS_Samples_Sel" SelectCommandType="StoredProcedure"
    DeleteCommand="Sp_UPDS_SampleS_Del" DeleteCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        <asp:ControlParameter ControlID="RG_DPS_Dataset" Name="UserDatasetID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
    </SelectParameters>
    <DeleteParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        <asp:Parameter Name="UserDatasetID" Type="Int32" />
        <asp:Parameter Name="SampleID" Type="Int64" />
        <asp:Parameter Name="Type" Type="Int16" DefaultValue="0" />
    </DeleteParameters>
</asp:SqlDataSource>


<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
        <script type="text/javascript">
            function openWin() {
                var oWnd = radopen("/Management/AddSampleToPrivate.aspx", "RadWindow2");
                var h = $(document).height();
                var w = $(document).width();
                oWnd.set_height(0.47 * h);
                oWnd.set_width(0.7 * w);

                oWnd.center();
                oWnd.set_modal(true);
            }

            function refreshGrid(sender, eventArgs) {
            //    var gridSample = $find("<%=RG_DPS_Sample.ClientID%>").get_masterTableView();
                var gridDataset = $find("<%=RG_DPS_Dataset.ClientID%>").get_masterTableView();
                //      gridSample.rebind();
                gridDataset.rebind();

            }


        </script>
    </telerik:RadScriptBlock>

</telerik:RadScriptBlock>
