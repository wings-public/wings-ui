<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="Upload_QualityFile.aspx.cs" Inherits="WebGAP.GAP.Upload_QualityFile" %>

<%@ Register Src="~/GAP/Popup/uc_Upload_QualityFile.ascx" TagPrefix="uc1" TagName="uc_Upload_QualityFile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_Upload_QualityFile runat="server" id="uc_Upload_QualityFile" />
</asp:Content>
