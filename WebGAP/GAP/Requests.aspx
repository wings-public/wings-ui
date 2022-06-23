<%@ Page Title="Requests" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="Requests.aspx.cs" Inherits="WebGAP.GAP.Requests" %>

<%@ Register Src="~/GAP/uc/uc_Requests.ascx" TagPrefix="uc1" TagName="uc_Requests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_Requests runat="server" id="uc_Requests" />
</asp:Content>
