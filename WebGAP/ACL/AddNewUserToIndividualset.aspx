<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="AddNewUserToIndividualset.aspx.cs" Inherits="WebGAP.ACL.AddNewUserToIndividualset" %>

<%@ Register Src="~/ACL/Popup/uc_AddNewUserToIndividualset.ascx" TagPrefix="uc1" TagName="uc_AddNewUserToIndividualset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_AddNewUserToIndividualset runat="server" id="uc_AddNewUserToIndividualset" />
</asp:Content>
