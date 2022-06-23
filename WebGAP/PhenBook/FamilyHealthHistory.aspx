<%@ Page Title="Family Health Portrait" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="FamilyHealthHistory.aspx.cs" Inherits="WebGAP.PhenBook.FamilyHealthHistory" %>

<%@ Register Src="~/PhenBook/uc/uc_FamilyHealthHistory.ascx" TagPrefix="uc1" TagName="uc_FamilyHealthHistory" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_FamilyHealthHistory runat="server" ID="uc_FamilyHealthHistory" />
</asp:Content>
