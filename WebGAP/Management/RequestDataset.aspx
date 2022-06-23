<%@ Page Title="Request Dataset" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="RequestDataset.aspx.cs" Inherits="WebGAP.Management.RequestDataset" %>

<%@ Register Src="~/Management/uc/uc_RequestDataset.ascx" TagPrefix="uc1" TagName="uc_RequestDataset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_RequestDataset runat="server" id="uc_RequestDataset" />
</asp:Content>
