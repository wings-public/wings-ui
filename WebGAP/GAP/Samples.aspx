<%@ Page Title="Samples" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="Samples.aspx.cs" Inherits="WebGAP.PhenBook.Samples" %>

<%@ Register Src="~/GAP/uc/uc_Samples.ascx" TagPrefix="uc1" TagName="uc_Samples" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_Samples runat="server" ID="uc_Samples" />
</asp:Content>
