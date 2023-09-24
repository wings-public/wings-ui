<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="CarrierScreenings.aspx.cs" Inherits="WebGAP.GAP.CS.CarrierScreenings" %>

<%@ Register Src="~/GAP/CS/uc/uc_CarrierScreenings.ascx" TagPrefix="uc1" TagName="uc_CarrierScreenings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_CarrierScreenings runat="server" ID="uc_CarrierScreenings" />
</asp:Content>
