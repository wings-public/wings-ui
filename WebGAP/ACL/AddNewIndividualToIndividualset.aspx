<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="AddNewIndividualToIndividualset.aspx.cs" Inherits="WebGAP.ACL.AddNewIndividualToIndividualset" %>

<%@ Register Src="~/ACL/Popup/uc_AddNewIndividualToIndividualset.ascx" TagPrefix="uc1" TagName="uc_AddNewIndividualToIndividualset" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_AddNewIndividualToIndividualset runat="server" ID="uc_AddNewIndividualToIndividualset" />
</asp:Content>
