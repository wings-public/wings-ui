<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="FilterCategory.aspx.cs" Inherits="WebGAP.Admin.FilterCategory" %>

<%@ Register Src="~/Admin/uc/uc_FilterCategory.ascx" TagPrefix="uc1" TagName="uc_FilterCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_FilterCategory runat="server" id="uc_FilterCategory" />
</asp:Content>