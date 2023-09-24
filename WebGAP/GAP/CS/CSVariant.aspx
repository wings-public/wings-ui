<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="CSVariant.aspx.cs" Inherits="WebGAP.GAP.CS.CSVariant" %>

<%@ Register Src="~/GAP/CS/uc/uc_CSVariant.ascx" TagPrefix="uc1" TagName="uc_CSVariant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_CSVariant runat="server" ID="uc_CSVariant" />
</asp:Content>
