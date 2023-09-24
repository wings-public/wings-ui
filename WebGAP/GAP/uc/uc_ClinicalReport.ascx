<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_ClinicalReport.ascx.cs" Inherits="WebGAP.GAP.uc.uc_ClinicalReport" %>


<style>

    
     .RadGrid_Bootstrap .rgHeader td {
    padding-left: 0px ;
    }

    .RadGrid_Bootstrap .rgEditFormContainer .rgUpdate, .RadGrid_Bootstrap .rgEditFormContainer .rgCancel {
        display: none;
    }

    .lbl_Bg_Grid {
        background-color: #91cacc;
        color: white;
        padding: 4px;
        border-bottom-left-radius: 4px;
        border-top-right-radius: 4px;
        border-bottom-right-radius: 4px;
        border-top-left-radius: 4px;
        float: right;
        font-size: small;
    }

    .RadGrid_Bootstrap .rgMasterTable .rgSelectedCell, .RadGrid_Bootstrap .rgSelectedRow td, .RadGrid_Bootstrap td.rgEditRow .rgSelectedRow, .RadGrid_Bootstrap .rgSelectedRow td.rgSorted, .RadGrid .rgSelectedRow td {
        color: none !important;
        background: none !important;
        border-color: none !important;
        border-color: #dedede !important;
    }

    .RadWindow .rwIcon {
        display: none;
    }
</style>

<link href=".././assets/css/Filter_Custom.css" rel="stylesheet" type="text/css" runat="server" />

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_Report_Mutations">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_Report_Mutations" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="btn_Print">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btn_Print" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_Report_Mutations">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_Report_Mutations" />
                <telerik:AjaxUpdatedControl ControlID="RCB_classification" />
                <telerik:AjaxUpdatedControl ControlID="RCB_Inheritance" />
                <telerik:AjaxUpdatedControl ControlID="RCB_Disease" />
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="btn_Save">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btn_Save" />
                <telerik:AjaxUpdatedControl ControlID="RG_Report_Mutations" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RAF_ReportInfo" LoadingPanelID="RadAjaxLoadingPanel1" />

            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="btn_SendToPI">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btn_SendToPI" />
                <telerik:AjaxUpdatedControl ControlID="RLbl_ClinicarReport_Status" />
                <telerik:AjaxUpdatedControl ControlID="btn_Save" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="btn_approve">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btn_approve" />
                <telerik:AjaxUpdatedControl ControlID="RLbl_ClinicarReport_Status" />
                <telerik:AjaxUpdatedControl ControlID="btn_Save" />
                <telerik:AjaxUpdatedControl ControlID="btn_Print" />
                <telerik:AjaxUpdatedControl ControlID="RAF_ReportInfo" />
                <telerik:AjaxUpdatedControl ControlID="RG_Report_Mutations" />
                <telerik:AjaxUpdatedControl ControlID="hdn_Disable_CellClicking" />
                <telerik:AjaxUpdatedControl ControlID="Txt_PVal" />
                <telerik:AjaxUpdatedControl ControlID="Pedigree_base64" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="save_pedigree">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="save_pedigree" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="btn_stop_editMode">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btn_stop_editMode" />
                <telerik:AjaxUpdatedControl ControlID="RG_Report_Mutations" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="btn_Sanger">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btn_Sanger" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30" Skin="Office2007" />


<div class="content-header row">
    <div class="content-header-left col-md-12 col-12">

        <table style="width: 100%; background-color: lightgray">
            <tr>

                <td style="width: 60px">
                    <asp:Label runat="server" ID="Lbl_ClinicarReport_Status" BackColor="#0066ff" Font-Size="Smaller" CssClass="header"> </asp:Label>
                </td>
                <td style="width: 120px">
                    <asp:Label runat="server" ID="lbl_Analysis_Type" Text="Report" CssClass="header"> </asp:Label>
                </td>
                <td rowspan="2" style="text-align: left; padding-left: 30px">
                    <%-- <img runat="server" id="img_Precondition">
                    <asp:Label runat="server" ID="lbl_PreCondition" CssClass="pr-1"></asp:Label>--%>
                    <img runat="server" id="img_Female" src="/img/icon/Female_s.png" visible="false">
                    <asp:Label runat="server" ID="lbl_FemaleID" ForeColor="#333333" Font-Size="Medium" CssClass="pr-1"></asp:Label>

                    <img id="img_Male" src="/img/icon/Male_s.png" runat="server" visible="false">
                    <asp:Label runat="server" ID="lbl_MaleID" ForeColor="#333333" Font-Size="Medium" CssClass="pr-1"></asp:Label>
                </td>
                <td style="float: right; padding-right: 27px; font-size: unset; color: white; padding: 10px; display: inline-table; background-color: #cc4e4e; /* margin: 6px; *//* margin-top: 6px; */margin-right: 16px;">
                    <asp:Label runat="server" ID="lbl_ReportID"></asp:Label>
                </td>
            </tr>
        </table>

    </div>

</div>
<div class="row pt-1">
    <div class="content-header-right col-md-12 col-12">
        <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
            <asp:LinkButton ID="btn_Print" runat="server" CssClass="btn btn-outline-info btn-min-width mr-1 mb-1" OnClick="btn_Print_Click"><i class="icon-printer"></i>&nbsp;  Print Draft</asp:LinkButton>
            <asp:LinkButton ID="btn_SendToPI" runat="server" CssClass="btn btn-outline-success btn-min-width mr-1 mb-1" OnClick="btn_Update_Click" CustomParameter="SendToPI"><i class="icon-android-drafts"> </i>&nbsp; Send To PI</asp:LinkButton>
            <asp:LinkButton ID="btn_Save" runat="server" CssClass="btn btn-outline-success btn-min-width mr-1 mb-1" OnClick="btn_Update_Click" CustomParameter="Save"><i class="icon-android-drafts"></i>&nbsp; save</asp:LinkButton>
            <asp:LinkButton ID="btn_approve" runat="server" CssClass="btn btn-outline-info btn-min-width mr-1 mb-1" Visible="false" OnClick="btn_approve_Click"><i class=""></i>&nbsp;  Approve</asp:LinkButton>
        </div>
    </div>
</div>

<div class="col-md-12 pl-0 pr-0">
    <div class="card pl-1 pr-1">
        <div class="card-body pl-0 pr-0">
            <div class="card-block">
                <form class="form">

                    <div class="form-body">
                        <h4 class="form-section">Report</h4>

                        <asp:HiddenField runat="server" ID="hdn_Disable_CellClicking" />
                        <telerik:RadDataForm RenderMode="Lightweight" runat="server" ID="RAF_ReportInfo" DataSourceID="DA_RAF_ReportInfo" DataKeyNames="ReportID">
                            <ItemTemplate>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="Physician_Name">Physician Name</label>
                                            <asp:TextBox ID="Physician_Name" runat="server" class="form-control" Text='<%# Eval("Referal_MD") %>'></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="Report_Desc">Report Description</label>
                                            <telerik:RadEditor ID="Report_Desc" runat="server" Width="100%" EditModes="Design" Height="150px" Content='<%# Eval("Report_Desc") %>'>
                                                <Tools>
                                                    <telerik:EditorToolGroup>
                                                        <telerik:EditorTool Name="Cut" />
                                                        <telerik:EditorTool Name="Copy" />
                                                        <telerik:EditorTool Name="Paste" />
                                                        <telerik:EditorTool Name="Bold"></telerik:EditorTool>
                                                        <telerik:EditorTool Name="Italic"></telerik:EditorTool>
                                                        <telerik:EditorTool Name="Underline"></telerik:EditorTool>
                                                        <telerik:EditorTool Name="InsertLink"></telerik:EditorTool>
                                                        <telerik:EditorTool Name="AjaxSpellCheck"></telerik:EditorTool>
                                                    </telerik:EditorToolGroup>
                                                </Tools>

                                            </telerik:RadEditor>

                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="Report_Desc">Report Recommendation</label>
                                        <telerik:RadEditor ID="Report_Recom" runat="server" Width="100%" EditModes="Design" Height="150px" Content='<%# Eval("Report_Recom") %>'>
                                            <Tools>
                                                <telerik:EditorToolGroup>
                                                    <telerik:EditorTool Name="Cut" />
                                                    <telerik:EditorTool Name="Copy" />
                                                    <telerik:EditorTool Name="Paste" />
                                                    <telerik:EditorTool Name="Bold"></telerik:EditorTool>
                                                    <telerik:EditorTool Name="Italic"></telerik:EditorTool>
                                                    <telerik:EditorTool Name="Underline"></telerik:EditorTool>
                                                    <telerik:EditorTool Name="InsertLink"></telerik:EditorTool>
                                                    <telerik:EditorTool Name="AjaxSpellCheck"></telerik:EditorTool>
                                                </telerik:EditorToolGroup>
                                            </Tools>

                                        </telerik:RadEditor>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="Report_Filter_Path">Approach</label>

                                        <telerik:RadEditor ID="Report_Filter_Path" runat="server" Width="100%" EditModes="Design" Height="150px" Content='<%# Eval("Report_Filter_Path") %>'>
                                            <Tools>
                                                <telerik:EditorToolGroup>
                                                    <telerik:EditorTool Name="Cut" />
                                                    <telerik:EditorTool Name="Copy" />
                                                    <telerik:EditorTool Name="Paste" />
                                                    <telerik:EditorTool Name="Bold"></telerik:EditorTool>
                                                    <telerik:EditorTool Name="Italic"></telerik:EditorTool>
                                                    <telerik:EditorTool Name="Underline"></telerik:EditorTool>
                                                    <telerik:EditorTool Name="InsertLink"></telerik:EditorTool>
                                                    <telerik:EditorTool Name="AjaxSpellCheck"></telerik:EditorTool>
                                                </telerik:EditorToolGroup>
                                            </Tools>

                                        </telerik:RadEditor>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="MessageTo_PI">Message to PI</label>

                                        <telerik:RadEditor ID="MessageTo_PI" runat="server" Width="100%" EditModes="Design" Height="150px" Content='<%# Eval("Message_To_PI") %>' OnClientLoad="MessageTo_PI_onclientLoad">
                                            <Tools>
                                                <telerik:EditorToolGroup>
                                                    <telerik:EditorTool Name="Cut" />
                                                    <telerik:EditorTool Name="Copy" />
                                                    <telerik:EditorTool Name="Paste" />
                                                    <telerik:EditorTool Name="Bold"></telerik:EditorTool>
                                                    <telerik:EditorTool Name="Italic"></telerik:EditorTool>
                                                    <telerik:EditorTool Name="Underline"></telerik:EditorTool>
                                                    <telerik:EditorTool Name="InsertLink"></telerik:EditorTool>
                                                    <telerik:EditorTool Name="AjaxSpellCheck"></telerik:EditorTool>
                                                </telerik:EditorToolGroup>
                                            </Tools>

                                        </telerik:RadEditor>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="MessageTo_User">Message to User</label>

                                        <telerik:RadEditor ID="MessageTo_User" runat="server" Width="100%" EditModes="Design" Height="150px" Content='<%# Eval("Message_To_User") %>' OnClientLoad="MessageTo_User_onclientLoad">
                                            <Tools>
                                                <telerik:EditorToolGroup>
                                                    <telerik:EditorTool Name="Cut" />
                                                    <telerik:EditorTool Name="Copy" />
                                                    <telerik:EditorTool Name="Paste" />
                                                    <telerik:EditorTool Name="Bold"></telerik:EditorTool>
                                                    <telerik:EditorTool Name="Italic"></telerik:EditorTool>
                                                    <telerik:EditorTool Name="Underline"></telerik:EditorTool>
                                                    <telerik:EditorTool Name="InsertLink"></telerik:EditorTool>
                                                    <telerik:EditorTool Name="AjaxSpellCheck"></telerik:EditorTool>
                                                </telerik:EditorToolGroup>
                                            </Tools>
                                        </telerik:RadEditor>
                                    </div>
                                </div>

                                <div class="row">
                                </div>
                            </ItemTemplate>
                        </telerik:RadDataForm>

                        <h4 class="form-section pt-3">Mutations</h4>
                        <asp:HiddenField runat="server" ID="hdn_CHR" />
                        <asp:HiddenField runat="server" ID="hdn_START" />
                        <asp:HiddenField runat="server" ID="hdn_END" />
                        <asp:HiddenField runat="server" ID="hdn_Ref" />
                        <asp:HiddenField runat="server" ID="hdn_ALT" />
                        <asp:HiddenField runat="server" ID="hdn_RowID_In_EditMODE" />
                        <asp:HiddenField runat="server" ID="hdn_RCB_Classification_Value" />
                        <asp:HiddenField runat="server" ID="hdn_RCB_INHERITANCE_Value" />
                        <asp:HiddenField runat="server" ID="hdn_RCB_Disease_Value" />

                        <telerik:RadGrid RenderMode="Lightweight" ID="RG_Report_Mutations" runat="server" PageSize="10"
                            RetainExpandStateOnRebind="True" CellPadding="0" AllowPaging="True" DataSourceID="DS_Report" OnItemCommand="RG_Report_Mutations_ItemCommand" AllowAutomaticDeletes="true"
                            AutoGenerateColumns="False" Width="100%" Font-Size="Small" OnItemDataBound="RG_Report_Mutations_ItemDataBound" RefannosolvedRenderMode="Classic">
                            <MasterTableView Name="Master" TableLayout="Fixed" DataSourceID="DS_Report" EditMode="InPlace" ClientDataKeyNames="ReportID,CHR,START,END,Ref,ALT,InWhichOneExists" DataKeyNames="ReportID,CHR,START,END,Ref,ALT">
                                <Columns>
                                    <telerik:GridTemplateColumn UniqueName="Mutation">
                                        <HeaderStyle Width="40" CssClass="none-top-bottom-padding-header-sample" />
                                        <ItemStyle Width="40" />
                                        <ItemTemplate>
                                            <asp:HiddenField runat="server" ID="hdn_InWhichOneExists" Value='<%# Bind("InWhichOneExists") %>' />

                                            <asp:Image ID="img_Female" Width="15px" runat="server" CssClass="padding" />
                                            <asp:Image ID="img_Male" Width="15px" runat="server" CssClass="padding" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridBoundColumn DataField="CHR" FilterControlAltText="Filter CHR column" HeaderText="CHR" SortExpression="CHR" UniqueName="CHR" ReadOnly="true">
                                        <HeaderStyle Width="45" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="45" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="START" FilterControlAltText="Filter START column" HeaderText="START" SortExpression="START" UniqueName="START" ReadOnly="true">
                                        <HeaderStyle Width="77" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="77" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="END" FilterControlAltText="Filter END column" HeaderText="END" SortExpression="END" UniqueName="END" ReadOnly="true">
                                        <HeaderStyle Width="78" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="78" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Ref" FilterControlAltText="Filter Ref column" HeaderText="Ref" SortExpression="Ref" UniqueName="Ref" ReadOnly="true">
                                        <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Wrap="true"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ALT" FilterControlAltText="Filter ALT column" HeaderText="ALT" SortExpression="ALT" UniqueName="ALT" ReadOnly="true">
                                        <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Wrap="true"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ReportID" Visible="false" ReadOnly="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn UniqueName="Classification" HeaderText="Classification"
                                        SortExpression="Classification">
                                        <HeaderStyle Width="150px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="150px" VerticalAlign="Middle" HorizontalAlign="Center" Wrap="true"></ItemStyle>
                                        <ItemTemplate>
                                            <telerik:RadLabel runat="server" ID="lbl_Classification" Text='<%#DataBinder.Eval(Container.DataItem, "Classification")%>' ToolTip="Edit Classification"></telerik:RadLabel>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox RenderMode="Lightweight" runat="server" ID="RCB_Classification" DataTextField="Final_ClASSIFICATION_text" OnClientSelectedIndexChanged="RCB_Classification_ChangeIndex"
                                                HighlightTemplatedItems="true" Height="140px" DropDownWidth="200px" AutoPostBack="true" EmptyMessage="Select a Item" OnClientLoad="RCB_Classification_OnClientLoadHandler" Width="100%" OnClientDropDownClosed="RCB_Classification_DDClosed">
                                                <Items>
                                                    <telerik:RadComboBoxItem runat="server" Text="Benign" ImageUrl="~/img/clinvar/Benign.png" />
                                                    <telerik:RadComboBoxItem runat="server" Text="Likely Benign" ImageUrl="~/img/clinvar/Likely Benign.png" />
                                                    <telerik:RadComboBoxItem runat="server" Text="Likely Pathogenic" ImageUrl="~/img/clinvar/Likely Pathogenic.png" />
                                                    <telerik:RadComboBoxItem runat="server" Text="Pathogenic" ImageUrl="~/img/clinvar/Pathogenic.png" />
                                                    <telerik:RadComboBoxItem runat="server" Text="Uncertain significance" ImageUrl="~/img/clinvar/Uncertain significance.png" />
                                                </Items>
                                            </telerik:RadComboBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Inheritance" HeaderText="Inheritance"
                                        SortExpression="Inheritance">
                                        <HeaderStyle Width="150px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="150px" VerticalAlign="Middle" HorizontalAlign="Center" Wrap="true"></ItemStyle>
                                        <ItemTemplate>
                                            <telerik:RadLabel runat="server" ID="lbl_Inheritance" Text='<%#DataBinder.Eval(Container.DataItem, "Inheritance")%>' ToolTip="Edit Inheritance"></telerik:RadLabel>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <div style="display: flex; flex-direction: row; justify-content: flex-end;">
                                                <telerik:RadComboBox RenderMode="Lightweight" runat="server" ID="RCB_Inheritance" EnableLoadOnDemand="True" OnClientTextChange="tttt"
                                                    OnClientSelectedIndexChanged="RCB_INHERITANCE_ChangeIndex" OnClientLoad="RCB_Inheritance_OnClientLoadHandler" EmptyMessage="Select a Item"
                                                    HighlightTemplatedItems="true" Height="140px" DropDownWidth="250px" Width="100%" AutoPostBack="true" OnClientDropDownClosed="RCB_Inheritance_DDClosed">
                                                    <Items>
                                                        <telerik:RadComboBoxItem runat="server" Text="Autosomal dominant" ImageUrl="~/img/Rep/Autosomal dominant.png" />
                                                        <telerik:RadComboBoxItem runat="server" Text="De novo" ImageUrl="~/img/Rep/De novo.png" />
                                                        <telerik:RadComboBoxItem runat="server" Text="Recessive" ImageUrl="~/img/Rep/Recessive.png" />
                                                        <telerik:RadComboBoxItem runat="server" Text="X-linked" ImageUrl="~/img/Rep/X-linked.png" />
                                                        <telerik:RadComboBoxItem runat="server" Text="Compount het" ImageUrl="~/img/Rep/Compount het.png" />
                                                        <telerik:RadComboBoxItem runat="server" Text="Other" />
                                                    </Items>
                                                </telerik:RadComboBox>

                                            </div>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Disease" HeaderText="Disease" SortExpression="Disease">
                                        <HeaderStyle Width="150px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="150px" VerticalAlign="Middle" HorizontalAlign="Center" Wrap="true"></ItemStyle>
                                        <ItemTemplate>
                                            <telerik:RadLabel runat="server" ID="lbl_Disease" Text='<%#DataBinder.Eval(Container.DataItem, "Disease")%>' ToolTip="Edit Disease"></telerik:RadLabel>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <div style="display: flex; flex-direction: row; justify-content: flex-end;">
                                                <telerik:RadComboBox RenderMode="Lightweight" runat="server" ID="RCB_Disease" EnableLoadOnDemand="True" OnItemsRequested="RCB_Disease_ItemsRequested"
                                                    DataTextField="Disease" DataValueField="Disease" DropDownWidth="400px" OnClientSelectedIndexChanged="RCB_Disease_ChangeIndex" OnClientDropDownClosed="RCB_Disease_DDClosed"
                                                    HighlightTemplatedItems="true" Height="140px" AutoPostBack="true" Width="100%">
                                                    <ItemTemplate>
                                                        <%# DataBinder.Eval(Container, "Attributes['Disease']")%>
                                                    </ItemTemplate>
                                                </telerik:RadComboBox>

                                                <telerik:RadButton runat="server" ID="btn_Disease_CANCLE" OnClick="btn_CANCLE_Edit_Click" Width="15px" Height="15px" BackColor="#E6E6E6" BorderStyle="None" AutoPostBack="true" ToolTip="Cancel">
                                                    <Icon PrimaryIconUrl="../../img/icon/icon_test_no_selected.png" />
                                                </telerik:RadButton>

                                            </div>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Mutation_Desc" HeaderText="Mutation Description" EditFormHeaderTextFormat="">
                                        <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_Mutatation_Desc" CssClass="text" runat="server" Text='<%# Eval("Mutation_Desc_Note") %>' ToolTip="Edit Mutation Description"></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn DataType="System.int32" DataField="Diagnosis_Type" UniqueName="Diagnosis_Type" Groupable="False" EnableHeaderContextMenu="false"
                                         FilterControlAltText="Filter Mutation_Type column" >
                                        <HeaderTemplate>
                                            <table id="Table1">
                                                <tr style="border-bottom:1px solid">
                                                    <td colspan="3">   Diag. Type   </td>
                                                </tr>
                                                <tr>
                                                    <td>  P  </td> 
                                                    <td> SM </td>
                                                    <td> SC </td>
                                                </tr>
                                            </table>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:HiddenField runat="server" ID="hdn_Diagnosis_Type" Value='<%# Bind("Diagnosis_Type") %>' />
                                            <asp:ImageButton ID="Primary_Mutation" CommandName="PrimaryMutation" ImageUrl="/img/icon/icon_Report_Mutation_Unselected.png" BorderWidth="0px" ToolTip="Primary Mutation" runat="server" Width="20px"></asp:ImageButton>
                                            <asp:ImageButton ID="Secondary_Monogenic_Mutation" CommandName="SecondaryMonogenicMutation" ImageUrl="/img/icon/icon_Report_Mutation_Unselected.png" BorderWidth="0px" ToolTip="Monogenic Mutation" runat="server" Width="20px"></asp:ImageButton>
                                            <asp:ImageButton ID="Secondary_Carrier_Mutation" CommandName="SecondaryCarrierMutation" ImageUrl="/img/icon/icon_Report_Mutation_Unselected.png" BorderWidth="0px" ToolTip="Carrier Mutation" runat="server" Width="20px"></asp:ImageButton>
                                        </ItemTemplate>
                                        <ItemStyle Width="90px"  />
                                        <HeaderStyle Width="90px"/>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="GoToMutaionInfo" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                        <HeaderStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="60px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="Sanger" BorderWidth="0px" ImageUrl="../../img/Rep/4Peaks.png" Width="30px" Height="30px" CommandName="GoToDrawSanger"
                                                runat="server" ToolTip="Sanger"></asp:ImageButton>
                                            <asp:ImageButton ID="GoToMutaionInfo" BorderWidth="0px" ImageUrl="../../img/icon/icons_Report_Detail.png" Width="30px" Height="30px" CommandName="GoToMutaionInfo"
                                                runat="server" ToolTip="Mutation Information"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Delete">
                                        <HeaderStyle Width="20px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="20px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:ImageButton ID="Delete" BorderWidth="0px" ImageUrl="~/img/icon/icons_Report_Delete.png" Width="25px" Height="25px" CommandName="Delete"
                                                runat="server" ToolTip="Delete"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                                <ItemStyle Height="25px" />
                            </MasterTableView>
                            <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                            <ClientSettings EnablePostBackOnRowClick="false">
                                <Scrolling UseStaticHeaders="True" />
                                <ClientEvents OnCellSelected="cellSelected" OnGridCreated="gridCreated"></ClientEvents>
                                <Selecting CellSelectionMode="SingleCell" AllowRowSelect="false"></Selecting>

                            </ClientSettings>
                            <FilterMenu RenderMode="Lightweight"></FilterMenu>
                            <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>

                        </telerik:RadGrid>

                    </div>
                    <asp:Label runat="server" class="lbl_Bg_Grid" Text="To edit each item click on the corresponding cell"></asp:Label>
                </form>
            </div>
        </div>
    </div>
</div>

<asp:HiddenField ID="Txt_PVal" runat="server" />
<asp:HiddenField ID="Pedigree_base64" runat="server" />
<script src="../../assets/js/go.js"></script>

<div id="myDiagramDiv" style="border: solid 0px; width: 700px; visibility: hidden">
</div>
<asp:Button runat="server" ID="save_pedigree" Style="display: none;" OnClick="save_pedigree_Click" />

<telerik:RadWindowManager ID="RadWindowManager2" ShowContentDuringLoad="true" RenderMode="Lightweight" ReloadOnShow="true" runat="server" EnableShadow="true"
    Skin="Windows7" VisibleTitlebar="true" VisibleStatusbar="true" Behaviors="Close">
    <Windows>
        <telerik:RadWindow ID="RadWindow2" VisibleTitlebar="false" runat="server" RenderMode="Lightweight" BorderStyle="None" BorderWidth="1px" OnClientClose="refreshGrid" CssClass="px-0 py-0" Modal="true">
        </telerik:RadWindow>

        <telerik:RadWindow ID="RadWindow1" runat="server" RenderMode="Lightweight" BorderStyle="None" BorderWidth="1px" OnClientClose="refreshGrid" CssClass="px-0 py-0" Modal="true"
            Width="863" Height="650">
        </telerik:RadWindow>
    </Windows>
</telerik:RadWindowManager>

<asp:SqlDataSource runat="server" ID="DS_Report" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_GAP_Report_Items_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="ReportID" SessionField="Curr_ReportID" Type="Int64" />
         <asp:SessionParameter Name="Report_Version" SessionField="Curr_Report_version" Type="Int64" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource runat="server" ID="DA_RAF_ReportInfo" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_GAP_Report_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="ReportID" SessionField="Curr_ReportID" Type="Int64" />
    </SelectParameters>
</asp:SqlDataSource>


<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
    <script>
        function MessageTo_User_onclientLoad(editor, args) {
            if (editor.get_text() == "") {
                editor.set_html('');
                var style = editor.get_contentArea().style;
                style.color = "darkgray";
            }

        }

        function MessageTo_PI_onclientLoad(editor, args) {
            if (editor.get_text() == "") {
                editor.set_html('');
                var style = editor.get_contentArea().style;
                style.color = "darkgray";
            }

        }

        function RCB_Classification_DDClosed(sender, eventArgs) {
            var grid = $find("<%=RG_Report_Mutations.ClientID %>");
            var masterTable = grid.get_masterTableView();
            masterTable.fireCommand(("end"));

        }

        function RCB_Disease_DDClosed(sender, eventArgs) {
            var grid = $find("<%=RG_Report_Mutations.ClientID %>");
            var masterTable = grid.get_masterTableView();
            masterTable.fireCommand(("end"));

        }

        function RCB_Inheritance_DDClosed(sender, eventArgs) {
            var grid = $find("<%=RG_Report_Mutations.ClientID %>");
            var masterTable = grid.get_masterTableView();
            masterTable.fireCommand(("end"));

        }

        function RCB_Disease_ChangeIndex(sender, eventArgs) {
            var RCB_Disease_item = eventArgs.get_item();
            var comboText = sender.get_text();
            var RCB_Disease_Value = RCB_Disease_item.get_text();
            document.getElementById("<%= hdn_RCB_Disease_Value.ClientID %>").value = RCB_Disease_Value;
            var grid = $find("<%=RG_Report_Mutations.ClientID %>");
            var masterTable = grid.get_masterTableView();
            $telerik.$.grep(masterTable.get_dataItems(), function (item, index) {
                if ($telerik.$.contains(item.get_element(), sender.get_element()) == true) {
                    document.getElementById("<%= hdn_CHR.ClientID %>").value = item.getDataKeyValue("CHR");
                    document.getElementById("<%= hdn_START.ClientID %>").value = item.getDataKeyValue("START");
                    document.getElementById("<%= hdn_END.ClientID %>").value = item.getDataKeyValue("END");
                    document.getElementById("<%= hdn_Ref.ClientID %>").value = item.getDataKeyValue("Ref");
                    document.getElementById("<%= hdn_ALT.ClientID %>").value = item.getDataKeyValue("ALT");
                    masterTable.fireCommand(("Edit", "Update_Disease"));
                }
            });
        }
        function tttt(sender, eventArgs) {
            var grid = $find("<%=RG_Report_Mutations.ClientID%>").get_masterTableView();
            var RCB_INHERITANCE_item = eventArgs.get_item();

            var RCB_INHERITANCE_Value = RCB_INHERITANCE_item.get_text();

            document.getElementById("<%= hdn_RCB_INHERITANCE_Value.ClientID %>").value = RCB_INHERITANCE_Value;
            var grid = $find("<%=RG_Report_Mutations.ClientID %>");
            var masterTable = grid.get_masterTableView();
            $telerik.$.grep(masterTable.get_dataItems(), function (item, index) {
                if ($telerik.$.contains(item.get_element(), sender.get_element()) == true) {
                    document.getElementById("<%= hdn_CHR.ClientID %>").value = item.getDataKeyValue("CHR");
                    document.getElementById("<%= hdn_START.ClientID %>").value = item.getDataKeyValue("START");
                    document.getElementById("<%= hdn_END.ClientID %>").value = item.getDataKeyValue("END");
                    document.getElementById("<%= hdn_Ref.ClientID %>").value = item.getDataKeyValue("Ref");
                    document.getElementById("<%= hdn_ALT.ClientID %>").value = item.getDataKeyValue("ALT");

                    masterTable.fireCommand(("Edit", "Update_INHERITANCE"));
                }
            });

        }

        function RCB_INHERITANCE_ChangeIndex(sender, eventArgs) {
            var grid = $find("<%=RG_Report_Mutations.ClientID%>").get_masterTableView();
            var RCB_INHERITANCE_item = eventArgs.get_item();

            var RCB_INHERITANCE_Value = RCB_INHERITANCE_item.get_text();

            document.getElementById("<%= hdn_RCB_INHERITANCE_Value.ClientID %>").value = RCB_INHERITANCE_Value;
            var grid = $find("<%=RG_Report_Mutations.ClientID %>");
            var masterTable = grid.get_masterTableView();
            $telerik.$.grep(masterTable.get_dataItems(), function (item, index) {
                if ($telerik.$.contains(item.get_element(), sender.get_element()) == true) {
                    document.getElementById("<%= hdn_CHR.ClientID %>").value = item.getDataKeyValue("CHR");
                    document.getElementById("<%= hdn_START.ClientID %>").value = item.getDataKeyValue("START");
                    document.getElementById("<%= hdn_END.ClientID %>").value = item.getDataKeyValue("END");
                    document.getElementById("<%= hdn_Ref.ClientID %>").value = item.getDataKeyValue("Ref");
                    document.getElementById("<%= hdn_ALT.ClientID %>").value = item.getDataKeyValue("ALT");

                    masterTable.fireCommand(("Edit", "Update_INHERITANCE"));
                }
            });

        }

        function RCB_Classification_ChangeIndex(sender, eventArgs) {
            var grid = $find("<%=RG_Report_Mutations.ClientID%>").get_masterTableView();

            var RCB_Classification_item = eventArgs.get_item();
            console.log(RCB_Classification_item);
            var RCB_Classification_Value = RCB_Classification_item.get_text();

            document.getElementById("<%= hdn_RCB_Classification_Value.ClientID %>").value = RCB_Classification_Value;
            var grid = $find("<%=RG_Report_Mutations.ClientID %>");
            var masterTable = grid.get_masterTableView();
            $telerik.$.grep(masterTable.get_dataItems(), function (item, index) {
                if ($telerik.$.contains(item.get_element(), sender.get_element()) == true) {
                    document.getElementById("<%= hdn_CHR.ClientID %>").value = item.getDataKeyValue("CHR");
                    document.getElementById("<%= hdn_START.ClientID %>").value = item.getDataKeyValue("START");
                    document.getElementById("<%= hdn_END.ClientID %>").value = item.getDataKeyValue("END");
                    document.getElementById("<%= hdn_Ref.ClientID %>").value = item.getDataKeyValue("Ref");
                    document.getElementById("<%= hdn_ALT.ClientID %>").value = item.getDataKeyValue("ALT");

                    masterTable.fireCommand(("Edit", "Update_Classification"));
                }
            });

        }
        function OpenWin_MutationDetails() {

            var oWnd = radopen("/GAP/MutationDetails.aspx", "RadWindow2");
            var h = $(document).height();
            var w = $(document).width();
            oWnd.set_height(1000);
            oWnd.set_width(0.90 * w);
            oWnd.center();

        }
        function OpenWinMutation_Desc() {

            var oWnd = radopen("/GAP/Report_Mutation_Description.aspx", "RadWindow2");
            oWnd.set_height(470);
            oWnd.set_width(1000);
            oWnd.center();
            oWnd.set_modal(true);

        }

        function refreshGrid(sender, eventArgs) {
            var grid = $find("<%=RG_Report_Mutations.ClientID%>").get_masterTableView();
            grid.rebind();
        }
        var grid;
        function gridCreated(sender) {
            grid = sender;
        }
        function cellSelected(sender, args) {
            if (document.getElementById("<%= hdn_Disable_CellClicking.ClientID %>").value != "2" && '<%= Session["Report_Status"] %>' != "2" && '<%=  Session["Report_Updated"]  %>' == "1") {
                var CHR = args.get_gridDataItem().getDataKeyValue("CHR");
                var START = args.get_gridDataItem().getDataKeyValue("START");
                var END = args.get_gridDataItem().getDataKeyValue("END");
                var Ref = args.get_gridDataItem().getDataKeyValue("Ref");
                var ALT = args.get_gridDataItem().getDataKeyValue("ALT");

                var masterTable = sender.get_masterTableView();
                var Name_Col = args.get_column().get_uniqueName();
                var Rows = masterTable.get_dataItems();
                for (var i = 0; i < Rows.length; i++) {
                    var Curr_row = Rows[i];
                    if (Curr_row.get_element().cells[1].innerHTML == CHR
                        && Curr_row.get_element().cells[2].innerHTML == START
                        && Curr_row.get_element().cells[3].innerHTML == END
                        && Curr_row.get_element().cells[4].innerHTML == Ref
                        && Curr_row.get_element().cells[5].innerHTML == ALT) {
                        document.getElementById("<%= hdn_RowID_In_EditMODE.ClientID %>").value = i;

                    }
                }

                masterTable.fireCommand(("Edit", Name_Col));
            }

        }

        function RCB_Classification_OnClientLoadHandler(sender) {

            sender.get_inputDomElement().readOnly = "readonly";
        }
        function RCB_Inheritance_OnClientLoadHandler(sender) {

            sender.get_inputDomElement().readOnly = "readonly";
        }

        function openWin() {
            var h = $(document).height();
            var w = $(document).width();
            var oWnd = radopen("/GAP/Rep/ClinicalReport_Print_Telerik.aspx", "RadWindow1");
            oWnd.center();
            oWnd.set_modal(true);
        }


        var myDiagram;

        function init() {
            // if (window.goSamples) goSamples();  // init for these samples -- you don't need to call this
            var projectDiagramDiv = document.getElementById("myDiagramDiv");
            projectDiagramDiv.style.height = "700px";
            var projectDiagram = go.Diagram.fromDiv(projectDiagramDiv);
            if (projectDiagram) {
                projectDiagram.div = null;
            }
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

            var Base64 = document.getElementById('<%= Pedigree_base64.ClientID%>');
            Base64.value = myDiagram.makeImageData({
                scale: 1,
                size: new go.Size(NaN, NaN),
                background: "rgba(255, 255, 255)"
            });
            document.getElementById("<%= save_pedigree.ClientID %>").click();

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

        function OpenWinSanger() {
            var oWnd = radopen("Sanger.aspx", "RadWindow2");
            oWnd.center();
            var h = $(document).height();
            var w = $(document).width();
            oWnd.set_height(850);
            oWnd.set_width(0.90 * w);
            oWnd.set_modal(true);

        }
        // end GenogramLayout class
        ///////////////////////////////////////////////////////////////// GOJS

    </script>
</telerik:RadCodeBlock>

