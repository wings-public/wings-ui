<%@ Page Title="Family" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="Family.aspx.cs" Inherits="WebGAP.PhenBook.Family" %>

<%@ Register Src="~/PhenBook/uc/uc_Family.ascx" TagPrefix="uc1" TagName="uc_Family" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_Family runat="server" id="uc_Family" />
</asp:Content>
