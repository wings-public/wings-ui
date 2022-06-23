<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Samples.ascx.cs" Inherits="WebGAP.GAP.uc.uc_Samples" %>

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

        <telerik:AjaxSetting AjaxControlID="RG_Samples">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_Samples" LoadingPanelID="RadAjaxLoadingPanel1" />


            </UpdatedControls>
        </telerik:AjaxSetting>

    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>

<%--<div class="content-header row">

    <div class="content-header-right col-md-6 col-12">
        <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
            <div class="btn-group" role="group">
                <asp:DropDownList ID="DDL_Centers" runat="server" Width="150px" DataTextField="CenterDesc" DataValueField="CenterID" EnableViewState="false"
                    AutoPostBack="true" DataSourceID="Ds_Centers" AppendDataBoundItems="true" Visible="false"
                    class="btn btn-outline-info dropdown-toggle dropdown-menu-right mr-1 btn-sm">
                </asp:DropDownList>


                <asp:DropDownList ID="DDL_PIs" runat="server" Width="150px" DataTextField="PIName" DataValueField="PIID" DataSourceID="Ds_PIs" OnDataBound="DDL_PIs_DataBound"
                    AutoPostBack="true" class="btn btn-outline-info dropdown-toggle dropdown-menu-right mr-1 btn-sm" EnableViewState="false" Visible="false">
                </asp:DropDownList>
            </div>
        </div>
    </div>
</div>--%>
<div class="content-header row pt-2">
    <table style="width: 100%; background-color: lightgray">

        <tr>
            <td rowspan="2" style="width: 220px">
                <h4 style="margin-bottom: 1px; color: white; text-shadow: 1px 1px 1px #444;">
                    <asp:Label runat="server" ID="Sample" Text="Sample " CssClass="header"> </asp:Label></h4>
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

            <asp:HiddenField ID="hdn_searchSampleID" runat="server" />
            <asp:HiddenField ID="hdn_InsertModeHostselected" runat="server" />
            <asp:HiddenField ID="hdn_LocalID" runat="server" />
            <asp:HiddenField ID="hdn_sampleToassign" runat="server" />

            <telerik:RadGrid RenderMode="Lightweight" ID="RG_Samples" runat="server" GridLines="Both" DataSourceID="DS_Samples" OnPreRender="RG_Samples_PreRender" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="-1" Height="700px"
                OnItemUpdated="RG_Samples_ItemUpdated" AllowPaging="true" OnItemDataBound="RG_Samples_ItemDataBound" OnItemCreated="RG_Samples_ItemCreated" OnItemInserted="RG_Samples_ItemInserted" OnUpdateCommand="RG_Samples_UpdateCommand"
                ShowStatusBar="True" OnItemCommand="RG_Samples_ItemCommand" DataKeyNames="SampleID,HostID" OnInsertCommand="RG_Samples_InsertCommand">
                <PagerStyle Mode="NextPrev" AlwaysVisible="True"></PagerStyle>
                <MasterTableView CommandItemDisplay="Top" Name="Master" AutoGenerateColumns="false" DataKeyNames="SampleID,HostID" DataSourceID="DS_Samples" ClientDataKeyNames="SampleID" NoMasterRecordsText="No records to display.">
                    <CommandItemTemplate>
                        <%--<telerik:RadButton RenderMode="Lightweight" runat="server" ID="RB_insert" CommandName="InitInsert" Text="Add New Sample" Height="33px" Font-Size="Smaller" AutoPostBack="true">
                            <Icon PrimaryIconUrl="~/img/icon/icon_insert_Sample.png" PrimaryHoveredIconUrl="~/img/icon/icon_insert_Sample_Hovered.png" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                        </telerik:RadButton>
                        <telerik:RadButton RenderMode="Lightweight" runat="server" Text="Clear Filter" ID="RTB_DeleteSearch" OnClientClicked="RB_DeleteSearch_Clicked" Height="33px" Font-Size="Smaller">
                            <Icon PrimaryIconUrl="~/img/icon/icon_search_Filter.png" PrimaryHoveredIconUrl="~/img/icon/icon_search_Filter_Hovered.png" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                        </telerik:RadButton>
                        <telerik:RadComboBox RenderMode="Lightweight" ID="RCB_searchSample" runat="server" AutoPostBack="True" DataSourceID="DS_searchSample"
                            OnClientDropDownOpened="RCB_searchSampleOpening" ChangeTextOnKeyBoardNavigation="true" OnClientSelectedIndexChanged="RCB_searchSampleIndexChange"
                            Width="350px" Height="150px" EmptyMessage="Filter by ID and Local ID" CssClass="pl-0" Filter="Contains" DataTextField="Sample_Info" DataValueField="SampleID">
                        </telerik:RadComboBox>--%>


                        <telerik:RadButton RenderMode="Lightweight" runat="server" ID="RB_insert" CommandName="InitInsert" Text="Add New Sample" Height="33px" Font-Size="Smaller" Enabled="false">
                            <Icon PrimaryIconUrl="~/img/icon/icon_insert_Sample.png" PrimaryHoveredIconUrl="~/img/icon/icon_insert_Sample_Hovered.png" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                        </telerik:RadButton>
                        <telerik:RadButton RenderMode="Lightweight" runat="server" Text="Clear Filter" ID="RTB_DeleteSearch" OnClick="RTB_DeleteSearch_Click"
                            Height="33px" Font-Size="Smaller" AutoPostBack="True">
                            <Icon PrimaryIconUrl="~/img/icon/icon_search_Filter.png" PrimaryHoveredIconUrl="~/img/icon/icon_search_Filter_Hovered.png" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                        </telerik:RadButton>

                        <telerik:RadComboBox RenderMode="Lightweight" ID="RCB_searchSample" runat="server" AutoPostBack="True" DataSourceID="DS_searchSample" OnSelectedIndexChanged="RCB_searchSample_SelectedIndexChanged"
                            ChangeTextOnKeyBoardNavigation="true" ViewStateMode="Enabled" OnPreRender="RCB_searchSample_PreRender"
                            Width="350px" Height="150px" EmptyMessage="Filter by sample ID and Local ID" CssClass="pl-0" Filter="Contains" DataTextField="Sample_Info" DataValueField="SampleID">
                        </telerik:RadComboBox>


                    </CommandItemTemplate>
                    <Columns>
                        <telerik:GridTemplateColumn UniqueName="SampleID" DataField="SampleID" HeaderText="Sample ID">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbl_SheetOrUI" Width="8px" Height="8px"></asp:Label>
                                <%--<asp:ImageButton ID="img_SampleSheetOrUI" BorderWidth="0px" runat="server" Width="25" />--%>
                                <asp:Label runat="server" Text='<%# Eval("SampleID") %>'></asp:Label>
                                <asp:HiddenField ID="hdn_SampleSheetOrUI" runat="server" Value='<%# Eval("SampleSheetOrUI") %>' />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn UniqueName="HostDes" HeaderText="Host" DataField="HostDesc" FilterControlAltText="Filter HostDes column" SortExpression="HostDes">
                            <HeaderStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn UniqueName="HostID" DataField="HostID" Visible="false">
                            <HeaderStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn UniqueName="LocalID" HeaderText="Local ID" DataField="LocalID" FilterControlAltText="Filter LocalID column" SortExpression="LocalID">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="IndividualID" FilterControlAltText="Filter IndividualID column" HeaderText="Individual ID" SortExpression="IndividualID" UniqueName="IndividualID">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SampleTypeName" FilterControlAltText="Filter SampleTypeName column" HeaderText="Sample Type" SortExpression="SampleTypeName" UniqueName="SampleTypeName">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SeqTypeName" FilterControlAltText="Filter SeqTypeName column" HeaderText="Seq Type" SortExpression="SeqTypeName" UniqueName="SeqTypeName">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SeqMachineName" FilterControlAltText="Filter SeqMachineName column" HeaderText="Seq Machine" SortExpression="SeqMachineName" UniqueName="SeqMachineName">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SeqTargetCov" DataType="System.Int32" FilterControlAltText="Filter SeqTargetCov column" HeaderText="Coverage" SortExpression="SeqTargetCov" UniqueName="SeqTargetCov">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SeqTargetReadLen" DataType="System.Int32" FilterControlAltText="Filter SeqTargetReadLen column" HeaderText="Read Lenght" SortExpression="SeqTargetReadLen" UniqueName="SeqTargetReadLen">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SeqKitModelName" FilterControlAltText="Filter SeqKitModelName column" HeaderText="Seq Kit Model" SortExpression="SeqKitModelName" UniqueName="SeqKitModelName">
                            <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SeqDate" DataType="System.DateTime" FilterControlAltText="Filter SeqDate column" HeaderText="Seq Date" SortExpression="SeqDate" UniqueName="SeqDate" DataFormatString="{0:M/d/yyyy}">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn UniqueName="Count" DataField="Count" HeaderText="# of Files">
                            <HeaderStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />

                        </telerik:GridBoundColumn>
                        <telerik:GridEditCommandColumn UniqueName="EditCommandColumn" ButtonType="ImageButton" EditImageUrl="~/img/icon/icon_edit.png" EnableHeaderContextMenu="false">
                            <HeaderStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center" />
                        </telerik:GridEditCommandColumn>
                        <telerik:GridTemplateColumn DataType="System.int32" DataField="Updatable" UniqueName="Updatable" Groupable="False" EnableHeaderContextMenu="false" Visible="false">
                            <ItemTemplate>
                                <asp:HiddenField runat="server" ID="hdn_Updatable" Value='<%# Bind("Updatable") %>' />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn>
                            <HeaderStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="50px" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:ImageButton ID="GoToNewFile" BorderWidth="0px" Width="25px" Height="25px" CommandName="GoToNewFile" ImageUrl="../../img/icon/icon_file0.png"
                                    runat="server" ToolTip="file import"></asp:ImageButton>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>


                    </Columns>

                    <EditFormSettings EditFormType="Template">
                        <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
                        <FormTemplate>
                            
                            <div class="row">
                                <div class="col-md-12 ">
                                    <div class="card" style="padding-left:0">

                                        <div class="card-body">
                                            <div class="card-block">
                                                <div class="form form-horizontal">
                                                    <div class="form-body">
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="Txt_Sample_ID">Sample ID</label>
                                                                    <div class="col-md-8">
                                                                        <asp:HiddenField runat="server" ID="hdn_count" Value='<%# Bind("Count") %>' />
                                                                        <asp:TextBox ID="Txt_Sample_ID" class="form-control" Width="250px" runat="server" Text='<%# Bind("SampleID")%>' disabled="disabled"></asp:TextBox>
                                                                    </div>
                                                                   
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="Txt_Individual_ID">Individual ID</label>
                                                                    <div class="col-md-6 pl-2 pr-0">
                                                                        <telerik:RadTextBox runat="server" ID="txt_IndividualID" Text='<%# Bind("IndividualID") %>' Enabled="false"></telerik:RadTextBox>
                                                                    </div>

                                                                    <div style="right: 0; position: absolute;">
                                                                        <table>
                                                                            <td style="width: 50%">
                                                                                <asp:ImageButton runat="server" OnClientClick="AssignIndividual_client();" OnCommand="AssignIndividual_Command" BorderWidth="0px" ImageUrl="~/img/icon/icon_Add_Individual_16.png" ToolTip="Assign Individual" />
                                                                            </td>
                                                                            <td style="width: 50%">
                                                                                <asp:ImageButton ID="imgbtn_Delete" OnClientClick="DeleteAssigned_Individual(); return false;" runat="server" BorderWidth="0px" ImageUrl="~/img/icon/icon_del-trash.gif" ToolTip="Delete Assigned Individual" />
                                                                            </td>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group row">
                                                                    <asp:Label runat="server" ID="lbl_HID" CssClass="col-md-4 label-control" for="DDL_DSID">Host</asp:Label>
                                                                    <div class="col-md-8 position-relative">
                                                                        <telerik:RadComboBox RenderMode="Lightweight" ID="DDL_HostID" runat="server" DropDownHeight="200px" Width="250px"
                                                                            DropDownWidth="250px" CausesValidation="False" SelectedValue='<%# Bind("HostID")%>'
                                                                            DataValueField="HostID" DataTextField="HostDesc" DataSourceID="DS_DDL_HID">
                                                                            <DefaultItem Text="Select a host" Value="-1" />
                                                                        </telerik:RadComboBox>
                                                                         <asp:RequiredFieldValidator ID="Requiredfieldvalidator6" runat="server" Display="Dynamic" class="invalid-tooltip" 
                                                                            ControlToValidate="DDL_HostID" ErrorMessage="Please provide a valid host id" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                   
                                                                    </div>
                                                                    
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-4">

                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="Local_ID">Local ID</label>
                                                                    <div class="col-md-8 position-relative">
                                                                        <telerik:RadTextBox ID="Local_ID" class="form-control" runat="server" Width="250px" Text='<%# Bind("LocalID")%>'></telerik:RadTextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" InitialValue=""  ControlToValidate="Local_ID"
                                                                            class="invalid-tooltip" ErrorMessage="Please provide a valid Local id." ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                   
                                                                        </div>
                                                                    
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="eventRegInput5">Sequence Type</label>
                                                                    <div class="col-md-8 position-relative">
                                                                        <%--   <asp:DropDownList ID="DDL_SeqType" runat="server" Width="250px" class="form-control" DataTextField="SeqTypeName" DataValueField="SeqTypeID"
                                                                            SelectedValue='<%# Bind("SeqTypeID") %>' OnSelectedIndexChanged="DDL_SeqType_SelectedIndexChanged"
                                                                            AppendDataBoundItems="True" DataSourceID="SDS_SeqType">
                                                                            <asp:ListItem Selected="True" Value="">Select One</asp:ListItem>
                                                                        </asp:DropDownList>--%>

                                                                        <telerik:RadComboBox RenderMode="Lightweight" ID="DDL_SeqType" runat="server" DropDownHeight="200px" Width="250px"
                                                                            DropDownWidth="250px" CausesValidation="False" SelectedValue='<%# Bind("SeqTypeID")%>' OnClientSelectedIndexChanged="SeqType_IndexChanged"
                                                                            DataValueField="SeqTypeID" DataTextField="SeqTypeName" DataSourceID="SDS_SeqType">
                                                                            <DefaultItem Text="Select a seq type" Value="" />
                                                                        </telerik:RadComboBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" InitialValue=""  class="invalid-tooltip" 
                                                                            ControlToValidate="DDL_SeqType" ErrorMessage="Please provide a valid sequence type id" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>

                                                                    </div>
                                                                    
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group row">
                                                                    <asp:Label runat="server" class="col-md-4 label-control" for="DDL_PanelType">Panel Type</asp:Label>
                                                                    <div class="col-md-8">


                                                                        <telerik:RadDropDownList class="form-control" ID="DDL_PanelType" Width="100%" runat="server" DataSourceID="SDS_PanelType" DataTextField="PanelTypeName" DataValueField="PanelTypeID"
                                                                            SelectedValue='<%# Bind("PanelTypeID")%>' CausesValidation="False" AppendDataBoundItems="True" DefaultMessage="Select one">
                                                                            <Items>
                                                                                <telerik:DropDownListItem Value="-1" Text="Select One" />
                                                                            </Items>
                                                                        </telerik:RadDropDownList>

                                                                    </div>
                                                                   
                                                                        <%--<asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="*" Display="Dynamic" ValidationGroup="SubmitGroup" 
                                                                                    ControlToValidate="DDL_PanelType" ForeColor="#CC0000" OnServerValidate="CustomValidator1_ServerValidate">
                                                                                </asp:CustomValidator>--%>
                                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" InitialValue="" ForeColor="#CC0000" ControlToValidate="DDL_PanelType" ErrorMessage="*" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="DDL_SampleType">Sample Type</label>
                                                                    <div class="col-md-8 position-relative">
                                                                            <telerik:RadComboBox RenderMode="Lightweight" ID="DDL_SampleType" runat="server" DropDownHeight="200px" Width="250px"
                                                                                DropDownWidth="250px" CausesValidation="False" SelectedValue='<%# Bind("SampleTypeID")%>'
                                                                                DataValueField="SampleTypeID" DataTextField="SampleTypeName" DataSourceID="SDS_SampleType">
                                                                                <DefaultItem Text="Select a sample type" Value="" />
                                                                            </telerik:RadComboBox>
                                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" Display="Dynamic" class="invalid-tooltip"
                                                                            ControlToValidate="DDL_SampleType" ErrorMessage="Please provide a valid sample type." ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <%--<div class="col-md-1"></div>--%>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="eventRegInput5">Sequence Machine</label>
                                                                    <div class="col-md-8 position-relative">
                                                                        <telerik:RadComboBox RenderMode="Lightweight" ID="DDL_SeqMachine" runat="server" DropDownHeight="200px" Width="250px"
                                                                            DropDownWidth="250px" CausesValidation="False" SelectedValue='<%# Bind("SeqMachineID")%>'
                                                                            DataValueField="SeqMachineID" DataTextField="SeqMachineName" DataSourceID="SDS_SeqMachine">
                                                                            <DefaultItem Text="Select a seq machine" Value="" />
                                                                        </telerik:RadComboBox>
                                                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" Display="Dynamic" class="invalid-tooltip"
                                                                            ControlToValidate="DDL_SeqMachine" ErrorMessage="Please provide a valid sequence machine." ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <%--<div class="col-md-1"></div>--%>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="eventRegInput5">Seq Kit Model</label>
                                                                    <div class="col-md-8 position-relative">
                                                                        <telerik:RadComboBox RenderMode="Lightweight" ID="DDL_SeqKitModel" runat="server" DropDownHeight="200px" Width="250px"
                                                                            DropDownWidth="250px" CausesValidation="False" SelectedValue='<%# Bind("SeqKitModelID")%>'
                                                                            DataValueField="SeqKitModelID" DataTextField="SeqKitModelName" DataSourceID="SDS_SeqKitModel">
                                                                            <DefaultItem Text="Select a kit model" Value="" />
                                                                        </telerik:RadComboBox>
                                                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" Display="Dynamic" class="invalid-tooltip"
                                                                            ControlToValidate="DDL_SeqKitModel" ErrorMessage="Please provide a valid seq kit model" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <%--<div class="col-md-1"></div>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">

                                                            <div class="col-md-4">
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="eventRegInput5">Read Length</label>
                                                                    <div class="col-md-8 position-relative">
                                                                        <telerik:RadTextBox runat="server" ID="Txt_SeqReadLen" InputType="Number" TabIndex="0" Width="250px" placeholder="Sequencing Read Lenght" CssClass="form-control" Text='<%# Bind("SeqTargetReadLen") %>' ValidationGroup="SubmitGroup"></telerik:RadTextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" InitialValue="" ControlToValidate="Txt_SeqReadLen"  class="invalid-tooltip"
                                                                            ErrorMessage="Please provide a valid read length" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                    
                                                                        <%--<div class="col-md-1">
                                                                        </div>--%>

                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-4">
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 label-control" for="eventRegInput5">Sequencing Coverage</label>
                                                                    <div class="col-md-8 position-relative">
                                                                        <telerik:RadTextBox runat="server" ID="Txt_SeqTargetCov" InputType="Number" TabIndex="0" placeholder="Sequencing Coverage" Width="250px" class="form-control" Text='<%# Bind("SeqTargetCov") %>' ValidationGroup="SubmitGroup"></telerik:RadTextBox>
                                                                        <%-- <asp:TextBox ID="Txt_SeqTargetCov" runat="server" TabIndex="0" placeholder="Sequencing Coverage" Width="250px" class="form-control" Text='<%# Bind("SeqTargetCov") %>' ValidationGroup="SubmitGroup">
                                                                        </asp:TextBox>--%>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" InitialValue="" ControlToValidate="Txt_SeqTargetCov"  class="invalid-tooltip"
                                                                            ErrorMessage="Please provide a valid sequencing coverage" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>

                                                                    </div>
                                                                    <%--<div class="col-md-1"></div>--%>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group row">
                                                                    <asp:Label ID="Label12" runat="server" Text="Date of Sequencing" class="col-md-4 label-control" for="projectinput6"></asp:Label>
                                                                    <div class="col-md-8 position-relative">
                                                                        <telerik:RadDatePicker ValidationGroup="SubmitGroup" Width="250px" Height="34px" RenderMode="Lightweight" ID="Txt_SeqDate"
                                                                            DbSelectedDate='<%# Bind("SeqDate") %>' DateFormat="yyyy/MM/dd" DisplayDateFormat="yyyy/MM/dd" MinDate="1900/01/01"
                                                                            runat="server">
                                                                            <DateInput runat="server" DateFormat="yyyy/MM/dd" DisplayDateFormat="yyyy/MM/dd" />
                                                                        </telerik:RadDatePicker>

                                                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator4" runat="server" Display="Dynamic" class="invalid-tooltip"
                                                                            ValidationGroup="SubmitGroup" ControlToValidate="Txt_SeqDate" ErrorMessage="Please provide a valid date." ></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <%--<div class="col-md-1"></div>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <div class="form-group row">
                                                                    <asp:Label runat="server" ID="lbl_DSID" class="col-md-4 label-control" for="DDL_DSID">Dataset</asp:Label>
                                                                    <div class="col-md-7">
                                                                        <telerik:RadComboBox RenderMode="Lightweight" ID="DDL_DSID" runat="server" DropDownHeight="200px" Width="250px"
                                                                            DefaultMessage="Select a dataset" DropDownWidth="250px" CausesValidation="False"
                                                                            DataValueField="DatasetID" DataTextField="DatasetName" DataSourceID="DS_DDL_DSID">
                                                                        </telerik:RadComboBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="form-actions m-0 pt-1 pb-0 center">

                                                            <asp:Button ID="btnUpdate" Text='<%# (Container is GridEditFormInsertItem) ? "Insert" : "Update" %>' class="btn btn-success mr-1 ladda-button btn-sm" data-style="expand-right"
                                                                runat="server"  CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>' ValidationGroup="SubmitGroup"></asp:Button>&nbsp;
                                                                <asp:Button ID="btnCancel" Text="Cancel" runat="server" CausesValidation="False" class="btn btn-danger mr-1 ladda-button btn-sm" data-style="expand-right"
                                                                    CommandName="Cancel"></asp:Button> <%--OnClientClick="return btnUpdate_updated_Validation();"--%>

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
            <telerik:RadWindowManager RenderMode="Lightweight" ID="RadWindowManager1" ShowContentDuringLoad="false" VisibleStatusbar="false"
                ReloadOnShow="true" runat="server" EnableShadow="true" VisibleTitlebar="false" Skin="Windows7">
                <Windows>
                    <telerik:RadWindow RenderMode="Lightweight" ID="RadWindow1" runat="server" BorderStyle="None" BorderWidth="1px" CssClass="px-0 pb-0" OnClientClose="OnClientClose">
                    </telerik:RadWindow>
                </Windows>
            </telerik:RadWindowManager>

            <%--<script src="/assets/js/validate-forms.js"></script>--%>

            <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
                <script type="text/javascript">
                    function callAlert(mssg) 
                    {
                        //get a reference to the radalert object 
                        var oWnd = radalert(mssg);
                        //add a closing function to it 
                        oWnd.add_close(preserve_setting);
                    }
 

                    function AssignIndividual_client() {
                        var grid = $find("<%= RG_Samples.ClientID %>");
                        var masterTable = grid.get_masterTableView();
                        if (masterTable.get_insertItem() != null) {
                            var insertRow = masterTable.get_insertItem();
                            var LocalID = $(insertRow).find("input[id*='Local_ID']").get(0);
                            var hdn_local = document.getElementById("<%= hdn_LocalID.ClientID %>");
                            hdn_local.value = LocalID.value;

                            var HostIDobj = $(insertRow).find("div[id*='DDL_HostID']").get(0);
                            HostID = HostIDobj.value;

                            var SampleID = $(insertRow).find("input[id*='Txt_Sample_ID']").get(0);
                            document.getElementById('<%= hdn_sampleToassign.ClientID%>').value = SampleID.value;

                            if (HostID == 'Local')
                                document.getElementById('<%= hdn_InsertModeHostselected.ClientID%>').value = 1
                            if (HostID == 'Cloud')
                                document.getElementById('<%= hdn_InsertModeHostselected.ClientID%>').value = 2
                            if (HostID == '-1')
                                document.getElementById('<%= hdn_InsertModeHostselected.ClientID%>').value = "";

                        }  //  Edit mode
                        if (grid.get_editItems().length > 0) {
                            var gridCount = masterTable.get_editItems().length;
                            for (var i = 0; i < gridCount; i++) {
                                item = masterTable.get_editItems()[i];
                                var Localobj = $(item.get_editFormItem()).find("input[id*='Local_ID']").get(0);
                                var hdn_local = document.getElementById("<%= hdn_LocalID.ClientID %>");
                                hdn_local.value = Localobj.value;

                                HostIDobj = $(item.get_editFormItem()).find("div[id*='DDL_HostID']").get(0);
                                HostID = HostIDobj.value;

                                var SampleID = $(item.get_editFormItem()).find("input[id*='Txt_Sample_ID']").get(0);
                                document.getElementById('<%= hdn_sampleToassign.ClientID%>').value = SampleID.value;


                                if (HostID == 'Local')
                                    document.getElementById('<%= hdn_InsertModeHostselected.ClientID%>').value = 1
                                if (HostID == 'Cloud')
                                    document.getElementById('<%= hdn_InsertModeHostselected.ClientID%>').value = 2
                                if (HostID == '-1')
                                    document.getElementById('<%= hdn_InsertModeHostselected.ClientID%>').value = "";

                            }
                        }
                    }

                    <%--function btnUpdate_updated_Validation() {
                        var grid = $find("<%= RG_Samples.ClientID %>");
                        var masterTable = grid.get_masterTableView();
                        

                        //  Edit mode
                        if (grid.get_editItems().length > 0) {

                            var gridCount = masterTable.get_editItems().length;
                            for (var i = 0; i < gridCount; i++) {
                                var validation = $(item.get_editFormItem()).find("input[id*='hdn_validation']").get(0);
                               
                                item = masterTable.get_editItems()[i];

                                var DDL_SampleType = $(item.get_editFormItem()).find("input[id*='DDL_SampleType']").get(0);
                                if (DDL_SampleType.value == "") {
                                    $(Txt_SeqReadLen).css({ "pointer-events": "auto", "border-color": "#dc3545" }).attr("tabindex", "1");
                                    var element = $(item.get_editFormItem()).find("[id*='invalidSampleType']").get(0);
                                    element.classList.add("displayBlk");
                                    validation.value = "Invalid";
                                    return false;
                                }
                                else {
                                    validation.value = "Valid";
                                    return true;
                                }

                                var Txt_SeqReadLen = $(item.get_editFormItem()).find("input[id*='Txt_SeqReadLen']").get(0);
                                if (Txt_SeqReadLen.value == "") {
                                    $(Txt_SeqReadLen).css({ "pointer-events": "auto", "border-color": "#dc3545" }).attr("tabindex", "1");
                                    var element = $(item.get_editFormItem()).find("[id*='invalidRL']").get(0);
                                    element.classList.add("displayBlk");
                                    validation.value ="Invalid";
                                    return false;
                                }
                                else {
                                    validation.value = "Valid";
                                    return true;
                                }

                            }
                        }

                    }--%>

                    function DeleteAssigned_Individual() {
                        var grid = $find("<%= RG_Samples.ClientID %>");
                        var masterTable = grid.get_masterTableView();
                        if (grid.get_editItems().length > 0) {
                            var gridCount = masterTable.get_editItems().length;
                            for (var i = 0; i < gridCount; i++) {
                                item = masterTable.get_editItems()[i];
                                var IndividualID = $(item.get_editFormItem()).find("input[id*='txt_IndividualID']").get(0);
                                IndividualID.value = "";

                              
                            }



                        
                        }
                        //insert mode
                        if (masterTable.get_insertItem() != null) {
                            var insertRow = masterTable.get_insertItem();
                            var Individual_ID = $(insertRow).find("input[id*='txt_IndividualID']").get(0);
                            Individual_ID.value = "";
                        }
                    }


                    function OpenWinIndividualForSample() {
                        var oWnd = radopen("IndividualForSample.aspx", "RadWindow1");
                        oWnd.set_height(500);
                        oWnd.set_width(1000);
                        oWnd.center();
                        oWnd.set_modal(true);
                    }


                    function preserve_setting() {

                        var grid = $find("<%= RG_Samples.ClientID %>");
                        var masterTable = grid.get_masterTableView();
                        //  Edit mode preserve setting after popup
                        var gridCount = masterTable.get_editItems().length;
                        for (var i = 0; i < gridCount; i++) {
                            item = masterTable.get_editItems()[i];
                            if (grid.get_editItems().length > 0) {
                                var seqType_Obj = $(item.get_editFormItem()).find("div[id*='DDL_SeqType']").get(0);
                                var panelType_Obj = $(item.get_editFormItem()).find("div[id*='DDL_PanelType']").get(0);
                                console.log(seqType_Obj.value)
                                if (seqType_Obj.value == 'WGS' || seqType_Obj.value == 'WES') {

                                    $(panelType_Obj).css({ "pointer-events": "none", "opacity": "0.7" }).attr("tabindex", "-1");
                                }
                                if (seqType_Obj.value == 'Panel') {
                                    $(panelType_Obj).removeAttr("style");
                                    $(panelType_Obj).css({ "pointer-events": "auto", "opacity": "1" }).attr("tabindex", "1");

                                }
                            }
                        }



                        //insert mode preserve setting after popup
                        if (masterTable.get_insertItem() != null) {
                          
                                var insertRow = masterTable.get_insertItem();
                                /// to keep the state
                                seqType_Obj = $(insertRow).find("div[id*='DDL_SeqType']").get(0);
                                panelType_Obj = $(insertRow).find("div[id*='DDL_PanelType']").get(0);
                                seqType = seqType_Obj.value;

                                if (seqType == 'WGS' || seqType == 'WES') {
                                    var tt = panelType_Obj.getElementsByTagName('input');
                                    tt[0].value = "";
                                    $(panelType_Obj).css({ "pointer-events": "none", "opacity": "0.7" }).attr("tabindex", "-1");
                                }
                           
                        }

                    }


                    function OnClientClose(oWnd, args) {
                        var arg = args.get_argument();
                        var grid = $find("<%= RG_Samples.ClientID %>");
                        var masterTable = grid.get_masterTableView();
                        if (arg != 0) {
                          
                            //  Edit mode
                            if (grid.get_editItems().length > 0)
                            {
                                if (arg) {

                                    var gridCount = masterTable.get_editItems().length;
                                    for (var i = 0; i < gridCount; i++) {
                                        item = masterTable.get_editItems()[i];
                                        Individual_ID = $(item.get_editFormItem()).find("input[id*='txt_IndividualID']").get(0);
                                        Individual_ID.value = arg;

                                    }

                                   
                                }

                            

                            }

                            //insert mode
                            if (masterTable.get_insertItem() != null)
                            {
                                if (arg) {
                                    var insertRow = masterTable.get_insertItem();
                                    var Individual_ID = $(insertRow).find("input[id*='txt_IndividualID']").get(0);
                                    Individual_ID.value = arg;
                                    /// to keep the state
                                    seqType_Obj = $(insertRow).find("div[id*='DDL_SeqType']").get(0);
                                    panelType_Obj = $(insertRow).find("div[id*='DDL_PanelType']").get(0);
                                    seqType = seqType_Obj.value;

                                    if (seqType == 'WGS' || seqType == 'WES') {
                                        var tt = panelType_Obj.getElementsByTagName('input');
                                        tt[0].value = "";
                                        $(panelType_Obj).css({ "pointer-events": "none", "opacity": "0.7" }).attr("tabindex", "-1");
                                    }
                                }
                            }
                        }

                        preserve_setting();
                       
                    }


                    function SeqType_IndexChanged(sender, args) {
                        var seqType_Obj;
                        var seqType;
                        var grid = $find("<%= RG_Samples.ClientID %>");
                        var masterTable = grid.get_masterTableView();
                        //  insert mode
                        if (masterTable.get_insertItem() != null) {
                            var insertRow = masterTable.get_insertItem();

                            seqType_Obj = $(insertRow).find("div[id*='DDL_SeqType']").get(0);
                            panelType_Obj = $(insertRow).find("div[id*='DDL_PanelType']").get(0);
                            seqType = seqType_Obj.value;
                            if (seqType == 'WGS' || seqType == 'WES') {

                                var tt = panelType_Obj.getElementsByTagName('span');
                                tt[0].value = "";
                                $(panelType_Obj).css({ "pointer-events": "none", "opacity": "0.7" }).attr("tabindex", "-1");
                            }
                            if (seqType == 'Panel') {
                                $(panelType_Obj).removeAttr("style");
                            }
                        }

                        if (grid.get_editItems().length > 0) {

                            var gridCount = masterTable.get_editItems().length;
                            for (var i = 0; i < gridCount; i++) {
                                item = masterTable.get_editItems()[i];
                                Individual_ID = $(item.get_editFormItem()).find("input[id*='hdn_count']").get(0);
                                var seqType_Obj = $(item.get_editFormItem()).find("div[id*='DDL_SeqType']").get(0);
                                var panelType_Obj = $(item.get_editFormItem()).find("div[id*='DDL_PanelType']").get(0);
                                if (Individual_ID.value == '0') {

                                    if (seqType_Obj.value == 'WGS' || seqType_Obj.value == 'WES') {

                                        $(panelType_Obj).css({ "pointer-events": "none", "opacity": "0.7" }).attr("tabindex", "-1");
                                    }
                                    if (seqType_Obj.value == 'Panel') {
                                        $(panelType_Obj).removeAttr("style");
                                        $(panelType_Obj).css({ "pointer-events": "auto", "opacity": "1" }).attr("tabindex", "1");

                                    }

                                }

                                //count = $(item.get_editFormItem()).find("input[id*='hdn_count']").get(0);
                                //seqType_Obj = $(insertRow).find("div[id*='DDL_SeqType']").get(0);
                                //panelType_Obj = $(insertRow).find("div[id*='DDL_PanelType']").get(0);
                                //if (count.value == '0' && seqType_Obj.value != 'Panel') {
                                //    console.log("ssssss")
                                //    $(panelType_Obj).removeAttr("style");
                                //}
                            }

                        }
                    }

                </script>
            </telerik:RadScriptBlock>


            <asp:SqlDataSource ID="DS_DDL_DSID" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_DataSet_ForDefineSample_Sel" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
                    <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterID" Type="Int32" />

                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="DS_searchSample" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                SelectCommand="Sp_Samples_Search_ToDefine" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
                    <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DS_Samples" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
                SelectCommand="Sp_Samples_Sel_ToDefine"
                DeleteCommand="Sp_Sample_Del"
                UpdateCommand="Sp_Sample_Upd"
                UpdateCommandType="StoredProcedure"
                DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="SampleID" Type="Int64" />
                </DeleteParameters>

                <SelectParameters>
                    <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
                    <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                    <asp:ControlParameter ControlID="hdn_searchSampleID" Name="SampleID" Type="Int64" DefaultValue="-1" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
                    <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
                    <asp:Parameter Name="IndividualID" Type="Int64" />
                    <asp:Parameter Name="LocalID" Type="string" />
                    <asp:Parameter Name="SampleTypeID" Type="Int32" />
                    <asp:Parameter Name="SeqTypeID" Type="Int32" />
                    <asp:Parameter Name="SeqMachineID" Type="Int32" />
                    <asp:Parameter Name="SeqTargetCov" Type="Int32" />
                    <asp:Parameter Name="SeqKitModelID" Type="Int32" />
                    <asp:Parameter Name="SeqTargetReadLen" Type="Int32" />
                    <asp:Parameter Name="SampleID" Type="Int64" />
                    <asp:Parameter Name="SeqDate" Type="string" />
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SDS_SampleType" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_SampleType_Sel" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SDS_SeqType" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_SeqType_Sel" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SDS_SeqKitModel" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_SeqKitModel_Sel" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SDS_SeqMachine" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_SeqMachine_Sel" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SDS_PanelType" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_PanelType_Sel" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

            <asp:SqlDataSource ID="DS_Dataset" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_DataSet_ForDefineSample_Sel" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
                    <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
                    <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DS_DDL_HID" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_Center_Hosts_Sel" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>


        </div>
    </section>
</div>



