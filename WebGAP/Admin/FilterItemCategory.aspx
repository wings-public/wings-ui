<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="FilterItemCategory.aspx.cs" Inherits="WebGAP.Admin.FilterItemCategory" %>

<%@ Register Src="~/Admin/uc/uc_FilterItemCategory.ascx" TagPrefix="uc1" TagName="uc_FilterItemCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_FilterItemCategory runat="server" id="uc_FilterItemCategory" />
</asp:Content>