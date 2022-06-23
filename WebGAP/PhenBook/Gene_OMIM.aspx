<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="Gene_OMIM.aspx.cs" Inherits="WebGAP.PhenBook.Gene_OMIM" %>

<%@ Register Src="~/PhenBook/PopUp/uc_Gene_OMIM.ascx" TagPrefix="uc1" TagName="uc_Gene_OMIM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_Gene_OMIM runat="server" id="uc_Gene_OMIM" />
</asp:Content>
