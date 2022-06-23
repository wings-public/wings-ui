<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="DetailFile.aspx.cs" Inherits="WebGAP.GAP.DetailFile" %>

<%@ Register Src="~/GAP/uc/uc_DetailFile.ascx" TagPrefix="uc1" TagName="uc_DetailFile" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <uc1:uc_DetailFile runat="server" id="uc_DetailFile" />
</asp:Content>
