<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" EnableEventValidation="false" Async="true" AutoEventWireup="true" CodeBehind="SampleQuery.aspx.cs" Inherits="WebGAP.GAP.SampleQuery" %>

<%@ Register Src="~/GAP/uc/uc_SampleQuery.ascx" TagPrefix="uc1" TagName="uc_SampleQuery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_SampleQuery runat="server" id="uc_SampleQuery" />
</asp:Content>