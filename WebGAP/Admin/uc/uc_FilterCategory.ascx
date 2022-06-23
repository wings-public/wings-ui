<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_FilterCategory.ascx.cs" Inherits="WebGAP.Admin.uc.uc_FilterCategory" %>
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
   .RadGrid_Bootstrap{
       overflow-y:auto
   }
</style>

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_FilterCat">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_FilterCat" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>

<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>


<div class="content-header" style=" width: 100%; background-color: lightgray; display: flex; padding: 10px; border-radius: 5px; margin: 15px 0; ">
    <table style="width: 100%;">
        <tr>
            <td style="width: 100px">
                <h3 style="color:white; text-shadow: 2px 2px 4px #000000;">
                    Filter Category

                </h3>
            </td>
        </tr>
    </table>
</div>

<div class="content-body pt-1">
    <section id="basic-form-layouts">
        <div class="row match-height">
            <asp:HiddenField runat="server" ID="hdf_AnalysTyps" Value="" />

            <telerik:RadGrid RenderMode="Lightweight" ID="RG_FilterCat" runat="server" GridLines="Both" Font-Size="Smaller" OnItemCommand="RG_FilterCat_ItemCommand"
                AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="-1" Height="530px" ShowStatusBar="True"
                AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" DataSourceID="DS_FilterCat">
                <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                <MasterTableView CommandItemDisplay="Top" Name="Master" AutoGenerateColumns="false" DataKeyNames="FCId" DataSourceID="DS_FilterCat">
                    <CommandItemTemplate>
                        <telerik:RadButton RenderMode="Lightweight" runat="server" ID="RB_insert" CommandName="InitInsert" Text="Add New category" Height="33px" Font-Size="Smaller">
                            <Icon PrimaryIconUrl="~/img/icon/icon_insert_Sample.png" PrimaryHoveredIconUrl="~/img/icon/icon_insert_Sample_Hovered.png" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                        </telerik:RadButton>
                    </CommandItemTemplate>
                    <Columns>
                        <telerik:GridBoundColumn DataField="CategoryName" FilterControlAltText="Filter CategoryName column" HeaderText="Name" ReadOnly="True" SortExpression="CategoryName" UniqueName="CategoryName">
                            <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CategoryDesc" FilterControlAltText="Filter CategoryDesc column" HeaderText="Decsription" SortExpression="CategoryDesc" UniqueName="CategoryDesc">
                            <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CategoryIcon" FilterControlAltText="Filter CategoryIcon column" HeaderText="Icon CssClass" SortExpression="CategoryIcon" UniqueName="CategoryIcon">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CategoryState" FilterControlAltText="Filter CategoryState column" HeaderText="Active or not" SortExpression="CategoryState" UniqueName="CategoryState">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="analysisName" FilterControlAltText="Filter AnalysisType column" HeaderText="Analysis Type" SortExpression="analysisName" UniqueName="analysisName">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn DataField="AnalysisType" UniqueName="AnalysisType" Groupable="False" EnableHeaderContextMenu="false" Visible="false">
                            <ItemTemplate>
                                <asp:HiddenField runat="server" ID="hdn_analysTyps_Sel" Value='<%# Eval("AnalysisType") %>' />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
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
                            <div class="row" style="height:auto; overflow-y:scroll !important">
                                <div class="col-md-12 ">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="card-block">
                                                <div class="form form-horizontal">
                                                    <div class="form-body">
                                                        <h3 class="content-header-title h3-style">
                                                            <i class="fa fa-plus-square"></i>Add a new filter category
                                                        </h3>
                                                        <hr />
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="Txt_CategoryName">Name</label>
                                                                    <div class="col-md-7">
                                                                        <telerik:RadTextBox Width="70%" ID="Txt_CategoryName" runat="server" Text='<%# Bind("CategoryName")%>'></telerik:RadTextBox>

                                                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" Display="Dynamic"
                                                                            ControlToValidate="Txt_CategoryName" ErrorMessage="*" Font-Size="Larger" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group row">
                                                                    <label class="col-md-2 label-control" for="Txt_CategoryDesc">Description</label>
                                                                    <div class="col-md-7">
                                                                        <telerik:RadTextBox Width="70%" runat="server" ID="Txt_CategoryDesc" Text='<%# Bind("CategoryDesc") %>'></telerik:RadTextBox>

                                                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" Display="Dynamic"
                                                                            ControlToValidate="Txt_CategoryDesc" ErrorMessage="*" Font-Size="Larger" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="Txt_CategoryIcon">Icon CssClass</label>
                                                                    <div class="col-md-7">
                                                                        <telerik:RadTextBox Width="70%" ID="Txt_CategoryIcon" runat="server" Text='<%# Bind("CategoryIcon")%>'></telerik:RadTextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group row">
                                                                    <label class="col-md-2 label-control" for="DDL_CategoryState">Active/Not active</label>
                                                                    <div class="col-md-7">
                                                                        <asp:DropDownList runat="server" ID="DDL_CategoryState" Width="70%"
                                                                            DataSourceID="Sql_Cat_RCB_Status" DataValueField="val_CatStatus" DataTextField="txt_CatStatus"
                                                                            SelectedValue='<%# Bind("CategoryState")%>' AppendDataBoundItems="True"
                                                                            class="btn btn-sm dropdown-toggle dropdown-menu-right brd-gray">
                                                                            <asp:ListItem Value="">Select the state of category...</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" Display="Dynamic"
                                                                            ControlToValidate="DDL_CategoryState" ErrorMessage="*" Font-Size="Larger" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="AnalysisType">Analysis Type</label>
                                                                    <div class="col-md-7">
                                                                        <telerik:RadComboBox runat="server" ID="AnalysisType" Width="70%" CheckBoxes="true" EnableCheckAllItemsCheckBox="true"
                                                                            DataSourceID="Sql_AnalysisType_Sel" DataValueField="analysisType" DataTextField="MenuDesc"
                                                                             AppendDataBoundItems="True" RenderMode="Lightweight" OnItemDataBound="RCB_AnalysisTyp_ItemDataBound"
                                                                            class="btn btn-sm dropdown-toggle dropdown-menu-right brd-gray" EmptyMessage="Select the type of analysis...">
                                                                        </telerik:RadComboBox>
                                                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator4" runat="server" Display="Dynamic"
                                                                            ControlToValidate="AnalysisType" ErrorMessage="*" Font-Size="Larger" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
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

<asp:SqlDataSource ID="DS_FilterCat" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_Filter_Category_Sel" SelectCommandType="StoredProcedure"
    DeleteCommand="Sp_Filter_Category_Del" DeleteCommandType="StoredProcedure"
    UpdateCommand="Sp_Filter_Category_Upd" UpdateCommandType="StoredProcedure"
    InsertCommand="Sp_Filter_Category_Ins" InsertCommandType="StoredProcedure">

    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
    <DeleteParameters>
        <asp:Parameter Name="FCId" Type="Int32" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="FCId" Type="Int32" />
        <asp:Parameter Name="CategoryName" Type="string" />
        <asp:Parameter Name="CategoryDesc" Type="string" />
        <asp:Parameter Name="CategoryIcon" Type="string" DefaultValue=" " />
        <asp:Parameter Name="CategoryState" Type="Int16" DefaultValue="0" />
        <asp:ControlParameter ControlID="hdf_AnalysTyps" Name="AnalysisType" PropertyName="Value" Type="string" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterID" Type="String" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="CategoryName" Type="string" />
        <asp:Parameter Name="CategoryDesc" Type="string" />
        <asp:Parameter Name="CategoryIcon" Type="string" DefaultValue=" " />
        <asp:Parameter Name="CategoryState" Type="Int16" DefaultValue="0" />
        <%--<asp:ControlParameter ControlID="DDL_CategoryState" Name="CategoryState" PropertyName="SelectedValue" Type="Int16" DefaultValue="0" />--%>
        <asp:ControlParameter ControlID="hdf_AnalysTyps" Name="AnalysisType" PropertyName="Value" Type="string" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterID" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="Sql_Cat_RCB_Status" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand=" Select 0 as val_CatStatus , 'Not Active' as txt_CatStatus union  Select 1 , 'Active' "></asp:SqlDataSource>

<asp:SqlDataSource ID="Sql_AnalysisType_Sel" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_Filter_AnalysisType_Sel" SelectCommandType="StoredProcedure" />