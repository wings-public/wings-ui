<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="OMIM_HPO.aspx.cs" Inherits="WebGAP.PhenBook.OMIM_HPO" %>

<%@ Register Src="~/PhenBook/PopUp/uc_OMIM_HPO.ascx" TagPrefix="uc1" TagName="uc_OMIM_HPO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_OMIM_HPO runat="server" id="uc_OMIM_HPO" />
</asp:Content>
