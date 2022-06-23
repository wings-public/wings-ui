<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="Trio_Analysises_list.aspx.cs" Inherits="WebGAP.GAP.Trio.Trio_Analysises_list" %>

<%@ Register Src="~/GAP/Trio/uc/uc_Trio_Analysises_list.ascx" TagPrefix="uc1" TagName="uc_Trio_Analysises_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_Trio_Analysises_list runat="server" id="uc_Trio_Analysises_list" />
</asp:Content>
