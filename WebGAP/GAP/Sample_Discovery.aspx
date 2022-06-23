<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="Sample_Discovery.aspx.cs" Inherits="WebGAP.GAP.Sample_Discovery" %>

<%@ Register Src="~/GAP/uc/uc_Sample_Discovery.ascx" TagPrefix="uc1" TagName="uc_Sample_Discovery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_Sample_Discovery runat="server" ID="uc_Sample_Discovery" />
</asp:Content>
