<%@ Page Title="PI Sample" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="PI_Sample.aspx.cs" Inherits="WebGAP.ACL.PI_Sample" %>

<%@ Register Src="~/ACL/uc/uc_PI_Sample.ascx" TagPrefix="uc1" TagName="uc_PI_Sample" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_PI_Sample runat="server" id="uc_PI_Sample" />
</asp:Content>
