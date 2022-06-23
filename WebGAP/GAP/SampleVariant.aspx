<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="SampleVariant.aspx.cs" Inherits="WebGAP.GAP.SampleVariant" %>

<%@ Register Src="~/GAP/uc/uc_SampleVariant.ascx" TagPrefix="uc1" TagName="uc_SampleVariant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_SampleVariant runat="server" ID="uc_SampleVariant" />
</asp:Content>
