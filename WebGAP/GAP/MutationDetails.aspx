<%@ Page Title="Mutation Details" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="MutationDetails.aspx.cs" Inherits="WebGAP.GAP.MutationDetails" %>

<%@ Register Src="~/GAP/Popup/uc_MutationDetails.ascx" TagPrefix="uc1" TagName="uc_MutationDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_MutationDetails runat="server" ID="uc_MutationDetails" />
</asp:Content>
