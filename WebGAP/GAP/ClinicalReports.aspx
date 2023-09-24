<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="ClinicalReports.aspx.cs" Inherits="WebGAP.GAP.ClinicalReports" %>

<%@ Register Src="~/GAP/uc/uc_ClinicalReports.ascx" TagPrefix="uc1" TagName="uc_ClinicalReports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_ClinicalReports runat="server" id="uc_ClinicalReports" />
</asp:Content>
