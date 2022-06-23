<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Upload_QualityFile.ascx.cs" Inherits="WebGAP.GAP.Popup.uc_Upload_QualityFile" %>


<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <ClientEvents OnRequestStart="onRequestStart"></ClientEvents>
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="Btn_AddFileForQuality">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Btn_AddFileForQuality" />
            </UpdatedControls>
        </telerik:AjaxSetting>

    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>
<script type="text/javascript">
    function onRequestStart(sender, args) {

        if (args.get_eventTarget().indexOf("Btn_AddFileForQuality") >= 0) {
            args.set_enableAjax(false);
        }

    }


    
    function GetRadWindow() {
        var oWindow = null;
        if (window.radWindow) oWindow = window.radWindow;
        else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
        return oWindow;
    }

    function btn_cacel_click() {
        GetRadWindow().close();

    }

    function Btn_AddFileForQuality_Clicked(sender, args) {
        GetRadWindow().close();
    }


    //<![CDATA[
    var $ = $telerik.$;
    function validationFailed(sender, args) {

        var $row = $(args.get_row());
        var erorMessage = getErrorMessage(sender, args);
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
</script>
<div class="card-content collapse show">
    <div class="card-bodypopup">
        <form class="form">
            <div class="form-body">
                <h4 class="form-sectionpopup"><i class="ft-user"></i>Add Input File For Quality Control</h4>
                <div class="row">
                    <div class="col-12 m-1">
                        <div class="row">
                            <div class="col-6">
                                <label class=".riLabel">Load file from:</label>
                            </div>
                            <div class="col-6">
                                <telerik:RadAsyncUpload runat="server" ID="RADUPT_Quality" MultipleFileSelection="Disabled" HideFileInput="true"
                                    AllowedFileExtensions=".txt" OnClientValidationFailed="validationFailed" InitialFileInputsCount="1" MaxFileInputsCount="1" TemporaryFolder="~/Upload"
                                    Localization-Select="Select">
                                    <FileFilters>
                                        <telerik:FileFilter Description="Text(txt)" Extensions="txt" />
                                    </FileFilters>
                                </telerik:RadAsyncUpload>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label class=".riLabel">Input File Type:</label>
                            </div>
                            <div class="col-6">
                                <telerik:RadComboBox runat="server" ID="InputFileType">
                                    <Items>
                                        <telerik:RadComboBoxItem runat="server" Text="FASTQC" Value="0" />
                                        <telerik:RadComboBoxItem runat="server" Text="BAM" Value="1" />
                                        <telerik:RadComboBoxItem runat="server" Text="VCF" Value="2" />
                                        <telerik:RadComboBoxItem runat="server" Text="Annotation" Value="3" />
                                    </Items>

                                </telerik:RadComboBox>
                            </div>
                        </div>
                      <%--  <div class="row">
                            <div class="col-6">
                                <label class=".riLabel">SampleID:</label>
                            </div>
                            <div class="col-6">
                                <asp:DropDownList ID="DDL_Individuals" runat="server" Width="250px" class="form-control" DataTextField="Individualinfo" DataValueField="IndividualID"
                                    SelectedValue='<%# Bind("IndividualID") %>' TabIndex="4"
                                    AppendDataBoundItems="True" DataSourceID="SDS_Indivisuals">
                                    <asp:ListItem Value="">Select One</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>--%>
                        <div class="form-actionspopup center" style="height: 20%; display: flex; flex-direction: row; justify-content: center; padding: 4px 4px 4px 4px; font-size: smaller;">
                            <div>
                                <telerik:RadButton ID="Btn_AddFileForQuality" runat="server" Text="Add" AutoPostBack="true"
                                    Width="155px" Style="top: 1px; left: 0px; margin-bottom: 8px;" OnClick="Btn_AddFileForQuality_Click" OnClientClicked="Btn_AddFileForQuality_Clicked">
                                </telerik:RadButton>
                            </div>
                            &nbsp;
                                    <div>
                                        <asp:Button ID="btn_cacel" Text="Cancel" runat="server" CausesValidation="true" class="btn btn-danger mr-1 ladda-button btn-sm" OnClientClick="btn_cacel_click();return false;"></asp:Button>
                                    </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
