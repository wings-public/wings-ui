<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Seq_QualityHistogram.ascx.cs" Inherits="WebGAP.GAP.uc.uc_Seq_QualityHistogram" %>

<script src="../../assets/js/MQC.js"></script>

<script type="text/javascript">

    var qrStr = window.location.search;
    var spQrStr = qrStr.substring(1);
    var arrQrStr = new Array();
    var arr = spQrStr.split('&');
    var SampleID;
    var MetricsID = 2;
    var UserID = <%= @Session["WiNGSMasterID"]%>;
    var PIID = <%= Session["WiNGSPIId"]%>;
                                  
    for (var i = 0; i < arr.length; i++) {
        var queryvalue = arr[i].split('=');
        SampleID = queryvalue[1];
    }

    var list = [SampleID, MetricsID, UserID, PIID];
    var jsonText = JSON.stringify({ list: list });
    jQuery.ajax({
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: jsonText,
        async: true,
        dataType: 'JSON',
        url: 'Service/se_Sample_Quality.asmx/getResults_Quality_Samples',
        success: function (result) {
            // alert("test2");
            console.log(JSON.stringify(result.d[0].MetricsValue));
            mqc_compressed_plotdata = JSON.parse(result.d[0].MetricsValue);
            num_datasets_plot_limit = 50;
            mqc_sample_names_rename = [];
        },
        error: function () {
            alert('Error on binding the data');
        }
    });

</script>

<div class="mqc-section-plot">
    <div class="mqc_hcplot_plotgroup">
        <div class="hc-plot-wrapper">
            <div id="fastqc_per_base_sequence_quality_plot" class="hc-plot not_rendered hc-line-plot"><small>loading..</small></div>
        </div>
    </div>
</div>



