<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="DrawPedigree.aspx.cs" Inherits="WebGAP.PhenBook.DrawPedigree" %>

<%@ Register Src="~/PhenBook/PopUp/uc_DrawPedigree.ascx" TagPrefix="uc1" TagName="uc_DrawPedigree" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_DrawPedigree runat="server" ID="uc_DrawPedigree" />
</asp:Content>
