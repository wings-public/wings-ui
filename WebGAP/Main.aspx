<%@ Page Title="Main" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="WebGAP.Main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        body.noScroll {
            display: inline;
            overflow-x: hidden;
        }

        .aspNetDisabled {
            background: #e5e5e5;
            font-size: 12px !important;
            padding: 7px;
            font-style: italic;
            cursor: none;
        }

        .loader {
            display: none;
            position: absolute;
            height: 100%;
            width: 92%;
            opacity: 0.5;
            background: white;
            z-index: 9;
            border-radius: 10px
        }

            .loader img {
                position: relative;
                width: 70px;
                height: 70px;
                top: 30%;
                left: 48%
            }
        .rbVerticalList .rbCheckBox, .rbVerticalList .rbRadioButton, .rbVerticalList .rbToggleButton {
            display: unset;
            padding: 0 23px 4px 0;
        }
    </style>

    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RBL_App">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RBL_App" />
                    <telerik:AjaxUpdatedControl ControlID="RDDL_Center" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="RDDL_PI" LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="RDDL_Center">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RDDL_Center" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="RDDL_PI" LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="RDDL_PI">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RDDL_PI" LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30" Skin="Office2007" />

    <div class="content-wrapper">
        <div class="content-header row">
            <div class="content-header-left col-md-6 col-xs-12 mb-1">
                <h1 class="content-header-title">Welcome To WiNGS</h1>
            </div>
            <div class="content-header-right breadcrumbs-right breadcrumbs-top col-md-6 col-xs-12">
            </div>
        </div>
        <!-- Image loader -->
        <div id="loader" class="loader">
            <img src="img/icon-loading.gif">
        </div>
        <!-- Image loader -->

        <div class="content-body pt-1">
            <section id="basic-form-layouts">
                <div class="row match-height">

                    <!-- Select centers and PIs -->
                    <div class="col-md-4 col-sm-8">
                        <div class="card main-card">
                            <div class="card-content collapse show">
                                <div class="card-body">
                                    <%--<h4 class="card-title" style="border: none">Select the center and PI for get a summary</h4>--%>
                                    <div class="row">
                                        <div runat="server" id="AppHolder" class="col-md-12" style="padding-bottom: 10px" visible="false">
                                            <asp:Literal runat="server">First, select the application you want to work with it.</asp:Literal> 
                                            <hr />
                                            <telerik:RadRadioButtonList runat="server" ID="RBL_App" OnSelectedIndexChanged="RBL_App_SelectedIndexChanged">
                                                <Items>
                                                    <telerik:ButtonListItem Text="WiNGS" Value="10" Selected="false" />
                                                    <telerik:ButtonListItem Text="MINNDS" Value="01" Selected="false" />
                                                </Items>
                                            </telerik:RadRadioButtonList>
                                        </div>
                                        <div class="col-md-12" style="padding-bottom: 10px">
                                            <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="RDDL_Center" AppendDataBoundItems="true" 
                                                 AllowCustomText="false" OnSelectedIndexChanged="RDDL_Center_SelectedIndexChanged"
                                                Height="140px" AutoPostBack="true" Width="100%" OnPreRender="RDDL_Center_PreRender" > <%--DataTextField="CenterDesc" DataValueField="CenterID" DataSourceID="Ds_Centers"--%>
                                            </telerik:RadDropDownList>
                                        </div>
                                        <div class="col-md-12">
                                            <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="RDDL_PI" AppendDataBoundItems="true" 
                                                 AllowCustomText="false" OnSelectedIndexChanged="RDDL_PI_SelectedIndexChanged"
                                                Height="140px" AutoPostBack="true" Width="100%" OnPreRender="RDDL_PI_PreRender"> <%--DataTextField="PIName" DataValueField="PIID" DataSourceID="Ds_PIs"--%>
                                            </telerik:RadDropDownList>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Total Family, Individual, Sample and Last login -->
                    <div class="col-md-8 col-sm-16">
                        <div class="card main-card">
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="row">
                                        <%--           <div class="col-xl-3 col-lg-6 col-md-12 border-right-grey border-right-lighten-3 clearfix">
                                            <div class="float-left pl-2">
                                                <span class="grey darken-1 block">
                                                    <i class="icon-android-contacts"></i>
                                                    Family</span>
                                                <span class="font-large-3 line-height-1 text-bold-300">
                                                    <asp:Label runat="server" ID="lbl_total_family" Text="0"></asp:Label></span>
                                            </div>
                                            <div class="float-left mt-2">
                                                <span class="grey darken-1 block">numbers</span>
                                            </div>
                                        </div>--%>
                                        <div class="col-xl-3 col-lg-6 col-md-12 border-right-grey border-right-lighten-3 clearfix">
                                            <div class="float-left pl-2">
                                                <span class="grey darken-1 block">
                                                    <i class="icon-user"></i>
                                                    Individual</span>
                                                <span class="font-large-3 line-height-1 text-bold-300">
                                                    <asp:Label runat="server" ID="lbl_total_individual" Text="0"></asp:Label></span>
                                            </div>
                                            <div class="float-left mt-2">
                                                <span class="grey darken-1 block">numbers</span>
                                            </div>
                                        </div>
                                        <div class="col-xl-3 col-lg-6 col-md-12 border-right-grey border-right-lighten-3 clearfix">
                                            <div class="float-left pl-2">
                                                <span class="grey darken-1 block">
                                                    <i class="icon-paintbucket"></i>
                                                    Samples</span>
                                                <span class="font-large-3 line-height-1 text-bold-300">
                                                    <asp:Label runat="server" ID="lbl_total_sample" Text="0"></asp:Label></span>
                                            </div>
                                            <div class="float-left mt-2">
                                                <span class="grey darken-1 block">numbers</span>
                                            </div>
                                        </div>
                                        <div class="col-xl-3 col-lg-6 col-md-12 clearfix">
                                            <div class="float-left pl-2">
                                                <span class="grey darken-1 block">
                                                    <i class="icon-check"></i>
                                                    Last login</span>
                                                <span class="font-large-2 line-height-1 text-bold-300">
                                                    <asp:HyperLink ID="IPLocation" NavigateUrl="#" Text="" runat="server" Target="_blank" />
                                                </span>
                                            </div>
                                            <div class="float-left mt-2">
                                                <span class="grey darken-1 block">
                                                    <asp:Label runat="server" ID="LastLoginDate"></asp:Label>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%-- <div class="col-md-6">
                        <div class="card">
                            <div class="card-content collapse show">
                                <div class="card-body">
                                    <div class="form">
                                        <div class="form-body">
                                            <h4 class="form-section"><i class="icon-home3"></i>Center</h4>
                                            <div class="media">
                                                <div class="media-body text-xs-left">
                                                    <h4 class="deep-orange">Number of PIs</h4>
                                                    <span>
                                                        <asp:Label runat="server" ID="NoPIs"></asp:Label></span>
                                                    <h4 class="deep-orange">Number of Samples</h4>
                                                    <span>
                                                        <asp:Label runat="server" ID="NoSamples"></asp:Label></span>
                                                </div>
                                                <div class="media-right media-middle">
                                                    <i class="icon-office deep-orange font-large-5 float-xs-right"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-content collapse show">
                                <div class="card-body">
                                    <div class="form">
                                        <h4 class="form-section"><i class="ft-user"></i>Users</h4>
                                        <div class="media">
                                            <div class="media-body text-xs-left">
                                                <h4 class="teal">Last login</h4>
                                                <span>
                                                    <asp:Label runat="server" ID="LastLoginDate"></asp:Label></span>
                                                <h4 class="teal pt-1">Last Location</h4>
                                                <span>Click:
                                                    <asp:HyperLink ID="IPLocation" NavigateUrl="#" Text="" runat="server" /></span>
                                                <h4 class="teal pt-1">Number of requests</h4>
                                                <span>...</span>
                                                <h4 class="teal pt-1">Number of Samples</h4>
                                                <span>...</span>
                                            </div>
                                            <div class="media-right media-middle">
                                                <i class="icon-user1 teal font-large-5 float-xs-right"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>--%>
                </div>
            </section>
            <%--  <section id="funnel-gauges-charts">
                <div class="row match-height">
                    <div class="col-md-6 col-sm-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Report detail</h4>
                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                <div class="heading-elements">
                                    <ul class="list-inline mb-0">
                                        <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-content collapse show">
                                <div id="barchart_values" style="height: 200px;"></div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Individual VS Sample, Phenotype, Family</h4>
                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                <div class="heading-elements">
                                    <ul class="list-inline mb-0">
                                        <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="card-content collapse show">
                                <div class="card-body">
                                    <div class="media" id="div_holder_individual_assigned_to" runat="server">
                                        <div class="media-left col-md-4 col-sm-8">
                                            <h3>
                                                <asp:Label runat="server" ID="lbl_individual_assigned_sample"></asp:Label>
                                                <h3 class="badge badge-default badge-success">assigned to</h3>
                                            </h3>
                                            <span class="text-muted">Sample</span>
                                            <div class="progress mt-1 mb-0" style="height: 7px;">
                                                <div runat="server" id="div_percenatage_individual_assigned_to_sample" class="progress-bar bg-success" role="progressbar" data-toggle="tooltip" title="" aria-valuenow="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                        <div class="media-middle col-md-4 col-sm-8">
                                            <h3>
                                                <asp:Label runat="server" ID="lbl_individual_assigned_phenotype"></asp:Label>
                                                <h3 class="badge badge-default badge-info">assigned to</h3>
                                            </h3>
                                            <span class="text-muted">Phenotype</span>
                                            <div class="progress mt-1 mb-0" style="height: 7px;">
                                                <div runat="server" id="div_percenatage_individual_assigned_to_phenotype" class="progress-bar bg-info" role="progressbar" data-toggle="tooltip" title="" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                        <div class="media-right col-md-4 col-sm-8">
                                            <h3>
                                                <asp:Label runat="server" ID="lbl_individual_assigned_family"></asp:Label>
                                                <h3 class="badge badge-default badge-warning">assigned to</h3>
                                            </h3>
                                            <span class="text-muted">Family</span>
                                            <div class="progress mt-1 mb-0" style="height: 7px;">
                                                <div runat="server" id="div_percenatage_individual_assigned_to_family" class="progress-bar bg-warning" role="progressbar" data-toggle="tooltip" title="" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            --%>
            <section id="sample-individual-details-charts">
                <div class="row">
                    <!-- Sample Detail -->
                    <div class="col-md-6 col-sm-8" runat="server" id="SampleDetail" style="height: 380px">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Samples
                                <span class="text-muted">
                                    <asp:Label runat="server" ID="lbl_total_Smple"></asp:Label></span>
                                </h4>
                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                <div class="heading-elements">
                                    <ul class="list-inline mb-0">
                                        <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-content collapse show">
                                <!--Div that will hold the pie chart-->
                                <div id="chart_div_sample"></div>
                            </div>
                        </div>
                    </div>

                    <!-- SeqType Detail -->
                    <div class="col-md-6 col-sm-8" id="SeqDetail" runat="server">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Sequence
                                <span class="text-muted">
                                    <asp:Label runat="server" ID="lbl_total_seq"></asp:Label></span>
                                </h4>
                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                <div class="heading-elements">
                                    <ul class="list-inline mb-0">
                                        <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-content collapse show">
                                <div id="chart_div_seq"></div>
                            </div>
                        </div>
                    </div>

                    <!-- Individual Detail -->
                    <%--   <div class="col-md-4 col-sm-8" id="IndvDetail" runat="server">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Individual</h4>
                                <span class="text-muted">
                                    <asp:Label runat="server" ID="lbl_total_indv"></asp:Label></span>
                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                <div class="heading-elements">
                                    <ul class="list-inline mb-0">
                                        <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-content collapse show">
                                <div id="chart_div_indv"></div>

                            </div>
                        </div>
                    </div>--%>
                </div>

            </section>
        </div>
    </div>
    <asp:SqlDataSource ID="Ds_Centers" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_Center_Sel_ForDashboard" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Ds_PIs" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_PI_Sel_ForDashboard" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="RDDL_Center" Name="CenterID" PropertyName="SelectedValue" Type="Int32" />
            <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>



    <script type="text/javascript" src="Main_Service/charts/loader.js"></script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">

            // global variable for hold chart data
            var chartData = [];

            $(document).ready(function () {
                get_jqueryData();
            });

            function get_jqueryData() {

              //  var tt = document.getElementById("<%=  RDDL_Center.ClientID  %>");
                // var test = tt.get_selectedItem().get_value();
                //  console.log("test"+ test);
                var combo = $find("<%= RDDL_Center.ClientID %>");
                var CenterId = combo.get_selectedItem().get_value();
                var combo2 = $find("<%= RDDL_PI.ClientID %>");
                var PIId = combo2.get_selectedItem().get_value();
                
                var UserId = '<%= Session["WiNGSMasterId"] %>';
                var PortalSelectedApp = '<%= Session["PortalSelectedApp"] %>';

                var list = [CenterId, PIId, UserId, PortalSelectedApp];
                var jsonText = JSON.stringify({ list: list });
                //console.log(jsonText);
                jQuery.ajax({
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    data: jsonText,
                    async: true,
                    dataType: 'JSON',
                    url: 'Main_Service/se_Main.asmx/Dashboard_GetChartData',
                    beforeSend: function () {
                        // Show image container
                        $("#loader").show();
                    },
                    success: function (result) {

                        chartData = JSON.parse(result.d);
                        //console.log(chartData);

                     <%--  document.getElementById("<%= lbl_total_family.ClientID %>").innerHTML = JSON.stringify(chartData["0"].TotalFamily);--%>
                       document.getElementById("<%= lbl_total_individual.ClientID  %>").innerHTML = JSON.stringify(chartData["0"].TotalIndv);
                        document.getElementById("<%= lbl_total_sample.ClientID %>").innerHTML = JSON.stringify(chartData["0"].TotalSample); 

<%--                        document.getElementById("<%= lbl_individual_assigned_sample.ClientID %>").innerHTML = JSON.stringify(chartData["0"].IndvAssignedToSample) + " Individual";
                        document.getElementById("<%= lbl_individual_assigned_phenotype.ClientID %>").innerHTML = JSON.stringify(chartData["0"].IndvAssignedToPhenotype) + " Individual";
                        document.getElementById("<%= lbl_individual_assigned_family.ClientID %>").innerHTML = JSON.stringify(chartData["0"].IndvAssignedToFamily) + " Individual";--%>

                        document.getElementById("<%= lbl_total_Smple.ClientID %>").innerHTML = "(Total " + JSON.stringify(chartData["0"].TotalSample) + ")";
                        var totalSq = Number(chartData["0"].TotalWES) + Number(chartData["0"].TotalWGS) + Number(chartData["0"].TotalPanel) 
                       <%--   document.getElementById("<%= lbl_total_seq.ClientID %>").innerHTML = "(Total " + totalSq + ")";
                      document.getElementById("<%= lbl_total_indv.ClientID %>").innerHTML = "(Total " + JSON.stringify(chartData["0"].TotalIndv) + ")";--%>

                      <%--  var percenatage_individual_assigned_to_sample = (Number(chartData["0"].IndvAssignedToSample) * 100) / Number(chartData["0"].TotalIndv);
                        document.getElementById("<%= div_percenatage_individual_assigned_to_sample.ClientID %>").setAttribute("title", percenatage_individual_assigned_to_sample.toString() + "%");
                        document.getElementById("<%= div_percenatage_individual_assigned_to_sample.ClientID %>").setAttribute("aria-valuenow", percenatage_individual_assigned_to_sample.toString());
                        document.getElementById("<%= div_percenatage_individual_assigned_to_sample.ClientID %>").style.width = percenatage_individual_assigned_to_sample.toString() + "%";

                        var percenatage_individual_assigned_to_phenotype = (Number(chartData["0"].IndvAssignedToPhenotype) * 100) / Number(chartData["0"].TotalIndv);
                        document.getElementById("<%= div_percenatage_individual_assigned_to_phenotype.ClientID %>").setAttribute("title", percenatage_individual_assigned_to_phenotype.toString() + "%");
                        document.getElementById("<%= div_percenatage_individual_assigned_to_phenotype.ClientID %>").setAttribute("aria-valuenow", percenatage_individual_assigned_to_phenotype.toString());
                        document.getElementById("<%= div_percenatage_individual_assigned_to_phenotype.ClientID %>").style.width = percenatage_individual_assigned_to_phenotype.toString() + "%";


                        var percenatage_individual_assigned_to_family = (Number(chartData["0"].IndvAssignedToFamily) * 100) / Number(chartData["0"].TotalIndv);
                        document.getElementById("<%= div_percenatage_individual_assigned_to_family.ClientID %>").setAttribute("title", percenatage_individual_assigned_to_family.toString() + "%");
                        document.getElementById("<%= div_percenatage_individual_assigned_to_family.ClientID %>").setAttribute("aria-valuenow", percenatage_individual_assigned_to_family.toString());
                        document.getElementById("<%= div_percenatage_individual_assigned_to_family.ClientID %>").style.width = percenatage_individual_assigned_to_family.toString() + "%";
--%>
                        callBack_drawChart();

                    },

                    complete: function (data) {
                        // Hide image container
                        $("#loader").hide();
                    },
                    error: function () {
                        alert('Error on binding the data');
                    }

                });

            }

            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    //["Element", "Number of reports", { role: "style" }],
                    //["Generated  ", Number(chartData["0"].GeneratedReport), "#37BC9B"],
                    //["Send to PI  ", Number(chartData["0"].SendToPIReport), "#FF936A"],
                    //["Approved  ", Number(chartData["0"].ApprovedReport), "#DA4453"],
                    //["Rejected  ", Number(chartData["0"].RejectedReport), "#3BAFDA"],
                    //["Without Report  ", Number(chartData["0"].WithoutReport), "color: #F6BB42"]
                ]);

                var view = new google.visualization.DataView(data);
                view.setColumns([0, 1,
                    {
                        calc: "stringify",
                        sourceColumn: 1,
                        type: "string",
                        role: "annotation"
                    },
                    2]);

                var options = {
                    //title: "Number of reports in bar chart",
                    width: 500,
                    height: 200,
                    bar: { groupWidth: "98%" },
                    legend: { position: "none" },
                    chartArea: {
                        left: 100
                    },
                };
                var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
                chart.draw(view, options);
            }

            function callBack_drawChart() {
                google.charts.load("visualization", "1", { packages: ["corechart"] });
                //   google.charts.setOnLoadCallback(drawChart);
                google.charts.setOnLoadCallback(drawChart_pie_sample);
                google.charts.setOnLoadCallback(drawChart_pie_seq);
                //google.charts.setOnLoadCallback(drawChart_pie_individual);
            }

            function drawChart_pie_sample() {

                //Create the data table.
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Type');
                data.addColumn('number', 'Numbers');
                data.addRows([
                    ['Research', Number(chartData["0"].TotalResearchFromSample)],
                    ['Diagnostics', Number(chartData["0"].TotalDignosFromSample)]
                ]);

                // Set chart options
                var options = {
                    'title': 'Type of samples',
                    //'width': 450,
                    'height': 300,
                    pieHole: 0.4,
                    is3D: true,
                    slices: {
                        0: { color: '#7E8898' },
                        1: { color: '#53D9A9' }
                    }
                };

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('chart_div_sample'));
                chart.draw(data, options);
            }

            function drawChart_pie_seq() {

                // Create the data table.
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Type');
                data.addColumn('number', 'Numbers');
                data.addRows([
                    ['WES', Number(chartData["0"].TotalWES)],
                    ['WGS', Number(chartData["0"].TotalWGS)],
                    ['Panel', Number(chartData["0"].TotalPanel)]

                ]);
                // Set chart options
                var options = {
                    'title': 'Type of sequencing',
                    //'width': 450,
                    'height': 300,
                    pieHole: 0.4,
                    is3D: true,
                    slices: {
                        0: { color: '#7E8898' },
                        1: { color: '#FF936A' },
                        2: { color: '#33B7B9' }
                    }
                };

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('chart_div_seq'));
                chart.draw(data, options);
            }

            function drawChart_pie_individual() {

                // Create the data table.
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Type');
                data.addColumn('number', 'Numbers');
                data.addRows([
                    ['Male', Number(chartData["0"].TotalMale)],
                    ['Female', Number(chartData["0"].TotalFemale)]
                ]);
                // Set chart options
                var options = {
                    'title': 'Individual gender',
                    //'width': 450,
                    'height': 300,
                    pieHole: 0.4,
                    is3D: true,
                    slices: {
                        0: { color: '#7E8898' },
                        1: { color: '#FF6A79' }
                    }
                };

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('chart_div_indv'));
                chart.draw(data, options);
            }


        </script>
    </telerik:RadCodeBlock>

</asp:Content>
