<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_FilterOperation.ascx.cs" Inherits="WebGAP.Admin.uc.uc_FilterOperation" %>
<style>
    .h3-style {
        background: #dff7f5;
        border-radius: 5px;
        padding: 10px;
    }

    .brd-gray {
        border: 1px solid #bbb;
    }

    .RadGrid_MetroTouch .rgHoveredRow {
        background-color: #D5EDF1 !important;
        border-color: #25a0da !important;
    }

    .m-r-13 {
        margin-right: 13px !important
    }
</style>

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_FilterOpr">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_FilterOpr" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>

<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>


<div class="content-header" style="width: 100%; background-color: lightgray; display: flex; padding: 5px 10px; border-radius: 5px; margin: 15px 0">
    <table style="width: 100%;">
        <tr>
            <td style="width: 100px">
                <h3 style="color: white; text-shadow: 2px 2px 4px #000000;">
                    Operation
                </h3>
            </td>
        </tr>
    </table>
</div>

<div class="content-body pt-1">
    <section id="basic-form-layouts">
        <div class="row match-height">

            <telerik:RadGrid RenderMode="Lightweight" ID="RG_FilterOpr" runat="server" GridLines="Both" Font-Size="Smaller" OnItemCommand="RG_FilterOpr_ItemCommand"
                AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="-1" Height="530px" ShowStatusBar="True" 
                AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" DataSourceID="DS_FilterOpr">
                <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                <MasterTableView CommandItemDisplay="Top" Name="Master" AutoGenerateColumns="false" DataKeyNames="FOId" DataSourceID="DS_FilterOpr">
                    <CommandItemTemplate>
                        <telerik:RadButton RenderMode="Lightweight" runat="server" ID="RB_insert" CommandName="InitInsert" Text="Add New operation" Height="33px" Font-Size="Smaller">
                            <Icon PrimaryIconUrl="~/img/icon/icon_insert_Sample.png" PrimaryHoveredIconUrl="~/img/icon/icon_insert_Sample_Hovered.png" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                        </telerik:RadButton>
                    </CommandItemTemplate>
                    <Columns>
                        <telerik:GridBoundColumn DataField="OprName" FilterControlAltText="Filter OprName column" HeaderText="Operation" SortExpression="OprName" UniqueName="OprName">
                            <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="OprValue" FilterControlAltText="Filter OprValue column" HeaderText="MongoDB syntax" ReadOnly="True" SortExpression="OprValue" UniqueName="OprValue">
                            <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="OprDesc" FilterControlAltText="Filter OprDesc column" HeaderText="Decsription" SortExpression="OprDesc" UniqueName="OprDesc">
                            <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="OprState" FilterControlAltText="Filter OprState column" HeaderText="Active or not" SortExpression="OprState" UniqueName="OprState">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DateAdd" DataType="System.DateTime" FilterControlAltText="Filter DateAdd column" HeaderText="Created date" SortExpression="DateAdd" UniqueName="DateAdd">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridEditCommandColumn UniqueName="EditCommandColumn" ButtonType="ImageButton" EditImageUrl="~/img/icon/icon_edit.png" EnableHeaderContextMenu="false">
                            <HeaderStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridEditCommandColumn>
                        <telerik:GridButtonColumn CommandName="Delete" Text="Delete" UniqueName="Delete" EnableHeaderContextMenu="false"
                            ButtonType="ImageButton" ImageUrl="~/img/icon/icon_delete_min.png" ConfirmText="Are you sure?">
                            <HeaderStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridButtonColumn>

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
                                                        <h3 class="content-header-title h3-style">
                                                            <i class="fa fa-plus-square"></i>Add a new operation
                                                        </h3>
                                                        <hr />

                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="Txt_OprName">Opareation</label>
                                                                    <div class="col-md-7">
                                                                        <telerik:RadTextBox Width="70%" EmptyMessage="like =, >, =<" ID="Txt_OprName" runat="server" Text='<%# Bind("OprName")%>'></telerik:RadTextBox>

                                                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" Display="Dynamic"
                                                                            ControlToValidate="Txt_OprName" ErrorMessage="*" Font-Size="Larger" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group row">
                                                                    <label class="col-md-2 label-control" for="Txt_OprValue">MongoDB syntax</label>
                                                                    <div class="col-md-7">
                                                                        <telerik:RadTextBox Width="70%" EmptyMessage="like $eq, $gr" ID="Txt_OprValue" runat="server" Text='<%# Bind("OprValue")%>'></telerik:RadTextBox>
                                                                    
                                                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator4" runat="server" Display="Dynamic"
                                                                            ControlToValidate="Txt_OprValue" ErrorMessage="*" Font-Size="Larger" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                  
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="Txt_OprDesc">Description</label>
                                                                    <div class="col-md-7">
                                                                        <telerik:RadTextBox Width="70%" ID="Txt_OprDesc" runat="server" Text='<%# Bind("OprDesc")%>'></telerik:RadTextBox>
  </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group row">
                                                                    <label class="col-md-2 label-control" for="DDL_OprState">Active/Not active</label>
                                                                    <div class="col-md-7">
                                                                        <asp:DropDownList runat="server" ID="DDL_OprState" Width="70%"
                                                                            DataSourceID="Sql_Opr_RCB_Status" DataValueField="val_OprStatus" DataTextField="txt_OprStatus"
                                                                            SelectedValue='<%# Bind("OprState")%>' AppendDataBoundItems="True"
                                                                            class="btn btn-sm dropdown-toggle dropdown-menu-right brd-gray">
                                                                            <asp:ListItem Value="">Select the state of operation...</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" Display="Dynamic"
                                                                            ControlToValidate="DDL_OprState" ErrorMessage="*" Font-Size="Larger" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>


                                                    <div class="form-actions m-0 pt-1 pb-0 center">
                                                        <asp:Button ID="btnUpdate" ValidationGroup="SubmitGroup" Text='<%# (Container is GridEditFormInsertItem) ? "Insert" : "Update" %>' class="btn btn-success mr-1 ladda-button btn-sm" data-style="expand-right"
                                                            runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'></asp:Button>&nbsp;
                                                                <asp:Button ID="btnCancel" Text="Cancel" runat="server" CausesValidation="False" class="btn btn-danger mr-1 ladda-button btn-sm" data-style="expand-right"
                                                                    CommandName="Cancel"></asp:Button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </FormTemplate>
                    </EditFormSettings>

                    <PagerStyle AlwaysVisible="True"></PagerStyle>
                </MasterTableView>
                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <ClientSettings EnableRowHoverStyle="true">
                    <Selecting AllowRowSelect="true" />
                    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                </ClientSettings>
                <FilterMenu RenderMode="Lightweight"></FilterMenu>
                <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
            </telerik:RadGrid>
        </div>
    </section>
</div>

<asp:SqlDataSource ID="DS_FilterOpr" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_Filter_Opr_Sel" SelectCommandType="StoredProcedure"
    DeleteCommand="Sp_Filter_Opr_Del" DeleteCommandType="StoredProcedure"
    UpdateCommand="Sp_Filter_Opr_Upd" UpdateCommandType="StoredProcedure"
    InsertCommand="Sp_Filter_Opr_Ins" InsertCommandType="StoredProcedure">

    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
    <DeleteParameters>
        <asp:Parameter Name="FOId" Type="Int32" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="FOId" Type="Int32" />
        <asp:Parameter Name="OprName" Type="string" />
        <asp:Parameter Name="OprValue" Type="string" />
        <asp:Parameter Name="OprDesc" Type="string" />
        <asp:Parameter Name="OprState" Type="Int16" DefaultValue="0" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterID" Type="String" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="OprName" Type="string" />
        <asp:Parameter Name="OprValue" Type="string" />
        <asp:Parameter Name="OprDesc" Type="string" />
        <asp:Parameter Name="OprState" Type="Int16" DefaultValue="0" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterID" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="Sql_Opr_RCB_Status" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand=" Select 0 as val_OprStatus , 'Not Active' as txt_OprStatus union  Select 1 , 'Active' "></asp:SqlDataSource>


