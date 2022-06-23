<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_IndividualSet.ascx.cs" Inherits="WebGAP.ACL.uc.uc_IndividualSet" %>

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="DDL_Centers">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_Centers" />
                <telerik:AjaxUpdatedControl ControlID="DDL_PIs" />
                <telerik:AjaxUpdatedControl ControlID="RG_Individualset" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="DDL_PIs">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_PIs" />
                <telerik:AjaxUpdatedControl ControlID="RG_Individualset" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_Individualset">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_Individualset" LoadingPanelID="RadAjaxLoadingPanel1" />
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
            <div class="btn-group" role="group">
                <asp:DropDownList ID="DDL_Centers" runat="server" Width="150px" DataTextField="CenterDesc" DataValueField="CenterID"
                    AutoPostBack="true" DataSourceID="Ds_Centers" AppendDataBoundItems="true"
                    class="btn btn-outline-info dropdown-toggle dropdown-menu-right mr-1 btn-sm">
                  
                </asp:DropDownList>

                <asp:DropDownList ID="DDL_PIs" runat="server" Width="150px" DataTextField="PIName" DataValueField="PIID" DataSourceID="Ds_PIs"
                    AutoPostBack="true" class="btn btn-outline-info dropdown-toggle dropdown-menu-right mr-1 btn-sm" AppendDataBoundItems="true" EnableViewState="false">
                    <asp:ListItem Value="-1">All PIs</asp:ListItem>
                </asp:DropDownList>
                <%--<button class="btn btn-info mr-1 ladda-button btn-sm" data-style="expand-right"><span class="ladda-label"><i class="icon-history white"></i>&nbsp;History</span></button>--%>
            </div>
        </div>
    </div>
</div>

<div class="content-body pt-1">
    <section id="basic-form-layouts">
        <div class="row match-height">
            <script type="text/javascript" id="telerikClientEvents1">
                function RG_Individualset_OnColumnMouseOut(sender, args) {
                }
            </script>
            <telerik:RadGrid RenderMode="Lightweight" ID="RG_Individualset" runat="server" GridLines="Both"
                AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="-1" Height="700px" OnItemCommand="RG_Individualset_ItemCommand"
                ShowStatusBar="True" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" OnItemDataBound="RG_Individualset_ItemDataBound"
                AllowAutomaticUpdates="True" DataSourceID="Ds_Individualset">
                <PagerStyle Mode="NextPrevAndNumeric" AlwaysVisible="true" />
                <MasterTableView CommandItemDisplay="top" Name="Master" AutoGenerateColumns="false" EditFormSettings-PopUpSettings-KeepInScreenBounds="true" DataKeyNames="PIID,IndividualsetID,CenterID" DataSourceID="Ds_Individualset">
                    <Columns>
                        <telerik:GridBoundColumn DataField="IndividualsetID" DataType="System.Int32" FilterControlAltText="Filter IndividualsetID column" HeaderText="ID" ReadOnly="True" SortExpression="IndividualsetID" UniqueName="IndividualsetID">
                            <HeaderStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="100px" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="IndividualsetName" FilterControlAltText="Filter IndividualsetName column" HeaderText="Individualset Name" SortExpression="IndividualsetName" UniqueName="IndividualsetName">
                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle  VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="IndividualsetDesc" FilterControlAltText="Filter IndividualsetDesc column" HeaderText="Individualset Description" SortExpression="IndividualsetDesc" UniqueName="IndividualsetDesc">
                            <HeaderStyle  VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn DataType="System.int32" DataField="IndividualsetTypeID" UniqueName="IndividualsetTypeID" Groupable="False"
                            HeaderText="Type" HeaderStyle-Width="150px" FilterControlAltText="Filter IndividualsetTypeID column" EnableHeaderContextMenu="false">
                            <HeaderStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:HiddenField runat="server" ID="hdn_Type" Value='<%# Eval("IndividualsetTypeID") %>' />
                                <asp:ImageButton ID="Typebtn" BorderWidth="0px" Width="30px" runat="server"></asp:ImageButton>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataType="System.int32" DataField="IndividualsetStatus" UniqueName="IndividualsetStatus" Groupable="False"
                            HeaderText="Status" HeaderStyle-Width="150px" FilterControlAltText="Filter IndividualsetStatus column" EnableHeaderContextMenu="false">
                            <HeaderStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:HiddenField runat="server" ID="hdn_status" Value='<%# Eval("IndividualsetStatus") %>' />
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
                                                        <div class="row">
                                                            <div class="col-6">
                                                                <div class="form-group row">
                                                                    <label class="col-3 label-control" for="Txt_Individualset_ID">Individualset ID</label>
                                                                    <div class="col-8">
                                                                        <asp:TextBox ID="Txt_Individualset" disabled="disabled" Text='<%# Bind("IndividualsetID")%>' class="form-control" runat="server"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-6">
                                                                <div class="form-group row">
                                                                    <label class="col-3 label-control" for="txt_IndividualsetName">Individualset Name</label>
                                                                    <div class="col-8">
                                                                        <asp:TextBox ID="Txt_IndividualsetName" runat="server" Text='<%# Bind("IndividualsetName")%>' class="form-control"></asp:TextBox>
                                                                    </div>
                                                                    <div class="col-1">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-6">
                                                                <div class="form-group row">
                                                                    <asp:Label ID="Label9" runat="server" Text="Type" class="col-3 label-control" for="projectinput2"></asp:Label>
                                                                    <div class="col-8">
                                                                        <asp:DropDownList ID="DDL_IndividualsetType" runat="server" Width="150px" DataSourceID="Ds_IndividualsetType" DataTextField="IndividualsetTypeName" DataValueField="IndividualsetTypeID"
                                                                            SelectedValue='<%# Bind ("IndividualsetTypeID")%>' AppendDataBoundItems="True" class="form-control">
                                                                            <asp:ListItem Value="">Select one</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </div>
                                                                </div>
                                                                &nbsp;
                                                            </div>
                                                            <div class="col-6">
                                                                <div class="form-group row">
                                                                    <asp:Label ID="Label1" runat="server" Text="Status" class="col-3 label-control" for="projectinput2"></asp:Label>
                                                                    <div class="col-8">
                                                                        <asp:DropDownList ValidationGroup="SubmitGroup" ID="DDL_IndividualsetStatus" runat="server" Width="150px" DataSourceID="Ds_IndividualsetStatus" DataTextField="txt_IndividualsetStatus" DataValueField="val_IndividualsetStatus"
                                                                            SelectedValue='<%# Bind ("IndividualsetStatus")%>' AppendDataBoundItems="True" class="form-control">
                                                                            <asp:ListItem Value="">Select one</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </div>
                                                                </div>
                                                                &nbsp;
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <div class="form-group row">
                                                                    <asp:Label ID="IndividualsetDesc" runat="server" class="col-2 label-control" for="txt_DatasetDesc"> Individualset Description</asp:Label>
                                                                    <div class="col-9">
                                                                        <asp:TextBox TextMode="MultiLine" Rows="4" ID="Txt_DatasetDesc" runat="server" Text='<%# Bind("IndividualsetDesc")%>' class="form-control"></asp:TextBox>
                                                                    </div>
                                                                    <div class="col-md-1">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="form-actions m-0 pt-1 pb-0 center">
                                                            <asp:Button ID="btnUpdate" Text='<%# (Container is GridEditFormInsertItem) ? "Insert" : "Update" %>' class="btn btn-success mr-1 ladda-button btn-sm" data-style="expand-right"
                                                                runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'></asp:Button>&nbsp;
                                                                   <asp:Button ID="Button1" Text="Cancel" runat="server" CausesValidation="False" class="btn btn-danger mr-1 ladda-button btn-sm" data-style="expand-right"
                                                                       CommandName="Cancel" OnClientClick="if (!confirm('Are you sure?')) { return false }"></asp:Button>
                                                        </div>
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
                </MasterTableView>
                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <ClientSettings EnableRowHoverStyle="true" Selecting-AllowRowSelect="false">
                    <ClientEvents OnColumnMouseOut="RG_Individualset_OnColumnMouseOut"></ClientEvents>
                    <Selecting AllowRowSelect="true" />
                    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                </ClientSettings>
                <FilterMenu RenderMode="Lightweight"></FilterMenu>
                <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
            </telerik:RadGrid>

        </div>
    </section>
</div>

<asp:SqlDataSource ID="Ds_Centers" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_Center_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="Ds_PIs" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_PI_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        <asp:Parameter Name="InputType" Type="Int32" DefaultValue="-1" />

    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="Ds_Individualset" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_Individualset_PI_Sel" SelectCommandType="StoredProcedure"
    UpdateCommand="Sp_Individualset_Upd" UpdateCommandType="StoredProcedure" InsertCommand="Sp_Individualset_Ins" InsertCommandType="StoredProcedure">
    <InsertParameters>
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int16" />
        <asp:ControlParameter ControlID="DDL_PIs" Name="PIID" PropertyName="SelectedValue" Type="Int16" />
        <asp:Parameter Name="IndividualsetID" Type="Int32" />
        <asp:Parameter Name="IndividualsetName" Type="String" />
        <asp:Parameter Name="IndividualsetDesc" Type="String" />
        <asp:Parameter Name="IndividualsetTypeID" Type="Int32" />
        <asp:Parameter Name="IndividualsetStatus" Type="Int32" />
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
        <asp:Parameter Name="IndividualsetID" Type="Int32" />
        <asp:Parameter Name="IndividualsetName" Type="String" />
        <asp:Parameter Name="IndividualsetDesc" Type="String" />
        <asp:Parameter Name="IndividualsetTypeID" Type="Int16" />
        <asp:Parameter Name="IndividualsetStatus" Type="Int16" />
        <asp:SessionParameter Name="CreatorID" SessionField="WiNGSMasterId" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="Ds_IndividualsetType" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_IndividualsetType_Sel" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
<asp:SqlDataSource ID="Ds_IndividualsetStatus" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand=" Select 0 as val_IndividualsetStatus , 'Inactive' as txt_IndividualsetStatus union  Select 1, 'Active' "></asp:SqlDataSource>

