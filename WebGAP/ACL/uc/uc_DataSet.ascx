<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_DataSet.ascx.cs" Inherits="WebGAP.ACL.uc.uc_DataSet" %>


<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="DDL_Centers">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_Centers" />
                  <telerik:AjaxUpdatedControl ControlID="DDL_PIs" />
                <telerik:AjaxUpdatedControl ControlID="RG_DataSet" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
           <telerik:AjaxSetting AjaxControlID="DDL_PIs">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_PIs" />
                <telerik:AjaxUpdatedControl ControlID="RG_DataSet" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_DataSet">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_DataSet" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>

<script type="text/javascript" id="telerikClientEvents1">
    function RG_ActivateUsers_OnColumnMouseOut(sender, args) {
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

<div class="content-body pt-1">
    <section id="basic-form-layouts">
        <div class="row match-height">
            <telerik:RadGrid RenderMode="Lightweight" ID="RG_DataSet" runat="server" GridLines="Both"
                AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="-1" Height="700px" OnItemUpdated="RG_DataSet_ItemUpdated" OnItemDataBound="RG_DataSet_ItemDataBound"
                ShowStatusBar="True" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" DataSourceID="DS_DataSet" OnItemCommand="RG_DataSet_ItemCommand"
                AllowAutomaticUpdates="True">
                <PagerStyle Mode="NextPrevAndNumeric" AlwaysVisible="true" />
                <MasterTableView CommandItemDisplay="top" DataSourceID="DS_DataSet" Name="Master" AutoGenerateColumns="false" EditFormSettings-PopUpSettings-KeepInScreenBounds="true" DataKeyNames="PIID,DatasetID">
                    <CommandItemSettings ShowRefreshButton="false" />
                    <Columns>
                        <telerik:GridBoundColumn UniqueName="DatasetID" HeaderText="Dataset ID" DataField="DatasetID" FilterControlAltText="Filter DatasetID column" SortExpression="DatasetID">
                            <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Smaller" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn UniqueName="DataSetName" DataField="DataSetName" FilterControlAltText="Filter DataSetName column" HeaderText="Dataset Name" SortExpression="DataSetName" ReadOnly="True">
                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Smaller" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn UniqueName="DatasetDesc" DataField="DatasetDesc" FilterControlAltText="Filter DatasetDesc column" HeaderText="Description" SortExpression="DatasetDesc" ReadOnly="True">
                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Smaller" />
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn DataType="System.int32" DataField="DatasetType" UniqueName="DatasetType" Groupable="False"
                            HeaderText="Type" HeaderStyle-Width="150px" FilterControlAltText="Filter DatasetType column" EnableHeaderContextMenu="false">
                            <HeaderStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:HiddenField runat="server" ID="hdn_Type" Value='<%# Eval("DatasetType") %>' />
                                <asp:ImageButton ID="Typebtn" BorderWidth="0px" Width="24px" runat="server"></asp:ImageButton>
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
                        <telerik:GridEditCommandColumn UniqueName="EditCommandColumn" ButtonType="ImageButton"
                            EditImageUrl="~/img/icon/icon_edite.png" EnableHeaderContextMenu="false">
                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="60px" />
                        </telerik:GridEditCommandColumn>
                    </Columns>
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
                                                        <div class="row">
                                                            <div class="col-6">
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="Txt_Dataset_ID">Dataset ID</label>
                                                                    <div class="col-md-8">
                                                                        <asp:TextBox ID="Txt_DatasetID" disabled="disabled" Text='<%# Bind("DatasetID")%>' class="form-control" runat="server"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-6">
                                                                <div class="form-group row">
                                                                    <label class="col-3 label-control" for="txt_DatasetName">Dataset Name</label>
                                                                    <div class="col-md-8">
                                                                        <asp:TextBox ID="Txt_DataSetName" runat="server" Text='<%# Bind("DataSetName")%>' class="form-control"></asp:TextBox>
                                                                    </div>
                                                                    <div class="col-1">
                                                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator7" runat="server" Display="Dynamic"
                                                                            ControlToValidate="Txt_DataSetName" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-6">
                                                                <div class="form-group row">
                                                                    <asp:Label ID="Label9" runat="server" Text="Type" class="col-3 label-control" for="projectinput2"></asp:Label>
                                                                    <div class="col-8">
                                                                        <asp:DropDownList ID="DDL_Dataset_Type" runat="server" Width="150px" DataSourceID="Sql_Dataset_Type" DataTextField="DatasetTypeDesc" DataValueField="DatasetTypeID"
                                                                            SelectedValue='<%# Bind ("DatasetType")%>' AppendDataBoundItems="True" class="form-control">
                                                                            <asp:ListItem Value="">Select one</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </div>
                                                                    <div class="col-1">
                                                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" Display="Dynamic"
                                                                            ControlToValidate="DDL_Dataset_Type" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-6">
                                                                <div class="form-group row">
                                                                    <asp:Label ID="Label1" runat="server" Text="Status" class="col-3 label-control" for="projectinput2"></asp:Label>
                                                                    <div class="col-8">
                                                                        <asp:DropDownList ID="DDL_Dataset_Status" runat="server" Width="150px" DataSourceID="Sql_Dataset_Status" DataTextField="txt_DatasetStatus" DataValueField="DatasetStatus"
                                                                            SelectedValue='<%# Bind ("DatasetStatus")%>' AppendDataBoundItems="True" class="form-control">
                                                                            <asp:ListItem Value="">Select one</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </div>
                                                                    <div class="col-1">
                                                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" Display="Dynamic"
                                                                            ControlToValidate="DDL_Dataset_Type" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <div class="form-group row">
                                                                    <asp:Label ID="DatasetDesc" runat="server" class="col-md-2 label-control" for="txt_DatasetDesc"> Dataset Description</asp:Label>
                                                                    <div class="col-md-9">
                                                                        <asp:TextBox TextMode="MultiLine" Rows="4" ID="Txt_DatasetDesc" runat="server" Text='<%# Bind("DatasetDesc")%>' class="form-control"></asp:TextBox>

                                                                    </div>
                                                                    <div class="col-md-1">
                                                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" Display="Dynamic"
                                                                            ControlToValidate="Txt_DatasetDesc" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
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
                <ClientSettings EnableRowHoverStyle="true" Selecting-AllowRowSelect="false">
                    <ClientEvents OnColumnMouseOut="RG_ActivateUsers_OnColumnMouseOut"></ClientEvents>
                    <Selecting AllowRowSelect="true" />
                    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                </ClientSettings>
                <FilterMenu RenderMode="Lightweight"></FilterMenu>
                <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
            </telerik:RadGrid>
        </div>
    </section>
</div>



<asp:SqlDataSource ID="DS_DataSet" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_DataSet_PI_Sel" SelectCommandType="StoredProcedure"
    UpdateCommand="Sp_DateSet_Upd" UpdateCommandType="StoredProcedure" InsertCommand="Sp_Dataset_Ins" InsertCommandType="StoredProcedure">
    <InsertParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int16" />
        <asp:ControlParameter ControlID="DDL_PIs" Name="PIID" PropertyName="SelectedValue" Type="Int16" />
        <asp:Parameter Name="DatasetID" Type="Int32" />
        <asp:Parameter Name="DatasetName" Type="String" />
        <asp:Parameter Name="DatasetDesc" Type="String" />
        <asp:Parameter Name="DatasetType" Type="Int32" />
        <asp:Parameter Name="DatasetStatus" Type="Int32" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:ControlParameter ControlID="DDL_PIs" Name="PIID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int16" />
        <asp:ControlParameter ControlID="DDL_PIs" Name="PIID" PropertyName="SelectedValue" Type="Int16" />
        <asp:Parameter Name="DatasetID" Type="Int32" />
        <asp:Parameter Name="DatasetName" Type="String" />
        <asp:Parameter Name="DatasetDesc" Type="String" />
        <asp:Parameter Name="DatasetType" Type="Int16" />
        <asp:Parameter Name="DatasetStatus" Type="Int16" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="Sql_Dataset_Status" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand=" Select 0 as DatasetStatus , 'Inactive' as txt_DatasetStatus union  Select 1, 'Active' "></asp:SqlDataSource>
<asp:SqlDataSource ID="Sql_Dataset_Type" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_DatasetType_Sel" SelectCommandType="StoredProcedure"></asp:SqlDataSource>




