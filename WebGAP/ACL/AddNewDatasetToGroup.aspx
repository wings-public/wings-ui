<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="AddNewDatasetToGroup.aspx.cs" Inherits="WebGAP.ACL.AddNewDatasetToGroup" %>

<%@ Register Src="~/ACL/Popup/uc_AddNewDatasetToGroup.ascx" TagPrefix="uc1" TagName="uc_AddNewDatasetToGroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_AddNewDatasetToGroup runat="server" ID="uc_AddNewDatasetToGroup" />
</asp:Content>
