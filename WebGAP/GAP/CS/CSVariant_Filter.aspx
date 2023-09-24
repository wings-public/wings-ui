<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="CSVariant_Filter.aspx.cs" Inherits="WebGAP.GAP.CS.CSVariant_Filter" %>

<%@ Register Src="~/GAP/CS/uc/uc_CSVariant_Filter.ascx" TagPrefix="uc1" TagName="uc_CSVariant_Filter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_CSVariant_Filter runat="server" ID="uc_CSVariant_Filter" />
</asp:Content>
