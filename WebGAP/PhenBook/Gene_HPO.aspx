<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="Gene_HPO.aspx.cs" Inherits="WebGAP.PhenBook.Gene_HPO" %>

<%@ Register Src="~/PhenBook/PopUp/uc_Gene_HPO.ascx" TagPrefix="uc1" TagName="uc_Gene_HPO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_Gene_HPO runat="server" id="uc_Gene_HPO" />
</asp:Content>
