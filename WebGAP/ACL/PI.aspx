<%@ Page Title="PIs" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="PI.aspx.cs" Inherits="WebGAP.ACL.PI" %>

<%@ Register Src="~/ACL/uc/uc_PI.ascx" TagPrefix="uc1" TagName="uc_PI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_PI runat="server" id="uc_PI" />
</asp:Content>
