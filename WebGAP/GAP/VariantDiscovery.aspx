<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="VariantDiscovery.aspx.cs" Inherits="WebGAP.GAP.VariantDiscovery" %>
<%@ Register src="uc/uc_VariantDiscovery.ascx" tagname="uc_VariantDiscovery" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_VariantDiscovery ID="uc_VariantDiscovery" runat="server" />
</asp:Content>