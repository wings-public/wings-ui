<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="Show_GenePanel_Genes.aspx.cs" Inherits="WebGAP.GAP.Show_GenePanel_Genes" %>

<%@ Register Src="~/GAP/Popup/uc_Show_GenePanel_Genes.ascx" TagPrefix="uc1" TagName="uc_Show_GenePanel_Genes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_Show_GenePanel_Genes runat="server" id="uc_Show_GenePanel_Genes" />
</asp:Content>

