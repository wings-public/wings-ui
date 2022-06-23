<%@ Page Title="Results" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="WebGAP.GAP.Results" %>

<%@ Register Src="~/GAP/uc/uc_Results.ascx" TagPrefix="uc1" TagName="uc_Results" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_Results runat="server" ID="uc_Results" />
</asp:Content>
