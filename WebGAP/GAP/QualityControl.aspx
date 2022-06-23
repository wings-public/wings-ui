<%@ Page Title="" Language="C#" MasterPageFile="~/Plain.Master" AutoEventWireup="true" CodeBehind="QualityControl.aspx.cs" Inherits="WebGAP.GAP.QualityControl" %>

<%@ Register Src="~/GAP/Popup/uc_QualityControl.ascx" TagPrefix="uc1" TagName="uc_QualityControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uc_QualityControl runat="server" id="uc_QualityControl" />
</asp:Content>
