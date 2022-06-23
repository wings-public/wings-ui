<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="Show_GeneRelatedToHPO.aspx.cs" Inherits="WebGAP.GAP.Show_GeneRelatedToHPO" %>

<%@ Register Src="~/GAP/Popup/uc_Show_GeneRelatedToHPO.ascx" TagPrefix="uc1" TagName="uc_Show_GeneRelatedToHPO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_Show_GeneRelatedToHPO runat="server" id="uc_Show_GeneRelatedToHPO" />
</asp:Content>


