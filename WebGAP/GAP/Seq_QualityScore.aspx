<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="Seq_QualityScore.aspx.cs" Inherits="WebGAP.GAP.Seq_QualityScore" %>

<%@ Register Src="~/GAP/uc/uc_Seq_QualityScore.ascx" TagPrefix="uc1" TagName="uc_Seq_QualityScore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_Seq_QualityScore runat="server" id="uc_Seq_QualityScore" />
</asp:Content>
