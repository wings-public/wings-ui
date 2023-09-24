<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="ReportDescription.aspx.cs" Inherits="WebGAP.GAP.ReportDescription" %>

<%@ Register Src="~/GAP/Popup/uc_ReportDescription.ascx" TagPrefix="uc1" TagName="uc_ReportDescription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_ReportDescription runat="server" id="uc_ReportDescription" />
</asp:Content>
