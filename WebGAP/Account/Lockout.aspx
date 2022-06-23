<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="Lockout.aspx.cs" Inherits="WebGAP.Account.Lockout" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="SimpleContent" runat="server">
    <hgroup>
        <h1>Locked out.</h1>
        <h2 class="text-danger">This account has been locked out, please try again later.</h2>
    </hgroup>
</asp:Content>
