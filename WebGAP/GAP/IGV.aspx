<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="IGV.aspx.cs" Inherits="WebGAP.GAP.IGV" %>

<%@ Register Src="~/GAP/Popup/uc_IGV.ascx" TagPrefix="uc1" TagName="uc_IGV" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_IGV runat="server" id="uc_IGV" />
</asp:Content>
