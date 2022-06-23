<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="Show_GeneRelatedToOMIM.aspx.cs" Inherits="WebGAP.GAP.Show_GeneRelatedToOMIM" %>

<%@ Register Src="~/GAP/Popup/uc_Show_GeneRelatedToOMIM.ascx" TagPrefix="uc1" TagName="uc_Show_GeneRelatedToOMIM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_Show_GeneRelatedToOMIM runat="server" id="uc_Show_GeneRelatedToOMIM" />
</asp:Content>



