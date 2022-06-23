<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="PI_Dataset_Requested.aspx.cs" Inherits="WebGAP.ACL.PI_Dataset_Requested" %>

<%@ Register Src="~/ACL/uc/uc_PI_Dataset_Requested.ascx" TagPrefix="uc1" TagName="uc_PI_Dataset_Requested" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_pi_dataset_requested runat="server" id="uc_PI_Dataset_Requested" />
</asp:Content>
