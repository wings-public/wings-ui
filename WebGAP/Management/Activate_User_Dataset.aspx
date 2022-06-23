<%@ Page Title="Activate User Dataset" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="Activate_User_Dataset.aspx.cs" Inherits="WebGAP.Management.Activate_User_Dataset" %>

<%@ Register Src="~/Management/uc/uc_Activate_User_Dataset.ascx" TagPrefix="uc1" TagName="uc_Activate_User_Dataset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_Activate_User_Dataset runat="server" id="uc_Activate_User_Dataset" />
</asp:Content>
