<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="IndividualForSample.aspx.cs" Inherits="WebGAP.PhenBook.IndividualForSample" %>

<%@ Register Src="~/GAP/Popup/uc_IndividualForSample.ascx" TagPrefix="uc1" TagName="uc_IndividualForSample" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_IndividualForSample runat="server" id="uc_IndividualForSample" />
</asp:Content>
