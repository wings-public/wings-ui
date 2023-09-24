<%@ Page Title="Mutation Description" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="Report_Mutation_Description.aspx.cs" Inherits="WebGAP.GAP.Report_Mutation_Description" %>

<%@ Register Src="~/GAP/Popup/uc_Report_Mutation_Description.ascx" TagPrefix="uc1" TagName="uc_Report_Mutation_Description" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_Report_Mutation_Description runat="server" id="uc_Report_Mutation_Description" />
</asp:Content>
