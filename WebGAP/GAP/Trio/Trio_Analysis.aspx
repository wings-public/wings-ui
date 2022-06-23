<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="Trio_Analysis.aspx.cs" Inherits="WebGAP.GAP.Trio.Trio_Analysis" %>

<%@ Register Src="~/GAP/Trio/uc/uc_Trio_Analysis.ascx" TagPrefix="uc1" TagName="uc_Trio_Analysis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_Trio_Analysis runat="server" id="uc_Trio_Analysis" />
</asp:Content>
