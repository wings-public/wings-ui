<%@ Page Title="Manage Password" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="ManagePassword.aspx.cs" Inherits="WebGAP.Account.ManagePassword" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">


   <div class="app-content  content">
        <div class="content-wrapper">
            <div class="content-body" style="font-size: small">
                <section class="flexbox-container">
                    <div class="col-12 d-flex align-items-center justify-content-center">
                        <div class="col-md-4 col-10 box-shadow-2 p-0">
                               <div class="form-body" style="font-size: inherit">
                                        <h4 class="form-section"><i class="ft-user"></i>Change your password</h4>
                                    <asp:PlaceHolder runat="server" ID="setPassword" Visible="false">
                                        <div class="form-group mb-0">
                                            <asp:Label runat="server" AssociatedControlID="password" CssClass="col-md-2 control-label">Password</asp:Label>
                                            <div class="col-md-10">
                                                <asp:TextBox runat="server" ID="password" TextMode="Password" CssClass="form-control" />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="password"
                                                    CssClass="text-danger" ErrorMessage="The password field is required."
                                                    Display="Dynamic" ValidationGroup="SetPassword" />
                                                <asp:ModelErrorMessage runat="server" ModelStateKey="NewPassword" AssociatedControlID="password"
                                                    CssClass="text-danger" SetFocusOnError="true" />
                                            </div>
                                        </div>
                                        <div class="form-group mb-0">
                                            <asp:Label runat="server" AssociatedControlID="confirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
                                            <div class="col-md-10">
                                                <asp:TextBox runat="server" ID="confirmPassword" TextMode="Password" CssClass="form-control" />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="confirmPassword"
                                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required."
                                                    ValidationGroup="SetPassword" />
                                                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="confirmPassword"
                                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match."
                                                    ValidationGroup="SetPassword" />

                                            </div>
                                        </div>
                                        <div class="form-actions center">
                                            <button type="button" class="btn btn-warning mr-1">
                                                <i class="ft-x"></i>Cancel
                                            </button>
                                            <button type="submit" class="btn btn-primary">
                                                <i class="fa fa-check-square-o"></i>Save
                                            </button>
                                        </div>
                                      
                                    </asp:PlaceHolder>
                                    <asp:PlaceHolder runat="server" ID="changePasswordHolder" Visible="false">
                                        <div class="form-group mb-0">
                                            <asp:Label runat="server" ID="Label1" AssociatedControlID="CurrentPassword" CssClass="col-md-2 control-label">Current password</asp:Label>
                                            <asp:TextBox runat="server" ID="CurrentPassword" TextMode="Password" CssClass="form-control" />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentPassword"
                                                CssClass="text-danger" ErrorMessage="The current password field is required."
                                                ValidationGroup="ChangePassword" />
                                        </div>
                                        <div class="form-group mb-0">
                                            <asp:Label runat="server" ID="Label2" AssociatedControlID="NewPassword" CssClass="col-md-2 control-label">New password</asp:Label>

                                            <asp:TextBox runat="server" ID="NewPassword" TextMode="Password" CssClass="form-control" />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword"
                                                CssClass="text-danger" ErrorMessage="The new password is required."
                                                ValidationGroup="ChangePassword" />

                                        </div>
                                        <div class="form-group mb-0">
                                            <asp:Label runat="server" ID="Label3" AssociatedControlID="ConfirmNewPassword" CssClass="col-md-2 control-label">Confirm new password</asp:Label>

                                            <asp:TextBox runat="server" ID="ConfirmNewPassword" TextMode="Password" CssClass="form-control" />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword"
                                                CssClass="text-danger" Display="Dynamic" ErrorMessage="Confirm new password is required."
                                                ValidationGroup="ChangePassword" />
                                            <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
                                                CssClass="text-danger" Display="Dynamic" ErrorMessage="The new password and confirmation password do not match."
                                                ValidationGroup="ChangePassword" />
                                        </div>
                                        <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                            <p class="text-danger">
                                                <asp:Literal runat="server" ID="FailureText" />
                                            </p>
                                        </asp:PlaceHolder>
                                        <div class="form-actions  pt-1 pb-1 center">
                                            <asp:Button ID="btn_Inset" ValidationGroup="ChangePassword" Text="Update" class="btn btn-success mr-1 ladda-button btn-sm"
                                                runat="server" OnClick="ChangePassword_Click" CssClass="btn btn-default" OnClientClick="return confirm('Are you sure you want to update?')"></asp:Button>&nbsp;
                              <asp:Button ID="btn_cacel" Text="Cancel" runat="server" CausesValidation="true" class="btn btn-danger mr-1 ladda-button btn-sm" OnClientClick="btn_cacel_click();return false;"></asp:Button>
                                        </div>

                                    </asp:PlaceHolder>
                                    <asp:PlaceHolder runat="server" ID="FeedBack" Visible="false">
                                        <asp:Label runat="server" ID="ConFirmInsertion" Text="Password changed!"></asp:Label>
                                    </asp:PlaceHolder>
                               </div>
   </div>
                        </div>
                    </section>
                </div>
            </div>
       </div>


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

        function CloseChangePssw() {
            var customArg = 1;
            GetRadWindow().close(customArg);
        }

    </script>
</asp:Content>

