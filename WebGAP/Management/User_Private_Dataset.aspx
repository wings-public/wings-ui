<%@ Page Title="User Private Datasets" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="User_Private_Dataset.aspx.cs" Inherits="WebGAP.Management.User_Private_Dataset" %>

<%@ Register Src="~/Management/uc/uc_User_Private_Dataset.ascx" TagPrefix="uc1" TagName="uc_User_Private_Dataset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_User_Private_Dataset runat="server" id="uc_User_Private_Dataset" />
</asp:Content>
