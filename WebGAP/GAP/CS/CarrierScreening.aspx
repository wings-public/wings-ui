<%@ Page Title="Carrier Screening" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="CarrierScreening.aspx.cs" Inherits="WebGAP.GAP.CS.CarrierScreening" %>

<%@ Register Src="~/GAP/CS/uc/uc_CarrierScreening.ascx" TagPrefix="uc1" TagName="uc_CarrierScreening" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_CarrierScreening runat="server" ID="uc_CarrierScreening" />
</asp:Content>
