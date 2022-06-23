<%@ Page Title="Individualsets" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="IndividualSet.aspx.cs" Inherits="WebGAP.ACL.IndividualSet" %>

<%@ Register Src="~/ACL/uc/uc_IndividualSet.ascx" TagPrefix="uc1" TagName="uc_IndividualSet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_IndividualSet runat="server" id="uc_IndividualSet" />
</asp:Content>
