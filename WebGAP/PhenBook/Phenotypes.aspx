<%@ Page Title="Phenotype" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="Phenotypes.aspx.cs" Inherits="WebGAP.PhenBook.Phenotypes" %>

<%@ Register Src="~/PhenBook/uc/uc_Phenotypes.ascx" TagPrefix="uc1" TagName="uc_Phenotypes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_Phenotypes runat="server" id="uc_Phenotypes" />
</asp:Content>
