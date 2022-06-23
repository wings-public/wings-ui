<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="AddNewUserToDataset.aspx.cs" Inherits="WebGAP.ACL.AddNewUserToDataset" %>

<%@ Register Src="~/ACL/Popup/uc_AddNewUserToDataset.ascx" TagPrefix="uc1" TagName="uc_AddNewUserToDataset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_AddNewUserToDataset runat="server" ID="uc_AddNewUserToDataset" />
</asp:Content>
