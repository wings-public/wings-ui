<%@ Page Title="Add New User" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="AddNewUserToGroup.aspx.cs" Inherits="WebGAP.ACL.AddNewUserToGroup" %>

<%@ Register Src="~/ACL/Popup/uc_AddNewUserToGroup.ascx" TagPrefix="uc1" TagName="uc_AddNewUserToGroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_AddNewUserToGroup runat="server" ID="uc_AddNewUserToGroup" />
</asp:Content>
