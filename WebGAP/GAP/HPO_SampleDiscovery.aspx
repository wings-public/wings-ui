<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="HPO_SampleDiscovery.aspx.cs" Inherits="WebGAP.GAP.HPO_SampleDiscovery" %>

<%@ Register Src="~/GAP/Popup/uc_HPO_SampleDiscovery.ascx" TagPrefix="uc1" TagName="uc_HPO_SampleDiscovery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_HPO_SampleDiscovery runat="server" id="uc_HPO_SampleDiscovery" />
</asp:Content>
