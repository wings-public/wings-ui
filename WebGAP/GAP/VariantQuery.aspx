<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" EnableEventValidation="false" Async="true" AutoEventWireup="true" CodeBehind="VariantQuery.aspx.cs" Inherits="WebGAP.GAP.VariantQuery" %>

<%@ Register Src="~/GAP/uc/uc_VariantQuery.ascx" TagPrefix="uc1" TagName="uc_VariantQuery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_VariantQuery runat="server" id="uc_VariantQuery" />
</asp:Content>