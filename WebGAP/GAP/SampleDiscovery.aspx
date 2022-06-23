<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="SampleDiscovery.aspx.cs" Inherits="WebGAP.GAP.SampleDiscovery" %>

<%@ Register Src="~/GAP/uc/uc_SampleDiscovery.ascx" TagPrefix="uc1" TagName="uc_SampleDiscovery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_SampleDiscovery runat="server" id="uc_SampleDiscovery" />
</asp:Content>
