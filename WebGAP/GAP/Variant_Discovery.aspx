<%@ Page Title="Variant Discovery" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="Variant_Discovery.aspx.cs" Inherits="WebGAP.GAP.Variant_Discovery" %>
<%@ Register src="uc/uc_Variant_Discovery.ascx" tagname="uc_Variant_Discovery" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_Variant_Discovery ID="uc_Variant_Discovery1" runat="server" />
</asp:Content>
