<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="Phenotypes_History.aspx.cs" Inherits="WebGAP.PhenBook.Phenotypes_History" %>

<%@ Register Src="~/PhenBook/His/uc_Phenotypes_History.ascx" TagPrefix="uc1" TagName="uc_Phenotypes_History" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_Phenotypes_History runat="server" id="uc_Phenotypes_History" />
</asp:Content>
