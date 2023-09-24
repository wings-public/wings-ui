<%@ Page Title="Clinical Report" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="ClinicalReport.aspx.cs" Inherits="WebGAP.GAP.ClinicalReport" %>

<%@ Register Src="~/GAP/uc/uc_ClinicalReport.ascx" TagPrefix="uc1" TagName="uc_ClinicalReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_ClinicalReport runat="server" ID="uc_ClinicalReport" />
</asp:Content>
