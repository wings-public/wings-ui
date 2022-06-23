<%@ Page Title="Dataset" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="DataSet.aspx.cs" Inherits="WebGAP.ACL.DataSet" %>

<%@ Register Src="~/ACL/uc/uc_DataSet.ascx" TagPrefix="uc1" TagName="uc_DataSet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_DataSet runat="server" id="uc_DataSet" />
</asp:Content>
