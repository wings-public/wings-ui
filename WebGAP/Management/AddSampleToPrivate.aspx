<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="AddSampleToPrivate.aspx.cs" Inherits="WebGAP.Management.AddSampleToPrivate" %>

<%@ Register Src="~/Management/Popup/uc_AddSampleToPrivate.ascx" TagPrefix="uc1" TagName="uc_AddSampleToPrivate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_AddSampleToPrivate runat="server" id="uc_AddSampleToPrivate" />
</asp:Content>
