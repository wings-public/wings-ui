<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="VariantDiscovery_Result.aspx.cs" Inherits="WebGAP.GAP.VariantDiscovery_Result1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%@ Register Src="~/GAP/uc/uc_VariantDiscovery_Result.ascx" TagPrefix="uc1" TagName="uc_VariantDiscovery_Result" %>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <uc1:uc_VariantDiscovery_Result runat="server" id="uc_VariantDiscovery_Result" />

</asp:Content>
