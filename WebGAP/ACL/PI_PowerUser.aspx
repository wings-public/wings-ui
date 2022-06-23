<%@ Page Title="PI PowerUser" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true"  CodeBehind="PI_PowerUser.aspx.cs" Inherits="WebGAP.ACL.PI_PowerUser" %>

<%@ Register Src="~/ACL/uc/uc_PI_PowerUser.ascx" TagPrefix="uc1" TagName="uc_PI_PowerUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_PI_PowerUser runat="server" id="uc_PI_PowerUser" />
</asp:Content>
