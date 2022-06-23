<%@ Page Title="Dataset Group" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="DataSet_Group.aspx.cs" Inherits="WebGAP.ACL.DataSet_Group" %>

<%@ Register Src="~/ACL/uc/uc_DataSet_Group.ascx" TagPrefix="uc1" TagName="uc_DataSet_Group" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_DataSet_Group runat="server" ID="uc_DataSet_Group" />
</asp:Content>
