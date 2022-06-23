<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="Create_UserPanelList.aspx.cs" Inherits="WebGAP.GAP.Create_UserPanelList" %>

<%@ Register Src="~/GAP/Popup/uc_Create_UserPanelList.ascx" TagPrefix="uc1" TagName="uc_Create_UserPanelList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_Create_UserPanelList runat="server" id="uc_Create_UserPanelList" />
    </asp:Content>