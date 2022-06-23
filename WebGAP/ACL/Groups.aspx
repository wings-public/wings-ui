<%@ Page Title="Groups" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="Groups.aspx.cs" Inherits="WebGAP.ACL.Groups" %>

<%@ Register Src="~/ACL/uc/uc_Groups.ascx" TagPrefix="uc1" TagName="uc_Groups" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_Groups runat="server" id="uc_Groups" />
</asp:Content>
