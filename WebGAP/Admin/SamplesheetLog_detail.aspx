<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="SamplesheetLog_detail.aspx.cs" Inherits="WebGAP.Admin.SamplesheetLog_detail" %>

<%@ Register Src="~/Admin/Popup/uc_SamplesheetLog_detail.ascx" TagPrefix="uc1" TagName="uc_SamplesheetLog_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_SamplesheetLog_detail runat="server" id="uc_SamplesheetLog_detail" />
</asp:Content>
