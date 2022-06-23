<%@ Page Title="Individualset Group" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="IndividualSet_Group.aspx.cs" Inherits="WebGAP.ACL.IndividualSet_Group" %>

<%@ Register Src="~/ACL/uc/uc_IndividualSet_Group.ascx" TagPrefix="uc1" TagName="uc_IndividualSet_Group" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_IndividualSet_Group runat="server" id="uc_IndividualSet_Group" />
</asp:Content>
