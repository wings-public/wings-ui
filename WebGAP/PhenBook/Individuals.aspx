<%@ Page Title="Individuals" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="Individuals.aspx.cs" Inherits="WebGAP.PhenBook.Individuals" %>

<%@ Register Src="~/PhenBook/uc/uc_Individuals.ascx" TagPrefix="uc1" TagName="uc_Individuals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_Individuals runat="server" ID="uc_Individuals" />
</asp:Content>
