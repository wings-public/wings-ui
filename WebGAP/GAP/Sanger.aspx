<%@ Page Title="Sanger" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="Sanger.aspx.cs" Inherits="WebGAP.GAP.Sanger" %>

<%@ Register Src="~/GAP/Popup/uc_Sanger.ascx" TagPrefix="uc1" TagName="uc_Sanger" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_Sanger runat="server" id="uc_Sanger" />
</asp:Content>
