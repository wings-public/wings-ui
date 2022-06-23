<%@ Page Title="Forgot password" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="Forgot.aspx.cs" Inherits="WebGAP.Account.ForgotPassword" Async="true" %>

<%--<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="SimpleContent">
    <h2><%: Title %>.</h2>

    <div class="row">
        <div class="col-md-8">--%>
<%--     <asp:PlaceHolder id="loginForm" runat="server">
                <div class="form-horizontal">
                    <h4>Forgot your password?</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                CssClass="text-danger" ErrorMessage="The email field is required." />
                        </div>
                    </div>
                  
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="Forgot" Text="Email Link" CssClass="btn btn-default" />
                        </div>
                    </div>
                </div>
            </asp:PlaceHolder>--%>
<%--       <asp:PlaceHolder runat="server" ID="DisplayEmail" Visible="false">
                <p class="text-info">
                    Please check your email to reset your password.
                </p>
            </asp:PlaceHolder>
        </div>
    </div>
</asp:Content>--%>


<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="SimpleContent">
      <webopt:BundleReference runat="server" Path="~/Secound/maincss" />
    <asp:PlaceHolder ID="loginForm" runat="server">
        <div class="app-content content container-fluid">
            <div class="content-wrapper">
                <div class="content-header row">
                </div>
                <div class="content-body">
                    <section class="flexbox-container">
                        <div class="col-md-4 offset-md-4 col-xs-10 offset-xs-1 box-shadow-2 p-0">
                            <div class="card border-grey border-lighten-3 px-2 py-2 m-0">

                                <div class="card-body ">
                                    <div class="card-block">
                                        <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                            <p class="text-danger">
                                                <asp:Literal runat="server" ID="FailureText" />
                                            </p>

                                        </asp:PlaceHolder>
                                        <h2><%: Title %></h2>

                                        <fieldset class="form-group position-relative has-icon-left ">
                                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" placeholder="Your Email" TextMode="Email" required="" />
                                            <div class="form-control-position">
                                                <i class="icon-head"></i>
                                            </div>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                                CssClass="text-danger" ErrorMessage="The email field is required." />
                                        </fieldset>
                                        <asp:Button runat="server" OnClick="Forgot" Text="Submit" CssClass="btn btn-default" />
                                        

                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </asp:PlaceHolder>
    <asp:PlaceHolder runat="server" ID="DisplayEmail" Visible="false">
    <div class="app-content content container-fluid">
            <div class="content-wrapper">
                <div class="content-header row">
                </div>
                <div class="content-body">
                    <section class="flexbox-container">
                        <div class="col-md-4 offset-md-4 col-xs-10 offset-xs-1 box-shadow-2 p-0">
                            <div class="card border-grey border-lighten-3 px-2 py-2 m-0">

                                <div class="card-body ">
                                    <div class="card-block">
   
                                            <p class="text-info">
                                                Please check your email to reset your password.
                                            </p>
                                       
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
        </div>
     </asp:PlaceHolder>
</asp:Content>



