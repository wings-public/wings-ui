<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="SampleVariant_Filter.aspx.cs" Inherits="WebGAP.GAP.SampleVariant_Filter" %>

<%@ Register Src="~/GAP/uc/uc_SampleVariant_Filter.ascx" TagPrefix="uc1" TagName="uc_SampleVariant_Filter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_SampleVariant_Filter runat="server" ID="uc_SampleVariant_Filter" />
</asp:Content>
