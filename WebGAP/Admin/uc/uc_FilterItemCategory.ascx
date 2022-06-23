<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_FilterItemCategory.ascx.cs" Inherits="WebGAP.Admin.uc.uc_FilterItemCategory" %>
<style>
    .h5-style {
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

    .info-icon {
        font-size: 16px;
        margin-left: 7px;
    }
    .RadGrid_Bootstrap{
       overflow-y:auto
   }
</style>

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_FilterItemCat">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_FilterItemCat" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RB_AddToWhereClausePrev">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RTB_WhereClause" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RB_AddToWhereClausePrev" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        
        <%-- <telerik:AjaxSetting AjaxControlID="DDL_ResourceTableName">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_ResourceTableFieldName" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="DDL_ResourceTableFieldValue" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>--%>
    </AjaxSettings>
</telerik:RadAjaxManager>

<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>


<div class="content-header" style="width: 100%; background-color: lightgray; display: flex; padding: 5px 10px; border-radius: 5px; margin: 15px 0">
    <table style="width: 100%;">
        <tr>
            <td style="width: 100px">
                <h4 style="color: white; text-shadow: 2px 2px 4px #000000;">Filter Item per Category</h4>
            </td>
        </tr>
    </table>
</div>

<div class="content-body pt-1">
    <section id="basic-form-layouts">
        <div class="row match-height">

            <asp:HiddenField runat="server" ID="hdf_OprIds" Value="" />
            <asp:HiddenField runat="server" ID="hdf_RSTblName" Value="" />
            <asp:HiddenField runat="server" ID="hdf_RTblFieldName" />
            <asp:HiddenField runat="server" ID="hdf_RTblFieldValue" />
            <asp:HiddenField runat="server" ID="hdf_WhereClause" />

            <telerik:RadGrid RenderMode="Lightweight" ID="RG_FilterItemCat" runat="server" GridLines="Both" Font-Size="Smaller" OnItemCommand="RG_FilterItemCat_ItemCommand"
                AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="-1" Height="730px" ShowStatusBar="True"
                AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" DataSourceID="DS_FilterItemCat">
                <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                <MasterTableView CommandItemDisplay="Top" Name="Master" AutoGenerateColumns="false" DataKeyNames="FCIId" DataSourceID="DS_FilterItemCat">
                    <CommandItemTemplate>
                        <telerik:RadButton RenderMode="Lightweight" runat="server" ID="RB_insert" CommandName="InitInsert" Text="Add New item" Height="33px" Font-Size="Smaller">
                            <Icon PrimaryIconUrl="~/img/icon/icon_insert_Sample.png" PrimaryHoveredIconUrl="~/img/icon/icon_insert_Sample_Hovered.png" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                        </telerik:RadButton>
                    </CommandItemTemplate>
                    <Columns>
                        <telerik:GridBoundColumn DataField="ItemFieldID" FilterControlAltText="Filter ItemFieldID column"
                            HeaderText="Item ID" SortExpression="ItemFieldID" UniqueName="ItemFieldID">
                            <HeaderStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ItemFieldDesc" FilterControlAltText="Filter ItemFieldDesc column"
                            HeaderText="Item decsription" SortExpression="ItemFieldDesc" UniqueName="ItemFieldDesc">
                            <HeaderStyle Width="7%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="7%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ItemFieldDefaultValue" FilterControlAltText="Filter ItemFieldDefaultValue column"
                            HeaderText="Default value" SortExpression="ItemFieldDefaultValue" UniqueName="ItemFieldDefaultValue">
                            <HeaderStyle Width="6%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="6%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ItemFieldMongoDB" FilterControlAltText="Filter ItemFieldMongoDB column"
                            HeaderText="MongoDB" SortExpression="ItemFieldMongoDB" UniqueName="ItemFieldMongoDB">
                            <HeaderStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ItemFieldType" FilterControlAltText="Filter ItemFieldType column"
                            HeaderText="FieldType" SortExpression="ItemFieldType" UniqueName="ItemFieldType">
                            <HeaderStyle Width="6%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="6%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <%-- <telerik:GridBoundColumn DataField="ItemFieldHint" FilterControlAltText="Filter ItemFieldHint column"
                            HeaderText="Hint" SortExpression="ItemFieldHint" UniqueName="ItemFieldHint">
                            <HeaderStyle Width="6%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="6%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="ResourceTableName" FilterControlAltText="Filter ResourceTableName column"
                            HeaderText="Res. tableVame" SortExpression="ResourceTableName" UniqueName="ResourceTableName">
                            <HeaderStyle Width="7%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="7%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ResourceTableFieldName" FilterControlAltText="Filter ResourceTableFieldName column"
                            HeaderText="Res. tableFieldName" SortExpression="ResourceTableFieldName" UniqueName="ResourceTableFieldName">
                            <HeaderStyle Width="8%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="8%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ResourceTableFieldValue" FilterControlAltText="Filter ResourceTableFieldValue column"
                            HeaderText="Res tableFieldValue" SortExpression="ResourceTableFieldValue" UniqueName="ResourceTableFieldValue">
                            <HeaderStyle Width="8%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="8%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="OperationNames" FilterControlAltText="Filter OperationNames column"
                            HeaderText="Operations" SortExpression="OperationNames" UniqueName="OperationNames">
                            <HeaderStyle Width="6%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="6%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ValueType" FilterControlAltText="Filter ValueType column"
                            HeaderText="ValueType" SortExpression="ValueType" UniqueName="ValueType">
                            <HeaderStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="GroupDesc" FilterControlAltText="Filter GroupDesc column" HeaderText="Parent Group"
                            ReadOnly="True" SortExpression="GroupDesc" UniqueName="GroupDesc">
                            <HeaderStyle Width="7%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="7%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CategoryName" FilterControlAltText="Filter CategoryName column" HeaderText="Parent Category" ReadOnly="True" SortExpression="CategoryName" UniqueName="CategoryName">
                            <HeaderStyle Width="7%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="7%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Formula" FilterControlAltText="Filter Formula column" HeaderText="Formula" ReadOnly="True" SortExpression="Formula" UniqueName="Formula">
                            <HeaderStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ItemState" FilterControlAltText="Filter ItemState column" HeaderText="Active/Not"
                            SortExpression="ItemState" UniqueName="ItemState">
                            <HeaderStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DateAdd" DataType="System.DateTime" FilterControlAltText="Filter DateAdd column" HeaderText="Date" SortExpression="DateAdd" UniqueName="DateAdd">
                            <HeaderStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridEditCommandColumn UniqueName="EditCommandColumn" ButtonType="ImageButton" EditImageUrl="~/img/icon/icon_edit.png" EnableHeaderContextMenu="false">
                            <HeaderStyle Width="45px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="45px" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridEditCommandColumn>
                        <telerik:GridButtonColumn CommandName="Delete" Text="Delete" UniqueName="Delete" EnableHeaderContextMenu="false"
                            ButtonType="ImageButton" ImageUrl="~/img/icon/icon_delete_min.png" ConfirmText="Are you sure?">
                            <HeaderStyle Width="35px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="35px" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridButtonColumn>
                        <telerik:GridBoundColumn DataField="ItemStyle" UniqueName="ItemStyle" Groupable="False" EnableHeaderContextMenu="false" Visible="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn DataField="OperationIds" UniqueName="OperationIds" Groupable="False" EnableHeaderContextMenu="false" Visible="false">
                            <ItemTemplate>
                                <asp:HiddenField runat="server" ID="hdn_OprId_Sel" Value='<%# Eval("OperationIds") %>' />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="ResourceTableName" UniqueName="ResourceTableName" Groupable="False" EnableHeaderContextMenu="false" Visible="false">
                            <ItemTemplate>
                                <asp:HiddenField runat="server" ID="hdn_RSTblName_Sel" Value='<%# Eval("ResourceTableName") %>' />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="WhereClause" UniqueName="WhereClause" Groupable="False" EnableHeaderContextMenu="false" Visible="false">
                            <ItemTemplate>
                                <asp:HiddenField runat="server" ID="hdn_WhereClause_Sel" Value='<%# Eval("WhereClause") %>' />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

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
                                                        <h5 class="content-header-title h5-style">
                                                            <i class="fa fa-plus-square m-r-13"></i>Add a new item
                                                        </h5>
                                                        <hr />

                                                        <div class="row">
                                                            <div class="col-md-8">
                                                                <div class="row">
                                                                    <label class="col-md-3 label-control text-right" for="DDL_GroupName">Assign to group</label>
                                                                    <div class="col-md-9">
                                                                        <telerik:RadComboBox runat="server" ID="DDL_GroupName" Width="80%" AutoPostBack="true"
                                                                            DataSourceID="DS_FilterGroup" DataValueField="GroupId" DataTextField="GroupCat" EnableVirtualScrolling="true"
                                                                            SelectedValue='<%# Bind("GroupId")%>' AppendDataBoundItems="True" EnableLoadOnDemand="true"
                                                                            class="btn btn-sm dropdown-toggle dropdown-menu-right brd-gray"
                                                                            EmptyMessage="Select the assosiated group...">
                                                                            <%--<asp:ListItem Value="" Selected="True">Select the assosiated group...</asp:ListItem>--%>
                                                                        </telerik:RadComboBox>
                                                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" Display="Dynamic"
                                                                            ControlToValidate="DDL_GroupName" ErrorMessage="*" Font-Size="Larger" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-2">
                                                            </div>
                                                        </div>
                                                        <hr />
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="Txt_ItemFieldID">Item Field ID</label>
                                                                    <div class="col-md-7">
                                                                        <telerik:RadTextBox Width="70%" ID="Txt_ItemFieldID" runat="server" Text='<%# Bind("ItemFieldID")%>'></telerik:RadTextBox>

                                                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" Display="Dynamic"
                                                                            ControlToValidate="Txt_ItemFieldID" ErrorMessage="*" Font-Size="Larger" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="Txt_ItemFieldDesc">Item Field Description</label>
                                                                    <div class="col-md-7">
                                                                        <telerik:RadTextBox Width="70%" ID="Txt_ItemFieldDesc" runat="server" Text='<%# Bind("ItemFieldDesc")%>'></telerik:RadTextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            
                                                            <div class="col-md-6">
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="Txt_ItemFieldMongoDB">MongoDB syntax</label>
                                                                    <div class="col-md-7">
                                                                        <telerik:RadTextBox Width="70%" ID="Txt_ItemFieldMongoDB" runat="server" Text='<%# Bind("ItemFieldMongoDB")%>'></telerik:RadTextBox>

                                                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator6" runat="server" Display="Dynamic"
                                                                            ControlToValidate="Txt_ItemFieldMongoDB" ErrorMessage="*" Font-Size="Larger" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="Txt_Formula">Formula</label>
                                                                    <div class="col-md-7">
                                                                        <telerik:RadTextBox Width="70%" ID="Txt_Formula" runat="server" Text='<%# Bind("Formula")%>'></telerik:RadTextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="Txt_ItemFieldType">Item Field Type</label>
                                                                    <div class="col-md-7">
                                                                        <telerik:RadComboBox ID="RCB__ItemFieldType" runat="server" DataSourceID="DS_ItemFieldType"
                                                                            DataTextField="ItemType" DataValueField="ItemType" EmptyMessage="Select the type of item field..."
                                                                            AppendDataBoundItems="True" SelectedValue='<%# Bind("ItemFieldType")%>' Width="70%"
                                                                            class="btn btn-sm dropdown-toggle dropdown-menu-right brd-gray">
                                                                        </telerik:RadComboBox>

                                                                        <%--<telerik:RadTextBox Width="70%" ID="Txt_ItemFieldType" runat="server" Text='<%# Bind("ItemFieldType")%>'></telerik:RadTextBox>--%>

                                                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator7" runat="server" Display="Dynamic"
                                                                            ControlToValidate="RCB__ItemFieldType" ErrorMessage="*" Font-Size="Larger" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="Txt_hint">Hint</label>
                                                                    <div class="col-md-7">
                                                                        <telerik:RadTextBox Width="70%" ID="Txt_hint" runat="server" Text='<%# Bind("ItemFieldHint")%>'></telerik:RadTextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="OperationIds">Operation</label>
                                                                    <div class="col-md-7">
                                                                        <telerik:RadComboBox runat="server" ID="OperationIds" Width="70%" CheckBoxes="true" OnItemDataBound="OperationIds_ItemDataBound"
                                                                            AppendDataBoundItems="True" EnableCheckAllItemsCheckBox="true" DataSourceID="Ds_Operation"
                                                                            class="btn btn-sm dropdown-toggle dropdown-menu-right brd-gray" DataValueField="OperationIds" DataTextField="OprName"
                                                                            EmptyMessage="Select the type of value...">
                                                                            <%--SelectedValue='<%# Bind("OperationIds")%>'--%>
                                                                            <%--<asp:ListItem Value="">Select the type of value...</asp:ListItem>--%>
                                                                        </telerik:RadComboBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" Display="Dynamic"
                                                                            ControlToValidate="OperationIds" ErrorMessage="*" Font-Size="Larger" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="DDL_ValueType">Value Type</label>
                                                                    <div class="col-md-7">
                                                                        <telerik:RadComboBox runat="server" ID="DDL_ValueType" Width="70%"
                                                                            DataSourceID="Ds_ValueType" DataValueField="ValueT" DataTextField="ValueT"
                                                                            SelectedValue='<%# Bind("ValueType")%>' AppendDataBoundItems="True"
                                                                            class="btn btn-sm dropdown-toggle dropdown-menu-right brd-gray" EmptyMessage="Select the type of value...">
                                                                        </telerik:RadComboBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                                                            ControlToValidate="DDL_ValueType" ErrorMessage="*" Font-Size="Larger" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="Txt_ItemFieldDefaultValue">Item Field Default Value</label>
                                                                    <div class="col-md-7">
                                                                        <telerik:RadTextBox Width="70%" ID="Txt_ItemFieldDefaultValue" runat="server" Text='<%# Bind("ItemFieldDefaultValue")%>'></telerik:RadTextBox>
                                                                    </div>
                                                                </div>
                                                            </div>                                                          
                                                            <div class="col-md-6">
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="Txt_ItemStyle">Item style</label>
                                                                    <div class="col-md-7">
                                                                        <telerik:RadTextBox Width="70%" ID="Txt_ItemStyle" runat="server" Text='<%# Bind("ItemStyle")%>'></telerik:RadTextBox>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="DDL_ItemState">Active/Not active</label>
                                                                    <div class="col-md-7">
                                                                        <asp:DropDownList runat="server" ID="DDL_ItemState" Width="70%"
                                                                            DataSourceID="Sql_Item_RCB_Status" DataValueField="val_ItemStatus" DataTextField="txt_ItemStatus"
                                                                            SelectedValue='<%# Bind("ItemState")%>' AppendDataBoundItems="True"
                                                                            class="btn btn-sm dropdown-toggle dropdown-menu-right brd-gray">
                                                                            <asp:ListItem Value="">Select the state of item...</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="RFV_ItemState" runat="server" Display="Dynamic"
                                                                            ControlToValidate="DDL_ItemState" ErrorMessage="*" Font-Size="Larger" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <h5 class="content-header-title h5-style">
                                                            <i class="fa fa-table m-r-13"></i>Add a resource details for item
                                                        </h5>
                                                        <hr />
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="Txt_ResourceTableName">
                                                                        Resource table name 
                                                                        <i class="fa fa-info-circle info-icon" runat="server" id="rtn_info"></i>
                                                                    </label>
                                                                    <div class="col-md-7">
                                                                        <telerik:RadComboBox runat="server" ID="DDL_ResourceTableName" Width="70%" AutoPostBack="true"
                                                                            DataSourceID="DS_ResourceTbl" DataValueField="TblName" DataTextField="TblName" OnSelectedIndexChanged="DDL_ResourceTableName_SelectedIndexChanged"
                                                                            AppendDataBoundItems="True" SelectedValue='<%# Bind("ResourceTableName")%>'
                                                                            class="btn btn-sm dropdown-toggle dropdown-menu-right brd-gray" EmptyMessage="Select the resource table...">
                                                                            <%-- OnClientSelectedIndexChanged="OnClientSelectedIndexChanged_DDL_ResourceTableName"--%>
                                                                        </telerik:RadComboBox>
                                                                        <%----%>
                                                                    </div>
                                                                    <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip1" runat="server" TargetControlID="rtn_info" ShowEvent="OnMouseOver"
                                                                        Position="TopRight" RelativeTo="Element">
                                                                        External source of data for this item field - e.g. Genelist item(Dropdown) fetches own data from a ResourceTable
                                                                    </telerik:RadToolTip>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="Txt_ResourceTableFieldName">
                                                                        ResourceTableFieldName
                                                                         <i class="fa fa-info-circle info-icon" runat="server" id="rtfn_info"></i>
                                                                    </label>
                                                                    <div class="col-md-7">
                                                                        <telerik:RadComboBox runat="server" ID="DDL_ResourceTableFieldName" Width="70%" OnSelectedIndexChanged="DDL_ResourceTableFieldName_SelectedIndexChanged"
                                                                            DataSourceID="DS_ResourceTbl_Col" DataValueField="ColName" DataTextField="ColName"
                                                                            AppendDataBoundItems="True" EmptyMessage="Select the item field name of the resource table..."
                                                                            class="btn btn-sm dropdown-toggle dropdown-menu-right brd-gray" OnItemDataBound="DDL_ResourceTableFieldName_ItemDataBound">
                                                                            <%-- SelectedValue='<%# Bind("ResourceTableFieldName") %>' --%>
                                                                        </telerik:RadComboBox>
                                                                    </div>
                                                                    <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip2" runat="server" TargetControlID="rtfn_info" ShowEvent="OnMouseOver"
                                                                        Position="TopRight" RelativeTo="Element">
                                                                        Item field name of the resource table to show in the UI                                                                   
                                                                    </telerik:RadToolTip>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="Txt_ResourceTableFieldValue">
                                                                        Resource Table Field Value
                                                                        <i class="fa fa-info-circle info-icon" runat="server" id="rtfv_info"></i>
                                                                    </label>
                                                                    <div class="col-md-7">
                                                                        <telerik:RadComboBox runat="server" ID="DDL_ResourceTableFieldValue" Width="70%"
                                                                            DataSourceID="DS_ResourceTbl_Col" DataValueField="ColName" DataTextField="ColName" OnItemDataBound="DDL_ResourceTableFieldValue_ItemDataBound"
                                                                            AppendDataBoundItems="True" EmptyMessage="Select the item field value of the resource table..."
                                                                            class="btn btn-sm dropdown-toggle dropdown-menu-right brd-gray" OnSelectedIndexChanged="DDL_ResourceTableFieldValue_SelectedIndexChanged">
                                                                            <%--SelectedValue='<%# Bind("ResourceTableFieldValue")%>'--%>
                                                                        </telerik:RadComboBox>
                                                                    </div>
                                                                    <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip3" runat="server" TargetControlID="rtfv_info" ShowEvent="OnMouseOver"
                                                                        Position="TopRight" RelativeTo="Element">
                                                                        Item field value of the resource table that we pass to the mongoDB                                                            
                                                                    </telerik:RadToolTip>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                            </div>
                                                        </div>
                                                        <hr />
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="form-group row">
                                                                   <label class="col-md-2 label-control">Where Clause</label>
                                                                     <i class="fa fa-info-circle info-icon" runat="server" id="wck_info"></i>
                                                                    <div class="col-md-2">
                                                                        <telerik:RadComboBox runat="server" ID="RCB_WhereClauseKey" Width="100%"
                                                                            DataSourceID="DS_ResourceTbl_Col" DataValueField="ColName" DataTextField="ColName" 
                                                                            AppendDataBoundItems="True" EmptyMessage="Select the key of the WHERE clause..."
                                                                            class="btn btn-sm dropdown-toggle dropdown-menu-right brd-gray" OnSelectedIndexChanged="DDL_ResourceTableFieldValue_SelectedIndexChanged">
                                                                            <%--SelectedValue='<%# Bind("ResourceTableFieldValue")%>'--%>
                                                                        </telerik:RadComboBox>
                                                                    </div>
                                                                    <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip5" runat="server" TargetControlID="wck_info" ShowEvent="OnMouseOver"
                                                                        Position="TopRight" RelativeTo="Element">
                                                                        The key of the condition that we pass to the sql as the WHERE clause                                                            
                                                                    </telerik:RadToolTip>
                                                                    <%-- -----------------------------------------------------------------------------------%>

                                                                     <div class="col-md-2">
                                                                        <telerik:RadComboBox runat="server" ID="RCB_opration_fixed" Width="100%"
                                                                            class="btn btn-sm dropdown-toggle dropdown-menu-right brd-gray" EmptyMessage="Operation" >
                                                                            <Items>
                                                                                <telerik:RadComboBoxItem runat="server" Text="equal" Value="=" />
                                                                               <%-- <telerik:RadComboBoxItem runat="server" Text="not equal" Value="<>"  />
                                                                                <telerik:RadComboBoxItem runat="server" Text="like" Value="like"  /> --%>
                                                                            </Items>
                                                                        </telerik:RadComboBox>
                                                                    </div>

                                                                    <%-- -----------------------------------------------------------------------------------%>
                                                                   
                                                                    <i class="fa fa-info-circle info-icon" runat="server" id="wcv_info"></i>
                                                                    <div class="col-md-3">
                                                                        <telerik:RadComboBox runat="server" ID="RCB_WhereClauseValue" Width="100%" 
                                                                            DataSourceID="DS_WhereClauseTbl_Col" DataValueField="item" DataTextField="item" 
                                                                            AppendDataBoundItems="True" EmptyMessage="Select the value of the WHERE clause..."
                                                                            class="btn btn-sm dropdown-toggle dropdown-menu-right brd-gray" >
                                                                        </telerik:RadComboBox>
                                                                    </div>
                                                                    <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip4" runat="server" TargetControlID="wcv_info" ShowEvent="OnMouseOver"
                                                                        Position="TopRight" RelativeTo="Element">
                                                                        The value of the condition that we pass to the sql as the WHERE clause                                                            
                                                                    </telerik:RadToolTip>
                                                                     <div class="col-md-2">
                                                                         <telerik:RadButton runat="server" ID="RB_AddToWhereClausePrev" Text="ADD"  RenderMode="Lightweight"
                                                                             OnClick="RB_AddToWhereClausePrev_Click"></telerik:RadButton>
                                                                     </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-9">
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="Txt_ItemStyle">Preview WHERE clause</label>
                                                                    <div class="col-md-7">
                                                                        <telerik:RadTextBox Width="80%" TextMode="MultiLine" Rows="3" Wrap="true" ID="RTB_WhereClause" runat="server" OnDataBinding="RTB_WhereClause_DataBinding"></telerik:RadTextBox>
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

<asp:SqlDataSource ID="DS_FilterItemCat" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_Filter_Item_Category_Sel" SelectCommandType="StoredProcedure"
    DeleteCommand="Sp_Filter_Item_Category_Del" DeleteCommandType="StoredProcedure"
    UpdateCommand="Sp_Filter_Item_Category_Upd" UpdateCommandType="StoredProcedure" OnUpdating="DS_FilterItemCat_Updating"
    InsertCommand="Sp_Filter_Item_Category_Ins" InsertCommandType="StoredProcedure">

    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
    <DeleteParameters>
        <asp:Parameter Name="FCIId" Type="Int32" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="GroupId" Type="Int32" />
        <asp:Parameter Name="FCIId" Type="Int32" />
        <asp:Parameter Name="ItemFieldID" Type="string" />
        <asp:Parameter Name="ItemFieldDesc" Type="string" />
        <asp:Parameter Name="ItemFieldDefaultValue" Type="string" />
        <asp:Parameter Name="ItemFieldMongoDB" Type="string" />
        <asp:Parameter Name="ItemFieldType" Type="string" />
        <asp:Parameter Name="ItemFieldHint" Type="string" DefaultValue="" />
        <asp:Parameter Name="ItemStyle" Type="string" DefaultValue="" />
        <asp:Parameter Name="ResourceTableName" Type="string" DefaultValue="" />
        <%--<asp:ControlParameter ControlID="hdf_OprIds" Name="OperationIds" PropertyName="Value" Type="string" />--%>
        <%--<asp:Parameter Name="ResourceTableFieldName" Type="string" DefaultValue="" />
            <asp:Parameter Name="ResourceTableFieldValue" Type="string" DefaultValue="" />--%>

        <asp:ControlParameter ControlID="hdf_RTblFieldName" Name="ResourceTableFieldName" PropertyName="Value" Type="string" />
        <asp:ControlParameter ControlID="hdf_RTblFieldValue" Name="ResourceTableFieldValue" PropertyName="Value" Type="string" />
        <asp:ControlParameter ControlID="hdf_WhereClause" Name="WhereClause" PropertyName="Value" Type="string" DefaultValue=" " />
        <asp:Parameter Name="Formula" Type="string" DefaultValue="" />

        <asp:Parameter Name="OperationIds" Type="string" />
        <asp:Parameter Name="ValueType" Type="string" />
        <asp:Parameter Name="ItemState" Type="Int16" DefaultValue="0" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterID" Type="String" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="GroupId" Type="Int32" />
        <asp:Parameter Name="ItemFieldID" Type="string" />
        <asp:Parameter Name="ItemFieldDesc" Type="string" />
        <asp:Parameter Name="ItemFieldDefaultValue" Type="string" />
        <asp:Parameter Name="ItemFieldMongoDB" Type="string" />
        <asp:Parameter Name="ItemFieldType" Type="string" />
        <asp:Parameter Name="ItemFieldHint" Type="string" DefaultValue="" />
        <asp:Parameter Name="ItemStyle" Type="string" DefaultValue="" />
        <asp:Parameter Name="ResourceTableName" Type="string" DefaultValue="" />

        <%--<asp:Parameter Name="ResourceTableFieldName" Type="string" DefaultValue="" />
            <asp:Parameter Name="ResourceTableFieldValue" Type="string" DefaultValue="" />--%>

        <asp:ControlParameter ControlID="hdf_RTblFieldName" Name="ResourceTableFieldName" PropertyName="Value" Type="string" />
        <asp:ControlParameter ControlID="hdf_RTblFieldValue" Name="ResourceTableFieldValue" PropertyName="Value" Type="string" />
        <asp:ControlParameter ControlID="hdf_WhereClause" Name="WhereClause" PropertyName="Value" Type="string" DefaultValue=" " />
        <asp:Parameter Name="Formula" Type="string" DefaultValue="" />

        <asp:ControlParameter ControlID="hdf_OprIds" Name="OperationIds" PropertyName="Value" Type="string" />
        <asp:Parameter Name="ValueType" Type="string" />
        <asp:Parameter Name="ItemState" Type="Int16" DefaultValue="0" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterID" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="Sql_Item_RCB_Status" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand=" Select 0 as val_ItemStatus , 'Not Active' as txt_ItemStatus union  Select 1 , 'Active' "></asp:SqlDataSource>

<asp:SqlDataSource ID="DS_FilterGroup" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_Filter_AssignedGroup_To_Category_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="DS_ResourceTbl" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_Filter_ResourceTbl_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="DS_ResourceTbl_Col" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_Filter_ResourceTbl_Col_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        <asp:ControlParameter ControlID="hdf_RSTblName" Name="TblName" PropertyName="Value" Type="string" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="DS_WhereClauseTbl_Col" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_Filter_WhereClauseTbl_Col_Sel" SelectCommandType="StoredProcedure" />

<asp:SqlDataSource ID="Ds_ValueType" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand=" Select 'String' as ValueT UNION select 'Integer' UNION select 'Decimal' "></asp:SqlDataSource>

<asp:SqlDataSource ID="DS_ItemFieldType" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand=" Select 'RadTextBox' as ItemType UNION select 'RadAutoCompleteBox' UNION select 'RadComboBox' UNION select 'RadCheckBoxList' UNION select 'RadComboBoxMultiSelected' UNION select 'RadComboBoxWithRadTextBox' "></asp:SqlDataSource>

<asp:SqlDataSource ID="Ds_Operation" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand=" Select FOId as OperationIds, OprName From Tbl_Filter_Operations "></asp:SqlDataSource>

<%-- SelectCommand="Sp_Filter_Opr_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
--%>

<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
    <script type="text/javascript"> 
        function OnClientSelectedIndexChanged_DDL_ResourceTableName(sender, eventArgs) {

            <%--var item = eventArgs.get_item();
            var ResTblField_Obj;
            
            var grid = $find("<%= RG_FilterItemCat.ClientID %>");
            var masterTable = grid.get_masterTableView();
            //  Edit mode
            if (grid.get_editItems().length > 0) {
                var gridCount = masterTable.get_editItems().length;
                for (var i = 0; i < gridCount; i++) {
                    item = masterTable.get_editItems()[i];
                    var ResTblField_Obj = $(item.get_editFormItem()).find("input[id*='DDL_ResourceTableFieldName']").get(0);
                    var ResTblName_Obj = $(item.get_editFormItem()).find("input[id*='DDL_ResourceTableName']").get(0);

                    var tt = ResTblField_Obj.id;
                    alert(tt);

                    var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                    var settings = ajaxManager.get_ajaxSettings();
                    var settingsList = ResTblName_Obj.id;
                    for (setting in settings) {
                        var initiatingControl = settings[setting].InitControlID;
                        var controls = settings[setting].UpdatedControls;
                        var controlList = tt;
                        for (control in controls) {
                            controlList += ' ' + controls[control].ControlID;
                        }
                        //settingsList += '\nInitiated by: ' + initiatingControl + '\nUpdated Controls: ' + controlList;
                        settingsList += '\nInitiated by: ' + initiatingControl + '\nUpdated Controls: ' + tt;
                    }
                    alert(settingsList); 
                    //$find("<%= RadAjaxManager1.ClientID %>").ajaxRequest(ResTblField_Obj);
                    //ResTblField_Obj.DataBind();
                   
                    //InitiateAjaxRequest(sender, ResTblField_Obj);
                    //alert(ResTblField_Obj.value);
                }
            }--%>
        }

        function InitiateAjaxRequest(argument1, argument2) {
            var ajaxManager = $find("<%= RadAjaxManager.GetCurrent(Page).ClientID %>");
            //var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(argument1, argument2);
        }

    </script>

</telerik:RadCodeBlock>

