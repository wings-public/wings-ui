<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="UserPanelList.aspx.cs" Inherits="WebGAP.GAP.UserPanelList" %>
<%@ Register Src="~/GAP/uc/uc_UserPanelList.ascx" TagPrefix="uc1" TagName="uc_UserPanelList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_UserPanelList runat="server" id="uc_UserPanelList" />
</asp:Content>

