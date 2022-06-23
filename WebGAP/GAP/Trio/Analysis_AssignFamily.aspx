<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="Analysis_AssignFamily.aspx.cs" Inherits="WebGAP.GAP.Trio.Analysis_AssignFamily" %>

<%@ Register Src="~/GAP/Trio/Popup/uc_Analysis_AssignFamily.ascx" TagPrefix="uc1" TagName="uc_Analysis_AssignFamily" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_Analysis_AssignFamily runat="server" id="uc_Analysis_AssignFamily" />
</asp:Content>
