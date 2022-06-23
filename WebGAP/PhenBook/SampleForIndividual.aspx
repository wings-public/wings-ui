<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="SampleForIndividual.aspx.cs" Inherits="WebGAP.PhenBook.SampleForIndividual" %>

<%@ Register Src="~/PhenBook/PopUp/uc_SampleForIndividual.ascx" TagPrefix="uc1" TagName="uc_SampleForIndividual" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_SampleForIndividual runat="server" ID="uc_SampleForIndividual" />
</asp:Content>
