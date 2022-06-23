<%@ Page Title="Dataset User" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="DataSet_Users.aspx.cs" Inherits="WebGAP.ACL.DataSet_Users" %>

<%@ Register Src="~/ACL/uc/uc_DataSet_Users.ascx" TagPrefix="uc1" TagName="uc_DataSet_Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_DataSet_Users runat="server" id="uc_DataSet_Users" />
</asp:Content>
