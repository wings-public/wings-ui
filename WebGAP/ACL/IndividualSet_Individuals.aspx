<%@ Page Title="Individualset Individuals" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="IndividualSet_Individuals.aspx.cs" Inherits="WebGAP.ACL.IndividualSet_Individuals" %>
<%@ Register Src="~/ACL/uc/uc_IndividualSet_Individuals.ascx" TagPrefix="uc1" TagName="uc_IndividualSet_Individuals" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_IndividualSet_Individuals runat="server" ID="uc_IndividualSet_Individuals" />
</asp:Content>
