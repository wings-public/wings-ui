<%@ Page Title="Reset Password" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="WebGAP.Account.ResetPassword" Async="true" %>

<%--<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="SimpleContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Enter your new password</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>

          <asp:PlaceHolder runat="server" ID="ErrorMessageCode" Visible="false">
                <p class="text-danger">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
            </asp:PlaceHolder>
        <div class="form-group">
            <label>Two-Factor Authentication:</label>
            <div class="form-group">
                <asp:Label Text="Code:" runat="server" AssociatedControlID="Code" CssClass="col-md-2 control-label" />
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Code" CssClass="form-control" />
                </div>
            </div>

        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="Reset_Click" Text="Reset" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>--%>



<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="SimpleContent">
    <webopt:BundleReference runat="server" Path="~/Secound/maincss" />

    <div data-open="hover" data-menu="vertical-mmenu" data-col="1-column" class="vertical-layout vertical-mmenu 1-column bg-full-screen-image blank-page blank-page">
        <asp:PlaceHolder runat="server" ID="PlaceHolder1" Visible="false"></asp:PlaceHolder>

        <div class="app-content  content">
            <div class="content-wrapper">
                <div class="content-header row">
                </div>
                <div class="content-body">
                    <section class="flexbox-container">
                        <div class="col-12 d-flex align-items-center justify-content-center">
                            <div class="col-md-4 col-10 box-shadow-2 p-0">
                                <div class="card border-grey border-lighten-3 m-0">
                                    <div class="card-header border-0">
                                        <div class="card-title text-center">
                                            <div class="p-1">
                                                <h2><%: Title %></h2>
                                                <p class="text-danger">
                                                    <asp:Literal runat="server" ID="ErrorMessage" />
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-body pt-0 text-center">

                                            <p class="card-subtitle line-on-side text-muted text-center font-small-3 mx-2 my-1"></p>
                                            <div class="card-body pt-1">
                                                <div class="form-horizontal">
                                                    <fieldset class="form-group position-relative has-icon-left">
                                                         <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" placeholder="Email"  required ="" />
                                                        <div class="form-control-position">
                                                            <i class="icon-head"></i>
                                                        </div>
                                                        
                                                    </fieldset>
                                                    <fieldset class="form-group position-relative has-icon-left">
                                                         <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" placeholder="Password"   required =""/>
                                                        <div class="form-control-position">
                                                        <i class="icon-key3"></i>
                                                            </div>

                                                    </fieldset>

                                                    <fieldset class="form-group position-relative has-icon-left">

                                                        <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" placeholder="Confirm Password"  required =""/>
                                                          <div class="form-control-position">
                                                        <i class="icon-key3"></i>
                                                              </div>
                                                  
                                                        <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                                            CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />

                                                    </fieldset>
                                                    <asp:PlaceHolder runat="server" ID="ErrorMessageCode" Visible="false">
                                                        <p class="text-danger">
                                                            <asp:Literal runat="server" ID="FailureText" />
                                                        </p>
                                                    </asp:PlaceHolder>

                                                    <div class="form-group">
                                                        <div class="col-md-offset-2 col-md-10">
                                                            <asp:Button runat="server" OnClick="Reset_Click" Text="Reset" CssClass="btn btn-default" />
                                                        </div>
                                                    </div>


                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                </div>
            </div>
        </div>
    </div>

</asp:Content>

