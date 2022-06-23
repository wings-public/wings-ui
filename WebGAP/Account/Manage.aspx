<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="WebGAP.Account.Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>


<asp:Content ID="Content2" ContentPlaceHolderID="SimpleContent" runat="server">
    <style>
        .RadUpload {
            float: left;
        }

        .AUProfileImg .ruBrowse {
            /*background-position: 0 -23px;*/
            width: 50px;
            height: 35px;
            border-radius: 3px;
            border: 1px solid #ccc;
        }

        .AUProfileImg .ruFileWrap .ruButtonHover {
            background-position: 100% -23px !important;
        }

        .RadUpload_Metro .ruSelectWrap .ruFakeInput {
            height: 35px !important;
            border-radius: 3px;
            border: 1px solid #ccc;
            width: 148px;
        }

        .prevImgProfile {
            float: right;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .ruErrorMessage {
            display: block
        }

        .lbl_err {
            float: left;
            font-size: 12px;
            padding-left: 14px;
            padding-bottom: 5px;
            display: block
        }

        .icon-bullet-red {
            background-color: #de3914;
            position: absolute;
            left: 0px;
            top: 32px;
            width: 8px;
            height: 8px;
            border-radius: 100%;
        }
    </style>
    <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>
    </div>

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">

            window.validationFailed = function (radAsyncUpload, args) {
                var $row = $(args.get_row());
                var erorMessage = getErrorMessage(radAsyncUpload, args);
                var span = createError(erorMessage);
                $row.addClass("ruError");
                $row.append(span);
            }

            function getErrorMessage(sender, args) {

                var fileExtention = args.get_fileName().substring(args.get_fileName().lastIndexOf('.') + 1, args.get_fileName().length);
                if (args.get_fileName().lastIndexOf('.') != -1) { //this checks if the extension is correct

                    if (sender.get_allowedFileExtensions().indexOf(fileExtention) == -1) {
                        //$find("<%= lbl_err.ClientID %>").Vis
                        document.getElementById('<%= lbl_err.ClientID %>').style.display = 'none';
                        return ("This file type is not supported.");
                    }
                    else {
                        document.getElementById('<%= lbl_err.ClientID %>').style.display = 'none';
                        return ("This file exceeds the maximum allowed size of 500 KB.");
                    }

                }
                else {
                    document.getElementById('<%= lbl_err.ClientID %>').style.display = 'none';
                    return ("not correct extension.");
                }

            }

            function createError(erorMessage) {
                var input = '<span class="ruErrorMessage">' + erorMessage + ' </span>';
                return input;
            }

            function validateRadUpload(source, e) {
                e.IsValid = false;
                document.getElementById('<%= lbl_err.ClientID %>').style.display = 'none';
                var upload = $find("<%= AsyncUploadProfileImg.ClientID %>");
                var inputs = upload.getFileInputs();
                for (var i = 0; i < inputs.length; i++) {
                    //check for empty string or invalid extension     
                    if (inputs[i].value != "" && upload.isExtensionValid(inputs[i].value)) {
                        e.IsValid = true;

                        break;
                    }
                }
            }


        </script>
    </telerik:RadCodeBlock>

    <div class="app-content  content">
        <div class="content-wrapper">
            <div class="content-body" style="font-size: small">
                <section class="flexbox-container">
                    <div class="col-12 d-flex align-items-center justify-content-center">
                        <div class="col-md-4 col-10 box-shadow-2 p-0">

                            <div class="form-body" style="font-size: inherit">
                                <h4 class="form-section"><i class="ft-user"></i>Change your account settings</h4>
                                <fieldset class="form-group-popup position-relative">
                                    <label>Name </label>
                                    <asp:TextBox type="text" runat="server" ID="UserFullName" class="form-control" placeholder="UserFullName" name="UserFullName" Text='<%# Bind("UserFullName") %>' Style="font-size: small" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="UserFullName"
                                        CssClass="text-danger" ErrorMessage="The name field is required." ValidationGroup="EditUserProfile" />
                                </fieldset>
                                <fieldset class="form-group-popup position-relative">
                                    <label style="display: block">Profile image</label>

                                    <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="validateRadUpload"
                                        ErrorMessage="Please select one image file"></asp:CustomValidator>
                                    <asp:Label runat="server" ID="lbl_err" ForeColor="Black" CssClass="lbl_err" Visible="false" Text="">
                                        <i class="icon-bullet-red"></i>This file is not supported.
                                    </asp:Label>

                                    <telerik:RadAsyncUpload RenderMode="Lightweight" runat="server" ID="AsyncUploadProfileImg"
                                        AllowedFileExtensions="jpg,jpeg,png,gif,JPG" MaxFileSize="524288" Skin="Metro" CssClass="AUProfileImg"
                                        OnClientValidationFailed="validationFailed" InitialFileInputsCount="1" MaxFileInputsCount="1">
                                    </telerik:RadAsyncUpload>

                                    <telerik:RadBinaryImage runat="server" ID="RBImg_userProfile" AutoAdjustImageControlSize="false" CssClass="prevImgProfile" Height="80px" Width="80px">
                                        <%--ToolTip='<%#Eval("UserName", "Photo of {0}") %>'
                                        AlternateText='<%#Eval("UserName", "Photo of {0}") %>'--%>
                                    </telerik:RadBinaryImage>
                                </fieldset>

                                <fieldset class="form-group-popup position-relative" style="visibility:hidden" > 
                                    <label>Two-Factor Authentication:</label>
                                    <asp:PlaceHolder runat="server">
                                        <% if (TwoFactorEnabled)
                                            { %>

                                        <asp:LinkButton ID="linkbtn_Disable" Text="Disable" runat="server" CommandArgument="false" OnClick="TwoFactorDisable_Click" />

                                        <% }
                                            else
                                            {  %>
                                        <asp:LinkButton ID="linkbtn_Enable" Text="Enable" CommandArgument="true" OnClick="TwoFactorEnable_Click" runat="server" />

                                        <% } %>
                                    </asp:PlaceHolder>
                                </fieldset>

                                <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                    <p class="text-danger">
                                        <asp:Literal runat="server" ID="FailureText" />
                                    </p>
                                </asp:PlaceHolder>

                                <asp:PlaceHolder runat="server" ID="FeedBack" Visible="false">
                                    <asp:Label runat="server" ID="ConFirmInsertion" Text="Password changed!"></asp:Label>
                                </asp:PlaceHolder>

                            </div>

                            <div class="form-actions  pt-1 pb-1 center">
                                <asp:Button ID="btn_Inset" ValidationGroup="EditUserProfile" Text="Update" class="btn btn-success mr-1 ladda-button btn-sm"
                                    runat="server" OnClick="btn_Inset_Click" CssClass="btn btn-default" OnClientClick="return confirm('Are you sure you want to update?')"></asp:Button>&nbsp; 
                              <asp:Button ID="btn_cacel" Text="Cancel" runat="server" CausesValidation="true" class="btn btn-danger mr-1 ladda-button btn-sm" OnClientClick="btn_cacel_click();return false;"></asp:Button>
                            </div>


                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
    <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />


    <script>
        function GetRadWindow() {
            var oWindow = null;
            if (window.radWindow) oWindow = window.radWindow;
            else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
            return oWindow;
        }
        function btn_cacel_click() {
            GetRadWindow().close();

        }
        function CloseEditProfile() {
            GetRadWindow().close();
        }
    </script>

</asp:Content>


