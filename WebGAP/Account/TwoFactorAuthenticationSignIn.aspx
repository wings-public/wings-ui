<%@ Page Title="Two-Factor Authentication" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="TwoFactorAuthenticationSignIn.aspx.cs" Inherits="WebGAP.Account.TwoFactorAuthenticationSignIn" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="SimpleContent" runat="server">
    <webopt:BundleReference runat="server" Path="~/Secound/maincss" />
    <div class="app-content content">
        <div class="content-wrapper">
            <div class="content-body">
                <section class="flexbox-container">
                    <div class="col-md-4 offset-md-4 col-xs-10 offset-xs-1  box-shadow-2 p-0">
                        <div class="card border-grey border-lighten-3 m-0">

                            <asp:PlaceHolder runat="server" ID="sendcode">
                                <div class="card-body">
                                    <div class="card-block">
                                        <div class="form-horizontal">
                                            <section style="padding: 20px 0">
                                                <h4>Send security code</h4>
                                                <hr />
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        Select Two-Factor Authentication Provider:
                                                        <asp:DropDownList runat="server" ID="Providers">
                                                        </asp:DropDownList>
                                                        <hr />
                                                        <asp:Button Text="Submit" ID="ProviderSubmit" OnClick="ProviderSubmit_Click" CssClass="btn btn-default" runat="server" />
                                                    </div>
                                                </div>
                                            </section>
                                        </div>
                                    </div>
                                </div>
                            </asp:PlaceHolder>

                            <asp:PlaceHolder runat="server" ID="verifycode" Visible="false">
                                <div class="card-body">
                                    <div class="card-block">
                                        <div class="form-horizontal">
                                            <section style="padding: 20px 0">
                                                <asp:HiddenField ID="SelectedProvider" runat="server" />
                                                <h4>Enter security code</h4>
                                                <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                                    <p class="text-danger">
                                                        <asp:Literal runat="server" ID="FailureText" />
                                                    </p>
                                                </asp:PlaceHolder>
                                                <fieldset class="form-group">
                                                    <asp:Label Text="Code:" runat="server" AssociatedControlID="Code" CssClass="col-md-2 control-label" />
                                                    <div class="col-md-10">
                                                        <asp:TextBox runat="server" ID="Code" CssClass="form-control" />
                                                    </div>

                                                </fieldset>

                                                <fieldset class="form-group">
                                                    <div class="col-md-offset-2 col-md-4 pt-1">
                                                        <div class="checkbox">
                                                            <asp:Label Text="Remember Browser" runat="server" />
                                                            <asp:CheckBox Text="" ID="RememberBrowser" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class=" col-md-6 col-xs-12 float-sm-left text-xs-center pt-1">
                                                        <asp:LinkButton runat="server" OnClick="ProviderSubmit_Click"> Did not get a code?</asp:LinkButton>

                                                    </div>
                                                </fieldset>

                                                <fieldset class="form-group">
                                                    <div class="form-actions  pt-1 pb-1 center">
                                                        <asp:Button Text="Submit" ID="CodeSubmit" OnClick="CodeSubmit_Click" CssClass="btn btn-default" runat="server" />
                                                    </div>
                                                </fieldset>


                                            </section>

                                        </div>
                                    </div>

                                </div>
                            </asp:PlaceHolder>
                        </div>

                    </div>
                </section>
            </div>
        </div>
    </div>
</asp:Content>

