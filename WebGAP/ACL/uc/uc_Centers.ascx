<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Centers.ascx.cs" Inherits="WebGAP.ACL.uc.uc_Centers" %>


<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_Centers">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_Centers" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>

<div class="content-body">
    <div class="col-xs-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">
                    <asp:PlaceHolder runat="server"><%: Page.Title %> </asp:PlaceHolder>
                </h4>
                <a class="heading-elements-toggle"><i class="icon-ellipsis font-medium-3"></i></a>
                <div class="heading-elements">
                    <%--<button class="btn btn-info mr-1 ladda-button btn-sm" data-style="expand-right"><span class="ladda-label"><i class="icon-history white"></i>&nbsp;History</span></button>--%>
                </div>
            </div>
            <div class="card-body">
                <div class="card-block">
                    <script type="text/javascript" id="telerikClientEvents1">
                        function RG_Centers_OnColumnMouseOut(sender, args) {
                        }
                    </script>
                    <telerik:RadGrid RenderMode="Lightweight" ID="RG_Centers" runat="server" GridLines="Both" GroupPanelPosition="Top"
                        AllowPaging="True" PageSize="10" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="-1" Height="700px"
                        ShowStatusBar="True" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" 
                        AllowAutomaticUpdates="True" DataSourceID="DS_Centers" OnItemDataBound="RG_Centers_ItemDataBound"
                        OnItemCommand="RG_Centers_ItemCommand" OnItemDeleted="RG_Centers_ItemDeleted"
                        OnItemInserted="RG_Centers_ItemInserted" OnItemUpdated="RG_Centers_ItemUpdated" OnPreRender="RG_Centers_PreRender"
                        AllowFilteringByColumn="true" FilterType="HeaderContext" EnableHeaderContextMenu="true" EnableHeaderContextFilterMenu="true" OnFilterCheckListItemsRequested="RG_Centers_FilterCheckListItemsRequested">
                        <PagerStyle Mode="NextPrevAndNumeric" AlwaysVisible="true" />
                        <MasterTableView CommandItemDisplay="Top" DataSourceID="DS_Centers" Name="Master" AutoGenerateColumns="false"
                            DataKeyNames="CenterID">
                            <Columns>
                                <telerik:GridBoundColumn FilterCheckListEnableLoadOnDemand="true" UniqueName="CenterID" HeaderText="ID" DataField="CenterID" DataType="System.Int32" FilterControlAltText="Filter CenterID column" ReadOnly="True" SortExpression="CenterID">
                                    <HeaderStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn FilterCheckListEnableLoadOnDemand="true" UniqueName="CenterDesc" HeaderText="Center name" DataField="CenterDesc" FilterControlAltText="Filter CenterDesc column" SortExpression="CenterDesc">
                                    <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />

                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn FilterCheckListEnableLoadOnDemand="true" UniqueName="Local_Admin" HeaderText="Local Admin" DataField="Local_Admin" FilterControlAltText="Filter Local_Admin column" SortExpression="Local_Admin">
                                    <HeaderStyle Width="300px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="300px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn UniqueName="LA_email" HeaderText="Email" DataField="LA_email" FilterControlAltText="Filter LA_email column" SortExpression="LA_email" EnableHeaderContextMenu="false">
                                    <HeaderStyle Width="300px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="300px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>

                                <telerik:GridImageColumn UniqueName="pictureurl" HeaderText="Logo" DataImageUrlFields="pictureurl" ImageWidth="150px" EnableHeaderContextMenu="false">
                                    <HeaderStyle Width="220px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="220px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridImageColumn>

                                <telerik:GridTemplateColumn UniqueName="TemplateColumn5" Groupable="False" HeaderText="Status" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                    <HeaderStyle Width="80px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Height="80px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>

                                    <ItemTemplate>
                                        <asp:HiddenField runat="server" ID="hdn_CenStat" Value='<%# Eval("CenterStatus")%>' />
                                        <asp:ImageButton ID="CenterStatusbtn" BorderWidth="0px"
                                            runat="server"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridEditCommandColumn UniqueName="EditCommandColumn" ButtonType="ImageButton" EditImageUrl="/img/icon/icon_edit.png" EnableHeaderContextMenu="false">
                                    <HeaderStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridEditCommandColumn>
                                <telerik:GridButtonColumn CommandName="Delete" Text="Delete" UniqueName="Deletecolumn" EnableHeaderContextMenu="false"
                                    ConfirmTitle="Delete" ButtonType="ImageButton" ImageUrl="/img/icon/icon_delete.png"
                                    ConfirmText="Are you sure you want to delete this center?">
                                    <HeaderStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center" />
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
                                                                <div class="form-group row">
                                                                    <label class="col-md-2 label-control" for="Txt_CenterDesc">Center</label>
                                                                    <div class="col-md-9">
                                                                        <asp:TextBox ID="Txt_CenterDesc" runat="server" TabIndex="0" placeholder="Center Name" class="form-control" Text='<%# Bind("CenterDesc") %>' ValidationGroup="SubmitGroup">
                                                                        </asp:TextBox>
                                                                    </div>
                                                                    <div class="col-md-1">
                                                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" Display="Dynamic"
                                                                            ControlToValidate="Txt_CenterDesc" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-md-2 label-control" for="txt_LocalAdmin">Local Admin</label>
                                                                    <div class="col-md-9">
                                                                        <asp:TextBox ID="txt_LocalAdmin" runat="server" TabIndex="1" placeholder="Local Admin First + Last Name" class="form-control" Text='<%# Bind("Local_Admin") %>' ValidationGroup="SubmitGroup">
                                                                        </asp:TextBox>
                                                                    </div>
                                                                    <div class="col-md-1">
                                                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" Display="Dynamic"
                                                                            ControlToValidate="txt_LocalAdmin" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-md-2 label-control" for="Txt_email">Email</label>
                                                                    <div class="col-md-9">
                                                                        <asp:TextBox ID="Txt_email" runat="server" TabIndex="2" class="form-control" placeholder="Local Admin Email" Text='<%# Bind("LA_email") %>' ValidationGroup="SubmitGroup" TextMode="Email">
                                                                        </asp:TextBox>
                                                                    </div>
                                                                    <div class="col-md-1">
                                                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" Display="Dynamic"
                                                                            ControlToValidate="Txt_email" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-md-2 label-control" for="eventRegInput4">Center Logo Path</label>
                                                                    <div class="col-md-9">
                                                                        <asp:TextBox ID="Txt_Logourl" runat="server" TabIndex="3" class="form-control" placeholder="Logo Server Path /img/..." Text='<%# Bind("pictureurl") %>' ValidationGroup="SubmitGroup">
                                                                        </asp:TextBox>
                                                                    </div>
                                                                    <div class="col-md-1">

                                                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator4" runat="server" Display="Dynamic"
                                                                            ControlToValidate="Txt_Logourl" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>

                                                                <div class="form-group row">
                                                                    <label class="col-md-2 label-control" for="eventRegInput5">Center Status</label>
                                                                    <div class="col-md-9">
                                                                        <asp:DropDownList ID="DDL_Status" runat="server" Width="150px" class="form-control" DataTextField="descst" DataValueField="ST"
                                                                            SelectedValue='<%# Bind("CenterStatus") %>' TabIndex="4"
                                                                            AppendDataBoundItems="True" DataSourceID="SDS_US">
                                                                            <asp:ListItem Value="">Select One</asp:ListItem>
                                                                        </asp:DropDownList>

                                                                    </div>
                                                                    <div class="col-md-1">
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" InitialValue="" ForeColor="#CC0000" ControlToValidate="DDL_Status" ErrorMessage="*" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
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
                                    </div>
                                </FormTemplate>
                            </EditFormSettings>

                            <PagerStyle AlwaysVisible="True"></PagerStyle>
                        </MasterTableView>
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                        <ClientSettings EnableRowHoverStyle="true">
                            <ClientEvents OnColumnMouseOut="RG_Centers_OnColumnMouseOut"></ClientEvents>
                            <Selecting AllowRowSelect="true" />
                            <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                        </ClientSettings>

                        <FilterMenu RenderMode="Lightweight"></FilterMenu>

                        <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                    </telerik:RadGrid>

                    <asp:SqlDataSource ID="DS_Centers" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                        SelectCommand="Sp_Centers_Center_All_Sel" SelectCommandType="StoredProcedure"
                        DeleteCommand="Sp_Centers_Center_Del" DeleteCommandType="StoredProcedure"
                        InsertCommand="Sp_Centers_Center_Ins" InsertCommandType="StoredProcedure"
                        UpdateCommand="Sp_Centers_Center_upd" UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="CenterID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="CenterDesc" Type="String" />
                            <asp:Parameter Name="pictureurl" Type="String" />
                            <asp:Parameter Name="Local_Admin" Type="String" />
                            <asp:Parameter Name="LA_email" Type="String" />
                            <asp:Parameter Name="CenterStatus" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="CenterDesc" Type="String" />
                            <asp:Parameter Name="pictureurl" Type="String" />
                            <asp:Parameter Name="Local_Admin" Type="String" />
                            <asp:Parameter Name="LA_email" Type="String" />
                            <asp:Parameter Name="CenterStatus" Type="Int32" />
                            <asp:Parameter Name="CenterID" Type="Int32" />
                        </UpdateParameters>

                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SDS_US" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand=" Select 0 as ST , 'Offline' as descst union  Select 1 , 'Online' "></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</div>

