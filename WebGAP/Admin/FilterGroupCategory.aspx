<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="FilterGroupCategory.aspx.cs" Inherits="WebGAP.Admin.FilterGroupCategory" %>
<%@ Register Src="~/Admin/uc/uc_FilterGroupCategory.ascx" TagPrefix="uc1" TagName="uc_FilterGroupCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_FilterGroupCategory runat="server" id="uc_FilterGroupCategory" />
</asp:Content>