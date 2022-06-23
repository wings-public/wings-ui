<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="AddNewUserForPI.aspx.cs" Inherits="WebGAP.ACL.AddNewUserForPI" %>

<%@ Register Src="~/ACL/Popup/uc_AddNewUserForPI.ascx" TagPrefix="uc1" TagName="uc_AddNewUserForPI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_AddNewUserForPI runat="server" ID="uc_AddNewUserForPI" />
</asp:Content>
