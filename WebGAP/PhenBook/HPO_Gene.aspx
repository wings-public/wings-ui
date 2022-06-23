<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="HPO_Gene.aspx.cs" Inherits="WebGAP.PhenBook.HPO_Gene" %>

<%@ Register Src="~/PhenBook/PopUp/uc_HPO_Gene.ascx" TagPrefix="uc1" TagName="uc_HPO_Gene" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_HPO_Gene runat="server" ID="uc_HPO_Gene" />
</asp:Content>
