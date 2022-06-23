<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="AddFamilyMembers.aspx.cs" Inherits="WebGAP.PhenBook.AddFamilyMembers" %>

<%@ Register Src="~/PhenBook/PopUp/uc_AddFamilyMembers.ascx" TagPrefix="uc1" TagName="uc_AddFamilyMembers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_AddFamilyMembers runat="server" ID="uc_AddFamilyMembers" />
</asp:Content>
