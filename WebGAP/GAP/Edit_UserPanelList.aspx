<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="Edit_UserPanelList.aspx.cs" Inherits="WebGAP.GAP.Edit_UserPanelList" %>
<%@ Register Src="~/GAP/Popup/uc_Edit_UserPanelList.ascx" TagPrefix="uc1" TagName="uc_Edit_UserPanelList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_Edit_UserPanelList runat="server" id="uc_Edit_UserPanelList" />
</asp:Content>
