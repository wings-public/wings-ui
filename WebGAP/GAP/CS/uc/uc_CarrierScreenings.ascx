<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_CarrierScreenings.ascx.cs" Inherits="WebGAP.GAP.CS.uc.uc_CarrierScreenings" %>



<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <%--<telerik:AjaxSetting AjaxControlID="DDL_Centers">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_Centers" />
                <telerik:AjaxUpdatedControl ControlID="DDL_PIs" />
                <telerik:AjaxUpdatedControl ControlID="RG_CarrierScreening" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="DDL_PIs">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_PIs" />
                <telerik:AjaxUpdatedControl ControlID="RG_CarrierScreening" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>--%>
        <telerik:AjaxSetting AjaxControlID="RG_CarrierScreening">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_CarrierScreening"  />
            </UpdatedControls>
        </telerik:AjaxSetting>

            <telerik:AjaxSetting AjaxControlID="RCB_searchCarrierScreening">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_CarrierScreening"  />
            </UpdatedControls>
        </telerik:AjaxSetting>
           <telerik:AjaxSetting AjaxControlID="btnUpdate">
            <UpdatedControls>
                 
                <telerik:AjaxUpdatedControl ControlID="RG_CarrierScreening" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        

    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>

<div class="content-header row">
   
<%--    <div class="content-header-right col-md-6 col-12">
        <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
            <div class="btn-group" role="group">
                <asp:DropDownList ID="DDL_Centers" runat="server" Width="150px" DataTextField="CenterDesc" DataValueField="CenterID" EnableViewState="false"
                    AutoPostBack="true" DataSourceID="Ds_Centers" AppendDataBoundItems="true"
                    class="btn btn-outline-info dropdown-toggle dropdown-menu-right mr-1 btn-sm">
                    
                </asp:DropDownList>
                <asp:DropDownList ID="DDL_PIs" runat="server" Width="150px" DataTextField="PIName" DataValueField="PIID" DataSourceID="Ds_PIs" OnDataBound="DDL_PIs_DataBound"
                    AutoPostBack="true" class="btn btn-outline-info dropdown-toggle dropdown-menu-right mr-1 btn-sm" EnableViewState="false">
                </asp:DropDownList>
            </div>
        </div>
    </div>--%>
</div>
<div class="content-header row pt-2">
       <table style="width: 100%; background-color: lightgray">

            <tr>
                <td rowspan="2" style="width: 220px">
                    <asp:Label runat="server" ID="Sample" Text="Carrier Screening " CssClass="header"> </asp:Label>
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
            <asp:HiddenField ID="hdn_searchCarrierScreening" runat="server" />
             <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">

            <telerik:RadGrid RenderMode="Lightweight" ID="RG_CarrierScreening" runat="server" GridLines="Both" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="-1" Height="700px"  OnItemDataBound="RG_CarrierScreening_ItemDataBound" OnInsertCommand="RG_CarrierScreening_InsertCommand"
                AllowPaging="True" ShowStatusBar="True" DataSourceID="DS_CarrierScreening" AllowAutomaticUpdates="true" OnItemUpdated="RG_CarrierScreening_ItemUpdated"  DataKeyNames="CarrierScreeningID" OnItemInserted="RG_CarrierScreening_ItemInserted" OnItemCommand="RG_CarrierScreening_ItemCommand" >
                <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                <MasterTableView CommandItemDisplay="Top" Name="Master" DataSourceID="DS_CarrierScreening" AutoGenerateColumns="false" NoMasterRecordsText="No records to display." DataKeyNames="CarrierScreeningID">
                    <CommandItemTemplate>
                        <telerik:RadButton RenderMode="Lightweight" runat="server" ID="RB_insert" CommandName="InitInsert" Text="Add New" Height="33px" Font-Size="Smaller">
                            <Icon PrimaryIconUrl="~/img/icon/icon_insert_Sample.png" PrimaryHoveredIconUrl="~/img/icon/icon_insert_Sample_Hovered.png" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                        </telerik:RadButton>
                        <telerik:RadButton RenderMode="Lightweight" runat="server" Text="Clear Filter" ID="RTB_DeleteSearch" OnClientClicked="RB_DeleteSearch_Clicked" Height="33px" Font-Size="Smaller">
                            <Icon PrimaryIconUrl="~/img/icon/icon_search_Filter.png" PrimaryHoveredIconUrl="~/img/icon/icon_search_Filter_Hovered.png" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                        </telerik:RadButton>
                        <telerik:RadComboBox RenderMode="Lightweight" ID="RCB_searchCarrierScreening" runat="server" AutoPostBack="True" DataSourceID="DS_searchCarrierScreening" 
                            Width="350px" EmptyMessage="Filter by ID" CssClass="pl-0" Filter="Contains" DataTextField="CarrierScreening_Info" DataValueField="CarrierScreeningID"  OnClientSelectedIndexChanged="RCB_searchCarrierScreeningIndexChange">
                        </telerik:RadComboBox>
                    </CommandItemTemplate>
                    <Columns>
              
                        <telerik:GridBoundColumn DataField="CarrierScreeningID" DataType="System.Int64" FilterControlAltText="Filter CarrierScreeningID column" HeaderText="Carrier Screening ID" ReadOnly="True" SortExpression="CarrierScreeningID" UniqueName="CarrierScreeningID">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="CarrierScreening_Description"  FilterControlAltText="Filter CarrierScreening_Description column" HeaderText="Description" ReadOnly="True" SortExpression="CarrierScreening_Description" UniqueName="CarrierScreening_Description">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="FemaleID"  FilterControlAltText="Filter Female ID column" HeaderText="Female ID" ReadOnly="True" SortExpression="FemaleID" UniqueName="FemaleID">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="MaleID"  FilterControlAltText="Filter MaleID column" HeaderText="MaleID" ReadOnly="True" SortExpression="MaleID" UniqueName="MaleID">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn  DataField="Updatable" UniqueName="Updatable" Groupable="False" EnableHeaderContextMenu="false" DataType="System.Int32" Visible="false" >
                            <ItemTemplate>
                                <asp:HiddenField runat="server" ID="hdn_Updatable" Value='<%# Bind("Updatable") %>' />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                         <telerik:GridEditCommandColumn UniqueName="EditCommandColumn" ButtonType="ImageButton" EditImageUrl="~/img/icon/icon_edit.png" EnableHeaderContextMenu="false">
                            <HeaderStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridEditCommandColumn>
                          <telerik:GridTemplateColumn>
                            <HeaderStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:ImageButton ID="Carrier_Screening" BorderWidth="0px" ImageUrl="~/img/icon/CarrierScreening.png" Width="30px" Height="30px" CommandName="DoCarrierScreening"
                                    runat="server" ToolTip="Carrier Screening"></asp:ImageButton>
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
                                               
                                                         <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="form-group row">
                                                                    <label class="col-md-2 label-control" for="Txt_Sample_ID">Description</label>
                                                                    <div class="col-md-9">
                                                                        <asp:TextBox ID="txt_carrierScreening_Desc" TextMode="MultiLine" class="form-control" Width="100%" runat="server" Text='<%# Bind("CarrierScreening_Description")%>' ></asp:TextBox>
                                                                    </div>
                                                                    <div class="col-md-1">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                           
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                               <div class="form-group row">
                                                                    <div style="border-color: gainsboro; display: flex; flex-direction: row; justify-content: flex-end; padding-left: 150px">
                                                                        <div class="col-md-4 pl-2 pr-0">
                                                                            <label class="label-control" for="Txt_Female_ID">Female ID</label>
                                                                        </div>
                                                                        <div class="col-md-6 pl-2 pr-0">
                                                                            <telerik:RadTextBox runat="server" ID="txt_FemaleID" Text='<%# Bind("FemaleID") %>' Enabled="false" ></telerik:RadTextBox>
                                                                        </div>

                                                                        <div class="col-md-2 pl-0">
                                                                            <table>
                                                                                <td style="width: 50%">
                                                                                    <asp:ImageButton runat="server" OnClientClick="OpenWinFemale(); return false;" BorderWidth="0px" ImageUrl="~/img/icon/icon_Add_Individual_16.png" ToolTip="Assign Female" />
                                                                                </td>
                                                                                <td style="width: 50%">
                                                                                    <asp:ImageButton ID="imgbtn_Delete_Female" OnClientClick="DeleteAssigned_Female(); return false;" runat="server" BorderWidth="0px" ImageUrl="~/img/icon/icon_del-trash.gif" ToolTip="Delete Assigned Female" />
                                                                                </td>
                                                                            </table>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                             <div class="form-group row">
                                                                    <div style="border-color: gainsboro; display: flex; flex-direction: row; justify-content: flex-end; padding-left: 150px">
                                                                        <div class="col-md-4 pl-2 pr-0">
                                                                            <label class="label-control" for="Txt_Male_ID">Male ID</label>
                                                                        </div>
                                                                        <div class="col-md-6 pl-2 pr-0">
                                                                            <telerik:RadTextBox runat="server" ID="txt_MaleID" Text='<%# Bind("MaleID") %>' Enabled="false" ></telerik:RadTextBox>
                                                                        </div>

                                                                        <div class="col-md-2 pl-0">
                                                                            <table>
                                                                                <td style="width: 50%">
                                                                                    <asp:ImageButton runat="server" OnClientClick="OpenWinMale(); return false;" BorderWidth="0px" ImageUrl="~/img/icon/icon_Add_Individual_16.png" ToolTip="Assign Male" />
                                                                                </td>
                                                                                <td style="width: 50%">
                                                                                    <asp:ImageButton ID="imgbtn_Delete_Male" OnClientClick="DeleteAssigned_Male(); return false;" runat="server" BorderWidth="0px" ImageUrl="~/img/icon/icon_del-trash.gif" ToolTip="Delete Assigned Male" />
                                                                                </td>
                                                                            </table>
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
                 </telerik:RadAjaxPanel>
         <%--   <asp:SqlDataSource ID="Ds_Centers" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_Center_Sel" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="Ds_PIs" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_PI_Sel"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" Type="Int32" />
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                    <asp:Parameter Name="InputType" Type="Int32" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>--%>
            <asp:SqlDataSource ID="DS_searchCarrierScreening" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                SelectCommand="Sp_GAP_CarrierScreening_Search" SelectCommandType="StoredProcedure">
                <SelectParameters>
                     <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32"  />
                    <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DS_CarrierScreening" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                SelectCommand="Sp_GAP_CarrierScreening_sel" SelectCommandType="StoredProcedure" InsertCommandType="StoredProcedure" UpdateCommand="Sp_GAP_CarrierScreening_Upd" UpdateCommandType="StoredProcedure">
      <%--          <InsertParameters>
                    <asp:Parameter Name="FemaleID" Type="Int64" />
                    <asp:Parameter Name="MaleID" Type="Int64" />
                    <asp:Parameter Name="CarrierScreening_Description" Type="String" />
                    <asp:Parameter Name="UserID" Type="Int32" />
                </InsertParameters>--%>
                <SelectParameters>
                     <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32"  />
                    <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                     <asp:ControlParameter ControlID="hdn_searchCarrierScreening" Name="CarrierScreeningID" Type="Int64" DefaultValue="-1" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CarrierScreeningID" Type="Int64" />
                    <asp:Parameter Name="FemaleID" Type="Int64" />
                    <asp:Parameter Name="MaleID" Type="Int64" />
                    <asp:Parameter Name="CarrierScreening_Description" Type="String" />
                     <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                </UpdateParameters>
             
            </asp:SqlDataSource>
        </div>
    </section>
</div>

     <telerik:RadWindowManager RenderMode="Lightweight" ID="RadWindowManager1" ShowContentDuringLoad="false" VisibleStatusbar="false"
                ReloadOnShow="true" runat="server" EnableShadow="true" VisibleTitlebar="false" Skin="Windows7">
                <Windows>
                    <telerik:RadWindow RenderMode="Lightweight" ID="RadWindow1" runat="server" BorderStyle="None" BorderWidth="1px" CssClass="px-0 pb-0" OnClientClose="OnClientClose_Male">
                    </telerik:RadWindow>
                      <telerik:RadWindow RenderMode="Lightweight" ID="RadWindow2" runat="server" BorderStyle="None" BorderWidth="1px" CssClass="px-0 pb-0" OnClientClose="OnClientClose_Female">
                    </telerik:RadWindow>
                </Windows>
            </telerik:RadWindowManager>

            <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
                <script type="text/javascript">

                    function OpenWinMale() {
                   <%--     var Center = $('#<%= DDL_Centers.ClientID %> option:selected').val();
                        var PI = $('#<%= DDL_PIs.ClientID %> option:selected').val();--%>

                        var Center = '<%=Session["Current_CenterID"] %>';
                        var PI = '<%=Session["Current_PIID"] %>';

                        var SampleID;
                        var grid = $find("<%= RG_CarrierScreening.ClientID %>");
                        var masterTable = grid.get_masterTableView();
                        //  Edit mode
                        if (grid.get_editItems().length > 0) {
                            var gridCount = masterTable.get_editItems().length;
                            for (var i = 0; i < gridCount; i++) {
                                item = masterTable.get_editItems()[i];
                                SampleID_Obj = $(item.get_editFormItem()).find("input[id*='txt_MaleID']").get(0);
                                SampleID = SampleID_Obj.value;
                            }
                        }

                        //insert mode
                        if (masterTable.get_insertItem() != null) {
                            var insertRow = masterTable.get_insertItem();
                            var SampleID_Obj = $(insertRow).find("input[id*='txt_MaleID']").get(0);
                            SampleID = SampleID_Obj.value;
                        }
                        var oWnd = radopen("CarrierScreening_AssignSampleToMale.aspx?CenterID=" + Center + "&PIID=" + PI + "&SampleID=" + SampleID, "RadWindow1");
                        oWnd.set_height(500);
                        oWnd.set_width(1000);
                        oWnd.center();
                        oWnd.set_modal(true);
                    }
                    
                    function OpenWinFemale() {
                      <%--  var Center = $('#<%= DDL_Centers.ClientID %> option:selected').val();
                        var PI = $('#<%= DDL_PIs.ClientID %> option:selected').val();--%>
                        var Center = '<%=Session["Current_CenterID"] %>';
                        var PI = '<%=Session["Current_PIID"] %>';
                        var SampleID;
                        var grid = $find("<%= RG_CarrierScreening.ClientID %>");
                        var masterTable = grid.get_masterTableView();
                        //  Edit mode
                        if (grid.get_editItems().length > 0) {
                            var gridCount = masterTable.get_editItems().length;
                            for (var i = 0; i < gridCount; i++) {
                                item = masterTable.get_editItems()[i];
                                SampleID_Obj = $(item.get_editFormItem()).find("input[id*='txt_FemaleID']").get(0);
                                SampleID = SampleID_Obj.value;
                            }
                        }

                        //insert mode
                        if (masterTable.get_insertItem() != null) {
                            var insertRow = masterTable.get_insertItem();
                            var SampleID_Obj = $(insertRow).find("input[id*='txt_FemaleID']").get(0);
                            SampleID = SampleID_Obj.value;
                        }
                        var oWnd = radopen("CarrierScreening_AssignSampleToFemale.aspx?CenterID=" + Center + "&PIID=" + PI + "&SampleID=" + SampleID, "RadWindow2");
                        oWnd.set_height(500);
                        oWnd.set_width(1000);
                        oWnd.center();
                        oWnd.set_modal(true);
                    }

                    function DeleteAssigned_Female() {
                        console.log("delete1");
                         var grid = $find("<%= RG_CarrierScreening.ClientID %>");
                        var masterTable = grid.get_masterTableView();
                        if (grid.get_editItems().length > 0) {
                            console.log("delete2");
                            var gridCount = masterTable.get_editItems().length;
                            for (var i = 0; i < gridCount; i++) {
                                item = masterTable.get_editItems()[i];
                                var SampleID = $(item.get_editFormItem()).find("input[id*='txt_FemaleID']").get(0);
                                SampleID.value = "";
                            }
                        }

                    }

                       function DeleteAssigned_Male() {
                         var grid = $find("<%= RG_CarrierScreening.ClientID %>");
                        var masterTable = grid.get_masterTableView();
                        if (grid.get_editItems().length > 0) {
                            var gridCount = masterTable.get_editItems().length;
                            for (var i = 0; i < gridCount; i++) {
                                item = masterTable.get_editItems()[i];
                                var SampleID = $(item.get_editFormItem()).find("input[id*='txt_MaleID']").get(0);
                                SampleID.value = "";
                            }
                        }

                    }

                    function RCB_searchCarrierScreeningIndexChange(sender, eventArgs) {
                        var grid = $find("<%= RG_CarrierScreening.ClientID %>");
                        var radcomboBox = $telerik.findControl(grid.get_element(), "RCB_searchCarrierScreening");

                        document.getElementById("<%= hdn_searchCarrierScreening.ClientID %>").value = radcomboBox.get_value();
                    }

                    function RCB_searchCarrierScreeningOpening() {
                        var grid = $find("<%= RG_CarrierScreening.ClientID %>");
                        var Com = $telerik.findControl(grid.get_element(), "RCB_searchCarrierScreening");
                        Com.set_emptyMessage(""); 
                        Com.clearSelection();
                           

                    }

                    function RB_DeleteSearch_Clicked() {
                        var grid = $find("<%= RG_CarrierScreening.ClientID %>");
                        master = grid.get_masterTableView();
                        var Com = $telerik.findControl(grid.get_element(), "RCB_searchCarrierScreening");
                        Com.clearSelection();
                        document.getElementById("<%= hdn_searchCarrierScreening.ClientID %>").value = -1;
                        master.rebind();
                    }

                     function OnClientClose_Male(oWnd, args) {
                        var arg = args.get_argument();
                        if (arg != 0) {
                            var grid = $find("<%= RG_CarrierScreening.ClientID %>");
                            var masterTable = grid.get_masterTableView();
                            //  Edit mode
                            if (grid.get_editItems().length > 0) {
                                if (arg) {

                                    var gridCount = masterTable.get_editItems().length;
                                    for (var i = 0; i < gridCount; i++) {
                                        item = masterTable.get_editItems()[i];
                                        Sample_ID = $(item.get_editFormItem()).find("input[id*='txt_MaleID']").get(0);
                                        Sample_ID.value = arg;
                                    }
                                }
                            }

                            //insert mode
                            if (masterTable.get_insertItem() != null) {
                                if (arg) {

                                    var insertRow = masterTable.get_insertItem();
                                    var Sample_ID = $(insertRow).find("input[id*='txt_MaleID']").get(0);
                                    Sample_ID.value = arg;
                                }
                            }
                        }
                    }
                       function OnClientClose_Female(oWnd, args) {
                        var arg = args.get_argument();
                        if (arg != 0) {
                            var grid = $find("<%= RG_CarrierScreening.ClientID %>");
                            var masterTable = grid.get_masterTableView();
                            //  Edit mode
                            if (grid.get_editItems().length > 0) {
                                if (arg) {

                                    var gridCount = masterTable.get_editItems().length;
                                    for (var i = 0; i < gridCount; i++) {
                                        item = masterTable.get_editItems()[i];
                                        Sample_ID = $(item.get_editFormItem()).find("input[id*='txt_FemaleID']").get(0);
                                        Sample_ID.value = arg;
                                    }
                                }
                            }

                            //insert mode
                            if (masterTable.get_insertItem() != null) {
                                if (arg) {

                                    var insertRow = masterTable.get_insertItem();
                                    var Sample_ID = $(insertRow).find("input[id*='txt_FemaleID']").get(0);
                                    Sample_ID.value = arg;
                                }
                            }
                        }
                    }
                      </script>
            </telerik:RadScriptBlock>  

