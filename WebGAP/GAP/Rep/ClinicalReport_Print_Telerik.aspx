<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClinicalReport_Print_Telerik.aspx.cs" Inherits="WebGAP.GAP.Rep.ClinicalReport_Print_Telerik" %>

<%@ Register TagPrefix="telerik" Assembly="Telerik.ReportViewer.Html5.WebForms" Namespace="Telerik.ReportViewer.Html5.WebForms" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

	<style>
		#reportViewer1 {
			position: absolute;
			left: 5px;
			right: 1469px;
			top: -1px;
			bottom: 787px;
			overflow: hidden;
			font-family: Verdana, Arial;
		}
	</style>

</head>
<body>
    <form runat="server">
        <telerik:ReportViewer
            ID="reportViewer1" 
			Width="840px"
			Height="900px"
         	EnableAccessibility="false"
            runat="server">
            <ReportSource IdentifierType="UriReportSource"  Identifier="Report_Print_Telerik.trdp">
                <Parameters >
                    <telerik:Parameter  Name="ReportID"  />
                      <telerik:Parameter  Name="Report_Version"  />
                </Parameters>
            </ReportSource>
			<%-- If set to true shows the Send Mail Message toolbar button --%>
            <SendEmail Enabled = "false" />
        </telerik:ReportViewer>
    </form>
</body>

  
</html>

