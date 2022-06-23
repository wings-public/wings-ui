<%@ Page Title="PI Users" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="PI_User.aspx.cs" Inherits="WebGAP.ACL.PI_User" %>

<%@ Register Src="~/ACL/uc/uc_PI_User.ascx" TagPrefix="uc1" TagName="uc_PI_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_PI_User runat="server" id="uc_PI_User" />
</asp:Content>
