<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="SampleSheetScanLog.aspx.cs" Inherits="WebGAP.Admin.SampleSheetScanLog" %>

<%@ Register Src="~/Admin/uc/uc_SampleSheetScanLog.ascx" TagPrefix="uc1" TagName="uc_SampleSheetScanLog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_SampleSheetScanLog runat="server" id="uc_SampleSheetScanLog" />
</asp:Content>
