<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="AskDatasetPermission.aspx.cs" Inherits="WebGAP.Management.AskDatasetPermission" %>

<%@ Register Src="~/Management/Popup/uc_AskDatasetPermission.ascx" TagPrefix="uc1" TagName="uc_AskDatasetPermission" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_AskDatasetPermission runat="server" id="uc_AskDatasetPermission" />
</asp:Content>
