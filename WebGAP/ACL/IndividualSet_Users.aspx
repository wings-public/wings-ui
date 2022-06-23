<%@ Page Title="Individualset Users" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="IndividualSet_Users.aspx.cs" Inherits="WebGAP.ACL.IndividualSet_Users" %>

<%@ Register Src="~/ACL/uc/uc_Individualset_Users.ascx" TagPrefix="uc1" TagName="uc_Individualset_Users" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_Individualset_Users runat="server" id="uc_Individualset_Users" />
</asp:Content>
