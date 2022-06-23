<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="AssignIndividualToProband.aspx.cs" Inherits="WebGAP.PhenBook.AssignIndividualToProband" %>

<%@ Register Src="~/PhenBook/PopUp/uc_AssignIndividualToProband.ascx" TagPrefix="uc1" TagName="uc_AssignIndividualToProband" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">

    <uc1:uc_AssignIndividualToProband runat="server" id="uc_AssignIndividualToProband" />
</asp:Content>
