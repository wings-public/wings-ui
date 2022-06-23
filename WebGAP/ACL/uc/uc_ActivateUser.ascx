<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_ActivateUser.ascx.cs" Inherits="WebGAP.ACL.uc.uc_ActivateUser" %>


<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="DDL_Centers">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_Centers" />
                <telerik:AjaxUpdatedControl ControlID="RG_ActivateUsers" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_ActivateUsers">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_ActivateUsers" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="DDL_PIID" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="DDL_PIID">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_PIID" />
            </UpdatedControls>
        </telerik:AjaxSetting>



    </AjaxSettings>

</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>
<asp:HiddenField ID="forValidation" runat="server" />
<div class="content-body">
    <div class="col-xs-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">
                    <asp:PlaceHolder runat="server"><%: Page.Title %> </asp:PlaceHolder>
                </h4>
                <a class="heading-elements-toggle"><i class="icon-ellipsis font-medium-3"></i></a>
                <div class="heading-elements" style="display: inline-flex !important;">
                    <asp:DropDownList ID="DDL_Centers" runat="server" Width="150px" DataTextField="CenterDesc" DataValueField="CenterID"
                        AppendDataBoundItems="True" AutoPostBack="true" DataSourceID="SDS_Centers"
                        class="btn btn-light square btn-min-width mr-1 mb-1">
                        <asp:ListItem Value="">select a center</asp:ListItem>
                    </asp:DropDownList>
                    <%--<button class="btn btn-info mr-1 ladda-button btn-sm" data-style="expand-right"><span class="ladda-label"><i class="icon-history white"></i>&nbsp;History</span></button>--%>
                </div>
            </div>
            <div class="card-body">
                <div class="card-block">
                    <script type="text/javascript" id="telerikClientEvents1">
                        function RG_ActivateUsers_OnColumnMouseOut(sender, args) {
                        }
                    </script>
                    <telerik:RadGrid RenderMode="Lightweight" ID="RG_ActivateUsers" runat="server" GridLines="Both" OnItemDataBound="RG_ActivateUsers_ItemDataBound"
                        AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="-1" Height="700px"
                        ShowStatusBar="True" OnItemCommand="RG_ActivateUsers_ItemCommand" AllowAutomaticInserts="True" AllowAutomaticUpdates="True"
                        DataSourceID="DS_ActivateUsers" OnItemUpdated="RG_ActivateUsers_ItemUpdated">
                        <PagerStyle Mode="NextPrevAndNumeric" AlwaysVisible="true" />
                        <MasterTableView CommandItemDisplay="none" DataSourceID="DS_ActivateUsers" Name="Master" AutoGenerateColumns="false" EditFormSettings-PopUpSettings-KeepInScreenBounds="true" DataKeyNames="Email,UserID">

                            <Columns>
                                <telerik:GridBoundColumn UniqueName="UserID" HeaderText="ID" DataField="UserID" FilterControlAltText="Filter UserID column" SortExpression="UserID" DataType="System.Int32" ReadOnly="True">
                                    <HeaderStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Smaller" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn UniqueName="UserFullName" HeaderText="Name" DataField="UserFullName" FilterControlAltText="Filter UserFullName column" SortExpression="UserFullName">
                                    <HeaderStyle Width="30%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="30%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Smaller" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn UniqueName="Email" HeaderText="Email" DataField="Email" FilterControlAltText="Filter Email column" SortExpression="Email">
                                    <HeaderStyle Width="30%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="30%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Smaller" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="UserStatus" FilterControlAltText="Filter UserStatus column" HeaderText="Status" SortExpression="UserStatus" UniqueName="UserStatus" ReadOnly="True">
                                    <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Smaller" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="UserTypeDesc" FilterControlAltText="Filter UserTypeDesc column" HeaderText="User Type" SortExpression="UserTypeDesc" UniqueName="UserTypeDesc" ReadOnly="True">
                                    <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Smaller" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn UniqueName="PIID" HeaderText="PI ID" DataField="PIID" FilterControlAltText="Filter PIID column" SortExpression="PIID" DataType="System.Int32" ReadOnly="True" Visible="false">
                                    <HeaderStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Smaller" />
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn Visible="false" DataField="UserType">
                                    <ItemTemplate>
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
                                                                            <label class="col-md-3 label-control" for="UserFullName">Name</label>
                                                                            <div class="col-md-8">

                                                                                <asp:TextBox ID="UserFullName" runat="server" Width="300px" class="form-control" Text='<%# Bind("UserFullName") %>'>                                                                   
                                                                                </asp:TextBox>
                                                                                <asp:HiddenField runat="server" ID="hdn_UserType" Value='<%# Bind("UserType") %>' />

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="form-group row">
                                                                            <label class="col-md-3 label-control" for="DDL_PIID">PIID</label>
                                                                            <div class="col-md-7">
                                                                               <telerik:RadDropDownList  class="form-control" ID="DDL_PIID" Width="100%" runat="server" DataSourceID="SDS_PIs" DataTextField="PIName" DataValueField="PIID"
                                                                                    SelectedValue='<%# Bind("PIID")%>'  AppendDataBoundItems="True" DefaultMessage="Select one">
                                                                                    <Items>
                                                                                        <telerik:DropDownListItem Value="-1" Text="Select One" />
                                                                                    </Items>
                                                                                </telerik:RadDropDownList>
                                                                            </div>
                                                                          

                                                                            <div class="col-md-1">
                                                                              <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="*" Display="Dynamic" ValidationGroup="SubmitGroup" 
                                                                                    ControlToValidate="DDL_PIID" ForeColor="#CC0000" OnServerValidate="CustomValidator1_ServerValidate">
                                                                                </asp:CustomValidator>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <div class="form-group row">
                                                                            <label class="col-md-3 label-control" for="DDL_UserType">User Type</label>
                                                                            <div class="col-md-7">
                                                                                <telerik:RadDropDownList ValidationGroup="SubmitGroup" class="form-control" ID="RDDL_UserType" Width="100%" runat="server" DataSourceID="SDS_UserType" DataTextField="TypeDesc" DataValueField="UserTypeID" OnClientSelectedIndexChanged="UserType_onclientchanged"
                                                                                    SelectedValue='<%# Bind("UserType")%>' AppendDataBoundItems="True" DefaultMessage="Select one">
                                                                                </telerik:RadDropDownList>
                                                                            </div>
                                                                            <div class="col-md-1">

                                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" Display="Dynamic" Enabled="true"
                                                                                    ControlToValidate="RDDL_UserType" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="form-group row">
                                                                            <label class="col-md-3 label-control" for="DDL_UserStatus">Status</label>

                                                                            <div class="col-md-7">
                                                                                <telerik:RadDropDownList ValidationGroup="SubmitGroup" class="form-control" ID="DDL_UserActive" Width="100%" runat="server" DataSourceID="SDS_UserStatus" DataTextField="txt_UserActive" DataValueField="UserActive"
                                                                                    SelectedValue='<%# Bind("UserActive")%>' AppendDataBoundItems="True">
                                                                                </telerik:RadDropDownList>
                                                                            </div>
                                                                            <div class="col-md-1">
                                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator4" runat="server" Display="Dynamic"
                                                                                    ControlToValidate="DDL_UserActive" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-actions m-0 pt-1 pb-0 center">
                                                            <asp:Button ID="btnUpdate" ValidationGroup="SubmitGroup" Text='<%# (Container is GridEditFormInsertItem) ? "Insert" : "Update" %>' class="btn btn-success mr-1 ladda-button btn-sm" data-style="expand-right"
                                                                runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'></asp:Button>&nbsp;
                                                                <asp:Button ID="Button1" Text="Cancel" runat="server" CausesValidation="False" class="btn btn-danger mr-1 ladda-button btn-sm"
                                                                    CommandName="Cancel"></asp:Button>
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
                    <asp:SqlDataSource ID="DS_ActivateUsers" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                        SelectCommand="Sp_Users_Sel" SelectCommandType="StoredProcedure" UpdateCommand="Sp_Users_UpD" UpdateCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDL_Centers" Name="CeID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
                            <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                        </SelectParameters>

                        <UpdateParameters>
                            <asp:Parameter Name="UserID" Type="Int32" />
                            <asp:ControlParameter ControlID="DDL_Centers" Name="CeID" PropertyName="SelectedValue" Type="Int32" />
                            <asp:Parameter Name="UserType" Type="Int32" />
                            <asp:Parameter Name="UserActive" Type="Int32" />
                            <asp:Parameter Name="UserFullName" Type="String" />
                            <asp:SessionParameter Name="LAdminID" SessionField="WiNGSMasterId" Type="Int32" />
                            <asp:Parameter Name="PIID" Type="Int32" />
                            <asp:Parameter Name="Email" Type="String" />
                        </UpdateParameters>

                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SDS_UserType" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_UserType_All_Sel" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SDS_UserStatus" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Select 0 as UserActive, 'Inactive' as txt_UserActive union Select 1, 'Active'"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SDS_Centers" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_Center_Sel" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SDS_PIs" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_PI_Sel" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" DefaultValue="" />
                            <asp:Parameter Name="UserID" Type="Int32" DefaultValue="-1" />
                            <asp:Parameter Name="InputType" Type="Int32" DefaultValue="-1" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</div>

<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <script type="text/javascript">


        function UserType_onclientchanged(sender, eventArgs) {
            var UserType_Obj;
            var UserType;
            var grid = $find("<%= RG_ActivateUsers.ClientID %>");
            var masterTable = grid.get_masterTableView();
            //  Edit mode
            if (grid.get_editItems().length > 0) {
                var gridCount = masterTable.get_editItems().length;
                for (var i = 0; i < gridCount; i++) {
                    item = masterTable.get_editItems()[i];
                    UserType_Obj = $(item.get_editFormItem()).find("div[id*='RDDL_UserType']").get(0);
                    UserType = UserType_Obj.value;

                    var hdn_forvalidation = document.getElementById("<%= forValidation.ClientID %>");

                    var PIID = $(item.get_editFormItem()).find("div[id*='DDL_PIID']").get(0);
                    if (UserType == 'PI') {
                        var tt = PIID.getElementsByTagName('span');
                        tt[1].innerText = 'PI';
                        hdn_forvalidation.value = "PI";
                        $(PIID).css({ "pointer-events": "none", "opacity": "0.7" }).attr("tabindex", "-1");

                    }
                    else {
                        var PIID = $(item.get_editFormItem()).find("div[id*='DDL_PIID']").get(0);
                        var tt = PIID.getElementsByTagName('span');
                        $(PIID).removeAttr("style");
                    }
                  


                }
            }
        }
    </script>
</telerik:RadScriptBlock>
