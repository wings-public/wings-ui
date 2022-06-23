<%@ Page Title="Activate User" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="ActivateUser.aspx.cs" Inherits="WebGAP.ACL.ActivateUser" %>

<%@ Register Src="~/ACL/uc/uc_ActivateUser.ascx" TagPrefix="uc1" TagName="uc_ActivateUser" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_ActivateUser runat="server" id="uc_ActivateUser" />
</asp:Content>
