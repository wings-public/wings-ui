<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="TrioVariant_Filter.aspx.cs" Inherits="WebGAP.GAP.Trio.TrioVariant_Filter" %>

<%@ Register Src="~/GAP/Trio/uc/uc_TrioVariant_Filter.ascx" TagPrefix="uc1" TagName="uc_TrioVariant_Filter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_TrioVariant_Filter runat="server" id="uc_TrioVariant_Filter" />
</asp:Content>
