<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Individuals.ascx.cs" Inherits="WebGAP.PhenBook.uc.uc_Individuals" %>

<style>
    .invalid-tooltip {
        position: absolute !important;
        top: 100% !important;
        z-index: 5 !important;
        display: block;
        max-width: 100% !important;
        padding: .25rem .5rem !important;
        margin-top: .1rem !important;
        font-size: .875rem !important;
        color: #fff !important;
        background-color: rgba(220,53,69,.9) !important;
        border-radius: .25rem !important;
    }
</style>
<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>

        <telerik:AjaxSetting AjaxControlID="RG_Individuals">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_Individuals" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>

<div class="content-header row pt-2">
    <table style="width: 100%; background-color: lightgray">

        <tr>
            <td rowspan="2" style="width: 220px">
                <h4 style="margin-bottom: 1px; color: white; text-shadow: 1px 1px 1px #444;">
                    <asp:Label runat="server" ID="Family" Text="Individual" CssClass="header"></asp:Label></h4>
            </td>

            <td style="float: right; padding-right: 27px; font-size: unset; color: white; padding: 10px; display: inline-table; background-color: #5e98c4; /* margin: 6px; *//* margin-top: 6px; */margin-right: 16px;">
                <asp:Label runat="server" ID="lbl_CenterPI">  </asp:Label>
            </td>
        </tr>

    </table>
</div>



<div class="content-body pt-1">
    <section id="basic-form-layouts">
        <div class="row match-height">
            <script type="text/javascript" id="telerikClientEvents1">
                function RG_Individualset_OnColumnMouseOut(sender, args) {
                }
            </script>
            <asp:HiddenField ID="hdn_searchIndividualID" runat="server" />
            <asp:HiddenField ID="hdn_searchHostID" runat="server" />
            <asp:HiddenField ID="hdn_InsertModeHostselected" runat="server" />
            <telerik:RadGrid RenderMode="Lightweight" ID="RG_Individuals" runat="server" GridLines="Both" DataSourceID="Ds_Individuals" OnPreRender="RG_Individuals_PreRender"
                AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="-1" Height="700px" OnItemCommand="RG_Individuals_ItemCommand" OnItemDataBound="RG_Individual_ItemDataBound"
                OnInsertCommand="RG_Individuals_InsertCommand" OnItemDeleted="RG_Individuals_ItemDeleted" OnItemInserted="RG_Individuals_ItemInserted" OnItemUpdated="RG_Individuals_ItemUpdated"
                ShowStatusBar="True" AllowAutomaticDeletes="True" OnUpdateCommand="RG_Individuals_UpdateCommand" OnItemCreated="RG_Individuals_ItemCreated">
                <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                <MasterTableView CommandItemDisplay="Top" Name="Master" AutoGenerateColumns="false" DataKeyNames="IndividualID,HostID" DataSourceID="Ds_Individuals" NoMasterRecordsText="No records to display.">
                    <CommandItemTemplate>


                        <telerik:RadButton RenderMode="Lightweight" runat="server" ID="RB_insert" CommandName="InitInsert" Text="Add New Individual" Height="33px" Font-Size="Smaller" Enabled="false">
                            <Icon PrimaryIconUrl="~/img/icon/icon_insert_Sample.png" PrimaryHoveredIconUrl="~/img/icon/icon_insert_Sample_Hovered.png" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                        </telerik:RadButton>
                        <telerik:RadButton RenderMode="Lightweight" runat="server" Text="Clear Filter" ID="RTB_DeleteSearch" OnClick="RTB_DeleteSearch_Click"
                            Height="33px" Font-Size="Smaller" AutoPostBack="True">
                            <Icon PrimaryIconUrl="~/img/icon/icon_search_Filter.png" PrimaryHoveredIconUrl="~/img/icon/icon_search_Filter_Hovered.png" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                        </telerik:RadButton>

                        <telerik:RadComboBox RenderMode="Lightweight" ID="RCB_searchIndividual" runat="server" AutoPostBack="true" DataSourceID="DS_searchIndividual" OnSelectedIndexChanged="RCB_searchIndividual_SelectedIndexChanged"
                            ChangeTextOnKeyBoardNavigation="true" OnPreRender="RCB_searchIndividual_PreRender"
                            Width="350px" Height="150px" EmptyMessage="Filter by ID and Local ID" CssClass="pl-0" Filter="Contains" DataTextField="Individual_Info" DataValueField="IndividualID">
                        </telerik:RadComboBox>

                    </CommandItemTemplate>
                    <Columns>
                        <telerik:GridBoundColumn DataField="HostDesc" DataType="System.Int64" FilterControlAltText="Filter HostDesc column" HeaderText="Host" SortExpression="HostDesc" UniqueName="HostDesc">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="IndividualID" DataType="System.Int64" FilterControlAltText="Filter IndividualID column" HeaderText="Individual ID" ReadOnly="True"
                            SortExpression="IndividualID" UniqueName="IndividualID">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CenterID" Visible="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="IndividualBirthDate" Visible="false">
                        </telerik:GridBoundColumn>


                        <%-- <telerik:GridBoundColumn DataField="IndividualsetID" DataType="System.Int32" FilterControlAltText="Filter IndividualsetID column" HeaderText="Individualset ID" ReadOnly="True"
                            SortExpression="IndividualsetID" UniqueName="IndividualsetID">
                            <HeaderStyle Width="150px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="150px" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="LocalID" FilterControlAltText="Filter LocalID column" HeaderText="Local ID" ReadOnly="True" SortExpression="LocalID" UniqueName="LocalID">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn DataType="System.int32" DataField="IndividualSex" UniqueName="IndividualSex" Groupable="False" EnableHeaderContextMenu="false"
                            HeaderText="Gender" FilterControlAltText="Filter IndividualSex column">
                            <HeaderStyle Width="70px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="70px" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:HiddenField runat="server" ID="hdn_Gender" Value='<%# Bind("IndividualSex") %>' />
                                <asp:ImageButton ID="Genderbtn" BorderWidth="0px" Width="30px" runat="server"></asp:ImageButton>
                            </ItemTemplate>
                            <FilterTemplate>
                                <telerik:RadComboBox RenderMode="Lightweight" ID="ImportedFilter" runat="server" OnClientSelectedIndexChanged="ImportedFilterSelectedIndexChanged"
                                    SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("IndividualSex").CurrentFilterValue %>' DataTextField="txt_IndividualGender"
                                    DataValueField="val_IndividualGender" Width="60px"
                                    DataSourceID="Sql_Individuals_DDL_Gender" AppendDataBoundItems="true">
                                    <Items>
                                        <telerik:RadComboBoxItem Text="Filter Gender" Value="" />
                                    </Items>
                                </telerik:RadComboBox>
                                <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
                                    <script type="text/javascript">
                                        function ImportedFilterSelectedIndexChanged(sender, args) {
                                            var master = $find('<%=RG_Individuals.ClientID %>').get_masterTableView();
                                            var tableView = $("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                            master.filter("IndividualSex", args.get_item().get_value(), "EqualTo");

                                        }
                                    </script>
                                </telerik:RadScriptBlock>
                            </FilterTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="IndividualStatus" FilterControlAltText="Filter IndividualStatus column" EnableHeaderContextMenu="false"
                            HeaderText="Status" SortExpression="IndividualStatus" UniqueName="IndividualStatus" ReadOnly="true">
                            <HeaderStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:HiddenField runat="server" ID="hdn_Status" Value='<%# Eval("IndividualStatus") %>' />
                                <asp:ImageButton ID="Statusbtn" BorderWidth="0px" Width="30px" runat="server"></asp:ImageButton>
                            </ItemTemplate>
                            <FilterTemplate>
                                <telerik:RadComboBox RenderMode="Lightweight" ID="IndividualStatusFilter" runat="server" OnClientSelectedIndexChanged="ImportedFilterSelectedIndexChangedStatus"
                                    SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("IndividualStatus").CurrentFilterValue %>' DataTextField="txt_IndividualStatus"
                                    DataValueField="val_IndividualStatus"
                                    Width="60px" DataSourceID="Sql_Individuals_DDL_Status" AppendDataBoundItems="true">
                                    <Items>
                                        <telerik:RadComboBoxItem Text="Filter Status" Value="" />
                                    </Items>
                                </telerik:RadComboBox>
                                <telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
                                    <script type="text/javascript">
                                        function ImportedFilterSelectedIndexChangedStatus(sender, args) {
                                            var master = $find('<%=RG_Individuals.ClientID %>').get_masterTableView();
                                            var tableView = $("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                            master.filter("IndividualStatus", args.get_item().get_value(), "EqualTo");

                                        }
                                    </script>
                                </telerik:RadScriptBlock>
                            </FilterTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="Age" FilterControlAltText="Filter Age column" HeaderText="Age" SortExpression="Age" DataFormatString="{0:d}" UniqueName="Age">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DateAdd" FilterControlAltText="Filter DateAdd column" HeaderText="Date" SortExpression="DateAdd" DataFormatString="{0:d}" UniqueName="DateAdd">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>

                        <telerik:GridTemplateColumn>
                            <HeaderStyle Width="40px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="40px" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:ImageButton ID="GoToPheno" BorderWidth="0px" ImageUrl="~/img/icon/icon_phenotype.png" Width="25px" Height="25px" CommandName="GoToPheno"
                                    runat="server" ToolTip="Phenotype"></asp:ImageButton>
                                <asp:ImageButton ID="AssignSample" BorderWidth="0px" ImageUrl="~/img/icon/icon_assignSample.png" Width="25px" Height="25px" CommandName="AssignSample"
                                    runat="server" ToolTip="Assign Sample"></asp:ImageButton>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridEditCommandColumn UniqueName="EditCommandColumn" ButtonType="ImageButton"
                            EditImageUrl="~/img/icon/icon_edit.png" EnableHeaderContextMenu="false">
                            <HeaderStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="30px" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridEditCommandColumn>
                        <telerik:GridTemplateColumn DataType="System.int32" DataField="Updatable" UniqueName="Updatable" Groupable="False" EnableHeaderContextMenu="false" Visible="false">
                            <ItemTemplate>
                                <asp:HiddenField runat="server" ID="hdn_Updatable" Value='<%# Bind("Updatable") %>' />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <%--  <telerik:GridButtonColumn CommandName="Delete" Text="Delete" UniqueName="Delete" EnableHeaderContextMenu="false" 
                            ButtonType="ImageButton" ImageUrl="~/img/icon/icon_delete.png" ConfirmText="Are you sure?">
                            <HeaderStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridButtonColumn>--%>
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
                                                            <div class="col-md-6">
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="Txt_Individual_ID">Individual ID</label>
                                                                    <div class="col-md-8">
                                                                        <asp:TextBox ID="Txt_Individual_ID" disabled="disabled" class="form-control" runat="server" Text='<%# Bind("IndividualID")%>'></asp:TextBox>
                                                                    </div>
                                                                    <div class="col-md-1">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group row">
                                                                    <div style="border-color: gainsboro; display: flex; flex-direction: row; justify-content: flex-end; padding-left: 15px">
                                                                        <div class="col-md-4 pl-4 pr-0">
                                                                            <asp:Label runat="server" ID="lbl_SampleID" class="label-control" for="txt_SampleID">Sample ID</asp:Label>
                                                                        </div>
                                                                        <div class="col-md-6 pl-2 pr-0">
                                                                            <telerik:RadTextBox runat="server" ID="txt_SampleID" Enabled="false"></telerik:RadTextBox>
                                                                        </div>
                                                                        <%--   </div>
                                                                       <div class="col-md-4">--%>
                                                                        <div class="col-md-2 pl-0">

                                                                            <table>
                                                                                <td style="width: 50%">
                                                                                    <asp:ImageButton runat="server" OnClientClick="AssignSampel_client();" ID="btn_Assign_Sample" OnCommand="btn_Assign_Sample_Command" BorderWidth="0px" ImageUrl="~/img/icon/icon_Add_Individual_16.png" ToolTip="Assign Sample" />
                                                                                </td>
                                                                                <td style="width: 50%">
                                                                                    <asp:ImageButton ID="imgbtn_Delete" OnClientClick="DeleteAssigned_Sample(); return false;" runat="server" BorderWidth="0px" ImageUrl="~/img/icon/icon_del-trash.gif" ToolTip="Delete Assigned Sample" />
                                                                                </td>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-md-3 label-control" for="Txt_Local_ID">Local ID</label>
                                                            <div class="col-md-8 position-relative">
                                                                <telerik:RadTextBox ID="Txt_Local_ID" ValidationGroup="SubmitGroup" class="form-control" runat="server" Text='<%# Bind("LocalID")%>' Width="100%"></telerik:RadTextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" Display="Dynamic" class="invalid-tooltip"
                                                                    ValidationGroup="SubmitGroup" ControlToValidate="Txt_Local_ID" ErrorMessage="Please provide a valid local id."></asp:RequiredFieldValidator>

                                                            </div>
                                                            <div class="col-md-1">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <asp:Label ID="Label12" runat="server" Text="Date of Birth" class="col-md-3 label-control" for="projectinput6"></asp:Label>
                                                            <div class="col-md-8">
                                                                <telerik:RadDatePicker RenderMode="Lightweight" ID="Txt_Bdate" Width="250px" Height="34px" MinDate="1900/01/01"
                                                                    DbSelectedDate='<%# Bind("IndividualBirthDate") %>' DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy"
                                                                    runat="server">
                                                                    <DateInput runat="server" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" />
                                                                </telerik:RadDatePicker>
                                                                  <%-- <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" Display="Dynamic" class="invalid-tooltip"
                                                                    ValidationGroup="SubmitGroup" ControlToValidate="Txt_Bdate" ErrorMessage="Please provide a valid BD."></asp:RequiredFieldValidator>--%>

                                                            </div>
                                                            <div class="col-md-1">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">

                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <asp:Label ID="Label9" runat="server" Text="First Name" class="col-md-3 label-control" for="projectinput2"></asp:Label>
                                                            <div class="col-md-8">
                                                                <asp:TextBox ID="Txt_Individual_Fname" runat="server" Text='<%# Bind("IndividualFName")%>' class="form-control"></asp:TextBox>
                                                                  <asp:RequiredFieldValidator ID="Requiredfieldvalidator4" runat="server" Display="Dynamic" class="invalid-tooltip"
                                                                    ValidationGroup="SubmitGroup" ControlToValidate="Txt_Individual_Fname" ErrorMessage="Please provide a valid First Name."></asp:RequiredFieldValidator>
                                                            </div>
                                                            <div class="col-md-1">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <asp:Label ID="Label10" runat="server" Text="Gender" class="col-md-3 label-control" for="projectinput4"></asp:Label>
                                                            <div class="col-md-8 position-relative">
                                                                <asp:DropDownList ValidationGroup="SubmitGroup" ID="DDL_Gender" runat="server" Width="250px" DataSourceID="Sql_Individuals_DDL_Gender" DataTextField="txt_IndividualGender" DataValueField="val_IndividualGender"
                                                                    SelectedValue='<%# Bind("IndividualSex")%>' AppendDataBoundItems="True" class="form-control">
                                                                    <asp:ListItem Value="">Select One</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" Display="Dynamic" class="invalid-tooltip"
                                                                    ValidationGroup="SubmitGroup" ControlToValidate="DDL_Gender" ErrorMessage="Please provide a valid individual sex"></asp:RequiredFieldValidator>

                                                            </div>
                                                            <div class="col-md-1">
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <asp:Label ID="Label8" runat="server" Text="Last Name" class="col-md-3 label-control" for="projectinput3"></asp:Label>
                                                            <div class="col-md-8">
                                                                <asp:TextBox ID="Txt_Individual_Lname" runat="server" Text='<%# Bind("IndividualLName")%>' class="form-control"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator5" runat="server" Display="Dynamic" class="invalid-tooltip"
                                                                    ValidationGroup="SubmitGroup" ControlToValidate="Txt_Individual_Lname" ErrorMessage="Please provide a valid Last Name."></asp:RequiredFieldValidator>
                                                            </div>
                                                            <div class="col-md-1">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <asp:Label ID="Label11" runat="server" Text="Status" class="col-md-3 label-control" for="projectinput5"></asp:Label>
                                                            <div class="col-md-8">
                                                                <asp:DropDownList ID="DDL_Status" runat="server" Width="250px" DataSourceID="Sql_Individuals_DDL_Status" DataTextField="txt_IndividualStatus" DataValueField="val_IndividualStatus"
                                                                    SelectedValue='<%# Bind("IndividualStatus")%>' AppendDataBoundItems="True" class="form-control">
                                                                    <asp:ListItem Value="">Select One</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="col-md-1">
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-md-3 label-control" for="Txt_Local_ID">
                                                                Relevant Clinical Information
                                                            </label>
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="Relevant_Clinical_Info" class="form-control" runat="server" Text='<%# Bind("Relevant_Clinical_Info")%>'></asp:TextBox>
                                                            </div>
                                                            <div class="col-md-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <asp:Label runat="server" ID="lbl_HID" CssClass="col-md-3 label-control" for="DDL_DSID">Host</asp:Label>
                                                            <div class="col-md-7 position-relative">
                                                                <telerik:RadComboBox RenderMode="Lightweight" ID="DDL_HostID" runat="server" DropDownHeight="200px" Width="250px"
                                                                    DropDownWidth="250px" CausesValidation="False" SelectedValue='<%# Bind("HostID")%>'
                                                                    DataValueField="HostID" DataTextField="HostDesc" DataSourceID="DS_DDL_HID">
                                                                    <DefaultItem Text="Select a host" Value="-1" />
                                                                </telerik:RadComboBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator6" runat="server" Display="Dynamic" class="invalid-tooltip"
                                                                    ControlToValidate="DDL_HostID" ErrorMessage="Please provide a valid host id" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>

                                                            </div>
                                                            <div class="col-md-1">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-actions m-0 pt-1 pb-0 center">
                                                <asp:Button ID="btnUpdate" ValidationGroup="SubmitGroup" Text='<%# (Container is GridEditFormInsertItem) ? "Insert" : "Update" %>' class="btn btn-success mr-1 ladda-button btn-sm" data-style="expand-right"
                                                    runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'></asp:Button>&nbsp;
                                                                <asp:Button ID="Button1" Text="Cancel" runat="server" CausesValidation="False" class="btn btn-danger mr-1 ladda-button btn-sm" data-style="expand-right"
                                                                    CommandName="Cancel"></asp:Button>
                                                <div style="padding-top: 20px">
                                                    <asp:Label runat="server" ID="feedback"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </div>
                        </FormTemplate>

                        <PopUpSettings KeepInScreenBounds="True"></PopUpSettings>
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

            <telerik:RadWindowManager RenderMode="Lightweight" ID="RadWindowManager1" ShowContentDuringLoad="false" VisibleStatusbar="false"
                ReloadOnShow="true" runat="server" EnableShadow="true" VisibleTitlebar="false" Skin="Windows7">
                <Windows>
                    <telerik:RadWindow RenderMode="Lightweight" ID="RadWindow1" runat="server" BorderStyle="None" BorderWidth="1px" CssClass="px-0 pb-0" OnClientClose="OnClientClose" Height="540" Width="1000" Modal="true">
                    </telerik:RadWindow>
                </Windows>
            </telerik:RadWindowManager>
            <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
                <script type="text/javascript">
                    function AssignSampel_client() {
                        var grid = $find("<%= RG_Individuals.ClientID %>");
                        var masterTable = grid.get_masterTableView();
                        if (masterTable.get_insertItem() != null) {
                            var insertRow = masterTable.get_insertItem();

                            var HostIDobj = $(insertRow).find("div[id*='DDL_HostID']").get(0);
                            HostID = HostIDobj.value;
                            console.log(HostID);
                            if (HostID == 'Local')
                                document.getElementById('<%= hdn_InsertModeHostselected.ClientID%>').value = 1
                            if (HostID == 'Cloud')
                                document.getElementById('<%= hdn_InsertModeHostselected.ClientID%>').value = 2
                            if (HostID == '-1')
                                document.getElementById('<%= hdn_InsertModeHostselected.ClientID%>').value = "";

                        }

                        if (grid.get_editItems().length > 0) {


                            var gridCount = masterTable.get_editItems().length;
                            for (var i = 0; i < gridCount; i++) {
                                item = masterTable.get_editItems()[i];
                                var HostIDobj = $(insertRow).find("div[id*='DDL_HostID']").get(0);
                                HostID = HostIDobj.value;
                                if (HostID == 'Local')
                                    document.getElementById('<%= hdn_InsertModeHostselected.ClientID%>').value = 1
                                if (HostID == 'Cloud')
                                    document.getElementById('<%= hdn_InsertModeHostselected.ClientID%>').value = 2
                                if (HostID == '-1')
                                    document.getElementById('<%= hdn_InsertModeHostselected.ClientID%>').value = "";

                            }
                        }
                    }
                    function DeleteAssigned_Sample() {
                        var grid = $find("<%= RG_Individuals.ClientID %>");
                        var masterTable = grid.get_masterTableView();
                        if (grid.get_editItems().length > 0) {
                            var gridCount = masterTable.get_editItems().length;
                            for (var i = 0; i < gridCount; i++) {
                                item = masterTable.get_editItems()[i];
                                var SampleID = $(item.get_editFormItem()).find("input[id*='txt_SampleID']").get(0);
                                SampleID.value = "";
                            }
                        }

                        if (masterTable.get_insertItem() != null) {
                            var insertRow = masterTable.get_insertItem();
                            var SampleID = $(insertRow).find("input[id*='txt_SampleID']").get(0);
                            SampleID.value = "";
                        }

                    }

                    function pageLoad() {
                        var grid = $find("<%= RG_Individuals.ClientID %>");
                        grid.ClientSettings.Scrolling.AllowScroll = true;

                    }

                    function OpenWinSampleForINdvidual() {

                        var oWnd = radopen("SampleForIndividual.aspx", "RadWindow1");

                    }

                    function OnClientClose(oWnd, args) {
                        var arg = args.get_argument();
                        var grid = $find("<%= RG_Individuals.ClientID %>");
                        var masterTable = grid.get_masterTableView();
                        if (arg != 0) {



                            //  Edit mode
                            if (grid.get_editItems().length > 0) {
                                if (arg) {

                                    var gridCount = masterTable.get_editItems().length;
                                    for (var i = 0; i < gridCount; i++) {
                                        item = masterTable.get_editItems()[i];
                                        Sample_ID = $(item.get_editFormItem()).find("input[id*='txt_SampleID']").get(0);
                                        Sample_ID.value = arg;
                                    }
                                }
                            }

                            //insert mode
                            if (masterTable.get_insertItem() != null) {
                                if (arg) {
                                    var insertRow = masterTable.get_insertItem();
                                    var Sample_ID = $(insertRow).find("input[id*='txt_SampleID']").get(0);
                                    Sample_ID.value = arg;
                                }
                            }
                        }
                        // masterTable.rebind();
                    }
                                    //    }


                </script>
            </telerik:RadScriptBlock>

            <asp:SqlDataSource ID="DS_searchIndividual" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                SelectCommand="Sp_Individuals_Search_ToDefine" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
                    <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="Ds_Individuals" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                SelectCommand="Sp_Individuals_Sel_ToDefine" SelectCommandType="StoredProcedure"
                DeleteCommand="Sp_Individual_Del" DeleteCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
                    <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                    <asp:ControlParameter ControlID="hdn_searchIndividualID" Name="IndividualID" Type="Int64" DefaultValue="-1" />

                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="IndividualID" Type="Int64" />
                </DeleteParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DS_DDL_HID" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_Center_Hosts_Sel" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="Sql_Individuals_DDL_Status" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand=" Select 0 as val_IndividualStatus , 'Dead' as txt_IndividualStatus union  Select 1 , 'Alive' union Select 2,'Unknown' "></asp:SqlDataSource>
            <asp:SqlDataSource ID="Sql_Individuals_DDL_Gender" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand=" Select 0 as val_IndividualGender , 'Female' as txt_IndividualGender union  Select 1 , 'Male' union Select 2,'Unknown' "></asp:SqlDataSource>



        </div>
    </section>
</div>


