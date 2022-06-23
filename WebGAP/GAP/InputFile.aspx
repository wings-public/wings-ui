<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="InputFile.aspx.cs" Inherits="WebGAP.PhenBook.InputFile" %>

<%@ Register Src="~/GAP/uc/uc_InputFile.ascx" TagPrefix="uc1" TagName="uc_InputFile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_InputFile runat="server" id="uc_InputFile" />
</asp:Content>
