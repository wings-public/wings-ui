<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="SampleResult.aspx.cs" Inherits="WebGAP.GAP.SampleResult" %>

<%@ Register Src="~/GAP/uc/uc_SampleResult.ascx" TagPrefix="uc1" TagName="uc_SampleResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_SampleResult runat="server" id="uc_SampleResult" />
</asp:Content>