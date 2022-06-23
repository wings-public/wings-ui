<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="TrioVariant.aspx.cs" Inherits="WebGAP.GAP.Trio.TrioVariant" %>

<%@ Register Src="~/GAP/Trio/uc/uc_TrioVariant.ascx" TagPrefix="uc1" TagName="uc_TrioVariant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_TrioVariant runat="server" ID="uc_TrioVariant" />
</asp:Content>
