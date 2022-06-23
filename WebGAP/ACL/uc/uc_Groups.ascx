<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Groups.ascx.cs" Inherits="WebGAP.ACL.uc.uc_Groups" %>

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="DDL_Centers">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_Centers" />
                <telerik:AjaxUpdatedControl ControlID="RG_Groups" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_Groups">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_Groups" LoadingPanelID="RadAjaxLoadingPanel1" />
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
              <telerik:RadComboBox RenderMode="Lightweight" runat="server" ID="DDL_Centers" 
                DataTextField="CenterDesc" DataValueField="CenterID" DropDownWidth="200px"
                HighlightTemplatedItems="true" Height="140px" AutoPostBack="true" Width="100%">
                <ItemTemplate>
                    <%# DataBinder.Eval(Container, "Attributes['CenterID']")%>
                </ItemTemplate>
            </telerik:RadComboBox>

        </div>
    </div>
</div>

<div class="content-body pt-1">
    <section id="basic-form-layouts">
        <div class="row match-height">
            <script type="text/javascript" id="telerikClientEvents1">
                function RG_Samples_OnColumnMouseOut(sender, args) {
                }
            </script>
            <telerik:RadGrid RenderMode="Lightweight" ID="RG_Groups" runat="server" GridLines="Both"
                AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="-1" Height="700px" OnItemUpdated="RG_Groups_ItemUpdated" OnItemDataBound="RG_Groups_ItemDataBound" 
                ShowStatusBar="True" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" DataSourceID="DS_Groups" OnItemCommand="RG_Groups_ItemCommand"
                AllowAutomaticUpdates="True">
                <PagerStyle Mode="NextPrevAndNumeric" AlwaysVisible="true" />
                <MasterTableView CommandItemDisplay="Top" Name="Master"  DataSourceID="DS_Groups" AutoGenerateColumns="false" EditFormSettings-PopUpSettings-KeepInScreenBounds="true" DataKeyNames="GroupID">
                   <CommandItemSettings ShowRefreshButton="false" />
                    <Columns>
                        <telerik:GridBoundColumn UniqueName="GroupID" HeaderText="ID" DataField="GroupID" FilterControlAltText="Filter GroupID column" SortExpression="GroupID" DataType="System.Int32" ReadOnly="True">
                            <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Smaller" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn UniqueName="GroupName" HeaderText="Name" DataField="GroupName" FilterControlAltText="Filter GroupName column" SortExpression="GroupName">
                            <HeaderStyle  VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle  VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Smaller" />
                        </telerik:GridBoundColumn>
                       <telerik:GridTemplateColumn DataType="System.int32" DataField="GroupStatusDesc" UniqueName="GroupStatusDesc" Groupable="False"
                            HeaderText="Status" HeaderStyle-Width="150px" FilterControlAltText="Filter GroupStatusDesc column" EnableHeaderContextMenu="false">
                            <HeaderStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:HiddenField runat="server" ID="hdn_Status" Value='<%# Eval("GroupStatus") %>' />
                                <asp:ImageButton ID="Statusbtn" BorderWidth="0px" Width="30px" runat="server"></asp:ImageButton>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridEditCommandColumn UniqueName="EditCommandColumn" ButtonType="ImageButton"
                            EditImageUrl="~/img/icon/icon_edit.png" EnableHeaderContextMenu="false">
                            <HeaderStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridEditCommandColumn>
                    </Columns>
                    <PagerStyle AlwaysVisible="True"></PagerStyle>

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
                                                                    <asp:Label ID="Label9" runat="server" Text="Group Name" class="col-md-3 label-control" for="projectinput2"></asp:Label>
                                                                    <div class="col-md-9">
                                                                        <asp:TextBox ValidationGroup="SubmitGroup" ID="Txt_Group_Name" runat="server" Text='<%# Bind("GroupName")%>' class="form-control"></asp:TextBox>
                                                                    </div>
                                                                    <div class="col-md-1">
                                                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator6" runat="server" Display="Dynamic"
                                                                            ValidationGroup="SubmitGroup" ControlToValidate="Txt_Group_Name" ErrorMessage="!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <div class="form-group row">
                                                                    <asp:Label ID="Label8" runat="server" Text="Status" class="col-md-2 label-control" for="projectinput3"></asp:Label>

                                                                    <asp:DropDownList ValidationGroup="SubmitGroup" ID="DDL_Group_Status" runat="server" Width="150px" DataSourceID="Sql_Group_Status" DataTextField="txt_GroupStatus" DataValueField="Group_Status"
                                                                        SelectedValue='<%# Bind ("GroupStatus")%>' AppendDataBoundItems="True" class="form-control">
                                                                        <asp:ListItem Value="">Select One</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <div class="col-md-1">
                                                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" Display="Dynamic"
                                                                            ValidationGroup="SubmitGroup" ControlToValidate="DDL_Group_Status" ErrorMessage="!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>

                                                </div>
                                                <div class="form-actions m-0 pt-1 pb-0 center">
                                                    <asp:Button ID="btnUpdate" ValidationGroup="SubmitGroup" Text='<%# (Container is GridEditFormInsertItem) ? "Insert" : "Update" %>' class="btn btn-success mr-1 ladda-button btn-sm" data-style="expand-right"
                                                        runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'></asp:Button>&nbsp;
                                                                <asp:Button ID="Button1" Text="Cancel" runat="server" CausesValidation="False" class="btn btn-danger mr-1 ladda-button btn-sm" data-style="expand-right"
                                                                    CommandName="Cancel" OnClientClick="if (!confirm('Are you sure?')) { return false }"></asp:Button>
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
                    <ClientEvents OnColumnMouseOut="RG_Samples_OnColumnMouseOut"></ClientEvents>
                    <Selecting AllowRowSelect="true" />
                    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                </ClientSettings>
                <FilterMenu RenderMode="Lightweight"></FilterMenu>
                <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
            </telerik:RadGrid>
        </div>
    </section>
</div>



<asp:SqlDataSource ID="DS_Groups" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_Groups_Sel" SelectCommandType="StoredProcedure"
    InsertCommand="Sp_Group_Ins" InsertCommandType="StoredProcedure"
    UpdateCommand="Sp_Group_UpD" UpdateCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
          <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
    <InsertParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int16" />
        <asp:Parameter Name="GroupName" Type="String" />
        <asp:Parameter Name="GroupStatus" Type="Int32" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32"  />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="GroupID" Type="Int16" />
        <asp:Parameter Name="GroupName" Type="String" />
        <asp:Parameter Name="GroupStatus" Type="Int16" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="Sql_Group_Status" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand=" Select 0 as Group_Status , 'Inactive' as txt_GroupStatus union  Select 1, 'Active' "></asp:SqlDataSource>
