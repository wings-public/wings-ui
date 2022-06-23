<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="FilterOperation.aspx.cs" Inherits="WebGAP.Admin.FilterOperation" %>
<%@ Register Src="~/Admin/uc/uc_FilterOperation.ascx" TagPrefix="uc1" TagName="uc_FilterOperation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_FilterOperation runat="server" id="uc_FilterOperation" />
</asp:Content>