<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Edit_UserPanelList.ascx.cs" Inherits="WebGAP.GAP.Popup.uc_Edit_UserPanelList" %>


<style>
    .RadComboBox_MetroTouch, .RadMultiPage, .RadListBox .rlbList {
        font-size: 12px !important;
    }

    .RadComboBox_MetroTouch {
        padding-left: 10px;
    }

    .col-12 {
        max-width: 99%;
        margin: 0 auto;
    }

    .RadComboBox_Metro .rcbInpu {
        height: 25px
    }

    .RadUpload_Bootstrap .ruButton {
        width: 85px
    }

    .btn_finish {
        border: 1px solid #ccc;
        border-radius: 3px;
        background: white;
        padding-top: 4px;
        height: 32px;
    }

    form .form-actionspopup {
        border: none !important;
        position: absolute;
        top: 5px;
        right: 15px;
    }

    .borderbottom {
        border-bottom: 1px solid #ddd;
        width: 100%
    }

    .RadTabStripTop_Bootstrap .rtsLevel1 .rtsUL {
        border-bottom-width: 0;
    }

    span.RadButton_Bootstrap {
        font-size: 12px !important;
    }

    .rcbReadOnly, .rcbInputCell {
        height: 27px !important
    }

    .RadTabStrip_Bootstrap .rtsLink {
        color: #25A0DA;
        background-color: #dedede;
    }

    .p-l-20 {
        padding-left: 20px;
    }

    .txt_fileupload {
        width: 115px;
        float: left;
        padding-top: 8px;
    }
    .rbPrimary{
        cursor:pointer !important;
    }
</style>

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>

      <telerik:AjaxSetting AjaxControlID="RLB_TrainingGenes">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_TrainingGenes" />
                <%--<telerik:AjaxUpdatedControl ControlID="RB_Submit" />--%>
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="Btn_Add_TrainingGene_Gens">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Btn_Add_TrainingGene_Gens" />
                <telerik:AjaxUpdatedControl ControlID="RLB_TrainingGenes" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RC_TrainingGene_Gens">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RC_TrainingGene_Gens" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="Opt_TrG_Chr_FChr">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Opt_TrG_Chr_FChr" />
                <telerik:AjaxUpdatedControl ControlID="Pnl_TG_Chr" LoadingPanelID="RadAjaxLoadingPanel1" />

            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="Opt_TrG_Chr_CChr">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Opt_TrG_Chr_CChr" />
                <telerik:AjaxUpdatedControl ControlID="Pnl_TG_Chr" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="Opt_TrG_Chr_BChr">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Opt_TrG_Chr_BChr" />
                <telerik:AjaxUpdatedControl ControlID="Pnl_TG_Chr" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="CB_Chromosome">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="CB_Chromosome" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RC_TraG_ChrBand" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="Btn_Add_TrainingGene_ChrCoordinates">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Btn_Add_TrainingGene_ChrCoordinates" />
                <telerik:AjaxUpdatedControl ControlID="RLB_TrainingGenes" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RC_TraG_ChrBand">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RC_TraG_ChrBand" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="Btn_Add_CanG_ChrCoordinates">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Btn_Add_CanG_ChrCoordinates" />
                <telerik:AjaxUpdatedControl ControlID="RLB_Candidates" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RC_TrainingGen_GOTerms">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RC_TrainingGen_GOTerms" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="Btn_Add_TrainingGene_GOTerm">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Btn_Add_TrainingGene_GOTerm" />
                <telerik:AjaxUpdatedControl ControlID="RLB_TrainingGenes" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="RC_TrainingGen_OMIMTerms">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RC_TrainingGen_OMIMTerms" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="Btn_Add_TrainingGen_OMIMTerms">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Btn_Add_TrainingGen_OMIMTerms" />
                <telerik:AjaxUpdatedControl ControlID="RLB_TrainingGenes" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="Btn_Add_TrainingGen_File">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Btn_Add_TrainingGen_File" />
                <telerik:AjaxUpdatedControl ControlID="lblFileRecord" />
                <telerik:AjaxUpdatedControl ControlID="RLB_TrainingGenes" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RB_Submit">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RB_Submit" />

            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>


<div class="content-body pt-1">
    <section id="basic-form-layouts">
        <div class="row match-height">
            <div class="col-12">

                <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" CssClass="multiPage"
                    Width="100%">
                    <telerik:RadPageView ID="RadPageView1" runat="server">
                        <div class="row col-12 pt-1">
                            <telerik:RadTabStrip runat="server" ID="RTS_TrainingGene" SelectedIndex="0" MultiPageID="RMP_TrainingGene" CssClass="borderbottom">
                                <Tabs>

                                    <telerik:RadTab Text="Chromosome regions">
                                    </telerik:RadTab>
                                    <telerik:RadTab Text="Gene" Selected="True">
                                    </telerik:RadTab>
                                    <telerik:RadTab Text="Gene Ontology">
                                    </telerik:RadTab>
                                    <telerik:RadTab Text="OMIM">
                                    </telerik:RadTab>
                                    <telerik:RadTab Text="Upload files">
                                    </telerik:RadTab>
                                </Tabs>
                            </telerik:RadTabStrip>
                            <telerik:RadMultiPage runat="server" ID="RMP_TrainingGene" SelectedIndex="0" Width="100%"
                                CssClass="multiPage">
                                <telerik:RadPageView runat="server" ID="RPW_P1" CssClass="corporatePageView">
                                    <table style="background: #eaeaea; width: 100%; border-bottom: 1px solid #ddd">
                                        <tr>
                                            <td>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="padding-left: 20px;">
                                                            <i class="fa fa-filter"></i>Filter by:
                                                        </td>
                                                        <td>
                                                            <telerik:RadButton ID="Opt_TrG_Chr_FChr" runat="server" Text="Full chromosome" Value="0"
                                                                ButtonType="ToggleButton" ToggleType="Radio" Checked="true" AutoPostBack="true"
                                                                GroupName="Opt_TrG_Chr_Group">
                                                            </telerik:RadButton>
                                                        </td>
                                                        <td>
                                                            <telerik:RadButton ID="Opt_TrG_Chr_CChr" runat="server" Value="1" Text="Chromosomal coordinates"
                                                                ButtonType="ToggleButton" ToggleType="Radio" AutoPostBack="true" GroupName="Opt_TrG_Chr_Group">
                                                            </telerik:RadButton>
                                                        </td>
                                                        <td>
                                                            <telerik:RadButton ID="Opt_TrG_Chr_BChr" runat="server" Value="2" Text="Chromosomal band"
                                                                ButtonType="ToggleButton" ToggleType="Radio" AutoPostBack="true" GroupName="Opt_TrG_Chr_Group">
                                                            </telerik:RadButton>
                                                        </td>
                                                        <td style="width: 10px"></td>
                                                        <td>
                                                            <a id="B99" title="<p style=&quot;text-align: left&quot;><b>Current genome builds:</b> <br><b>-Homo sapiens:</b>   hg19 (GRCh37), hg38 (GRCh38)</p>"
                                                                href="#">
                                                                <asp:Image ID="Image8" runat="server" Height="20px" ImageUrl="~/img/icon-info-red.png"
                                                                    Width="20px" /></a>

                                                            <telerik:RadToolTip runat="server" ID="RadToolTip2" Height="100px" Width="300px"
                                                                AutoCloseDelay="0" IsClientID="true" TargetControlID="B99" Position="TopCenter"
                                                                RelativeTo="Element">
                                                            </telerik:RadToolTip>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Panel ID="Pnl_TG_Chr" runat="server">
                                                    <table>
                                                        <tr>

                                                            <td style="padding-left: 20px;">
                                                               <telerik:RadComboBox ID="CB_Chromosome" runat="server" Skin="Metro" Label="Choose chromosome:" DataSourceID="SDS_Population_Chromosome"
                                                                    Width="50px" Height="150px" AutoPostBack="true" DataTextField="chrorder" DataValueField="length"
                                                                    EnableVirtualScrolling="true" Enabled="true" OnClientDropDownOpening="CB_Chromosome_DropDownOpening">
                                                                </telerik:RadComboBox>
                                                            </td>
                                                            <td style="width: 10px; text-align: center">
                                                                <i class="fa fa-ellipsis-v"></i>
                                                            </td>
                                                            <td>

                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <telerik:RadNumericTextBox ID="Txt_TraG_StartPos" runat="server" Label="Start position:" Style="top: 0px; left: 0px; margin-bottom: 5px;"
                                                                                Enabled="true" DataType="System.Int64" Width="260px" Height="30px" LabelWidth="90px" Skin="Metro">
                                                                                <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                                                                <ClientEvents OnValueChanged="Txt_TraG_StartPos_KeyPress" />
                                                                            </telerik:RadNumericTextBox>
                                                                        </td>
                                                                        <td>
                                                                            <telerik:RadNumericTextBox ID="Txt_TraG_EndPos" runat="server" Label="End position:" Style="top: 0px; left: 10px; margin-bottom: 5px; padding-left: 8px"
                                                                                Enabled="true" DataType="System.Int64" Width="240px" Height="30px" LabelWidth="90px" Skin="Metro">
                                                                                <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                                                                <ClientEvents OnValueChanged="Txt_TraG_EndPos_KeyPress" OnValueChanging="Txt_TraG_EndPos_KeyPress" />
                                                                            </telerik:RadNumericTextBox>

                                                                        </td>
                                                                    </tr>
                                                                </table>


                                                            </td>
                                                            <td style="width: 10px; text-align: center">
                                                                <i class="fa fa-ellipsis-v"></i>
                                                            </td>
                                                            <td>
                                                                <telerik:RadComboBox ID="RC_TraG_ChrBand" runat="server" Label="Choose band:" Skin="Metro"
                                                                    Width="120px" AutoPostBack="false" EnableLoadOnDemand="true" ShowMoreResultsBox="true" EnableVirtualScrolling="true"
                                                                    Enabled="true" OnClientDropDownOpening="RC_TraG_ChrBand_DropDownOpening" OnItemsRequested="RC_TraG_ChrBand_ItemsRequested" >
                                                                </telerik:RadComboBox>
                                                            </td>
                                                            <td style="width: 10px; text-align: center">
                                                                <i class="fa fa-ellipsis-v"></i>
                                                            </td>
                                                            <td style="text-align: right">
                                                                <telerik:RadButton ID="Btn_Add_TrainingGene_ChrCoordinates" runat="server" Text="ADD" Style="top: 0px; left: 0px; margin-bottom: 8px; border: 1px solid #ddd; background: #fff; border-radius: 5px; font-size: 12px; margin-top: 5px"
                                                                    AutoPostBack="true" Width="80px" Height="27px" OnClientClicked="Btn_Add_TrainingGene_ChrCoordinates_Clicked" Skin="Material" OnClick="Btn_Add_TrainingGene_ChrCoordinates_Click" >
                                                                    <Icon PrimaryIconCssClass="rbAdd" PrimaryIconLeft="9" PrimaryIconTop="5"></Icon>
                                                                </telerik:RadButton>
                                                            </td>

                                                        </tr>
                                                    </table>
                                                </asp:Panel>

                                            </td>
                                        </tr>
                                    </table>
                                </telerik:RadPageView>
                                <telerik:RadPageView runat="server" ID="RPW_P2" CssClass="corporatePageView">
                                    <table style="background: #eaeaea; width: 100%; border-bottom: 1px solid #ddd">
                                        <tr>
                                            <td colspan="2">
                                                <br />
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                               <%-- <telerik:RadComboBox ID="RC_TrainingGene_Gens" runat="server" Skin="Metro" Label="Choose gene:" CssClass="p-l-20"
                                                    Width="400px" Height="200px" AutoPostBack="true" EnableLoadOnDemand="True" ShowMoreResultsBox="true"
                                                    EnableVirtualScrolling="true" OnItemsRequested="RC_TrainingGene_Gens_ItemsRequested" 
                                                    OnClientDropDownOpening="RC_TrainingGene_Gens_DropDownOpening">
                                                </telerik:RadComboBox>--%>
                                    <telerik:RadComboBox ID="RC_TrainingGene_Gens" RenderMode="Lightweight" runat="server" Skin="MetroTouch" CssClass="p-l-20" DataSourceID="Gene"
                                        Label="Choose a Gene:" Width="600px" Height="200px" AutoPostBack="true" EnableAutomaticLoadOnDemand="True" 
                                        ShowMoreResultsBox="true" EnableVirtualScrolling="true" DataTextField="GDesc" DataValueField="entrez_id" 
                                        LoadingMessage="Loading..." ShowWhileLoading="true" ItemsPerRequest="5" Filter="Contains" OnClientDropDownOpening="RC_TrainingGene_Gens_DropDownOpening">
                                        <%--OnClientDropDownOpening="RC_Gene_DropDownOpening"--%>
                                    </telerik:RadComboBox>
                                            </td>
                                            <td style="width: 10px; text-align: center">
                                                <i class="fa fa-ellipsis-v"></i>
                                            </td>
                                            <td>
                                                <telerik:RadButton ID="Btn_Add_TrainingGene_Gens" runat="server" Text="ADD" AutoPostBack="true" Skin="Material"
                                                    OnClientClicked="Btn_Add_TrainingGene_Gens_Clicked" OnClick="Btn_Add_TrainingGene_Gens_Click"
                                                    Width="80px" Height="27px" Style="top: 0px; left: 0px; margin-bottom: 8px; font-size: 12px; margin-top: 5px; border: 1px solid #ddd; background: #fff; border-radius: 5px">
                                                    <Icon PrimaryIconCssClass="rbAdd" PrimaryIconLeft="9" PrimaryIconTop="5"></Icon>
                                                </telerik:RadButton>
                                            </td>
                                        </tr>
                                    </table>
                                </telerik:RadPageView>
                                <telerik:RadPageView runat="server" ID="RPW_P3" CssClass="corporatePageView">
                                    <table style="background: #eaeaea; width: 100%; border-bottom: 1px solid #ddd">
                                        <tr>
                                            <td colspan="2">
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                               <%-- <telerik:RadComboBox ID="RC_TrainingGen_GOTerms" runat="server" Skin="Metro" Label="Choose a GO term:" CssClass="p-l-20"
                                                    Width="400px" Height="200px" AutoPostBack="true" EnableLoadOnDemand="True" ShowMoreResultsBox="false"
                                                    EnableVirtualScrolling="true" OnItemsRequested="RC_TrainingGen_GOTerms_ItemsRequested"
                                                    OnClientDropDownOpening="RC_TrainingGen_GOTerms_DropDownOpening" MarkFirstMatch="true" ItemsPerRequest="10" > 
                                                </telerik:RadComboBox>--%>

                                   <telerik:RadComboBox ID="RC_TrainingGen_GOTerms" RenderMode="Lightweight" runat="server" Skin="MetroTouch" CssClass="p-l-20" DataSourceID="GOTerms"
                                        Label="Choose a GO term:" Width="600px" Height="200px" AutoPostBack="true" EnableAutomaticLoadOnDemand="True" 
                                        ShowMoreResultsBox="true" EnableVirtualScrolling="true" DataTextField="godesc" DataValueField="GO_ID"  OnClientDropDownOpening="RC_TrainingGen_GOTerms_DropDownOpening"
                                        LoadingMessage="Loading..." ShowWhileLoading="true" ItemsPerRequest="5" Filter="Contains">
                                        <%--OnClientDropDownOpening="RC_Gene_DropDownOpening"--%>
                                    </telerik:RadComboBox>
                                            </td>
                                            <td style="width: 10px; text-align: center">
                                                <i class="fa fa-ellipsis-v"></i>
                                            </td>
                                            <td>
                                                <telerik:RadButton ID="Btn_Add_TrainingGene_GOTerm" runat="server" Text="ADD" AutoPostBack="true" Skin="Material" OnClick="Btn_Add_TrainingGene_GOTerm_Click"
                                                    OnClientClicked="Btn_Add_TrainingGene_GOTerm_Clicked" Width="80px" Height="27px" Style="top: 0px; left: 0px; margin-bottom: 8px; font-size: 12px; margin-top: 5px; border: 1px solid #ddd; background: #fff; border-radius: 5px">
                                                    <Icon PrimaryIconCssClass="rbAdd" PrimaryIconLeft="9" PrimaryIconTop="5"></Icon>
                                                </telerik:RadButton>
                                            </td>
                                        </tr>

                                    </table>
                                </telerik:RadPageView>
                                <telerik:RadPageView runat="server" ID="RPW_P4" CssClass="corporatePageView">
                                    <table style="background: #eaeaea; width: 100%; border-bottom: 1px solid #ddd">
                                        <tr>
                                            <td colspan="2">
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <%--<telerik:RadComboBox ID="RC_TrainingGen_OMIMTerms" runat="server" Skin="Metro" CssClass="p-l-20"
                                                    Label="Choose a OMIM:" Width="400px" Height="200px" AutoPostBack="true" EnableLoadOnDemand="True"
                                                    ShowMoreResultsBox="true" EnableVirtualScrolling="true" OnItemsRequested="RC_TrainingGen_OMIMTerms_ItemsRequested"
                                                    OnClientDropDownOpening="RC_TrainingGen_OMIMTerms_DropDownOpening"> 
                                                </telerik:RadComboBox>--%>

                                    <telerik:RadComboBox ID="RC_TrainingGen_OMIMTerms" RenderMode="Lightweight" runat="server" Skin="MetroTouch" CssClass="p-l-20" DataSourceID="OMIM"
                                        Label="Choose a OMIM:" Width="600px" Height="200px" AutoPostBack="true" EnableAutomaticLoadOnDemand="True"
                                        ShowMoreResultsBox="true" EnableVirtualScrolling="true" DataTextField="term" DataValueField="omimId"
                                        LoadingMessage="Loading..." ShowWhileLoading="true" ItemsPerRequest="5" Filter="Contains" OnClientDropDownOpening="RC_TrainingGen_OMIMTerms_DropDownOpening">
                                        <%--OnClientDropDownOpening="RC_Gene_DropDownOpening"--%>
                                    </telerik:RadComboBox>
                                   
                                            </td>
                                            <td style="width: 10px; text-align: center">
                                                <i class="fa fa-ellipsis-v"></i>
                                            </td>
                                            <td>
                                                <telerik:RadButton ID="Btn_Add_TrainingGen_OMIMTerms" runat="server" Text="ADD" AutoPostBack="true"  Skin="Material" OnClick="Btn_Add_TrainingGen_OMIMTerms_Click"
                                                    OnClientClicked="Btn_Add_TrainingGen_OMIMTerms_Clicked" Width="80px" Height="27px" Style="top: 0px; left: 0px; margin-bottom: 8px; font-size: 12px; margin-top: 5px; border: 1px solid #ddd; background: #fff; border-radius: 5px">
                                                    <Icon PrimaryIconCssClass="rbAdd" PrimaryIconLeft="9" PrimaryIconTop="5"></Icon>
                                                </telerik:RadButton>
                                            </td>
                                        </tr>

                                    </table>
                                </telerik:RadPageView>
                               <telerik:RadPageView runat="server" ID="RPW_P5" CssClass="corporatePageView">
                                    <table style="background: #eaeaea; width: 100%; border-bottom: 1px solid #ddd">
                                        <tr>
                                            <td colspan="2">
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="align-content: center">
                                                <asp:Label ID="txt_fileupload" runat="server" Text="Select your file:" CssClass="p-l-20 txt_fileupload"></asp:Label>
                                             
                                                <div style="width: 31%;float: left;">
                                                <telerik:RadAsyncUpload runat="server" ID="RADUPT1" MultipleFileSelection="Disabled"
                                                    AllowedFileExtensions=".txt" InitialFileInputsCount="1" MaxFileInputsCount="1"
                                                    Width="100%" OnClientValidationFailed="validationFailed" Localization-Select="Select file">
                                                    <FileFilters>
                                                        <telerik:FileFilter Description="Text(txt)" Extensions="txt" />
                                                    </FileFilters>
                                                </telerik:RadAsyncUpload>
                                                </div>

                                                   <a id="F1" title="<p style=&quot;text-align: justify&quot; > List of Genes as the txt file format. System only accept Ensembl gene identifier and gene name in a single column.</p>"
                                                    href="#">
                                                    <asp:Image ID="Image9" runat="server" ImageUrl="~/img/icon-info-red.png"
                                                        Style="height: 20px; width: 20px;" /></a>
                                                <telerik:RadToolTip runat="server" ID="RadToolTip9" Height="100px" Width="250px"
                                                    AutoCloseDelay="0" IsClientID="true" TargetControlID="F1" Position="TopCenter"
                                                    RelativeTo="Element">
                                                </telerik:RadToolTip>
                                            </td>
                                            <td style="width: 10px; text-align: center">
                                                <i class="fa fa-ellipsis-v"></i>
                                            </td>
                                            <td style="align-content: center">
                                                <telerik:RadButton ID="Btn_Add_TrainingGen_File" runat="server" Text="ADD" AutoPostBack="true" Skin="Material" OnClick="Btn_Add_TrainingGen_File_Click" 
                                                    Width="80px" Height="27px" 
                                                    Style="top: 0px; left: 0px; margin-bottom: 8px; font-size: 12px; margin-top: 5px; border: 1px solid #ddd; background: #fff; border-radius: 5px">
                                                    <Icon PrimaryIconCssClass="rbAdd" PrimaryIconLeft="9" PrimaryIconTop="5"></Icon>
                                                </telerik:RadButton>
                                                <asp:Label ID="lblFileEmpty" runat="server" Font-Size="11pt" ForeColor="#CC0000"></asp:Label>
                                            </td>
                                            <td style="align-content: center; width: 10px"></td>
                                            <td style="text-align: center">
                                                <asp:Label ID="lblFileRecord" runat="server" Font-Size="9pt" Style="top: 0px; left: 0px; margin-bottom: 8px; color:black;"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </telerik:RadPageView>

                            </telerik:RadMultiPage>
                        </div>

                        <div class="row col-12 pt-1">
                            <div class="row" style="width: 98%">
                                <div class="about-us-text span12" style="width: 100%">
                                    <table>
                                        <%-- <tr>
                                            <td>
                                                <asp:Label ID="Label2" runat="server" Text="Number of selected genes: "></asp:Label>
                                                <asp:Label ID="lbl_Sel_TrainingGene" runat="server" ForeColor="#9d426b" Text="0"
                                                    ViewStateMode="Enabled"></asp:Label>
                                            </td>
                                        </tr>--%>
                                        <tr>
                                            <td style="padding-left: 15px">
                                                <asp:Label ID="Label1" runat="server" Text="Panel name: "></asp:Label>
                                                <telerik:RadTextBox runat="server" ID="RTB_UPanelName" Skin="Metro" Width="100%" Font-Size="Small" CausesValidation="true"
                                                    EmptyMessage="Enter the panel name..." TextMode="MultiLine">
                                                </telerik:RadTextBox>
                                                <asp:RequiredFieldValidator ID="RFV_UPanelName" runat="server" InitialValue="" ForeColor="#CC0000" ControlToValidate="RTB_UPanelName"
                                                    ErrorMessage="* Please enter the panel name." ValidationGroup="validName"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <telerik:RadListBox ID="RLB_TrainingGenes" runat="server" CheckBoxes="false" ShowCheckAll="false" AllowPaging="true"
                                Width="100%" Height="300px" EmptyMessage="No items added" ViewStateMode="Enabled" SelectionMode="Multiple"
                                OnClientLoad="RLB_TrainingGenes_Load" PageSize="10">
                                <HeaderTemplate>
                                    <table style="width: 100%;">
                                        <tr>
                                            <td style="width: 150px">Gene (Reference ID)
                                            </td>
                                            <td style="width: 100px">Alias
                                            </td>
                                            <td>Description
                                            </td>
                                            <td style="width: 250px">
                                                <telerik:RadButton ID="RadButton8" runat="server" Skin="Material" Text="Clear" AutoPostBack="false"
                                                    OnClientClicked="Clear_TrainingGene">
                                                    <Icon PrimaryIconCssClass="rbRefresh" PrimaryIconLeft="4" PrimaryIconTop="3"></Icon>
                                                </telerik:RadButton>
                                                <telerik:RadButton ID="Btn_TrainingGene_DelItem" runat="server" Skin="Material" Text="Remove selected item"
                                                    AutoPostBack="false" OnClientClicked="RemoveItem_TrainingGene">
                                                    <Icon PrimaryIconCssClass="rbRemove" PrimaryIconLeft="4" PrimaryIconTop="3"></Icon>
                                                </telerik:RadButton>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                            </telerik:RadListBox>

                        </div>

                    </telerik:RadPageView>
                    <telerik:RadPageView ID="RadPageView2" runat="server">
                    </telerik:RadPageView>
                </telerik:RadMultiPage>

            </div>
        </div>
    </section>

    <div class="content-header-right col-md-6 col-12" style="visibility: hidden; height: 3px">
        <div class="btn-group" role="group">
            <asp:DropDownList ID="DDL_GenomeBuild" runat="server" Width="150px" DataTextField="ReferenceBuildName" DataValueField="ReferenceBuildID"
                AppendDataBoundItems="True" AutoPostBack="true" DataSourceID="SDS_ReferenceBuild"
                class="btn btn-outline-info dropdown-toggle dropdown-menu-right mr-1 btn-sm">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SDS_ReferenceBuild" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand=" Select * from [WiNGS_BaseInfo_Db].[dbo].[Tbl_ReferenceBuild] where status = 1 "></asp:SqlDataSource>
        </div>
    </div>


    <div style="width: 98%">

        <table style="text-align: right; width: 100%">

            <tr>
                 <td style="text-align: left; font-size: 12px; padding-left: 30px; font-weight: bold;">
                    <asp:Label ID="Label2" runat="server" Text="Number of selected genes: "></asp:Label>
                    <asp:Label ID="lbl_Sel_TrainingGene" runat="server" ForeColor="#9d426b" Text="0" ViewStateMode="Enabled"></asp:Label>
                </td>
                <td>
                    <telerik:RadButton runat="server" ID="RB_Submit" Text="SUBMIT" AutoPostBack="true" OnClientClick="Btn_Can_Finish_Clicked()" Skin="Material"
                        CssClass="btn_finish"  ValidationGroup="validName" OnClick="RB_Submit_Click"> 
                        <Icon PrimaryIconCssClass="rbOk" PrimaryIconLeft="12" PrimaryIconTop="5"></Icon>
                    </telerik:RadButton>
                </td>
            </tr>
        </table>

    </div>
</div>

<telerik:RadListBox ID="Radlisbox_Sample_TrainingGene" runat="server" CheckBoxes="false" AllowPaging="true" PageSize="10"
    ShowCheckAll="false" Width="0" Height="0" EmptyMessage="No items added" BorderColor="Transparent">
    <ItemTemplate>
        <table style="width: 100%;">
            <tr>
                <td style="width: 150px">
                    <asp:Label ID="lbl_Sel_TrainingGene_RefID" runat="server" Text=""></asp:Label>
                </td>
                <td style="width: 100px">
                    <asp:Label ID="lbl_Sel_TrainingGene_Alias" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lbl_Sel_TrainingGene_Desc" runat="server" Text=""></asp:Label>
                </td>
                <td style="width: 1px"></td>
            </tr>
        </table>
    </ItemTemplate>
</telerik:RadListBox>

<div class="form-actionspopup center">

    <asp:Button ID="btn_cancel" Text="X" runat="server" OnClientClick="CloseWindow(); return false;"
        class="btn btn-danger mr-1 ladda-button btn-sm" ToolTip="Close window"></asp:Button>
    <telerik:RadToolTip ID="RadToolTip1" runat="server" Font-Size="X-Small" Width="110px" TargetControlID="btn_cancel" RelativeTo="Element" Position="BottomCenter"
        ShowEvent="OnMouseOver" RenderMode="Lightweight" Skin="Metro" Height="30px">
    </telerik:RadToolTip>
</div>


<asp:SqlDataSource ID="SDS_Population_Chromosome" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" 
    SelectCommandType="StoredProcedure" SelectCommand="SP_GAP_Filter_Upanel_AllChrom_Sel" >
    <SelectParameters>
        <asp:SessionParameter Name="RefBuild" SessionField="SelectedRefBuild" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="OMIM" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_GAP_Filter_UPanel_TargetGene_Item_OMIMTerms_Sel" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
<asp:SqlDataSource ID="GOTerms" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_GAP_Filter_UPanel_TargetGene_Item_GOTerms_Sel" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
<asp:SqlDataSource ID="Gene" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_GAP_Filter_UPanel_Gene_TrainingGenes_Sel" SelectCommandType="StoredProcedure"></asp:SqlDataSource>



<telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
    <script type="text/javascript">

        function GetRadWindow() {
            var oWindow = null;
            if (window.radWindow) oWindow = window.radWindow; //Will work in Moz in all cases, including classic dialog
            else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow; //IE (and Moz as well)

            return oWindow;
        }

        function CloseWindow() {
            var oWindow = GetRadWindow();  //Obtaining a reference to the current window 
            oWindow.Close(0);
        }

        function Btn_Search_GenAP_Freq_Clicked(sender, args) {
            var tb_spoint = $find("<%= Txt_TraG_StartPos.ClientID %>");
            var tb_epoint = $find("<%= Txt_TraG_EndPos.ClientID %>");
            if ((tb_spoint.get_value().length < 1) || (tb_epoint.get_value().length < 1)) {
                alert("Please define Start and end position!");
                args.set_cancel(true);
            }
            if (parseInt(tb_spoint.get_value()) > parseInt(tb_epoint.get_value())) {
                console.log(parseInt(tb_spoint.get_value()));
                console.log(parseInt(tb_epoint.get_value()));
                alert("Please enter valid Start and end position!");
                args.set_cancel(true);
            }
        }

        function Txt_TraG_StartPos_KeyPress(sender, args) {

            if (parseInt($find("<%= Txt_TraG_StartPos.ClientID %>").get_value()) <= parseInt($find('<%=CB_Chromosome.ClientID %>').get_selectedItem().get_value())) {
                $find("<%= Txt_TraG_EndPos.ClientID %>").set_value($find("<%= Txt_TraG_StartPos.ClientID %>").get_value());
            } else {
                alert("Entered value for start position is outside the chromosome!");
                args.set_cancel(true);
            }
        }

        function Txt_TraG_EndPos_KeyPress(sender, args) {

            if (parseInt($find("<%= Txt_TraG_EndPos.ClientID %>").get_value()) > parseInt($find('<%=CB_Chromosome.ClientID %>').get_selectedItem().get_value())) {

                alert("Entered value for end position is outside the chromosome!");
                args.set_cancel(true);
            }

        }

        function RLB_TrainingGenes_Load(sender, args) {
            GetItemCountTrainingGense();
        }

        function GetItemCountTrainingGense() {
            var list = $find("<%= RLB_TrainingGenes.ClientID %>");
            var count = list.get_items().get_count();
            document.getElementById('<%= lbl_Sel_TrainingGene.ClientID %>').innerHTML = count;
        }

        function Clear_TrainingGene() {
            var list = $find("<%= RLB_TrainingGenes.ClientID %>");
            var items = list.get_items();
            list.trackChanges();
            items.clear();
            list.commitChanges();
            GetItemCountTrainingGense();
        }

        function RemoveItem_TrainingGene() {
            var list = $find("<%= RLB_TrainingGenes.ClientID %>");
            var items = list.get_items();
            var Sel_items = list.get_selectedItems();
            if (Sel_items != null) {
                list.trackChanges();
                Sel_items.forEach(function (sit) {
                    items.remove(sit);
                });
                list.commitChanges();
                GetItemCountTrainingGense();
            }

        }

        function CB_Chromosome_DropDownOpening(sender, args) {
            var combo = $find('<%= CB_Chromosome.ClientID%>');
            combo.clearSelection();
        }

        function RC_TraG_ChrBand_DropDownOpening(sender, args) {
            var combo = $find('<%= RC_TraG_ChrBand.ClientID %>');
            combo.clearSelection();
        }

        function RC_TrainingGene_Gens_DropDownOpening(sender, args) {
            var combo = $find('<%= RC_TrainingGene_Gens.ClientID %>');
            combo.clearSelection();
        }

        function RC_TrainingGen_GOTerms_DropDownOpening(sender, args) {
            var combo = $find('<%= RC_TrainingGen_GOTerms.ClientID %>');
            combo.clearSelection();
        }

        function RC_TrainingGen_OMIMTerms_DropDownOpening(sender, args) {
            var combo = $find('<%= RC_TrainingGen_OMIMTerms.ClientID %>');
            combo.clearSelection();
        }

        function Btn_Add_TrainingGene_Gens_Clicked(sender, args) {
            var combo = $find("<%= RC_TrainingGene_Gens.ClientID %>");
            var indx = combo.get_value();
            if (indx.length < 0) {
                alert("Please select gene!");
            }
        }

        function Btn_Add_TrainingGene_GOTerm_Clicked(sender, args) {
            var combo = $find("<%= RC_TrainingGen_GOTerms.ClientID %>");
            var indx = combo.get_value();
            if (indx.length < 0) {
                alert("Please select GO term!");
                args.set_cancel(true);
            }
        }

        function Btn_Add_TrainingGene_ChrCoordinates_Clicked(sender, args) {
            var checked_FChr = ($find("<%= Opt_TrG_Chr_FChr.ClientID %>").get_checked()) ? "checked" : "unchecked";
            var checked_ChrCo = ($find("<%= Opt_TrG_Chr_CChr.ClientID %>").get_checked()) ? "checked" : "unchecked";
            var checked_BChr = ($find("<%= Opt_TrG_Chr_BChr.ClientID %>").get_checked()) ? "checked" : "unchecked";
            if (checked_FChr == "checked") {
            }
            if (checked_ChrCo == "checked") {
                var tb_spoint = $find("<%= Txt_TraG_StartPos.ClientID %>");
                var tb_epoint = $find("<%= Txt_TraG_EndPos.ClientID %>");
                if ((tb_spoint.get_textBoxValue().length < 1) || (tb_epoint.get_textBoxValue().length < 1)) {
                    alert("Please define Start and end position!");
                    args.set_cancel(true);
                }
                if (parseInt(tb_spoint.get_textBoxValue()) > parseInt(tb_epoint.get_textBoxValue())) {
                    alert("Please valid Start and end position!");
                    args.set_cancel(true);
                }
            }
            if (checked_BChr == "checked") {
                var combo = $find('<%= RC_TraG_ChrBand.ClientID %>');
                var indx = combo.get_value();
                if (indx.length <= 2) {
                    alert("Please select a band!");
                    args.set_cancel(true);
                }
            }
        }

        function Btn_Add_TrainingGen_OMIMTerms_Clicked(sender, args) {
            var combo = $find("<%= RC_TrainingGen_OMIMTerms.ClientID %>");
            var indx = combo.get_text();
            if (indx.length <= 2) {
                alert("Please select OMIM term!");
                args.set_cancel(true);
            }
        }

        //<![CDATA[
        var $ = $telerik.$;
        function validationFailed(radAsyncUpload, args) {
            var $row = $(args.get_row());
            var erorMessage = getErrorMessage(radAsyncUpload, args);
            var span = createError(erorMessage);
            $row.addClass("ruError");
            $row.append(span);
        }

        function getErrorMessage(sender, args) {
            var fileExtention = args.get_fileName().substring(args.get_fileName().lastIndexOf('.') + 1, args.get_fileName().length);
            if (args.get_fileName().lastIndexOf('.') != -1) {//this checks if the extension is correct
                if (sender.get_allowedFileExtensions().indexOf(fileExtention) == -1) {
                    return ("This file type is not supported.");
                }
            }
            else {
                return ("not correct extension.");
            }
        }

        function createError(erorMessage) {
            var input = '<span style="border-color:Red;background-color:Pink"><br />' + erorMessage + ' </span>';
            return input;
        }
        //]]>

        function Btn_Can_Finish_Clicked(sender, args) {

            var list = $find("<%= RLB_TrainingGenes.ClientID %>");
            var T_count = list.get_items().get_count();

            if (T_count == 0) {
                alert("At least one gene must be selected!");
                args.set_cancel(true);
            }

        }

    </script>
</telerik:RadScriptBlock>
