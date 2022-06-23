<%@ Page Title="Dataset Permission " Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="AskDatasetPermission_Sample.aspx.cs" Inherits="WebGAP.Management.AskDatasetPermission_Sample" %>

<%@ Register Src="~/Management/Popup/uc_AskDatasetPermission_Sample.ascx" TagPrefix="uc1" TagName="uc_AskDatasetPermission_Sample" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_AskDatasetPermission_Sample runat="server" ID="uc_AskDatasetPermission_Sample" />
</asp:Content>
