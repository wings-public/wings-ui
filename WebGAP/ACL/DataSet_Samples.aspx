<%@ Page Title="Dataset Samples" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="DataSet_Samples.aspx.cs" Inherits="WebGAP.ACL.DataSet_Samples" %>

<%@ Register Src="~/ACL/uc/uc_DataSet_Samples.ascx" TagPrefix="uc1" TagName="uc_DataSet_Samples" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_DataSet_Samples runat="server" id="uc_DataSet_Samples" />
</asp:Content>
