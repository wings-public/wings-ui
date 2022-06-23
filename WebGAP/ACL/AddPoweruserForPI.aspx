<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="AddPoweruserForPI.aspx.cs" Inherits="WebGAP.ACL.AddPoweruserForPI" %>

<%@ Register Src="~/ACL/Popup/uc_AddPoweruserForPI.ascx" TagPrefix="uc1" TagName="uc_AddPoweruserForPI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">
    <uc1:uc_AddPoweruserForPI runat="server" ID="uc_AddPoweruserForPI" />
</asp:Content>
