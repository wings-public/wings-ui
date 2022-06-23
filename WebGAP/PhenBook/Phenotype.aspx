<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="Phenotype.aspx.cs" Inherits="WebGAP.PhenBook.Phenotype" %>

<%@ Register Src="~/PhenBook/uc/uc_Phenotype.ascx" TagPrefix="uc1" TagName="uc_Phenotype" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_Phenotype runat="server" id="uc_Phenotype" />
</asp:Content>
