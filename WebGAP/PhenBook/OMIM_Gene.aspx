<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="OMIM_Gene.aspx.cs" Inherits="WebGAP.PhenBook.OMIM_Gene" %>

<%@ Register Src="~/PhenBook/PopUp/uc_OMIM_Gene.ascx" TagPrefix="uc1" TagName="uc_OMIM_Gene" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_OMIM_Gene runat="server" id="uc_OMIM_Gene" />
</asp:Content>
