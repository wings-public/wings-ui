<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="Seq_QualityHistogram.aspx.cs" Inherits="WebGAP.GAP.Seq_QualityHistogram" %>

<%@ Register Src="~/GAP/uc/uc_Sample_Quality.ascx" TagPrefix="uc1" TagName="uc_Sample_Quality" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_Sample_Quality runat="server" ID="uc_Sample_Quality" />
</asp:Content>
