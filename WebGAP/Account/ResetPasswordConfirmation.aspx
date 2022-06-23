<%@ Page Title="Password Changed" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="ResetPasswordConfirmation.aspx.cs" Inherits="WebGAP.Account.ResetPasswordConfirmation" Async="true" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="SimpleContent">

  

   <div class="app-content content container-fluid">
    <div class="content-wrapper">
        <div class="content-header row">
        </div>
        <div class="content-body">
            <section class="flexbox-container">
                <div class="col-md-4 offset-md-4 col-xs-10 offset-xs-1 box-shadow-2 p-0">
                    <div class="card border-grey border-lighten-3 px-2 py-2 m-0">
                          <h2><%: Title %>.</h2>
                        <div class="card-body ">
                            <div class="card-block">
                                <p>
                                    Your password has been changed. 
                            </div>
                        </div>
                    </div>
                </div>

            </section>
        </div>
    </div>
</div>


</asp:Content>


