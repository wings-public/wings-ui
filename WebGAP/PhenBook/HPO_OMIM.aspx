<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="HPO_OMIM.aspx.cs" Inherits="WebGAP.PhenBook.HPO_OMIM" %>

<%@ Register Src="~/PhenBook/PopUp/uc_HPO_OMIM.ascx" TagPrefix="uc1" TagName="uc_HPO_OMIM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_HPO_OMIM runat="server" ID="uc_HPO_OMIM" />
</asp:Content>
