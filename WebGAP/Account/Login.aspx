<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebGAP.Account.Login" Async="true" %>

<%@ Register Src="/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="SimpleContent">
    <webopt:BundleReference runat="server" Path="~/Secound/maincss" />

    <link href="../assets/css/Custom.css" rel="stylesheet" />
    <style>
        .riSingle {
            display: block !important;
            width: 100% !important;
        }
        .p-l-33 {padding-left:33px !important}
        .m-t-5 {margin-top:-5px !important}
        .text-danger {color: palevioletred !important;
    padding-top: 10px;
    margin-bottom: 0;
    font-weight: bold;}
       
    </style>
    <div data-open="hover" data-menu="vertical-mmenu" data-col="1-column" class="vertical-layout vertical-mmenu 1-column bg-full-screen-image blank-page login-page">
        <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false"></asp:PlaceHolder>
        <div class="app-content">
            <div class="content-wrapper">
                <div class="content-header row">
                </div>
                <div class="content-body ">
                    <section class="flexbox-container">
                        <div class="col-5 align-items-center justify-content-center ">
                            <div class="col-md-7 col-7 p-0 float-right">
                                <div class="card m-0 p-0 bgColorForm">
                                    <div class="card-header border-0 bgColorForm">
                                        <div class="card-title text-center">
                                            <div class="p-0">
                                                <a href="../Default.aspx">
                                                    <img src="/img/LogoLogin.png" alt="WiNGS" width="240">
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card-content">
                                        <div class="card-body pt-0 text-center">
                                            <%--<p class="card-subtitle line-on-side text-muted text-center font-small-3 mx-2 my-1"><span>Using Account Details</span></p>--%>

                                            <div class="card-body pt-1">
                                                <div class="form-horizontal">
                                                    <fieldset class="form-group position-relative has-icon-left">
                                                        <telerik:RadTextBox runat="server" ID="username" CssClass="form-control txtb p-l-33" placeholder="Your Username"
                                                            TextMode="SingleLine" required="" />
                                                        <div class="form-control-position m-t-5">
                                                            <i class="icon-head"></i>
                                                        </div>
                                                         <asp:RequiredFieldValidator ID="TxtBoxRFildValUserName" runat="server" Display="Dynamic" ForeColor="palevioletred" 
                                                            ControlToValidate="username" ErrorMessage="* The username cannot be empty"></asp:RequiredFieldValidator>

                                                    </fieldset>
                                                    <fieldset class="form-group position-relative has-icon-left">
                                                        <asp:TextBox runat="server" ID="userpassword" TextMode="Password" placeholder="Enter Password"
                                                            CssClass="form-control txtb p-l-33" />
                                                        <div class="form-control-position m-t-5">
                                                            <i class="icon-key3"></i>
                                                        </div>
                                                         <asp:RequiredFieldValidator ID="TxtBoxRFildValPass" runat="server" Display="Dynamic" ForeColor="palevioletred"
                                                            ControlToValidate="userpassword" ErrorMessage="* The password cannot be empty"></asp:RequiredFieldValidator>

                                                    </fieldset>
                                                    <div class="form-group row">
                                                        <telerik:RadCaptcha AccessKey="A" ID="RadCaptcha1" runat="server" CssClass="RCaptcha" EnableRefreshImage="true"
                                                            ErrorMessage="You have entered an invalid code" ForeColor="#967ADC" Font-Size="12px" Font-Bold="true">
                                                            <CaptchaImage ImageCssClass="imageClass" BackgroundColor="#dff3ff" TextColor="#002B46"></CaptchaImage>
                                                        </telerik:RadCaptcha>

                                                    </div>

                                                    <div class="form-group row">
                                                        <div class="col-md-6 col-12 text-center text-sm-left">
                                                            <fieldset>
                                                                <asp:CheckBox runat="server" ID="rememberme" />
                                                                <label for="rememberme">Remember Me</label>
                                                            </fieldset>
                                                        </div>
                                                        <div class="col-md-6 col-xs-12 float-sm-left text-xs-center"><a href="Forgot" class="card-link">Forgot Password?</a></div>

                                                    </div>

                                                    <button runat="server" id="btnlogin" onserverclick="LogIn" class="btn btn-primary btn-block"><i class='icon-unlocked'></i>Log in </button>
                                                    <p class="text-danger">
                                                        <asp:Literal runat="server" ID="FailureText"  />
                                                    </p>
                                                </div>
                                            </div>

                                            <p class="card-subtitle line-on-side text-muted text-center font-small-3 mx-2 my-1"><span>New to WiNGS ?</span></p>
                                            <div class="form-group row">
                                                <div class="col-md-6 col-12 text-center text-sm-left pl-3">
                                                    <asp:HyperLink runat="server" ID="GoBackHome" ViewStateMode="Disabled"><i class="icon-home"></i> Back to home</asp:HyperLink>
                                                </div>
                                                <div class="col-md-6 col-xs-12 float-sm-left text-xs-center">
                                                    <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">  <i class="icon-head"></i> Register as a new user</asp:HyperLink>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                </div>


                            </div>
                        </div>
                        <div class="col-6 login-page-img"></div>
                    </section>
                </div>
            </div>
        </div>
    </div>
    <script src='https://www.google.com/recaptcha/api.js'></script>
   
</asp:Content>


