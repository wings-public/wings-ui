<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VariantDiscovery_Resultc.aspx.cs" Inherits="WebGAP.GAP.VariantDiscovery_Result" %>

<%@ Register Src="~/GAP/uc/uc_VariantDiscovery_Result.ascx" TagPrefix="uc1" TagName="uc_VariantDiscovery_Result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:uc_VariantDiscovery_Result runat="server" id="uc_VariantDiscovery_Result" />
</asp:Content>
