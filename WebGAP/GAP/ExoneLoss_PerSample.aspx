<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="ExoneLoss_PerSample.aspx.cs" Inherits="WebGAP.GAP.ExoneLoss_PerSample" %>
<%@ Register Src="~/GAP/uc/uc_ExoneLoss_PerSample.ascx" TagPrefix="uc1" TagName="uc_ExoneLoss_PerSample" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_ExoneLoss_PerSample runat="server" id="uc_ExoneLoss_PerSample" />
</asp:Content>