<%@ Page Title="Group Users" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="Group_Users.aspx.cs" Inherits="WebGAP.ACL.Group_Users" %>


<%@ Register Src="~/ACL/uc/uc_Group_Users.ascx" TagPrefix="uc1" TagName="uc_Group_Users" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <uc1:uc_Group_Users runat="server" ID="uc_Group_Users" />
</asp:Content>
