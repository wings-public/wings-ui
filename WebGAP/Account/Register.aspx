<%@ Page Title="Register" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebGAP.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="SimpleContent">
    <webopt:BundleReference runat="server" Path="~/Secound/maincss" />
    <style>
        .checkBox-app-wrapper table tr {
            float: left;
        }
            .checkBox-app-wrapper table tr td {
                padding: 4px 7px 0px 7px;
                border-radius: 2px;
                margin-right: 20px;
                float: left;
                border: 1px solid #bbb;
                font-size: small;
            }
                .checkBox-app-wrapper table tr td label {
                    padding-left: 10px
                }
    </style>
    <div data-open="hover" data-menu="vertical-mmenu" data-col="1-column" class="vertical-layout vertical-mmenu 1-column bg-full-screen-image blank-page blank-page">
        <asp:PlaceHolder runat="server" ID="Form_reg">
            <div class="app-content  content">
                <div class="content-wrapper">
                    <div class="content-header row">
                    </div>
                    <div class="content-body">
                        <section class="flexbox-container">
                            <div class="col-12 d-flex align-items-center justify-content-center">
                                <div class="col-md-4 col-10 box-shadow-2 p-0">
                                    <div class="card border-grey border-lighten-3 m-0">

                                        <div class="card-body ">

                                            <p class="card-subtitle line-on-side text-muted text-center font-small-3 mx-2 my-1"><span>Register</span></p>
                                            <div class="card-block pt-1 pb-1">
                                                <div class="form-horizontal">
                                                    <fieldset class="form-group position-relative has-icon-left">
                                                        <asp:TextBox runat="server" ID="userfullname" CssClass="form-control" placeholder="Your Full Name" TextMode="SingleLine" required="true" />
                                                        <div class="form-control-position">
                                                            <i class="icon-head"></i>
                                                        </div>
                                                    </fieldset>
                                                    <fieldset class="form-group position-relative has-icon-left">
                                                        <asp:TextBox runat="server" ID="Email" CssClass="form-control" placeholder="Your Email Address" TextMode="Email" required="" />
                                                        <div class="form-control-position">
                                                            <i class="icon-mail6"></i>
                                                        </div>
                                                    </fieldset>
                                                    <fieldset class="form-group position-relative has-icon-left">
                                                        <asp:TextBox runat="server" ID="affiliation" CssClass="form-control" placeholder="Your Affiliation" TextMode="SingleLine" required="" />
                                                        <div class="form-control-position">
                                                            <i class="icon-university2"></i>
                                                        </div>
                                                    </fieldset>
                                                    <fieldset class="form-group position-relative has-icon-left">
                                                        <asp:TextBox runat="server" ID="Password" TextMode="Password" placeholder="Enter Password" CssClass="form-control" required="" />
                                                        <div class="form-control-position">
                                                            <i class="icon-key3"></i>
                                                        </div>
                                                        </fieldset> 
                                                      <fieldset class="form-group position-relative has-icon-left">
                                                         <asp:TextBox runat="server" ID="Password_repeat" TextMode="Password" placeholder="Reenter Password" CssClass="form-control" required="" />
                                                        <div class="form-control-position">
                                                            <i class="icon-key3"></i>
                                                        </div>
                                                      </fieldset>
                                                 

                                                    <fieldset class="form-group position-relative has-icon-left">
                                                        <asp:DropDownList ID="DDL_Centers" runat="server" DataTextField="CenterDesc" DataValueField="CenterID" OnSelectedIndexChanged="DDL_Centers_SelectedIndexChanged"
                                                            AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SDS_Centers" CssClass="form-control" required=""
                                                            class="btn btn-outline-info dropdown-toggle dropdown-menu-right mr-1 btn-sm">
                                                            <asp:ListItem Value="-1">Please select a center...</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <div class="form-control-position">
                                                            <i class="icon-svg"></i>
                                                        </div>
                                                    </fieldset>

                                                    <fieldset class="form-group position-relative checkBox-app-wrapper">
                                                        <asp:CheckBoxList ID="CBL_App" runat="server" AutoPostBack="false" RepeatLayout="Table" Width="432px" >
                                                        </asp:CheckBoxList>
                                                        <asp:DropDownList ID="DDL_App" runat="server" DataTextField="Application_Desc" DataValueField="Application"  
                                                            AppendDataBoundItems="True" AutoPostBack="false" DataSourceID="SDS_App" CssClass="form-control" required=""
                                                            class="btn btn-outline-info dropdown-toggle dropdown-menu-right mr-1 btn-sm"> 
                                                            <asp:ListItem Value="-1">Please select a application...</asp:ListItem>
                                                        </asp:DropDownList>
                                                         <div class="form-control-position">
                                                            <i class="icon-svg"></i>
                                                        </div>
                                                    </fieldset>

                                                   <%-- <div class="form-group row">
                                                        <div class="g-recaptcha" style="margin: 0 auto;" data-sitekey="6LfnpjcUAAAAAES8-sSVDW_GTo0UWjObQYBdvQHI"></div>
                                                    </div>--%>

                                                    <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-outline-info btn-block" />
                                                    <p class="text-info" style="text-align: center;padding-top: 10px; font-weight: 500;">
                                                        <span style="color:#DA4453;text-align:center"><asp:Literal runat="server" ID="ErrorMessage" /></span>
                                                        <span style="color:Green;text-align:center"><asp:Literal runat="server" ID="SuccessMessage" /></span>

                                                    </p>
                                                </div>
                                            </div>
                                            <p class="card-subtitle line-on-side text-muted text-center font-small-3 mx-2 my-1"><span>Already have an account?</span></p>
                                            <div class="card-block pt-1">
                                                <a href="Login.aspx" class="btn btn-outline-danger btn-block"><i class="icon-unlock2"></i>
                                                    Log in</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>

                    </div>
                </div>
            </div>
        </asp:PlaceHolder>
        <asp:PlaceHolder runat="server" ID="FeedBack" ViewStateMode="Disabled" Visible="false">
            <p class="text-danger">
                Confirmation Email Sent.
            </p>
        </asp:PlaceHolder>

    </div>

    <asp:SqlDataSource ID="SDS_Centers" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_Center_All_Sel" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SDS_App" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Select '10' as Application, 'WiNGs' as Application_Desc union 
                 Select '01' , 'Mindds' union   Select '11' , 'Both' "></asp:SqlDataSource>

    <script src='https://www.google.com/recaptcha/api.js'></script>
</asp:Content>


