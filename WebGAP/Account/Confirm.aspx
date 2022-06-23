<%@ Page Title="Account Confirmation" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="Confirm.aspx.cs" Inherits="WebGAP.Account.Confirm" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="SimpleContent">

    <div class="app-content  content">
        <div class="content-wrapper">
            <div class="content-header row">
            </div>
            <div class="content-body" style="margin-top: 10%;">
                <section class="flexbox-container">
                    <div class="col-12 d-flex align-items-center justify-content-center">
                        <div class="col-md-4 col-10 box-shadow-2 p-0">
                            <div class="card border-grey border-lighten-3 m-0">
                                <div class="card-header border-0">
                                    <div class="card-title text-center">
                                        <div class="p-1">

                                            <asp:PlaceHolder runat="server" ID="successPanel" ViewStateMode="Disabled" Visible="true">
                                                <img src="http://wings.esat.kuleuven.be/img/mail/approved-img.png" width="250" />
                                                <h2><%: Title %></h2>
                                                <p class="card-subtitle line-on-side text-muted text-center font-small-3 mx-2 my-1"></p>
                                                <h3>Thank you for confirming your account. </h3>
                                                <h6>We will accept your account within 24 hours after confirming via admin.</h6>
                                            </asp:PlaceHolder>
                                            <asp:PlaceHolder runat="server" ID="errorPanel" ViewStateMode="Disabled" Visible="false">
                                                <p class="text-danger">
                                                    An error has occurred.
                                                </p>
                                            </asp:PlaceHolder>
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










    <%--    <div>
        <asp:PlaceHolder runat="server" ID="successPanel" ViewStateMode="Disabled" Visible="true">
            <p>
                Thank you for confirming your account.
               
            </p>
        </asp:PlaceHolder>
        <asp:PlaceHolder runat="server" ID="errorPanel" ViewStateMode="Disabled" Visible="false">
            <p class="text-danger">
                An error has occurred.
            </p>
        </asp:PlaceHolder>
   
    </div>--%>
</asp:Content>
