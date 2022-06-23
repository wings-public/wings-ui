<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="ExoneLoss_AllSamples.aspx.cs" Inherits="WebGAP.GAP.ExoneLoss_AllSamples" %>
<%@ Register Src="~/GAP/uc/uc_ExoneLoss_AllSamples.ascx" TagPrefix="uc1" TagName="uc_ExoneLoss_AllSamples" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_ExoneLoss_AllSamples runat="server" id="uc_ExoneLoss_AllSamples" />
</asp:Content>