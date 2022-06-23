// global variable for hold chart data
var chartData = [];
//var chartData;
$(document).ready(function () {
    get_jqueryData();
});

function get_jqueryData() {

    var combo = document.getElementById("<%=  RDDL_Center.ClientID  %>");
    var combo3 = $find('<%= RDDL_Center.ClientID %>');
    //var cntrId = '<%= Session["Current_CenterID"] %>';

    alert(combo3);

    var CenterId = combo.get_selectedItem().get_value();
    var combo2 = document.getElementById("<%=  RDDL_PI.ClientID  %>");
    //var combo2 = $find('<%= RDDL_PI.ClientID %>');
    var PIId = combo2.get_selectedItem().get_value();
    console.log(CenterId);
    var UserId = "<%= Session['WiNGSMasterId'] %>";

    var list = [CenterId, PIId, UserId];
    var jsonText = JSON.stringify({ list: list });
    console.log(jsonText);
    jQuery.ajax({
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: jsonText,
        async: true,
        dataType: 'JSON',
        url: 'Main_Service/se_Main.asmx/Dashboard_GetChartData',
        success: function (result) {

            chartData = JSON.parse(result.d);
            console.log(chartData);
                        //console.log(JSON.stringify(chartData["0"].TotalFamily));

                    // document.getElementById("<%= lbl_total_family.ClientID %>").innerHTML = JSON.stringify(chartData["0"].TotalFamily);
                document.getElementById("<%= lbl_total_individual.ClientID  %>").innerHTML = JSON.stringify(chartData["0"].TotalIndv);
            document.getElementById("<%= lbl_total_sample.ClientID %>").innerHTML = JSON.stringify(chartData["0"].TotalSample);

//document.getElementById("<%= lbl_individual_assigned_sample.ClientID %>").innerHTML = JSON.stringify(chartData["0"].IndvAssignedToSample) + " Individual";
          //  document.getElementById("<%= lbl_individual_assigned_phenotype.ClientID %>").innerHTML = JSON.stringify(chartData["0"].IndvAssignedToPhenotype) + " Individual";
         //   document.getElementById("<%= lbl_individual_assigned_family.ClientID %>").innerHTML = JSON.stringify(chartData["0"].IndvAssignedToFamily) + " Individual"; 

                document.getElementById("<%= lbl_total_Smple.ClientID %>").innerHTML = "(Total " + JSON.stringify(chartData["0"].TotalSample) + ")";
            var totalSq = Number(chartData["0"].TotalWES) + Number(chartData["0"].TotalWGS) + Number(chartData["0"].TotalPanel);
               //document.getElementById("<%= lbl_total_seq.ClientID %>").innerHTML = "(Total " + totalSq + ")";
           // document.getElementById("<%= lbl_total_indv.ClientID %>").innerHTML = "(Total " + JSON.stringify(chartData["0"].TotalIndv) + ")";

            /*var percenatage_individual_assigned_to_sample = (Number(chartData["0"].IndvAssignedToSample) * 100) / Number(chartData["0"].TotalIndv);
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
            */
                callBack_drawChart();

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
    google.charts.setOnLoadCallback(drawChart_pie_individual);
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
