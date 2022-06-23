<%@ Page Title="Centers" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="Centers.aspx.cs" Inherits="WebGAP.ACL.Centers" %>

<%@ Register Src="~/ACL/uc/uc_Centers.ascx" TagPrefix="uc1" TagName="uc_Centers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_Centers runat="server" id="uc_Centers" />
</asp:Content>
