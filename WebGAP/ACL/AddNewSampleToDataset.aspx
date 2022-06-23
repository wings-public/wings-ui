<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="AddNewSampleToDataset.aspx.cs" Inherits="WebGAP.ACL.AddNewSampleToDataset" %>

<%@ Register Src="~/ACL/Popup/uc_AddNewSampleToDataset.ascx" TagPrefix="uc1" TagName="uc_AddNewSampleToDataset" %>



<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_AddNewSampleToDataset runat="server" id="uc_AddNewSampleToDataset" />
</asp:Content>
