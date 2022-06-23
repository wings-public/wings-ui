<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_FamilyHealthHistory.ascx.cs" Inherits="WebGAP.PhenBook.uc.uc_FamilyHealthHistory" %>
<link href="../../assets/css/Family_HH_style.css" rel="stylesheet" type="text/css" media="screen" runat="server" />
<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_FamilyMemeber">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_FamilyMemeber" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="hdnForDDL_Color" />
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="btn_FamilyGrid">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btn_FamilyGrid" />
                <telerik:AjaxUpdatedControl ControlID="RG_FamilyMemeber" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RadWindowManager1">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadWindowManager1" />
                <telerik:AjaxUpdatedControl ControlID="RG_FamilyMemeber" />
                <telerik:AjaxUpdatedControl ControlID="hdn_ProbandGender" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RBtn_DrawPedigree">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RBtn_DrawPedigree" />
                <telerik:AjaxUpdatedControl ControlID="Txt_PVal" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>



        <telerik:AjaxSetting AjaxControlID="txt_IndividualID">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="txt_IndividualID" />
                <telerik:AjaxUpdatedControl ControlID="hdn_Status_Individual" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="hdn_Status_Individual">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="hdn_Status_Individual" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="btn_Delete_Al">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_FamilyMemeber" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="btn_Delete_Al" />
                <telerik:AjaxUpdatedControl ControlID="myDiagramDiv" />
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="btn_insert_Proband">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btn_insert_Proband" />
                <telerik:AjaxUpdatedControl ControlID="RG_FamilyMemeber" />
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="btn_insert_Proband">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btn_insert_Proband" />
                <telerik:AjaxUpdatedControl ControlID="txt_IndivdualID" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="imgbtn_Delete">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="imgbtn_Delete" />
                <telerik:AjaxUpdatedControl ControlID="RG_FamilyMemeber" />
                <telerik:AjaxUpdatedControl ControlID="DDL_Status" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
         <telerik:AjaxSetting AjaxControlID="btn_AssignIndividual">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btn_AssignIndividual" />
            </UpdatedControls>
        </telerik:AjaxSetting>
         <telerik:AjaxSetting AjaxControlID="btn_Assign_Individual">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btn_Assign_Individual" />
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
</div>
<body onload="init()">
    <div class="content-body pt-1">
        <section id="basic-form-layouts">
            <div class="row match-height">
                <script type="text/javascript" id="telerikClientEvents1">
                    function OnColumnMouseOut(sender, args) {
                    }
                </script>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-content collapse show">
                            <div class="card-body">
                                <div class="form">
                                    <div class="form-body">
                                        <h4 class="form-section">
                                            <img src="../../img/icon/icon_Family.png" width="50" height="50" class="mr-1" />Family</h4>


                                        <div class="form-group row">
                                            <div style="border-color: gainsboro; display: flex; flex-direction: row; justify-content: flex-start;">
                                               
                                                <div class="pr-0">
                                                    <telerik:RadTextBox runat="server" ID="txt_IndivdualID" Width="100%" CssClass="txtbox_indv" OnLoad="txt_IndivdualID_Load" Enabled="false" ></telerik:RadTextBox>
                                                </div>
                                                <div class="pr-1">
                                                <asp:Button ID="btn_AssignIndividual" runat="server" CssClass="btn" style="padding-top:6px;margin-left:0px;background-image:url('../../img/icon/icon_Add_16.png'); background-repeat: no-repeat; background-size: 20px 20px; background-color: #617FA6; border-color: #636b72; padding-left:25px" Text="Assign Proband"   Width="135px" Height="34px" Enabled="false"  OnClick="btn_AssignIndividual_Click" />
                                                 
                                                </div>
                                                <div class="pr-1">
                                                    <button id="btn_AddFamilyMembers" runat="server" onclick="OpenWinAddFamilyMembers(); return false;" class="btn ladda-button btn-secondary btn-sm" style="height: 34px; background-color: #617FA6; border-color: #636b72;" disabled>
                                                        Add Family Members
                                                    </button>
                                                   </div>
                                                <telerik:RadButton ID="RBtn_DrawPedigree" runat="server" Text="Draw pedigree" AutoPostBack="true" OnClick="RBtn_DrawPedigree_Click">
                                                </telerik:RadButton>
                                            </div>
                                        </div>
                                        <asp:HiddenField runat="server" ID="hdn_StatusIndividual_EditTemplate" />
                                        <asp:HiddenField runat="server" ID="hdn_GenderIndividual_EditTemplate" />
                                        <asp:HiddenField runat="server" ID="hdn_BdateIndividual_EditTemplate" />

                                        <telerik:RadGrid RenderMode="Lightweight" ID="RG_FamilyMemeber" runat="server" AllowAutomaticDeletes="True" CssClass="Noborder_Clip"
                                            Font-Size="Small" Width="100%" GridLines="Both" OnItemCommand="RG_FamilyMemeber_ItemCommand" OnPreRender="RG_FamilyMemeber_PreRender"
                                            AllowAutomaticInserts="True" DataKeyNames="FamilyMemberTypeID,FamilyID,Node_Key,IndividualID" CellSpacing="-1" ShowStatusBar="True" AllowPaging="True" Height="710px" OnItemDataBound="RG_FamilyMemeber_ItemDataBound" OnUpdateCommand="RG_FamilyMemeber_UpdateCommand" DataSourceID="DS_RG_FamilyMember">
                                            <PagerStyle Mode="NextPrevAndNumeric" />
                                            <ItemStyle Height="25px" CssClass="pt-0 pb-0" />
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                            <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="Top" ClientDataKeyNames="FamilyMemberTypeID,FamilyID,Node_Key,RelativeGender" DataSourceID="DS_RG_FamilyMember">

                                                <GroupByExpressions>
                                                    <telerik:GridGroupByExpression>
                                                        <SelectFields>
                                                            <telerik:GridGroupByField FieldName="Family_Side" FormatString="{0:D}"></telerik:GridGroupByField>
                                                        </SelectFields>
                                                        <GroupByFields>
                                                            <telerik:GridGroupByField FieldName="Family_Side" SortOrder="Ascending"></telerik:GridGroupByField>
                                                        </GroupByFields>
                                                    </telerik:GridGroupByExpression>
                                                </GroupByExpressions>
                                                <CommandItemTemplate>

                                              <%--  <telerik:RadButton ID="btn_Delete_Al" runat="server" Text="Delete All" AutoPostBack="true"
                                                        Width="120px" Style="top: 0px; left: 0px; margin-bottom: 2px; font-size-adjust: inherit" CommandName="DeleteAllMembers">
                                                    </telerik:RadButton>--%>
                                                </CommandItemTemplate>
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="RelativeName" FilterControlAltText="Filter RelativeName column" HeaderText="Relative Name" SortExpression="RelativeName" UniqueName="RelativeName">
                                                        <HeaderStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="FamilyID" Visible="false">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="IndividualID" DataType="System.Int64" FilterControlAltText="Filter IndividualID column" HeaderText="Individual ID" SortExpression="IndividualID" UniqueName="IndividualID">
                                                        <HeaderStyle Width="30%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle Width="30%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="LocalID" DataType="System.Int64" FilterControlAltText="Filter LocalID column" HeaderText="Local ID" SortExpression="LocalID" UniqueName="LocalID">
                                                        <HeaderStyle Width="30%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle Width="30%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="FamilyMemberTypeName" FilterControlAltText="Filter FamilyMemberTypeName column" HeaderText="Relation To Proband" SortExpression="FamilyMemberTypeName" UniqueName="FamilyMemberTypeName">
                                                        <HeaderStyle Width="30%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle Width="30%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                    </telerik:GridBoundColumn>
                                                  <%--  <telerik:GridBoundColumn DataField="Age" DataType="System.Int32" FilterControlAltText="Filter Age column" HeaderText="Age" SortExpression="Age" UniqueName="Age">
                                                        <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                    </telerik:GridBoundColumn>--%>
                                                    <telerik:GridTemplateColumn DataType="System.int32" DataField="RelativeGender" UniqueName="RelativeGender" Groupable="False" EnableHeaderContextMenu="false"
                                                        HeaderText="Gender" FilterControlAltText="Filter RelativeGender column">
                                                        <HeaderStyle Width="70px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle Width="70px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:HiddenField runat="server" ID="hdn_Gender" Value='<%# Bind("RelativeGender") %>' />
                                                            <asp:ImageButton ID="Genderbtn" BorderWidth="0px" Width="30px" runat="server" Enabled="false" CssClass="ImgBtn_DisablePointer"></asp:ImageButton>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn DataField="RelativeStatus" FilterControlAltText="Filter RelativeStatus column" EnableHeaderContextMenu="false"
                                                        HeaderText="Status" SortExpression="RelativeStatus" UniqueName="RelativeStatus" ReadOnly="true">
                                                        <HeaderStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:HiddenField runat="server" ID="hdn_Status" Value='<%# Eval("RelativeStatus") %>' />
                                                            <asp:ImageButton ID="Statusbtn" BorderWidth="0px" Width="30px" runat="server" Enabled="false" CssClass="ImgBtn_DisablePointer"></asp:ImageButton>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridEditCommandColumn UniqueName="EditCommandColumn" ButtonType="ImageButton"
                                                        EditImageUrl="~/img/icon/icon_edit.png" EnableHeaderContextMenu="false">
                                                        <HeaderStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                    </telerik:GridEditCommandColumn>
                                                    <telerik:GridTemplateColumn UniqueName="Delete_FamilyMember" EnableHeaderContextMenu="false">
                                                        <HeaderStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="Delete_FamilyMember" BorderWidth="0px" Width="30px" runat="server" CommandName="Delete_FamilyMember" ImageUrl="~/img/icon/icon_delete_min.png" OnClientClick="return confirm('Are you sure you want to delete?')"></asp:ImageButton>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn DataType="System.int32" DataField="proband_Haschild" UniqueName="proband_Haschild">
                                                        <ItemTemplate>
                                                            <asp:HiddenField runat="server" ID="hdn_proband_Haschild" Value='<%# Bind("proband_Haschild") %>' />
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                              <%--  <telerik:GridTemplateColumn DataType="System.int32" DataField="proband_Hasspouse" UniqueName="proband_Hasspouse">
                                                        <ItemTemplate>
                                                            <asp:HiddenField runat="server" ID="hdn_proband_Hasspouse" Value='<%# Bind("proband_Hasspouse") %>' />
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>--%>

                                                    <telerik:GridBoundColumn DataField="Family_Side" Visible="false">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="IndividualBirthDate" Visible="false">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="FamilyMemberTypeID" Visible="false">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Disease_TL" Visible="false">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Code_TL" Visible="false">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Disease_TR" Visible="false">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Code_TR" Visible="false">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Disease_BL" Visible="false">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Code_BL" Visible="false">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Disease_BR" Visible="false">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Code_BR" Visible="false">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Node_Key" Visible="false">
                                                    </telerik:GridBoundColumn>

                                                </Columns>
                                                <EditFormSettings EditFormType="Template">
                                                    <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
                                                    <FormTemplate>

                                                        <form class="form">
                                                            <div class="form-body">
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                              <asp:Label runat="server" ID="lbl_RelativeName">Name</asp:Label>
                                                                            <telerik:RadTextBox runat="server" class="form-control" ID="Txt_RelativeName" Text='<%# Bind("RelativeName") %>'></telerik:RadTextBox>
                                                                            <asp:HiddenField ID="hdn_FamilyMembrType" runat="server" Value='<%# Bind("FamilyMemberTypeID")%>'></asp:HiddenField>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="form-group width70">
                                                                            <asp:Label runat="server" ID="lbl_RelativeID" >Relative ID</asp:Label>
                                                                            <telerik:RadTextBox runat="server" CssClass="width65 float-left" class="form-control" ID="txt_IndividualID" Text='<%# Bind("IndividualID") %>'></telerik:RadTextBox>
                                                                            <asp:ImageButton runat="server"  Width="15%" ID="btn_Assign_Individual" class="float-left" OnCommand="btn_AssignIndividual_Command" CommandArgument="1" ImageUrl="~/img/icon/icon_Add_Individual_16.png" ToolTip="Add Individual" />
                                                                            <asp:ImageButton ID="imgbtn_Delete" Width="15%" class="float-right" CommandName="DeleteAssigned_RelativeID" runat="server" BorderWidth="0px" ImageUrl="~/img/icon/icon_del-trash.gif" ToolTip="Delete Assigned Individual" />
                                                                            
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                            <asp:Label ID="lbl_Gender" runat="server" Text="Gender" for="projectinput4"></asp:Label>
                                                                            <telerik:RadDropDownList ValidationGroup="SubmitGroup" class="form-control" ID="DDL_Gender" Width="100%" runat="server"  DataSourceID="Sql_Relative_DDL_Gender" DataTextField="txt_RelativeGender" DataValueField="val_RelativeGender"
                                                                                SelectedValue='<%# Bind("RelativeGender")%>' AppendDataBoundItems="True" Enabled="false">
                                                                                <Items>
                                                                                    <telerik:DropDownListItem Value="" Text="select one" />
                                                                                </Items>
                                                                            </telerik:RadDropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                            <asp:Label ID="lbl_Status" runat="server" Text="Status" class="label-control" for="projectinput5" Style="width: 80px;"></asp:Label>
                                                                            <telerik:RadDropDownList ValidationGroup="SubmitGroup" class="form-control" ID="DDL_Status" runat="server" Width="200px" DataSourceID="Sql_Relative_DDL_Status" DataTextField="txt_RelativeStatus" DataValueField="val_RelativeStatus"
                                                                                SelectedValue='<%# Bind("RelativeStatus")%>' AppendDataBoundItems="True">
                                                                                <Items>
                                                                                    <telerik:DropDownListItem Value="" Text="select one" />
                                                                                </Items>

                                                                            </telerik:RadDropDownList>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                        <asp:Label ID="lbl_BD" runat="server" Text="Date of Birth" class="label-control" for="projectinput6" Style="width: 80px;"></asp:Label>

                                                                        <telerik:RadDatePicker DateInput-EmptyMessage="" ValidationGroup="SubmitGroup" class="form-control" RenderMode="Lightweight" ID="Txt_Bdate" Height="34px" Width="100%"
                                                                            DbSelectedDate='<%# Bind("RelativeBirthDate") %>' DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" MinDate="1/1/1500"
                                                                            runat="server">
                                                                            <DateInput runat="server" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" />
                                                                        </telerik:RadDatePicker>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                            <div class="form-group">
                                                                                    <asp:Label ID="lbl_Disease" runat="server" Text="Disease" class="label-control" for="projectinput3"></asp:Label>
                                                                                <div >
                                                                                    <div style="border-color: gainsboro; display: flex; flex-direction: row; justify-content: flex-start; padding-bottom: 0.25rem">
                                                                                        <div style="padding-right: 0.25rem">
                                                                                            <telerik:RadTextBox runat="server" class="form-control" ID="Disease_Desc_TL" Text='<%# Bind("Disease_TL") %>' Width="150px"></telerik:RadTextBox>
                                                                                        </div>
                                                                                        <div style="padding-right: 0.25rem">

                                                                                            <img src="~/img/icon/icon_TL.png" runat="server" title="Top Left" />
                                                                                        </div>
                                                                                        <div style="padding-right: 0.25rem">
                                                                                        <div class="CarCustomizer">

                                                                                               <telerik:RadColorPicker RenderMode="Lightweight" Skin="Default" runat="server" ID="RCP_TL" ShowEmptyColor="true" OnDataBinding="RCP_TL_DataBinding"
                                                                                                    Columns="5" ShowIcon="true" CurrentColorText='<%# Bind("Hex_TL") %>' Preset="None">

                                                                                                    <telerik:ColorPickerItem Title="Orange" Value="#ffa500"></telerik:ColorPickerItem>
                                                                                                    <telerik:ColorPickerItem Title="Cyan" Value="#00ffff"></telerik:ColorPickerItem>
                                                                                                    <telerik:ColorPickerItem Title="Gold" Value="#ffd700"></telerik:ColorPickerItem>
                                                                                                    <telerik:ColorPickerItem Title="Pink" Value="#ffc0cb"></telerik:ColorPickerItem>
                                                                                                    <telerik:ColorPickerItem Title="Blue" Value="#0000ff"></telerik:ColorPickerItem>
                                                                                                    <telerik:ColorPickerItem Title="Brown" Value="#a52a2a"></telerik:ColorPickerItem>
                                                                                                    <telerik:ColorPickerItem Title="Burple" Value="#800080"></telerik:ColorPickerItem>
                                                                                                    <telerik:ColorPickerItem Title="Chartreuse" Value="#7fff00"></telerik:ColorPickerItem>
                                                                                                    <telerik:ColorPickerItem Title="Magenta" Value="#ff00ff"></telerik:ColorPickerItem>
                                                                                                    <telerik:ColorPickerItem Title="Green" Value="#339933"></telerik:ColorPickerItem>
                                                                                                </telerik:RadColorPicker>

                                                                                            </div>

                                                                                        </div>
                                                                                    </div>
                                                                                    <div style="border-color: gainsboro; display: flex; flex-direction: row; justify-content: flex-start; padding-bottom: 0.25rem">
                                                                                        <div style="padding-right: 0.25rem">
                                                                                            <telerik:RadTextBox runat="server" ID="Disease_Desc_TR" Text='<%# Bind("Disease_TR") %>' Width="150px"></telerik:RadTextBox>
                                                                                        </div>
                                                                                        <div style="padding-right: 0.25rem">
                                                                                            <img src="~/img/icon/icon_TR.png" runat="server" title="Top Right" />
                                                                                        </div>
                                                                                        <div style="padding-right: 0.25rem">
                                                                                           <telerik:RadColorPicker RenderMode="Lightweight" Skin="Default" runat="server" ID="RCP_TR" ShowEmptyColor="true" OnDataBinding="RCP_TR_DataBinding"
                                                                                                Columns="5" ShowIcon="true" CurrentColorText='<%# Bind("Hex_TR") %>' Preset="None">

                                                                                                <telerik:ColorPickerItem Title="Orange" Value="#ffa500"></telerik:ColorPickerItem>
                                                                                                <telerik:ColorPickerItem Title="Cyan" Value="#00ffff"></telerik:ColorPickerItem>
                                                                                                <telerik:ColorPickerItem Title="Gold" Value="#ffd700"></telerik:ColorPickerItem>
                                                                                                <telerik:ColorPickerItem Title="Pink" Value="#ffc0cb"></telerik:ColorPickerItem>
                                                                                                <telerik:ColorPickerItem Title="Blue" Value="#0000ff"></telerik:ColorPickerItem>
                                                                                                <telerik:ColorPickerItem Title="Brown" Value="#a52a2a"></telerik:ColorPickerItem>
                                                                                                <telerik:ColorPickerItem Title="Purple" Value="#800080"></telerik:ColorPickerItem>
                                                                                                <telerik:ColorPickerItem Title="Chartreuse" Value="#7fff00"></telerik:ColorPickerItem>
                                                                                                <telerik:ColorPickerItem Title="Magenta" Value="#ff00ff"></telerik:ColorPickerItem>
                                                                                                <telerik:ColorPickerItem Title="Green" Value="#339933"></telerik:ColorPickerItem>
                                                                                            </telerik:RadColorPicker>

                                                                                        </div>
                                                                                    </div>
                                                                                    <div style="border-color: gainsboro; display: flex; flex-direction: row; justify-content: flex-start; padding-bottom: 0.25rem">
                                                                                        <div style="padding-right: 0.25rem">
                                                                                            <telerik:RadTextBox runat="server" ID="Disease_Desc_BL" Text='<%# Bind("Disease_BL") %>' Width="150px"></telerik:RadTextBox>
                                                                                        </div>
                                                                                        <div style="padding-right: 0.25rem">
                                                                                            <img src="~/img/icon/icon_BL.png" runat="server" title="Bottom Left" />
                                                                                        </div>
                                                                                        <div style="padding-right: 0.25rem">

                                                                                            <telerik:RadColorPicker RenderMode="Lightweight" Skin="Default" runat="server" ID="RCP_BL" ShowEmptyColor="true" OnDataBinding="RCP_BL_DataBinding"
                                                                                                Columns="5" ShowIcon="true" CurrentColorText='<%# Bind("Hex_BL") %>' Preset="None">

                                                                                                <telerik:ColorPickerItem Title="Orange" Value="#ffa500"></telerik:ColorPickerItem>
                                                                                                <telerik:ColorPickerItem Title="Cyan" Value="#00ffff"></telerik:ColorPickerItem>
                                                                                                <telerik:ColorPickerItem Title="Gold" Value="#ffd700"></telerik:ColorPickerItem>
                                                                                                <telerik:ColorPickerItem Title="Pink" Value="#ffc0cb"></telerik:ColorPickerItem>
                                                                                                <telerik:ColorPickerItem Title="Blue" Value="#0000ff"></telerik:ColorPickerItem>
                                                                                                <telerik:ColorPickerItem Title="Brown" Value="#a52a2a"></telerik:ColorPickerItem>
                                                                                                <telerik:ColorPickerItem Title="Purple" Value="#800080"></telerik:ColorPickerItem>
                                                                                                <telerik:ColorPickerItem Title="Chartreuse" Value="#7fff00"></telerik:ColorPickerItem>
                                                                                                <telerik:ColorPickerItem Title="Magenta" Value="#ff00ff"></telerik:ColorPickerItem>
                                                                                                <telerik:ColorPickerItem Title="Green" Value="#339933"></telerik:ColorPickerItem>
                                                                                            </telerik:RadColorPicker>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div style="border-color: gainsboro; display: flex; flex-direction: row; justify-content: flex-start; padding-bottom: 0.25rem">
                                                                                        <div style="padding-right: 0.25rem">
                                                                                            <telerik:RadTextBox runat="server" ID="Disease_Desc_BR" Text='<%# Bind("Disease_BR") %>' Width="150px"></telerik:RadTextBox>
                                                                                        </div>
                                                                                        <div style="padding-right: 0.25rem">
                                                                                            <img src="~/img/icon/icon_BR.png" runat="server" title="Bottom Right" />
                                                                                        </div>
                                                                                        <div style="padding-right: 0.25rem">
                                                                                         <telerik:RadColorPicker RenderMode="Lightweight" Skin="Default" runat="server" ID="RCP_BR" ShowEmptyColor="true" OnDataBinding="RCP_BR_DataBinding"
                                                                                                Columns="5" ShowIcon="true" CurrentColorText='<%# Bind("Hex_BR") %>' Preset="None">

                                                                                                <telerik:ColorPickerItem Title="Orange" Value="#ffa500"></telerik:ColorPickerItem>
                                                                                                <telerik:ColorPickerItem Title="Cyan" Value="#00ffff"></telerik:ColorPickerItem>
                                                                                                <telerik:ColorPickerItem Title="Gold" Value="#ffd700"></telerik:ColorPickerItem>
                                                                                                <telerik:ColorPickerItem Title="Pink" Value="#ffc0cb"></telerik:ColorPickerItem>
                                                                                                <telerik:ColorPickerItem Title="Blue" Value="#0000ff"></telerik:ColorPickerItem>
                                                                                                <telerik:ColorPickerItem Title="Brown" Value="#a52a2a"></telerik:ColorPickerItem>
                                                                                                <telerik:ColorPickerItem Title="Purple" Value="#800080"></telerik:ColorPickerItem>
                                                                                                <telerik:ColorPickerItem Title="Chartreuse" Value="#7fff00"></telerik:ColorPickerItem>
                                                                                                <telerik:ColorPickerItem Title="Magenta" Value="#ff00ff"></telerik:ColorPickerItem>
                                                                                                <telerik:ColorPickerItem Title="Green" Value="#339933"></telerik:ColorPickerItem>
                                                                                            </telerik:RadColorPicker>
                                                                                        </div>
                                                                                    </div>


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
                                                                    CommandName="Cancel"></asp:Button>
                                                            </div>
                                                        </form>
                                                    </FormTemplate>
                                                    <PopUpSettings KeepInScreenBounds="True"></PopUpSettings>
                                                </EditFormSettings>

                                            </MasterTableView>
                                            <ClientSettings>
                                                <Scrolling AllowScroll="true" UseStaticHeaders="True" />
                                            </ClientSettings>

                                            <FilterMenu RenderMode="Lightweight"></FilterMenu>

                                            <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                                        </telerik:RadGrid>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">

                        <asp:HiddenField ID="hdn_ProbandGender" runat="server" />
                        <asp:HiddenField ID="hdn_ProbandID" runat="server" />
                        <asp:HiddenField ID="hdn_ProbandStatus" runat="server" />
                        <asp:HiddenField ID="hdn_ProbandBDate" runat="server" />
                        <asp:HiddenField ID="hdn_ProbandName" runat="server" />
                        <asp:HiddenField ID="Txt_PVal" runat="server" />
                        <script src="../../assets/js/go.js"></script>
                        <div class="card-content collapse show">
                            <div class="card-body">
                                <div class="form">
                                    <h4 class="form-section">
                                        <img src="../../img/icon/icon_Pedigree_Header.png" width="50" height="50" class="mr-1" />Pedigree</h4>
                                    <asp:Label runat="server" ID="lbl_Feedback" Visible="true" ForeColor="Gray" Font-Size="Medium" CssClass="lbl_FeedBack" Text="No Pedigree to Display"></asp:Label>
                                    <div id="myDiagramDiv" style="border: solid 0px; width: 700px; height: 700px;">
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>
    </div>

</body>

<asp:HiddenField runat="server" ID="hdn_Num_Brothers" />
<asp:HiddenField runat="server" ID="hdn_Num_Sisters" />
<asp:HiddenField runat="server" ID="hdn_Num_Sons" />
<asp:HiddenField runat="server" ID="hdn_Num_Daughters" />
<asp:HiddenField runat="server" ID="hdn_Num_MUncles" />
<asp:HiddenField runat="server" ID="hdn_Num_MAunts" />
<asp:HiddenField runat="server" ID="hdn_Num_FUncles" />
<asp:HiddenField runat="server" ID="hdn_Num_FAunts" />
<asp:HiddenField runat="server" ID="hdn_Has_Spouse" />

<asp:Button runat="server" ID="btn_FamilyGrid" Text="" Style="display: none;" OnClick="btn_FamilyGrid_Click" />

<asp:Button runat="server" ID="btn_insert_Proband" Text="" Style="display: none;" OnClick="btn_insert_Proband_Click" />

<telerik:RadWindowManager RenderMode="Lightweight" ID="RadWindowManager1" ShowContentDuringLoad="false" VisibleStatusbar="false"
    ReloadOnShow="true" runat="server" EnableShadow="true" VisibleTitlebar="false" Skin="Windows7">
    <Windows>
        <telerik:RadWindow RenderMode="Lightweight" ID="RadWindow1" runat="server" BorderStyle="None" BorderWidth="1px" CssClass="px-0 pb-0" OnClientClose="OnClientClose">
        </telerik:RadWindow>
        <telerik:RadWindow RenderMode="Lightweight" ID="RDW_FamilyMembers" runat="server" BorderStyle="None" BorderWidth="1px" CssClass="px-0 pb-0" OnClientClose="OnClientAddFamilyMemberClose" Height="605" Width="750">
        </telerik:RadWindow>
    </Windows>
</telerik:RadWindowManager>


<asp:SqlDataSource ID="DS_RG_FamilyMember" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" DeleteCommand="Sp_Family_Member_Del" DeleteCommandType="StoredProcedure" SelectCommand="Sp_FamilyMembers_sel" SelectCommandType="StoredProcedure"  OnSelected="DS_RG_FamilyMember_Selected">
    <DeleteParameters>
        <asp:SessionParameter Name="FamilyID" SessionField="FamilyID" Type="Int64" />
        <asp:Parameter Name="Node_Key" Type="Int32" />
    </DeleteParameters>
    <SelectParameters>
        <asp:SessionParameter Name="FamilyID" SessionField="FamilyID" Type="Int64"  />
        <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        <asp:Parameter Name="proband_Hasspouse" Direction="Output" Type="Int32"  />
        <asp:SessionParameter Name="HostID" SessionField="HostID_ForFamilyMember" Type="Int64"  />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="Sql_Relative_DDL_Status" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="select 0 val_RelativeStatus , 'Dead' txt_RelativeStatus union
	Select 1  , 'Alive' union  select 2 , 'Unknown' "></asp:SqlDataSource>
<asp:SqlDataSource ID="Sql_Relative_DDL_Gender" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand=" Select 0 as val_RelativeGender , 'Female' as txt_RelativeGender union  Select 1 , 'Male' union Select 2,'Unknown' "></asp:SqlDataSource>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <script type="text/javascript">

        
        function pageLoad() {
            var W = $(document).width();
            if (W < 1350) {
                document.getElementById("myDiagramDiv").style.width = "500px";
            }
        }

        function OpenWinAssignID() {

            var oWnd = radopen("AssignIndividualToProband.aspx", "RadWindow1");
            oWnd.set_height(500);
            oWnd.set_width(1000);
            oWnd.center();
            oWnd.set_modal(true);
        }

        function OpenWinAddFamilyMembers() {

            var oWnd = radopen("AddFamilyMembers.aspx", "RDW_FamilyMembers");

            oWnd.center();
            oWnd.set_modal(true);
        }

        function OnClientClose(oWnd, args) {

            var grid = $find("<%= RG_FamilyMemeber.ClientID %>");
            var masterTable = grid.get_masterTableView();

            var arg = args.get_argument();
            console.log('arg[6]' +arg[6]);

            if (arg != 0) {

                if (arg[6] == 0) // for proband
                {

                    document.getElementById("<%= btn_AssignIndividual.ClientID %>").disabled = true;
                    document.getElementById("<%= btn_AddFamilyMembers.ClientID %>").disabled = false;
               
                    

                    var hdn_ProbandID = document.getElementById("<%= hdn_ProbandID.ClientID %>");
           
                    var hdn_ProbandStatus = document.getElementById("<%= hdn_ProbandStatus.ClientID %>");
                    var hdn_ProbandBDate = document.getElementById("<%= hdn_ProbandBDate.ClientID %>");
                    var hdn_ProbandGender = document.getElementById("<%= hdn_ProbandGender.ClientID %>");
                    var hdn_ProbandName = document.getElementById("<%= hdn_ProbandName.ClientID %>");

                   
                    hdn_ProbandID.value = arg[0];
                    hdn_ProbandStatus.value = arg[5];
                    hdn_ProbandBDate.value = arg[4];
                    hdn_ProbandGender.value = arg[1];
                    hdn_ProbandName.value = arg[2].toString() + ' ' + arg[3].toString();
                  
                    document.getElementById("<%= btn_insert_Proband.ClientID %>").click();

                }
                if (arg[6] == 1) // for relative
                {
                    //  Edit mode
                    if (grid.get_editItems().length > 0) {
                        if (arg) {
                            var hdn_status = document.getElementById("<%= hdn_StatusIndividual_EditTemplate.ClientID %>");
                            var hdn_gender = document.getElementById("<%= hdn_GenderIndividual_EditTemplate.ClientID %>");
                            var hdn_BDate = document.getElementById("<%= hdn_BdateIndividual_EditTemplate.ClientID %>");
                       
                            var gridCount = masterTable.get_editItems().length;

                            for (var i = 0; i < gridCount; i++) {
                                item = masterTable.get_editItems()[i];
                                var Relative_ID = $(item.get_editFormItem()).find("input[id*='txt_IndividualID']").get(0);
                                var RelativeName = $(item.get_editFormItem()).find("input[id*='Txt_RelativeName']").get(0);
                                var Bdate = $(item.get_editFormItem()).find("div[id*='Txt_Bdate']").get(0);
                                var Gender = $(item.get_editFormItem()).find("div[id*='DDL_Gender']").get(0);
                                var Status = $(item.get_editFormItem()).find("div[id*='DDL_Status']").get(0);
                                $(item.get_editFormItem()).find("input[id*='txt_IndividualID']").prop('disabled', true);
                                $(item.get_editFormItem()).find("input[id*='Txt_RelativeName']").prop('disabled', true);

                                $(Gender).css({ "pointer-events": "none", "opacity": "0.7" }).attr("tabindex", "-1");
                                $(Status).css({ "pointer-events": "none", "opacity": "0.7" }).attr("tabindex", "-1");
                                $(Bdate).css({ "pointer-events": "none", "opacity": "0.7" }).attr("tabindex", "-1");

                                Relative_ID.value = arg[0];
                                RelativeName.value = arg[2].toString() + ' ' + arg[3].toString();


                                if (arg[5] == 1) {
                                    var tt = Status.getElementsByTagName('span');
                                    tt[1].innerText = 'Alive';
                                    hdn_status.value = 1;
                                }
                                else if (arg[5] == 0) {
                                    var tt = Status.getElementsByTagName('span');
                                    tt[1].innerText = 'Dead';
                                    hdn_status.value = 0;
                                }
                                else if (arg[5] == 2) {
                                    var tt = Status.getElementsByTagName('span');
                                    tt[1].innerText = 'Unkonwn';
                                    hdn_status.value = 2;
                                }

                                if (arg[1] == 0) {
                                    var tt = Gender.getElementsByTagName('span');
                                    tt[1].innerText = 'Female';
                                    hdn_gender.value = 0;
                                }
                                else if (arg[1] == 1) {
                                    var tt = Gender.getElementsByTagName('span');
                                    tt[1].innerText = 'Male';
                                    hdn_gender.value = 1;
                                }


                                var targetDiv = Bdate.getElementsByClassName("rcSelect")[0];
                                var datePicker_Btn = targetDiv.getElementsByTagName('a');
                                datePicker_Btn[0].style.visibility = "hidden";

                                datePicker_TBX = Bdate.getElementsByClassName("RadInput")[0];
                                datePicker_TBX.getElementsByTagName("Input")[0].value = arg[4];
                                hdn_BDate.value = arg[4];

                            }
                        }
                    }

                    //insert mode
                    if (masterTable.get_insertItem() != null) {
                        if (arg) {
                            var insertRow = masterTable.get_insertItem();
                            var Relative_ID = $(insertRow).find("input[id*='txt_RelativeID']").get(0);
                            Relative_ID.value = arg[0];
                        }
                    }
                }
            }
        }

        function OnClientAddFamilyMemberClose(oWnd, args) {
            var arg = args.get_argument();
            if (arg != 0) {
                document.getElementById("<%= hdn_Num_Brothers.ClientID %>").value = arg[0];
                document.getElementById("<%= hdn_Num_Sisters.ClientID %>").value = arg[1];
                document.getElementById("<%= hdn_Num_Sons.ClientID %>").value = arg[2];
                document.getElementById("<%= hdn_Num_Daughters.ClientID %>").value = arg[3];
                document.getElementById("<%= hdn_Num_MUncles.ClientID %>").value = arg[4];
                document.getElementById("<%=  hdn_Num_MAunts.ClientID %>").value = arg[5];
                document.getElementById("<%=  hdn_Num_FUncles.ClientID %>").value = arg[6];
                document.getElementById("<%= hdn_Num_FAunts.ClientID %>").value = arg[7];
                document.getElementById("<%= hdn_Has_Spouse.ClientID %>").value = arg[8];
                document.getElementById("<%= btn_FamilyGrid.ClientID %>").click();


            }
        }


        var myDiagram;
        function DeleteDiagram() {
            // if (window.goSamples) goSamples();  // init for these samples -- you don't need to call this
            var projectDiagramDiv = document.getElementById("myDiagramDiv");
            var projectDiagram = go.Diagram.fromDiv(projectDiagramDiv);
            if (projectDiagram) {
                projectDiagram.div = null;
            }
            var lbl_Feedback = document.getElementById("<%= lbl_Feedback.ClientID %>");
            lbl_Feedback.innerText = " No Pedigree to Display";

        }
        function init() {
            // if (window.goSamples) goSamples();  // init for these samples -- you don't need to call this
            var projectDiagramDiv = document.getElementById("myDiagramDiv");
            var projectDiagram = go.Diagram.fromDiv(projectDiagramDiv);
            if (projectDiagram) {
                projectDiagram.div = null;
            }

            if (document.getElementById('<%= Txt_PVal.ClientID%>').value.length != 0) {
                var lbl_Feedback = document.getElementById("<%= lbl_Feedback.ClientID %>");
                lbl_Feedback.innerText = "";
                var $ = go.GraphObject.make;
                myDiagram = $(go.Diagram, "myDiagramDiv",
                    {
                        initialAutoScale: go.Diagram.Uniform,
                        initialContentAlignment: go.Spot.Center,
                        // when a node is selected, draw a big yellow circle behind it
                        nodeSelectionAdornmentTemplate:
                            $(go.Adornment, "Auto",
                                { layerName: "Grid" },  // the predefined layer that is behind everything else
                                $(go.Shape, "Circle", { fill: "#fee090", stroke: null }),
                                $(go.Placeholder)
                            ),
                        layout:  // use a custom layout, defined below
                            $(GenogramLayout, { direction: 90, layerSpacing: 30, columnSpacing: 10 })
                    });
                // determine the color for each attribute shape
                function attrFill(a) {
                    switch (a) {
                        case "ATL": return "green";
                        case "ATR": return "green";
                        case "ABR": return "green";
                        case "ABL": return "green";
                        case "BTL": return "orange";
                        case "BTR": return "orange";
                        case "BBR": return "orange";
                        case "BBL": return "orange";
                        case "CTL": return "red";
                        case "CTR": return "red";
                        case "CBR": return "red";
                        case "CBL": return "red";
                        case "DTL": return "cyan";
                        case "DTR": return "cyan";
                        case "DBR": return "cyan";
                        case "DBL": return "cyan";
                        case "ETL": return "gold";
                        case "ETR": return "gold";
                        case "EBR": return "gold";
                        case "EBL": return "gold";
                        case "FTL": return "pink";
                        case "FTR": return "pink";
                        case "FBR": return "pink";
                        case "FBL": return "pink";
                        case "GTL": return "blue";
                        case "GTR": return "blue";
                        case "GBR": return "blue";
                        case "GBL": return "blue";
                        case "HTL": return "brown";
                        case "HTR": return "brown";
                        case "HBR": return "brown";
                        case "HBL": return "brown";
                        case "ITL": return "purple";
                        case "ITR": return "purple";
                        case "IBR": return "purple";
                        case "IBL": return "purple";
                        case "JTL": return "chartreuse";
                        case "JTR": return "chartreuse";
                        case "JBR": return "chartreuse";
                        case "JBL": return "chartreuse";
                        case "KTL": return "lightgray";
                        case "KTR": return "lightgray";
                        case "KBR": return "lightgray";
                        case "KBL": return "lightgray";
                        case "LTL": return "magenta";
                        case "LTR": return "magenta";
                        case "LBR": return "magenta";
                        case "LBL": return "magenta";
                        case "AS": return "red";


                        default: return "transparent";
                    }
                }
                // determine the geometry for each attribute shape in a male;
                // except for the slash these are all squares at each of the four corners of the overall square
                var tlsq = go.Geometry.parse("F M1 1 l19 0 0 19 -19 0z");
                var trsq = go.Geometry.parse("F M20 1 l19 0 0 19 -19 0z");
                var brsq = go.Geometry.parse("F M20 20 l19 0 0 19 -19 0z");
                var blsq = go.Geometry.parse("F M1 20 l19 0 0 19 -19 0z");
                var slash = go.Geometry.parse("F M38 0 L40 0 40 2 2 40 0 40 0 38z");
                function maleGeometry(a) {
                    switch (a) {
                        case "ATL": return tlsq;
                        case "ATR": return trsq;
                        case "ABR": return brsq;
                        case "ABL": return blsq;
                        case "BTL": return tlsq;
                        case "BTR": return trsq;
                        case "BBR": return brsq;
                        case "BBL": return blsq;
                        case "CTL": return tlsq;
                        case "CTR": return trsq;
                        case "CBR": return brsq;
                        case "CBL": return blsq;
                        case "DTL": return tlsq;
                        case "DTR": return trsq;
                        case "DBR": return brsq;
                        case "DBL": return blsq;
                        case "ETL": return tlsq;
                        case "ETR": return trsq;
                        case "EBR": return brsq;
                        case "EBL": return blsq;
                        case "GTL": return tlsq;
                        case "GTR": return trsq;
                        case "GBR": return brsq;
                        case "GBL": return blsq;
                        case "FTL": return tlsq;
                        case "FTR": return trsq;
                        case "FBR": return brsq;
                        case "FBL": return blsq;
                        case "HTL": return tlsq;
                        case "HTR": return trsq;
                        case "HBR": return brsq;
                        case "HBL": return blsq;
                        case "ITL": return tlsq;
                        case "ITR": return trsq;
                        case "IBR": return brsq;
                        case "IBL": return blsq;
                        case "JTL": return tlsq;
                        case "JTR": return trsq;
                        case "JBR": return brsq;
                        case "JBL": return blsq;
                        case "KTL": return tlsq;
                        case "KTR": return trsq;
                        case "KBR": return brsq;
                        case "KBL": return blsq;
                        case "LTL": return tlsq;
                        case "LTR": return trsq;
                        case "LBR": return brsq;
                        case "LBL": return blsq;
                        case "AS": return slash;
                        default: return tlsq;
                    }
                }
                // determine the geometry for each attribute shape in a female;
                // except for the slash these are all pie shapes at each of the four quadrants of the overall circle
                var tlarc = go.Geometry.parse("F M20 20 B 180 90 20 20 19 19 z");
                var trarc = go.Geometry.parse("F M20 20 B 270 90 20 20 19 19 z");
                var brarc = go.Geometry.parse("F M20 20 B 0 90 20 20 19 19 z");
                var blarc = go.Geometry.parse("F M20 20 B 90 90 20 20 19 19 z");
                function femaleGeometry(a) {
                    switch (a) {

                        case "ATL": return tlarc;
                        case "ATR": return trarc;
                        case "ABR": return brarc;
                        case "ABL": return blarc;
                        case "BTL": return tlarc;
                        case "BTR": return trarc;
                        case "BBR": return brarc;
                        case "BBL": return blarc;
                        case "CTL": return tlarc;
                        case "CTR": return trarc;
                        case "CBR": return brarc;
                        case "CBL": return blarc;
                        case "DTL": return tlarc;
                        case "DTR": return trarc;
                        case "DBR": return brarc;
                        case "DBL": return blarc;
                        case "ETL": return tlarc;
                        case "ETR": return trarc;
                        case "EBR": return brarc;
                        case "EBL": return blarc;
                        case "GTL": return tlarc;
                        case "GTR": return trarc;
                        case "GBR": return brarc;
                        case "GBL": return blarc;
                        case "FTL": return tlarc;
                        case "FTR": return trarc;
                        case "FBR": return brarc;
                        case "FBL": return blarc;
                        case "HTL": return tlarc;
                        case "HTR": return trarc;
                        case "HBR": return brarc;
                        case "HBL": return blarc;
                        case "ITL": return tlarc;
                        case "ITR": return trarc;
                        case "IBR": return brarc;
                        case "IBL": return blarc;
                        case "JTL": return tlarc;
                        case "JTR": return trarc;
                        case "JBR": return brarc;
                        case "JBL": return blarc;
                        case "KTL": return tlarc;
                        case "KTR": return trarc;
                        case "KBR": return brarc;
                        case "KBL": return blarc;
                        case "LTL": return tlarc;
                        case "LTR": return trarc;
                        case "LBR": return brarc;
                        case "LBL": return blarc;
                        case "AS": return slash;
                        default: return tlarc;
                    }
                }
                // two different node templates, one for each sex,
                // named by the category value in the node data object

                myDiagram.nodeTemplateMap.add("U",  // Unknown
                    $(go.Node, "Vertical",
                        { locationSpot: go.Spot.Center, locationObjectName: "ICON" },
                        $(go.Panel,
                            { name: "ICON" },
                            $(go.Shape, "Diamond",
                                { width: 40, height: 40, strokeWidth: 2, fill: "white", portId: "" }),
                            $(go.Panel,
                                { // for each attribute show a Shape at a particular place in the overall square
                                    itemTemplate:
                                        $(go.Panel,
                                            $(go.Shape,
                                                { stroke: null, strokeWidth: 0 },
                                                new go.Binding("fill", "", attrFill),
                                                new go.Binding("geometry", "", maleGeometry))
                                        ),
                                    margin: 1
                                },
                                new go.Binding("itemArray", "a")
                            )
                        ),
                        $(go.TextBlock,
                            { textAlign: "center", maxSize: new go.Size(80, NaN) },
                            new go.Binding("text", "n"))
                    ));


                myDiagram.nodeTemplateMap.add("M",  // male
                    $(go.Node, "Vertical",
                        { locationSpot: go.Spot.Center, locationObjectName: "ICON" },
                        $(go.Panel,
                            { name: "ICON" },
                            $(go.Shape, "Square",
                                { width: 40, height: 40, strokeWidth: 2, fill: "white", portId: "" }),
                            $(go.Panel,
                                { // for each attribute show a Shape at a particular place in the overall square
                                    itemTemplate:
                                        $(go.Panel,
                                            $(go.Shape,
                                                { stroke: null, strokeWidth: 0 },
                                                new go.Binding("fill", "", attrFill),
                                                new go.Binding("geometry", "", maleGeometry))
                                        ),
                                    margin: 1
                                },
                                new go.Binding("itemArray", "a")
                            )
                        ),
                        $(go.TextBlock,
                            { textAlign: "center", maxSize: new go.Size(80, NaN) },
                            new go.Binding("text", "n"))
                    ));
                myDiagram.nodeTemplateMap.add("F",  // female
                    $(go.Node, "Vertical",
                        { locationSpot: go.Spot.Center, locationObjectName: "ICON" },
                        $(go.Panel,
                            { name: "ICON" },
                            $(go.Shape, "Circle",
                                { width: 40, height: 40, strokeWidth: 2, fill: "white", portId: "" }),
                            $(go.Panel,
                                { // for each attribute show a Shape at a particular place in the overall circle
                                    itemTemplate:
                                        $(go.Panel,
                                            $(go.Shape,
                                                { stroke: null, strokeWidth: 0 },
                                                new go.Binding("fill", "", attrFill),
                                                new go.Binding("geometry", "", femaleGeometry))
                                        ),
                                    margin: 1
                                },
                                new go.Binding("itemArray", "a")
                            )
                        ),
                        $(go.TextBlock,
                            { textAlign: "center", maxSize: new go.Size(80, NaN) },
                            new go.Binding("text", "n"))
                    ));
                // the representation of each label node -- nothing shows on a Marriage Link
                myDiagram.nodeTemplateMap.add("LinkLabel",
                    $(go.Node, { selectable: false, width: 1, height: 1, fromEndSegmentLength: 20 }));
                myDiagram.linkTemplate =  // for parent-child relationships
                    $(go.Link,
                        {
                            routing: go.Link.Orthogonal, curviness: 10,
                            layerName: "Background", selectable: false,
                            fromSpot: go.Spot.Bottom, toSpot: go.Spot.Top
                        },
                        $(go.Shape, { strokeWidth: 2 })
                    );
                myDiagram.linkTemplateMap.add("Marriage",  // for marriage relationships
                    $(go.Link, { selectable: false },
                        $(go.Shape, { strokeWidth: 2, stroke: "darkgreen" })
                    ));
                // n: name, s: sex, m: mother, f: father, ux: wife, vir: husband, a: attributes/markers
                var datass = document.getElementById('<%= Txt_PVal.ClientID%>').value;


                var parsedjason = jQuery.parseJSON(datass);
                //parsedjason.forEach(function (d) {
                //    console.log(d);
                //})


                setupDiagram(myDiagram, parsedjason.d /* focus on this person */);
            }
        }
        // create and initialize the Diagram.model given an array of node data representing people
        function setupDiagram(diagram, array) { //, focusId
            //    console.log("Inside");
            //    console.log(array);
            diagram.model =
                go.GraphObject.make(go.GraphLinksModel,
                    { // declare support for link label nodes
                        linkLabelKeysProperty: "labelKeys",
                        // this property determines which template is used
                        nodeCategoryProperty: "s",
                        // create all of the nodes for people
                        nodeDataArray: array
                    });
            setupMarriages(diagram);
            setupParents(diagram);
            //var node = diagram.findNodeForKey(focusId);
            //if (node !== null) {
            //    diagram.select(node);
            //    node.linksConnected.each(function (l) {
            //        if (!l.isLabeledLink) return;
            //        l.opacity = 0;
            //        var spouse = l.getOtherNode(node);
            //        spouse.opacity = 0;
            //        spouse.pickable = false;
            //    });
            // }

         
        }
        function findMarriage(diagram, a, b) {  // A and B are node keys
            var nodeA = diagram.findNodeForKey(a);
            var nodeB = diagram.findNodeForKey(b);
            if (nodeA !== null && nodeB !== null) {
                var it = nodeA.findLinksBetween(nodeB);  // in either direction
                while (it.next()) {
                    var link = it.value;
                    // Link.data.category === "Marriage" means it's a marriage relationship
                    if (link.data !== null && link.data.category === "Marriage") return link;
                }
            }
            return null;
        }
        // now process the node data to determine marriages
        function setupMarriages(diagram) {
            var model = diagram.model;
            var nodeDataArray = model.nodeDataArray;
            for (var i = 0; i < nodeDataArray.length; i++) {
                var data = nodeDataArray[i];
                var key = data.key;
                var uxs = data.ux;
                if (uxs !== undefined) {
                    if (typeof uxs === "number") uxs = [uxs];
                    for (var j = 0; j < uxs.length; j++) {
                        var wife = uxs[j];
                        if (key === wife) {
                            // or warn no reflexive marriages
                            continue;
                        }
                        var link = findMarriage(diagram, key, wife);
                        if (link === null) {

                            // add a label node for the marriage link
                            var mlab = { s: "LinkLabel" };
                            model.addNodeData(mlab);
                            // add the marriage link itself, also referring to the label node
                            var mdata = { from: key, to: wife, labelKeys: [mlab.key], category: "Marriage" };
                            model.addLinkData(mdata);
                            //  console.log(mdata);
                        }
                    }
                }
                var virs = data.vir;
                if (virs !== undefined) {
                    if (typeof virs === "number") virs = [virs];
                    for (var j = 0; j < virs.length; j++) {
                        var husband = virs[j];
                        if (key === husband) {
                            // or warn no reflexive marriages
                            continue;
                        }
                        var link = findMarriage(diagram, key, husband);
                        if (link === null) {

                            // add a label node for the marriage link
                            var mlab = { s: "LinkLabel" };
                            model.addNodeData(mlab);
                            // add the marriage link itself, also referring to the label node
                            var mdata = { from: key, to: husband, labelKeys: [mlab.key], category: "Marriage" };
                            model.addLinkData(mdata);
                            //   console.log(mdata);
                        }
                    }
                }
            }
        }
        // process parent-child relationships once all marriages are known
        function setupParents(diagram) {
            var model = diagram.model;
            var nodeDataArray = model.nodeDataArray;
            for (var i = 0; i < nodeDataArray.length; i++) {
                var data = nodeDataArray[i];
                var key = data.key;
                var mother = data.m;
                var father = data.f;
                if (mother !== undefined && father !== undefined) {
                    var link = findMarriage(diagram, mother, father);
                    if (link === null) {
                        // or warn no known mother or no known father or no known marriage between them
                        if (window.console) window.console.log("unknown marriage: " + mother + " & " + father);
                        continue;
                    }
                    var mdata = link.data;
                    var mlabkey = mdata.labelKeys[0];
                    var cdata = { from: mlabkey, to: key };
                    myDiagram.model.addLinkData(cdata);
                }
            }
        }
        // A custom layout that shows the two families related to a person's parents
        function GenogramLayout() {
            go.LayeredDigraphLayout.call(this);
            this.initializeOption = go.LayeredDigraphLayout.InitDepthFirstIn;
        }
        go.Diagram.inherit(GenogramLayout, go.LayeredDigraphLayout);
        /** @override */
        GenogramLayout.prototype.makeNetwork = function (coll) {
            // generate LayoutEdges for each parent-child Link
            var net = this.createNetwork();
            if (coll instanceof go.Diagram) {
                this.add(net, coll.nodes, true);
                this.add(net, coll.links, true);
            } else if (coll instanceof go.Group) {
                this.add(net, coll.memberParts, false);
            } else if (coll.iterator) {
                this.add(net, coll.iterator, false);
            }
            return net;
        };
        // internal method for creating LayeredDigraphNetwork where husband/wife pairs are represented
        // by a single LayeredDigraphVertex corresponding to the label Node on the marriage Link
        GenogramLayout.prototype.add = function (net, coll, nonmemberonly) {
            // consider all Nodes in the given collection
            var it = coll.iterator;
            while (it.next()) {
                var node = it.value;
                if (!(node instanceof go.Node)) continue;
                if (!node.isLayoutPositioned || !node.isVisible()) continue;
                if (nonmemberonly && node.containingGroup !== null) continue;
                // if it's an unmarried Node, or if it's a Link Label Node, create a LayoutVertex for it
                if (node.isLinkLabel) {
                    // get marriage Link
                    var link = node.labeledLink;
                    var spouseA = link.fromNode;
                    var spouseB = link.toNode;
                    // create vertex representing both husband and wife
                    var vertex = net.addNode(node);
                    // now define the vertex size to be big enough to hold both spouses
                    vertex.width = spouseA.actualBounds.width + 30 + spouseB.actualBounds.width;
                    vertex.height = Math.max(spouseA.actualBounds.height, spouseB.actualBounds.height);
                    vertex.focus = new go.Point(spouseA.actualBounds.width + 30 / 2, vertex.height / 2);
                } else {
                    // don't add a vertex for any married person!
                    // instead, code above adds label node for marriage link
                    // assume a marriage Link has a label Node
                    if (!node.linksConnected.any(function (l) { return l.isLabeledLink; })) {
                        var vertex = net.addNode(node);
                    }
                }
            }
            // now do all Links
            it.reset();
            while (it.next()) {
                var link = it.value;
                if (!(link instanceof go.Link)) continue;
                if (!link.isLayoutPositioned || !link.isVisible()) continue;
                if (nonmemberonly && link.containingGroup !== null) continue;
                // if it's a parent-child link, add a LayoutEdge for it
                if (!link.isLabeledLink) {
                    var parent = net.findVertex(link.fromNode);  // should be a label node
                    var child = net.findVertex(link.toNode);
                    if (child !== null) {  // an unmarried child
                        net.linkVertexes(parent, child, link);
                    } else {  // a married child
                        link.toNode.linksConnected.each(function (l) {
                            if (!l.isLabeledLink) return;  // if it has no label node, it's a parent-child link
                            // found the Marriage Link, now get its label Node
                            var mlab = l.labelNodes.first();
                            // parent-child link should connect with the label node,
                            // so the LayoutEdge should connect with the LayoutVertex representing the label node
                            var mlabvert = net.findVertex(mlab);
                            if (mlabvert !== null) {
                                net.linkVertexes(parent, mlabvert, link);
                            }
                        });
                    }
                }
            }
        };
        /** @override */
        GenogramLayout.prototype.assignLayers = function () {
            go.LayeredDigraphLayout.prototype.assignLayers.call(this);
            var horiz = this.direction == 0.0 || this.direction == 180.0;
            // for every vertex, record the maximum vertex width or height for the vertex's layer
            var maxsizes = [];
            this.network.vertexes.each(function (v) {
                var lay = v.layer;
                var max = maxsizes[lay];
                if (max === undefined) max = 0;
                var sz = (horiz ? v.width : v.height);
                if (sz > max) maxsizes[lay] = sz;
            });
            // now make sure every vertex has the maximum width or height according to which layer it is in,
            // and aligned on the left (if horizontal) or the top (if vertical)
            this.network.vertexes.each(function (v) {
                var lay = v.layer;
                var max = maxsizes[lay];
                if (horiz) {
                    v.focus = new go.Point(0, v.height / 2);
                    v.width = max;
                } else {
                    v.focus = new go.Point(v.width / 2, 0);
                    v.height = max;
                }
            });
            // from now on, the LayeredDigraphLayout will think that the Node is bigger than it really is
            // (other than the ones that are the widest or tallest in their respective layer).
        };
        /** @override */
        GenogramLayout.prototype.commitNodes = function () {
            go.LayeredDigraphLayout.prototype.commitNodes.call(this);
            // position regular nodes
            this.network.vertexes.each(function (v) {
                if (v.node !== null && !v.node.isLinkLabel) {
                    v.node.position = new go.Point(v.x, v.y);
                }
            });
            // position the spouses of each marriage vertex
            var layout = this;
            this.network.vertexes.each(function (v) {
                if (v.node === null) return;
                if (!v.node.isLinkLabel) return;
                var labnode = v.node;
                var lablink = labnode.labeledLink;
                // In case the spouses are not actually moved, we need to have the marriage link
                // position the label node, because LayoutVertex.commit() was called above on these vertexes.
                // Alternatively we could override LayoutVetex.commit to be a no-op for label node vertexes.
                lablink.invalidateRoute();
                var spouseA = lablink.fromNode;
                var spouseB = lablink.toNode;
                // prefer fathers on the left, mothers on the right
                if (spouseA.data.s === "F") {  // sex is female
                    var temp = spouseA;
                    spouseA = spouseB;
                    spouseB = temp;
                }
                // see if the parents are on the desired sides, to avoid a link crossing
                var aParentsNode = layout.findParentsMarriageLabelNode(spouseA);
                var bParentsNode = layout.findParentsMarriageLabelNode(spouseB);
                if (aParentsNode !== null && bParentsNode !== null && aParentsNode.position.x > bParentsNode.position.x) {
                    // swap the spouses
                    var temp = spouseA;
                    spouseA = spouseB;
                    spouseB = temp;
                }
                spouseA.position = new go.Point(v.x, v.y);
                spouseB.position = new go.Point(v.x + spouseA.actualBounds.width + 30, v.y);
                if (spouseA.opacity === 0) {
                    var pos = new go.Point(v.centerX - spouseA.actualBounds.width / 2, v.y);
                    spouseA.position = pos;
                    spouseB.position = pos;
                } else if (spouseB.opacity === 0) {
                    var pos = new go.Point(v.centerX - spouseB.actualBounds.width / 2, v.y);
                    spouseA.position = pos;
                    spouseB.position = pos;
                }
            });
        };
        GenogramLayout.prototype.findParentsMarriageLabelNode = function (node) {
            var it = node.findNodesInto();
            while (it.next()) {
                var n = it.value;
                if (n.isLinkLabel) return n;
            }
            return null;
        };
        // end GenogramLayout class
        ///////////////////////////////////////////////////////////////// GOJS

        function GetRadWindow() {
            var oWindow = null;
            if (window.radWindow) oWindow = window.radWindow;
            else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
            return oWindow;
        }

        function btn_cacel_click() {
            GetRadWindow().close();

        }


    </script>

</telerik:RadScriptBlock>

