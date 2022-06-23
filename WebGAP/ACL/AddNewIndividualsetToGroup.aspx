<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="AddNewIndividualsetToGroup.aspx.cs" Inherits="WebGAP.ACL.AddNewIndividualsetToGroup" %>

<%@ Register Src="~/ACL/Popup/uc_AddNewIndividualsetToGroup.ascx" TagPrefix="uc1" TagName="uc_AddNewIndividualsetToGroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_AddNewIndividualsetToGroup runat="server" id="uc_AddNewIndividualsetToGroup" />
</asp:Content>
