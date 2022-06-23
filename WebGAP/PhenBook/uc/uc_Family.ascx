<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Family.ascx.cs" Inherits="WebGAP.PhenBook.uc.uc_Family" %>

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

        <telerik:AjaxSetting AjaxControlID="RG_Family">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_Family" LoadingPanelID="RadAjaxLoadingPanel1" />
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
                <asp:Label runat="server" ID="Family" Text="Family " CssClass="header"> </asp:Label>
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
                function RG_Samples_OnColumnMouseOut(sender, args) {
                }
            </script>
            <asp:HiddenField ID="hdn_searchFamilyID" runat="server" />

            <telerik:RadGrid RenderMode="Lightweight" ID="RG_Family" runat="server" GridLines="Both" OnPreRender="RG_Family_PreRender" OnItemInserted="RG_Family_ItemInserted"
                AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="-1" Height="700px" OnItemUpdated="RG_Family_ItemUpdated" OnInsertCommand="RG_Family_InsertCommand"
                ShowStatusBar="True" AllowAutomaticDeletes="True" OnItemDataBound="RG_Family_ItemDataBound" OnItemCreated="RG_Family_ItemCreated"
                AllowAutomaticUpdates="True" DataSourceID="Ds_Families" OnItemCommand="RG_Family_ItemCommand" DataKeyNames="FamilyID,HostID">
                <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                <MasterTableView CommandItemDisplay="Top" Name="Master" AutoGenerateColumns="false" DataSourceID="Ds_Families" DataKeyNames="FamilyID,HostID" NoMasterRecordsText="No records to display.">

                    <CommandItemTemplate>
                        <%--<telerik:RadButton RenderMode="Lightweight" runat="server" ID="RB_insert" CommandName="InitInsert" Text="Add New Family" Height="33px" Font-Size="Smaller">
                            <Icon PrimaryIconUrl="~/img/icon/icon_insert_Sample.png" PrimaryHoveredIconUrl="~/img/icon/icon_insert_Sample_Hovered.png" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                        </telerik:RadButton>
                        <telerik:RadButton RenderMode="Lightweight" runat="server" Text="Clear Filter" ID="RTB_DeleteSearch" OnClientClicked="RB_DeleteSearch_Clicked" Height="33px" Font-Size="Smaller">
                            <Icon PrimaryIconUrl="~/img/icon/icon_search_Filter.png" PrimaryHoveredIconUrl="~/img/icon/icon_search_Filter_Hovered.png" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                        </telerik:RadButton>
                        <telerik:RadComboBox RenderMode="Lightweight" ID="RCB_searchFamily" runat="server" AutoPostBack="True" DataSourceID="DS_searchFamily"
                            OnClientDropDownOpened="RCB_searchFamilyOpening" ChangeTextOnKeyBoardNavigation="true" OnClientSelectedIndexChanged="RCB_searchFamilyIndexChange"
                            Width="350px" Height="150px" EmptyMessage="Filter by ID" CssClass="pl-0" Filter="Contains" DataTextField="Family_Info" DataValueField="FamilyID">
                        </telerik:RadComboBox>--%>
                        <telerik:RadButton RenderMode="Lightweight" runat="server" ID="RB_insert" CommandName="InitInsert" Text="Add New Family" Height="33px" Font-Size="Smaller" Enabled="false">
                            <Icon PrimaryIconUrl="~/img/icon/icon_insert_Sample.png" PrimaryHoveredIconUrl="~/img/icon/icon_insert_Sample_Hovered.png" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                        </telerik:RadButton>
                        <telerik:RadButton RenderMode="Lightweight" runat="server" Text="Clear Filter" ID="RTB_DeleteSearch" OnClick="RTB_DeleteSearch_Click"
                            Height="33px" Font-Size="Smaller" AutoPostBack="True">
                            <Icon PrimaryIconUrl="~/img/icon/icon_search_Filter.png" PrimaryHoveredIconUrl="~/img/icon/icon_search_Filter_Hovered.png" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                        </telerik:RadButton>

                        <telerik:RadComboBox RenderMode="Lightweight" ID="RCB_searchFamily" runat="server" AutoPostBack="true" DataSourceID="DS_searchFamily"
                            OnSelectedIndexChanged="RCB_searchFamily_SelectedIndexChanged" OnPreRender="RCB_searchFamily_PreRender"
                            ChangeTextOnKeyBoardNavigation="true"
                            Width="350px" Height="150px" EmptyMessage="Filter by ID" CssClass="pl-0" Filter="Contains" DataTextField="Family_Info" DataValueField="FamilyID">
                        </telerik:RadComboBox>

                    </CommandItemTemplate>

                    <Columns>
                        <telerik:GridBoundColumn DataField="HostDesc" DataType="System.Int64" FilterControlAltText="Filter HostDesc column" HeaderText="Host" SortExpression="HostDesc" UniqueName="HostDesc">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="HostID"  UniqueName="HostID" DataType="System.Int32" HeaderText="Host" Visible="false">
                           
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="FamilyID" DataType="System.Int64" FilterControlAltText="Filter FamilyID column" HeaderText="Family ID" SortExpression="FamilyID" UniqueName="FamilyID">
                            <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="IndividualID" DataType="System.Int64" FilterControlAltText="Filter IndividualID column" HeaderText="Proband ID" SortExpression="IndividualID" UniqueName="IndividualID">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="LocalID" DataType="System.Int64" FilterControlAltText="Filter LocalID column" HeaderText="Local ID" SortExpression="LocalID" UniqueName="LocalID">
                            <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="IndividualFName" FilterControlAltText="Filter IndividualFName column" HeaderText="Proband First Name">
                            <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="IndividualLName" FilterControlAltText="Filter IndividualID column" HeaderText="Proband Last Name">
                            <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="FamilyDesc" FilterControlAltText="Filter FamilyDesc column" HeaderText="Description" SortExpression="FamilyDesc" UniqueName="FamilyDesc">
                            <HeaderStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>


                        <telerik:GridTemplateColumn DataType="System.int32" DataField="Updatable" UniqueName="Updatable" Groupable="False" EnableHeaderContextMenu="false" Visible="false">
                            <ItemTemplate>
                                <asp:HiddenField runat="server" ID="hdn_Updatable" Value='<%# Bind("Updatable") %>' />

                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                     
                        <%-- <telerik:GridTemplateColumn DataType="System.int32" DataField="ReferenceBuildID" UniqueName="Updatable" Groupable="False" EnableHeaderContextMenu="false" Visible="false">
                            <ItemTemplate>
                                <asp:HiddenField runat="server" ID="hdn_ReferenceID" Value='<%# Bind("ReferenceBuildID") %>' />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>--%>

                        <telerik:GridTemplateColumn>
                            <HeaderStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:ImageButton ID="FamilyHealthHistory" BorderWidth="0px" ImageUrl="~/img/icon/icon_add.png" Width="25px" Height="25px" CommandName="FamilyHealthHistory"
                                    runat="server" ToolTip="Add Pedigree"></asp:ImageButton>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn>
                            <HeaderStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:ImageButton ID="DrawPedigree" BorderWidth="0px" ImageUrl="~/img/icon/icon_pedigree.png" Width="25px" Height="25px" CommandName="ShowPedigree"
                                    runat="server" ToolTip="Show Pedigree"></asp:ImageButton>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <%--<telerik:GridButtonColumn CommandName="FamilyHealthHistory" Text="Add Pedigree" UniqueName="FamilyHealthHistory"  EnableHeaderContextMenu="false"
                            ButtonType="ImageButton" ImageUrl="~/img/icon/icon_add.png" >
                            <HeaderStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridButtonColumn>--%>

                        <%--<telerik:GridTemplateColumn UniqueName="DrawPedigree" Groupable="False" AllowFiltering="false"  EnableHeaderContextMenu="false">
                            <HeaderStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small"></ItemStyle>
                            <ItemTemplate>
                                <asp:ImageButton ID="DrawPedigree"  BorderWidth="0px" ImageUrl="../../img/icon/icon_pedigree.png" Width="30px" Height="30px" 
                                    runat="server" ToolTip="Show Pedigree"></asp:ImageButton>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>--%>
                        <telerik:GridEditCommandColumn UniqueName="EditCommandColumn" ButtonType="ImageButton"
                            EditImageUrl="~/img/icon/icon_edit.png" EnableHeaderContextMenu="false">
                            <HeaderStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridEditCommandColumn>

                    </Columns>
                    <EditFormSettings EditFormType="Template" FormStyle-CssClass=".width-fix ">
                        <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
                        <FormTemplate>

                            <div class="col-md-12">
                                <div class="card">

                                    <div class="card-content collpase show">
                                        <div class="card-body">

                                            <form class="form form-horizontal">
                                                <div class="form-body">
                                                    <div class="form-group row">
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="projectinput1">Family Description:</label>
                                                                <div class="col-md-7 position-relative">
                                                                    <asp:TextBox ValidationGroup="SubmitGroup" ID="Txt_Family_Desc" class="form-control" runat="server" Text='<%# Bind("FamilyDesc")%>'></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_family" runat="server" Display="Dynamic" class="invalid-tooltip" 
                                                                        ValidationGroup="SubmitGroup" ControlToValidate="Txt_Family_Desc" ErrorMessage="Please provide a valid description."></asp:RequiredFieldValidator>
                                                               
                                                                </div>
                                                                <div class="col-md-2">
                                                                     </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group row">
                                                                <asp:Label runat="server" ID="lbl_HID" class="col-md-4 label-control" for="DDL_DSID">Host</asp:Label>
                                                                <div class="col-md-7">
                                                                    <telerik:RadComboBox RenderMode="Lightweight" ID="DDL_HostID" runat="server" DropDownHeight="200px" Width="250px"
                                                                         DropDownWidth="250px" CausesValidation="False"
                                                                        DataValueField="HostID" DataTextField="HostDesc" DataSourceID="DS_DDL_HID">
                                                                        <Items>
                                                                            <telerik:RadComboBoxItem runat="server" Text="Select a host"></telerik:RadComboBoxItem>
                                                                        </Items>
                                                                    </telerik:RadComboBox>
                                                                </div>
                                                                <div class="col-md-1">
                                                                    <%--     <asp:RequiredFieldValidator ID="Requiredfieldvalidator6" runat="server" Display="Dynamic" 
                                                                            ControlToValidate="DDL_DSID" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-actions m-0 pt-1 pb-1 center">
                                                    <asp:Button ID="btnUpdate" ValidationGroup="SubmitGroup" Text='<%# (Container is GridEditFormInsertItem) ? "Insert" : "Update" %>' class="btn btn-success mr-1 ladda-button btn-sm" data-style="expand-right"
                                                        runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'></asp:Button>&nbsp;
                                                                <asp:Button ID="Button1" Text="Cancel" runat="server" class="btn btn-danger mr-1 ladda-button btn-sm" data-style="expand-right"
                                                                    CommandName="Cancel" CausesValidation="False"></asp:Button>
                                                </div>
                                            </form>
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
                    <ClientEvents OnColumnMouseOut="RG_Samples_OnColumnMouseOut"></ClientEvents>
                    <Selecting AllowRowSelect="true" />
                    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                </ClientSettings>

                <FilterMenu RenderMode="Lightweight"></FilterMenu>

                <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
            </telerik:RadGrid>

            <telerik:RadWindowManager ID="RadWindowManager2" ShowContentDuringLoad="true" RenderMode="Lightweight"
                ReloadOnShow="true" runat="server" EnableShadow="true"
                Skin="Windows7" AutoSize="false" Modal="true" VisibleStatusbar="false" VisibleTitlebar="false">
                <Windows>
                    <telerik:RadWindow ID="RadWindow2" runat="server" RenderMode="Lightweight" Behaviors="Close" BorderStyle="None" BorderWidth="1px" CssClass="px-0 pb-0">
                    </telerik:RadWindow>
                </Windows>
            </telerik:RadWindowManager>


            <asp:SqlDataSource ID="DS_searchFamily" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                SelectCommand="Sp_Families_Search_ToDefine" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
                    <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" ID="Ds_Families" SelectCommand="Sp_Families_sel_ToDefine" SelectCommandType="StoredProcedure"
                UpdateCommand="Sp_Family_Upd" UpdateCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
                    <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterID" Type="Int32" />
                    <asp:ControlParameter ControlID="hdn_searchFamilyID" Name="FamilyID" Type="Int64" DefaultValue="-1" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FamilyID" Type="Int64" />
                    <asp:Parameter Name="FamilyDesc" Type="String" />
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterID" Type="Int32" />
                    <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
                    <asp:Parameter Name="HostID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="DS_DDL_HID" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_Center_Hosts_Sel" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </section>
</div>
<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">

    <script type="text/javascript">

        function openWinPedigree() {

            var h = $(document).height();
            var w = $(document).width();

            var oWnd = radopen("/PhenBook/DrawPedigree.aspx", "RadWindow2");
            oWnd.set_height(750);
            oWnd.set_width(800);
            oWnd.center();

            oWnd.set_modal(true);
        }

    </script>
</telerik:RadScriptBlock>

