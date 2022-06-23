﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_QualityControl.ascx.cs" Inherits="WebGAP.GAP.Popup.uc_QualityControl" %>

<link href="../../assets/css/QC_CSS.css" rel="stylesheet" />

<script type="text/javascript">var LZString = function () { function o(o, r) { if (!t[o]) { t[o] = {}; for (var n = 0; n < o.length; n++)t[o][o.charAt(n)] = n } return t[o][r] } var r = String.fromCharCode, n = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=", e = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+-$", t = {}, i = { compressToBase64: function (o) { if (null == o) return ""; var r = i._compress(o, 6, function (o) { return n.charAt(o) }); switch (r.length % 4) { default: case 0: return r; case 1: return r + "==="; case 2: return r + "=="; case 3: return r + "=" } }, decompressFromBase64: function (r) { return null == r ? "" : "" == r ? null : i._decompress(r.length, 32, function (e) { return o(n, r.charAt(e)) }) }, compressToUTF16: function (o) { return null == o ? "" : i._compress(o, 15, function (o) { return r(o + 32) }) + " " }, decompressFromUTF16: function (o) { return null == o ? "" : "" == o ? null : i._decompress(o.length, 16384, function (r) { return o.charCodeAt(r) - 32 }) }, compressToUint8Array: function (o) { for (var r = i.compress(o), n = new Uint8Array(2 * r.length), e = 0, t = r.length; t > e; e++) { var s = r.charCodeAt(e); n[2 * e] = s >>> 8, n[2 * e + 1] = s % 256 } return n }, decompressFromUint8Array: function (o) { if (null === o || void 0 === o) return i.decompress(o); for (var n = new Array(o.length / 2), e = 0, t = n.length; t > e; e++)n[e] = 256 * o[2 * e] + o[2 * e + 1]; var s = []; return n.forEach(function (o) { s.push(r(o)) }), i.decompress(s.join("")) }, compressToEncodedURIComponent: function (o) { return null == o ? "" : i._compress(o, 6, function (o) { return e.charAt(o) }) }, decompressFromEncodedURIComponent: function (r) { return null == r ? "" : "" == r ? null : (r = r.replace(/ /g, "+"), i._decompress(r.length, 32, function (n) { return o(e, r.charAt(n)) })) }, compress: function (o) { return i._compress(o, 16, function (o) { return r(o) }) }, _compress: function (o, r, n) { if (null == o) return ""; var e, t, i, s = {}, p = {}, u = "", c = "", a = "", l = 2, f = 3, h = 2, d = [], m = 0, v = 0; for (i = 0; i < o.length; i += 1)if (u = o.charAt(i), Object.prototype.hasOwnProperty.call(s, u) || (s[u] = f++, p[u] = !0), c = a + u, Object.prototype.hasOwnProperty.call(s, c)) a = c; else { if (Object.prototype.hasOwnProperty.call(p, a)) { if (a.charCodeAt(0) < 256) { for (e = 0; h > e; e++)m <<= 1, v == r - 1 ? (v = 0, d.push(n(m)), m = 0) : v++; for (t = a.charCodeAt(0), e = 0; 8 > e; e++)m = m << 1 | 1 & t, v == r - 1 ? (v = 0, d.push(n(m)), m = 0) : v++, t >>= 1 } else { for (t = 1, e = 0; h > e; e++)m = m << 1 | t, v == r - 1 ? (v = 0, d.push(n(m)), m = 0) : v++, t = 0; for (t = a.charCodeAt(0), e = 0; 16 > e; e++)m = m << 1 | 1 & t, v == r - 1 ? (v = 0, d.push(n(m)), m = 0) : v++, t >>= 1 } l--, 0 == l && (l = Math.pow(2, h), h++), delete p[a] } else for (t = s[a], e = 0; h > e; e++)m = m << 1 | 1 & t, v == r - 1 ? (v = 0, d.push(n(m)), m = 0) : v++, t >>= 1; l--, 0 == l && (l = Math.pow(2, h), h++), s[c] = f++, a = String(u) } if ("" !== a) { if (Object.prototype.hasOwnProperty.call(p, a)) { if (a.charCodeAt(0) < 256) { for (e = 0; h > e; e++)m <<= 1, v == r - 1 ? (v = 0, d.push(n(m)), m = 0) : v++; for (t = a.charCodeAt(0), e = 0; 8 > e; e++)m = m << 1 | 1 & t, v == r - 1 ? (v = 0, d.push(n(m)), m = 0) : v++, t >>= 1 } else { for (t = 1, e = 0; h > e; e++)m = m << 1 | t, v == r - 1 ? (v = 0, d.push(n(m)), m = 0) : v++, t = 0; for (t = a.charCodeAt(0), e = 0; 16 > e; e++)m = m << 1 | 1 & t, v == r - 1 ? (v = 0, d.push(n(m)), m = 0) : v++, t >>= 1 } l--, 0 == l && (l = Math.pow(2, h), h++), delete p[a] } else for (t = s[a], e = 0; h > e; e++)m = m << 1 | 1 & t, v == r - 1 ? (v = 0, d.push(n(m)), m = 0) : v++, t >>= 1; l--, 0 == l && (l = Math.pow(2, h), h++) } for (t = 2, e = 0; h > e; e++)m = m << 1 | 1 & t, v == r - 1 ? (v = 0, d.push(n(m)), m = 0) : v++, t >>= 1; for (; ;) { if (m <<= 1, v == r - 1) { d.push(n(m)); break } v++ } return d.join("") }, decompress: function (o) { return null == o ? "" : "" == o ? null : i._decompress(o.length, 32768, function (r) { return o.charCodeAt(r) }) }, _decompress: function (o, n, e) { var t, i, s, p, u, c, a, l, f = [], h = 4, d = 4, m = 3, v = "", w = [], A = { val: e(0), position: n, index: 1 }; for (i = 0; 3 > i; i += 1)f[i] = i; for (p = 0, c = Math.pow(2, 2), a = 1; a != c;)u = A.val & A.position, A.position >>= 1, 0 == A.position && (A.position = n, A.val = e(A.index++)), p |= (u > 0 ? 1 : 0) * a, a <<= 1; switch (t = p) { case 0: for (p = 0, c = Math.pow(2, 8), a = 1; a != c;)u = A.val & A.position, A.position >>= 1, 0 == A.position && (A.position = n, A.val = e(A.index++)), p |= (u > 0 ? 1 : 0) * a, a <<= 1; l = r(p); break; case 1: for (p = 0, c = Math.pow(2, 16), a = 1; a != c;)u = A.val & A.position, A.position >>= 1, 0 == A.position && (A.position = n, A.val = e(A.index++)), p |= (u > 0 ? 1 : 0) * a, a <<= 1; l = r(p); break; case 2: return "" }for (f[3] = l, s = l, w.push(l); ;) { if (A.index > o) return ""; for (p = 0, c = Math.pow(2, m), a = 1; a != c;)u = A.val & A.position, A.position >>= 1, 0 == A.position && (A.position = n, A.val = e(A.index++)), p |= (u > 0 ? 1 : 0) * a, a <<= 1; switch (l = p) { case 0: for (p = 0, c = Math.pow(2, 8), a = 1; a != c;)u = A.val & A.position, A.position >>= 1, 0 == A.position && (A.position = n, A.val = e(A.index++)), p |= (u > 0 ? 1 : 0) * a, a <<= 1; f[d++] = r(p), l = d - 1, h--; break; case 1: for (p = 0, c = Math.pow(2, 16), a = 1; a != c;)u = A.val & A.position, A.position >>= 1, 0 == A.position && (A.position = n, A.val = e(A.index++)), p |= (u > 0 ? 1 : 0) * a, a <<= 1; f[d++] = r(p), l = d - 1, h--; break; case 2: return w.join("") }if (0 == h && (h = Math.pow(2, m), m++), f[l]) v = f[l]; else { if (l !== d) return null; v = s + s.charAt(0) } w.push(v), f[d++] = s + v.charAt(0), h--, s = v, 0 == h && (h = Math.pow(2, m), m++) } } }; return i }(); "function" == typeof define && define.amd ? define(function () { return LZString }) : "undefined" != typeof module && null != module && (module.exports = LZString);
</script>
<script type="application/json" id="mqc_config">{"decimalPoint_format": ".", "num_datasets_plot_limit": 50, "sample_names_rename": [], "thousandsSep_format": "\u003cspan class=\"mqc_thousandSep\"\u003e\u003c/span\u003e"}</script>

<script type="text/javascript">


    function pageLoad() {
        document.getElementById("tab2").style.visibility = "hidden";
        document.getElementById("tab3").style.visibility = "hidden";
        document.getElementById("tab4").style.visibility = "hidden";

        document.getElementById("tab6").style.visibility = "hidden";
        document.getElementById("tab7").style.visibility = "hidden";
        document.getElementById("tab8").style.visibility = "hidden";
        document.getElementById("tab9").style.visibility = "hidden";

        document.getElementById("bam-tab2").style.visibility = "hidden";
        document.getElementById("bam-tab3").style.visibility = "hidden";
        document.getElementById("bam-tab4").style.visibility = "hidden";
        document.getElementById("bam-tab5").style.visibility = "hidden";

        document.getElementById("vcf-tab2").style.visibility = "hidden";
        document.getElementById("vcf-tab3").style.visibility = "hidden";
        document.getElementById("vcf-tab4").style.visibility = "hidden";
        document.getElementById("vcf-tab5").style.visibility = "hidden";

        document.getElementById("mtab2").style.visibility = "hidden";
        document.getElementById("mtab3").style.visibility = "hidden";

        $("#tab2").addClass("active");
        $("#tab3").addClass("active");
        $("#tab4").addClass("active");

        $("#tab6").addClass("active");
        $("#tab7").addClass("active");
        $("#tab8").addClass("active");
        $("#tab9").addClass("active");

        $("#bam-tab2").addClass("active");
        $("#bam-tab3").addClass("active");
        $("#bam-tab4").addClass("active");
        $("#bam-tab5").addClass("active");

        $("#vcf-tab2").addClass("active");
        $("#vcf-tab3").addClass("active");
        $("#vcf-tab4").addClass("active");
        $("#vcf-tab5").addClass("active");

        $("#mtab2").addClass("active");
        $("#mtab3").addClass("active");
    }


    function showtabContent(tab) {

        document.getElementById(tab).style.visibility = "visible";
    }

    function readTextFile(file, callback) {
        var rawFile = new XMLHttpRequest();

        rawFile.overrideMimeType("application/json");
        rawFile.open("GET", file, true);
        rawFile.onreadystatechange = function () {
            if (rawFile.readyState === 4 && rawFile.status == "200") {
                callback(rawFile.responseText);
            }
        }
        rawFile.send(null);
    }



    //function get_RetreiveCode(SampleId, LocalId) {

    // var list = [SampleId];
    //var jsonText = JSON.stringify({ list: list });

    //xmlhttp = new XMLHttpRequest();
    //xmlhttp.open("POST", '/GAP/Service/se_GAP.asmx/getRetreiveCode', true);
    //var jsonText = JSON.stringify({ list: list });
    //jQuery.ajax({
    //    type: 'POST',
    //    contentType: 'application/json; charset=utf-8',
    //    data: jsonText,
    //    async: true,
    //    dataType: 'JSON',
    //    url: '/GAP/Service/se_GAP.asmx/getRetreiveCode',
    //    success: function (result) {
    //        // alert("test2");
    //        resData = JSON.parse(result.report_general_stats_headers);

    //        //console.log("t"+resData);
    //        mqc_compressed_plotdata = JSON.stringify(resData[0]);
    //        num_datasets_plot_limit = 50;
    //        mqc_sample_names_rename = [];
    //    },
    //    error: function () {
    //        alert('Error on binding the data');
    //    }
    //});

    //}



    var qrStr = window.location.search;
    var spQrStr = qrStr.substring(1);
    var arrQrStr = new Array();
    var arr = spQrStr.split('&');

    var MetricsID = 3;
    var UserID = <%= @Session["WiNGSMasterID"]%>;
    var PIID = <%= @Session["WiNGSPIId"]%>;
    var SampleID = '<%=Session["SampleIDQuality_FASTQC"] %>';
    var filename = "../Upload/FASTQ/3111113_dorost.json";
    console.log(filename);
    readTextFile(filename, function (text) {
        data = JSON.parse(text);
        mqc_compressed_plotdata = data.report_plot_data;
        console.log(mqc_compressed_plotdata);

    });


    num_datasets_plot_limit = 50;
    mqc_sample_names_rename = [];

</script>

<!-- Instead of saving data directly into variables in a normal <script>, data is separated into
     above non-executed script blocks. This way, potential Content Security Policy restrictions
     only apply to static script blocks, which can be added as sha256 exceptions.

     As a precaution the script is wrapped in raw block to remind developers that data should
     not be injected directly into it. -->

<script type="text/javascript">
    mqc_config = JSON.parse(document.getElementById('mqc_config').innerHTML);
</script>
<div style="margin:30px; margin-top:40px; ">
   <div class="content-header row pt-2" style="padding-bottom:20px">
    <table style="width: 100%; background-color: lightgray">

        <tr>
            <td  style="width: 220px">
                 <h4 style="margin-bottom: 1px; color: white; text-shadow: 1px 1px 1px #444;">
                     <asp:Label runat="server" ID="header"  CssClass="header"></asp:Label></h4> 
            </td>

        </tr>

    </table>
</div>
<div class="card-content ">
    <div class="card-body">
        <ul class="nav nav-tabs nav-underline no-hover-bg">
            <li class="nav-item">
                <a class="nav-link " id="menu-tab1" data-toggle="tab" aria-controls="mtab1" href="#mtab1" aria-expanded="false" style="font-size: smaller">FASTQ</a>
            </li>
            <li class="nav-item" onclick="showtabContent('mtab2');">
                <a class="nav-link " id="menu-tab2" data-toggle="tab" aria-controls="mtab2" href="#mtab2" aria-expanded="false" style="font-size: smaller">BAM</a>
            </li>
            <li class="nav-item" onclick="showtabContent('mtab3');">
                <a class="nav-link " id="menu-tab3" data-toggle="tab" aria-controls="mtab3" href="#mtab3" aria-expanded="false" style="font-size: smaller">VCF</a>
            </li>
        </ul>
    </div>
</div>

<div class="tab-content px-1 pt-2">

    <div role="tabpanel" class="tab-pane active" id="mtab1" aria-expanded="true" aria-labelledby="menu-tab1" style="height: 700px">

        <section id="basic-tabs-components">
            <div class="row match-height">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-body">
                                <ul class="nav nav-tabs nav-underline no-hover-bg">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="base-tab1" data-toggle="tab" aria-controls="tab1" href="#tab1" aria-expanded="false" style="font-size: smaller">General Statistics</a>
                                    </li>
                                    <li class="nav-item" onclick="showtabContent('tab2');">
                                        <a class="nav-link" id="base-tab2" data-toggle="tab" aria-controls="tab2" href="#tab2" aria-expanded="false" style="font-size: smaller">Sequence Counts</a>
                                    </li>
                                    <li class="nav-item" onclick="showtabContent('tab3');">
                                        <a class="nav-link" id="base-tab3" data-toggle="tab" aria-controls="tab3" href="#tab3" aria-expanded="false" style="font-size: smaller">Sequence Quality Histograms</a>
                                    </li>
                                    <li class="nav-item" onclick="showtabContent('tab4');">
                                        <a class="nav-link" id="base-tab4" data-toggle="tab" aria-controls="tab4" href="#tab4" aria-expanded="false" style="font-size: smaller">Per Sequence Quality Scores</a>
                                    </li>

                                    <li class="nav-item" onclick="showtabContent('tab6');">
                                        <a class="nav-link" id="base-tab6" data-toggle="tab" aria-controls="tab6" href="#tab6" aria-expanded="false" style="font-size: smaller">Per Sequence GC Content</a>
                                    </li>
                                    <li class="nav-item" onclick="showtabContent('tab7');">
                                        <a class="nav-link" id="base-tab7" data-toggle="tab" aria-controls="tab7" href="#tab7" aria-expanded="false" style="font-size: smaller">Per Base N Content</a>
                                    </li>
                                    <li class="nav-item" onclick="showtabContent('tab8');">
                                        <a class="nav-link" id="base-tab8" data-toggle="tab" aria-controls="tab8" href="#tab8" aria-expanded="false" style="font-size: smaller">Sequence Length Distribution</a>
                                    </li>
                                    <li class="nav-item" onclick="showtabContent('tab9');">
                                        <a class="nav-link" id="base-tab9" data-toggle="tab" aria-controls="tab9" href="#tab9" aria-expanded="false" style="font-size: smaller">Adapter Content</a>
                                    </li>
                                </ul>
                                <div class="tab-content px-1 pt-3">
                                    <div role="tabpanel" class="tab-pane active" id="tab1" aria-expanded="true" aria-labelledby="base-tab1" style="height: 700px">

                                        <div id="general_stats" class="mqc-module-section">
                                            <h2>General Statistics</h2>

                                            <button type="button" class="mqc_table_copy_btn btn btn-default btn-sm" data-clipboard-target="#general_stats_table">
                                                <span class="glyphicon glyphicon-copy"></span>Copy table
                                            </button>

                                            <button type="button" class="mqc_table_configModal_btn btn btn-default btn-sm" data-toggle="modal" data-target="#general_stats_table_configModal">
                                                <span class="glyphicon glyphicon-th"></span>Configure Columns
                                            </button>

                                            <button type="button" class="mqc_table_sortHighlight btn btn-default btn-sm" data-target="#general_stats_table" data-direction="desc" style="display: none;">
                                                <span class="glyphicon glyphicon-sort-by-attributes-alt"></span>Sort by highlight
                                            </button>

                                            <button type="button" class="mqc_table_makeScatter btn btn-default btn-sm" data-toggle="modal" data-target="#tableScatterModal" data-table="#general_stats_table">
                                                <span class="glyphicon glyphicon glyphicon-stats"></span>Plot
                                            </button>

                                            <small id="general_stats_table_numrows_text" class="mqc_table_numrows_text">Showing <sup id="general_stats_table_numrows" class="mqc_table_numrows">4</sup>/<sub>4</sub> rows and <sup id="general_stats_table_numcols" class="mqc_table_numcols">14</sup>/<sub>24</sub> columns.</small>

                                            <div id="general_stats_table_container" class="mqc_table_container">
                                                <div class="table-responsive mqc-table-responsive ">
                                                    <table id="general_stats_table" class="table table-condensed mqc_table" data-title="General Statistics">
                                                        <thead>
                                                            <tr>
                                                                <th class="rowheader">Sample Name</th>
                                                                <th id="header_mqc-generalstats-qualimap-avg_gc" class="mqc-generalstats-qualimap-avg_gc " data-dmax="100.0" data-dmin="0.0" data-namespace="QualiMap"><span class="mqc_table_tooltip" title="QualiMap: Mean GC content">% GC</span></th>
                                                                <th id="header_mqc-generalstats-qualimap-median_insert_size" class="mqc-generalstats-qualimap-median_insert_size " data-dmax="226.0" data-dmin="0.0" data-namespace="QualiMap"><span class="mqc_table_tooltip" title="QualiMap: Median insert size">Ins. size</span></th>
                                                                <th id="header_mqc-generalstats-qualimap-1_x_pc" class="mqc-generalstats-qualimap-1_x_pc hidden" data-dmax="100.0" data-dmin="0.0" data-namespace="QualiMap"><span class="mqc_table_tooltip" title="QualiMap: Fraction of genome with at least 1X coverage">&ge; 1X</span></th>
                                                                <th id="header_mqc-generalstats-qualimap-5_x_pc" class="mqc-generalstats-qualimap-5_x_pc hidden" data-dmax="100.0" data-dmin="0.0" data-namespace="QualiMap"><span class="mqc_table_tooltip" title="QualiMap: Fraction of genome with at least 5X coverage">&ge; 5X</span></th>
                                                                <th id="header_mqc-generalstats-qualimap-10_x_pc" class="mqc-generalstats-qualimap-10_x_pc hidden" data-dmax="100.0" data-dmin="0.0" data-namespace="QualiMap"><span class="mqc_table_tooltip" title="QualiMap: Fraction of genome with at least 10X coverage">&ge; 10X</span></th>
                                                                <th id="header_mqc-generalstats-qualimap-30_x_pc" class="mqc-generalstats-qualimap-30_x_pc " data-dmax="100.0" data-dmin="0.0" data-namespace="QualiMap"><span class="mqc_table_tooltip" title="QualiMap: Fraction of genome with at least 30X coverage">&ge; 30X</span></th>
                                                                <th id="header_mqc-generalstats-qualimap-50_x_pc" class="mqc-generalstats-qualimap-50_x_pc hidden" data-dmax="100.0" data-dmin="0.0" data-namespace="QualiMap"><span class="mqc_table_tooltip" title="QualiMap: Fraction of genome with at least 50X coverage">&ge; 50X</span></th>
                                                                <th id="header_mqc-generalstats-qualimap-median_coverage" class="mqc-generalstats-qualimap-median_coverage " data-dmax="71.0" data-dmin="0.0" data-namespace="QualiMap"><span class="mqc_table_tooltip" title="QualiMap: Median coverage">Median cov</span></th>
                                                                <th id="header_mqc-generalstats-qualimap-mean_coverage" class="mqc-generalstats-qualimap-mean_coverage " data-dmax="18.179513613395574" data-dmin="0.0" data-namespace="QualiMap"><span class="mqc_table_tooltip" title="QualiMap: Mean coverage">Mean cov</span></th>
                                                                <th id="header_mqc-generalstats-qualimap-percentage_aligned" class="mqc-generalstats-qualimap-percentage_aligned " data-dmax="100.0" data-dmin="0.0" data-namespace="QualiMap"><span class="mqc_table_tooltip" title="QualiMap: % mapped reads">% Aligned</span></th>
                                                                <th id="header_mqc-generalstats-qualimap-mapped_reads" class="mqc-generalstats-qualimap-mapped_reads hidden" data-dmax="78.475251" data-dmin="0.0" data-namespace="QualiMap" data-shared-key="read_count"><span class="mqc_table_tooltip" title="QualiMap: Number of mapped reads (millions)">M Aligned</span></th>
                                                                <th id="header_mqc-generalstats-qualimap-total_reads" class="mqc-generalstats-qualimap-total_reads hidden" data-dmax="78.475251" data-dmin="0.0" data-namespace="QualiMap" data-shared-key="read_count"><span class="mqc_table_tooltip" title="QualiMap: Number of reads (millions)">M Total reads</span></th>
                                                                <th id="header_mqc-generalstats-qualimap-general_error_rate" class="mqc-generalstats-qualimap-general_error_rate hidden" data-dmax="100.0" data-dmin="0.0" data-namespace="QualiMap"><span class="mqc_table_tooltip" title="QualiMap: Alignment error rate. Total edit distance (SAM NM field) over the number of mapped bases">Error rate</span></th>
                                                                <th id="header_mqc-generalstats-bcftools_stats-number_of_records" class="mqc-generalstats-bcftools_stats-number_of_records " data-dmax="1102778.0" data-dmin="0.0" data-namespace="Bcftools Stats"><span class="mqc_table_tooltip" title="Bcftools Stats: Variations total">Vars</span></th>
                                                                <th id="header_mqc-generalstats-bcftools_stats-number_of_SNPs" class="mqc-generalstats-bcftools_stats-number_of_SNPs " data-dmax="976069.0" data-dmin="0.0" data-namespace="Bcftools Stats"><span class="mqc_table_tooltip" title="Bcftools Stats: Variation SNPs">SNP</span></th>
                                                                <th id="header_mqc-generalstats-bcftools_stats-number_of_indels" class="mqc-generalstats-bcftools_stats-number_of_indels " data-dmax="126862.0" data-dmin="0.0" data-namespace="Bcftools Stats"><span class="mqc_table_tooltip" title="Bcftools Stats: Variation Insertions/Deletions">Indel</span></th>
                                                                <th id="header_mqc-generalstats-bcftools_stats-tstv" class="mqc-generalstats-bcftools_stats-tstv " data-dmax="1.77" data-dmin="0.0" data-namespace="Bcftools Stats"><span class="mqc_table_tooltip" title="Bcftools Stats: Variant SNP transition / transversion ratio">Ts/Tv</span></th>
                                                                <th id="header_mqc-generalstats-bcftools_stats-number_of_MNPs" class="mqc-generalstats-bcftools_stats-number_of_MNPs hidden" data-dmax="0" data-dmin="0.0" data-namespace="Bcftools Stats"><span class="mqc_table_tooltip" title="Bcftools Stats: Variation multinucleotide polymorphisms">MNP</span></th>
                                                                <th id="header_mqc-generalstats-picard-PERCENT_DUPLICATION" class="mqc-generalstats-picard-PERCENT_DUPLICATION " data-dmax="100.0" data-dmin="0.0" data-namespace="Picard"><span class="mqc_table_tooltip" title="Picard: Mark Duplicates - Percent Duplication">% Dups</span></th>
                                                                <th id="header_mqc-generalstats-fastqc-percent_duplicates" class="mqc-generalstats-fastqc-percent_duplicates " data-dmax="100.0" data-dmin="0.0" data-namespace="FastQC"><span class="mqc_table_tooltip" title="FastQC: % Duplicate Reads">% Dups</span></th>
                                                                <th id="header_mqc-generalstats-fastqc-percent_gc" class="mqc-generalstats-fastqc-percent_gc " data-dmax="100.0" data-dmin="0.0" data-namespace="FastQC"><span class="mqc_table_tooltip" title="FastQC: Average % GC Content">% GC</span></th>
                                                                <th id="header_mqc-generalstats-fastqc-avg_sequence_length" class="mqc-generalstats-fastqc-avg_sequence_length hidden" data-dmax="151.0" data-dmin="0.0" data-namespace="FastQC"><span class="mqc_table_tooltip" title="FastQC: Average Sequence Length (bp)">Length</span></th>
                                                                <th id="header_mqc-generalstats-fastqc-percent_fails" class="mqc-generalstats-fastqc-percent_fails hidden" data-dmax="100.0" data-dmin="0.0" data-namespace="FastQC"><span class="mqc_table_tooltip" title="FastQC: Percentage of modules failed in FastQC report (includes those not plotted here)">% Failed</span></th>
                                                                <th id="header_mqc-generalstats-fastqc-total_sequences" class="mqc-generalstats-fastqc-total_sequences " data-dmax="78.475251" data-dmin="0.0" data-namespace="FastQC" data-shared-key="read_count"><span class="mqc_table_tooltip" title="FastQC: Total Sequences (millions)">M Seqs</span></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <th class="rowheader" data-original-sn="2019-74">2019-74</th>
                                                                <td class="data-coloured mqc-generalstats-qualimap-avg_gc "></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-median_insert_size "></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-1_x_pc hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-5_x_pc hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-10_x_pc hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-30_x_pc "></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-50_x_pc hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-median_coverage "></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-mean_coverage "></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-percentage_aligned ">
                                                                    <div class="wrapper"><span class="bar" style="width: 99.8825820894794%; background-color: #b3c7bf;"></span><span class="val">99.9%</span></div>
                                                                </td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-mapped_reads hidden">
                                                                    <div class="wrapper"><span class="bar" style="width: 99.88258208947938%; background-color: #b3d2c3;"></span><span class="val">78.4</span></div>
                                                                </td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-total_reads hidden">
                                                                    <div class="wrapper"><span class="bar" style="width: 100.0%; background-color: #b5c1d3;"></span><span class="val">78.5</span></div>
                                                                </td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-general_error_rate hidden">
                                                                    <div class="wrapper"><span class="bar" style="width: 0.3%; background-color: #fffcf9;"></span><span class="val">0.30%</span></div>
                                                                </td>
                                                                <td class="data-coloured mqc-generalstats-bcftools_stats-number_of_records ">
                                                                    <div class="wrapper"><span class="bar" style="width: 100.0%; background-color: #b5c6d9;"></span><span class="val">1<span class="mqc_thousandSep"></span>102<span class="mqc_thousandSep"></span>778</span></div>
                                                                </td>
                                                                <td class="data-coloured mqc-generalstats-bcftools_stats-number_of_SNPs ">
                                                                    <div class="wrapper"><span class="bar" style="width: 100.0%; background-color: #b5c6d9;"></span><span class="val">976<span class="mqc_thousandSep"></span>069</span></div>
                                                                </td>
                                                                <td class="data-coloured mqc-generalstats-bcftools_stats-number_of_indels ">
                                                                    <div class="wrapper"><span class="bar" style="width: 100.0%; background-color: #b5c6d9;"></span><span class="val">126<span class="mqc_thousandSep"></span>862</span></div>
                                                                </td>
                                                                <td class="data-coloured mqc-generalstats-bcftools_stats-tstv ">
                                                                    <div class="wrapper"><span class="bar" style="width: 100.0%; background-color: #b5c6d9;"></span><span class="val">1.77</span></div>
                                                                </td>
                                                                <td class="data-coloured mqc-generalstats-bcftools_stats-number_of_MNPs hidden">
                                                                    <div class="wrapper"><span class="bar" style="width: 0%; background-color: #fdfefb;"></span><span class="val">0</span></div>
                                                                </td>
                                                                <td class="data-coloured mqc-generalstats-picard-PERCENT_DUPLICATION ">
                                                                    <div class="wrapper"><span class="bar" style="width: 10.8293%; background-color: #fff9f0;"></span><span class="val">10.8%</span></div>
                                                                </td>
                                                                <td class="data-coloured mqc-generalstats-fastqc-percent_duplicates "></td>
                                                                <td class="data-coloured mqc-generalstats-fastqc-percent_gc "></td>
                                                                <td class="data-coloured mqc-generalstats-fastqc-avg_sequence_length hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-fastqc-percent_fails hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-fastqc-total_sequences "></td>
                                                            </tr>
                                                            <tr>
                                                                <th class="rowheader" data-original-sn="2019-74_1">2019-74_1</th>
                                                                <td class="data-coloured mqc-generalstats-qualimap-avg_gc "></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-median_insert_size "></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-1_x_pc hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-5_x_pc hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-10_x_pc hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-30_x_pc "></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-50_x_pc hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-median_coverage "></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-mean_coverage "></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-percentage_aligned "></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-mapped_reads hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-total_reads hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-general_error_rate hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-bcftools_stats-number_of_records "></td>
                                                                <td class="data-coloured mqc-generalstats-bcftools_stats-number_of_SNPs "></td>
                                                                <td class="data-coloured mqc-generalstats-bcftools_stats-number_of_indels "></td>
                                                                <td class="data-coloured mqc-generalstats-bcftools_stats-tstv "></td>
                                                                <td class="data-coloured mqc-generalstats-bcftools_stats-number_of_MNPs hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-picard-PERCENT_DUPLICATION "></td>
                                                                <td class="data-coloured mqc-generalstats-fastqc-percent_duplicates ">
                                                                    <div class="wrapper"><span class="bar" style="width: 17.426401589720555%; background-color: #cbe8cf;"></span><span class="val">17.4%</span></div>
                                                                </td>
                                                                <td class="data-coloured mqc-generalstats-fastqc-percent_gc ">
                                                                    <div class="wrapper"><span class="bar" style="width: 49.0%; background-color: #fdd7b6;"></span><span class="val">49%</span></div>
                                                                </td>
                                                                <td class="data-coloured mqc-generalstats-fastqc-avg_sequence_length hidden">
                                                                    <div class="wrapper"><span class="bar" style="width: 100.0%; background-color: #b3d2c3;"></span><span class="val">151 bp</span></div>
                                                                </td>
                                                                <td class="data-coloured mqc-generalstats-fastqc-percent_fails hidden">
                                                                    <div class="wrapper"><span class="bar" style="width: 0.0%; background-color: #fffcfb;"></span><span class="val">0%</span></div>
                                                                </td>
                                                                <td class="data-coloured mqc-generalstats-fastqc-total_sequences ">
                                                                    <div class="wrapper"><span class="bar" style="width: 49.92994542954695%; background-color: #d3e7f3;"></span><span class="val">39.2</span></div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th class="rowheader" data-original-sn="2019-74_2">2019-74_2</th>
                                                                <td class="data-coloured mqc-generalstats-qualimap-avg_gc "></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-median_insert_size "></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-1_x_pc hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-5_x_pc hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-10_x_pc hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-30_x_pc "></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-50_x_pc hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-median_coverage "></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-mean_coverage "></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-percentage_aligned "></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-mapped_reads hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-total_reads hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-general_error_rate hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-bcftools_stats-number_of_records "></td>
                                                                <td class="data-coloured mqc-generalstats-bcftools_stats-number_of_SNPs "></td>
                                                                <td class="data-coloured mqc-generalstats-bcftools_stats-number_of_indels "></td>
                                                                <td class="data-coloured mqc-generalstats-bcftools_stats-tstv "></td>
                                                                <td class="data-coloured mqc-generalstats-bcftools_stats-number_of_MNPs hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-picard-PERCENT_DUPLICATION "></td>
                                                                <td class="data-coloured mqc-generalstats-fastqc-percent_duplicates ">
                                                                    <div class="wrapper"><span class="bar" style="width: 17.041959951764582%; background-color: #cae8cf;"></span><span class="val">17.0%</span></div>
                                                                </td>
                                                                <td class="data-coloured mqc-generalstats-fastqc-percent_gc ">
                                                                    <div class="wrapper"><span class="bar" style="width: 49.0%; background-color: #fdd7b6;"></span><span class="val">49%</span></div>
                                                                </td>
                                                                <td class="data-coloured mqc-generalstats-fastqc-avg_sequence_length hidden">
                                                                    <div class="wrapper"><span class="bar" style="width: 100.0%; background-color: #b3d2c3;"></span><span class="val">151 bp</span></div>
                                                                </td>
                                                                <td class="data-coloured mqc-generalstats-fastqc-percent_fails hidden">
                                                                    <div class="wrapper"><span class="bar" style="width: 9.090909090909092%; background-color: #fff7f4;"></span><span class="val">9%</span></div>
                                                                </td>
                                                                <td class="data-coloured mqc-generalstats-fastqc-total_sequences ">
                                                                    <div class="wrapper"><span class="bar" style="width: 49.92994542954695%; background-color: #d3e7f3;"></span><span class="val">39.2</span></div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th class="rowheader" data-original-sn="quality">quality</th>
                                                                <td class="data-coloured mqc-generalstats-qualimap-avg_gc ">
                                                                    <div class="wrapper"><span class="bar" style="width: 51.2409483860197%; background-color: #ffdcb4;"></span><span class="val">51%</span></div>
                                                                </td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-median_insert_size ">
                                                                    <div class="wrapper"><span class="bar" style="width: 100.0%; background-color: #c0b3c9;"></span><span class="val">226</span></div>
                                                                </td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-1_x_pc hidden">
                                                                    <div class="wrapper"><span class="bar" style="width: 99.53887629128282%; background-color: #b3d2c3;"></span><span class="val">99.5%</span></div>
                                                                </td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-5_x_pc hidden">
                                                                    <div class="wrapper"><span class="bar" style="width: 97.96412646247998%; background-color: #b4d5c5;"></span><span class="val">98.0%</span></div>
                                                                </td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-10_x_pc hidden">
                                                                    <div class="wrapper"><span class="bar" style="width: 95.30730234181233%; background-color: #b6d8c7;"></span><span class="val">95.3%</span></div>
                                                                </td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-30_x_pc ">
                                                                    <div class="wrapper"><span class="bar" style="width: 79.84983157223482%; background-color: #d1ebd0;"></span><span class="val">79.8%</span></div>
                                                                </td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-50_x_pc hidden">
                                                                    <div class="wrapper"><span class="bar" style="width: 64.17514389387802%; background-color: #edf7d8;"></span><span class="val">64.2%</span></div>
                                                                </td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-median_coverage ">
                                                                    <div class="wrapper"><span class="bar" style="width: 100.0%; background-color: #cab3c9;"></span><span class="val">71.0X</span></div>
                                                                </td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-mean_coverage ">
                                                                    <div class="wrapper"><span class="bar" style="width: 100.0%; background-color: #cab3c9;"></span><span class="val">18.2X</span></div>
                                                                </td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-percentage_aligned "></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-mapped_reads hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-total_reads hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-qualimap-general_error_rate hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-bcftools_stats-number_of_records "></td>
                                                                <td class="data-coloured mqc-generalstats-bcftools_stats-number_of_SNPs "></td>
                                                                <td class="data-coloured mqc-generalstats-bcftools_stats-number_of_indels "></td>
                                                                <td class="data-coloured mqc-generalstats-bcftools_stats-tstv "></td>
                                                                <td class="data-coloured mqc-generalstats-bcftools_stats-number_of_MNPs hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-picard-PERCENT_DUPLICATION "></td>
                                                                <td class="data-coloured mqc-generalstats-fastqc-percent_duplicates "></td>
                                                                <td class="data-coloured mqc-generalstats-fastqc-percent_gc "></td>
                                                                <td class="data-coloured mqc-generalstats-fastqc-avg_sequence_length hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-fastqc-percent_fails hidden"></td>
                                                                <td class="data-coloured mqc-generalstats-fastqc-total_sequences "></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <!-- MultiQC Table Columns Modal -->
                                            <div class="modal fade" id="general_stats_table_configModal" tabindex="-1">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                            <h4 class="modal-title">General Statistics: Columns</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>Uncheck the tick box to hide columns. Click and drag the handle on the left to change order.</p>
                                                            <p>
                                                                <button class="btn btn-default btn-sm mqc_configModal_bulkVisible" data-target="#general_stats_table" data-action="showAll">Show All</button>
                                                                <button class="btn btn-default btn-sm mqc_configModal_bulkVisible" data-target="#general_stats_table" data-action="showNone">Show None</button>
                                                            </p>
                                                            <table class="table mqc_table mqc_sortable mqc_configModal_table" id="general_stats_table_configModal_table" data-title="General Statistics">
                                                                <thead>
                                                                    <tr>
                                                                        <th class="sorthandle" style="text-align: center;">Sort</th>
                                                                        <th style="text-align: center;">Visible</th>
                                                                        <th>Group</th>
                                                                        <th>Column</th>
                                                                        <th>Description</th>
                                                                        <th>ID</th>
                                                                        <th>Scale</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>

                                                                    <tr class="mqc-generalstats-qualimap-avg_gc" style="background-color: rgba(55,126,184, 0.15);">
                                                                        <td class="sorthandle ui-sortable-handle">||</span></td>
                                                                        <td style="text-align: center;">
                                                                            <input class="mqc_table_col_visible" type="checkbox" checked="checked" value="mqc-generalstats-qualimap-avg_gc" data-target="#general_stats_table">
                                                                        </td>
                                                                        <td>QualiMap</td>
                                                                        <td>% GC</td>
                                                                        <td>Mean GC content</td>
                                                                        <td><code>avg_gc</code></td>
                                                                        <td>None</td>
                                                                    </tr>
                                                                    <tr class="mqc-generalstats-qualimap-median_insert_size" style="background-color: rgba(55,126,184, 0.15);">
                                                                        <td class="sorthandle ui-sortable-handle">||</span></td>
                                                                        <td style="text-align: center;">
                                                                            <input class="mqc_table_col_visible" type="checkbox" checked="checked" value="mqc-generalstats-qualimap-median_insert_size" data-target="#general_stats_table">
                                                                        </td>
                                                                        <td>QualiMap</td>
                                                                        <td>Ins. size</td>
                                                                        <td>Median insert size</td>
                                                                        <td><code>median_insert_size</code></td>
                                                                        <td>None</td>
                                                                    </tr>
                                                                    <tr class="mqc-generalstats-qualimap-1_x_pc text-muted" style="background-color: rgba(55,126,184, 0.15);">
                                                                        <td class="sorthandle ui-sortable-handle">||</span></td>
                                                                        <td style="text-align: center;">
                                                                            <input class="mqc_table_col_visible" type="checkbox" value="mqc-generalstats-qualimap-1_x_pc" data-target="#general_stats_table">
                                                                        </td>
                                                                        <td>QualiMap</td>
                                                                        <td>&ge; 1X</td>
                                                                        <td>Fraction of genome with at least 1X coverage</td>
                                                                        <td><code>1_x_pc</code></td>
                                                                        <td>None</td>
                                                                    </tr>
                                                                    <tr class="mqc-generalstats-qualimap-5_x_pc text-muted" style="background-color: rgba(55,126,184, 0.15);">
                                                                        <td class="sorthandle ui-sortable-handle">||</span></td>
                                                                        <td style="text-align: center;">
                                                                            <input class="mqc_table_col_visible" type="checkbox" value="mqc-generalstats-qualimap-5_x_pc" data-target="#general_stats_table">
                                                                        </td>
                                                                        <td>QualiMap</td>
                                                                        <td>&ge; 5X</td>
                                                                        <td>Fraction of genome with at least 5X coverage</td>
                                                                        <td><code>5_x_pc</code></td>
                                                                        <td>None</td>
                                                                    </tr>
                                                                    <tr class="mqc-generalstats-qualimap-10_x_pc text-muted" style="background-color: rgba(55,126,184, 0.15);">
                                                                        <td class="sorthandle ui-sortable-handle">||</span></td>
                                                                        <td style="text-align: center;">
                                                                            <input class="mqc_table_col_visible" type="checkbox" value="mqc-generalstats-qualimap-10_x_pc" data-target="#general_stats_table">
                                                                        </td>
                                                                        <td>QualiMap</td>
                                                                        <td>&ge; 10X</td>
                                                                        <td>Fraction of genome with at least 10X coverage</td>
                                                                        <td><code>10_x_pc</code></td>
                                                                        <td>None</td>
                                                                    </tr>
                                                                    <tr class="mqc-generalstats-qualimap-30_x_pc" style="background-color: rgba(55,126,184, 0.15);">
                                                                        <td class="sorthandle ui-sortable-handle">||</span></td>
                                                                        <td style="text-align: center;">
                                                                            <input class="mqc_table_col_visible" type="checkbox" checked="checked" value="mqc-generalstats-qualimap-30_x_pc" data-target="#general_stats_table">
                                                                        </td>
                                                                        <td>QualiMap</td>
                                                                        <td>&ge; 30X</td>
                                                                        <td>Fraction of genome with at least 30X coverage</td>
                                                                        <td><code>30_x_pc</code></td>
                                                                        <td>None</td>
                                                                    </tr>
                                                                    <tr class="mqc-generalstats-qualimap-50_x_pc text-muted" style="background-color: rgba(55,126,184, 0.15);">
                                                                        <td class="sorthandle ui-sortable-handle">||</span></td>
                                                                        <td style="text-align: center;">
                                                                            <input class="mqc_table_col_visible" type="checkbox" value="mqc-generalstats-qualimap-50_x_pc" data-target="#general_stats_table">
                                                                        </td>
                                                                        <td>QualiMap</td>
                                                                        <td>&ge; 50X</td>
                                                                        <td>Fraction of genome with at least 50X coverage</td>
                                                                        <td><code>50_x_pc</code></td>
                                                                        <td>None</td>
                                                                    </tr>
                                                                    <tr class="mqc-generalstats-qualimap-median_coverage" style="background-color: rgba(55,126,184, 0.15);">
                                                                        <td class="sorthandle ui-sortable-handle">||</span></td>
                                                                        <td style="text-align: center;">
                                                                            <input class="mqc_table_col_visible" type="checkbox" checked="checked" value="mqc-generalstats-qualimap-median_coverage" data-target="#general_stats_table">
                                                                        </td>
                                                                        <td>QualiMap</td>
                                                                        <td>Median cov</td>
                                                                        <td>Median coverage</td>
                                                                        <td><code>median_coverage</code></td>
                                                                        <td>None</td>
                                                                    </tr>
                                                                    <tr class="mqc-generalstats-qualimap-mean_coverage" style="background-color: rgba(55,126,184, 0.15);">
                                                                        <td class="sorthandle ui-sortable-handle">||</span></td>
                                                                        <td style="text-align: center;">
                                                                            <input class="mqc_table_col_visible" type="checkbox" checked="checked" value="mqc-generalstats-qualimap-mean_coverage" data-target="#general_stats_table">
                                                                        </td>
                                                                        <td>QualiMap</td>
                                                                        <td>Mean cov</td>
                                                                        <td>Mean coverage</td>
                                                                        <td><code>mean_coverage</code></td>
                                                                        <td>None</td>
                                                                    </tr>
                                                                    <tr class="mqc-generalstats-qualimap-percentage_aligned" style="background-color: rgba(55,126,184, 0.15);">
                                                                        <td class="sorthandle ui-sortable-handle">||</span></td>
                                                                        <td style="text-align: center;">
                                                                            <input class="mqc_table_col_visible" type="checkbox" checked="checked" value="mqc-generalstats-qualimap-percentage_aligned" data-target="#general_stats_table">
                                                                        </td>
                                                                        <td>QualiMap</td>
                                                                        <td>% Aligned</td>
                                                                        <td>% mapped reads</td>
                                                                        <td><code>percentage_aligned</code></td>
                                                                        <td>None</td>
                                                                    </tr>
                                                                    <tr class="mqc-generalstats-qualimap-mapped_reads text-muted" style="background-color: rgba(55,126,184, 0.15);">
                                                                        <td class="sorthandle ui-sortable-handle">||</span></td>
                                                                        <td style="text-align: center;">
                                                                            <input class="mqc_table_col_visible" type="checkbox" value="mqc-generalstats-qualimap-mapped_reads" data-target="#general_stats_table">
                                                                        </td>
                                                                        <td>QualiMap</td>
                                                                        <td>M Aligned</td>
                                                                        <td>Number of mapped reads (millions)</td>
                                                                        <td><code>mapped_reads</code></td>
                                                                        <td>read_count</td>
                                                                    </tr>
                                                                    <tr class="mqc-generalstats-qualimap-total_reads text-muted" style="background-color: rgba(55,126,184, 0.15);">
                                                                        <td class="sorthandle ui-sortable-handle">||</span></td>
                                                                        <td style="text-align: center;">
                                                                            <input class="mqc_table_col_visible" type="checkbox" value="mqc-generalstats-qualimap-total_reads" data-target="#general_stats_table">
                                                                        </td>
                                                                        <td>QualiMap</td>
                                                                        <td>M Total reads</td>
                                                                        <td>Number of reads (millions)</td>
                                                                        <td><code>total_reads</code></td>
                                                                        <td>read_count</td>
                                                                    </tr>
                                                                    <tr class="mqc-generalstats-qualimap-general_error_rate text-muted" style="background-color: rgba(55,126,184, 0.15);">
                                                                        <td class="sorthandle ui-sortable-handle">||</span></td>
                                                                        <td style="text-align: center;">
                                                                            <input class="mqc_table_col_visible" type="checkbox" value="mqc-generalstats-qualimap-general_error_rate" data-target="#general_stats_table">
                                                                        </td>
                                                                        <td>QualiMap</td>
                                                                        <td>Error rate</td>
                                                                        <td>Alignment error rate. Total edit distance (SAM NM field) over the number of mapped bases</td>
                                                                        <td><code>general_error_rate</code></td>
                                                                        <td>None</td>
                                                                    </tr>
                                                                    <tr class="mqc-generalstats-bcftools_stats-number_of_records" style="background-color: rgba(77,175,74, 0.15);">
                                                                        <td class="sorthandle ui-sortable-handle">||</span></td>
                                                                        <td style="text-align: center;">
                                                                            <input class="mqc_table_col_visible" type="checkbox" checked="checked" value="mqc-generalstats-bcftools_stats-number_of_records" data-target="#general_stats_table">
                                                                        </td>
                                                                        <td>Bcftools Stats</td>
                                                                        <td>Vars</td>
                                                                        <td>Variations total</td>
                                                                        <td><code>number_of_records</code></td>
                                                                        <td>None</td>
                                                                    </tr>
                                                                    <tr class="mqc-generalstats-bcftools_stats-number_of_SNPs" style="background-color: rgba(77,175,74, 0.15);">
                                                                        <td class="sorthandle ui-sortable-handle">||</span></td>
                                                                        <td style="text-align: center;">
                                                                            <input class="mqc_table_col_visible" type="checkbox" checked="checked" value="mqc-generalstats-bcftools_stats-number_of_SNPs" data-target="#general_stats_table">
                                                                        </td>
                                                                        <td>Bcftools Stats</td>
                                                                        <td>SNP</td>
                                                                        <td>Variation SNPs</td>
                                                                        <td><code>number_of_SNPs</code></td>
                                                                        <td>None</td>
                                                                    </tr>
                                                                    <tr class="mqc-generalstats-bcftools_stats-number_of_indels" style="background-color: rgba(77,175,74, 0.15);">
                                                                        <td class="sorthandle ui-sortable-handle">||</span></td>
                                                                        <td style="text-align: center;">
                                                                            <input class="mqc_table_col_visible" type="checkbox" checked="checked" value="mqc-generalstats-bcftools_stats-number_of_indels" data-target="#general_stats_table">
                                                                        </td>
                                                                        <td>Bcftools Stats</td>
                                                                        <td>Indel</td>
                                                                        <td>Variation Insertions/Deletions</td>
                                                                        <td><code>number_of_indels</code></td>
                                                                        <td>None</td>
                                                                    </tr>
                                                                    <tr class="mqc-generalstats-bcftools_stats-tstv" style="background-color: rgba(77,175,74, 0.15);">
                                                                        <td class="sorthandle ui-sortable-handle">||</span></td>
                                                                        <td style="text-align: center;">
                                                                            <input class="mqc_table_col_visible" type="checkbox" checked="checked" value="mqc-generalstats-bcftools_stats-tstv" data-target="#general_stats_table">
                                                                        </td>
                                                                        <td>Bcftools Stats</td>
                                                                        <td>Ts/Tv</td>
                                                                        <td>Variant SNP transition / transversion ratio</td>
                                                                        <td><code>tstv</code></td>
                                                                        <td>None</td>
                                                                    </tr>
                                                                    <tr class="mqc-generalstats-bcftools_stats-number_of_MNPs text-muted" style="background-color: rgba(77,175,74, 0.15);">
                                                                        <td class="sorthandle ui-sortable-handle">||</span></td>
                                                                        <td style="text-align: center;">
                                                                            <input class="mqc_table_col_visible" type="checkbox" value="mqc-generalstats-bcftools_stats-number_of_MNPs" data-target="#general_stats_table">
                                                                        </td>
                                                                        <td>Bcftools Stats</td>
                                                                        <td>MNP</td>
                                                                        <td>Variation multinucleotide polymorphisms</td>
                                                                        <td><code>number_of_MNPs</code></td>
                                                                        <td>None</td>
                                                                    </tr>
                                                                    <tr class="mqc-generalstats-picard-PERCENT_DUPLICATION" style="background-color: rgba(152,78,163, 0.15);">
                                                                        <td class="sorthandle ui-sortable-handle">||</span></td>
                                                                        <td style="text-align: center;">
                                                                            <input class="mqc_table_col_visible" type="checkbox" checked="checked" value="mqc-generalstats-picard-PERCENT_DUPLICATION" data-target="#general_stats_table">
                                                                        </td>
                                                                        <td>Picard</td>
                                                                        <td>% Dups</td>
                                                                        <td>Mark Duplicates - Percent Duplication</td>
                                                                        <td><code>PERCENT_DUPLICATION</code></td>
                                                                        <td>None</td>
                                                                    </tr>
                                                                    <tr class="mqc-generalstats-fastqc-percent_duplicates" style="background-color: rgba(255,127,0, 0.15);">
                                                                        <td class="sorthandle ui-sortable-handle">||</span></td>
                                                                        <td style="text-align: center;">
                                                                            <input class="mqc_table_col_visible" type="checkbox" checked="checked" value="mqc-generalstats-fastqc-percent_duplicates" data-target="#general_stats_table">
                                                                        </td>
                                                                        <td>FastQC</td>
                                                                        <td>% Dups</td>
                                                                        <td>% Duplicate Reads</td>
                                                                        <td><code>percent_duplicates</code></td>
                                                                        <td>None</td>
                                                                    </tr>
                                                                    <tr class="mqc-generalstats-fastqc-percent_gc" style="background-color: rgba(255,127,0, 0.15);">
                                                                        <td class="sorthandle ui-sortable-handle">||</span></td>
                                                                        <td style="text-align: center;">
                                                                            <input class="mqc_table_col_visible" type="checkbox" checked="checked" value="mqc-generalstats-fastqc-percent_gc" data-target="#general_stats_table">
                                                                        </td>
                                                                        <td>FastQC</td>
                                                                        <td>% GC</td>
                                                                        <td>Average % GC Content</td>
                                                                        <td><code>percent_gc</code></td>
                                                                        <td>None</td>
                                                                    </tr>
                                                                    <tr class="mqc-generalstats-fastqc-avg_sequence_length text-muted" style="background-color: rgba(255,127,0, 0.15);">
                                                                        <td class="sorthandle ui-sortable-handle">||</span></td>
                                                                        <td style="text-align: center;">
                                                                            <input class="mqc_table_col_visible" type="checkbox" value="mqc-generalstats-fastqc-avg_sequence_length" data-target="#general_stats_table">
                                                                        </td>
                                                                        <td>FastQC</td>
                                                                        <td>Length</td>
                                                                        <td>Average Sequence Length (bp)</td>
                                                                        <td><code>avg_sequence_length</code></td>
                                                                        <td>None</td>
                                                                    </tr>
                                                                    <tr class="mqc-generalstats-fastqc-percent_fails text-muted" style="background-color: rgba(255,127,0, 0.15);">
                                                                        <td class="sorthandle ui-sortable-handle">||</span></td>
                                                                        <td style="text-align: center;">
                                                                            <input class="mqc_table_col_visible" type="checkbox" value="mqc-generalstats-fastqc-percent_fails" data-target="#general_stats_table">
                                                                        </td>
                                                                        <td>FastQC</td>
                                                                        <td>% Failed</td>
                                                                        <td>Percentage of modules failed in FastQC report (includes those not plotted here)</td>
                                                                        <td><code>percent_fails</code></td>
                                                                        <td>None</td>
                                                                    </tr>
                                                                    <tr class="mqc-generalstats-fastqc-total_sequences" style="background-color: rgba(255,127,0, 0.15);">
                                                                        <td class="sorthandle ui-sortable-handle">||</span></td>
                                                                        <td style="text-align: center;">
                                                                            <input class="mqc_table_col_visible" type="checkbox" checked="checked" value="mqc-generalstats-fastqc-total_sequences" data-target="#general_stats_table">
                                                                        </td>
                                                                        <td>FastQC</td>
                                                                        <td>M Seqs</td>
                                                                        <td>Total Sequences (millions)</td>
                                                                        <td><code>total_sequences</code></td>
                                                                        <td>read_count</td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>



                                    </div>
                                    <div class="tab-pane" id="tab2" aria-labelledby="base-tab2">
                                        <div class="mqc-section mqc-section-fastqc">
                                            <button class="btn btn-default btn-sm pull-right" type="button" data-toggle="collapse" data-target="#fastqc_sequence_counts_helptext" aria-expanded="false" aria-controls="fastqc_sequence_counts_helptext">
                                                <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                                Help
                                            </button>
                                            <div class="mqc-section-description">
                                                <p>Sequence counts for each sample. Duplicate read counts are an estimate only.</p>
                                            </div>
                                            <div class="collapse mqc-section-helptext " id="fastqc_sequence_counts_helptext">
                                                <div class="well">
                                                    <p>
                                                        This plot show the total number of reads, broken down into unique and duplicate
                                                if possible (only more recent versions of FastQC give duplicate info).
                                                    </p>
                                                    <p>
                                                        You can read more about duplicate calculation in the
                                            <a href="https://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help/3%20Analysis%20Modules/8%20Duplicate%20Sequences.html">FastQC documentation</a>.
                                            A small part has been copied here for convenience:
                                                    </p>
                                                    <p>
                                                        <em>Only sequences which first appear in the first 100,000 sequences
                                                in each file are analysed. This should be enough to get a good impression
                                                for the duplication levels in the whole file. Each sequence is tracked to
                                                the end of the file to give a representative count of the overall duplication level.</em>
                                                    </p>
                                                    <p>
                                                        <em>The duplication detection requires an exact sequence match over the whole length of
                                                the sequence. Any reads over 75bp in length are truncated to 50bp for this analysis.</em>
                                                    </p>
                                                </div>
                                            </div>

                                            <div class="mqc-section-plot">
                                                <div class="mqc_hcplot_plotgroup">
                                                    <div class="btn-group hc_switch_group">
                                                        <button class="btn btn-default btn-sm active" data-action="set_numbers" data-target="fastqc_sequence_counts_plot" data-ylab="Number of reads">Number of reads</button>
                                                        <button class="btn btn-default btn-sm " data-action="set_percent" data-target="fastqc_sequence_counts_plot" data-ylab="Percentages">Percentages</button>
                                                    </div>
                                                    <div class="hc-plot-wrapper">
                                                        <div id="fastqc_sequence_counts_plot" class="hc-plot not_rendered hc-bar-plot"><small>loading..</small></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <hr>
                                        </div>
                                    </div>
                                    <div class="tab-pane " id="tab3" aria-labelledby="base-tab3">
                                        <div class="mqc-section mqc-section-fastqc">

                                            <button class="btn btn-default btn-sm pull-right" type="button" data-toggle="collapse" data-target="#fastqc_per_base_sequence_quality_helptext" aria-expanded="false" aria-controls="fastqc_per_base_sequence_quality_helptext">
                                                <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                                Help
                                            </button>

                                            <div class="mqc-section-description">
                                                <p>The mean quality value across each base position in the read.</p>
                                            </div>


                                            <div class="collapse mqc-section-helptext " id="fastqc_per_base_sequence_quality_helptext">
                                                <div class="well">
                                                    <p>
                                                        To enable multiple samples to be plotted on the same graph, only the mean quality
                                                scores are plotted (unlike the box plots seen in FastQC reports).
                                                    </p>
                                                    <p>Taken from the <a href="http://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help/3%20Analysis%20Modules/2%20Per%20Base%20Sequence%20Quality.html">FastQC help</a>:</p>
                                                    <p>
                                                        <em>The y-axis on the graph shows the quality scores. The higher the score, the better
                                            the base call. The background of the graph divides the y axis into very good quality
                                            calls (green), calls of reasonable quality (orange), and calls of poor quality (red).
                                            The quality of calls on most platforms will degrade as the run progresses, so it is
                                            common to see base calls falling into the orange area towards the end of a read.</em>
                                                    </p>
                                                </div>
                                            </div>

                                            <div class="mqc-section-plot">
                                                <div class="mqc_hcplot_plotgroup">
                                                    <div class="hc-plot-wrapper">
                                                        <div id="fastqc_per_base_sequence_quality_plot" class="hc-plot not_rendered hc-line-plot"><small>loading..</small></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <hr>
                                        </div>
                                    </div>
                                    <div class="tab-pane " id="tab4" aria-labelledby="base-tab4">
                                        <div class="mqc-section mqc-section-fastqc">


                                            <button class="btn btn-default btn-sm pull-right" type="button" data-toggle="collapse" data-target="#fastqc_per_sequence_quality_scores_helptext" aria-expanded="false" aria-controls="fastqc_per_sequence_quality_scores_helptext">
                                                <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                                Help
                                            </button>


                                            <div class="mqc-section-description">
                                                <p>The number of reads with average quality scores. Shows if a subset of reads has poor quality.</p>
                                            </div>


                                            <div class="collapse mqc-section-helptext " id="fastqc_per_sequence_quality_scores_helptext">
                                                <div class="well">
                                                    <p>From the <a href="http://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help/3%20Analysis%20Modules/3%20Per%20Sequence%20Quality%20Scores.html">FastQC help</a>:</p>
                                                    <p>
                                                        <em>The per sequence quality score report allows you to see if a subset of your
                                                            sequences have universally low quality values. It is often the case that a
                                                            subset of sequences will have universally poor quality, however these should
                                                            represent only a small percentage of the total sequences.</em>
                                                    </p>
                                                </div>
                                            </div>

                                            <div class="mqc-section-plot">
                                                <div class="mqc_hcplot_plotgroup">
                                                    <div class="hc-plot-wrapper">
                                                        <div id="fastqc_per_sequence_quality_scores_plot" class="hc-plot not_rendered hc-line-plot"><small>loading..</small></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <hr>
                                        </div>
                                    </div>



                                    <div class="tab-pane " id="tab6" aria-labelledby="base-tab6">
                                        <div class="mqc-section mqc-section-fastqc">
                                            <div class="mqc-section-description">
                                                <p>
                                                    The average GC content of reads. Normal random library typically have a
                                                    roughly normal distribution of GC content.
                                                </p>
                                            </div>
                                            <div class="collapse mqc-section-helptext " id="fastqc_per_sequence_gc_content_helptext">
                                                <div class="well">
                                                    <p>From the <a href="http://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help/3%20Analysis%20Modules/5%20Per%20Sequence%20GC%20Content.html">FastQC help</a>:</p>
                                                    <p>
                                                        <em>This module measures the GC content across the whole length of each sequence
                                                    in a file and compares it to a modelled normal distribution of GC content.</em>
                                                    </p>
                                                    <p>
                                                        <em>In a normal random library you would expect to see a roughly normal distribution
                                                    of GC content where the central peak corresponds to the overall GC content of
                                                    the underlying genome. Since we don't know the the GC content of the genome the
                                                    modal GC content is calculated from the observed data and used to build a
                                                    reference distribution.</em>
                                                    </p>
                                                    <p>
                                                        <em>An unusually shaped distribution could indicate a contaminated library or
                                                    some other kinds of biased subset. A normal distribution which is shifted
                                                    indicates some systematic bias which is independent of base position. If there
                                                    is a systematic bias which creates a shifted normal distribution then this won't
                                                    be flagged as an error by the module since it doesn't know what your genome's
                                                    GC content should be.</em>
                                                    </p>
                                                </div>
                                            </div>

                                            <div class="mqc-section-plot">
                                                <div class="mqc_hcplot_plotgroup">
                                                    <div class="btn-group hc_switch_group">
                                                        <button class="btn btn-default btn-sm active" data-action="set_data" data-ylab="Percentage" data-newdata="0" data-target="fastqc_per_sequence_gc_content_plot">Percentages</button>
                                                        <button class="btn btn-default btn-sm " data-action="set_data" data-ylab="Count" data-newdata="1" data-target="fastqc_per_sequence_gc_content_plot">Counts</button>
                                                    </div>

                                                    <div class="hc-plot-wrapper">
                                                        <div id="fastqc_per_sequence_gc_content_plot" class="hc-plot not_rendered hc-line-plot"><small>loading..</small></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <hr>
                                        </div>
                                    </div>
                                    <div class="tab-pane " id="tab7" aria-labelledby="base-tab7">
                                        <div class="mqc-section mqc-section-fastqc">

                                            <div class="mqc-section-description">
                                                <p>The percentage of base calls at each position for which an <code>N</code> was called.</p>
                                            </div>


                                            <div class="collapse mqc-section-helptext " id="fastqc_per_base_n_content_helptext">
                                                <div class="well">
                                                    <p>From the <a href="http://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help/3%20Analysis%20Modules/6%20Per%20Base%20N%20Content.html">FastQC help</a>:</p>
                                                    <p>
                                                        <em>If a sequencer is unable to make a base call with sufficient confidence then it will
                                                        normally substitute an <code>N</code> rather than a conventional base call. This graph shows the
                                                        percentage of base calls at each position for which an <code>N</code> was called.</em>
                                                    </p>
                                                    <p>
                                                        <em>It's not unusual to see a very low proportion of Ns appearing in a sequence, especially
                                                    nearer the end of a sequence. However, if this proportion rises above a few percent
                                                    it suggests that the analysis pipeline was unable to interpret the data well enough to
                                                    make valid base calls.</em>
                                                    </p>
                                                </div>
                                            </div>

                                            <div class="mqc-section-plot">
                                                <div class="mqc_hcplot_plotgroup">
                                                    <div class="hc-plot-wrapper">
                                                        <div id="fastqc_per_base_n_content_plot" class="hc-plot not_rendered hc-line-plot"><small>loading..</small></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <hr>
                                        </div>
                                    </div>
                                    <div class="tab-pane " id="tab8" aria-labelledby="base-tab8">
                                        <div class="mqc-section mqc-section-fastqc">
                                            <div class="mqc-section-description">
                                                <div class="alert alert-info">All samples have sequences of a single length (100bp).</div>
                                            </div>


                                            <div class="mqc-section-plot"></div>

                                            <hr>
                                        </div>
                                        <div class="mqc-section mqc-section-fastqc">

                                            <h3 id="fastqc_sequence_duplication_levels">Sequence Duplication Levels
                
                  <button class="btn btn-default btn-sm pull-right" type="button" data-toggle="collapse" data-target="#fastqc_sequence_duplication_levels_helptext" aria-expanded="false" aria-controls="fastqc_sequence_duplication_levels_helptext">
                      <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                      Help
                  </button>

                                            </h3>

                                            <div class="mqc-section-description">
                                                <p>The relative level of duplication found for every sequence.</p>
                                            </div>


                                            <div class="collapse mqc-section-helptext " id="fastqc_sequence_duplication_levels_helptext">
                                                <div class="well">
                                                    <p>From the <a href="http://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help/3%20Analysis%20Modules/8%20Duplicate%20Sequences.html">FastQC Help</a>:</p>
                                                    <p>
                                                        <em>In a diverse library most sequences will occur only once in the final set.
A low level of duplication may indicate a very high level of coverage of the
target sequence, but a high level of duplication is more likely to indicate
some kind of enrichment bias (eg PCR over amplification). This graph shows
the degree of duplication for every sequence in a library: the relative
number of sequences with different degrees of duplication.</em>
                                                    </p>
                                                    <p>
                                                        <em>Only sequences which first appear in the first 100,000 sequences
in each file are analysed. This should be enough to get a good impression
for the duplication levels in the whole file. Each sequence is tracked to
the end of the file to give a representative count of the overall duplication level.</em>
                                                    </p>
                                                    <p>
                                                        <em>The duplication detection requires an exact sequence match over the whole length of
the sequence. Any reads over 75bp in length are truncated to 50bp for this analysis.</em>
                                                    </p>
                                                    <p>
                                                        <em>In a properly diverse library most sequences should fall into the far left of the
plot in both the red and blue lines. A general level of enrichment, indicating broad
oversequencing in the library will tend to flatten the lines, lowering the low end
and generally raising other categories. More specific enrichments of subsets, or
the presence of low complexity contaminants will tend to produce spikes towards the
right of the plot.</em>
                                                    </p>
                                                </div>
                                            </div>

                                            <div class="mqc-section-plot">
                                                <div class="mqc_hcplot_plotgroup">
                                                    <div class="hc-plot-wrapper">
                                                        <div id="fastqc_sequence_duplication_levels_plot" class="hc-plot not_rendered hc-line-plot"><small>loading..</small></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <hr>
                                        </div>

                                    </div>
                                    <div class="tab-pane " id="tab9" aria-labelledby="base-tab9">

                                        <div class="mqc-section mqc-section-fastqc">


                                            <button class="btn btn-default btn-sm pull-right" type="button" data-toggle="collapse" data-target="#fastqc_overrepresented_sequences_helptext" aria-expanded="false" aria-controls="fastqc_overrepresented_sequences_helptext">
                                                <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                                Help
                                            </button>

                                            <div class="mqc-section-description">
                                                <p>The total amount of overrepresented sequences found in each library.</p>
                                            </div>


                                            <div class="collapse mqc-section-helptext " id="fastqc_overrepresented_sequences_helptext">
                                                <div class="well">
                                                    <p>
                                                        FastQC calculates and lists overrepresented sequences in FastQ files. It would not be
possible to show this for all samples in a MultiQC report, so instead this plot shows
the <em>number of sequences</em> categorized as over represented.
                                                    </p>
                                                    <p>
                                                        Sometimes, a single sequence  may account for a large number of reads in a dataset.
To show this, the bars are split into two: the first shows the overrepresented reads
that come from the single most common sequence. The second shows the total count
from all remaining overrepresented sequences.
                                                    </p>
                                                    <p>From the <a href="http://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help/3%20Analysis%20Modules/9%20Overrepresented%20Sequences.html">FastQC Help</a>:</p>
                                                    <p>
                                                        <em>A normal high-throughput library will contain a diverse set of sequences, with no
individual sequence making up a tiny fraction of the whole. Finding that a single
sequence is very overrepresented in the set either means that it is highly biologically
significant, or indicates that the library is contaminated, or not as diverse as you expected.</em>
                                                    </p>
                                                    <p>
                                                        <em>FastQC lists all of the sequences which make up more than 0.1% of the total.
To conserve memory only sequences which appear in the first 100,000 sequences are tracked
to the end of the file. It is therefore possible that a sequence which is overrepresented
but doesn't appear at the start of the file for some reason could be missed by this module.</em>
                                                    </p>
                                                </div>
                                            </div>

                                            <div class="mqc-section-plot">
                                                <div class="alert alert-info">1 samples had less than 1% of reads made up of overrepresented sequences</div>
                                            </div>

                                            <hr>
                                        </div>

                                        <div class="mqc-section mqc-section-fastqc">

                                            <h3 id="fastqc_adapter_content">Adapter Content
                
                  <button class="btn btn-default btn-sm pull-right" type="button" data-toggle="collapse" data-target="#fastqc_adapter_content_helptext" aria-expanded="false" aria-controls="fastqc_adapter_content_helptext">
                      <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                      Help
                  </button>

                                            </h3>

                                            <div class="mqc-section-description">
                                                <p>
                                                    The cumulative percentage count of the proportion of your
            library which has seen each of the adapter sequences at each position.
                                                </p>
                                            </div>


                                            <div class="collapse mqc-section-helptext " id="fastqc_adapter_content_helptext">
                                                <div class="well">
                                                    <p>Note that only samples with &ge; 0.1% adapter contamination are shown.</p>
                                                    <p>
                                                        There may be several lines per sample, as one is shown for each adapter
detected in the file.
                                                    </p>
                                                    <p>From the <a href="http://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help/3%20Analysis%20Modules/10%20Adapter%20Content.html">FastQC Help</a>:</p>
                                                    <p>
                                                        <em>The plot shows a cumulative percentage count of the proportion
                                                        of your library which has seen each of the adapter sequences at each position.
                                                        Once a sequence has been seen in a read it is counted as being present
                                                        right through to the end of the read so the percentages you see will only
                                                        increase as the read length goes on.</em>
                                                    </p>
                                                </div>
                                            </div>

                                            <div class="mqc-section-plot">
                                                <div class="mqc_hcplot_plotgroup">
                                                    <div class="hc-plot-wrapper">
                                                        <div id="fastqc_adapter_content_plot" class="hc-plot not_rendered hc-line-plot"><small>loading..</small></div>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>

                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
    </div>

    <div role="tabpanel" class="tab-pane " id="mtab2" aria-expanded="true" aria-labelledby="menu-tab2" style="height: 700px">

        <section id="basic-tabs-components-bam">

            <div class="row match-height">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-body">
                                <ul class="nav nav-tabs nav-underline no-hover-bg">
                                    <li class="nav-item">
                                        <a class="nav-link " id="bam-base-tab1" data-toggle="tab" aria-controls="bam-tab1" href="#bam-tab1" aria-expanded="false" style="font-size: smaller">Coverage histogram</a>
                                    </li>
                                    <li class="nav-item" onclick="showtabContent('bam-tab2');">
                                        <a class="nav-link" id="bam-base-tab2" data-toggle="tab" aria-controls="bam-tab2" href="#bam-tab2" aria-expanded="false" style="font-size: smaller">Cumulative genome coverage</a>
                                    </li>
                                    <li class="nav-item" onclick="showtabContent('bam-tab3');">
                                        <a class="nav-link" id="bam-base-tab3" data-toggle="tab" aria-controls="bam-tab3" href="#bam-tab3" aria-expanded="false" style="font-size: smaller">Insert size histogram</a>
                                    </li>
                                    <li class="nav-item" onclick="showtabContent('bam-tab4');">
                                        <a class="nav-link" id="bam-base-tab4" data-toggle="tab" aria-controls="bam-tab4" href="#bam-tab4" aria-expanded="false" style="font-size: smaller">GC content distribution</a>
                                    </li>
                                    <li class="nav-item" onclick="showtabContent('bam-tab5');">
                                        <a class="nav-link" id="bam-base-tab5" data-toggle="tab" aria-controls="bam-tab5" href="#bam-tab5" aria-expanded="false" style="font-size: smaller">Picard</a>
                                    </li>

                                </ul>
                                <div class="tab-content px-1 pt-5">
                                    <div role="tabpanel" class="tab-pane active" id="bam-tab1" aria-expanded="true" aria-labelledby="bam-base-tab1" style="height: 700px">
                                        <div id="mqc-module-section-qualimap" class="mqc-module-section">

                                            <div class="mqc-section mqc-section-qualimap">
                                                <h3 id="qualimap-coverage-histogram">Coverage histogram
                                               
                                                    <button class="btn btn-default btn-sm pull-right" type="button" data-toggle="collapse" data-target="#qualimap-coverage-histogram_helptext" aria-expanded="false" aria-controls="qualimap-coverage-histogram_helptext">
                                                        <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                                        Help
                                               
                                                    </button>
                                                </h3>

                                                <div class="mqc-section-description">
                                                    <p>Distribution of the number of locations in the reference genome with a given depth of coverage.</p>
                                                </div>

                                                <div class="collapse mqc-section-helptext " id="qualimap-coverage-histogram_helptext">
                                                    <div class="well">
                                                        <p>
                                                            For a set of DNA or RNA reads mapped to a reference sequence, such as a genome
or transcriptome, the depth of coverage at a given base position is the number
of high-quality reads that map to the reference at that position
(<a href="https://doi.org/10.1038/nrg3642" target="_blank">Sims et al. 2014</a>).
                                                        </p>
                                                        <p>
                                                            QualiMap groups the bases of a reference sequence by their depth of coverage
(<em>0&#215;, 1&#215;, &#8230;, N&#215;</em>), then plots the number of bases of the
reference (y-axis) at each level of coverage depth (x-axis). This plot shows
the frequency of coverage depths relative to the reference sequence for each
read dataset, which provides an indirect measure of the level and variation of
coverage depth in the corresponding sequenced sample.
                                                        </p>
                                                        <p>
                                                            If reads are randomly distributed across the reference sequence, this plot
should resemble a Poisson distribution (<a href="https://doi.org/10.1016/0888-7543(88)90007-9"
    target="_blank">Lander &amp; Waterman 1988</a>), with a peak indicating approximate
depth of coverage, and more uniform coverage depth being reflected in a narrower
spread. The optimal level of coverage depth depends on the aims of the
experiment, though it should at minimum be sufficiently high to adequately
address the biological question; greater uniformity of coverage is generally
desirable, because it increases breadth of coverage for a given depth of
coverage, allowing equivalent results to be achieved at a lower sequencing depth
(<a href="https://doi.org/10.1002/gepi.20575" target="_blank">Sampson
et al. 2011</a>; <a href="https://doi.org/10.1038/nrg3642" target="_blank">Sims
et al. 2014</a>). However, it is difficult to achieve uniform coverage
depth in practice, due to biases introduced during sample preparation
(<a href="https://doi.org/10.1016/j.yexcr.2014.01.008" target="_blank">van
Dijk et al. 2014</a>), sequencing (<a href="https://doi.org/10.1186/gb-2013-14-5-r51"
    target="_blank">Ross et al. 2013</a>) and read mapping
(<a href="https://doi.org/10.1038/nrg3642" target="_blank">Sims et al. 2014</a>).
                                                        </p>
                                                        <p>
                                                            This plot may include a small peak for regions of the reference sequence with
zero depth of coverage. Such regions may be absent from the given sample (due
to a deletion or structural rearrangement), present in the sample but not
successfully sequenced (due to bias in sequencing or preparation), or sequenced
but not successfully mapped to the reference (due to the choice of mapping
algorithm, the presence of repeat sequences, or mismatches caused by variants
or sequencing errors). Related factors cause most datasets to contain some
unmapped reads (<a href="https://doi.org/10.1038/nrg3642" target="_blank">Sims
et al. 2014</a>).
                                                        </p>
                                                    </div>
                                                </div>

                                                <div class="mqc-section-plot">
                                                    <div class="mqc_hcplot_plotgroup">
                                                        <div class="hc-plot-wrapper">
                                                            <div id="qualimap_coverage_histogram" class="hc-plot not_rendered hc-line-plot"><small>loading..</small></div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <hr>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="tab-pane " id="bam-tab2" aria-labelledby="bam-base-tab2">
                                        <div class="mqc-section mqc-section-qualimap">
                                            <h3 id="qualimap-cumulative-genome-fraction-coverage">Cumulative genome coverage

                                                <button class="btn btn-default btn-sm pull-right" type="button" data-toggle="collapse" data-target="#qualimap-cumulative-genome-fraction-coverage_helptext" aria-expanded="false" aria-controls="qualimap-cumulative-genome-fraction-coverage_helptext">
                                                    <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                                    Help
                 
                                                </button>

                                            </h3>

                                            <div class="mqc-section-description">
                                                <p>Percentage of the reference genome with at least the given depth of coverage.</p>
                                            </div>


                                            <div class="collapse mqc-section-helptext " id="qualimap-cumulative-genome-fraction-coverage_helptext">
                                                <div class="well">
                                                    <p>
                                                        For a set of DNA or RNA reads mapped to a reference sequence, such as a genome
or transcriptome, the depth of coverage at a given base position is the number
of high-quality reads that map to the reference at that position, while the
breadth of coverage is the fraction of the reference sequence to which reads
have been mapped with at least a given depth of coverage
(<a href="https://doi.org/10.1038/nrg3642" target="_blank">Sims et al. 2014</a>).
                                                    </p>
                                                    <p>
                                                        Defining coverage breadth in terms of coverage depth is useful, because
sequencing experiments typically require a specific minimum depth of coverage
over the region of interest (<a href="https://doi.org/10.1038/nrg3642"
    target="_blank">Sims et al. 2014</a>), so the extent of the reference sequence
that is amenable to analysis is constrained to lie within regions that have
sufficient depth. With inadequate sequencing breadth, it can be difficult to
distinguish the absence of a biological feature (such as a gene) from a lack
of data (<a href="https://doi.org/10.1101/gr.7050807" target="_blank">Green 2007</a>).
                                                    </p>
                                                    <p>
                                                        For increasing coverage depths (<em>1&#215;, 2&#215;, &#8230;, N&#215;</em>),
QualiMap calculates coverage breadth as the percentage of the reference
sequence that is covered by at least that number of reads, then plots
coverage breadth (y-axis) against coverage depth (x-axis). This plot
shows the relationship between sequencing depth and breadth for each read
dataset, which can be used to gauge, for example, the likely effect of a
minimum depth filter on the fraction of a genome available for analysis.
                                                    </p>
                                                </div>
                                            </div>

                                            <div class="mqc-section-plot">
                                                <div class="mqc_hcplot_plotgroup">
                                                    <div class="hc-plot-wrapper">
                                                        <div id="qualimap_genome_fraction" class="hc-plot not_rendered hc-line-plot"><small>loading..</small></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <hr>
                                        </div>
                                    </div>
                                    <div class="tab-pane " id="bam-tab3" aria-labelledby="bam-base-tab3">
                                        <div class="mqc-section mqc-section-qualimap">

                                            <h3 id="qualimap-insert-size-histogram">Insert size histogram
                
                 

                                                <button class="btn btn-default btn-sm pull-right" type="button" data-toggle="collapse" data-target="#qualimap-insert-size-histogram_helptext" aria-expanded="false" aria-controls="qualimap-insert-size-histogram_helptext">
                                                    <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                                    Help
                 
                                                </button>

                                            </h3>

                                            <div class="mqc-section-description">
                                                <p>Distribution of estimated insert sizes of mapped reads.</p>
                                            </div>


                                            <div class="collapse mqc-section-helptext " id="qualimap-insert-size-histogram_helptext">
                                                <div class="well">
                                                    <p>
                                                        To overcome limitations in the length of DNA or RNA sequencing reads,
many sequencing instruments can produce two or more shorter reads from
one longer fragment in which the relative position of reads is
approximately known, such as paired-end or mate-pair reads
(<a href="https://doi.org/10.1146/annurev-anchem-062012-092628"
    target="_blank">Mardis 2013</a>). Such techniques can extend the reach
of sequencing technology, allowing for more accurate placement of reads
(<a href="https://doi.org/10.1146/annurev-genom-090413-025358"
    target="_blank">Reinert et al. 2015</a>) and better resolution of repeat
regions (<a href="https://doi.org/10.1146/annurev-genom-090413-025358"
    target="_blank">Reinert et al. 2015</a>), as well as detection of
structural variation (<a href="https://doi.org/10.1038/nrg2958"
    target="_blank">Alkan et al. 2011</a>) and chimeric transcripts
(<a href="https://doi.org/10.1073/pnas.0904720106"
    target="_blank">Maher et al. 2009</a>).
                                                    </p>
                                                    <p>
                                                        All these methods assume that the approximate size of an insert is known.
(Insert size can be defined as the length in bases of a sequenced DNA or
RNA fragment, excluding technical sequences such as adapters, which are
typically removed before alignment.) This plot allows for that assumption
to be assessed. With the set of mapped fragments for a given sample, QualiMap
groups the fragments by insert size, then plots the frequency of mapped
fragments (y-axis) over a range of insert sizes (x-axis). In an ideal case,
the distribution of fragment sizes for a sequencing library would culminate
in a single peak indicating average insert size, with a narrow spread
indicating highly consistent fragment lengths.
                                                    </p>
                                                    <p>
                                                        QualiMap calculates insert sizes as follows: for each fragment in which
every read mapped successfully to the same reference sequence, it
extracts the insert size from the <code>TLEN</code> field of the leftmost read
(see the <a href="http://qualimap.bioinfo.cipf.es/doc_html/index.html"
    target="_blank">Qualimap 2 documentation</a>), where the <code>TLEN</code> (or
'observed Template LENgth') field contains 'the number of bases from the
leftmost mapped base to the rightmost mapped base'
(<a href="https://samtools.github.io/hts-specs/" target="_blank">SAM
format specification</a>). Note that because it is defined in terms of
alignment to a reference sequence, the value of the <code>TLEN</code> field may
differ from the insert size due to factors such as alignment clipping,
alignment errors, or structural variation or splicing in a gap between
reads from the same fragment.
                                                    </p>
                                                </div>
                                            </div>

                                            <div class="mqc-section-plot">
                                                <div class="mqc_hcplot_plotgroup">
                                                    <div class="hc-plot-wrapper">
                                                        <div id="qualimap_insert_size" class="hc-plot not_rendered hc-line-plot"><small>loading..</small></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <hr>
                                        </div>
                                    </div>
                                    <div class="tab-pane " id="bam-tab4" aria-labelledby="bam-base-tab4">
                                        <div class="mqc-section mqc-section-qualimap">

                                            <h3 id="qualimap-gc-distribution">GC content distribution
                
                 

                                                <button class="btn btn-default btn-sm pull-right" type="button" data-toggle="collapse" data-target="#qualimap-gc-distribution_helptext" aria-expanded="false" aria-controls="qualimap-gc-distribution_helptext">
                                                    <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                                    Help
                 
                                                </button>

                                            </h3>

                                            <div class="mqc-section-description">
                                                <p>The solid line represents the distribution of GC content of mapped reads for the sample.</p>
                                            </div>


                                            <div class="collapse mqc-section-helptext " id="qualimap-gc-distribution_helptext">
                                                <div class="well">
                                                    <p>
                                                        GC bias is the difference between the guanine-cytosine content
(GC-content) of a set of sequencing reads and the GC-content of the DNA
or RNA in the original sample. It is a well-known issue with sequencing
systems, and may be introduced by PCR amplification, among other factors
(<a href="https://doi.org/10.1093/nar/gks001" target="_blank">Benjamini
&amp; Speed 2012</a>; <a href="https://doi.org/10.1186/gb-2013-14-5-r51"
    target="_blank">Ross et al. 2013</a>).
                                                    </p>
                                                    <p>
                                                        QualiMap calculates the GC-content of individual mapped reads, then
groups those reads by their GC-content (<em>1%, 2%, &#8230;, 100%</em>), and
plots the frequency of mapped reads (y-axis) at each level of GC-content
(x-axis). This plot shows the GC-content distribution of mapped reads
for each read dataset, which should ideally resemble that of the
original sample. It can be useful to display the GC-content distribution
of an appropriate reference sequence for comparison, and QualiMap has an
option to do this (see the <a href="http://qualimap.bioinfo.cipf.es/doc_html/index.html"
    target="_blank">Qualimap 2 documentation</a>).
                                                    </p>
                                                </div>
                                            </div>

                                            <div class="mqc-section-plot">
                                                <div class="mqc_hcplot_plotgroup">
                                                    <div class="hc-plot-wrapper">
                                                        <div id="qualimap_gc_content" class="hc-plot not_rendered hc-line-plot"><small>loading..</small></div>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                    <div class="tab-pane " id="bam-tab5" aria-labelledby="bam-base-tab5">
                                        <div id="mqc-module-section-picard" class="mqc-module-section">
                                            <h2 id="picard">Picard</h2>
                                            <p>Picard is a set of Java command line tools for manipulating high-throughput sequencing data.</p>

                                            <div class="mqc-section mqc-section-picard">

                                                <h3 id="picard-markduplicates">Mark Duplicates </h3>

                                                <div class="mqc-section-plot">
                                                    <div class="mqc_hcplot_plotgroup">
                                                        <div class="btn-group hc_switch_group">
                                                            <button class="btn btn-default btn-sm " data-action="set_numbers" data-target="picard_deduplication" data-ylab="Number of Reads">Number of Reads</button>
                                                            <button class="btn btn-default btn-sm active" data-action="set_percent" data-target="picard_deduplication" data-ylab="Percentages">Percentages</button>
                                                        </div>
                                                        <div class="hc-plot-wrapper">
                                                            <div id="picard_deduplication" class="hc-plot not_rendered hc-bar-plot"><small>loading..</small></div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <div role="tabpanel" class="tab-pane " id="mtab3" aria-expanded="true" aria-labelledby="menu-tab3" style="height: 700px">

        <section id="basic-tabs-components-vcf">

            <div class="row match-height">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-body">
                                <ul class="nav nav-tabs nav-underline no-hover-bg">
                                    <li class="nav-item">
                                        <a class="nav-link " id="vcf-base-tab1" data-toggle="tab" aria-controls="vcf-tab1" href="#vcf-tab1" aria-expanded="false" style="font-size: smaller">Variant Substitution Types</a>
                                    </li>
                                    <li class="nav-item" onclick="showtabContent('vcf-tab2');">
                                        <a class="nav-link" id="vcf-base-tab2" data-toggle="tab" aria-controls="vcf-tab2" href="#vcf-tab2" aria-expanded="false" style="font-size: smaller">Variant Quality</a>
                                    </li>
                                    <li class="nav-item" onclick="showtabContent('vcf-tab3');">
                                        <a class="nav-link" id="vcf-base-tab3" data-toggle="tab" aria-controls="vcf-tab3" href="#vcf-tab3" aria-expanded="false" style="font-size: smaller">Indel Distribution</a>
                                    </li>
                                    <li class="nav-item" onclick="showtabContent('vcf-tab4');">
                                        <a class="nav-link" id="vcf-base-tab4" data-toggle="tab" aria-controls="vcf-tab4" href="#vcf-tab4" aria-expanded="false" style="font-size: smaller">Variant depths</a>
                                    </li>
                                    <li class="nav-item" onclick="showtabContent('vcf-tab5');">
                                        <a class="nav-link" id="vcf-base-tab5" data-toggle="tab" aria-controls="vcf-tab5" href="#vcf-tab5" aria-expanded="false" style="font-size: smaller">Observed Quality Scores</a>
                                    </li>

                                </ul>
                                <div class="tab-content px-1 pt-5">
                                    <div role="tabpanel" class="tab-pane active" id="vcf-tab1" aria-expanded="true" aria-labelledby="vcf-base-tab1" style="height: 700px">
                                        <div class="mqc-section mqc-section-bcftools">

                                            <h3 id="bcftools-stats">Variant Substitution Types</h3>

                                            <div class="mqc-section-plot">
                                                <div class="mqc_hcplot_plotgroup">
                                                    <div class="btn-group hc_switch_group">
                                                        <button class="btn btn-default btn-sm active" data-action="set_numbers" data-target="bcftools-stats-subtypes" data-ylab="Number of Substitutions">Number of Substitutions</button>
                                                        <button class="btn btn-default btn-sm " data-action="set_percent" data-target="bcftools-stats-subtypes" data-ylab="Percentages">Percentages</button>
                                                    </div>
                                                    <div class="hc-plot-wrapper">
                                                        <div id="bcftools-stats-subtypes" class="hc-plot not_rendered hc-bar-plot"><small>loading..</small></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <hr>
                                        </div>
                                    </div>
                                    <div class="tab-pane " id="vcf-tab2" aria-labelledby="vcf-base-tab2">
                                        <div class="mqc-section mqc-section-bcftools">

                                            <h3 id="bcftools-stats_variant_quality_plot">Variant Quality </h3>

                                            <div class="mqc-section-plot">
                                                <div class="mqc_hcplot_plotgroup">
                                                    <div class="btn-group hc_switch_group">
                                                        <button class="btn btn-default btn-sm active" data-action="set_data" data-ylab="Quality" data-newdata="0" data-target="bcftools_stats_vqc">Count SNP</button>
                                                        <button class="btn btn-default btn-sm " data-action="set_data" data-ylab="Quality" data-newdata="1" data-target="bcftools_stats_vqc">Count Transitions</button>
                                                        <button class="btn btn-default btn-sm " data-action="set_data" data-ylab="Quality" data-newdata="2" data-target="bcftools_stats_vqc">Count Transversions</button>
                                                        <button class="btn btn-default btn-sm " data-action="set_data" data-ylab="Quality" data-newdata="3" data-target="bcftools_stats_vqc">Count Indels</button>
                                                    </div>

                                                    <div class="hc-plot-wrapper">
                                                        <div id="bcftools_stats_vqc" class="hc-plot not_rendered hc-line-plot"><small>loading..</small></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <hr>
                                        </div>
                                    </div>
                                    <div class="tab-pane " id="vcf-tab3" aria-labelledby="vcf-base-tab3">
                                        <div class="mqc-section mqc-section-bcftools">

                                            <h3 id="bcftools-stats_indel_plot">Indel Distribution</h3>


                                            <div class="mqc-section-plot">
                                                <div class="mqc_hcplot_plotgroup">
                                                    <div class="hc-plot-wrapper">
                                                        <div id="bcftools_stats_indel-lengths" class="hc-plot not_rendered hc-line-plot"><small>loading..</small></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <hr>
                                        </div>
                                    </div>
                                    <div class="tab-pane " id="vcf-tab4" aria-labelledby="vcf-base-tab4">
                                        <div class="mqc-section mqc-section-bcftools">

                                            <h3 id="bcftools-stats_depth_plot">Variant depths</h3>
                                            <div class="mqc-section-description">
                                                <p>Read depth support distribution for called variants</p>
                                            </div>

                                            <div class="mqc-section-plot">
                                                <div class="mqc_hcplot_plotgroup">
                                                    <div class="hc-plot-wrapper">
                                                        <div id="bcftools_stats_depth" class="hc-plot not_rendered hc-line-plot"><small>loading..</small></div>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                    <div class="tab-pane " id="vcf-tab5" aria-labelledby="vcf-base-tab5">

                                        <div class="mqc-section mqc-section-gatk">

                                            <h3 id="gatk-base-recalibrator-quality-scores">Observed Quality Scores
                
                  <button class="btn btn-default btn-sm pull-right" type="button" data-toggle="collapse" data-target="#gatk-base-recalibrator-quality-scores_helptext" aria-expanded="false" aria-controls="gatk-base-recalibrator-quality-scores_helptext">
                      <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                      Help
                  </button>

                                            </h3>

                                            <div class="mqc-section-description">
                                                <p>This plot shows the distribution of base quality scores in each sample before and after base quality score recalibration (BQSR). Applying BQSR should broaden the distribution of base quality scores.</p>
                                            </div>


                                            <div class="collapse mqc-section-helptext " id="gatk-base-recalibrator-quality-scores_helptext">
                                                <div class="well">
                                                    <p>For more information see <a href="https://gatkforums.broadinstitute.org/gatk/discussion/44/base-quality-score-recalibration-bqsr">the Broad's description of BQSR</a>.</p>
                                                </div>
                                            </div>

                                            <div class="mqc-section-plot">
                                                <div class="mqc_hcplot_plotgroup">
                                                    <div class="btn-group hc_switch_group">
                                                        <button class="btn btn-default btn-sm active" data-action="set_data" data-ylab="Count" data-newdata="0" data-target="gatk-base-recalibrator-quality-scores-plot">Pre-recalibration Count</button>
                                                        <button class="btn btn-default btn-sm " data-action="set_data" data-ylab="Percent" data-newdata="1" data-target="gatk-base-recalibrator-quality-scores-plot">Pre-recalibration Percent</button>
                                                    </div>

                                                    <div class="hc-plot-wrapper">
                                                        <div id="gatk-base-recalibrator-quality-scores-plot" class="hc-plot not_rendered hc-line-plot"><small>loading..</small></div>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>


                                    </div>
                                    <%--    <div class="mqc-section mqc-section-gatk">

                                            <h3 id="gatk-observed-quality-scores">Observed Quality Scores
                                                <button class="btn btn-default btn-sm pull-right" type="button" data-toggle="collapse" data-target="#gatk-observed-quality-scores_helptext" aria-expanded="false" aria-controls="gatk-observed-quality-scores_helptext">
                                                    <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                                    Help
                                                </button>
                                            </h3>

                                            <div class="mqc-section-description">
                                                <p>This plot shows the distribution of base quality scores in each sample before and after base quality score recalibration (BQSR). Applying BQSR should broaden the distribution of base quality scores.</p>
                                            </div>


                                            <div class="collapse mqc-section-helptext " id="gatk-observed-quality-scores_helptext">
                                                <div class="well">
                                                    <p>For more information see <a href="https://gatkforums.broadinstitute.org/gatk/discussion/44/base-quality-score-recalibration-bqsr">the Broad's description of BQSR</a>.</p>
                                                </div>
                                            </div>

                                            <div class="mqc-section-plot">
                                                <div class="mqc_hcplot_plotgroup">
                                                    <div class="btn-group hc_switch_group">
                                                        <button class="btn btn-default btn-sm active" data-action="set_data" data-ylab="Count" data-newdata="0" data-target="gatk-base-recalibrator-quality-score-vs-number-of-observations">Pre-recalibration Count</button>
                                                        <button class="btn btn-default btn-sm " data-action="set_data" data-ylab="Percent" data-ymax="0.95198763858" data-newdata="1" data-target="gatk-base-recalibrator-quality-score-vs-number-of-observations">Pre-recalibration Percent</button>
                                                    </div>

                                                    <div class="hc-plot-wrapper">
                                                        <div id="gatk-base-recalibrator-quality-score-vs-number-of-observations" class="hc-plot not_rendered hc-line-plot"><small>loading..</small></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>--%>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

</div>

<!-- Include javascript files -->
<script type="text/javascript">/*! jQuery v3.1.1 | (c) jQuery Foundation | jquery.org/license */
    !function (a, b) { "use strict"; "object" == typeof module && "object" == typeof module.exports ? module.exports = a.document ? b(a, !0) : function (a) { if (!a.document) throw new Error("jQuery requires a window with a document"); return b(a) } : b(a) }("undefined" != typeof window ? window : this, function (a, b) {
        "use strict"; var c = [], d = a.document, e = Object.getPrototypeOf, f = c.slice, g = c.concat, h = c.push, i = c.indexOf, j = {}, k = j.toString, l = j.hasOwnProperty, m = l.toString, n = m.call(Object), o = {}; function p(a, b) { b = b || d; var c = b.createElement("script"); c.text = a, b.head.appendChild(c).parentNode.removeChild(c) } var q = "3.1.1", r = function (a, b) { return new r.fn.init(a, b) }, s = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g, t = /^-ms-/, u = /-([a-z])/g, v = function (a, b) { return b.toUpperCase() }; r.fn = r.prototype = { jquery: q, constructor: r, length: 0, toArray: function () { return f.call(this) }, get: function (a) { return null == a ? f.call(this) : a < 0 ? this[a + this.length] : this[a] }, pushStack: function (a) { var b = r.merge(this.constructor(), a); return b.prevObject = this, b }, each: function (a) { return r.each(this, a) }, map: function (a) { return this.pushStack(r.map(this, function (b, c) { return a.call(b, c, b) })) }, slice: function () { return this.pushStack(f.apply(this, arguments)) }, first: function () { return this.eq(0) }, last: function () { return this.eq(-1) }, eq: function (a) { var b = this.length, c = +a + (a < 0 ? b : 0); return this.pushStack(c >= 0 && c < b ? [this[c]] : []) }, end: function () { return this.prevObject || this.constructor() }, push: h, sort: c.sort, splice: c.splice }, r.extend = r.fn.extend = function () { var a, b, c, d, e, f, g = arguments[0] || {}, h = 1, i = arguments.length, j = !1; for ("boolean" == typeof g && (j = g, g = arguments[h] || {}, h++), "object" == typeof g || r.isFunction(g) || (g = {}), h === i && (g = this, h--); h < i; h++)if (null != (a = arguments[h])) for (b in a) c = g[b], d = a[b], g !== d && (j && d && (r.isPlainObject(d) || (e = r.isArray(d))) ? (e ? (e = !1, f = c && r.isArray(c) ? c : []) : f = c && r.isPlainObject(c) ? c : {}, g[b] = r.extend(j, f, d)) : void 0 !== d && (g[b] = d)); return g }, r.extend({ expando: "jQuery" + (q + Math.random()).replace(/\D/g, ""), isReady: !0, error: function (a) { throw new Error(a) }, noop: function () { }, isFunction: function (a) { return "function" === r.type(a) }, isArray: Array.isArray, isWindow: function (a) { return null != a && a === a.window }, isNumeric: function (a) { var b = r.type(a); return ("number" === b || "string" === b) && !isNaN(a - parseFloat(a)) }, isPlainObject: function (a) { var b, c; return !(!a || "[object Object]" !== k.call(a)) && (!(b = e(a)) || (c = l.call(b, "constructor") && b.constructor, "function" == typeof c && m.call(c) === n)) }, isEmptyObject: function (a) { var b; for (b in a) return !1; return !0 }, type: function (a) { return null == a ? a + "" : "object" == typeof a || "function" == typeof a ? j[k.call(a)] || "object" : typeof a }, globalEval: function (a) { p(a) }, camelCase: function (a) { return a.replace(t, "ms-").replace(u, v) }, nodeName: function (a, b) { return a.nodeName && a.nodeName.toLowerCase() === b.toLowerCase() }, each: function (a, b) { var c, d = 0; if (w(a)) { for (c = a.length; d < c; d++)if (b.call(a[d], d, a[d]) === !1) break } else for (d in a) if (b.call(a[d], d, a[d]) === !1) break; return a }, trim: function (a) { return null == a ? "" : (a + "").replace(s, "") }, makeArray: function (a, b) { var c = b || []; return null != a && (w(Object(a)) ? r.merge(c, "string" == typeof a ? [a] : a) : h.call(c, a)), c }, inArray: function (a, b, c) { return null == b ? -1 : i.call(b, a, c) }, merge: function (a, b) { for (var c = +b.length, d = 0, e = a.length; d < c; d++)a[e++] = b[d]; return a.length = e, a }, grep: function (a, b, c) { for (var d, e = [], f = 0, g = a.length, h = !c; f < g; f++)d = !b(a[f], f), d !== h && e.push(a[f]); return e }, map: function (a, b, c) { var d, e, f = 0, h = []; if (w(a)) for (d = a.length; f < d; f++)e = b(a[f], f, c), null != e && h.push(e); else for (f in a) e = b(a[f], f, c), null != e && h.push(e); return g.apply([], h) }, guid: 1, proxy: function (a, b) { var c, d, e; if ("string" == typeof b && (c = a[b], b = a, a = c), r.isFunction(a)) return d = f.call(arguments, 2), e = function () { return a.apply(b || this, d.concat(f.call(arguments))) }, e.guid = a.guid = a.guid || r.guid++, e }, now: Date.now, support: o }), "function" == typeof Symbol && (r.fn[Symbol.iterator] = c[Symbol.iterator]), r.each("Boolean Number String Function Array Date RegExp Object Error Symbol".split(" "), function (a, b) { j["[object " + b + "]"] = b.toLowerCase() }); function w(a) { var b = !!a && "length" in a && a.length, c = r.type(a); return "function" !== c && !r.isWindow(a) && ("array" === c || 0 === b || "number" == typeof b && b > 0 && b - 1 in a) } var x = function (a) { var b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u = "sizzle" + 1 * new Date, v = a.document, w = 0, x = 0, y = ha(), z = ha(), A = ha(), B = function (a, b) { return a === b && (l = !0), 0 }, C = {}.hasOwnProperty, D = [], E = D.pop, F = D.push, G = D.push, H = D.slice, I = function (a, b) { for (var c = 0, d = a.length; c < d; c++)if (a[c] === b) return c; return -1 }, J = "checked|selected|async|autofocus|autoplay|controls|defer|disabled|hidden|ismap|loop|multiple|open|readonly|required|scoped", K = "[\\x20\\t\\r\\n\\f]", L = "(?:\\\\.|[\\w-]|[^\0-\\xa0])+", M = "\\[" + K + "*(" + L + ")(?:" + K + "*([*^$|!~]?=)" + K + "*(?:'((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\"|(" + L + "))|)" + K + "*\\]", N = ":(" + L + ")(?:\\((('((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\")|((?:\\\\.|[^\\\\()[\\]]|" + M + ")*)|.*)\\)|)", O = new RegExp(K + "+", "g"), P = new RegExp("^" + K + "+|((?:^|[^\\\\])(?:\\\\.)*)" + K + "+$", "g"), Q = new RegExp("^" + K + "*," + K + "*"), R = new RegExp("^" + K + "*([>+~]|" + K + ")" + K + "*"), S = new RegExp("=" + K + "*([^\\]'\"]*?)" + K + "*\\]", "g"), T = new RegExp(N), U = new RegExp("^" + L + "$"), V = { ID: new RegExp("^#(" + L + ")"), CLASS: new RegExp("^\\.(" + L + ")"), TAG: new RegExp("^(" + L + "|[*])"), ATTR: new RegExp("^" + M), PSEUDO: new RegExp("^" + N), CHILD: new RegExp("^:(only|first|last|nth|nth-last)-(child|of-type)(?:\\(" + K + "*(even|odd|(([+-]|)(\\d*)n|)" + K + "*(?:([+-]|)" + K + "*(\\d+)|))" + K + "*\\)|)", "i"), bool: new RegExp("^(?:" + J + ")$", "i"), needsContext: new RegExp("^" + K + "*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\\(" + K + "*((?:-\\d)?\\d*)" + K + "*\\)|)(?=[^-]|$)", "i") }, W = /^(?:input|select|textarea|button)$/i, X = /^h\d$/i, Y = /^[^{]+\{\s*\[native \w/, Z = /^(?:#([\w-]+)|(\w+)|\.([\w-]+))$/, $ = /[+~]/, _ = new RegExp("\\\\([\\da-f]{1,6}" + K + "?|(" + K + ")|.)", "ig"), aa = function (a, b, c) { var d = "0x" + b - 65536; return d !== d || c ? b : d < 0 ? String.fromCharCode(d + 65536) : String.fromCharCode(d >> 10 | 55296, 1023 & d | 56320) }, ba = /([\0-\x1f\x7f]|^-?\d)|^-$|[^\0-\x1f\x7f-\uFFFF\w-]/g, ca = function (a, b) { return b ? "\0" === a ? "\ufffd" : a.slice(0, -1) + "\\" + a.charCodeAt(a.length - 1).toString(16) + " " : "\\" + a }, da = function () { m() }, ea = ta(function (a) { return a.disabled === !0 && ("form" in a || "label" in a) }, { dir: "parentNode", next: "legend" }); try { G.apply(D = H.call(v.childNodes), v.childNodes), D[v.childNodes.length].nodeType } catch (fa) { G = { apply: D.length ? function (a, b) { F.apply(a, H.call(b)) } : function (a, b) { var c = a.length, d = 0; while (a[c++] = b[d++]); a.length = c - 1 } } } function ga(a, b, d, e) { var f, h, j, k, l, o, r, s = b && b.ownerDocument, w = b ? b.nodeType : 9; if (d = d || [], "string" != typeof a || !a || 1 !== w && 9 !== w && 11 !== w) return d; if (!e && ((b ? b.ownerDocument || b : v) !== n && m(b), b = b || n, p)) { if (11 !== w && (l = Z.exec(a))) if (f = l[1]) { if (9 === w) { if (!(j = b.getElementById(f))) return d; if (j.id === f) return d.push(j), d } else if (s && (j = s.getElementById(f)) && t(b, j) && j.id === f) return d.push(j), d } else { if (l[2]) return G.apply(d, b.getElementsByTagName(a)), d; if ((f = l[3]) && c.getElementsByClassName && b.getElementsByClassName) return G.apply(d, b.getElementsByClassName(f)), d } if (c.qsa && !A[a + " "] && (!q || !q.test(a))) { if (1 !== w) s = b, r = a; else if ("object" !== b.nodeName.toLowerCase()) { (k = b.getAttribute("id")) ? k = k.replace(ba, ca) : b.setAttribute("id", k = u), o = g(a), h = o.length; while (h--) o[h] = "#" + k + " " + sa(o[h]); r = o.join(","), s = $.test(a) && qa(b.parentNode) || b } if (r) try { return G.apply(d, s.querySelectorAll(r)), d } catch (x) { } finally { k === u && b.removeAttribute("id") } } } return i(a.replace(P, "$1"), b, d, e) } function ha() { var a = []; function b(c, e) { return a.push(c + " ") > d.cacheLength && delete b[a.shift()], b[c + " "] = e } return b } function ia(a) { return a[u] = !0, a } function ja(a) { var b = n.createElement("fieldset"); try { return !!a(b) } catch (c) { return !1 } finally { b.parentNode && b.parentNode.removeChild(b), b = null } } function ka(a, b) { var c = a.split("|"), e = c.length; while (e--) d.attrHandle[c[e]] = b } function la(a, b) { var c = b && a, d = c && 1 === a.nodeType && 1 === b.nodeType && a.sourceIndex - b.sourceIndex; if (d) return d; if (c) while (c = c.nextSibling) if (c === b) return -1; return a ? 1 : -1 } function ma(a) { return function (b) { var c = b.nodeName.toLowerCase(); return "input" === c && b.type === a } } function na(a) { return function (b) { var c = b.nodeName.toLowerCase(); return ("input" === c || "button" === c) && b.type === a } } function oa(a) { return function (b) { return "form" in b ? b.parentNode && b.disabled === !1 ? "label" in b ? "label" in b.parentNode ? b.parentNode.disabled === a : b.disabled === a : b.isDisabled === a || b.isDisabled !== !a && ea(b) === a : b.disabled === a : "label" in b && b.disabled === a } } function pa(a) { return ia(function (b) { return b = +b, ia(function (c, d) { var e, f = a([], c.length, b), g = f.length; while (g--) c[e = f[g]] && (c[e] = !(d[e] = c[e])) }) }) } function qa(a) { return a && "undefined" != typeof a.getElementsByTagName && a } c = ga.support = {}, f = ga.isXML = function (a) { var b = a && (a.ownerDocument || a).documentElement; return !!b && "HTML" !== b.nodeName }, m = ga.setDocument = function (a) { var b, e, g = a ? a.ownerDocument || a : v; return g !== n && 9 === g.nodeType && g.documentElement ? (n = g, o = n.documentElement, p = !f(n), v !== n && (e = n.defaultView) && e.top !== e && (e.addEventListener ? e.addEventListener("unload", da, !1) : e.attachEvent && e.attachEvent("onunload", da)), c.attributes = ja(function (a) { return a.className = "i", !a.getAttribute("className") }), c.getElementsByTagName = ja(function (a) { return a.appendChild(n.createComment("")), !a.getElementsByTagName("*").length }), c.getElementsByClassName = Y.test(n.getElementsByClassName), c.getById = ja(function (a) { return o.appendChild(a).id = u, !n.getElementsByName || !n.getElementsByName(u).length }), c.getById ? (d.filter.ID = function (a) { var b = a.replace(_, aa); return function (a) { return a.getAttribute("id") === b } }, d.find.ID = function (a, b) { if ("undefined" != typeof b.getElementById && p) { var c = b.getElementById(a); return c ? [c] : [] } }) : (d.filter.ID = function (a) { var b = a.replace(_, aa); return function (a) { var c = "undefined" != typeof a.getAttributeNode && a.getAttributeNode("id"); return c && c.value === b } }, d.find.ID = function (a, b) { if ("undefined" != typeof b.getElementById && p) { var c, d, e, f = b.getElementById(a); if (f) { if (c = f.getAttributeNode("id"), c && c.value === a) return [f]; e = b.getElementsByName(a), d = 0; while (f = e[d++]) if (c = f.getAttributeNode("id"), c && c.value === a) return [f] } return [] } }), d.find.TAG = c.getElementsByTagName ? function (a, b) { return "undefined" != typeof b.getElementsByTagName ? b.getElementsByTagName(a) : c.qsa ? b.querySelectorAll(a) : void 0 } : function (a, b) { var c, d = [], e = 0, f = b.getElementsByTagName(a); if ("*" === a) { while (c = f[e++]) 1 === c.nodeType && d.push(c); return d } return f }, d.find.CLASS = c.getElementsByClassName && function (a, b) { if ("undefined" != typeof b.getElementsByClassName && p) return b.getElementsByClassName(a) }, r = [], q = [], (c.qsa = Y.test(n.querySelectorAll)) && (ja(function (a) { o.appendChild(a).innerHTML = "<a id='" + u + "'></a><select id='" + u + "-\r\\' msallowcapture=''><option selected=''></option></select>", a.querySelectorAll("[msallowcapture^='']").length && q.push("[*^$]=" + K + "*(?:''|\"\")"), a.querySelectorAll("[selected]").length || q.push("\\[" + K + "*(?:value|" + J + ")"), a.querySelectorAll("[id~=" + u + "-]").length || q.push("~="), a.querySelectorAll(":checked").length || q.push(":checked"), a.querySelectorAll("a#" + u + "+*").length || q.push(".#.+[+~]") }), ja(function (a) { a.innerHTML = "<a href='' disabled='disabled'></a><select disabled='disabled'><option/></select>"; var b = n.createElement("input"); b.setAttribute("type", "hidden"), a.appendChild(b).setAttribute("name", "D"), a.querySelectorAll("[name=d]").length && q.push("name" + K + "*[*^$|!~]?="), 2 !== a.querySelectorAll(":enabled").length && q.push(":enabled", ":disabled"), o.appendChild(a).disabled = !0, 2 !== a.querySelectorAll(":disabled").length && q.push(":enabled", ":disabled"), a.querySelectorAll("*,:x"), q.push(",.*:") })), (c.matchesSelector = Y.test(s = o.matches || o.webkitMatchesSelector || o.mozMatchesSelector || o.oMatchesSelector || o.msMatchesSelector)) && ja(function (a) { c.disconnectedMatch = s.call(a, "*"), s.call(a, "[s!='']:x"), r.push("!=", N) }), q = q.length && new RegExp(q.join("|")), r = r.length && new RegExp(r.join("|")), b = Y.test(o.compareDocumentPosition), t = b || Y.test(o.contains) ? function (a, b) { var c = 9 === a.nodeType ? a.documentElement : a, d = b && b.parentNode; return a === d || !(!d || 1 !== d.nodeType || !(c.contains ? c.contains(d) : a.compareDocumentPosition && 16 & a.compareDocumentPosition(d))) } : function (a, b) { if (b) while (b = b.parentNode) if (b === a) return !0; return !1 }, B = b ? function (a, b) { if (a === b) return l = !0, 0; var d = !a.compareDocumentPosition - !b.compareDocumentPosition; return d ? d : (d = (a.ownerDocument || a) === (b.ownerDocument || b) ? a.compareDocumentPosition(b) : 1, 1 & d || !c.sortDetached && b.compareDocumentPosition(a) === d ? a === n || a.ownerDocument === v && t(v, a) ? -1 : b === n || b.ownerDocument === v && t(v, b) ? 1 : k ? I(k, a) - I(k, b) : 0 : 4 & d ? -1 : 1) } : function (a, b) { if (a === b) return l = !0, 0; var c, d = 0, e = a.parentNode, f = b.parentNode, g = [a], h = [b]; if (!e || !f) return a === n ? -1 : b === n ? 1 : e ? -1 : f ? 1 : k ? I(k, a) - I(k, b) : 0; if (e === f) return la(a, b); c = a; while (c = c.parentNode) g.unshift(c); c = b; while (c = c.parentNode) h.unshift(c); while (g[d] === h[d]) d++; return d ? la(g[d], h[d]) : g[d] === v ? -1 : h[d] === v ? 1 : 0 }, n) : n }, ga.matches = function (a, b) { return ga(a, null, null, b) }, ga.matchesSelector = function (a, b) { if ((a.ownerDocument || a) !== n && m(a), b = b.replace(S, "='$1']"), c.matchesSelector && p && !A[b + " "] && (!r || !r.test(b)) && (!q || !q.test(b))) try { var d = s.call(a, b); if (d || c.disconnectedMatch || a.document && 11 !== a.document.nodeType) return d } catch (e) { } return ga(b, n, null, [a]).length > 0 }, ga.contains = function (a, b) { return (a.ownerDocument || a) !== n && m(a), t(a, b) }, ga.attr = function (a, b) { (a.ownerDocument || a) !== n && m(a); var e = d.attrHandle[b.toLowerCase()], f = e && C.call(d.attrHandle, b.toLowerCase()) ? e(a, b, !p) : void 0; return void 0 !== f ? f : c.attributes || !p ? a.getAttribute(b) : (f = a.getAttributeNode(b)) && f.specified ? f.value : null }, ga.escape = function (a) { return (a + "").replace(ba, ca) }, ga.error = function (a) { throw new Error("Syntax error, unrecognized expression: " + a) }, ga.uniqueSort = function (a) { var b, d = [], e = 0, f = 0; if (l = !c.detectDuplicates, k = !c.sortStable && a.slice(0), a.sort(B), l) { while (b = a[f++]) b === a[f] && (e = d.push(f)); while (e--) a.splice(d[e], 1) } return k = null, a }, e = ga.getText = function (a) { var b, c = "", d = 0, f = a.nodeType; if (f) { if (1 === f || 9 === f || 11 === f) { if ("string" == typeof a.textContent) return a.textContent; for (a = a.firstChild; a; a = a.nextSibling)c += e(a) } else if (3 === f || 4 === f) return a.nodeValue } else while (b = a[d++]) c += e(b); return c }, d = ga.selectors = { cacheLength: 50, createPseudo: ia, match: V, attrHandle: {}, find: {}, relative: { ">": { dir: "parentNode", first: !0 }, " ": { dir: "parentNode" }, "+": { dir: "previousSibling", first: !0 }, "~": { dir: "previousSibling" } }, preFilter: { ATTR: function (a) { return a[1] = a[1].replace(_, aa), a[3] = (a[3] || a[4] || a[5] || "").replace(_, aa), "~=" === a[2] && (a[3] = " " + a[3] + " "), a.slice(0, 4) }, CHILD: function (a) { return a[1] = a[1].toLowerCase(), "nth" === a[1].slice(0, 3) ? (a[3] || ga.error(a[0]), a[4] = +(a[4] ? a[5] + (a[6] || 1) : 2 * ("even" === a[3] || "odd" === a[3])), a[5] = +(a[7] + a[8] || "odd" === a[3])) : a[3] && ga.error(a[0]), a }, PSEUDO: function (a) { var b, c = !a[6] && a[2]; return V.CHILD.test(a[0]) ? null : (a[3] ? a[2] = a[4] || a[5] || "" : c && T.test(c) && (b = g(c, !0)) && (b = c.indexOf(")", c.length - b) - c.length) && (a[0] = a[0].slice(0, b), a[2] = c.slice(0, b)), a.slice(0, 3)) } }, filter: { TAG: function (a) { var b = a.replace(_, aa).toLowerCase(); return "*" === a ? function () { return !0 } : function (a) { return a.nodeName && a.nodeName.toLowerCase() === b } }, CLASS: function (a) { var b = y[a + " "]; return b || (b = new RegExp("(^|" + K + ")" + a + "(" + K + "|$)")) && y(a, function (a) { return b.test("string" == typeof a.className && a.className || "undefined" != typeof a.getAttribute && a.getAttribute("class") || "") }) }, ATTR: function (a, b, c) { return function (d) { var e = ga.attr(d, a); return null == e ? "!=" === b : !b || (e += "", "=" === b ? e === c : "!=" === b ? e !== c : "^=" === b ? c && 0 === e.indexOf(c) : "*=" === b ? c && e.indexOf(c) > -1 : "$=" === b ? c && e.slice(-c.length) === c : "~=" === b ? (" " + e.replace(O, " ") + " ").indexOf(c) > -1 : "|=" === b && (e === c || e.slice(0, c.length + 1) === c + "-")) } }, CHILD: function (a, b, c, d, e) { var f = "nth" !== a.slice(0, 3), g = "last" !== a.slice(-4), h = "of-type" === b; return 1 === d && 0 === e ? function (a) { return !!a.parentNode } : function (b, c, i) { var j, k, l, m, n, o, p = f !== g ? "nextSibling" : "previousSibling", q = b.parentNode, r = h && b.nodeName.toLowerCase(), s = !i && !h, t = !1; if (q) { if (f) { while (p) { m = b; while (m = m[p]) if (h ? m.nodeName.toLowerCase() === r : 1 === m.nodeType) return !1; o = p = "only" === a && !o && "nextSibling" } return !0 } if (o = [g ? q.firstChild : q.lastChild], g && s) { m = q, l = m[u] || (m[u] = {}), k = l[m.uniqueID] || (l[m.uniqueID] = {}), j = k[a] || [], n = j[0] === w && j[1], t = n && j[2], m = n && q.childNodes[n]; while (m = ++n && m && m[p] || (t = n = 0) || o.pop()) if (1 === m.nodeType && ++t && m === b) { k[a] = [w, n, t]; break } } else if (s && (m = b, l = m[u] || (m[u] = {}), k = l[m.uniqueID] || (l[m.uniqueID] = {}), j = k[a] || [], n = j[0] === w && j[1], t = n), t === !1) while (m = ++n && m && m[p] || (t = n = 0) || o.pop()) if ((h ? m.nodeName.toLowerCase() === r : 1 === m.nodeType) && ++t && (s && (l = m[u] || (m[u] = {}), k = l[m.uniqueID] || (l[m.uniqueID] = {}), k[a] = [w, t]), m === b)) break; return t -= e, t === d || t % d === 0 && t / d >= 0 } } }, PSEUDO: function (a, b) { var c, e = d.pseudos[a] || d.setFilters[a.toLowerCase()] || ga.error("unsupported pseudo: " + a); return e[u] ? e(b) : e.length > 1 ? (c = [a, a, "", b], d.setFilters.hasOwnProperty(a.toLowerCase()) ? ia(function (a, c) { var d, f = e(a, b), g = f.length; while (g--) d = I(a, f[g]), a[d] = !(c[d] = f[g]) }) : function (a) { return e(a, 0, c) }) : e } }, pseudos: { not: ia(function (a) { var b = [], c = [], d = h(a.replace(P, "$1")); return d[u] ? ia(function (a, b, c, e) { var f, g = d(a, null, e, []), h = a.length; while (h--) (f = g[h]) && (a[h] = !(b[h] = f)) }) : function (a, e, f) { return b[0] = a, d(b, null, f, c), b[0] = null, !c.pop() } }), has: ia(function (a) { return function (b) { return ga(a, b).length > 0 } }), contains: ia(function (a) { return a = a.replace(_, aa), function (b) { return (b.textContent || b.innerText || e(b)).indexOf(a) > -1 } }), lang: ia(function (a) { return U.test(a || "") || ga.error("unsupported lang: " + a), a = a.replace(_, aa).toLowerCase(), function (b) { var c; do if (c = p ? b.lang : b.getAttribute("xml:lang") || b.getAttribute("lang")) return c = c.toLowerCase(), c === a || 0 === c.indexOf(a + "-"); while ((b = b.parentNode) && 1 === b.nodeType); return !1 } }), target: function (b) { var c = a.location && a.location.hash; return c && c.slice(1) === b.id }, root: function (a) { return a === o }, focus: function (a) { return a === n.activeElement && (!n.hasFocus || n.hasFocus()) && !!(a.type || a.href || ~a.tabIndex) }, enabled: oa(!1), disabled: oa(!0), checked: function (a) { var b = a.nodeName.toLowerCase(); return "input" === b && !!a.checked || "option" === b && !!a.selected }, selected: function (a) { return a.parentNode && a.parentNode.selectedIndex, a.selected === !0 }, empty: function (a) { for (a = a.firstChild; a; a = a.nextSibling)if (a.nodeType < 6) return !1; return !0 }, parent: function (a) { return !d.pseudos.empty(a) }, header: function (a) { return X.test(a.nodeName) }, input: function (a) { return W.test(a.nodeName) }, button: function (a) { var b = a.nodeName.toLowerCase(); return "input" === b && "button" === a.type || "button" === b }, text: function (a) { var b; return "input" === a.nodeName.toLowerCase() && "text" === a.type && (null == (b = a.getAttribute("type")) || "text" === b.toLowerCase()) }, first: pa(function () { return [0] }), last: pa(function (a, b) { return [b - 1] }), eq: pa(function (a, b, c) { return [c < 0 ? c + b : c] }), even: pa(function (a, b) { for (var c = 0; c < b; c += 2)a.push(c); return a }), odd: pa(function (a, b) { for (var c = 1; c < b; c += 2)a.push(c); return a }), lt: pa(function (a, b, c) { for (var d = c < 0 ? c + b : c; --d >= 0;)a.push(d); return a }), gt: pa(function (a, b, c) { for (var d = c < 0 ? c + b : c; ++d < b;)a.push(d); return a }) } }, d.pseudos.nth = d.pseudos.eq; for (b in { radio: !0, checkbox: !0, file: !0, password: !0, image: !0 }) d.pseudos[b] = ma(b); for (b in { submit: !0, reset: !0 }) d.pseudos[b] = na(b); function ra() { } ra.prototype = d.filters = d.pseudos, d.setFilters = new ra, g = ga.tokenize = function (a, b) { var c, e, f, g, h, i, j, k = z[a + " "]; if (k) return b ? 0 : k.slice(0); h = a, i = [], j = d.preFilter; while (h) { c && !(e = Q.exec(h)) || (e && (h = h.slice(e[0].length) || h), i.push(f = [])), c = !1, (e = R.exec(h)) && (c = e.shift(), f.push({ value: c, type: e[0].replace(P, " ") }), h = h.slice(c.length)); for (g in d.filter) !(e = V[g].exec(h)) || j[g] && !(e = j[g](e)) || (c = e.shift(), f.push({ value: c, type: g, matches: e }), h = h.slice(c.length)); if (!c) break } return b ? h.length : h ? ga.error(a) : z(a, i).slice(0) }; function sa(a) { for (var b = 0, c = a.length, d = ""; b < c; b++)d += a[b].value; return d } function ta(a, b, c) { var d = b.dir, e = b.next, f = e || d, g = c && "parentNode" === f, h = x++; return b.first ? function (b, c, e) { while (b = b[d]) if (1 === b.nodeType || g) return a(b, c, e); return !1 } : function (b, c, i) { var j, k, l, m = [w, h]; if (i) { while (b = b[d]) if ((1 === b.nodeType || g) && a(b, c, i)) return !0 } else while (b = b[d]) if (1 === b.nodeType || g) if (l = b[u] || (b[u] = {}), k = l[b.uniqueID] || (l[b.uniqueID] = {}), e && e === b.nodeName.toLowerCase()) b = b[d] || b; else { if ((j = k[f]) && j[0] === w && j[1] === h) return m[2] = j[2]; if (k[f] = m, m[2] = a(b, c, i)) return !0 } return !1 } } function ua(a) { return a.length > 1 ? function (b, c, d) { var e = a.length; while (e--) if (!a[e](b, c, d)) return !1; return !0 } : a[0] } function va(a, b, c) { for (var d = 0, e = b.length; d < e; d++)ga(a, b[d], c); return c } function wa(a, b, c, d, e) { for (var f, g = [], h = 0, i = a.length, j = null != b; h < i; h++)(f = a[h]) && (c && !c(f, d, e) || (g.push(f), j && b.push(h))); return g } function xa(a, b, c, d, e, f) { return d && !d[u] && (d = xa(d)), e && !e[u] && (e = xa(e, f)), ia(function (f, g, h, i) { var j, k, l, m = [], n = [], o = g.length, p = f || va(b || "*", h.nodeType ? [h] : h, []), q = !a || !f && b ? p : wa(p, m, a, h, i), r = c ? e || (f ? a : o || d) ? [] : g : q; if (c && c(q, r, h, i), d) { j = wa(r, n), d(j, [], h, i), k = j.length; while (k--) (l = j[k]) && (r[n[k]] = !(q[n[k]] = l)) } if (f) { if (e || a) { if (e) { j = [], k = r.length; while (k--) (l = r[k]) && j.push(q[k] = l); e(null, r = [], j, i) } k = r.length; while (k--) (l = r[k]) && (j = e ? I(f, l) : m[k]) > -1 && (f[j] = !(g[j] = l)) } } else r = wa(r === g ? r.splice(o, r.length) : r), e ? e(null, g, r, i) : G.apply(g, r) }) } function ya(a) { for (var b, c, e, f = a.length, g = d.relative[a[0].type], h = g || d.relative[" "], i = g ? 1 : 0, k = ta(function (a) { return a === b }, h, !0), l = ta(function (a) { return I(b, a) > -1 }, h, !0), m = [function (a, c, d) { var e = !g && (d || c !== j) || ((b = c).nodeType ? k(a, c, d) : l(a, c, d)); return b = null, e }]; i < f; i++)if (c = d.relative[a[i].type]) m = [ta(ua(m), c)]; else { if (c = d.filter[a[i].type].apply(null, a[i].matches), c[u]) { for (e = ++i; e < f; e++)if (d.relative[a[e].type]) break; return xa(i > 1 && ua(m), i > 1 && sa(a.slice(0, i - 1).concat({ value: " " === a[i - 2].type ? "*" : "" })).replace(P, "$1"), c, i < e && ya(a.slice(i, e)), e < f && ya(a = a.slice(e)), e < f && sa(a)) } m.push(c) } return ua(m) } function za(a, b) { var c = b.length > 0, e = a.length > 0, f = function (f, g, h, i, k) { var l, o, q, r = 0, s = "0", t = f && [], u = [], v = j, x = f || e && d.find.TAG("*", k), y = w += null == v ? 1 : Math.random() || .1, z = x.length; for (k && (j = g === n || g || k); s !== z && null != (l = x[s]); s++) { if (e && l) { o = 0, g || l.ownerDocument === n || (m(l), h = !p); while (q = a[o++]) if (q(l, g || n, h)) { i.push(l); break } k && (w = y) } c && ((l = !q && l) && r--, f && t.push(l)) } if (r += s, c && s !== r) { o = 0; while (q = b[o++]) q(t, u, g, h); if (f) { if (r > 0) while (s--) t[s] || u[s] || (u[s] = E.call(i)); u = wa(u) } G.apply(i, u), k && !f && u.length > 0 && r + b.length > 1 && ga.uniqueSort(i) } return k && (w = y, j = v), t }; return c ? ia(f) : f } return h = ga.compile = function (a, b) { var c, d = [], e = [], f = A[a + " "]; if (!f) { b || (b = g(a)), c = b.length; while (c--) f = ya(b[c]), f[u] ? d.push(f) : e.push(f); f = A(a, za(e, d)), f.selector = a } return f }, i = ga.select = function (a, b, c, e) { var f, i, j, k, l, m = "function" == typeof a && a, n = !e && g(a = m.selector || a); if (c = c || [], 1 === n.length) { if (i = n[0] = n[0].slice(0), i.length > 2 && "ID" === (j = i[0]).type && 9 === b.nodeType && p && d.relative[i[1].type]) { if (b = (d.find.ID(j.matches[0].replace(_, aa), b) || [])[0], !b) return c; m && (b = b.parentNode), a = a.slice(i.shift().value.length) } f = V.needsContext.test(a) ? 0 : i.length; while (f--) { if (j = i[f], d.relative[k = j.type]) break; if ((l = d.find[k]) && (e = l(j.matches[0].replace(_, aa), $.test(i[0].type) && qa(b.parentNode) || b))) { if (i.splice(f, 1), a = e.length && sa(i), !a) return G.apply(c, e), c; break } } } return (m || h(a, n))(e, b, !p, c, !b || $.test(a) && qa(b.parentNode) || b), c }, c.sortStable = u.split("").sort(B).join("") === u, c.detectDuplicates = !!l, m(), c.sortDetached = ja(function (a) { return 1 & a.compareDocumentPosition(n.createElement("fieldset")) }), ja(function (a) { return a.innerHTML = "<a href='#'></a>", "#" === a.firstChild.getAttribute("href") }) || ka("type|href|height|width", function (a, b, c) { if (!c) return a.getAttribute(b, "type" === b.toLowerCase() ? 1 : 2) }), c.attributes && ja(function (a) { return a.innerHTML = "<input/>", a.firstChild.setAttribute("value", ""), "" === a.firstChild.getAttribute("value") }) || ka("value", function (a, b, c) { if (!c && "input" === a.nodeName.toLowerCase()) return a.defaultValue }), ja(function (a) { return null == a.getAttribute("disabled") }) || ka(J, function (a, b, c) { var d; if (!c) return a[b] === !0 ? b.toLowerCase() : (d = a.getAttributeNode(b)) && d.specified ? d.value : null }), ga }(a); r.find = x, r.expr = x.selectors, r.expr[":"] = r.expr.pseudos, r.uniqueSort = r.unique = x.uniqueSort, r.text = x.getText, r.isXMLDoc = x.isXML, r.contains = x.contains, r.escapeSelector = x.escape; var y = function (a, b, c) { var d = [], e = void 0 !== c; while ((a = a[b]) && 9 !== a.nodeType) if (1 === a.nodeType) { if (e && r(a).is(c)) break; d.push(a) } return d }, z = function (a, b) { for (var c = []; a; a = a.nextSibling)1 === a.nodeType && a !== b && c.push(a); return c }, A = r.expr.match.needsContext, B = /^<([a-z][^\/\0>:\x20\t\r\n\f]*)[\x20\t\r\n\f]*\/?>(?:<\/\1>|)$/i, C = /^.[^:#\[\.,]*$/; function D(a, b, c) { return r.isFunction(b) ? r.grep(a, function (a, d) { return !!b.call(a, d, a) !== c }) : b.nodeType ? r.grep(a, function (a) { return a === b !== c }) : "string" != typeof b ? r.grep(a, function (a) { return i.call(b, a) > -1 !== c }) : C.test(b) ? r.filter(b, a, c) : (b = r.filter(b, a), r.grep(a, function (a) { return i.call(b, a) > -1 !== c && 1 === a.nodeType })) } r.filter = function (a, b, c) { var d = b[0]; return c && (a = ":not(" + a + ")"), 1 === b.length && 1 === d.nodeType ? r.find.matchesSelector(d, a) ? [d] : [] : r.find.matches(a, r.grep(b, function (a) { return 1 === a.nodeType })) }, r.fn.extend({ find: function (a) { var b, c, d = this.length, e = this; if ("string" != typeof a) return this.pushStack(r(a).filter(function () { for (b = 0; b < d; b++)if (r.contains(e[b], this)) return !0 })); for (c = this.pushStack([]), b = 0; b < d; b++)r.find(a, e[b], c); return d > 1 ? r.uniqueSort(c) : c }, filter: function (a) { return this.pushStack(D(this, a || [], !1)) }, not: function (a) { return this.pushStack(D(this, a || [], !0)) }, is: function (a) { return !!D(this, "string" == typeof a && A.test(a) ? r(a) : a || [], !1).length } }); var E, F = /^(?:\s*(<[\w\W]+>)[^>]*|#([\w-]+))$/, G = r.fn.init = function (a, b, c) { var e, f; if (!a) return this; if (c = c || E, "string" == typeof a) { if (e = "<" === a[0] && ">" === a[a.length - 1] && a.length >= 3 ? [null, a, null] : F.exec(a), !e || !e[1] && b) return !b || b.jquery ? (b || c).find(a) : this.constructor(b).find(a); if (e[1]) { if (b = b instanceof r ? b[0] : b, r.merge(this, r.parseHTML(e[1], b && b.nodeType ? b.ownerDocument || b : d, !0)), B.test(e[1]) && r.isPlainObject(b)) for (e in b) r.isFunction(this[e]) ? this[e](b[e]) : this.attr(e, b[e]); return this } return f = d.getElementById(e[2]), f && (this[0] = f, this.length = 1), this } return a.nodeType ? (this[0] = a, this.length = 1, this) : r.isFunction(a) ? void 0 !== c.ready ? c.ready(a) : a(r) : r.makeArray(a, this) }; G.prototype = r.fn, E = r(d); var H = /^(?:parents|prev(?:Until|All))/, I = { children: !0, contents: !0, next: !0, prev: !0 }; r.fn.extend({ has: function (a) { var b = r(a, this), c = b.length; return this.filter(function () { for (var a = 0; a < c; a++)if (r.contains(this, b[a])) return !0 }) }, closest: function (a, b) { var c, d = 0, e = this.length, f = [], g = "string" != typeof a && r(a); if (!A.test(a)) for (; d < e; d++)for (c = this[d]; c && c !== b; c = c.parentNode)if (c.nodeType < 11 && (g ? g.index(c) > -1 : 1 === c.nodeType && r.find.matchesSelector(c, a))) { f.push(c); break } return this.pushStack(f.length > 1 ? r.uniqueSort(f) : f) }, index: function (a) { return a ? "string" == typeof a ? i.call(r(a), this[0]) : i.call(this, a.jquery ? a[0] : a) : this[0] && this[0].parentNode ? this.first().prevAll().length : -1 }, add: function (a, b) { return this.pushStack(r.uniqueSort(r.merge(this.get(), r(a, b)))) }, addBack: function (a) { return this.add(null == a ? this.prevObject : this.prevObject.filter(a)) } }); function J(a, b) { while ((a = a[b]) && 1 !== a.nodeType); return a } r.each({ parent: function (a) { var b = a.parentNode; return b && 11 !== b.nodeType ? b : null }, parents: function (a) { return y(a, "parentNode") }, parentsUntil: function (a, b, c) { return y(a, "parentNode", c) }, next: function (a) { return J(a, "nextSibling") }, prev: function (a) { return J(a, "previousSibling") }, nextAll: function (a) { return y(a, "nextSibling") }, prevAll: function (a) { return y(a, "previousSibling") }, nextUntil: function (a, b, c) { return y(a, "nextSibling", c) }, prevUntil: function (a, b, c) { return y(a, "previousSibling", c) }, siblings: function (a) { return z((a.parentNode || {}).firstChild, a) }, children: function (a) { return z(a.firstChild) }, contents: function (a) { return a.contentDocument || r.merge([], a.childNodes) } }, function (a, b) { r.fn[a] = function (c, d) { var e = r.map(this, b, c); return "Until" !== a.slice(-5) && (d = c), d && "string" == typeof d && (e = r.filter(d, e)), this.length > 1 && (I[a] || r.uniqueSort(e), H.test(a) && e.reverse()), this.pushStack(e) } }); var K = /[^\x20\t\r\n\f]+/g; function L(a) { var b = {}; return r.each(a.match(K) || [], function (a, c) { b[c] = !0 }), b } r.Callbacks = function (a) { a = "string" == typeof a ? L(a) : r.extend({}, a); var b, c, d, e, f = [], g = [], h = -1, i = function () { for (e = a.once, d = b = !0; g.length; h = -1) { c = g.shift(); while (++h < f.length) f[h].apply(c[0], c[1]) === !1 && a.stopOnFalse && (h = f.length, c = !1) } a.memory || (c = !1), b = !1, e && (f = c ? [] : "") }, j = { add: function () { return f && (c && !b && (h = f.length - 1, g.push(c)), function d(b) { r.each(b, function (b, c) { r.isFunction(c) ? a.unique && j.has(c) || f.push(c) : c && c.length && "string" !== r.type(c) && d(c) }) }(arguments), c && !b && i()), this }, remove: function () { return r.each(arguments, function (a, b) { var c; while ((c = r.inArray(b, f, c)) > -1) f.splice(c, 1), c <= h && h-- }), this }, has: function (a) { return a ? r.inArray(a, f) > -1 : f.length > 0 }, empty: function () { return f && (f = []), this }, disable: function () { return e = g = [], f = c = "", this }, disabled: function () { return !f }, lock: function () { return e = g = [], c || b || (f = c = ""), this }, locked: function () { return !!e }, fireWith: function (a, c) { return e || (c = c || [], c = [a, c.slice ? c.slice() : c], g.push(c), b || i()), this }, fire: function () { return j.fireWith(this, arguments), this }, fired: function () { return !!d } }; return j }; function M(a) { return a } function N(a) { throw a } function O(a, b, c) { var d; try { a && r.isFunction(d = a.promise) ? d.call(a).done(b).fail(c) : a && r.isFunction(d = a.then) ? d.call(a, b, c) : b.call(void 0, a) } catch (a) { c.call(void 0, a) } } r.extend({ Deferred: function (b) { var c = [["notify", "progress", r.Callbacks("memory"), r.Callbacks("memory"), 2], ["resolve", "done", r.Callbacks("once memory"), r.Callbacks("once memory"), 0, "resolved"], ["reject", "fail", r.Callbacks("once memory"), r.Callbacks("once memory"), 1, "rejected"]], d = "pending", e = { state: function () { return d }, always: function () { return f.done(arguments).fail(arguments), this }, "catch": function (a) { return e.then(null, a) }, pipe: function () { var a = arguments; return r.Deferred(function (b) { r.each(c, function (c, d) { var e = r.isFunction(a[d[4]]) && a[d[4]]; f[d[1]](function () { var a = e && e.apply(this, arguments); a && r.isFunction(a.promise) ? a.promise().progress(b.notify).done(b.resolve).fail(b.reject) : b[d[0] + "With"](this, e ? [a] : arguments) }) }), a = null }).promise() }, then: function (b, d, e) { var f = 0; function g(b, c, d, e) { return function () { var h = this, i = arguments, j = function () { var a, j; if (!(b < f)) { if (a = d.apply(h, i), a === c.promise()) throw new TypeError("Thenable self-resolution"); j = a && ("object" == typeof a || "function" == typeof a) && a.then, r.isFunction(j) ? e ? j.call(a, g(f, c, M, e), g(f, c, N, e)) : (f++, j.call(a, g(f, c, M, e), g(f, c, N, e), g(f, c, M, c.notifyWith))) : (d !== M && (h = void 0, i = [a]), (e || c.resolveWith)(h, i)) } }, k = e ? j : function () { try { j() } catch (a) { r.Deferred.exceptionHook && r.Deferred.exceptionHook(a, k.stackTrace), b + 1 >= f && (d !== N && (h = void 0, i = [a]), c.rejectWith(h, i)) } }; b ? k() : (r.Deferred.getStackHook && (k.stackTrace = r.Deferred.getStackHook()), a.setTimeout(k)) } } return r.Deferred(function (a) { c[0][3].add(g(0, a, r.isFunction(e) ? e : M, a.notifyWith)), c[1][3].add(g(0, a, r.isFunction(b) ? b : M)), c[2][3].add(g(0, a, r.isFunction(d) ? d : N)) }).promise() }, promise: function (a) { return null != a ? r.extend(a, e) : e } }, f = {}; return r.each(c, function (a, b) { var g = b[2], h = b[5]; e[b[1]] = g.add, h && g.add(function () { d = h }, c[3 - a][2].disable, c[0][2].lock), g.add(b[3].fire), f[b[0]] = function () { return f[b[0] + "With"](this === f ? void 0 : this, arguments), this }, f[b[0] + "With"] = g.fireWith }), e.promise(f), b && b.call(f, f), f }, when: function (a) { var b = arguments.length, c = b, d = Array(c), e = f.call(arguments), g = r.Deferred(), h = function (a) { return function (c) { d[a] = this, e[a] = arguments.length > 1 ? f.call(arguments) : c, --b || g.resolveWith(d, e) } }; if (b <= 1 && (O(a, g.done(h(c)).resolve, g.reject), "pending" === g.state() || r.isFunction(e[c] && e[c].then))) return g.then(); while (c--) O(e[c], h(c), g.reject); return g.promise() } }); var P = /^(Eval|Internal|Range|Reference|Syntax|Type|URI)Error$/; r.Deferred.exceptionHook = function (b, c) { a.console && a.console.warn && b && P.test(b.name) && a.console.warn("jQuery.Deferred exception: " + b.message, b.stack, c) }, r.readyException = function (b) { a.setTimeout(function () { throw b }) }; var Q = r.Deferred(); r.fn.ready = function (a) { return Q.then(a)["catch"](function (a) { r.readyException(a) }), this }, r.extend({ isReady: !1, readyWait: 1, holdReady: function (a) { a ? r.readyWait++ : r.ready(!0) }, ready: function (a) { (a === !0 ? --r.readyWait : r.isReady) || (r.isReady = !0, a !== !0 && --r.readyWait > 0 || Q.resolveWith(d, [r])) } }), r.ready.then = Q.then; function R() {
            d.removeEventListener("DOMContentLoaded", R),
                a.removeEventListener("load", R), r.ready()
        } "complete" === d.readyState || "loading" !== d.readyState && !d.documentElement.doScroll ? a.setTimeout(r.ready) : (d.addEventListener("DOMContentLoaded", R), a.addEventListener("load", R)); var S = function (a, b, c, d, e, f, g) { var h = 0, i = a.length, j = null == c; if ("object" === r.type(c)) { e = !0; for (h in c) S(a, b, h, c[h], !0, f, g) } else if (void 0 !== d && (e = !0, r.isFunction(d) || (g = !0), j && (g ? (b.call(a, d), b = null) : (j = b, b = function (a, b, c) { return j.call(r(a), c) })), b)) for (; h < i; h++)b(a[h], c, g ? d : d.call(a[h], h, b(a[h], c))); return e ? a : j ? b.call(a) : i ? b(a[0], c) : f }, T = function (a) { return 1 === a.nodeType || 9 === a.nodeType || !+a.nodeType }; function U() { this.expando = r.expando + U.uid++ } U.uid = 1, U.prototype = { cache: function (a) { var b = a[this.expando]; return b || (b = {}, T(a) && (a.nodeType ? a[this.expando] = b : Object.defineProperty(a, this.expando, { value: b, configurable: !0 }))), b }, set: function (a, b, c) { var d, e = this.cache(a); if ("string" == typeof b) e[r.camelCase(b)] = c; else for (d in b) e[r.camelCase(d)] = b[d]; return e }, get: function (a, b) { return void 0 === b ? this.cache(a) : a[this.expando] && a[this.expando][r.camelCase(b)] }, access: function (a, b, c) { return void 0 === b || b && "string" == typeof b && void 0 === c ? this.get(a, b) : (this.set(a, b, c), void 0 !== c ? c : b) }, remove: function (a, b) { var c, d = a[this.expando]; if (void 0 !== d) { if (void 0 !== b) { r.isArray(b) ? b = b.map(r.camelCase) : (b = r.camelCase(b), b = b in d ? [b] : b.match(K) || []), c = b.length; while (c--) delete d[b[c]] } (void 0 === b || r.isEmptyObject(d)) && (a.nodeType ? a[this.expando] = void 0 : delete a[this.expando]) } }, hasData: function (a) { var b = a[this.expando]; return void 0 !== b && !r.isEmptyObject(b) } }; var V = new U, W = new U, X = /^(?:\{[\w\W]*\}|\[[\w\W]*\])$/, Y = /[A-Z]/g; function Z(a) { return "true" === a || "false" !== a && ("null" === a ? null : a === +a + "" ? +a : X.test(a) ? JSON.parse(a) : a) } function $(a, b, c) { var d; if (void 0 === c && 1 === a.nodeType) if (d = "data-" + b.replace(Y, "-$&").toLowerCase(), c = a.getAttribute(d), "string" == typeof c) { try { c = Z(c) } catch (e) { } W.set(a, b, c) } else c = void 0; return c } r.extend({ hasData: function (a) { return W.hasData(a) || V.hasData(a) }, data: function (a, b, c) { return W.access(a, b, c) }, removeData: function (a, b) { W.remove(a, b) }, _data: function (a, b, c) { return V.access(a, b, c) }, _removeData: function (a, b) { V.remove(a, b) } }), r.fn.extend({ data: function (a, b) { var c, d, e, f = this[0], g = f && f.attributes; if (void 0 === a) { if (this.length && (e = W.get(f), 1 === f.nodeType && !V.get(f, "hasDataAttrs"))) { c = g.length; while (c--) g[c] && (d = g[c].name, 0 === d.indexOf("data-") && (d = r.camelCase(d.slice(5)), $(f, d, e[d]))); V.set(f, "hasDataAttrs", !0) } return e } return "object" == typeof a ? this.each(function () { W.set(this, a) }) : S(this, function (b) { var c; if (f && void 0 === b) { if (c = W.get(f, a), void 0 !== c) return c; if (c = $(f, a), void 0 !== c) return c } else this.each(function () { W.set(this, a, b) }) }, null, b, arguments.length > 1, null, !0) }, removeData: function (a) { return this.each(function () { W.remove(this, a) }) } }), r.extend({ queue: function (a, b, c) { var d; if (a) return b = (b || "fx") + "queue", d = V.get(a, b), c && (!d || r.isArray(c) ? d = V.access(a, b, r.makeArray(c)) : d.push(c)), d || [] }, dequeue: function (a, b) { b = b || "fx"; var c = r.queue(a, b), d = c.length, e = c.shift(), f = r._queueHooks(a, b), g = function () { r.dequeue(a, b) }; "inprogress" === e && (e = c.shift(), d--), e && ("fx" === b && c.unshift("inprogress"), delete f.stop, e.call(a, g, f)), !d && f && f.empty.fire() }, _queueHooks: function (a, b) { var c = b + "queueHooks"; return V.get(a, c) || V.access(a, c, { empty: r.Callbacks("once memory").add(function () { V.remove(a, [b + "queue", c]) }) }) } }), r.fn.extend({ queue: function (a, b) { var c = 2; return "string" != typeof a && (b = a, a = "fx", c--), arguments.length < c ? r.queue(this[0], a) : void 0 === b ? this : this.each(function () { var c = r.queue(this, a, b); r._queueHooks(this, a), "fx" === a && "inprogress" !== c[0] && r.dequeue(this, a) }) }, dequeue: function (a) { return this.each(function () { r.dequeue(this, a) }) }, clearQueue: function (a) { return this.queue(a || "fx", []) }, promise: function (a, b) { var c, d = 1, e = r.Deferred(), f = this, g = this.length, h = function () { --d || e.resolveWith(f, [f]) }; "string" != typeof a && (b = a, a = void 0), a = a || "fx"; while (g--) c = V.get(f[g], a + "queueHooks"), c && c.empty && (d++, c.empty.add(h)); return h(), e.promise(b) } }); var _ = /[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source, aa = new RegExp("^(?:([+-])=|)(" + _ + ")([a-z%]*)$", "i"), ba = ["Top", "Right", "Bottom", "Left"], ca = function (a, b) { return a = b || a, "none" === a.style.display || "" === a.style.display && r.contains(a.ownerDocument, a) && "none" === r.css(a, "display") }, da = function (a, b, c, d) { var e, f, g = {}; for (f in b) g[f] = a.style[f], a.style[f] = b[f]; e = c.apply(a, d || []); for (f in b) a.style[f] = g[f]; return e }; function ea(a, b, c, d) { var e, f = 1, g = 20, h = d ? function () { return d.cur() } : function () { return r.css(a, b, "") }, i = h(), j = c && c[3] || (r.cssNumber[b] ? "" : "px"), k = (r.cssNumber[b] || "px" !== j && +i) && aa.exec(r.css(a, b)); if (k && k[3] !== j) { j = j || k[3], c = c || [], k = +i || 1; do f = f || ".5", k /= f, r.style(a, b, k + j); while (f !== (f = h() / i) && 1 !== f && --g) } return c && (k = +k || +i || 0, e = c[1] ? k + (c[1] + 1) * c[2] : +c[2], d && (d.unit = j, d.start = k, d.end = e)), e } var fa = {}; function ga(a) { var b, c = a.ownerDocument, d = a.nodeName, e = fa[d]; return e ? e : (b = c.body.appendChild(c.createElement(d)), e = r.css(b, "display"), b.parentNode.removeChild(b), "none" === e && (e = "block"), fa[d] = e, e) } function ha(a, b) { for (var c, d, e = [], f = 0, g = a.length; f < g; f++)d = a[f], d.style && (c = d.style.display, b ? ("none" === c && (e[f] = V.get(d, "display") || null, e[f] || (d.style.display = "")), "" === d.style.display && ca(d) && (e[f] = ga(d))) : "none" !== c && (e[f] = "none", V.set(d, "display", c))); for (f = 0; f < g; f++)null != e[f] && (a[f].style.display = e[f]); return a } r.fn.extend({ show: function () { return ha(this, !0) }, hide: function () { return ha(this) }, toggle: function (a) { return "boolean" == typeof a ? a ? this.show() : this.hide() : this.each(function () { ca(this) ? r(this).show() : r(this).hide() }) } }); var ia = /^(?:checkbox|radio)$/i, ja = /<([a-z][^\/\0>\x20\t\r\n\f]+)/i, ka = /^$|\/(?:java|ecma)script/i, la = { option: [1, "<select multiple='multiple'>", "</select>"], thead: [1, "<table>", "</table>"], col: [2, "<table><colgroup>", "</colgroup></table>"], tr: [2, "<table><tbody>", "</tbody></table>"], td: [3, "<table><tbody><tr>", "</tr></tbody></table>"], _default: [0, "", ""] }; la.optgroup = la.option, la.tbody = la.tfoot = la.colgroup = la.caption = la.thead, la.th = la.td; function ma(a, b) { var c; return c = "undefined" != typeof a.getElementsByTagName ? a.getElementsByTagName(b || "*") : "undefined" != typeof a.querySelectorAll ? a.querySelectorAll(b || "*") : [], void 0 === b || b && r.nodeName(a, b) ? r.merge([a], c) : c } function na(a, b) { for (var c = 0, d = a.length; c < d; c++)V.set(a[c], "globalEval", !b || V.get(b[c], "globalEval")) } var oa = /<|&#?\w+;/; function pa(a, b, c, d, e) { for (var f, g, h, i, j, k, l = b.createDocumentFragment(), m = [], n = 0, o = a.length; n < o; n++)if (f = a[n], f || 0 === f) if ("object" === r.type(f)) r.merge(m, f.nodeType ? [f] : f); else if (oa.test(f)) { g = g || l.appendChild(b.createElement("div")), h = (ja.exec(f) || ["", ""])[1].toLowerCase(), i = la[h] || la._default, g.innerHTML = i[1] + r.htmlPrefilter(f) + i[2], k = i[0]; while (k--) g = g.lastChild; r.merge(m, g.childNodes), g = l.firstChild, g.textContent = "" } else m.push(b.createTextNode(f)); l.textContent = "", n = 0; while (f = m[n++]) if (d && r.inArray(f, d) > -1) e && e.push(f); else if (j = r.contains(f.ownerDocument, f), g = ma(l.appendChild(f), "script"), j && na(g), c) { k = 0; while (f = g[k++]) ka.test(f.type || "") && c.push(f) } return l } !function () { var a = d.createDocumentFragment(), b = a.appendChild(d.createElement("div")), c = d.createElement("input"); c.setAttribute("type", "radio"), c.setAttribute("checked", "checked"), c.setAttribute("name", "t"), b.appendChild(c), o.checkClone = b.cloneNode(!0).cloneNode(!0).lastChild.checked, b.innerHTML = "<textarea>x</textarea>", o.noCloneChecked = !!b.cloneNode(!0).lastChild.defaultValue }(); var qa = d.documentElement, ra = /^key/, sa = /^(?:mouse|pointer|contextmenu|drag|drop)|click/, ta = /^([^.]*)(?:\.(.+)|)/; function ua() { return !0 } function va() { return !1 } function wa() { try { return d.activeElement } catch (a) { } } function xa(a, b, c, d, e, f) { var g, h; if ("object" == typeof b) { "string" != typeof c && (d = d || c, c = void 0); for (h in b) xa(a, h, c, d, b[h], f); return a } if (null == d && null == e ? (e = c, d = c = void 0) : null == e && ("string" == typeof c ? (e = d, d = void 0) : (e = d, d = c, c = void 0)), e === !1) e = va; else if (!e) return a; return 1 === f && (g = e, e = function (a) { return r().off(a), g.apply(this, arguments) }, e.guid = g.guid || (g.guid = r.guid++)), a.each(function () { r.event.add(this, b, e, d, c) }) } r.event = { global: {}, add: function (a, b, c, d, e) { var f, g, h, i, j, k, l, m, n, o, p, q = V.get(a); if (q) { c.handler && (f = c, c = f.handler, e = f.selector), e && r.find.matchesSelector(qa, e), c.guid || (c.guid = r.guid++), (i = q.events) || (i = q.events = {}), (g = q.handle) || (g = q.handle = function (b) { return "undefined" != typeof r && r.event.triggered !== b.type ? r.event.dispatch.apply(a, arguments) : void 0 }), b = (b || "").match(K) || [""], j = b.length; while (j--) h = ta.exec(b[j]) || [], n = p = h[1], o = (h[2] || "").split(".").sort(), n && (l = r.event.special[n] || {}, n = (e ? l.delegateType : l.bindType) || n, l = r.event.special[n] || {}, k = r.extend({ type: n, origType: p, data: d, handler: c, guid: c.guid, selector: e, needsContext: e && r.expr.match.needsContext.test(e), namespace: o.join(".") }, f), (m = i[n]) || (m = i[n] = [], m.delegateCount = 0, l.setup && l.setup.call(a, d, o, g) !== !1 || a.addEventListener && a.addEventListener(n, g)), l.add && (l.add.call(a, k), k.handler.guid || (k.handler.guid = c.guid)), e ? m.splice(m.delegateCount++, 0, k) : m.push(k), r.event.global[n] = !0) } }, remove: function (a, b, c, d, e) { var f, g, h, i, j, k, l, m, n, o, p, q = V.hasData(a) && V.get(a); if (q && (i = q.events)) { b = (b || "").match(K) || [""], j = b.length; while (j--) if (h = ta.exec(b[j]) || [], n = p = h[1], o = (h[2] || "").split(".").sort(), n) { l = r.event.special[n] || {}, n = (d ? l.delegateType : l.bindType) || n, m = i[n] || [], h = h[2] && new RegExp("(^|\\.)" + o.join("\\.(?:.*\\.|)") + "(\\.|$)"), g = f = m.length; while (f--) k = m[f], !e && p !== k.origType || c && c.guid !== k.guid || h && !h.test(k.namespace) || d && d !== k.selector && ("**" !== d || !k.selector) || (m.splice(f, 1), k.selector && m.delegateCount--, l.remove && l.remove.call(a, k)); g && !m.length && (l.teardown && l.teardown.call(a, o, q.handle) !== !1 || r.removeEvent(a, n, q.handle), delete i[n]) } else for (n in i) r.event.remove(a, n + b[j], c, d, !0); r.isEmptyObject(i) && V.remove(a, "handle events") } }, dispatch: function (a) { var b = r.event.fix(a), c, d, e, f, g, h, i = new Array(arguments.length), j = (V.get(this, "events") || {})[b.type] || [], k = r.event.special[b.type] || {}; for (i[0] = b, c = 1; c < arguments.length; c++)i[c] = arguments[c]; if (b.delegateTarget = this, !k.preDispatch || k.preDispatch.call(this, b) !== !1) { h = r.event.handlers.call(this, b, j), c = 0; while ((f = h[c++]) && !b.isPropagationStopped()) { b.currentTarget = f.elem, d = 0; while ((g = f.handlers[d++]) && !b.isImmediatePropagationStopped()) b.rnamespace && !b.rnamespace.test(g.namespace) || (b.handleObj = g, b.data = g.data, e = ((r.event.special[g.origType] || {}).handle || g.handler).apply(f.elem, i), void 0 !== e && (b.result = e) === !1 && (b.preventDefault(), b.stopPropagation())) } return k.postDispatch && k.postDispatch.call(this, b), b.result } }, handlers: function (a, b) { var c, d, e, f, g, h = [], i = b.delegateCount, j = a.target; if (i && j.nodeType && !("click" === a.type && a.button >= 1)) for (; j !== this; j = j.parentNode || this)if (1 === j.nodeType && ("click" !== a.type || j.disabled !== !0)) { for (f = [], g = {}, c = 0; c < i; c++)d = b[c], e = d.selector + " ", void 0 === g[e] && (g[e] = d.needsContext ? r(e, this).index(j) > -1 : r.find(e, this, null, [j]).length), g[e] && f.push(d); f.length && h.push({ elem: j, handlers: f }) } return j = this, i < b.length && h.push({ elem: j, handlers: b.slice(i) }), h }, addProp: function (a, b) { Object.defineProperty(r.Event.prototype, a, { enumerable: !0, configurable: !0, get: r.isFunction(b) ? function () { if (this.originalEvent) return b(this.originalEvent) } : function () { if (this.originalEvent) return this.originalEvent[a] }, set: function (b) { Object.defineProperty(this, a, { enumerable: !0, configurable: !0, writable: !0, value: b }) } }) }, fix: function (a) { return a[r.expando] ? a : new r.Event(a) }, special: { load: { noBubble: !0 }, focus: { trigger: function () { if (this !== wa() && this.focus) return this.focus(), !1 }, delegateType: "focusin" }, blur: { trigger: function () { if (this === wa() && this.blur) return this.blur(), !1 }, delegateType: "focusout" }, click: { trigger: function () { if ("checkbox" === this.type && this.click && r.nodeName(this, "input")) return this.click(), !1 }, _default: function (a) { return r.nodeName(a.target, "a") } }, beforeunload: { postDispatch: function (a) { void 0 !== a.result && a.originalEvent && (a.originalEvent.returnValue = a.result) } } } }, r.removeEvent = function (a, b, c) { a.removeEventListener && a.removeEventListener(b, c) }, r.Event = function (a, b) { return this instanceof r.Event ? (a && a.type ? (this.originalEvent = a, this.type = a.type, this.isDefaultPrevented = a.defaultPrevented || void 0 === a.defaultPrevented && a.returnValue === !1 ? ua : va, this.target = a.target && 3 === a.target.nodeType ? a.target.parentNode : a.target, this.currentTarget = a.currentTarget, this.relatedTarget = a.relatedTarget) : this.type = a, b && r.extend(this, b), this.timeStamp = a && a.timeStamp || r.now(), void (this[r.expando] = !0)) : new r.Event(a, b) }, r.Event.prototype = { constructor: r.Event, isDefaultPrevented: va, isPropagationStopped: va, isImmediatePropagationStopped: va, isSimulated: !1, preventDefault: function () { var a = this.originalEvent; this.isDefaultPrevented = ua, a && !this.isSimulated && a.preventDefault() }, stopPropagation: function () { var a = this.originalEvent; this.isPropagationStopped = ua, a && !this.isSimulated && a.stopPropagation() }, stopImmediatePropagation: function () { var a = this.originalEvent; this.isImmediatePropagationStopped = ua, a && !this.isSimulated && a.stopImmediatePropagation(), this.stopPropagation() } }, r.each({ altKey: !0, bubbles: !0, cancelable: !0, changedTouches: !0, ctrlKey: !0, detail: !0, eventPhase: !0, metaKey: !0, pageX: !0, pageY: !0, shiftKey: !0, view: !0, "char": !0, charCode: !0, key: !0, keyCode: !0, button: !0, buttons: !0, clientX: !0, clientY: !0, offsetX: !0, offsetY: !0, pointerId: !0, pointerType: !0, screenX: !0, screenY: !0, targetTouches: !0, toElement: !0, touches: !0, which: function (a) { var b = a.button; return null == a.which && ra.test(a.type) ? null != a.charCode ? a.charCode : a.keyCode : !a.which && void 0 !== b && sa.test(a.type) ? 1 & b ? 1 : 2 & b ? 3 : 4 & b ? 2 : 0 : a.which } }, r.event.addProp), r.each({ mouseenter: "mouseover", mouseleave: "mouseout", pointerenter: "pointerover", pointerleave: "pointerout" }, function (a, b) { r.event.special[a] = { delegateType: b, bindType: b, handle: function (a) { var c, d = this, e = a.relatedTarget, f = a.handleObj; return e && (e === d || r.contains(d, e)) || (a.type = f.origType, c = f.handler.apply(this, arguments), a.type = b), c } } }), r.fn.extend({ on: function (a, b, c, d) { return xa(this, a, b, c, d) }, one: function (a, b, c, d) { return xa(this, a, b, c, d, 1) }, off: function (a, b, c) { var d, e; if (a && a.preventDefault && a.handleObj) return d = a.handleObj, r(a.delegateTarget).off(d.namespace ? d.origType + "." + d.namespace : d.origType, d.selector, d.handler), this; if ("object" == typeof a) { for (e in a) this.off(e, b, a[e]); return this } return b !== !1 && "function" != typeof b || (c = b, b = void 0), c === !1 && (c = va), this.each(function () { r.event.remove(this, a, c, b) }) } }); var ya = /<(?!area|br|col|embed|hr|img|input|link|meta|param)(([a-z][^\/\0>\x20\t\r\n\f]*)[^>]*)\/>/gi, za = /<script|<style|<link/i, Aa = /checked\s*(?:[^=]|=\s*.checked.)/i, Ba = /^true\/(.*)/, Ca = /^\s*<!(?:\[CDATA\[|--)|(?:\]\]|--)>\s*$/g; function Da(a, b) { return r.nodeName(a, "table") && r.nodeName(11 !== b.nodeType ? b : b.firstChild, "tr") ? a.getElementsByTagName("tbody")[0] || a : a } function Ea(a) { return a.type = (null !== a.getAttribute("type")) + "/" + a.type, a } function Fa(a) { var b = Ba.exec(a.type); return b ? a.type = b[1] : a.removeAttribute("type"), a } function Ga(a, b) { var c, d, e, f, g, h, i, j; if (1 === b.nodeType) { if (V.hasData(a) && (f = V.access(a), g = V.set(b, f), j = f.events)) { delete g.handle, g.events = {}; for (e in j) for (c = 0, d = j[e].length; c < d; c++)r.event.add(b, e, j[e][c]) } W.hasData(a) && (h = W.access(a), i = r.extend({}, h), W.set(b, i)) } } function Ha(a, b) { var c = b.nodeName.toLowerCase(); "input" === c && ia.test(a.type) ? b.checked = a.checked : "input" !== c && "textarea" !== c || (b.defaultValue = a.defaultValue) } function Ia(a, b, c, d) { b = g.apply([], b); var e, f, h, i, j, k, l = 0, m = a.length, n = m - 1, q = b[0], s = r.isFunction(q); if (s || m > 1 && "string" == typeof q && !o.checkClone && Aa.test(q)) return a.each(function (e) { var f = a.eq(e); s && (b[0] = q.call(this, e, f.html())), Ia(f, b, c, d) }); if (m && (e = pa(b, a[0].ownerDocument, !1, a, d), f = e.firstChild, 1 === e.childNodes.length && (e = f), f || d)) { for (h = r.map(ma(e, "script"), Ea), i = h.length; l < m; l++)j = e, l !== n && (j = r.clone(j, !0, !0), i && r.merge(h, ma(j, "script"))), c.call(a[l], j, l); if (i) for (k = h[h.length - 1].ownerDocument, r.map(h, Fa), l = 0; l < i; l++)j = h[l], ka.test(j.type || "") && !V.access(j, "globalEval") && r.contains(k, j) && (j.src ? r._evalUrl && r._evalUrl(j.src) : p(j.textContent.replace(Ca, ""), k)) } return a } function Ja(a, b, c) { for (var d, e = b ? r.filter(b, a) : a, f = 0; null != (d = e[f]); f++)c || 1 !== d.nodeType || r.cleanData(ma(d)), d.parentNode && (c && r.contains(d.ownerDocument, d) && na(ma(d, "script")), d.parentNode.removeChild(d)); return a } r.extend({ htmlPrefilter: function (a) { return a.replace(ya, "<$1></$2>") }, clone: function (a, b, c) { var d, e, f, g, h = a.cloneNode(!0), i = r.contains(a.ownerDocument, a); if (!(o.noCloneChecked || 1 !== a.nodeType && 11 !== a.nodeType || r.isXMLDoc(a))) for (g = ma(h), f = ma(a), d = 0, e = f.length; d < e; d++)Ha(f[d], g[d]); if (b) if (c) for (f = f || ma(a), g = g || ma(h), d = 0, e = f.length; d < e; d++)Ga(f[d], g[d]); else Ga(a, h); return g = ma(h, "script"), g.length > 0 && na(g, !i && ma(a, "script")), h }, cleanData: function (a) { for (var b, c, d, e = r.event.special, f = 0; void 0 !== (c = a[f]); f++)if (T(c)) { if (b = c[V.expando]) { if (b.events) for (d in b.events) e[d] ? r.event.remove(c, d) : r.removeEvent(c, d, b.handle); c[V.expando] = void 0 } c[W.expando] && (c[W.expando] = void 0) } } }), r.fn.extend({ detach: function (a) { return Ja(this, a, !0) }, remove: function (a) { return Ja(this, a) }, text: function (a) { return S(this, function (a) { return void 0 === a ? r.text(this) : this.empty().each(function () { 1 !== this.nodeType && 11 !== this.nodeType && 9 !== this.nodeType || (this.textContent = a) }) }, null, a, arguments.length) }, append: function () { return Ia(this, arguments, function (a) { if (1 === this.nodeType || 11 === this.nodeType || 9 === this.nodeType) { var b = Da(this, a); b.appendChild(a) } }) }, prepend: function () { return Ia(this, arguments, function (a) { if (1 === this.nodeType || 11 === this.nodeType || 9 === this.nodeType) { var b = Da(this, a); b.insertBefore(a, b.firstChild) } }) }, before: function () { return Ia(this, arguments, function (a) { this.parentNode && this.parentNode.insertBefore(a, this) }) }, after: function () { return Ia(this, arguments, function (a) { this.parentNode && this.parentNode.insertBefore(a, this.nextSibling) }) }, empty: function () { for (var a, b = 0; null != (a = this[b]); b++)1 === a.nodeType && (r.cleanData(ma(a, !1)), a.textContent = ""); return this }, clone: function (a, b) { return a = null != a && a, b = null == b ? a : b, this.map(function () { return r.clone(this, a, b) }) }, html: function (a) { return S(this, function (a) { var b = this[0] || {}, c = 0, d = this.length; if (void 0 === a && 1 === b.nodeType) return b.innerHTML; if ("string" == typeof a && !za.test(a) && !la[(ja.exec(a) || ["", ""])[1].toLowerCase()]) { a = r.htmlPrefilter(a); try { for (; c < d; c++)b = this[c] || {}, 1 === b.nodeType && (r.cleanData(ma(b, !1)), b.innerHTML = a); b = 0 } catch (e) { } } b && this.empty().append(a) }, null, a, arguments.length) }, replaceWith: function () { var a = []; return Ia(this, arguments, function (b) { var c = this.parentNode; r.inArray(this, a) < 0 && (r.cleanData(ma(this)), c && c.replaceChild(b, this)) }, a) } }), r.each({ appendTo: "append", prependTo: "prepend", insertBefore: "before", insertAfter: "after", replaceAll: "replaceWith" }, function (a, b) { r.fn[a] = function (a) { for (var c, d = [], e = r(a), f = e.length - 1, g = 0; g <= f; g++)c = g === f ? this : this.clone(!0), r(e[g])[b](c), h.apply(d, c.get()); return this.pushStack(d) } }); var Ka = /^margin/, La = new RegExp("^(" + _ + ")(?!px)[a-z%]+$", "i"), Ma = function (b) { var c = b.ownerDocument.defaultView; return c && c.opener || (c = a), c.getComputedStyle(b) }; !function () { function b() { if (i) { i.style.cssText = "box-sizing:border-box;position:relative;display:block;margin:auto;border:1px;padding:1px;top:1%;width:50%", i.innerHTML = "", qa.appendChild(h); var b = a.getComputedStyle(i); c = "1%" !== b.top, g = "2px" === b.marginLeft, e = "4px" === b.width, i.style.marginRight = "50%", f = "4px" === b.marginRight, qa.removeChild(h), i = null } } var c, e, f, g, h = d.createElement("div"), i = d.createElement("div"); i.style && (i.style.backgroundClip = "content-box", i.cloneNode(!0).style.backgroundClip = "", o.clearCloneStyle = "content-box" === i.style.backgroundClip, h.style.cssText = "border:0;width:8px;height:0;top:0;left:-9999px;padding:0;margin-top:1px;position:absolute", h.appendChild(i), r.extend(o, { pixelPosition: function () { return b(), c }, boxSizingReliable: function () { return b(), e }, pixelMarginRight: function () { return b(), f }, reliableMarginLeft: function () { return b(), g } })) }(); function Na(a, b, c) { var d, e, f, g, h = a.style; return c = c || Ma(a), c && (g = c.getPropertyValue(b) || c[b], "" !== g || r.contains(a.ownerDocument, a) || (g = r.style(a, b)), !o.pixelMarginRight() && La.test(g) && Ka.test(b) && (d = h.width, e = h.minWidth, f = h.maxWidth, h.minWidth = h.maxWidth = h.width = g, g = c.width, h.width = d, h.minWidth = e, h.maxWidth = f)), void 0 !== g ? g + "" : g } function Oa(a, b) { return { get: function () { return a() ? void delete this.get : (this.get = b).apply(this, arguments) } } } var Pa = /^(none|table(?!-c[ea]).+)/, Qa = { position: "absolute", visibility: "hidden", display: "block" }, Ra = { letterSpacing: "0", fontWeight: "400" }, Sa = ["Webkit", "Moz", "ms"], Ta = d.createElement("div").style; function Ua(a) { if (a in Ta) return a; var b = a[0].toUpperCase() + a.slice(1), c = Sa.length; while (c--) if (a = Sa[c] + b, a in Ta) return a } function Va(a, b, c) { var d = aa.exec(b); return d ? Math.max(0, d[2] - (c || 0)) + (d[3] || "px") : b } function Wa(a, b, c, d, e) { var f, g = 0; for (f = c === (d ? "border" : "content") ? 4 : "width" === b ? 1 : 0; f < 4; f += 2)"margin" === c && (g += r.css(a, c + ba[f], !0, e)), d ? ("content" === c && (g -= r.css(a, "padding" + ba[f], !0, e)), "margin" !== c && (g -= r.css(a, "border" + ba[f] + "Width", !0, e))) : (g += r.css(a, "padding" + ba[f], !0, e), "padding" !== c && (g += r.css(a, "border" + ba[f] + "Width", !0, e))); return g } function Xa(a, b, c) { var d, e = !0, f = Ma(a), g = "border-box" === r.css(a, "boxSizing", !1, f); if (a.getClientRects().length && (d = a.getBoundingClientRect()[b]), d <= 0 || null == d) { if (d = Na(a, b, f), (d < 0 || null == d) && (d = a.style[b]), La.test(d)) return d; e = g && (o.boxSizingReliable() || d === a.style[b]), d = parseFloat(d) || 0 } return d + Wa(a, b, c || (g ? "border" : "content"), e, f) + "px" } r.extend({ cssHooks: { opacity: { get: function (a, b) { if (b) { var c = Na(a, "opacity"); return "" === c ? "1" : c } } } }, cssNumber: { animationIterationCount: !0, columnCount: !0, fillOpacity: !0, flexGrow: !0, flexShrink: !0, fontWeight: !0, lineHeight: !0, opacity: !0, order: !0, orphans: !0, widows: !0, zIndex: !0, zoom: !0 }, cssProps: { "float": "cssFloat" }, style: function (a, b, c, d) { if (a && 3 !== a.nodeType && 8 !== a.nodeType && a.style) { var e, f, g, h = r.camelCase(b), i = a.style; return b = r.cssProps[h] || (r.cssProps[h] = Ua(h) || h), g = r.cssHooks[b] || r.cssHooks[h], void 0 === c ? g && "get" in g && void 0 !== (e = g.get(a, !1, d)) ? e : i[b] : (f = typeof c, "string" === f && (e = aa.exec(c)) && e[1] && (c = ea(a, b, e), f = "number"), null != c && c === c && ("number" === f && (c += e && e[3] || (r.cssNumber[h] ? "" : "px")), o.clearCloneStyle || "" !== c || 0 !== b.indexOf("background") || (i[b] = "inherit"), g && "set" in g && void 0 === (c = g.set(a, c, d)) || (i[b] = c)), void 0) } }, css: function (a, b, c, d) { var e, f, g, h = r.camelCase(b); return b = r.cssProps[h] || (r.cssProps[h] = Ua(h) || h), g = r.cssHooks[b] || r.cssHooks[h], g && "get" in g && (e = g.get(a, !0, c)), void 0 === e && (e = Na(a, b, d)), "normal" === e && b in Ra && (e = Ra[b]), "" === c || c ? (f = parseFloat(e), c === !0 || isFinite(f) ? f || 0 : e) : e } }), r.each(["height", "width"], function (a, b) { r.cssHooks[b] = { get: function (a, c, d) { if (c) return !Pa.test(r.css(a, "display")) || a.getClientRects().length && a.getBoundingClientRect().width ? Xa(a, b, d) : da(a, Qa, function () { return Xa(a, b, d) }) }, set: function (a, c, d) { var e, f = d && Ma(a), g = d && Wa(a, b, d, "border-box" === r.css(a, "boxSizing", !1, f), f); return g && (e = aa.exec(c)) && "px" !== (e[3] || "px") && (a.style[b] = c, c = r.css(a, b)), Va(a, c, g) } } }), r.cssHooks.marginLeft = Oa(o.reliableMarginLeft, function (a, b) { if (b) return (parseFloat(Na(a, "marginLeft")) || a.getBoundingClientRect().left - da(a, { marginLeft: 0 }, function () { return a.getBoundingClientRect().left })) + "px" }), r.each({ margin: "", padding: "", border: "Width" }, function (a, b) { r.cssHooks[a + b] = { expand: function (c) { for (var d = 0, e = {}, f = "string" == typeof c ? c.split(" ") : [c]; d < 4; d++)e[a + ba[d] + b] = f[d] || f[d - 2] || f[0]; return e } }, Ka.test(a) || (r.cssHooks[a + b].set = Va) }), r.fn.extend({ css: function (a, b) { return S(this, function (a, b, c) { var d, e, f = {}, g = 0; if (r.isArray(b)) { for (d = Ma(a), e = b.length; g < e; g++)f[b[g]] = r.css(a, b[g], !1, d); return f } return void 0 !== c ? r.style(a, b, c) : r.css(a, b) }, a, b, arguments.length > 1) } }); function Ya(a, b, c, d, e) { return new Ya.prototype.init(a, b, c, d, e) } r.Tween = Ya, Ya.prototype = { constructor: Ya, init: function (a, b, c, d, e, f) { this.elem = a, this.prop = c, this.easing = e || r.easing._default, this.options = b, this.start = this.now = this.cur(), this.end = d, this.unit = f || (r.cssNumber[c] ? "" : "px") }, cur: function () { var a = Ya.propHooks[this.prop]; return a && a.get ? a.get(this) : Ya.propHooks._default.get(this) }, run: function (a) { var b, c = Ya.propHooks[this.prop]; return this.options.duration ? this.pos = b = r.easing[this.easing](a, this.options.duration * a, 0, 1, this.options.duration) : this.pos = b = a, this.now = (this.end - this.start) * b + this.start, this.options.step && this.options.step.call(this.elem, this.now, this), c && c.set ? c.set(this) : Ya.propHooks._default.set(this), this } }, Ya.prototype.init.prototype = Ya.prototype, Ya.propHooks = { _default: { get: function (a) { var b; return 1 !== a.elem.nodeType || null != a.elem[a.prop] && null == a.elem.style[a.prop] ? a.elem[a.prop] : (b = r.css(a.elem, a.prop, ""), b && "auto" !== b ? b : 0) }, set: function (a) { r.fx.step[a.prop] ? r.fx.step[a.prop](a) : 1 !== a.elem.nodeType || null == a.elem.style[r.cssProps[a.prop]] && !r.cssHooks[a.prop] ? a.elem[a.prop] = a.now : r.style(a.elem, a.prop, a.now + a.unit) } } }, Ya.propHooks.scrollTop = Ya.propHooks.scrollLeft = { set: function (a) { a.elem.nodeType && a.elem.parentNode && (a.elem[a.prop] = a.now) } }, r.easing = { linear: function (a) { return a }, swing: function (a) { return .5 - Math.cos(a * Math.PI) / 2 }, _default: "swing" }, r.fx = Ya.prototype.init, r.fx.step = {}; var Za, $a, _a = /^(?:toggle|show|hide)$/, ab = /queueHooks$/; function bb() { $a && (a.requestAnimationFrame(bb), r.fx.tick()) } function cb() { return a.setTimeout(function () { Za = void 0 }), Za = r.now() } function db(a, b) { var c, d = 0, e = { height: a }; for (b = b ? 1 : 0; d < 4; d += 2 - b)c = ba[d], e["margin" + c] = e["padding" + c] = a; return b && (e.opacity = e.width = a), e } function eb(a, b, c) { for (var d, e = (hb.tweeners[b] || []).concat(hb.tweeners["*"]), f = 0, g = e.length; f < g; f++)if (d = e[f].call(c, b, a)) return d } function fb(a, b, c) { var d, e, f, g, h, i, j, k, l = "width" in b || "height" in b, m = this, n = {}, o = a.style, p = a.nodeType && ca(a), q = V.get(a, "fxshow"); c.queue || (g = r._queueHooks(a, "fx"), null == g.unqueued && (g.unqueued = 0, h = g.empty.fire, g.empty.fire = function () { g.unqueued || h() }), g.unqueued++, m.always(function () { m.always(function () { g.unqueued--, r.queue(a, "fx").length || g.empty.fire() }) })); for (d in b) if (e = b[d], _a.test(e)) { if (delete b[d], f = f || "toggle" === e, e === (p ? "hide" : "show")) { if ("show" !== e || !q || void 0 === q[d]) continue; p = !0 } n[d] = q && q[d] || r.style(a, d) } if (i = !r.isEmptyObject(b), i || !r.isEmptyObject(n)) { l && 1 === a.nodeType && (c.overflow = [o.overflow, o.overflowX, o.overflowY], j = q && q.display, null == j && (j = V.get(a, "display")), k = r.css(a, "display"), "none" === k && (j ? k = j : (ha([a], !0), j = a.style.display || j, k = r.css(a, "display"), ha([a]))), ("inline" === k || "inline-block" === k && null != j) && "none" === r.css(a, "float") && (i || (m.done(function () { o.display = j }), null == j && (k = o.display, j = "none" === k ? "" : k)), o.display = "inline-block")), c.overflow && (o.overflow = "hidden", m.always(function () { o.overflow = c.overflow[0], o.overflowX = c.overflow[1], o.overflowY = c.overflow[2] })), i = !1; for (d in n) i || (q ? "hidden" in q && (p = q.hidden) : q = V.access(a, "fxshow", { display: j }), f && (q.hidden = !p), p && ha([a], !0), m.done(function () { p || ha([a]), V.remove(a, "fxshow"); for (d in n) r.style(a, d, n[d]) })), i = eb(p ? q[d] : 0, d, m), d in q || (q[d] = i.start, p && (i.end = i.start, i.start = 0)) } } function gb(a, b) { var c, d, e, f, g; for (c in a) if (d = r.camelCase(c), e = b[d], f = a[c], r.isArray(f) && (e = f[1], f = a[c] = f[0]), c !== d && (a[d] = f, delete a[c]), g = r.cssHooks[d], g && "expand" in g) { f = g.expand(f), delete a[d]; for (c in f) c in a || (a[c] = f[c], b[c] = e) } else b[d] = e } function hb(a, b, c) { var d, e, f = 0, g = hb.prefilters.length, h = r.Deferred().always(function () { delete i.elem }), i = function () { if (e) return !1; for (var b = Za || cb(), c = Math.max(0, j.startTime + j.duration - b), d = c / j.duration || 0, f = 1 - d, g = 0, i = j.tweens.length; g < i; g++)j.tweens[g].run(f); return h.notifyWith(a, [j, f, c]), f < 1 && i ? c : (h.resolveWith(a, [j]), !1) }, j = h.promise({ elem: a, props: r.extend({}, b), opts: r.extend(!0, { specialEasing: {}, easing: r.easing._default }, c), originalProperties: b, originalOptions: c, startTime: Za || cb(), duration: c.duration, tweens: [], createTween: function (b, c) { var d = r.Tween(a, j.opts, b, c, j.opts.specialEasing[b] || j.opts.easing); return j.tweens.push(d), d }, stop: function (b) { var c = 0, d = b ? j.tweens.length : 0; if (e) return this; for (e = !0; c < d; c++)j.tweens[c].run(1); return b ? (h.notifyWith(a, [j, 1, 0]), h.resolveWith(a, [j, b])) : h.rejectWith(a, [j, b]), this } }), k = j.props; for (gb(k, j.opts.specialEasing); f < g; f++)if (d = hb.prefilters[f].call(j, a, k, j.opts)) return r.isFunction(d.stop) && (r._queueHooks(j.elem, j.opts.queue).stop = r.proxy(d.stop, d)), d; return r.map(k, eb, j), r.isFunction(j.opts.start) && j.opts.start.call(a, j), r.fx.timer(r.extend(i, { elem: a, anim: j, queue: j.opts.queue })), j.progress(j.opts.progress).done(j.opts.done, j.opts.complete).fail(j.opts.fail).always(j.opts.always) } r.Animation = r.extend(hb, { tweeners: { "*": [function (a, b) { var c = this.createTween(a, b); return ea(c.elem, a, aa.exec(b), c), c }] }, tweener: function (a, b) { r.isFunction(a) ? (b = a, a = ["*"]) : a = a.match(K); for (var c, d = 0, e = a.length; d < e; d++)c = a[d], hb.tweeners[c] = hb.tweeners[c] || [], hb.tweeners[c].unshift(b) }, prefilters: [fb], prefilter: function (a, b) { b ? hb.prefilters.unshift(a) : hb.prefilters.push(a) } }), r.speed = function (a, b, c) { var e = a && "object" == typeof a ? r.extend({}, a) : { complete: c || !c && b || r.isFunction(a) && a, duration: a, easing: c && b || b && !r.isFunction(b) && b }; return r.fx.off || d.hidden ? e.duration = 0 : "number" != typeof e.duration && (e.duration in r.fx.speeds ? e.duration = r.fx.speeds[e.duration] : e.duration = r.fx.speeds._default), null != e.queue && e.queue !== !0 || (e.queue = "fx"), e.old = e.complete, e.complete = function () { r.isFunction(e.old) && e.old.call(this), e.queue && r.dequeue(this, e.queue) }, e }, r.fn.extend({ fadeTo: function (a, b, c, d) { return this.filter(ca).css("opacity", 0).show().end().animate({ opacity: b }, a, c, d) }, animate: function (a, b, c, d) { var e = r.isEmptyObject(a), f = r.speed(b, c, d), g = function () { var b = hb(this, r.extend({}, a), f); (e || V.get(this, "finish")) && b.stop(!0) }; return g.finish = g, e || f.queue === !1 ? this.each(g) : this.queue(f.queue, g) }, stop: function (a, b, c) { var d = function (a) { var b = a.stop; delete a.stop, b(c) }; return "string" != typeof a && (c = b, b = a, a = void 0), b && a !== !1 && this.queue(a || "fx", []), this.each(function () { var b = !0, e = null != a && a + "queueHooks", f = r.timers, g = V.get(this); if (e) g[e] && g[e].stop && d(g[e]); else for (e in g) g[e] && g[e].stop && ab.test(e) && d(g[e]); for (e = f.length; e--;)f[e].elem !== this || null != a && f[e].queue !== a || (f[e].anim.stop(c), b = !1, f.splice(e, 1)); !b && c || r.dequeue(this, a) }) }, finish: function (a) { return a !== !1 && (a = a || "fx"), this.each(function () { var b, c = V.get(this), d = c[a + "queue"], e = c[a + "queueHooks"], f = r.timers, g = d ? d.length : 0; for (c.finish = !0, r.queue(this, a, []), e && e.stop && e.stop.call(this, !0), b = f.length; b--;)f[b].elem === this && f[b].queue === a && (f[b].anim.stop(!0), f.splice(b, 1)); for (b = 0; b < g; b++)d[b] && d[b].finish && d[b].finish.call(this); delete c.finish }) } }), r.each(["toggle", "show", "hide"], function (a, b) { var c = r.fn[b]; r.fn[b] = function (a, d, e) { return null == a || "boolean" == typeof a ? c.apply(this, arguments) : this.animate(db(b, !0), a, d, e) } }), r.each({ slideDown: db("show"), slideUp: db("hide"), slideToggle: db("toggle"), fadeIn: { opacity: "show" }, fadeOut: { opacity: "hide" }, fadeToggle: { opacity: "toggle" } }, function (a, b) { r.fn[a] = function (a, c, d) { return this.animate(b, a, c, d) } }), r.timers = [], r.fx.tick = function () { var a, b = 0, c = r.timers; for (Za = r.now(); b < c.length; b++)a = c[b], a() || c[b] !== a || c.splice(b--, 1); c.length || r.fx.stop(), Za = void 0 }, r.fx.timer = function (a) { r.timers.push(a), a() ? r.fx.start() : r.timers.pop() }, r.fx.interval = 13, r.fx.start = function () { $a || ($a = a.requestAnimationFrame ? a.requestAnimationFrame(bb) : a.setInterval(r.fx.tick, r.fx.interval)) }, r.fx.stop = function () { a.cancelAnimationFrame ? a.cancelAnimationFrame($a) : a.clearInterval($a), $a = null }, r.fx.speeds = { slow: 600, fast: 200, _default: 400 }, r.fn.delay = function (b, c) { return b = r.fx ? r.fx.speeds[b] || b : b, c = c || "fx", this.queue(c, function (c, d) { var e = a.setTimeout(c, b); d.stop = function () { a.clearTimeout(e) } }) }, function () { var a = d.createElement("input"), b = d.createElement("select"), c = b.appendChild(d.createElement("option")); a.type = "checkbox", o.checkOn = "" !== a.value, o.optSelected = c.selected, a = d.createElement("input"), a.value = "t", a.type = "radio", o.radioValue = "t" === a.value }(); var ib, jb = r.expr.attrHandle; r.fn.extend({ attr: function (a, b) { return S(this, r.attr, a, b, arguments.length > 1) }, removeAttr: function (a) { return this.each(function () { r.removeAttr(this, a) }) } }), r.extend({
            attr: function (a, b, c) {
                var d, e, f = a.nodeType; if (3 !== f && 8 !== f && 2 !== f) return "undefined" == typeof a.getAttribute ? r.prop(a, b, c) : (1 === f && r.isXMLDoc(a) || (e = r.attrHooks[b.toLowerCase()] || (r.expr.match.bool.test(b) ? ib : void 0)),
                    void 0 !== c ? null === c ? void r.removeAttr(a, b) : e && "set" in e && void 0 !== (d = e.set(a, c, b)) ? d : (a.setAttribute(b, c + ""), c) : e && "get" in e && null !== (d = e.get(a, b)) ? d : (d = r.find.attr(a, b), null == d ? void 0 : d))
            }, attrHooks: { type: { set: function (a, b) { if (!o.radioValue && "radio" === b && r.nodeName(a, "input")) { var c = a.value; return a.setAttribute("type", b), c && (a.value = c), b } } } }, removeAttr: function (a, b) { var c, d = 0, e = b && b.match(K); if (e && 1 === a.nodeType) while (c = e[d++]) a.removeAttribute(c) }
        }), ib = { set: function (a, b, c) { return b === !1 ? r.removeAttr(a, c) : a.setAttribute(c, c), c } }, r.each(r.expr.match.bool.source.match(/\w+/g), function (a, b) { var c = jb[b] || r.find.attr; jb[b] = function (a, b, d) { var e, f, g = b.toLowerCase(); return d || (f = jb[g], jb[g] = e, e = null != c(a, b, d) ? g : null, jb[g] = f), e } }); var kb = /^(?:input|select|textarea|button)$/i, lb = /^(?:a|area)$/i; r.fn.extend({ prop: function (a, b) { return S(this, r.prop, a, b, arguments.length > 1) }, removeProp: function (a) { return this.each(function () { delete this[r.propFix[a] || a] }) } }), r.extend({ prop: function (a, b, c) { var d, e, f = a.nodeType; if (3 !== f && 8 !== f && 2 !== f) return 1 === f && r.isXMLDoc(a) || (b = r.propFix[b] || b, e = r.propHooks[b]), void 0 !== c ? e && "set" in e && void 0 !== (d = e.set(a, c, b)) ? d : a[b] = c : e && "get" in e && null !== (d = e.get(a, b)) ? d : a[b] }, propHooks: { tabIndex: { get: function (a) { var b = r.find.attr(a, "tabindex"); return b ? parseInt(b, 10) : kb.test(a.nodeName) || lb.test(a.nodeName) && a.href ? 0 : -1 } } }, propFix: { "for": "htmlFor", "class": "className" } }), o.optSelected || (r.propHooks.selected = { get: function (a) { var b = a.parentNode; return b && b.parentNode && b.parentNode.selectedIndex, null }, set: function (a) { var b = a.parentNode; b && (b.selectedIndex, b.parentNode && b.parentNode.selectedIndex) } }), r.each(["tabIndex", "readOnly", "maxLength", "cellSpacing", "cellPadding", "rowSpan", "colSpan", "useMap", "frameBorder", "contentEditable"], function () { r.propFix[this.toLowerCase()] = this }); function mb(a) { var b = a.match(K) || []; return b.join(" ") } function nb(a) { return a.getAttribute && a.getAttribute("class") || "" } r.fn.extend({ addClass: function (a) { var b, c, d, e, f, g, h, i = 0; if (r.isFunction(a)) return this.each(function (b) { r(this).addClass(a.call(this, b, nb(this))) }); if ("string" == typeof a && a) { b = a.match(K) || []; while (c = this[i++]) if (e = nb(c), d = 1 === c.nodeType && " " + mb(e) + " ") { g = 0; while (f = b[g++]) d.indexOf(" " + f + " ") < 0 && (d += f + " "); h = mb(d), e !== h && c.setAttribute("class", h) } } return this }, removeClass: function (a) { var b, c, d, e, f, g, h, i = 0; if (r.isFunction(a)) return this.each(function (b) { r(this).removeClass(a.call(this, b, nb(this))) }); if (!arguments.length) return this.attr("class", ""); if ("string" == typeof a && a) { b = a.match(K) || []; while (c = this[i++]) if (e = nb(c), d = 1 === c.nodeType && " " + mb(e) + " ") { g = 0; while (f = b[g++]) while (d.indexOf(" " + f + " ") > -1) d = d.replace(" " + f + " ", " "); h = mb(d), e !== h && c.setAttribute("class", h) } } return this }, toggleClass: function (a, b) { var c = typeof a; return "boolean" == typeof b && "string" === c ? b ? this.addClass(a) : this.removeClass(a) : r.isFunction(a) ? this.each(function (c) { r(this).toggleClass(a.call(this, c, nb(this), b), b) }) : this.each(function () { var b, d, e, f; if ("string" === c) { d = 0, e = r(this), f = a.match(K) || []; while (b = f[d++]) e.hasClass(b) ? e.removeClass(b) : e.addClass(b) } else void 0 !== a && "boolean" !== c || (b = nb(this), b && V.set(this, "__className__", b), this.setAttribute && this.setAttribute("class", b || a === !1 ? "" : V.get(this, "__className__") || "")) }) }, hasClass: function (a) { var b, c, d = 0; b = " " + a + " "; while (c = this[d++]) if (1 === c.nodeType && (" " + mb(nb(c)) + " ").indexOf(b) > -1) return !0; return !1 } }); var ob = /\r/g; r.fn.extend({ val: function (a) { var b, c, d, e = this[0]; { if (arguments.length) return d = r.isFunction(a), this.each(function (c) { var e; 1 === this.nodeType && (e = d ? a.call(this, c, r(this).val()) : a, null == e ? e = "" : "number" == typeof e ? e += "" : r.isArray(e) && (e = r.map(e, function (a) { return null == a ? "" : a + "" })), b = r.valHooks[this.type] || r.valHooks[this.nodeName.toLowerCase()], b && "set" in b && void 0 !== b.set(this, e, "value") || (this.value = e)) }); if (e) return b = r.valHooks[e.type] || r.valHooks[e.nodeName.toLowerCase()], b && "get" in b && void 0 !== (c = b.get(e, "value")) ? c : (c = e.value, "string" == typeof c ? c.replace(ob, "") : null == c ? "" : c) } } }), r.extend({ valHooks: { option: { get: function (a) { var b = r.find.attr(a, "value"); return null != b ? b : mb(r.text(a)) } }, select: { get: function (a) { var b, c, d, e = a.options, f = a.selectedIndex, g = "select-one" === a.type, h = g ? null : [], i = g ? f + 1 : e.length; for (d = f < 0 ? i : g ? f : 0; d < i; d++)if (c = e[d], (c.selected || d === f) && !c.disabled && (!c.parentNode.disabled || !r.nodeName(c.parentNode, "optgroup"))) { if (b = r(c).val(), g) return b; h.push(b) } return h }, set: function (a, b) { var c, d, e = a.options, f = r.makeArray(b), g = e.length; while (g--) d = e[g], (d.selected = r.inArray(r.valHooks.option.get(d), f) > -1) && (c = !0); return c || (a.selectedIndex = -1), f } } } }), r.each(["radio", "checkbox"], function () { r.valHooks[this] = { set: function (a, b) { if (r.isArray(b)) return a.checked = r.inArray(r(a).val(), b) > -1 } }, o.checkOn || (r.valHooks[this].get = function (a) { return null === a.getAttribute("value") ? "on" : a.value }) }); var pb = /^(?:focusinfocus|focusoutblur)$/; r.extend(r.event, { trigger: function (b, c, e, f) { var g, h, i, j, k, m, n, o = [e || d], p = l.call(b, "type") ? b.type : b, q = l.call(b, "namespace") ? b.namespace.split(".") : []; if (h = i = e = e || d, 3 !== e.nodeType && 8 !== e.nodeType && !pb.test(p + r.event.triggered) && (p.indexOf(".") > -1 && (q = p.split("."), p = q.shift(), q.sort()), k = p.indexOf(":") < 0 && "on" + p, b = b[r.expando] ? b : new r.Event(p, "object" == typeof b && b), b.isTrigger = f ? 2 : 3, b.namespace = q.join("."), b.rnamespace = b.namespace ? new RegExp("(^|\\.)" + q.join("\\.(?:.*\\.|)") + "(\\.|$)") : null, b.result = void 0, b.target || (b.target = e), c = null == c ? [b] : r.makeArray(c, [b]), n = r.event.special[p] || {}, f || !n.trigger || n.trigger.apply(e, c) !== !1)) { if (!f && !n.noBubble && !r.isWindow(e)) { for (j = n.delegateType || p, pb.test(j + p) || (h = h.parentNode); h; h = h.parentNode)o.push(h), i = h; i === (e.ownerDocument || d) && o.push(i.defaultView || i.parentWindow || a) } g = 0; while ((h = o[g++]) && !b.isPropagationStopped()) b.type = g > 1 ? j : n.bindType || p, m = (V.get(h, "events") || {})[b.type] && V.get(h, "handle"), m && m.apply(h, c), m = k && h[k], m && m.apply && T(h) && (b.result = m.apply(h, c), b.result === !1 && b.preventDefault()); return b.type = p, f || b.isDefaultPrevented() || n._default && n._default.apply(o.pop(), c) !== !1 || !T(e) || k && r.isFunction(e[p]) && !r.isWindow(e) && (i = e[k], i && (e[k] = null), r.event.triggered = p, e[p](), r.event.triggered = void 0, i && (e[k] = i)), b.result } }, simulate: function (a, b, c) { var d = r.extend(new r.Event, c, { type: a, isSimulated: !0 }); r.event.trigger(d, null, b) } }), r.fn.extend({ trigger: function (a, b) { return this.each(function () { r.event.trigger(a, b, this) }) }, triggerHandler: function (a, b) { var c = this[0]; if (c) return r.event.trigger(a, b, c, !0) } }), r.each("blur focus focusin focusout resize scroll click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup contextmenu".split(" "), function (a, b) { r.fn[b] = function (a, c) { return arguments.length > 0 ? this.on(b, null, a, c) : this.trigger(b) } }), r.fn.extend({ hover: function (a, b) { return this.mouseenter(a).mouseleave(b || a) } }), o.focusin = "onfocusin" in a, o.focusin || r.each({ focus: "focusin", blur: "focusout" }, function (a, b) { var c = function (a) { r.event.simulate(b, a.target, r.event.fix(a)) }; r.event.special[b] = { setup: function () { var d = this.ownerDocument || this, e = V.access(d, b); e || d.addEventListener(a, c, !0), V.access(d, b, (e || 0) + 1) }, teardown: function () { var d = this.ownerDocument || this, e = V.access(d, b) - 1; e ? V.access(d, b, e) : (d.removeEventListener(a, c, !0), V.remove(d, b)) } } }); var qb = a.location, rb = r.now(), sb = /\?/; r.parseXML = function (b) { var c; if (!b || "string" != typeof b) return null; try { c = (new a.DOMParser).parseFromString(b, "text/xml") } catch (d) { c = void 0 } return c && !c.getElementsByTagName("parsererror").length || r.error("Invalid XML: " + b), c }; var tb = /\[\]$/, ub = /\r?\n/g, vb = /^(?:submit|button|image|reset|file)$/i, wb = /^(?:input|select|textarea|keygen)/i; function xb(a, b, c, d) { var e; if (r.isArray(b)) r.each(b, function (b, e) { c || tb.test(a) ? d(a, e) : xb(a + "[" + ("object" == typeof e && null != e ? b : "") + "]", e, c, d) }); else if (c || "object" !== r.type(b)) d(a, b); else for (e in b) xb(a + "[" + e + "]", b[e], c, d) } r.param = function (a, b) { var c, d = [], e = function (a, b) { var c = r.isFunction(b) ? b() : b; d[d.length] = encodeURIComponent(a) + "=" + encodeURIComponent(null == c ? "" : c) }; if (r.isArray(a) || a.jquery && !r.isPlainObject(a)) r.each(a, function () { e(this.name, this.value) }); else for (c in a) xb(c, a[c], b, e); return d.join("&") }, r.fn.extend({ serialize: function () { return r.param(this.serializeArray()) }, serializeArray: function () { return this.map(function () { var a = r.prop(this, "elements"); return a ? r.makeArray(a) : this }).filter(function () { var a = this.type; return this.name && !r(this).is(":disabled") && wb.test(this.nodeName) && !vb.test(a) && (this.checked || !ia.test(a)) }).map(function (a, b) { var c = r(this).val(); return null == c ? null : r.isArray(c) ? r.map(c, function (a) { return { name: b.name, value: a.replace(ub, "\r\n") } }) : { name: b.name, value: c.replace(ub, "\r\n") } }).get() } }); var yb = /%20/g, zb = /#.*$/, Ab = /([?&])_=[^&]*/, Bb = /^(.*?):[ \t]*([^\r\n]*)$/gm, Cb = /^(?:about|app|app-storage|.+-extension|file|res|widget):$/, Db = /^(?:GET|HEAD)$/, Eb = /^\/\//, Fb = {}, Gb = {}, Hb = "*/".concat("*"), Ib = d.createElement("a"); Ib.href = qb.href; function Jb(a) { return function (b, c) { "string" != typeof b && (c = b, b = "*"); var d, e = 0, f = b.toLowerCase().match(K) || []; if (r.isFunction(c)) while (d = f[e++]) "+" === d[0] ? (d = d.slice(1) || "*", (a[d] = a[d] || []).unshift(c)) : (a[d] = a[d] || []).push(c) } } function Kb(a, b, c, d) { var e = {}, f = a === Gb; function g(h) { var i; return e[h] = !0, r.each(a[h] || [], function (a, h) { var j = h(b, c, d); return "string" != typeof j || f || e[j] ? f ? !(i = j) : void 0 : (b.dataTypes.unshift(j), g(j), !1) }), i } return g(b.dataTypes[0]) || !e["*"] && g("*") } function Lb(a, b) { var c, d, e = r.ajaxSettings.flatOptions || {}; for (c in b) void 0 !== b[c] && ((e[c] ? a : d || (d = {}))[c] = b[c]); return d && r.extend(!0, a, d), a } function Mb(a, b, c) { var d, e, f, g, h = a.contents, i = a.dataTypes; while ("*" === i[0]) i.shift(), void 0 === d && (d = a.mimeType || b.getResponseHeader("Content-Type")); if (d) for (e in h) if (h[e] && h[e].test(d)) { i.unshift(e); break } if (i[0] in c) f = i[0]; else { for (e in c) { if (!i[0] || a.converters[e + " " + i[0]]) { f = e; break } g || (g = e) } f = f || g } if (f) return f !== i[0] && i.unshift(f), c[f] } function Nb(a, b, c, d) { var e, f, g, h, i, j = {}, k = a.dataTypes.slice(); if (k[1]) for (g in a.converters) j[g.toLowerCase()] = a.converters[g]; f = k.shift(); while (f) if (a.responseFields[f] && (c[a.responseFields[f]] = b), !i && d && a.dataFilter && (b = a.dataFilter(b, a.dataType)), i = f, f = k.shift()) if ("*" === f) f = i; else if ("*" !== i && i !== f) { if (g = j[i + " " + f] || j["* " + f], !g) for (e in j) if (h = e.split(" "), h[1] === f && (g = j[i + " " + h[0]] || j["* " + h[0]])) { g === !0 ? g = j[e] : j[e] !== !0 && (f = h[0], k.unshift(h[1])); break } if (g !== !0) if (g && a["throws"]) b = g(b); else try { b = g(b) } catch (l) { return { state: "parsererror", error: g ? l : "No conversion from " + i + " to " + f } } } return { state: "success", data: b } } r.extend({ active: 0, lastModified: {}, etag: {}, ajaxSettings: { url: qb.href, type: "GET", isLocal: Cb.test(qb.protocol), global: !0, processData: !0, async: !0, contentType: "application/x-www-form-urlencoded; charset=UTF-8", accepts: { "*": Hb, text: "text/plain", html: "text/html", xml: "application/xml, text/xml", json: "application/json, text/javascript" }, contents: { xml: /\bxml\b/, html: /\bhtml/, json: /\bjson\b/ }, responseFields: { xml: "responseXML", text: "responseText", json: "responseJSON" }, converters: { "* text": String, "text html": !0, "text json": JSON.parse, "text xml": r.parseXML }, flatOptions: { url: !0, context: !0 } }, ajaxSetup: function (a, b) { return b ? Lb(Lb(a, r.ajaxSettings), b) : Lb(r.ajaxSettings, a) }, ajaxPrefilter: Jb(Fb), ajaxTransport: Jb(Gb), ajax: function (b, c) { "object" == typeof b && (c = b, b = void 0), c = c || {}; var e, f, g, h, i, j, k, l, m, n, o = r.ajaxSetup({}, c), p = o.context || o, q = o.context && (p.nodeType || p.jquery) ? r(p) : r.event, s = r.Deferred(), t = r.Callbacks("once memory"), u = o.statusCode || {}, v = {}, w = {}, x = "canceled", y = { readyState: 0, getResponseHeader: function (a) { var b; if (k) { if (!h) { h = {}; while (b = Bb.exec(g)) h[b[1].toLowerCase()] = b[2] } b = h[a.toLowerCase()] } return null == b ? null : b }, getAllResponseHeaders: function () { return k ? g : null }, setRequestHeader: function (a, b) { return null == k && (a = w[a.toLowerCase()] = w[a.toLowerCase()] || a, v[a] = b), this }, overrideMimeType: function (a) { return null == k && (o.mimeType = a), this }, statusCode: function (a) { var b; if (a) if (k) y.always(a[y.status]); else for (b in a) u[b] = [u[b], a[b]]; return this }, abort: function (a) { var b = a || x; return e && e.abort(b), A(0, b), this } }; if (s.promise(y), o.url = ((b || o.url || qb.href) + "").replace(Eb, qb.protocol + "//"), o.type = c.method || c.type || o.method || o.type, o.dataTypes = (o.dataType || "*").toLowerCase().match(K) || [""], null == o.crossDomain) { j = d.createElement("a"); try { j.href = o.url, j.href = j.href, o.crossDomain = Ib.protocol + "//" + Ib.host != j.protocol + "//" + j.host } catch (z) { o.crossDomain = !0 } } if (o.data && o.processData && "string" != typeof o.data && (o.data = r.param(o.data, o.traditional)), Kb(Fb, o, c, y), k) return y; l = r.event && o.global, l && 0 === r.active++ && r.event.trigger("ajaxStart"), o.type = o.type.toUpperCase(), o.hasContent = !Db.test(o.type), f = o.url.replace(zb, ""), o.hasContent ? o.data && o.processData && 0 === (o.contentType || "").indexOf("application/x-www-form-urlencoded") && (o.data = o.data.replace(yb, "+")) : (n = o.url.slice(f.length), o.data && (f += (sb.test(f) ? "&" : "?") + o.data, delete o.data), o.cache === !1 && (f = f.replace(Ab, "$1"), n = (sb.test(f) ? "&" : "?") + "_=" + rb++ + n), o.url = f + n), o.ifModified && (r.lastModified[f] && y.setRequestHeader("If-Modified-Since", r.lastModified[f]), r.etag[f] && y.setRequestHeader("If-None-Match", r.etag[f])), (o.data && o.hasContent && o.contentType !== !1 || c.contentType) && y.setRequestHeader("Content-Type", o.contentType), y.setRequestHeader("Accept", o.dataTypes[0] && o.accepts[o.dataTypes[0]] ? o.accepts[o.dataTypes[0]] + ("*" !== o.dataTypes[0] ? ", " + Hb + "; q=0.01" : "") : o.accepts["*"]); for (m in o.headers) y.setRequestHeader(m, o.headers[m]); if (o.beforeSend && (o.beforeSend.call(p, y, o) === !1 || k)) return y.abort(); if (x = "abort", t.add(o.complete), y.done(o.success), y.fail(o.error), e = Kb(Gb, o, c, y)) { if (y.readyState = 1, l && q.trigger("ajaxSend", [y, o]), k) return y; o.async && o.timeout > 0 && (i = a.setTimeout(function () { y.abort("timeout") }, o.timeout)); try { k = !1, e.send(v, A) } catch (z) { if (k) throw z; A(-1, z) } } else A(-1, "No Transport"); function A(b, c, d, h) { var j, m, n, v, w, x = c; k || (k = !0, i && a.clearTimeout(i), e = void 0, g = h || "", y.readyState = b > 0 ? 4 : 0, j = b >= 200 && b < 300 || 304 === b, d && (v = Mb(o, y, d)), v = Nb(o, v, y, j), j ? (o.ifModified && (w = y.getResponseHeader("Last-Modified"), w && (r.lastModified[f] = w), w = y.getResponseHeader("etag"), w && (r.etag[f] = w)), 204 === b || "HEAD" === o.type ? x = "nocontent" : 304 === b ? x = "notmodified" : (x = v.state, m = v.data, n = v.error, j = !n)) : (n = x, !b && x || (x = "error", b < 0 && (b = 0))), y.status = b, y.statusText = (c || x) + "", j ? s.resolveWith(p, [m, x, y]) : s.rejectWith(p, [y, x, n]), y.statusCode(u), u = void 0, l && q.trigger(j ? "ajaxSuccess" : "ajaxError", [y, o, j ? m : n]), t.fireWith(p, [y, x]), l && (q.trigger("ajaxComplete", [y, o]), --r.active || r.event.trigger("ajaxStop"))) } return y }, getJSON: function (a, b, c) { return r.get(a, b, c, "json") }, getScript: function (a, b) { return r.get(a, void 0, b, "script") } }), r.each(["get", "post"], function (a, b) { r[b] = function (a, c, d, e) { return r.isFunction(c) && (e = e || d, d = c, c = void 0), r.ajax(r.extend({ url: a, type: b, dataType: e, data: c, success: d }, r.isPlainObject(a) && a)) } }), r._evalUrl = function (a) { return r.ajax({ url: a, type: "GET", dataType: "script", cache: !0, async: !1, global: !1, "throws": !0 }) }, r.fn.extend({ wrapAll: function (a) { var b; return this[0] && (r.isFunction(a) && (a = a.call(this[0])), b = r(a, this[0].ownerDocument).eq(0).clone(!0), this[0].parentNode && b.insertBefore(this[0]), b.map(function () { var a = this; while (a.firstElementChild) a = a.firstElementChild; return a }).append(this)), this }, wrapInner: function (a) { return r.isFunction(a) ? this.each(function (b) { r(this).wrapInner(a.call(this, b)) }) : this.each(function () { var b = r(this), c = b.contents(); c.length ? c.wrapAll(a) : b.append(a) }) }, wrap: function (a) { var b = r.isFunction(a); return this.each(function (c) { r(this).wrapAll(b ? a.call(this, c) : a) }) }, unwrap: function (a) { return this.parent(a).not("body").each(function () { r(this).replaceWith(this.childNodes) }), this } }), r.expr.pseudos.hidden = function (a) { return !r.expr.pseudos.visible(a) }, r.expr.pseudos.visible = function (a) { return !!(a.offsetWidth || a.offsetHeight || a.getClientRects().length) }, r.ajaxSettings.xhr = function () { try { return new a.XMLHttpRequest } catch (b) { } }; var Ob = { 0: 200, 1223: 204 }, Pb = r.ajaxSettings.xhr(); o.cors = !!Pb && "withCredentials" in Pb, o.ajax = Pb = !!Pb, r.ajaxTransport(function (b) { var c, d; if (o.cors || Pb && !b.crossDomain) return { send: function (e, f) { var g, h = b.xhr(); if (h.open(b.type, b.url, b.async, b.username, b.password), b.xhrFields) for (g in b.xhrFields) h[g] = b.xhrFields[g]; b.mimeType && h.overrideMimeType && h.overrideMimeType(b.mimeType), b.crossDomain || e["X-Requested-With"] || (e["X-Requested-With"] = "XMLHttpRequest"); for (g in e) h.setRequestHeader(g, e[g]); c = function (a) { return function () { c && (c = d = h.onload = h.onerror = h.onabort = h.onreadystatechange = null, "abort" === a ? h.abort() : "error" === a ? "number" != typeof h.status ? f(0, "error") : f(h.status, h.statusText) : f(Ob[h.status] || h.status, h.statusText, "text" !== (h.responseType || "text") || "string" != typeof h.responseText ? { binary: h.response } : { text: h.responseText }, h.getAllResponseHeaders())) } }, h.onload = c(), d = h.onerror = c("error"), void 0 !== h.onabort ? h.onabort = d : h.onreadystatechange = function () { 4 === h.readyState && a.setTimeout(function () { c && d() }) }, c = c("abort"); try { h.send(b.hasContent && b.data || null) } catch (i) { if (c) throw i } }, abort: function () { c && c() } } }), r.ajaxPrefilter(function (a) { a.crossDomain && (a.contents.script = !1) }), r.ajaxSetup({ accepts: { script: "text/javascript, application/javascript, application/ecmascript, application/x-ecmascript" }, contents: { script: /\b(?:java|ecma)script\b/ }, converters: { "text script": function (a) { return r.globalEval(a), a } } }), r.ajaxPrefilter("script", function (a) { void 0 === a.cache && (a.cache = !1), a.crossDomain && (a.type = "GET") }), r.ajaxTransport("script", function (a) { if (a.crossDomain) { var b, c; return { send: function (e, f) { b = r("<script>").prop({ charset: a.scriptCharset, src: a.url }).on("load error", c = function (a) { b.remove(), c = null, a && f("error" === a.type ? 404 : 200, a.type) }), d.head.appendChild(b[0]) }, abort: function () { c && c() } } } }); var Qb = [], Rb = /(=)\?(?=&|$)|\?\?/; r.ajaxSetup({ jsonp: "callback", jsonpCallback: function () { var a = Qb.pop() || r.expando + "_" + rb++; return this[a] = !0, a } }), r.ajaxPrefilter("json jsonp", function (b, c, d) { var e, f, g, h = b.jsonp !== !1 && (Rb.test(b.url) ? "url" : "string" == typeof b.data && 0 === (b.contentType || "").indexOf("application/x-www-form-urlencoded") && Rb.test(b.data) && "data"); if (h || "jsonp" === b.dataTypes[0]) return e = b.jsonpCallback = r.isFunction(b.jsonpCallback) ? b.jsonpCallback() : b.jsonpCallback, h ? b[h] = b[h].replace(Rb, "$1" + e) : b.jsonp !== !1 && (b.url += (sb.test(b.url) ? "&" : "?") + b.jsonp + "=" + e), b.converters["script json"] = function () { return g || r.error(e + " was not called"), g[0] }, b.dataTypes[0] = "json", f = a[e], a[e] = function () { g = arguments }, d.always(function () { void 0 === f ? r(a).removeProp(e) : a[e] = f, b[e] && (b.jsonpCallback = c.jsonpCallback, Qb.push(e)), g && r.isFunction(f) && f(g[0]), g = f = void 0 }), "script" }), o.createHTMLDocument = function () { var a = d.implementation.createHTMLDocument("").body; return a.innerHTML = "<form></form><form></form>", 2 === a.childNodes.length }(), r.parseHTML = function (a, b, c) { if ("string" != typeof a) return []; "boolean" == typeof b && (c = b, b = !1); var e, f, g; return b || (o.createHTMLDocument ? (b = d.implementation.createHTMLDocument(""), e = b.createElement("base"), e.href = d.location.href, b.head.appendChild(e)) : b = d), f = B.exec(a), g = !c && [], f ? [b.createElement(f[1])] : (f = pa([a], b, g), g && g.length && r(g).remove(), r.merge([], f.childNodes)) }, r.fn.load = function (a, b, c) { var d, e, f, g = this, h = a.indexOf(" "); return h > -1 && (d = mb(a.slice(h)), a = a.slice(0, h)), r.isFunction(b) ? (c = b, b = void 0) : b && "object" == typeof b && (e = "POST"), g.length > 0 && r.ajax({ url: a, type: e || "GET", dataType: "html", data: b }).done(function (a) { f = arguments, g.html(d ? r("<div>").append(r.parseHTML(a)).find(d) : a) }).always(c && function (a, b) { g.each(function () { c.apply(this, f || [a.responseText, b, a]) }) }), this }, r.each(["ajaxStart", "ajaxStop", "ajaxComplete", "ajaxError", "ajaxSuccess", "ajaxSend"], function (a, b) { r.fn[b] = function (a) { return this.on(b, a) } }), r.expr.pseudos.animated = function (a) { return r.grep(r.timers, function (b) { return a === b.elem }).length }; function Sb(a) { return r.isWindow(a) ? a : 9 === a.nodeType && a.defaultView } r.offset = { setOffset: function (a, b, c) { var d, e, f, g, h, i, j, k = r.css(a, "position"), l = r(a), m = {}; "static" === k && (a.style.position = "relative"), h = l.offset(), f = r.css(a, "top"), i = r.css(a, "left"), j = ("absolute" === k || "fixed" === k) && (f + i).indexOf("auto") > -1, j ? (d = l.position(), g = d.top, e = d.left) : (g = parseFloat(f) || 0, e = parseFloat(i) || 0), r.isFunction(b) && (b = b.call(a, c, r.extend({}, h))), null != b.top && (m.top = b.top - h.top + g), null != b.left && (m.left = b.left - h.left + e), "using" in b ? b.using.call(a, m) : l.css(m) } }, r.fn.extend({ offset: function (a) { if (arguments.length) return void 0 === a ? this : this.each(function (b) { r.offset.setOffset(this, a, b) }); var b, c, d, e, f = this[0]; if (f) return f.getClientRects().length ? (d = f.getBoundingClientRect(), d.width || d.height ? (e = f.ownerDocument, c = Sb(e), b = e.documentElement, { top: d.top + c.pageYOffset - b.clientTop, left: d.left + c.pageXOffset - b.clientLeft }) : d) : { top: 0, left: 0 } }, position: function () { if (this[0]) { var a, b, c = this[0], d = { top: 0, left: 0 }; return "fixed" === r.css(c, "position") ? b = c.getBoundingClientRect() : (a = this.offsetParent(), b = this.offset(), r.nodeName(a[0], "html") || (d = a.offset()), d = { top: d.top + r.css(a[0], "borderTopWidth", !0), left: d.left + r.css(a[0], "borderLeftWidth", !0) }), { top: b.top - d.top - r.css(c, "marginTop", !0), left: b.left - d.left - r.css(c, "marginLeft", !0) } } }, offsetParent: function () { return this.map(function () { var a = this.offsetParent; while (a && "static" === r.css(a, "position")) a = a.offsetParent; return a || qa }) } }), r.each({ scrollLeft: "pageXOffset", scrollTop: "pageYOffset" }, function (a, b) { var c = "pageYOffset" === b; r.fn[a] = function (d) { return S(this, function (a, d, e) { var f = Sb(a); return void 0 === e ? f ? f[b] : a[d] : void (f ? f.scrollTo(c ? f.pageXOffset : e, c ? e : f.pageYOffset) : a[d] = e) }, a, d, arguments.length) } }), r.each(["top", "left"], function (a, b) { r.cssHooks[b] = Oa(o.pixelPosition, function (a, c) { if (c) return c = Na(a, b), La.test(c) ? r(a).position()[b] + "px" : c }) }), r.each({ Height: "height", Width: "width" }, function (a, b) { r.each({ padding: "inner" + a, content: b, "": "outer" + a }, function (c, d) { r.fn[d] = function (e, f) { var g = arguments.length && (c || "boolean" != typeof e), h = c || (e === !0 || f === !0 ? "margin" : "border"); return S(this, function (b, c, e) { var f; return r.isWindow(b) ? 0 === d.indexOf("outer") ? b["inner" + a] : b.document.documentElement["client" + a] : 9 === b.nodeType ? (f = b.documentElement, Math.max(b.body["scroll" + a], f["scroll" + a], b.body["offset" + a], f["offset" + a], f["client" + a])) : void 0 === e ? r.css(b, c, h) : r.style(b, c, e, h) }, b, g ? e : void 0, g) } }) }), r.fn.extend({ bind: function (a, b, c) { return this.on(a, null, b, c) }, unbind: function (a, b) { return this.off(a, null, b) }, delegate: function (a, b, c, d) { return this.on(b, a, c, d) }, undelegate: function (a, b, c) { return 1 === arguments.length ? this.off(a, "**") : this.off(b, a || "**", c) } }), r.parseJSON = JSON.parse, "function" == typeof define && define.amd && define("jquery", [], function () { return r }); var Tb = a.jQuery, Ub = a.$; return r.noConflict = function (b) { return a.$ === r && (a.$ = Ub), b && a.jQuery === r && (a.jQuery = Tb), r }, b || (a.jQuery = a.$ = r), r
    });
</script>


<script type="text/javascript">/*! jQuery UI - v1.12.1 - 2016-12-22
                        * http://jqueryui.com
                        * Includes: widget.js, data.js, scroll-parent.js, widgets/sortable.js, widgets/mouse.js
                        * Copyright jQuery Foundation and other contributors; Licensed MIT */

    (function (t) { "function" == typeof define && define.amd ? define(["jquery"], t) : t(jQuery) })(function (t) {
        t.ui = t.ui || {}, t.ui.version = "1.12.1"; var e = 0, i = Array.prototype.slice; t.cleanData = function (e) { return function (i) { var s, n, o; for (o = 0; null != (n = i[o]); o++)try { s = t._data(n, "events"), s && s.remove && t(n).triggerHandler("remove") } catch (a) { } e(i) } }(t.cleanData), t.widget = function (e, i, s) { var n, o, a, r = {}, l = e.split(".")[0]; e = e.split(".")[1]; var h = l + "-" + e; return s || (s = i, i = t.Widget), t.isArray(s) && (s = t.extend.apply(null, [{}].concat(s))), t.expr[":"][h.toLowerCase()] = function (e) { return !!t.data(e, h) }, t[l] = t[l] || {}, n = t[l][e], o = t[l][e] = function (t, e) { return this._createWidget ? (arguments.length && this._createWidget(t, e), void 0) : new o(t, e) }, t.extend(o, n, { version: s.version, _proto: t.extend({}, s), _childConstructors: [] }), a = new i, a.options = t.widget.extend({}, a.options), t.each(s, function (e, s) { return t.isFunction(s) ? (r[e] = function () { function t() { return i.prototype[e].apply(this, arguments) } function n(t) { return i.prototype[e].apply(this, t) } return function () { var e, i = this._super, o = this._superApply; return this._super = t, this._superApply = n, e = s.apply(this, arguments), this._super = i, this._superApply = o, e } }(), void 0) : (r[e] = s, void 0) }), o.prototype = t.widget.extend(a, { widgetEventPrefix: n ? a.widgetEventPrefix || e : e }, r, { constructor: o, namespace: l, widgetName: e, widgetFullName: h }), n ? (t.each(n._childConstructors, function (e, i) { var s = i.prototype; t.widget(s.namespace + "." + s.widgetName, o, i._proto) }), delete n._childConstructors) : i._childConstructors.push(o), t.widget.bridge(e, o), o }, t.widget.extend = function (e) { for (var s, n, o = i.call(arguments, 1), a = 0, r = o.length; r > a; a++)for (s in o[a]) n = o[a][s], o[a].hasOwnProperty(s) && void 0 !== n && (e[s] = t.isPlainObject(n) ? t.isPlainObject(e[s]) ? t.widget.extend({}, e[s], n) : t.widget.extend({}, n) : n); return e }, t.widget.bridge = function (e, s) { var n = s.prototype.widgetFullName || e; t.fn[e] = function (o) { var a = "string" == typeof o, r = i.call(arguments, 1), l = this; return a ? this.length || "instance" !== o ? this.each(function () { var i, s = t.data(this, n); return "instance" === o ? (l = s, !1) : s ? t.isFunction(s[o]) && "_" !== o.charAt(0) ? (i = s[o].apply(s, r), i !== s && void 0 !== i ? (l = i && i.jquery ? l.pushStack(i.get()) : i, !1) : void 0) : t.error("no such method '" + o + "' for " + e + " widget instance") : t.error("cannot call methods on " + e + " prior to initialization; " + "attempted to call method '" + o + "'") }) : l = void 0 : (r.length && (o = t.widget.extend.apply(null, [o].concat(r))), this.each(function () { var e = t.data(this, n); e ? (e.option(o || {}), e._init && e._init()) : t.data(this, n, new s(o, this)) })), l } }, t.Widget = function () { }, t.Widget._childConstructors = [], t.Widget.prototype = { widgetName: "widget", widgetEventPrefix: "", defaultElement: "<div>", options: { classes: {}, disabled: !1, create: null }, _createWidget: function (i, s) { s = t(s || this.defaultElement || this)[0], this.element = t(s), this.uuid = e++, this.eventNamespace = "." + this.widgetName + this.uuid, this.bindings = t(), this.hoverable = t(), this.focusable = t(), this.classesElementLookup = {}, s !== this && (t.data(s, this.widgetFullName, this), this._on(!0, this.element, { remove: function (t) { t.target === s && this.destroy() } }), this.document = t(s.style ? s.ownerDocument : s.document || s), this.window = t(this.document[0].defaultView || this.document[0].parentWindow)), this.options = t.widget.extend({}, this.options, this._getCreateOptions(), i), this._create(), this.options.disabled && this._setOptionDisabled(this.options.disabled), this._trigger("create", null, this._getCreateEventData()), this._init() }, _getCreateOptions: function () { return {} }, _getCreateEventData: t.noop, _create: t.noop, _init: t.noop, destroy: function () { var e = this; this._destroy(), t.each(this.classesElementLookup, function (t, i) { e._removeClass(i, t) }), this.element.off(this.eventNamespace).removeData(this.widgetFullName), this.widget().off(this.eventNamespace).removeAttr("aria-disabled"), this.bindings.off(this.eventNamespace) }, _destroy: t.noop, widget: function () { return this.element }, option: function (e, i) { var s, n, o, a = e; if (0 === arguments.length) return t.widget.extend({}, this.options); if ("string" == typeof e) if (a = {}, s = e.split("."), e = s.shift(), s.length) { for (n = a[e] = t.widget.extend({}, this.options[e]), o = 0; s.length - 1 > o; o++)n[s[o]] = n[s[o]] || {}, n = n[s[o]]; if (e = s.pop(), 1 === arguments.length) return void 0 === n[e] ? null : n[e]; n[e] = i } else { if (1 === arguments.length) return void 0 === this.options[e] ? null : this.options[e]; a[e] = i } return this._setOptions(a), this }, _setOptions: function (t) { var e; for (e in t) this._setOption(e, t[e]); return this }, _setOption: function (t, e) { return "classes" === t && this._setOptionClasses(e), this.options[t] = e, "disabled" === t && this._setOptionDisabled(e), this }, _setOptionClasses: function (e) { var i, s, n; for (i in e) n = this.classesElementLookup[i], e[i] !== this.options.classes[i] && n && n.length && (s = t(n.get()), this._removeClass(n, i), s.addClass(this._classes({ element: s, keys: i, classes: e, add: !0 }))) }, _setOptionDisabled: function (t) { this._toggleClass(this.widget(), this.widgetFullName + "-disabled", null, !!t), t && (this._removeClass(this.hoverable, null, "ui-state-hover"), this._removeClass(this.focusable, null, "ui-state-focus")) }, enable: function () { return this._setOptions({ disabled: !1 }) }, disable: function () { return this._setOptions({ disabled: !0 }) }, _classes: function (e) { function i(i, o) { var a, r; for (r = 0; i.length > r; r++)a = n.classesElementLookup[i[r]] || t(), a = e.add ? t(t.unique(a.get().concat(e.element.get()))) : t(a.not(e.element).get()), n.classesElementLookup[i[r]] = a, s.push(i[r]), o && e.classes[i[r]] && s.push(e.classes[i[r]]) } var s = [], n = this; return e = t.extend({ element: this.element, classes: this.options.classes || {} }, e), this._on(e.element, { remove: "_untrackClassesElement" }), e.keys && i(e.keys.match(/\S+/g) || [], !0), e.extra && i(e.extra.match(/\S+/g) || []), s.join(" ") }, _untrackClassesElement: function (e) { var i = this; t.each(i.classesElementLookup, function (s, n) { -1 !== t.inArray(e.target, n) && (i.classesElementLookup[s] = t(n.not(e.target).get())) }) }, _removeClass: function (t, e, i) { return this._toggleClass(t, e, i, !1) }, _addClass: function (t, e, i) { return this._toggleClass(t, e, i, !0) }, _toggleClass: function (t, e, i, s) { s = "boolean" == typeof s ? s : i; var n = "string" == typeof t || null === t, o = { extra: n ? e : i, keys: n ? t : e, element: n ? this.element : t, add: s }; return o.element.toggleClass(this._classes(o), s), this }, _on: function (e, i, s) { var n, o = this; "boolean" != typeof e && (s = i, i = e, e = !1), s ? (i = n = t(i), this.bindings = this.bindings.add(i)) : (s = i, i = this.element, n = this.widget()), t.each(s, function (s, a) { function r() { return e || o.options.disabled !== !0 && !t(this).hasClass("ui-state-disabled") ? ("string" == typeof a ? o[a] : a).apply(o, arguments) : void 0 } "string" != typeof a && (r.guid = a.guid = a.guid || r.guid || t.guid++); var l = s.match(/^([\w:-]*)\s*(.*)$/), h = l[1] + o.eventNamespace, c = l[2]; c ? n.on(h, c, r) : i.on(h, r) }) }, _off: function (e, i) { i = (i || "").split(" ").join(this.eventNamespace + " ") + this.eventNamespace, e.off(i).off(i), this.bindings = t(this.bindings.not(e).get()), this.focusable = t(this.focusable.not(e).get()), this.hoverable = t(this.hoverable.not(e).get()) }, _delay: function (t, e) { function i() { return ("string" == typeof t ? s[t] : t).apply(s, arguments) } var s = this; return setTimeout(i, e || 0) }, _hoverable: function (e) { this.hoverable = this.hoverable.add(e), this._on(e, { mouseenter: function (e) { this._addClass(t(e.currentTarget), null, "ui-state-hover") }, mouseleave: function (e) { this._removeClass(t(e.currentTarget), null, "ui-state-hover") } }) }, _focusable: function (e) { this.focusable = this.focusable.add(e), this._on(e, { focusin: function (e) { this._addClass(t(e.currentTarget), null, "ui-state-focus") }, focusout: function (e) { this._removeClass(t(e.currentTarget), null, "ui-state-focus") } }) }, _trigger: function (e, i, s) { var n, o, a = this.options[e]; if (s = s || {}, i = t.Event(i), i.type = (e === this.widgetEventPrefix ? e : this.widgetEventPrefix + e).toLowerCase(), i.target = this.element[0], o = i.originalEvent) for (n in o) n in i || (i[n] = o[n]); return this.element.trigger(i, s), !(t.isFunction(a) && a.apply(this.element[0], [i].concat(s)) === !1 || i.isDefaultPrevented()) } }, t.each({ show: "fadeIn", hide: "fadeOut" }, function (e, i) { t.Widget.prototype["_" + e] = function (s, n, o) { "string" == typeof n && (n = { effect: n }); var a, r = n ? n === !0 || "number" == typeof n ? i : n.effect || i : e; n = n || {}, "number" == typeof n && (n = { duration: n }), a = !t.isEmptyObject(n), n.complete = o, n.delay && s.delay(n.delay), a && t.effects && t.effects.effect[r] ? s[e](n) : r !== e && s[r] ? s[r](n.duration, n.easing, o) : s.queue(function (i) { t(this)[e](), o && o.call(s[0]), i() }) } }), t.widget, t.extend(t.expr[":"], { data: t.expr.createPseudo ? t.expr.createPseudo(function (e) { return function (i) { return !!t.data(i, e) } }) : function (e, i, s) { return !!t.data(e, s[3]) } }), t.fn.scrollParent = function (e) { var i = this.css("position"), s = "absolute" === i, n = e ? /(auto|scroll|hidden)/ : /(auto|scroll)/, o = this.parents().filter(function () { var e = t(this); return s && "static" === e.css("position") ? !1 : n.test(e.css("overflow") + e.css("overflow-y") + e.css("overflow-x")) }).eq(0); return "fixed" !== i && o.length ? o : t(this[0].ownerDocument || document) }, t.ui.ie = !!/msie [\w.]+/.exec(navigator.userAgent.toLowerCase()); var s = !1; t(document).on("mouseup", function () { s = !1 }), t.widget("ui.mouse", { version: "1.12.1", options: { cancel: "input, textarea, button, select, option", distance: 1, delay: 0 }, _mouseInit: function () { var e = this; this.element.on("mousedown." + this.widgetName, function (t) { return e._mouseDown(t) }).on("click." + this.widgetName, function (i) { return !0 === t.data(i.target, e.widgetName + ".preventClickEvent") ? (t.removeData(i.target, e.widgetName + ".preventClickEvent"), i.stopImmediatePropagation(), !1) : void 0 }), this.started = !1 }, _mouseDestroy: function () { this.element.off("." + this.widgetName), this._mouseMoveDelegate && this.document.off("mousemove." + this.widgetName, this._mouseMoveDelegate).off("mouseup." + this.widgetName, this._mouseUpDelegate) }, _mouseDown: function (e) { if (!s) { this._mouseMoved = !1, this._mouseStarted && this._mouseUp(e), this._mouseDownEvent = e; var i = this, n = 1 === e.which, o = "string" == typeof this.options.cancel && e.target.nodeName ? t(e.target).closest(this.options.cancel).length : !1; return n && !o && this._mouseCapture(e) ? (this.mouseDelayMet = !this.options.delay, this.mouseDelayMet || (this._mouseDelayTimer = setTimeout(function () { i.mouseDelayMet = !0 }, this.options.delay)), this._mouseDistanceMet(e) && this._mouseDelayMet(e) && (this._mouseStarted = this._mouseStart(e) !== !1, !this._mouseStarted) ? (e.preventDefault(), !0) : (!0 === t.data(e.target, this.widgetName + ".preventClickEvent") && t.removeData(e.target, this.widgetName + ".preventClickEvent"), this._mouseMoveDelegate = function (t) { return i._mouseMove(t) }, this._mouseUpDelegate = function (t) { return i._mouseUp(t) }, this.document.on("mousemove." + this.widgetName, this._mouseMoveDelegate).on("mouseup." + this.widgetName, this._mouseUpDelegate), e.preventDefault(), s = !0, !0)) : !0 } }, _mouseMove: function (e) { if (this._mouseMoved) { if (t.ui.ie && (!document.documentMode || 9 > document.documentMode) && !e.button) return this._mouseUp(e); if (!e.which) if (e.originalEvent.altKey || e.originalEvent.ctrlKey || e.originalEvent.metaKey || e.originalEvent.shiftKey) this.ignoreMissingWhich = !0; else if (!this.ignoreMissingWhich) return this._mouseUp(e) } return (e.which || e.button) && (this._mouseMoved = !0), this._mouseStarted ? (this._mouseDrag(e), e.preventDefault()) : (this._mouseDistanceMet(e) && this._mouseDelayMet(e) && (this._mouseStarted = this._mouseStart(this._mouseDownEvent, e) !== !1, this._mouseStarted ? this._mouseDrag(e) : this._mouseUp(e)), !this._mouseStarted) }, _mouseUp: function (e) { this.document.off("mousemove." + this.widgetName, this._mouseMoveDelegate).off("mouseup." + this.widgetName, this._mouseUpDelegate), this._mouseStarted && (this._mouseStarted = !1, e.target === this._mouseDownEvent.target && t.data(e.target, this.widgetName + ".preventClickEvent", !0), this._mouseStop(e)), this._mouseDelayTimer && (clearTimeout(this._mouseDelayTimer), delete this._mouseDelayTimer), this.ignoreMissingWhich = !1, s = !1, e.preventDefault() }, _mouseDistanceMet: function (t) { return Math.max(Math.abs(this._mouseDownEvent.pageX - t.pageX), Math.abs(this._mouseDownEvent.pageY - t.pageY)) >= this.options.distance }, _mouseDelayMet: function () { return this.mouseDelayMet }, _mouseStart: function () { }, _mouseDrag: function () { }, _mouseStop: function () { }, _mouseCapture: function () { return !0 } }), t.widget("ui.sortable", t.ui.mouse, {
            version: "1.12.1", widgetEventPrefix: "sort", ready: !1, options: { appendTo: "parent", axis: !1, connectWith: !1, containment: !1, cursor: "auto", cursorAt: !1, dropOnEmpty: !0, forcePlaceholderSize: !1, forceHelperSize: !1, grid: !1, handle: !1, helper: "original", items: "> *", opacity: !1, placeholder: !1, revert: !1, scroll: !0, scrollSensitivity: 20, scrollSpeed: 20, scope: "default", tolerance: "intersect", zIndex: 1e3, activate: null, beforeStop: null, change: null, deactivate: null, out: null, over: null, receive: null, remove: null, sort: null, start: null, stop: null, update: null }, _isOverAxis: function (t, e, i) { return t >= e && e + i > t }, _isFloating: function (t) { return /left|right/.test(t.css("float")) || /inline|table-cell/.test(t.css("display")) }, _create: function () { this.containerCache = {}, this._addClass("ui-sortable"), this.refresh(), this.offset = this.element.offset(), this._mouseInit(), this._setHandleClassName(), this.ready = !0 }, _setOption: function (t, e) { this._super(t, e), "handle" === t && this._setHandleClassName() }, _setHandleClassName: function () { var e = this; this._removeClass(this.element.find(".ui-sortable-handle"), "ui-sortable-handle"), t.each(this.items, function () { e._addClass(this.instance.options.handle ? this.item.find(this.instance.options.handle) : this.item, "ui-sortable-handle") }) }, _destroy: function () { this._mouseDestroy(); for (var t = this.items.length - 1; t >= 0; t--)this.items[t].item.removeData(this.widgetName + "-item"); return this }, _mouseCapture: function (e, i) { var s = null, n = !1, o = this; return this.reverting ? !1 : this.options.disabled || "static" === this.options.type ? !1 : (this._refreshItems(e), t(e.target).parents().each(function () { return t.data(this, o.widgetName + "-item") === o ? (s = t(this), !1) : void 0 }), t.data(e.target, o.widgetName + "-item") === o && (s = t(e.target)), s ? !this.options.handle || i || (t(this.options.handle, s).find("*").addBack().each(function () { this === e.target && (n = !0) }), n) ? (this.currentItem = s, this._removeCurrentsFromItems(), !0) : !1 : !1) }, _mouseStart: function (e, i, s) { var n, o, a = this.options; if (this.currentContainer = this, this.refreshPositions(), this.helper = this._createHelper(e), this._cacheHelperProportions(), this._cacheMargins(), this.scrollParent = this.helper.scrollParent(), this.offset = this.currentItem.offset(), this.offset = { top: this.offset.top - this.margins.top, left: this.offset.left - this.margins.left }, t.extend(this.offset, { click: { left: e.pageX - this.offset.left, top: e.pageY - this.offset.top }, parent: this._getParentOffset(), relative: this._getRelativeOffset() }), this.helper.css("position", "absolute"), this.cssPosition = this.helper.css("position"), this.originalPosition = this._generatePosition(e), this.originalPageX = e.pageX, this.originalPageY = e.pageY, a.cursorAt && this._adjustOffsetFromHelper(a.cursorAt), this.domPosition = { prev: this.currentItem.prev()[0], parent: this.currentItem.parent()[0] }, this.helper[0] !== this.currentItem[0] && this.currentItem.hide(), this._createPlaceholder(), a.containment && this._setContainment(), a.cursor && "auto" !== a.cursor && (o = this.document.find("body"), this.storedCursor = o.css("cursor"), o.css("cursor", a.cursor), this.storedStylesheet = t("<style>*{ cursor: " + a.cursor + " !important; }</style>").appendTo(o)), a.opacity && (this.helper.css("opacity") && (this._storedOpacity = this.helper.css("opacity")), this.helper.css("opacity", a.opacity)), a.zIndex && (this.helper.css("zIndex") && (this._storedZIndex = this.helper.css("zIndex")), this.helper.css("zIndex", a.zIndex)), this.scrollParent[0] !== this.document[0] && "HTML" !== this.scrollParent[0].tagName && (this.overflowOffset = this.scrollParent.offset()), this._trigger("start", e, this._uiHash()), this._preserveHelperProportions || this._cacheHelperProportions(), !s) for (n = this.containers.length - 1; n >= 0; n--)this.containers[n]._trigger("activate", e, this._uiHash(this)); return t.ui.ddmanager && (t.ui.ddmanager.current = this), t.ui.ddmanager && !a.dropBehaviour && t.ui.ddmanager.prepareOffsets(this, e), this.dragging = !0, this._addClass(this.helper, "ui-sortable-helper"), this._mouseDrag(e), !0 }, _mouseDrag: function (e) { var i, s, n, o, a = this.options, r = !1; for (this.position = this._generatePosition(e), this.positionAbs = this._convertPositionTo("absolute"), this.lastPositionAbs || (this.lastPositionAbs = this.positionAbs), this.options.scroll && (this.scrollParent[0] !== this.document[0] && "HTML" !== this.scrollParent[0].tagName ? (this.overflowOffset.top + this.scrollParent[0].offsetHeight - e.pageY < a.scrollSensitivity ? this.scrollParent[0].scrollTop = r = this.scrollParent[0].scrollTop + a.scrollSpeed : e.pageY - this.overflowOffset.top < a.scrollSensitivity && (this.scrollParent[0].scrollTop = r = this.scrollParent[0].scrollTop - a.scrollSpeed), this.overflowOffset.left + this.scrollParent[0].offsetWidth - e.pageX < a.scrollSensitivity ? this.scrollParent[0].scrollLeft = r = this.scrollParent[0].scrollLeft + a.scrollSpeed : e.pageX - this.overflowOffset.left < a.scrollSensitivity && (this.scrollParent[0].scrollLeft = r = this.scrollParent[0].scrollLeft - a.scrollSpeed)) : (e.pageY - this.document.scrollTop() < a.scrollSensitivity ? r = this.document.scrollTop(this.document.scrollTop() - a.scrollSpeed) : this.window.height() - (e.pageY - this.document.scrollTop()) < a.scrollSensitivity && (r = this.document.scrollTop(this.document.scrollTop() + a.scrollSpeed)), e.pageX - this.document.scrollLeft() < a.scrollSensitivity ? r = this.document.scrollLeft(this.document.scrollLeft() - a.scrollSpeed) : this.window.width() - (e.pageX - this.document.scrollLeft()) < a.scrollSensitivity && (r = this.document.scrollLeft(this.document.scrollLeft() + a.scrollSpeed))), r !== !1 && t.ui.ddmanager && !a.dropBehaviour && t.ui.ddmanager.prepareOffsets(this, e)), this.positionAbs = this._convertPositionTo("absolute"), this.options.axis && "y" === this.options.axis || (this.helper[0].style.left = this.position.left + "px"), this.options.axis && "x" === this.options.axis || (this.helper[0].style.top = this.position.top + "px"), i = this.items.length - 1; i >= 0; i--)if (s = this.items[i], n = s.item[0], o = this._intersectsWithPointer(s), o && s.instance === this.currentContainer && n !== this.currentItem[0] && this.placeholder[1 === o ? "next" : "prev"]()[0] !== n && !t.contains(this.placeholder[0], n) && ("semi-dynamic" === this.options.type ? !t.contains(this.element[0], n) : !0)) { if (this.direction = 1 === o ? "down" : "up", "pointer" !== this.options.tolerance && !this._intersectsWithSides(s)) break; this._rearrange(e, s), this._trigger("change", e, this._uiHash()); break } return this._contactContainers(e), t.ui.ddmanager && t.ui.ddmanager.drag(this, e), this._trigger("sort", e, this._uiHash()), this.lastPositionAbs = this.positionAbs, !1 }, _mouseStop: function (e, i) { if (e) { if (t.ui.ddmanager && !this.options.dropBehaviour && t.ui.ddmanager.drop(this, e), this.options.revert) { var s = this, n = this.placeholder.offset(), o = this.options.axis, a = {}; o && "x" !== o || (a.left = n.left - this.offset.parent.left - this.margins.left + (this.offsetParent[0] === this.document[0].body ? 0 : this.offsetParent[0].scrollLeft)), o && "y" !== o || (a.top = n.top - this.offset.parent.top - this.margins.top + (this.offsetParent[0] === this.document[0].body ? 0 : this.offsetParent[0].scrollTop)), this.reverting = !0, t(this.helper).animate(a, parseInt(this.options.revert, 10) || 500, function () { s._clear(e) }) } else this._clear(e, i); return !1 } }, cancel: function () { if (this.dragging) { this._mouseUp(new t.Event("mouseup", { target: null })), "original" === this.options.helper ? (this.currentItem.css(this._storedCSS), this._removeClass(this.currentItem, "ui-sortable-helper")) : this.currentItem.show(); for (var e = this.containers.length - 1; e >= 0; e--)this.containers[e]._trigger("deactivate", null, this._uiHash(this)), this.containers[e].containerCache.over && (this.containers[e]._trigger("out", null, this._uiHash(this)), this.containers[e].containerCache.over = 0) } return this.placeholder && (this.placeholder[0].parentNode && this.placeholder[0].parentNode.removeChild(this.placeholder[0]), "original" !== this.options.helper && this.helper && this.helper[0].parentNode && this.helper.remove(), t.extend(this, { helper: null, dragging: !1, reverting: !1, _noFinalSort: null }), this.domPosition.prev ? t(this.domPosition.prev).after(this.currentItem) : t(this.domPosition.parent).prepend(this.currentItem)), this }, serialize: function (e) { var i = this._getItemsAsjQuery(e && e.connected), s = []; return e = e || {}, t(i).each(function () { var i = (t(e.item || this).attr(e.attribute || "id") || "").match(e.expression || /(.+)[\-=_](.+)/); i && s.push((e.key || i[1] + "[]") + "=" + (e.key && e.expression ? i[1] : i[2])) }), !s.length && e.key && s.push(e.key + "="), s.join("&") }, toArray: function (e) { var i = this._getItemsAsjQuery(e && e.connected), s = []; return e = e || {}, i.each(function () { s.push(t(e.item || this).attr(e.attribute || "id") || "") }), s }, _intersectsWith: function (t) { var e = this.positionAbs.left, i = e + this.helperProportions.width, s = this.positionAbs.top, n = s + this.helperProportions.height, o = t.left, a = o + t.width, r = t.top, l = r + t.height, h = this.offset.click.top, c = this.offset.click.left, u = "x" === this.options.axis || s + h > r && l > s + h, d = "y" === this.options.axis || e + c > o && a > e + c, p = u && d; return "pointer" === this.options.tolerance || this.options.forcePointerForContainers || "pointer" !== this.options.tolerance && this.helperProportions[this.floating ? "width" : "height"] > t[this.floating ? "width" : "height"] ? p : e + this.helperProportions.width / 2 > o && a > i - this.helperProportions.width / 2 && s + this.helperProportions.height / 2 > r && l > n - this.helperProportions.height / 2 }, _intersectsWithPointer: function (t) { var e, i, s = "x" === this.options.axis || this._isOverAxis(this.positionAbs.top + this.offset.click.top, t.top, t.height), n = "y" === this.options.axis || this._isOverAxis(this.positionAbs.left + this.offset.click.left, t.left, t.width), o = s && n; return o ? (e = this._getDragVerticalDirection(), i = this._getDragHorizontalDirection(), this.floating ? "right" === i || "down" === e ? 2 : 1 : e && ("down" === e ? 2 : 1)) : !1 }, _intersectsWithSides: function (t) { var e = this._isOverAxis(this.positionAbs.top + this.offset.click.top, t.top + t.height / 2, t.height), i = this._isOverAxis(this.positionAbs.left + this.offset.click.left, t.left + t.width / 2, t.width), s = this._getDragVerticalDirection(), n = this._getDragHorizontalDirection(); return this.floating && n ? "right" === n && i || "left" === n && !i : s && ("down" === s && e || "up" === s && !e) }, _getDragVerticalDirection: function () { var t = this.positionAbs.top - this.lastPositionAbs.top; return 0 !== t && (t > 0 ? "down" : "up") }, _getDragHorizontalDirection: function () { var t = this.positionAbs.left - this.lastPositionAbs.left; return 0 !== t && (t > 0 ? "right" : "left") }, refresh: function (t) { return this._refreshItems(t), this._setHandleClassName(), this.refreshPositions(), this }, _connectWith: function () { var t = this.options; return t.connectWith.constructor === String ? [t.connectWith] : t.connectWith }, _getItemsAsjQuery: function (e) { function i() { r.push(this) } var s, n, o, a, r = [], l = [], h = this._connectWith(); if (h && e) for (s = h.length - 1; s >= 0; s--)for (o = t(h[s], this.document[0]), n = o.length - 1; n >= 0; n--)a = t.data(o[n], this.widgetFullName), a && a !== this && !a.options.disabled && l.push([t.isFunction(a.options.items) ? a.options.items.call(a.element) : t(a.options.items, a.element).not(".ui-sortable-helper").not(".ui-sortable-placeholder"), a]); for (l.push([t.isFunction(this.options.items) ? this.options.items.call(this.element, null, { options: this.options, item: this.currentItem }) : t(this.options.items, this.element).not(".ui-sortable-helper").not(".ui-sortable-placeholder"), this]), s = l.length - 1; s >= 0; s--)l[s][0].each(i); return t(r) }, _removeCurrentsFromItems: function () { var e = this.currentItem.find(":data(" + this.widgetName + "-item)"); this.items = t.grep(this.items, function (t) { for (var i = 0; e.length > i; i++)if (e[i] === t.item[0]) return !1; return !0 }) }, _refreshItems: function (e) { this.items = [], this.containers = [this]; var i, s, n, o, a, r, l, h, c = this.items, u = [[t.isFunction(this.options.items) ? this.options.items.call(this.element[0], e, { item: this.currentItem }) : t(this.options.items, this.element), this]], d = this._connectWith(); if (d && this.ready) for (i = d.length - 1; i >= 0; i--)for (n = t(d[i], this.document[0]), s = n.length - 1; s >= 0; s--)o = t.data(n[s], this.widgetFullName), o && o !== this && !o.options.disabled && (u.push([t.isFunction(o.options.items) ? o.options.items.call(o.element[0], e, { item: this.currentItem }) : t(o.options.items, o.element), o]), this.containers.push(o)); for (i = u.length - 1; i >= 0; i--)for (a = u[i][1], r = u[i][0], s = 0, h = r.length; h > s; s++)l = t(r[s]), l.data(this.widgetName + "-item", a), c.push({ item: l, instance: a, width: 0, height: 0, left: 0, top: 0 }) }, refreshPositions: function (e) { this.floating = this.items.length ? "x" === this.options.axis || this._isFloating(this.items[0].item) : !1, this.offsetParent && this.helper && (this.offset.parent = this._getParentOffset()); var i, s, n, o; for (i = this.items.length - 1; i >= 0; i--)s = this.items[i], s.instance !== this.currentContainer && this.currentContainer && s.item[0] !== this.currentItem[0] || (n = this.options.toleranceElement ? t(this.options.toleranceElement, s.item) : s.item, e || (s.width = n.outerWidth(), s.height = n.outerHeight()), o = n.offset(), s.left = o.left, s.top = o.top); if (this.options.custom && this.options.custom.refreshContainers) this.options.custom.refreshContainers.call(this); else for (i = this.containers.length - 1; i >= 0; i--)o = this.containers[i].element.offset(), this.containers[i].containerCache.left = o.left, this.containers[i].containerCache.top = o.top, this.containers[i].containerCache.width = this.containers[i].element.outerWidth(), this.containers[i].containerCache.height = this.containers[i].element.outerHeight(); return this }, _createPlaceholder: function (e) { e = e || this; var i, s = e.options; s.placeholder && s.placeholder.constructor !== String || (i = s.placeholder, s.placeholder = { element: function () { var s = e.currentItem[0].nodeName.toLowerCase(), n = t("<" + s + ">", e.document[0]); return e._addClass(n, "ui-sortable-placeholder", i || e.currentItem[0].className)._removeClass(n, "ui-sortable-helper"), "tbody" === s ? e._createTrPlaceholder(e.currentItem.find("tr").eq(0), t("<tr>", e.document[0]).appendTo(n)) : "tr" === s ? e._createTrPlaceholder(e.currentItem, n) : "img" === s && n.attr("src", e.currentItem.attr("src")), i || n.css("visibility", "hidden"), n }, update: function (t, n) { (!i || s.forcePlaceholderSize) && (n.height() || n.height(e.currentItem.innerHeight() - parseInt(e.currentItem.css("paddingTop") || 0, 10) - parseInt(e.currentItem.css("paddingBottom") || 0, 10)), n.width() || n.width(e.currentItem.innerWidth() - parseInt(e.currentItem.css("paddingLeft") || 0, 10) - parseInt(e.currentItem.css("paddingRight") || 0, 10))) } }), e.placeholder = t(s.placeholder.element.call(e.element, e.currentItem)), e.currentItem.after(e.placeholder), s.placeholder.update(e, e.placeholder) }, _createTrPlaceholder: function (e, i) { var s = this; e.children().each(function () { t("<td>&#160;</td>", s.document[0]).attr("colspan", t(this).attr("colspan") || 1).appendTo(i) }) }, _contactContainers: function (e) { var i, s, n, o, a, r, l, h, c, u, d = null, p = null; for (i = this.containers.length - 1; i >= 0; i--)if (!t.contains(this.currentItem[0], this.containers[i].element[0])) if (this._intersectsWith(this.containers[i].containerCache)) { if (d && t.contains(this.containers[i].element[0], d.element[0])) continue; d = this.containers[i], p = i } else this.containers[i].containerCache.over && (this.containers[i]._trigger("out", e, this._uiHash(this)), this.containers[i].containerCache.over = 0); if (d) if (1 === this.containers.length) this.containers[p].containerCache.over || (this.containers[p]._trigger("over", e, this._uiHash(this)), this.containers[p].containerCache.over = 1); else { for (n = 1e4, o = null, c = d.floating || this._isFloating(this.currentItem), a = c ? "left" : "top", r = c ? "width" : "height", u = c ? "pageX" : "pageY", s = this.items.length - 1; s >= 0; s--)t.contains(this.containers[p].element[0], this.items[s].item[0]) && this.items[s].item[0] !== this.currentItem[0] && (l = this.items[s].item.offset()[a], h = !1, e[u] - l > this.items[s][r] / 2 && (h = !0), n > Math.abs(e[u] - l) && (n = Math.abs(e[u] - l), o = this.items[s], this.direction = h ? "up" : "down")); if (!o && !this.options.dropOnEmpty) return; if (this.currentContainer === this.containers[p]) return this.currentContainer.containerCache.over || (this.containers[p]._trigger("over", e, this._uiHash()), this.currentContainer.containerCache.over = 1), void 0; o ? this._rearrange(e, o, null, !0) : this._rearrange(e, null, this.containers[p].element, !0), this._trigger("change", e, this._uiHash()), this.containers[p]._trigger("change", e, this._uiHash(this)), this.currentContainer = this.containers[p], this.options.placeholder.update(this.currentContainer, this.placeholder), this.containers[p]._trigger("over", e, this._uiHash(this)), this.containers[p].containerCache.over = 1 } }, _createHelper: function (e) { var i = this.options, s = t.isFunction(i.helper) ? t(i.helper.apply(this.element[0], [e, this.currentItem])) : "clone" === i.helper ? this.currentItem.clone() : this.currentItem; return s.parents("body").length || t("parent" !== i.appendTo ? i.appendTo : this.currentItem[0].parentNode)[0].appendChild(s[0]), s[0] === this.currentItem[0] && (this._storedCSS = { width: this.currentItem[0].style.width, height: this.currentItem[0].style.height, position: this.currentItem.css("position"), top: this.currentItem.css("top"), left: this.currentItem.css("left") }), (!s[0].style.width || i.forceHelperSize) && s.width(this.currentItem.width()), (!s[0].style.height || i.forceHelperSize) && s.height(this.currentItem.height()), s }, _adjustOffsetFromHelper: function (e) { "string" == typeof e && (e = e.split(" ")), t.isArray(e) && (e = { left: +e[0], top: +e[1] || 0 }), "left" in e && (this.offset.click.left = e.left + this.margins.left), "right" in e && (this.offset.click.left = this.helperProportions.width - e.right + this.margins.left), "top" in e && (this.offset.click.top = e.top + this.margins.top), "bottom" in e && (this.offset.click.top = this.helperProportions.height - e.bottom + this.margins.top) }, _getParentOffset: function () { this.offsetParent = this.helper.offsetParent(); var e = this.offsetParent.offset(); return "absolute" === this.cssPosition && this.scrollParent[0] !== this.document[0] && t.contains(this.scrollParent[0], this.offsetParent[0]) && (e.left += this.scrollParent.scrollLeft(), e.top += this.scrollParent.scrollTop()), (this.offsetParent[0] === this.document[0].body || this.offsetParent[0].tagName && "html" === this.offsetParent[0].tagName.toLowerCase() && t.ui.ie) && (e = { top: 0, left: 0 }), { top: e.top + (parseInt(this.offsetParent.css("borderTopWidth"), 10) || 0), left: e.left + (parseInt(this.offsetParent.css("borderLeftWidth"), 10) || 0) } }, _getRelativeOffset: function () { if ("relative" === this.cssPosition) { var t = this.currentItem.position(); return { top: t.top - (parseInt(this.helper.css("top"), 10) || 0) + this.scrollParent.scrollTop(), left: t.left - (parseInt(this.helper.css("left"), 10) || 0) + this.scrollParent.scrollLeft() } } return { top: 0, left: 0 } }, _cacheMargins: function () { this.margins = { left: parseInt(this.currentItem.css("marginLeft"), 10) || 0, top: parseInt(this.currentItem.css("marginTop"), 10) || 0 } }, _cacheHelperProportions: function () { this.helperProportions = { width: this.helper.outerWidth(), height: this.helper.outerHeight() } }, _setContainment: function () { var e, i, s, n = this.options; "parent" === n.containment && (n.containment = this.helper[0].parentNode), ("document" === n.containment || "window" === n.containment) && (this.containment = [0 - this.offset.relative.left - this.offset.parent.left, 0 - this.offset.relative.top - this.offset.parent.top, "document" === n.containment ? this.document.width() : this.window.width() - this.helperProportions.width - this.margins.left, ("document" === n.containment ? this.document.height() || document.body.parentNode.scrollHeight : this.window.height() || this.document[0].body.parentNode.scrollHeight) - this.helperProportions.height - this.margins.top]), /^(document|window|parent)$/.test(n.containment) || (e = t(n.containment)[0], i = t(n.containment).offset(), s = "hidden" !== t(e).css("overflow"), this.containment = [i.left + (parseInt(t(e).css("borderLeftWidth"), 10) || 0) + (parseInt(t(e).css("paddingLeft"), 10) || 0) - this.margins.left, i.top + (parseInt(t(e).css("borderTopWidth"), 10) || 0) + (parseInt(t(e).css("paddingTop"), 10) || 0) - this.margins.top, i.left + (s ? Math.max(e.scrollWidth, e.offsetWidth) : e.offsetWidth) - (parseInt(t(e).css("borderLeftWidth"), 10) || 0) - (parseInt(t(e).css("paddingRight"), 10) || 0) - this.helperProportions.width - this.margins.left, i.top + (s ? Math.max(e.scrollHeight, e.offsetHeight) : e.offsetHeight) - (parseInt(t(e).css("borderTopWidth"), 10) || 0) - (parseInt(t(e).css("paddingBottom"), 10) || 0) - this.helperProportions.height - this.margins.top]) }, _convertPositionTo: function (e, i) {
                i || (i = this.position); var s = "absolute" === e ? 1 : -1, n = "absolute" !== this.cssPosition || this.scrollParent[0] !== this.document[0] && t.contains(this.scrollParent[0], this.offsetParent[0]) ? this.scrollParent : this.offsetParent, o = /(html|body)/i.test(n[0].tagName); return { top: i.top + this.offset.relative.top * s + this.offset.parent.top * s - ("fixed" === this.cssPosition ? -this.scrollParent.scrollTop() : o ? 0 : n.scrollTop()) * s, left: i.left + this.offset.relative.left * s + this.offset.parent.left * s - ("fixed" === this.cssPosition ? -this.scrollParent.scrollLeft() : o ? 0 : n.scrollLeft()) * s }
            }, _generatePosition: function (e) { var i, s, n = this.options, o = e.pageX, a = e.pageY, r = "absolute" !== this.cssPosition || this.scrollParent[0] !== this.document[0] && t.contains(this.scrollParent[0], this.offsetParent[0]) ? this.scrollParent : this.offsetParent, l = /(html|body)/i.test(r[0].tagName); return "relative" !== this.cssPosition || this.scrollParent[0] !== this.document[0] && this.scrollParent[0] !== this.offsetParent[0] || (this.offset.relative = this._getRelativeOffset()), this.originalPosition && (this.containment && (e.pageX - this.offset.click.left < this.containment[0] && (o = this.containment[0] + this.offset.click.left), e.pageY - this.offset.click.top < this.containment[1] && (a = this.containment[1] + this.offset.click.top), e.pageX - this.offset.click.left > this.containment[2] && (o = this.containment[2] + this.offset.click.left), e.pageY - this.offset.click.top > this.containment[3] && (a = this.containment[3] + this.offset.click.top)), n.grid && (i = this.originalPageY + Math.round((a - this.originalPageY) / n.grid[1]) * n.grid[1], a = this.containment ? i - this.offset.click.top >= this.containment[1] && i - this.offset.click.top <= this.containment[3] ? i : i - this.offset.click.top >= this.containment[1] ? i - n.grid[1] : i + n.grid[1] : i, s = this.originalPageX + Math.round((o - this.originalPageX) / n.grid[0]) * n.grid[0], o = this.containment ? s - this.offset.click.left >= this.containment[0] && s - this.offset.click.left <= this.containment[2] ? s : s - this.offset.click.left >= this.containment[0] ? s - n.grid[0] : s + n.grid[0] : s)), { top: a - this.offset.click.top - this.offset.relative.top - this.offset.parent.top + ("fixed" === this.cssPosition ? -this.scrollParent.scrollTop() : l ? 0 : r.scrollTop()), left: o - this.offset.click.left - this.offset.relative.left - this.offset.parent.left + ("fixed" === this.cssPosition ? -this.scrollParent.scrollLeft() : l ? 0 : r.scrollLeft()) } }, _rearrange: function (t, e, i, s) { i ? i[0].appendChild(this.placeholder[0]) : e.item[0].parentNode.insertBefore(this.placeholder[0], "down" === this.direction ? e.item[0] : e.item[0].nextSibling), this.counter = this.counter ? ++this.counter : 1; var n = this.counter; this._delay(function () { n === this.counter && this.refreshPositions(!s) }) }, _clear: function (t, e) { function i(t, e, i) { return function (s) { i._trigger(t, s, e._uiHash(e)) } } this.reverting = !1; var s, n = []; if (!this._noFinalSort && this.currentItem.parent().length && this.placeholder.before(this.currentItem), this._noFinalSort = null, this.helper[0] === this.currentItem[0]) { for (s in this._storedCSS) ("auto" === this._storedCSS[s] || "static" === this._storedCSS[s]) && (this._storedCSS[s] = ""); this.currentItem.css(this._storedCSS), this._removeClass(this.currentItem, "ui-sortable-helper") } else this.currentItem.show(); for (this.fromOutside && !e && n.push(function (t) { this._trigger("receive", t, this._uiHash(this.fromOutside)) }), !this.fromOutside && this.domPosition.prev === this.currentItem.prev().not(".ui-sortable-helper")[0] && this.domPosition.parent === this.currentItem.parent()[0] || e || n.push(function (t) { this._trigger("update", t, this._uiHash()) }), this !== this.currentContainer && (e || (n.push(function (t) { this._trigger("remove", t, this._uiHash()) }), n.push(function (t) { return function (e) { t._trigger("receive", e, this._uiHash(this)) } }.call(this, this.currentContainer)), n.push(function (t) { return function (e) { t._trigger("update", e, this._uiHash(this)) } }.call(this, this.currentContainer)))), s = this.containers.length - 1; s >= 0; s--)e || n.push(i("deactivate", this, this.containers[s])), this.containers[s].containerCache.over && (n.push(i("out", this, this.containers[s])), this.containers[s].containerCache.over = 0); if (this.storedCursor && (this.document.find("body").css("cursor", this.storedCursor), this.storedStylesheet.remove()), this._storedOpacity && this.helper.css("opacity", this._storedOpacity), this._storedZIndex && this.helper.css("zIndex", "auto" === this._storedZIndex ? "" : this._storedZIndex), this.dragging = !1, e || this._trigger("beforeStop", t, this._uiHash()), this.placeholder[0].parentNode.removeChild(this.placeholder[0]), this.cancelHelperRemoval || (this.helper[0] !== this.currentItem[0] && this.helper.remove(), this.helper = null), !e) { for (s = 0; n.length > s; s++)n[s].call(this, t); this._trigger("stop", t, this._uiHash()) } return this.fromOutside = !1, !this.cancelHelperRemoval }, _trigger: function () { t.Widget.prototype._trigger.apply(this, arguments) === !1 && this.cancel() }, _uiHash: function (e) { var i = e || this; return { helper: i.helper, placeholder: i.placeholder || t([]), position: i.position, originalPosition: i.originalPosition, offset: i.positionAbs, item: i.currentItem, sender: e ? e.element : null } }
        })
    });</script>
<script type="text/javascript">/*!
                         * Bootstrap v3.3.7 (http://getbootstrap.com)
                         * Copyright 2011-2016 Twitter, Inc.
                         * Licensed under the MIT license
                         */
    if ("undefined" == typeof jQuery) throw new Error("Bootstrap's JavaScript requires jQuery"); +function (a) { "use strict"; var b = a.fn.jquery.split(" ")[0].split("."); if (b[0] < 2 && b[1] < 9 || 1 == b[0] && 9 == b[1] && b[2] < 1 || b[0] > 3) throw new Error("Bootstrap's JavaScript requires jQuery version 1.9.1 or higher, but lower than version 4") }(jQuery), +function (a) { "use strict"; function b() { var a = document.createElement("bootstrap"), b = { WebkitTransition: "webkitTransitionEnd", MozTransition: "transitionend", OTransition: "oTransitionEnd otransitionend", transition: "transitionend" }; for (var c in b) if (void 0 !== a.style[c]) return { end: b[c] }; return !1 } a.fn.emulateTransitionEnd = function (b) { var c = !1, d = this; a(this).one("bsTransitionEnd", function () { c = !0 }); var e = function () { c || a(d).trigger(a.support.transition.end) }; return setTimeout(e, b), this }, a(function () { a.support.transition = b(), a.support.transition && (a.event.special.bsTransitionEnd = { bindType: a.support.transition.end, delegateType: a.support.transition.end, handle: function (b) { if (a(b.target).is(this)) return b.handleObj.handler.apply(this, arguments) } }) }) }(jQuery), +function (a) { "use strict"; function b(b) { return this.each(function () { var c = a(this), e = c.data("bs.alert"); e || c.data("bs.alert", e = new d(this)), "string" == typeof b && e[b].call(c) }) } var c = '[data-dismiss="alert"]', d = function (b) { a(b).on("click", c, this.close) }; d.VERSION = "3.3.7", d.TRANSITION_DURATION = 150, d.prototype.close = function (b) { function c() { g.detach().trigger("closed.bs.alert").remove() } var e = a(this), f = e.attr("data-target"); f || (f = e.attr("href"), f = f && f.replace(/.*(?=#[^\s]*$)/, "")); var g = a("#" === f ? [] : f); b && b.preventDefault(), g.length || (g = e.closest(".alert")), g.trigger(b = a.Event("close.bs.alert")), b.isDefaultPrevented() || (g.removeClass("in"), a.support.transition && g.hasClass("fade") ? g.one("bsTransitionEnd", c).emulateTransitionEnd(d.TRANSITION_DURATION) : c()) }; var e = a.fn.alert; a.fn.alert = b, a.fn.alert.Constructor = d, a.fn.alert.noConflict = function () { return a.fn.alert = e, this }, a(document).on("click.bs.alert.data-api", c, d.prototype.close) }(jQuery), +function (a) { "use strict"; function b(b) { return this.each(function () { var d = a(this), e = d.data("bs.button"), f = "object" == typeof b && b; e || d.data("bs.button", e = new c(this, f)), "toggle" == b ? e.toggle() : b && e.setState(b) }) } var c = function (b, d) { this.$element = a(b), this.options = a.extend({}, c.DEFAULTS, d), this.isLoading = !1 }; c.VERSION = "3.3.7", c.DEFAULTS = { loadingText: "loading..." }, c.prototype.setState = function (b) { var c = "disabled", d = this.$element, e = d.is("input") ? "val" : "html", f = d.data(); b += "Text", null == f.resetText && d.data("resetText", d[e]()), setTimeout(a.proxy(function () { d[e](null == f[b] ? this.options[b] : f[b]), "loadingText" == b ? (this.isLoading = !0, d.addClass(c).attr(c, c).prop(c, !0)) : this.isLoading && (this.isLoading = !1, d.removeClass(c).removeAttr(c).prop(c, !1)) }, this), 0) }, c.prototype.toggle = function () { var a = !0, b = this.$element.closest('[data-toggle="buttons"]'); if (b.length) { var c = this.$element.find("input"); "radio" == c.prop("type") ? (c.prop("checked") && (a = !1), b.find(".active").removeClass("active"), this.$element.addClass("active")) : "checkbox" == c.prop("type") && (c.prop("checked") !== this.$element.hasClass("active") && (a = !1), this.$element.toggleClass("active")), c.prop("checked", this.$element.hasClass("active")), a && c.trigger("change") } else this.$element.attr("aria-pressed", !this.$element.hasClass("active")), this.$element.toggleClass("active") }; var d = a.fn.button; a.fn.button = b, a.fn.button.Constructor = c, a.fn.button.noConflict = function () { return a.fn.button = d, this }, a(document).on("click.bs.button.data-api", '[data-toggle^="button"]', function (c) { var d = a(c.target).closest(".btn"); b.call(d, "toggle"), a(c.target).is('input[type="radio"], input[type="checkbox"]') || (c.preventDefault(), d.is("input,button") ? d.trigger("focus") : d.find("input:visible,button:visible").first().trigger("focus")) }).on("focus.bs.button.data-api blur.bs.button.data-api", '[data-toggle^="button"]', function (b) { a(b.target).closest(".btn").toggleClass("focus", /^focus(in)?$/.test(b.type)) }) }(jQuery), +function (a) { "use strict"; function b(b) { return this.each(function () { var d = a(this), e = d.data("bs.carousel"), f = a.extend({}, c.DEFAULTS, d.data(), "object" == typeof b && b), g = "string" == typeof b ? b : f.slide; e || d.data("bs.carousel", e = new c(this, f)), "number" == typeof b ? e.to(b) : g ? e[g]() : f.interval && e.pause().cycle() }) } var c = function (b, c) { this.$element = a(b), this.$indicators = this.$element.find(".carousel-indicators"), this.options = c, this.paused = null, this.sliding = null, this.interval = null, this.$active = null, this.$items = null, this.options.keyboard && this.$element.on("keydown.bs.carousel", a.proxy(this.keydown, this)), "hover" == this.options.pause && !("ontouchstart" in document.documentElement) && this.$element.on("mouseenter.bs.carousel", a.proxy(this.pause, this)).on("mouseleave.bs.carousel", a.proxy(this.cycle, this)) }; c.VERSION = "3.3.7", c.TRANSITION_DURATION = 600, c.DEFAULTS = { interval: 5e3, pause: "hover", wrap: !0, keyboard: !0 }, c.prototype.keydown = function (a) { if (!/input|textarea/i.test(a.target.tagName)) { switch (a.which) { case 37: this.prev(); break; case 39: this.next(); break; default: return }a.preventDefault() } }, c.prototype.cycle = function (b) { return b || (this.paused = !1), this.interval && clearInterval(this.interval), this.options.interval && !this.paused && (this.interval = setInterval(a.proxy(this.next, this), this.options.interval)), this }, c.prototype.getItemIndex = function (a) { return this.$items = a.parent().children(".item"), this.$items.index(a || this.$active) }, c.prototype.getItemForDirection = function (a, b) { var c = this.getItemIndex(b), d = "prev" == a && 0 === c || "next" == a && c == this.$items.length - 1; if (d && !this.options.wrap) return b; var e = "prev" == a ? -1 : 1, f = (c + e) % this.$items.length; return this.$items.eq(f) }, c.prototype.to = function (a) { var b = this, c = this.getItemIndex(this.$active = this.$element.find(".item.active")); if (!(a > this.$items.length - 1 || a < 0)) return this.sliding ? this.$element.one("slid.bs.carousel", function () { b.to(a) }) : c == a ? this.pause().cycle() : this.slide(a > c ? "next" : "prev", this.$items.eq(a)) }, c.prototype.pause = function (b) { return b || (this.paused = !0), this.$element.find(".next, .prev").length && a.support.transition && (this.$element.trigger(a.support.transition.end), this.cycle(!0)), this.interval = clearInterval(this.interval), this }, c.prototype.next = function () { if (!this.sliding) return this.slide("next") }, c.prototype.prev = function () { if (!this.sliding) return this.slide("prev") }, c.prototype.slide = function (b, d) { var e = this.$element.find(".item.active"), f = d || this.getItemForDirection(b, e), g = this.interval, h = "next" == b ? "left" : "right", i = this; if (f.hasClass("active")) return this.sliding = !1; var j = f[0], k = a.Event("slide.bs.carousel", { relatedTarget: j, direction: h }); if (this.$element.trigger(k), !k.isDefaultPrevented()) { if (this.sliding = !0, g && this.pause(), this.$indicators.length) { this.$indicators.find(".active").removeClass("active"); var l = a(this.$indicators.children()[this.getItemIndex(f)]); l && l.addClass("active") } var m = a.Event("slid.bs.carousel", { relatedTarget: j, direction: h }); return a.support.transition && this.$element.hasClass("slide") ? (f.addClass(b), f[0].offsetWidth, e.addClass(h), f.addClass(h), e.one("bsTransitionEnd", function () { f.removeClass([b, h].join(" ")).addClass("active"), e.removeClass(["active", h].join(" ")), i.sliding = !1, setTimeout(function () { i.$element.trigger(m) }, 0) }).emulateTransitionEnd(c.TRANSITION_DURATION)) : (e.removeClass("active"), f.addClass("active"), this.sliding = !1, this.$element.trigger(m)), g && this.cycle(), this } }; var d = a.fn.carousel; a.fn.carousel = b, a.fn.carousel.Constructor = c, a.fn.carousel.noConflict = function () { return a.fn.carousel = d, this }; var e = function (c) { var d, e = a(this), f = a(e.attr("data-target") || (d = e.attr("href")) && d.replace(/.*(?=#[^\s]+$)/, "")); if (f.hasClass("carousel")) { var g = a.extend({}, f.data(), e.data()), h = e.attr("data-slide-to"); h && (g.interval = !1), b.call(f, g), h && f.data("bs.carousel").to(h), c.preventDefault() } }; a(document).on("click.bs.carousel.data-api", "[data-slide]", e).on("click.bs.carousel.data-api", "[data-slide-to]", e), a(window).on("load", function () { a('[data-ride="carousel"]').each(function () { var c = a(this); b.call(c, c.data()) }) }) }(jQuery), +function (a) { "use strict"; function b(b) { var c, d = b.attr("data-target") || (c = b.attr("href")) && c.replace(/.*(?=#[^\s]+$)/, ""); return a(d) } function c(b) { return this.each(function () { var c = a(this), e = c.data("bs.collapse"), f = a.extend({}, d.DEFAULTS, c.data(), "object" == typeof b && b); !e && f.toggle && /show|hide/.test(b) && (f.toggle = !1), e || c.data("bs.collapse", e = new d(this, f)), "string" == typeof b && e[b]() }) } var d = function (b, c) { this.$element = a(b), this.options = a.extend({}, d.DEFAULTS, c), this.$trigger = a('[data-toggle="collapse"][href="#' + b.id + '"],[data-toggle="collapse"][data-target="#' + b.id + '"]'), this.transitioning = null, this.options.parent ? this.$parent = this.getParent() : this.addAriaAndCollapsedClass(this.$element, this.$trigger), this.options.toggle && this.toggle() }; d.VERSION = "3.3.7", d.TRANSITION_DURATION = 350, d.DEFAULTS = { toggle: !0 }, d.prototype.dimension = function () { var a = this.$element.hasClass("width"); return a ? "width" : "height" }, d.prototype.show = function () { if (!this.transitioning && !this.$element.hasClass("in")) { var b, e = this.$parent && this.$parent.children(".panel").children(".in, .collapsing"); if (!(e && e.length && (b = e.data("bs.collapse"), b && b.transitioning))) { var f = a.Event("show.bs.collapse"); if (this.$element.trigger(f), !f.isDefaultPrevented()) { e && e.length && (c.call(e, "hide"), b || e.data("bs.collapse", null)); var g = this.dimension(); this.$element.removeClass("collapse").addClass("collapsing")[g](0).attr("aria-expanded", !0), this.$trigger.removeClass("collapsed").attr("aria-expanded", !0), this.transitioning = 1; var h = function () { this.$element.removeClass("collapsing").addClass("collapse in")[g](""), this.transitioning = 0, this.$element.trigger("shown.bs.collapse") }; if (!a.support.transition) return h.call(this); var i = a.camelCase(["scroll", g].join("-")); this.$element.one("bsTransitionEnd", a.proxy(h, this)).emulateTransitionEnd(d.TRANSITION_DURATION)[g](this.$element[0][i]) } } } }, d.prototype.hide = function () { if (!this.transitioning && this.$element.hasClass("in")) { var b = a.Event("hide.bs.collapse"); if (this.$element.trigger(b), !b.isDefaultPrevented()) { var c = this.dimension(); this.$element[c](this.$element[c]())[0].offsetHeight, this.$element.addClass("collapsing").removeClass("collapse in").attr("aria-expanded", !1), this.$trigger.addClass("collapsed").attr("aria-expanded", !1), this.transitioning = 1; var e = function () { this.transitioning = 0, this.$element.removeClass("collapsing").addClass("collapse").trigger("hidden.bs.collapse") }; return a.support.transition ? void this.$element[c](0).one("bsTransitionEnd", a.proxy(e, this)).emulateTransitionEnd(d.TRANSITION_DURATION) : e.call(this) } } }, d.prototype.toggle = function () { this[this.$element.hasClass("in") ? "hide" : "show"]() }, d.prototype.getParent = function () { return a(this.options.parent).find('[data-toggle="collapse"][data-parent="' + this.options.parent + '"]').each(a.proxy(function (c, d) { var e = a(d); this.addAriaAndCollapsedClass(b(e), e) }, this)).end() }, d.prototype.addAriaAndCollapsedClass = function (a, b) { var c = a.hasClass("in"); a.attr("aria-expanded", c), b.toggleClass("collapsed", !c).attr("aria-expanded", c) }; var e = a.fn.collapse; a.fn.collapse = c, a.fn.collapse.Constructor = d, a.fn.collapse.noConflict = function () { return a.fn.collapse = e, this }, a(document).on("click.bs.collapse.data-api", '[data-toggle="collapse"]', function (d) { var e = a(this); e.attr("data-target") || d.preventDefault(); var f = b(e), g = f.data("bs.collapse"), h = g ? "toggle" : e.data(); c.call(f, h) }) }(jQuery), +function (a) { "use strict"; function b(b) { var c = b.attr("data-target"); c || (c = b.attr("href"), c = c && /#[A-Za-z]/.test(c) && c.replace(/.*(?=#[^\s]*$)/, "")); var d = c && a(c); return d && d.length ? d : b.parent() } function c(c) { c && 3 === c.which || (a(e).remove(), a(f).each(function () { var d = a(this), e = b(d), f = { relatedTarget: this }; e.hasClass("open") && (c && "click" == c.type && /input|textarea/i.test(c.target.tagName) && a.contains(e[0], c.target) || (e.trigger(c = a.Event("hide.bs.dropdown", f)), c.isDefaultPrevented() || (d.attr("aria-expanded", "false"), e.removeClass("open").trigger(a.Event("hidden.bs.dropdown", f))))) })) } function d(b) { return this.each(function () { var c = a(this), d = c.data("bs.dropdown"); d || c.data("bs.dropdown", d = new g(this)), "string" == typeof b && d[b].call(c) }) } var e = ".dropdown-backdrop", f = '[data-toggle="dropdown"]', g = function (b) { a(b).on("click.bs.dropdown", this.toggle) }; g.VERSION = "3.3.7", g.prototype.toggle = function (d) { var e = a(this); if (!e.is(".disabled, :disabled")) { var f = b(e), g = f.hasClass("open"); if (c(), !g) { "ontouchstart" in document.documentElement && !f.closest(".navbar-nav").length && a(document.createElement("div")).addClass("dropdown-backdrop").insertAfter(a(this)).on("click", c); var h = { relatedTarget: this }; if (f.trigger(d = a.Event("show.bs.dropdown", h)), d.isDefaultPrevented()) return; e.trigger("focus").attr("aria-expanded", "true"), f.toggleClass("open").trigger(a.Event("shown.bs.dropdown", h)) } return !1 } }, g.prototype.keydown = function (c) { if (/(38|40|27|32)/.test(c.which) && !/input|textarea/i.test(c.target.tagName)) { var d = a(this); if (c.preventDefault(), c.stopPropagation(), !d.is(".disabled, :disabled")) { var e = b(d), g = e.hasClass("open"); if (!g && 27 != c.which || g && 27 == c.which) return 27 == c.which && e.find(f).trigger("focus"), d.trigger("click"); var h = " li:not(.disabled):visible a", i = e.find(".dropdown-menu" + h); if (i.length) { var j = i.index(c.target); 38 == c.which && j > 0 && j--, 40 == c.which && j < i.length - 1 && j++, ~j || (j = 0), i.eq(j).trigger("focus") } } } }; var h = a.fn.dropdown; a.fn.dropdown = d, a.fn.dropdown.Constructor = g, a.fn.dropdown.noConflict = function () { return a.fn.dropdown = h, this }, a(document).on("click.bs.dropdown.data-api", c).on("click.bs.dropdown.data-api", ".dropdown form", function (a) { a.stopPropagation() }).on("click.bs.dropdown.data-api", f, g.prototype.toggle).on("keydown.bs.dropdown.data-api", f, g.prototype.keydown).on("keydown.bs.dropdown.data-api", ".dropdown-menu", g.prototype.keydown) }(jQuery), +function (a) { "use strict"; function b(b, d) { return this.each(function () { var e = a(this), f = e.data("bs.modal"), g = a.extend({}, c.DEFAULTS, e.data(), "object" == typeof b && b); f || e.data("bs.modal", f = new c(this, g)), "string" == typeof b ? f[b](d) : g.show && f.show(d) }) } var c = function (b, c) { this.options = c, this.$body = a(document.body), this.$element = a(b), this.$dialog = this.$element.find(".modal-dialog"), this.$backdrop = null, this.isShown = null, this.originalBodyPad = null, this.scrollbarWidth = 0, this.ignoreBackdropClick = !1, this.options.remote && this.$element.find(".modal-content").load(this.options.remote, a.proxy(function () { this.$element.trigger("loaded.bs.modal") }, this)) }; c.VERSION = "3.3.7", c.TRANSITION_DURATION = 300, c.BACKDROP_TRANSITION_DURATION = 150, c.DEFAULTS = { backdrop: !0, keyboard: !0, show: !0 }, c.prototype.toggle = function (a) { return this.isShown ? this.hide() : this.show(a) }, c.prototype.show = function (b) { var d = this, e = a.Event("show.bs.modal", { relatedTarget: b }); this.$element.trigger(e), this.isShown || e.isDefaultPrevented() || (this.isShown = !0, this.checkScrollbar(), this.setScrollbar(), this.$body.addClass("modal-open"), this.escape(), this.resize(), this.$element.on("click.dismiss.bs.modal", '[data-dismiss="modal"]', a.proxy(this.hide, this)), this.$dialog.on("mousedown.dismiss.bs.modal", function () { d.$element.one("mouseup.dismiss.bs.modal", function (b) { a(b.target).is(d.$element) && (d.ignoreBackdropClick = !0) }) }), this.backdrop(function () { var e = a.support.transition && d.$element.hasClass("fade"); d.$element.parent().length || d.$element.appendTo(d.$body), d.$element.show().scrollTop(0), d.adjustDialog(), e && d.$element[0].offsetWidth, d.$element.addClass("in"), d.enforceFocus(); var f = a.Event("shown.bs.modal", { relatedTarget: b }); e ? d.$dialog.one("bsTransitionEnd", function () { d.$element.trigger("focus").trigger(f) }).emulateTransitionEnd(c.TRANSITION_DURATION) : d.$element.trigger("focus").trigger(f) })) }, c.prototype.hide = function (b) { b && b.preventDefault(), b = a.Event("hide.bs.modal"), this.$element.trigger(b), this.isShown && !b.isDefaultPrevented() && (this.isShown = !1, this.escape(), this.resize(), a(document).off("focusin.bs.modal"), this.$element.removeClass("in").off("click.dismiss.bs.modal").off("mouseup.dismiss.bs.modal"), this.$dialog.off("mousedown.dismiss.bs.modal"), a.support.transition && this.$element.hasClass("fade") ? this.$element.one("bsTransitionEnd", a.proxy(this.hideModal, this)).emulateTransitionEnd(c.TRANSITION_DURATION) : this.hideModal()) }, c.prototype.enforceFocus = function () { a(document).off("focusin.bs.modal").on("focusin.bs.modal", a.proxy(function (a) { document === a.target || this.$element[0] === a.target || this.$element.has(a.target).length || this.$element.trigger("focus") }, this)) }, c.prototype.escape = function () { this.isShown && this.options.keyboard ? this.$element.on("keydown.dismiss.bs.modal", a.proxy(function (a) { 27 == a.which && this.hide() }, this)) : this.isShown || this.$element.off("keydown.dismiss.bs.modal") }, c.prototype.resize = function () { this.isShown ? a(window).on("resize.bs.modal", a.proxy(this.handleUpdate, this)) : a(window).off("resize.bs.modal") }, c.prototype.hideModal = function () { var a = this; this.$element.hide(), this.backdrop(function () { a.$body.removeClass("modal-open"), a.resetAdjustments(), a.resetScrollbar(), a.$element.trigger("hidden.bs.modal") }) }, c.prototype.removeBackdrop = function () { this.$backdrop && this.$backdrop.remove(), this.$backdrop = null }, c.prototype.backdrop = function (b) { var d = this, e = this.$element.hasClass("fade") ? "fade" : ""; if (this.isShown && this.options.backdrop) { var f = a.support.transition && e; if (this.$backdrop = a(document.createElement("div")).addClass("modal-backdrop " + e).appendTo(this.$body), this.$element.on("click.dismiss.bs.modal", a.proxy(function (a) { return this.ignoreBackdropClick ? void (this.ignoreBackdropClick = !1) : void (a.target === a.currentTarget && ("static" == this.options.backdrop ? this.$element[0].focus() : this.hide())) }, this)), f && this.$backdrop[0].offsetWidth, this.$backdrop.addClass("in"), !b) return; f ? this.$backdrop.one("bsTransitionEnd", b).emulateTransitionEnd(c.BACKDROP_TRANSITION_DURATION) : b() } else if (!this.isShown && this.$backdrop) { this.$backdrop.removeClass("in"); var g = function () { d.removeBackdrop(), b && b() }; a.support.transition && this.$element.hasClass("fade") ? this.$backdrop.one("bsTransitionEnd", g).emulateTransitionEnd(c.BACKDROP_TRANSITION_DURATION) : g() } else b && b() }, c.prototype.handleUpdate = function () { this.adjustDialog() }, c.prototype.adjustDialog = function () { var a = this.$element[0].scrollHeight > document.documentElement.clientHeight; this.$element.css({ paddingLeft: !this.bodyIsOverflowing && a ? this.scrollbarWidth : "", paddingRight: this.bodyIsOverflowing && !a ? this.scrollbarWidth : "" }) }, c.prototype.resetAdjustments = function () { this.$element.css({ paddingLeft: "", paddingRight: "" }) }, c.prototype.checkScrollbar = function () { var a = window.innerWidth; if (!a) { var b = document.documentElement.getBoundingClientRect(); a = b.right - Math.abs(b.left) } this.bodyIsOverflowing = document.body.clientWidth < a, this.scrollbarWidth = this.measureScrollbar() }, c.prototype.setScrollbar = function () { var a = parseInt(this.$body.css("padding-right") || 0, 10); this.originalBodyPad = document.body.style.paddingRight || "", this.bodyIsOverflowing && this.$body.css("padding-right", a + this.scrollbarWidth) }, c.prototype.resetScrollbar = function () { this.$body.css("padding-right", this.originalBodyPad) }, c.prototype.measureScrollbar = function () { var a = document.createElement("div"); a.className = "modal-scrollbar-measure", this.$body.append(a); var b = a.offsetWidth - a.clientWidth; return this.$body[0].removeChild(a), b }; var d = a.fn.modal; a.fn.modal = b, a.fn.modal.Constructor = c, a.fn.modal.noConflict = function () { return a.fn.modal = d, this }, a(document).on("click.bs.modal.data-api", '[data-toggle="modal"]', function (c) { var d = a(this), e = d.attr("href"), f = a(d.attr("data-target") || e && e.replace(/.*(?=#[^\s]+$)/, "")), g = f.data("bs.modal") ? "toggle" : a.extend({ remote: !/#/.test(e) && e }, f.data(), d.data()); d.is("a") && c.preventDefault(), f.one("show.bs.modal", function (a) { a.isDefaultPrevented() || f.one("hidden.bs.modal", function () { d.is(":visible") && d.trigger("focus") }) }), b.call(f, g, this) }) }(jQuery), +function (a) { "use strict"; function b(b) { return this.each(function () { var d = a(this), e = d.data("bs.tooltip"), f = "object" == typeof b && b; !e && /destroy|hide/.test(b) || (e || d.data("bs.tooltip", e = new c(this, f)), "string" == typeof b && e[b]()) }) } var c = function (a, b) { this.type = null, this.options = null, this.enabled = null, this.timeout = null, this.hoverState = null, this.$element = null, this.inState = null, this.init("tooltip", a, b) }; c.VERSION = "3.3.7", c.TRANSITION_DURATION = 150, c.DEFAULTS = { animation: !0, placement: "top", selector: !1, template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>', trigger: "hover focus", title: "", delay: 0, html: !1, container: !1, viewport: { selector: "body", padding: 0 } }, c.prototype.init = function (b, c, d) { if (this.enabled = !0, this.type = b, this.$element = a(c), this.options = this.getOptions(d), this.$viewport = this.options.viewport && a(a.isFunction(this.options.viewport) ? this.options.viewport.call(this, this.$element) : this.options.viewport.selector || this.options.viewport), this.inState = { click: !1, hover: !1, focus: !1 }, this.$element[0] instanceof document.constructor && !this.options.selector) throw new Error("`selector` option must be specified when initializing " + this.type + " on the window.document object!"); for (var e = this.options.trigger.split(" "), f = e.length; f--;) { var g = e[f]; if ("click" == g) this.$element.on("click." + this.type, this.options.selector, a.proxy(this.toggle, this)); else if ("manual" != g) { var h = "hover" == g ? "mouseenter" : "focusin", i = "hover" == g ? "mouseleave" : "focusout"; this.$element.on(h + "." + this.type, this.options.selector, a.proxy(this.enter, this)), this.$element.on(i + "." + this.type, this.options.selector, a.proxy(this.leave, this)) } } this.options.selector ? this._options = a.extend({}, this.options, { trigger: "manual", selector: "" }) : this.fixTitle() }, c.prototype.getDefaults = function () { return c.DEFAULTS }, c.prototype.getOptions = function (b) { return b = a.extend({}, this.getDefaults(), this.$element.data(), b), b.delay && "number" == typeof b.delay && (b.delay = { show: b.delay, hide: b.delay }), b }, c.prototype.getDelegateOptions = function () { var b = {}, c = this.getDefaults(); return this._options && a.each(this._options, function (a, d) { c[a] != d && (b[a] = d) }), b }, c.prototype.enter = function (b) { var c = b instanceof this.constructor ? b : a(b.currentTarget).data("bs." + this.type); return c || (c = new this.constructor(b.currentTarget, this.getDelegateOptions()), a(b.currentTarget).data("bs." + this.type, c)), b instanceof a.Event && (c.inState["focusin" == b.type ? "focus" : "hover"] = !0), c.tip().hasClass("in") || "in" == c.hoverState ? void (c.hoverState = "in") : (clearTimeout(c.timeout), c.hoverState = "in", c.options.delay && c.options.delay.show ? void (c.timeout = setTimeout(function () { "in" == c.hoverState && c.show() }, c.options.delay.show)) : c.show()) }, c.prototype.isInStateTrue = function () { for (var a in this.inState) if (this.inState[a]) return !0; return !1 }, c.prototype.leave = function (b) { var c = b instanceof this.constructor ? b : a(b.currentTarget).data("bs." + this.type); if (c || (c = new this.constructor(b.currentTarget, this.getDelegateOptions()), a(b.currentTarget).data("bs." + this.type, c)), b instanceof a.Event && (c.inState["focusout" == b.type ? "focus" : "hover"] = !1), !c.isInStateTrue()) return clearTimeout(c.timeout), c.hoverState = "out", c.options.delay && c.options.delay.hide ? void (c.timeout = setTimeout(function () { "out" == c.hoverState && c.hide() }, c.options.delay.hide)) : c.hide() }, c.prototype.show = function () { var b = a.Event("show.bs." + this.type); if (this.hasContent() && this.enabled) { this.$element.trigger(b); var d = a.contains(this.$element[0].ownerDocument.documentElement, this.$element[0]); if (b.isDefaultPrevented() || !d) return; var e = this, f = this.tip(), g = this.getUID(this.type); this.setContent(), f.attr("id", g), this.$element.attr("aria-describedby", g), this.options.animation && f.addClass("fade"); var h = "function" == typeof this.options.placement ? this.options.placement.call(this, f[0], this.$element[0]) : this.options.placement, i = /\s?auto?\s?/i, j = i.test(h); j && (h = h.replace(i, "") || "top"), f.detach().css({ top: 0, left: 0, display: "block" }).addClass(h).data("bs." + this.type, this), this.options.container ? f.appendTo(this.options.container) : f.insertAfter(this.$element), this.$element.trigger("inserted.bs." + this.type); var k = this.getPosition(), l = f[0].offsetWidth, m = f[0].offsetHeight; if (j) { var n = h, o = this.getPosition(this.$viewport); h = "bottom" == h && k.bottom + m > o.bottom ? "top" : "top" == h && k.top - m < o.top ? "bottom" : "right" == h && k.right + l > o.width ? "left" : "left" == h && k.left - l < o.left ? "right" : h, f.removeClass(n).addClass(h) } var p = this.getCalculatedOffset(h, k, l, m); this.applyPlacement(p, h); var q = function () { var a = e.hoverState; e.$element.trigger("shown.bs." + e.type), e.hoverState = null, "out" == a && e.leave(e) }; a.support.transition && this.$tip.hasClass("fade") ? f.one("bsTransitionEnd", q).emulateTransitionEnd(c.TRANSITION_DURATION) : q() } }, c.prototype.applyPlacement = function (b, c) { var d = this.tip(), e = d[0].offsetWidth, f = d[0].offsetHeight, g = parseInt(d.css("margin-top"), 10), h = parseInt(d.css("margin-left"), 10); isNaN(g) && (g = 0), isNaN(h) && (h = 0), b.top += g, b.left += h, a.offset.setOffset(d[0], a.extend({ using: function (a) { d.css({ top: Math.round(a.top), left: Math.round(a.left) }) } }, b), 0), d.addClass("in"); var i = d[0].offsetWidth, j = d[0].offsetHeight; "top" == c && j != f && (b.top = b.top + f - j); var k = this.getViewportAdjustedDelta(c, b, i, j); k.left ? b.left += k.left : b.top += k.top; var l = /top|bottom/.test(c), m = l ? 2 * k.left - e + i : 2 * k.top - f + j, n = l ? "offsetWidth" : "offsetHeight"; d.offset(b), this.replaceArrow(m, d[0][n], l) }, c.prototype.replaceArrow = function (a, b, c) { this.arrow().css(c ? "left" : "top", 50 * (1 - a / b) + "%").css(c ? "top" : "left", "") }, c.prototype.setContent = function () { var a = this.tip(), b = this.getTitle(); a.find(".tooltip-inner")[this.options.html ? "html" : "text"](b), a.removeClass("fade in top bottom left right") }, c.prototype.hide = function (b) { function d() { "in" != e.hoverState && f.detach(), e.$element && e.$element.removeAttr("aria-describedby").trigger("hidden.bs." + e.type), b && b() } var e = this, f = a(this.$tip), g = a.Event("hide.bs." + this.type); if (this.$element.trigger(g), !g.isDefaultPrevented()) return f.removeClass("in"), a.support.transition && f.hasClass("fade") ? f.one("bsTransitionEnd", d).emulateTransitionEnd(c.TRANSITION_DURATION) : d(), this.hoverState = null, this }, c.prototype.fixTitle = function () { var a = this.$element; (a.attr("title") || "string" != typeof a.attr("data-original-title")) && a.attr("data-original-title", a.attr("title") || "").attr("title", "") }, c.prototype.hasContent = function () { return this.getTitle() }, c.prototype.getPosition = function (b) { b = b || this.$element; var c = b[0], d = "BODY" == c.tagName, e = c.getBoundingClientRect(); null == e.width && (e = a.extend({}, e, { width: e.right - e.left, height: e.bottom - e.top })); var f = window.SVGElement && c instanceof window.SVGElement, g = d ? { top: 0, left: 0 } : f ? null : b.offset(), h = { scroll: d ? document.documentElement.scrollTop || document.body.scrollTop : b.scrollTop() }, i = d ? { width: a(window).width(), height: a(window).height() } : null; return a.extend({}, e, h, i, g) }, c.prototype.getCalculatedOffset = function (a, b, c, d) { return "bottom" == a ? { top: b.top + b.height, left: b.left + b.width / 2 - c / 2 } : "top" == a ? { top: b.top - d, left: b.left + b.width / 2 - c / 2 } : "left" == a ? { top: b.top + b.height / 2 - d / 2, left: b.left - c } : { top: b.top + b.height / 2 - d / 2, left: b.left + b.width } }, c.prototype.getViewportAdjustedDelta = function (a, b, c, d) { var e = { top: 0, left: 0 }; if (!this.$viewport) return e; var f = this.options.viewport && this.options.viewport.padding || 0, g = this.getPosition(this.$viewport); if (/right|left/.test(a)) { var h = b.top - f - g.scroll, i = b.top + f - g.scroll + d; h < g.top ? e.top = g.top - h : i > g.top + g.height && (e.top = g.top + g.height - i) } else { var j = b.left - f, k = b.left + f + c; j < g.left ? e.left = g.left - j : k > g.right && (e.left = g.left + g.width - k) } return e }, c.prototype.getTitle = function () { var a, b = this.$element, c = this.options; return a = b.attr("data-original-title") || ("function" == typeof c.title ? c.title.call(b[0]) : c.title) }, c.prototype.getUID = function (a) { do a += ~~(1e6 * Math.random()); while (document.getElementById(a)); return a }, c.prototype.tip = function () { if (!this.$tip && (this.$tip = a(this.options.template), 1 != this.$tip.length)) throw new Error(this.type + " `template` option must consist of exactly 1 top-level element!"); return this.$tip }, c.prototype.arrow = function () { return this.$arrow = this.$arrow || this.tip().find(".tooltip-arrow") }, c.prototype.enable = function () { this.enabled = !0 }, c.prototype.disable = function () { this.enabled = !1 }, c.prototype.toggleEnabled = function () { this.enabled = !this.enabled }, c.prototype.toggle = function (b) { var c = this; b && (c = a(b.currentTarget).data("bs." + this.type), c || (c = new this.constructor(b.currentTarget, this.getDelegateOptions()), a(b.currentTarget).data("bs." + this.type, c))), b ? (c.inState.click = !c.inState.click, c.isInStateTrue() ? c.enter(c) : c.leave(c)) : c.tip().hasClass("in") ? c.leave(c) : c.enter(c) }, c.prototype.destroy = function () { var a = this; clearTimeout(this.timeout), this.hide(function () { a.$element.off("." + a.type).removeData("bs." + a.type), a.$tip && a.$tip.detach(), a.$tip = null, a.$arrow = null, a.$viewport = null, a.$element = null }) }; var d = a.fn.tooltip; a.fn.tooltip = b, a.fn.tooltip.Constructor = c, a.fn.tooltip.noConflict = function () { return a.fn.tooltip = d, this } }(jQuery), +function (a) { "use strict"; function b(b) { return this.each(function () { var d = a(this), e = d.data("bs.popover"), f = "object" == typeof b && b; !e && /destroy|hide/.test(b) || (e || d.data("bs.popover", e = new c(this, f)), "string" == typeof b && e[b]()) }) } var c = function (a, b) { this.init("popover", a, b) }; if (!a.fn.tooltip) throw new Error("Popover requires tooltip.js"); c.VERSION = "3.3.7", c.DEFAULTS = a.extend({}, a.fn.tooltip.Constructor.DEFAULTS, { placement: "right", trigger: "click", content: "", template: '<div class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>' }), c.prototype = a.extend({}, a.fn.tooltip.Constructor.prototype), c.prototype.constructor = c, c.prototype.getDefaults = function () { return c.DEFAULTS }, c.prototype.setContent = function () { var a = this.tip(), b = this.getTitle(), c = this.getContent(); a.find(".popover-title")[this.options.html ? "html" : "text"](b), a.find(".popover-content").children().detach().end()[this.options.html ? "string" == typeof c ? "html" : "append" : "text"](c), a.removeClass("fade top bottom left right in"), a.find(".popover-title").html() || a.find(".popover-title").hide() }, c.prototype.hasContent = function () { return this.getTitle() || this.getContent() }, c.prototype.getContent = function () { var a = this.$element, b = this.options; return a.attr("data-content") || ("function" == typeof b.content ? b.content.call(a[0]) : b.content) }, c.prototype.arrow = function () { return this.$arrow = this.$arrow || this.tip().find(".arrow") }; var d = a.fn.popover; a.fn.popover = b, a.fn.popover.Constructor = c, a.fn.popover.noConflict = function () { return a.fn.popover = d, this } }(jQuery), +function (a) {
        "use strict"; function b(c, d) { this.$body = a(document.body), this.$scrollElement = a(a(c).is(document.body) ? window : c), this.options = a.extend({}, b.DEFAULTS, d), this.selector = (this.options.target || "") + " .nav li > a", this.offsets = [], this.targets = [], this.activeTarget = null, this.scrollHeight = 0, this.$scrollElement.on("scroll.bs.scrollspy", a.proxy(this.process, this)), this.refresh(), this.process() } function c(c) { return this.each(function () { var d = a(this), e = d.data("bs.scrollspy"), f = "object" == typeof c && c; e || d.data("bs.scrollspy", e = new b(this, f)), "string" == typeof c && e[c]() }) } b.VERSION = "3.3.7", b.DEFAULTS = { offset: 10 }, b.prototype.getScrollHeight = function () { return this.$scrollElement[0].scrollHeight || Math.max(this.$body[0].scrollHeight, document.documentElement.scrollHeight) }, b.prototype.refresh = function () { var b = this, c = "offset", d = 0; this.offsets = [], this.targets = [], this.scrollHeight = this.getScrollHeight(), a.isWindow(this.$scrollElement[0]) || (c = "position", d = this.$scrollElement.scrollTop()), this.$body.find(this.selector).map(function () { var b = a(this), e = b.data("target") || b.attr("href"), f = /^#./.test(e) && a(e); return f && f.length && f.is(":visible") && [[f[c]().top + d, e]] || null }).sort(function (a, b) { return a[0] - b[0] }).each(function () { b.offsets.push(this[0]), b.targets.push(this[1]) }) }, b.prototype.process = function () { var a, b = this.$scrollElement.scrollTop() + this.options.offset, c = this.getScrollHeight(), d = this.options.offset + c - this.$scrollElement.height(), e = this.offsets, f = this.targets, g = this.activeTarget; if (this.scrollHeight != c && this.refresh(), b >= d) return g != (a = f[f.length - 1]) && this.activate(a); if (g && b < e[0]) return this.activeTarget = null, this.clear(); for (a = e.length; a--;)g != f[a] && b >= e[a] && (void 0 === e[a + 1] || b < e[a + 1]) && this.activate(f[a]) }, b.prototype.activate = function (b) {
            this.activeTarget = b, this.clear(); var c = this.selector + '[data-target="' + b + '"],' + this.selector + '[href="' + b + '"]', d = a(c).parents("li").addClass("active"); d.parent(".dropdown-menu").length && (d = d.closest("li.dropdown").addClass("active")), d.trigger("activate.bs.scrollspy")
        }, b.prototype.clear = function () { a(this.selector).parentsUntil(this.options.target, ".active").removeClass("active") }; var d = a.fn.scrollspy; a.fn.scrollspy = c, a.fn.scrollspy.Constructor = b, a.fn.scrollspy.noConflict = function () { return a.fn.scrollspy = d, this }, a(window).on("load.bs.scrollspy.data-api", function () { a('[data-spy="scroll"]').each(function () { var b = a(this); c.call(b, b.data()) }) })
    }(jQuery), +function (a) { "use strict"; function b(b) { return this.each(function () { var d = a(this), e = d.data("bs.tab"); e || d.data("bs.tab", e = new c(this)), "string" == typeof b && e[b]() }) } var c = function (b) { this.element = a(b) }; c.VERSION = "3.3.7", c.TRANSITION_DURATION = 150, c.prototype.show = function () { var b = this.element, c = b.closest("ul:not(.dropdown-menu)"), d = b.data("target"); if (d || (d = b.attr("href"), d = d && d.replace(/.*(?=#[^\s]*$)/, "")), !b.parent("li").hasClass("active")) { var e = c.find(".active:last a"), f = a.Event("hide.bs.tab", { relatedTarget: b[0] }), g = a.Event("show.bs.tab", { relatedTarget: e[0] }); if (e.trigger(f), b.trigger(g), !g.isDefaultPrevented() && !f.isDefaultPrevented()) { var h = a(d); this.activate(b.closest("li"), c), this.activate(h, h.parent(), function () { e.trigger({ type: "hidden.bs.tab", relatedTarget: b[0] }), b.trigger({ type: "shown.bs.tab", relatedTarget: e[0] }) }) } } }, c.prototype.activate = function (b, d, e) { function f() { g.removeClass("active").find("> .dropdown-menu > .active").removeClass("active").end().find('[data-toggle="tab"]').attr("aria-expanded", !1), b.addClass("active").find('[data-toggle="tab"]').attr("aria-expanded", !0), h ? (b[0].offsetWidth, b.addClass("in")) : b.removeClass("fade"), b.parent(".dropdown-menu").length && b.closest("li.dropdown").addClass("active").end().find('[data-toggle="tab"]').attr("aria-expanded", !0), e && e() } var g = d.find("> .active"), h = e && a.support.transition && (g.length && g.hasClass("fade") || !!d.find("> .fade").length); g.length && h ? g.one("bsTransitionEnd", f).emulateTransitionEnd(c.TRANSITION_DURATION) : f(), g.removeClass("in") }; var d = a.fn.tab; a.fn.tab = b, a.fn.tab.Constructor = c, a.fn.tab.noConflict = function () { return a.fn.tab = d, this }; var e = function (c) { c.preventDefault(), b.call(a(this), "show") }; a(document).on("click.bs.tab.data-api", '[data-toggle="tab"]', e).on("click.bs.tab.data-api", '[data-toggle="pill"]', e) }(jQuery), +function (a) { "use strict"; function b(b) { return this.each(function () { var d = a(this), e = d.data("bs.affix"), f = "object" == typeof b && b; e || d.data("bs.affix", e = new c(this, f)), "string" == typeof b && e[b]() }) } var c = function (b, d) { this.options = a.extend({}, c.DEFAULTS, d), this.$target = a(this.options.target).on("scroll.bs.affix.data-api", a.proxy(this.checkPosition, this)).on("click.bs.affix.data-api", a.proxy(this.checkPositionWithEventLoop, this)), this.$element = a(b), this.affixed = null, this.unpin = null, this.pinnedOffset = null, this.checkPosition() }; c.VERSION = "3.3.7", c.RESET = "affix affix-top affix-bottom", c.DEFAULTS = { offset: 0, target: window }, c.prototype.getState = function (a, b, c, d) { var e = this.$target.scrollTop(), f = this.$element.offset(), g = this.$target.height(); if (null != c && "top" == this.affixed) return e < c && "top"; if ("bottom" == this.affixed) return null != c ? !(e + this.unpin <= f.top) && "bottom" : !(e + g <= a - d) && "bottom"; var h = null == this.affixed, i = h ? e : f.top, j = h ? g : b; return null != c && e <= c ? "top" : null != d && i + j >= a - d && "bottom" }, c.prototype.getPinnedOffset = function () { if (this.pinnedOffset) return this.pinnedOffset; this.$element.removeClass(c.RESET).addClass("affix"); var a = this.$target.scrollTop(), b = this.$element.offset(); return this.pinnedOffset = b.top - a }, c.prototype.checkPositionWithEventLoop = function () { setTimeout(a.proxy(this.checkPosition, this), 1) }, c.prototype.checkPosition = function () { if (this.$element.is(":visible")) { var b = this.$element.height(), d = this.options.offset, e = d.top, f = d.bottom, g = Math.max(a(document).height(), a(document.body).height()); "object" != typeof d && (f = e = d), "function" == typeof e && (e = d.top(this.$element)), "function" == typeof f && (f = d.bottom(this.$element)); var h = this.getState(g, b, e, f); if (this.affixed != h) { null != this.unpin && this.$element.css("top", ""); var i = "affix" + (h ? "-" + h : ""), j = a.Event(i + ".bs.affix"); if (this.$element.trigger(j), j.isDefaultPrevented()) return; this.affixed = h, this.unpin = "bottom" == h ? this.getPinnedOffset() : null, this.$element.removeClass(c.RESET).addClass(i).trigger(i.replace("affix", "affixed") + ".bs.affix") } "bottom" == h && this.$element.offset({ top: g - b - f }) } }; var d = a.fn.affix; a.fn.affix = b, a.fn.affix.Constructor = c, a.fn.affix.noConflict = function () { return a.fn.affix = d, this }, a(window).on("load", function () { a('[data-spy="affix"]').each(function () { var c = a(this), d = c.data(); d.offset = d.offset || {}, null != d.offsetBottom && (d.offset.bottom = d.offsetBottom), null != d.offsetTop && (d.offset.top = d.offsetTop), b.call(c, d) }) }) }(jQuery);</script>
<script type="text/javascript">/*
                         Highcharts JS v5.0.6 (2016-12-07)
                        
                         (c) 2009-2016 Torstein Honsi
                        
                         License: www.highcharts.com/license
                        */
    (function (L, a) { "object" === typeof module && module.exports ? module.exports = L.document ? a(L) : a : L.Highcharts = a(L) })("undefined" !== typeof window ? window : this, function (L) {
        L = function () {
            var a = window, D = a.document, C = a.navigator && a.navigator.userAgent || "", G = D && D.createElementNS && !!D.createElementNS("http://www.w3.org/2000/svg", "svg").createSVGRect, I = /(edge|msie|trident)/i.test(C) && !window.opera, h = !G, f = /Firefox/.test(C), p = f && 4 > parseInt(C.split("Firefox/")[1], 10); return a.Highcharts ? a.Highcharts.error(16, !0) : {
                product: "Highcharts",
                version: "5.0.6", deg2rad: 2 * Math.PI / 360, doc: D, hasBidiBug: p, hasTouch: D && void 0 !== D.documentElement.ontouchstart, isMS: I, isWebKit: /AppleWebKit/.test(C), isFirefox: f, isTouchDevice: /(Mobile|Android|Windows Phone)/.test(C), SVG_NS: "http://www.w3.org/2000/svg", chartCount: 0, seriesTypes: {}, symbolSizes: {}, svg: G, vml: h, win: a, charts: [], marginNames: ["plotTop", "marginRight", "marginBottom", "plotLeft"], noop: function () { }
            }
        }(); (function (a) {
            var D = [], C = a.charts, G = a.doc, I = a.win; a.error = function (h, f) {
                h = a.isNumber(h) ? "Highcharts error #" +
                    h + ": www.highcharts.com/errors/" + h : h; if (f) throw Error(h); I.console && console.log(h)
            }; a.Fx = function (a, f, p) { this.options = f; this.elem = a; this.prop = p }; a.Fx.prototype = {
                dSetter: function () { var a = this.paths[0], f = this.paths[1], p = [], v = this.now, l = a.length, u; if (1 === v) p = this.toD; else if (l === f.length && 1 > v) for (; l--;)u = parseFloat(a[l]), p[l] = isNaN(u) ? a[l] : v * parseFloat(f[l] - u) + u; else p = f; this.elem.attr("d", p, null, !0) }, update: function () {
                    var a = this.elem, f = this.prop, p = this.now, v = this.options.step; if (this[f + "Setter"]) this[f +
                        "Setter"](); else a.attr ? a.element && a.attr(f, p, null, !0) : a.style[f] = p + this.unit; v && v.call(a, p, this)
                }, run: function (a, f, p) { var h = this, l = function (a) { return l.stopped ? !1 : h.step(a) }, u; this.startTime = +new Date; this.start = a; this.end = f; this.unit = p; this.now = this.start; this.pos = 0; l.elem = this.elem; l.prop = this.prop; l() && 1 === D.push(l) && (l.timerId = setInterval(function () { for (u = 0; u < D.length; u++)D[u]() || D.splice(u--, 1); D.length || clearInterval(l.timerId) }, 13)) }, step: function (a) {
                    var f = +new Date, h, v = this.options; h = this.elem;
                    var l = v.complete, u = v.duration, d = v.curAnim, c; if (h.attr && !h.element) h = !1; else if (a || f >= u + this.startTime) { this.now = this.end; this.pos = 1; this.update(); a = d[this.prop] = !0; for (c in d) !0 !== d[c] && (a = !1); a && l && l.call(h); h = !1 } else this.pos = v.easing((f - this.startTime) / u), this.now = this.start + (this.end - this.start) * this.pos, this.update(), h = !0; return h
                }, initPath: function (h, f, p) {
                    function v(a) {
                        var e, b; for (q = a.length; q--;)e = "M" === a[q] || "L" === a[q], b = /[a-zA-Z]/.test(a[q + 3]), e && b && a.splice(q + 1, 0, a[q + 1], a[q + 2], a[q + 1], a[q +
                            2])
                    } function l(a, e) { for (; a.length < m;) { a[0] = e[m - a.length]; var b = a.slice(0, t);[].splice.apply(a, [0, 0].concat(b)); z && (b = a.slice(a.length - t), [].splice.apply(a, [a.length, 0].concat(b)), q--) } a[0] = "M" } function u(a, e) { for (var c = (m - a.length) / t; 0 < c && c--;)b = a.slice().splice(a.length / F - t, t * F), b[0] = e[m - t - c * t], y && (b[t - 6] = b[t - 2], b[t - 5] = b[t - 1]), [].splice.apply(a, [a.length / F, 0].concat(b)), z && c-- } f = f || ""; var d, c = h.startX, n = h.endX, y = -1 < f.indexOf("C"), t = y ? 7 : 3, m, b, q; f = f.split(" "); p = p.slice(); var z = h.isArea, F = z ? 2 : 1, e;
                    y && (v(f), v(p)); if (c && n) { for (q = 0; q < c.length; q++)if (c[q] === n[0]) { d = q; break } else if (c[0] === n[n.length - c.length + q]) { d = q; e = !0; break } void 0 === d && (f = []) } f.length && a.isNumber(d) && (m = p.length + d * F * t, e ? (l(f, p), u(p, f)) : (l(p, f), u(f, p))); return [f, p]
                }
            }; a.extend = function (a, f) { var h; a || (a = {}); for (h in f) a[h] = f[h]; return a }; a.merge = function () {
                var h, f = arguments, p, v = {}, l = function (h, d) {
                    var c, n; "object" !== typeof h && (h = {}); for (n in d) d.hasOwnProperty(n) && (c = d[n], a.isObject(c, !0) && "renderTo" !== n && "number" !== typeof c.nodeType ?
                        h[n] = l(h[n] || {}, c) : h[n] = d[n]); return h
                }; !0 === f[0] && (v = f[1], f = Array.prototype.slice.call(f, 2)); p = f.length; for (h = 0; h < p; h++)v = l(v, f[h]); return v
            }; a.pInt = function (a, f) { return parseInt(a, f || 10) }; a.isString = function (a) { return "string" === typeof a }; a.isArray = function (a) { a = Object.prototype.toString.call(a); return "[object Array]" === a || "[object Array Iterator]" === a }; a.isObject = function (h, f) { return h && "object" === typeof h && (!f || !a.isArray(h)) }; a.isNumber = function (a) { return "number" === typeof a && !isNaN(a) }; a.erase =
                function (a, f) { for (var h = a.length; h--;)if (a[h] === f) { a.splice(h, 1); break } }; a.defined = function (a) { return void 0 !== a && null !== a }; a.attr = function (h, f, p) { var v, l; if (a.isString(f)) a.defined(p) ? h.setAttribute(f, p) : h && h.getAttribute && (l = h.getAttribute(f)); else if (a.defined(f) && a.isObject(f)) for (v in f) h.setAttribute(v, f[v]); return l }; a.splat = function (h) { return a.isArray(h) ? h : [h] }; a.syncTimeout = function (a, f, p) { if (f) return setTimeout(a, f, p); a.call(0, p) }; a.pick = function () {
                    var a = arguments, f, p, v = a.length; for (f =
                        0; f < v; f++)if (p = a[f], void 0 !== p && null !== p) return p
                }; a.css = function (h, f) { a.isMS && !a.svg && f && void 0 !== f.opacity && (f.filter = "alpha(opacity\x3d" + 100 * f.opacity + ")"); a.extend(h.style, f) }; a.createElement = function (h, f, p, v, l) { h = G.createElement(h); var u = a.css; f && a.extend(h, f); l && u(h, { padding: 0, border: "none", margin: 0 }); p && u(h, p); v && v.appendChild(h); return h }; a.extendClass = function (h, f) { var p = function () { }; p.prototype = new h; a.extend(p.prototype, f); return p }; a.pad = function (a, f, p) {
                    return Array((f || 2) + 1 - String(a).length).join(p ||
                        0) + a
                }; a.relativeLength = function (a, f) { return /%$/.test(a) ? f * parseFloat(a) / 100 : parseFloat(a) }; a.wrap = function (a, f, p) { var h = a[f]; a[f] = function () { var a = Array.prototype.slice.call(arguments), f = arguments, d = this; d.proceed = function () { h.apply(d, arguments.length ? arguments : f) }; a.unshift(h); a = p.apply(this, a); d.proceed = null; return a } }; a.getTZOffset = function (h) { var f = a.Date; return 6E4 * (f.hcGetTimezoneOffset && f.hcGetTimezoneOffset(h) || f.hcTimezoneOffset || 0) }; a.dateFormat = function (h, f, p) {
                    if (!a.defined(f) || isNaN(f)) return a.defaultOptions.lang.invalidDate ||
                        ""; h = a.pick(h, "%Y-%m-%d %H:%M:%S"); var v = a.Date, l = new v(f - a.getTZOffset(f)), u, d = l[v.hcGetHours](), c = l[v.hcGetDay](), n = l[v.hcGetDate](), y = l[v.hcGetMonth](), t = l[v.hcGetFullYear](), m = a.defaultOptions.lang, b = m.weekdays, q = m.shortWeekdays, z = a.pad, v = a.extend({
                            a: q ? q[c] : b[c].substr(0, 3), A: b[c], d: z(n), e: z(n, 2, " "), w: c, b: m.shortMonths[y], B: m.months[y], m: z(y + 1), y: t.toString().substr(2, 2), Y: t, H: z(d), k: d, I: z(d % 12 || 12), l: d % 12 || 12, M: z(l[v.hcGetMinutes]()), p: 12 > d ? "AM" : "PM", P: 12 > d ? "am" : "pm", S: z(l.getSeconds()), L: z(Math.round(f %
                                1E3), 3)
                        }, a.dateFormats); for (u in v) for (; -1 !== h.indexOf("%" + u);)h = h.replace("%" + u, "function" === typeof v[u] ? v[u](f) : v[u]); return p ? h.substr(0, 1).toUpperCase() + h.substr(1) : h
                }; a.formatSingle = function (h, f) { var p = /\.([0-9])/, v = a.defaultOptions.lang; /f$/.test(h) ? (p = (p = h.match(p)) ? p[1] : -1, null !== f && (f = a.numberFormat(f, p, v.decimalPoint, -1 < h.indexOf(",") ? v.thousandsSep : ""))) : f = a.dateFormat(h, f); return f }; a.format = function (h, f) {
                    for (var p = "{", v = !1, l, u, d, c, n = [], y; h;) {
                        p = h.indexOf(p); if (-1 === p) break; l = h.slice(0,
                            p); if (v) { l = l.split(":"); u = l.shift().split("."); c = u.length; y = f; for (d = 0; d < c; d++)y = y[u[d]]; l.length && (y = a.formatSingle(l.join(":"), y)); n.push(y) } else n.push(l); h = h.slice(p + 1); p = (v = !v) ? "}" : "{"
                    } n.push(h); return n.join("")
                }; a.getMagnitude = function (a) { return Math.pow(10, Math.floor(Math.log(a) / Math.LN10)) }; a.normalizeTickInterval = function (h, f, p, v, l) {
                    var u, d = h; p = a.pick(p, 1); u = h / p; f || (f = l ? [1, 1.2, 1.5, 2, 2.5, 3, 4, 5, 6, 8, 10] : [1, 2, 2.5, 5, 10], !1 === v && (1 === p ? f = a.grep(f, function (a) { return 0 === a % 1 }) : .1 >= p && (f = [1 / p])));
                    for (v = 0; v < f.length && !(d = f[v], l && d * p >= h || !l && u <= (f[v] + (f[v + 1] || f[v])) / 2); v++); return d * p
                }; a.stableSort = function (a, f) { var p = a.length, h, l; for (l = 0; l < p; l++)a[l].safeI = l; a.sort(function (a, d) { h = f(a, d); return 0 === h ? a.safeI - d.safeI : h }); for (l = 0; l < p; l++)delete a[l].safeI }; a.arrayMin = function (a) { for (var f = a.length, p = a[0]; f--;)a[f] < p && (p = a[f]); return p }; a.arrayMax = function (a) { for (var f = a.length, p = a[0]; f--;)a[f] > p && (p = a[f]); return p }; a.destroyObjectProperties = function (a, f) {
                    for (var p in a) a[p] && a[p] !== f && a[p].destroy &&
                        a[p].destroy(), delete a[p]
                }; a.discardElement = function (h) { var f = a.garbageBin; f || (f = a.createElement("div")); h && f.appendChild(h); f.innerHTML = "" }; a.correctFloat = function (a, f) { return parseFloat(a.toPrecision(f || 14)) }; a.setAnimation = function (h, f) { f.renderer.globalAnimation = a.pick(h, f.options.chart.animation, !0) }; a.animObject = function (h) { return a.isObject(h) ? a.merge(h) : { duration: h ? 500 : 0 } }; a.timeUnits = { millisecond: 1, second: 1E3, minute: 6E4, hour: 36E5, day: 864E5, week: 6048E5, month: 24192E5, year: 314496E5 }; a.numberFormat =
                    function (h, f, p, v) { h = +h || 0; f = +f; var l = a.defaultOptions.lang, u = (h.toString().split(".")[1] || "").length, d, c, n = Math.abs(h); -1 === f ? f = Math.min(u, 20) : a.isNumber(f) || (f = 2); d = String(a.pInt(n.toFixed(f))); c = 3 < d.length ? d.length % 3 : 0; p = a.pick(p, l.decimalPoint); v = a.pick(v, l.thousandsSep); h = (0 > h ? "-" : "") + (c ? d.substr(0, c) + v : ""); h += d.substr(c).replace(/(\d{3})(?=\d)/g, "$1" + v); f && (v = Math.abs(n - d + Math.pow(10, -Math.max(f, u) - 1)), h += p + v.toFixed(f).slice(2)); return h }; Math.easeInOutSine = function (a) {
                        return -.5 * (Math.cos(Math.PI *
                            a) - 1)
                    }; a.getStyle = function (h, f) { return "width" === f ? Math.min(h.offsetWidth, h.scrollWidth) - a.getStyle(h, "padding-left") - a.getStyle(h, "padding-right") : "height" === f ? Math.min(h.offsetHeight, h.scrollHeight) - a.getStyle(h, "padding-top") - a.getStyle(h, "padding-bottom") : (h = I.getComputedStyle(h, void 0)) && a.pInt(h.getPropertyValue(f)) }; a.inArray = function (a, f) { return f.indexOf ? f.indexOf(a) : [].indexOf.call(f, a) }; a.grep = function (a, f) { return [].filter.call(a, f) }; a.find = function (a, f) { return [].find.call(a, f) }; a.map = function (a,
                        f) { for (var p = [], h = 0, l = a.length; h < l; h++)p[h] = f.call(a[h], a[h], h, a); return p }; a.offset = function (a) { var f = G.documentElement; a = a.getBoundingClientRect(); return { top: a.top + (I.pageYOffset || f.scrollTop) - (f.clientTop || 0), left: a.left + (I.pageXOffset || f.scrollLeft) - (f.clientLeft || 0) } }; a.stop = function (a, f) { for (var p = D.length; p--;)D[p].elem !== a || f && f !== D[p].prop || (D[p].stopped = !0) }; a.each = function (a, f, p) { return Array.prototype.forEach.call(a, f, p) }; a.addEvent = function (h, f, p) {
                            function v(a) {
                                a.target = a.srcElement ||
                                    I; p.call(h, a)
                            } var l = h.hcEvents = h.hcEvents || {}; h.addEventListener ? h.addEventListener(f, p, !1) : h.attachEvent && (h.hcEventsIE || (h.hcEventsIE = {}), h.hcEventsIE[p.toString()] = v, h.attachEvent("on" + f, v)); l[f] || (l[f] = []); l[f].push(p); return function () { a.removeEvent(h, f, p) }
                        }; a.removeEvent = function (h, f, p) {
                            function v(a, c) { h.removeEventListener ? h.removeEventListener(a, c, !1) : h.attachEvent && (c = h.hcEventsIE[c.toString()], h.detachEvent("on" + a, c)) } function l() {
                                var a, c; if (h.nodeName) for (c in f ? (a = {}, a[f] = !0) : a = d, a) if (d[c]) for (a =
                                    d[c].length; a--;)v(c, d[c][a])
                            } var u, d = h.hcEvents, c; d && (f ? (u = d[f] || [], p ? (c = a.inArray(p, u), -1 < c && (u.splice(c, 1), d[f] = u), v(f, p)) : (l(), d[f] = [])) : (l(), h.hcEvents = {}))
                        }; a.fireEvent = function (h, f, p, v) {
                            var l; l = h.hcEvents; var u, d; p = p || {}; if (G.createEvent && (h.dispatchEvent || h.fireEvent)) l = G.createEvent("Events"), l.initEvent(f, !0, !0), a.extend(l, p), h.dispatchEvent ? h.dispatchEvent(l) : h.fireEvent(f, l); else if (l) for (l = l[f] || [], u = l.length, p.target || a.extend(p, {
                                preventDefault: function () { p.defaultPrevented = !0 }, target: h,
                                type: f
                            }), f = 0; f < u; f++)(d = l[f]) && !1 === d.call(h, p) && p.preventDefault(); v && !p.defaultPrevented && v(p)
                        }; a.animate = function (h, f, p) {
                            var v, l = "", u, d, c; a.isObject(p) || (v = arguments, p = { duration: v[2], easing: v[3], complete: v[4] }); a.isNumber(p.duration) || (p.duration = 400); p.easing = "function" === typeof p.easing ? p.easing : Math[p.easing] || Math.easeInOutSine; p.curAnim = a.merge(f); for (c in f) a.stop(h, c), d = new a.Fx(h, p, c), u = null, "d" === c ? (d.paths = d.initPath(h, h.d, f.d), d.toD = f.d, v = 0, u = 1) : h.attr ? v = h.attr(c) : (v = parseFloat(a.getStyle(h,
                                c)) || 0, "opacity" !== c && (l = "px")), u || (u = f[c]), u.match && u.match("px") && (u = u.replace(/px/g, "")), d.run(v, u, l)
                        }; a.seriesType = function (h, f, p, v, l) { var u = a.getOptions(), d = a.seriesTypes; u.plotOptions[h] = a.merge(u.plotOptions[f], p); d[h] = a.extendClass(d[f] || function () { }, v); d[h].prototype.type = h; l && (d[h].prototype.pointClass = a.extendClass(a.Point, l)); return d[h] }; a.uniqueKey = function () { var a = Math.random().toString(36).substring(2, 9), f = 0; return function () { return "highcharts-" + a + "-" + f++ } }(); I.jQuery && (I.jQuery.fn.highcharts =
                            function () { var h = [].slice.call(arguments); if (this[0]) return h[0] ? (new (a[a.isString(h[0]) ? h.shift() : "Chart"])(this[0], h[0], h[1]), this) : C[a.attr(this[0], "data-highcharts-chart")] }); G && !G.defaultView && (a.getStyle = function (h, f) {
                                var p = { width: "clientWidth", height: "clientHeight" }[f]; if (h.style[f]) return a.pInt(h.style[f]); "opacity" === f && (f = "filter"); if (p) return h.style.zoom = 1, Math.max(h[p] - 2 * a.getStyle(h, "padding"), 0); h = h.currentStyle[f.replace(/\-(\w)/g, function (a, l) { return l.toUpperCase() })]; "filter" ===
                                    f && (h = h.replace(/alpha\(opacity=([0-9]+)\)/, function (a, l) { return l / 100 })); return "" === h ? 1 : a.pInt(h)
                            }); Array.prototype.forEach || (a.each = function (a, f, p) { for (var h = 0, l = a.length; h < l; h++)if (!1 === f.call(p, a[h], h, a)) return h }); Array.prototype.indexOf || (a.inArray = function (a, f) { var p, h = 0; if (f) for (p = f.length; h < p; h++)if (f[h] === a) return h; return -1 }); Array.prototype.filter || (a.grep = function (a, f) { for (var p = [], h = 0, l = a.length; h < l; h++)f(a[h], h) && p.push(a[h]); return p }); Array.prototype.find || (a.find = function (a, f) {
                                var p,
                                    h = a.length; for (p = 0; p < h; p++)if (f(a[p], p)) return a[p]
                            })
        })(L); (function (a) {
            var D = a.each, C = a.isNumber, G = a.map, I = a.merge, h = a.pInt; a.Color = function (f) { if (!(this instanceof a.Color)) return new a.Color(f); this.init(f) }; a.Color.prototype = {
                parsers: [{ regex: /rgba\(\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9]?(?:\.[0-9]+)?)\s*\)/, parse: function (a) { return [h(a[1]), h(a[2]), h(a[3]), parseFloat(a[4], 10)] } }, {
                    regex: /#([a-fA-F0-9]{2})([a-fA-F0-9]{2})([a-fA-F0-9]{2})/, parse: function (a) {
                        return [h(a[1],
                            16), h(a[2], 16), h(a[3], 16), 1]
                    }
                }, { regex: /rgb\(\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*\)/, parse: function (a) { return [h(a[1]), h(a[2]), h(a[3]), 1] } }], names: { white: "#ffffff", black: "#000000" }, init: function (f) { var p, h, l, u; if ((this.input = f = this.names[f] || f) && f.stops) this.stops = G(f.stops, function (d) { return new a.Color(d[1]) }); else for (l = this.parsers.length; l-- && !h;)u = this.parsers[l], (p = u.regex.exec(f)) && (h = u.parse(p)); this.rgba = h || [] }, get: function (a) {
                    var f = this.input, h = this.rgba, l; this.stops ?
                        (l = I(f), l.stops = [].concat(l.stops), D(this.stops, function (f, d) { l.stops[d] = [l.stops[d][0], f.get(a)] })) : l = h && C(h[0]) ? "rgb" === a || !a && 1 === h[3] ? "rgb(" + h[0] + "," + h[1] + "," + h[2] + ")" : "a" === a ? h[3] : "rgba(" + h.join(",") + ")" : f; return l
                }, brighten: function (a) { var f, v = this.rgba; if (this.stops) D(this.stops, function (l) { l.brighten(a) }); else if (C(a) && 0 !== a) for (f = 0; 3 > f; f++)v[f] += h(255 * a), 0 > v[f] && (v[f] = 0), 255 < v[f] && (v[f] = 255); return this }, setOpacity: function (a) { this.rgba[3] = a; return this }
            }; a.color = function (f) { return new a.Color(f) }
        })(L);
        (function (a) {
            var D, C, G = a.addEvent, I = a.animate, h = a.attr, f = a.charts, p = a.color, v = a.css, l = a.createElement, u = a.defined, d = a.deg2rad, c = a.destroyObjectProperties, n = a.doc, y = a.each, t = a.extend, m = a.erase, b = a.grep, q = a.hasTouch, z = a.isArray, F = a.isFirefox, e = a.isMS, r = a.isObject, x = a.isString, A = a.isWebKit, k = a.merge, w = a.noop, K = a.pick, J = a.pInt, N = a.removeEvent, g = a.stop, B = a.svg, S = a.SVG_NS, M = a.symbolSizes, R = a.win; D = a.SVGElement = function () { return this }; D.prototype = {
                opacity: 1, SVG_NS: S, textProps: "direction fontSize fontWeight fontFamily fontStyle color lineHeight width textDecoration textOverflow textOutline".split(" "),
                init: function (a, H) { this.element = "span" === H ? l(H) : n.createElementNS(this.SVG_NS, H); this.renderer = a }, animate: function (E, H, g) { H = a.animObject(K(H, this.renderer.globalAnimation, !0)); 0 !== H.duration ? (g && (H.complete = g), I(this, E, H)) : this.attr(E, null, g); return this }, colorGradient: function (E, H, g) {
                    var e = this.renderer, c, b, B, r, m, w, q, d, x, n, P, t = [], A; E.linearGradient ? b = "linearGradient" : E.radialGradient && (b = "radialGradient"); if (b) {
                        B = E[b]; m = e.gradients; q = E.stops; n = g.radialReference; z(B) && (E[b] = B = {
                            x1: B[0], y1: B[1], x2: B[2],
                            y2: B[3], gradientUnits: "userSpaceOnUse"
                        }); "radialGradient" === b && n && !u(B.gradientUnits) && (r = B, B = k(B, e.getRadialAttr(n, r), { gradientUnits: "userSpaceOnUse" })); for (P in B) "id" !== P && t.push(P, B[P]); for (P in q) t.push(q[P]); t = t.join(","); m[t] ? n = m[t].attr("id") : (B.id = n = a.uniqueKey(), m[t] = w = e.createElement(b).attr(B).add(e.defs), w.radAttr = r, w.stops = [], y(q, function (E) {
                            0 === E[1].indexOf("rgba") ? (c = a.color(E[1]), d = c.get("rgb"), x = c.get("a")) : (d = E[1], x = 1); E = e.createElement("stop").attr({
                                offset: E[0], "stop-color": d,
                                "stop-opacity": x
                            }).add(w); w.stops.push(E)
                        })); A = "url(" + e.url + "#" + n + ")"; g.setAttribute(H, A); g.gradient = t; E.toString = function () { return A }
                    }
                }, applyTextOutline: function (a) {
                    var E = this.element, g, e, k, b; -1 !== a.indexOf("contrast") && (a = a.replace(/contrast/g, this.renderer.getContrast(E.style.fill))); this.fakeTS = !0; this.ySetter = this.xSetter; g = [].slice.call(E.getElementsByTagName("tspan")); a = a.split(" "); e = a[a.length - 1]; (k = a[0]) && "none" !== k && (k = k.replace(/(^[\d\.]+)(.*?)$/g, function (a, E, H) { return 2 * E + H }), y(g, function (a) {
                        "highcharts-text-outline" ===
                            a.getAttribute("class") && m(g, E.removeChild(a))
                    }), b = E.firstChild, y(g, function (a, H) { 0 === H && (a.setAttribute("x", E.getAttribute("x")), H = E.getAttribute("y"), a.setAttribute("y", H || 0), null === H && E.setAttribute("y", 0)); a = a.cloneNode(1); h(a, { "class": "highcharts-text-outline", fill: e, stroke: e, "stroke-width": k, "stroke-linejoin": "round" }); E.insertBefore(a, b) }))
                }, attr: function (a, H, e, k) {
                    var E, b = this.element, c, B = this, r; "string" === typeof a && void 0 !== H && (E = a, a = {}, a[E] = H); if ("string" === typeof a) B = (this[a + "Getter"] ||
                        this._defaultGetter).call(this, a, b); else { for (E in a) H = a[E], r = !1, k || g(this, E), this.symbolName && /^(x|y|width|height|r|start|end|innerR|anchorX|anchorY)/.test(E) && (c || (this.symbolAttr(a), c = !0), r = !0), !this.rotation || "x" !== E && "y" !== E || (this.doTransform = !0), r || (r = this[E + "Setter"] || this._defaultSetter, r.call(this, H, E, b), this.shadows && /^(width|height|visibility|x|y|d|transform|cx|cy|r)$/.test(E) && this.updateShadows(E, H, r)); this.doTransform && (this.updateTransform(), this.doTransform = !1) } e && e(); return B
                }, updateShadows: function (a,
                    H, g) { for (var E = this.shadows, e = E.length; e--;)g.call(E[e], "height" === a ? Math.max(H - (E[e].cutHeight || 0), 0) : "d" === a ? this.d : H, a, E[e]) }, addClass: function (a, H) { var E = this.attr("class") || ""; -1 === E.indexOf(a) && (H || (a = (E + (E ? " " : "") + a).replace("  ", " ")), this.attr("class", a)); return this }, hasClass: function (a) { return -1 !== h(this.element, "class").indexOf(a) }, removeClass: function (a) { h(this.element, "class", (h(this.element, "class") || "").replace(a, "")); return this }, symbolAttr: function (a) {
                        var E = this; y("x y r start end width height innerR anchorX anchorY".split(" "),
                            function (g) { E[g] = K(a[g], E[g]) }); E.attr({ d: E.renderer.symbols[E.symbolName](E.x, E.y, E.width, E.height, E) })
                    }, clip: function (a) { return this.attr("clip-path", a ? "url(" + this.renderer.url + "#" + a.id + ")" : "none") }, crisp: function (a, g) {
                        var E, H = {}, e; g = g || a.strokeWidth || 0; e = Math.round(g) % 2 / 2; a.x = Math.floor(a.x || this.x || 0) + e; a.y = Math.floor(a.y || this.y || 0) + e; a.width = Math.floor((a.width || this.width || 0) - 2 * e); a.height = Math.floor((a.height || this.height || 0) - 2 * e); u(a.strokeWidth) && (a.strokeWidth = g); for (E in a) this[E] !== a[E] &&
                            (this[E] = H[E] = a[E]); return H
                    }, css: function (a) {
                        var g = this.styles, E = {}, k = this.element, b, c, r = ""; b = !g; a && a.color && (a.fill = a.color); if (g) for (c in a) a[c] !== g[c] && (E[c] = a[c], b = !0); if (b) {
                            b = this.textWidth = a && a.width && "text" === k.nodeName.toLowerCase() && J(a.width) || this.textWidth; g && (a = t(g, E)); this.styles = a; b && !B && this.renderer.forExport && delete a.width; if (e && !B) v(this.element, a); else { g = function (a, g) { return "-" + g.toLowerCase() }; for (c in a) r += c.replace(/([A-Z])/g, g) + ":" + a[c] + ";"; h(k, "style", r) } this.added && (b &&
                                this.renderer.buildText(this), a && a.textOutline && this.applyTextOutline(a.textOutline))
                        } return this
                    }, strokeWidth: function () { return this["stroke-width"] || 0 }, on: function (a, g) { var E = this, e = E.element; q && "click" === a ? (e.ontouchstart = function (a) { E.touchEventFired = Date.now(); a.preventDefault(); g.call(e, a) }, e.onclick = function (a) { (-1 === R.navigator.userAgent.indexOf("Android") || 1100 < Date.now() - (E.touchEventFired || 0)) && g.call(e, a) }) : e["on" + a] = g; return this }, setRadialReference: function (a) {
                        var g = this.renderer.gradients[this.element.gradient];
                        this.element.radialReference = a; g && g.radAttr && g.animate(this.renderer.getRadialAttr(a, g.radAttr)); return this
                    }, translate: function (a, g) { return this.attr({ translateX: a, translateY: g }) }, invert: function (a) { this.inverted = a; this.updateTransform(); return this }, updateTransform: function () {
                        var a = this.translateX || 0, g = this.translateY || 0, e = this.scaleX, k = this.scaleY, b = this.inverted, c = this.rotation, B = this.element; b && (a += this.attr("width"), g += this.attr("height")); a = ["translate(" + a + "," + g + ")"]; b ? a.push("rotate(90) scale(-1,1)") :
                            c && a.push("rotate(" + c + " " + (B.getAttribute("x") || 0) + " " + (B.getAttribute("y") || 0) + ")"); (u(e) || u(k)) && a.push("scale(" + K(e, 1) + " " + K(k, 1) + ")"); a.length && B.setAttribute("transform", a.join(" "))
                    }, toFront: function () { var a = this.element; a.parentNode.appendChild(a); return this }, align: function (a, g, e) {
                        var E, H, k, b, c = {}; H = this.renderer; k = H.alignedObjects; var B, r; if (a) { if (this.alignOptions = a, this.alignByTranslate = g, !e || x(e)) this.alignTo = E = e || "renderer", m(k, this), k.push(this), e = null } else a = this.alignOptions, g = this.alignByTranslate,
                            E = this.alignTo; e = K(e, H[E], H); E = a.align; H = a.verticalAlign; k = (e.x || 0) + (a.x || 0); b = (e.y || 0) + (a.y || 0); "right" === E ? B = 1 : "center" === E && (B = 2); B && (k += (e.width - (a.width || 0)) / B); c[g ? "translateX" : "x"] = Math.round(k); "bottom" === H ? r = 1 : "middle" === H && (r = 2); r && (b += (e.height - (a.height || 0)) / r); c[g ? "translateY" : "y"] = Math.round(b); this[this.placed ? "animate" : "attr"](c); this.placed = !0; this.alignAttr = c; return this
                    }, getBBox: function (a, g) {
                        var E, H = this.renderer, k, b = this.element, c = this.styles, B, r = this.textStr, m, w = H.cache, q = H.cacheKeys,
                            x; g = K(g, this.rotation); k = g * d; B = c && c.fontSize; void 0 !== r && (x = r.toString(), -1 === x.indexOf("\x3c") && (x = x.replace(/[0-9]/g, "0")), x += ["", g || 0, B, b.style.width, b.style["text-overflow"]].join()); x && !a && (E = w[x]); if (!E) {
                                if (b.namespaceURI === this.SVG_NS || H.forExport) {
                                    try { (m = this.fakeTS && function (a) { y(b.querySelectorAll(".highcharts-text-outline"), function (g) { g.style.display = a }) }) && m("none"), E = b.getBBox ? t({}, b.getBBox()) : { width: b.offsetWidth, height: b.offsetHeight }, m && m("") } catch (T) { } if (!E || 0 > E.width) E = {
                                        width: 0,
                                        height: 0
                                    }
                                } else E = this.htmlGetBBox(); H.isSVG && (a = E.width, H = E.height, e && c && "11px" === c.fontSize && "16.9" === H.toPrecision(3) && (E.height = H = 14), g && (E.width = Math.abs(H * Math.sin(k)) + Math.abs(a * Math.cos(k)), E.height = Math.abs(H * Math.cos(k)) + Math.abs(a * Math.sin(k)))); if (x && 0 < E.height) { for (; 250 < q.length;)delete w[q.shift()]; w[x] || q.push(x); w[x] = E }
                            } return E
                    }, show: function (a) { return this.attr({ visibility: a ? "inherit" : "visible" }) }, hide: function () { return this.attr({ visibility: "hidden" }) }, fadeOut: function (a) {
                        var g =
                            this; g.animate({ opacity: 0 }, { duration: a || 150, complete: function () { g.attr({ y: -9999 }) } })
                    }, add: function (a) { var g = this.renderer, e = this.element, E; a && (this.parentGroup = a); this.parentInverted = a && a.inverted; void 0 !== this.textStr && g.buildText(this); this.added = !0; if (!a || a.handleZ || this.zIndex) E = this.zIndexSetter(); E || (a ? a.element : g.box).appendChild(e); if (this.onAdd) this.onAdd(); return this }, safeRemoveChild: function (a) { var g = a.parentNode; g && g.removeChild(a) }, destroy: function () {
                        var a = this.element || {}, e = this.renderer.isSVG &&
                            "SPAN" === a.nodeName && this.parentGroup, k, b; a.onclick = a.onmouseout = a.onmouseover = a.onmousemove = a.point = null; g(this); this.clipPath && (this.clipPath = this.clipPath.destroy()); if (this.stops) { for (b = 0; b < this.stops.length; b++)this.stops[b] = this.stops[b].destroy(); this.stops = null } this.safeRemoveChild(a); for (this.destroyShadows(); e && e.div && 0 === e.div.childNodes.length;)a = e.parentGroup, this.safeRemoveChild(e.div), delete e.div, e = a; this.alignTo && m(this.renderer.alignedObjects, this); for (k in this) delete this[k]; return null
                    },
                shadow: function (a, g, e) {
                    var E = [], b, k, H = this.element, c, B, r, m; if (!a) this.destroyShadows(); else if (!this.shadows) {
                        B = K(a.width, 3); r = (a.opacity || .15) / B; m = this.parentInverted ? "(-1,-1)" : "(" + K(a.offsetX, 1) + ", " + K(a.offsetY, 1) + ")"; for (b = 1; b <= B; b++)k = H.cloneNode(0), c = 2 * B + 1 - 2 * b, h(k, { isShadow: "true", stroke: a.color || "#000000", "stroke-opacity": r * b, "stroke-width": c, transform: "translate" + m, fill: "none" }), e && (h(k, "height", Math.max(h(k, "height") - c, 0)), k.cutHeight = c), g ? g.element.appendChild(k) : H.parentNode.insertBefore(k,
                            H), E.push(k); this.shadows = E
                    } return this
                }, destroyShadows: function () { y(this.shadows || [], function (a) { this.safeRemoveChild(a) }, this); this.shadows = void 0 }, xGetter: function (a) { "circle" === this.element.nodeName && ("x" === a ? a = "cx" : "y" === a && (a = "cy")); return this._defaultGetter(a) }, _defaultGetter: function (a) { a = K(this[a], this.element ? this.element.getAttribute(a) : null, 0); /^[\-0-9\.]+$/.test(a) && (a = parseFloat(a)); return a }, dSetter: function (a, g, e) {
                    a && a.join && (a = a.join(" ")); /(NaN| {2}|^$)/.test(a) && (a = "M 0 0"); e.setAttribute(g,
                        a); this[g] = a
                }, dashstyleSetter: function (a) { var g, e = this["stroke-width"]; "inherit" === e && (e = 1); if (a = a && a.toLowerCase()) { a = a.replace("shortdashdotdot", "3,1,1,1,1,1,").replace("shortdashdot", "3,1,1,1").replace("shortdot", "1,1,").replace("shortdash", "3,1,").replace("longdash", "8,3,").replace(/dot/g, "1,3,").replace("dash", "4,3,").replace(/,$/, "").split(","); for (g = a.length; g--;)a[g] = J(a[g]) * e; a = a.join(",").replace(/NaN/g, "none"); this.element.setAttribute("stroke-dasharray", a) } }, alignSetter: function (a) {
                    this.element.setAttribute("text-anchor",
                        { left: "start", center: "middle", right: "end" }[a])
                }, opacitySetter: function (a, g, e) { this[g] = a; e.setAttribute(g, a) }, titleSetter: function (a) { var g = this.element.getElementsByTagName("title")[0]; g || (g = n.createElementNS(this.SVG_NS, "title"), this.element.appendChild(g)); g.firstChild && g.removeChild(g.firstChild); g.appendChild(n.createTextNode(String(K(a), "").replace(/<[^>]*>/g, ""))) }, textSetter: function (a) { a !== this.textStr && (delete this.bBox, this.textStr = a, this.added && this.renderer.buildText(this)) }, fillSetter: function (a,
                    g, e) { "string" === typeof a ? e.setAttribute(g, a) : a && this.colorGradient(a, g, e) }, visibilitySetter: function (a, g, e) { "inherit" === a ? e.removeAttribute(g) : e.setAttribute(g, a) }, zIndexSetter: function (a, g) {
                        var e = this.renderer, k = this.parentGroup, b = (k || e).element || e.box, c, B = this.element, H; c = this.added; var r; u(a) && (B.zIndex = a, a = +a, this[g] === a && (c = !1), this[g] = a); if (c) {
                            (a = this.zIndex) && k && (k.handleZ = !0); g = b.childNodes; for (r = 0; r < g.length && !H; r++)k = g[r], c = k.zIndex, k !== B && (J(c) > a || !u(a) && u(c) || 0 > a && !u(c) && b !== e.box) && (b.insertBefore(B,
                                k), H = !0); H || b.appendChild(B)
                        } return H
                    }, _defaultSetter: function (a, g, e) { e.setAttribute(g, a) }
            }; D.prototype.yGetter = D.prototype.xGetter; D.prototype.translateXSetter = D.prototype.translateYSetter = D.prototype.rotationSetter = D.prototype.verticalAlignSetter = D.prototype.scaleXSetter = D.prototype.scaleYSetter = function (a, g) { this[g] = a; this.doTransform = !0 }; D.prototype["stroke-widthSetter"] = D.prototype.strokeSetter = function (a, g, e) {
                this[g] = a; this.stroke && this["stroke-width"] ? (D.prototype.fillSetter.call(this, this.stroke,
                    "stroke", e), e.setAttribute("stroke-width", this["stroke-width"]), this.hasStroke = !0) : "stroke-width" === g && 0 === a && this.hasStroke && (e.removeAttribute("stroke"), this.hasStroke = !1)
            }; C = a.SVGRenderer = function () { this.init.apply(this, arguments) }; C.prototype = {
                Element: D, SVG_NS: S, init: function (a, g, e, k, b, c) {
                    var B; k = this.createElement("svg").attr({ version: "1.1", "class": "highcharts-root" }).css(this.getStyle(k)); B = k.element; a.appendChild(B); -1 === a.innerHTML.indexOf("xmlns") && h(B, "xmlns", this.SVG_NS); this.isSVG = !0;
                    this.box = B; this.boxWrapper = k; this.alignedObjects = []; this.url = (F || A) && n.getElementsByTagName("base").length ? R.location.href.replace(/#.*?$/, "").replace(/([\('\)])/g, "\\$1").replace(/ /g, "%20") : ""; this.createElement("desc").add().element.appendChild(n.createTextNode("Created with Highcharts 5.0.6")); this.defs = this.createElement("defs").add(); this.allowHTML = c; this.forExport = b; this.gradients = {}; this.cache = {}; this.cacheKeys = []; this.imgCount = 0; this.setSize(g, e, !1); var H; F && a.getBoundingClientRect && (g = function () {
                        v(a,
                            { left: 0, top: 0 }); H = a.getBoundingClientRect(); v(a, { left: Math.ceil(H.left) - H.left + "px", top: Math.ceil(H.top) - H.top + "px" })
                    }, g(), this.unSubPixelFix = G(R, "resize", g))
                }, getStyle: function (a) { return this.style = t({ fontFamily: '"Lucida Grande", "Lucida Sans Unicode", Arial, Helvetica, sans-serif', fontSize: "12px" }, a) }, setStyle: function (a) { this.boxWrapper.css(this.getStyle(a)) }, isHidden: function () { return !this.boxWrapper.getBBox().width }, destroy: function () {
                    var a = this.defs; this.box = null; this.boxWrapper = this.boxWrapper.destroy();
                    c(this.gradients || {}); this.gradients = null; a && (this.defs = a.destroy()); this.unSubPixelFix && this.unSubPixelFix(); return this.alignedObjects = null
                }, createElement: function (a) { var g = new this.Element; g.init(this, a); return g }, draw: w, getRadialAttr: function (a, g) { return { cx: a[0] - a[2] / 2 + g.cx * a[2], cy: a[1] - a[2] / 2 + g.cy * a[2], r: g.r * a[2] } }, buildText: function (a) {
                    for (var g = a.element, e = this, k = e.forExport, c = K(a.textStr, "").toString(), r = -1 !== c.indexOf("\x3c"), m = g.childNodes, w, E, q, x, d = h(g, "x"), t = a.styles, A = a.textWidth, z = t &&
                        t.lineHeight, l = t && t.textOutline, F = t && "ellipsis" === t.textOverflow, f = m.length, u = A && !a.added && this.box, p = function (a) { var k; k = /(px|em)$/.test(a && a.style.fontSize) ? a.style.fontSize : t && t.fontSize || e.style.fontSize || 12; return z ? J(z) : e.fontMetrics(k, a.getAttribute("style") ? a : g).h }; f--;)g.removeChild(m[f]); r || l || F || A || -1 !== c.indexOf(" ") ? (w = /<.*class="([^"]+)".*>/, E = /<.*style="([^"]+)".*>/, q = /<.*href="(http[^"]+)".*>/, u && u.appendChild(g), c = r ? c.replace(/<(b|strong)>/g, '\x3cspan style\x3d"font-weight:bold"\x3e').replace(/<(i|em)>/g,
                            '\x3cspan style\x3d"font-style:italic"\x3e').replace(/<a/g, "\x3cspan").replace(/<\/(b|strong|i|em|a)>/g, "\x3c/span\x3e").split(/<br.*?>/g) : [c], c = b(c, function (a) { return "" !== a }), y(c, function (b, c) {
                                var r, H = 0; b = b.replace(/^\s+|\s+$/g, "").replace(/<span/g, "|||\x3cspan").replace(/<\/span>/g, "\x3c/span\x3e|||"); r = b.split("|||"); y(r, function (b) {
                                    if ("" !== b || 1 === r.length) {
                                        var m = {}, l = n.createElementNS(e.SVG_NS, "tspan"), z, f; w.test(b) && (z = b.match(w)[1], h(l, "class", z)); E.test(b) && (f = b.match(E)[1].replace(/(;| |^)color([ :])/,
                                            "$1fill$2"), h(l, "style", f)); q.test(b) && !k && (h(l, "onclick", 'location.href\x3d"' + b.match(q)[1] + '"'), v(l, { cursor: "pointer" })); b = (b.replace(/<(.|\n)*?>/g, "") || " ").replace(/&lt;/g, "\x3c").replace(/&gt;/g, "\x3e"); if (" " !== b) {
                                                l.appendChild(n.createTextNode(b)); H ? m.dx = 0 : c && null !== d && (m.x = d); h(l, m); g.appendChild(l); !H && c && (!B && k && v(l, { display: "block" }), h(l, "dy", p(l))); if (A) {
                                                    m = b.replace(/([^\^])-/g, "$1- ").split(" "); z = "nowrap" === t.whiteSpace; for (var K = 1 < r.length || c || 1 < m.length && !z, u, y, J = [], M = p(l), P = a.rotation,
                                                        O = b, N = O.length; (K || F) && (m.length || J.length);)a.rotation = 0, u = a.getBBox(!0), y = u.width, !B && e.forExport && (y = e.measureSpanWidth(l.firstChild.data, a.styles)), u = y > A, void 0 === x && (x = u), F && x ? (N /= 2, "" === O || !u && .5 > N ? m = [] : (O = b.substring(0, O.length + (u ? -1 : 1) * Math.ceil(N)), m = [O + (3 < A ? "\u2026" : "")], l.removeChild(l.firstChild))) : u && 1 !== m.length ? (l.removeChild(l.firstChild), J.unshift(m.pop())) : (m = J, J = [], m.length && !z && (l = n.createElementNS(S, "tspan"), h(l, { dy: M, x: d }), f && h(l, "style", f), g.appendChild(l)), y > A && (A = y)), m.length &&
                                                            l.appendChild(n.createTextNode(m.join(" ").replace(/- /g, "-"))); a.rotation = P
                                                } H++
                                            }
                                    }
                                })
                            }), x && a.attr("title", a.textStr), u && u.removeChild(g), l && a.applyTextOutline && a.applyTextOutline(l)) : g.appendChild(n.createTextNode(c.replace(/&lt;/g, "\x3c").replace(/&gt;/g, "\x3e")))
                }, getContrast: function (a) { a = p(a).rgba; return 510 < a[0] + a[1] + a[2] ? "#000000" : "#FFFFFF" }, button: function (a, g, b, c, B, r, m, w, q) {
                    var H = this.label(a, g, b, q, null, null, null, null, "button"), E = 0; H.attr(k({ padding: 8, r: 2 }, B)); var x, d, n, l; B = k({
                        fill: "#f7f7f7",
                        stroke: "#cccccc", "stroke-width": 1, style: { color: "#333333", cursor: "pointer", fontWeight: "normal" }
                    }, B); x = B.style; delete B.style; r = k(B, { fill: "#e6e6e6" }, r); d = r.style; delete r.style; m = k(B, { fill: "#e6ebf5", style: { color: "#000000", fontWeight: "bold" } }, m); n = m.style; delete m.style; w = k(B, { style: { color: "#cccccc" } }, w); l = w.style; delete w.style; G(H.element, e ? "mouseover" : "mouseenter", function () { 3 !== E && H.setState(1) }); G(H.element, e ? "mouseout" : "mouseleave", function () { 3 !== E && H.setState(E) }); H.setState = function (a) {
                        1 !== a &&
                            (H.state = E = a); H.removeClass(/highcharts-button-(normal|hover|pressed|disabled)/).addClass("highcharts-button-" + ["normal", "hover", "pressed", "disabled"][a || 0]); H.attr([B, r, m, w][a || 0]).css([x, d, n, l][a || 0])
                    }; H.attr(B).css(t({ cursor: "default" }, x)); return H.on("click", function (a) { 3 !== E && c.call(H, a) })
                }, crispLine: function (a, g) { a[1] === a[4] && (a[1] = a[4] = Math.round(a[1]) - g % 2 / 2); a[2] === a[5] && (a[2] = a[5] = Math.round(a[2]) + g % 2 / 2); return a }, path: function (a) { var g = { fill: "none" }; z(a) ? g.d = a : r(a) && t(g, a); return this.createElement("path").attr(g) },
                circle: function (a, g, e) { a = r(a) ? a : { x: a, y: g, r: e }; g = this.createElement("circle"); g.xSetter = g.ySetter = function (a, g, e) { e.setAttribute("c" + g, a) }; return g.attr(a) }, arc: function (a, g, e, b, k, c) { r(a) && (g = a.y, e = a.r, b = a.innerR, k = a.start, c = a.end, a = a.x); a = this.symbol("arc", a || 0, g || 0, e || 0, e || 0, { innerR: b || 0, start: k || 0, end: c || 0 }); a.r = e; return a }, rect: function (a, g, e, b, k, c) {
                    k = r(a) ? a.r : k; var B = this.createElement("rect"); a = r(a) ? a : void 0 === a ? {} : { x: a, y: g, width: Math.max(e, 0), height: Math.max(b, 0) }; void 0 !== c && (a.strokeWidth =
                        c, a = B.crisp(a)); a.fill = "none"; k && (a.r = k); B.rSetter = function (a, g, e) { h(e, { rx: a, ry: a }) }; return B.attr(a)
                }, setSize: function (a, g, e) { var b = this.alignedObjects, k = b.length; this.width = a; this.height = g; for (this.boxWrapper.animate({ width: a, height: g }, { step: function () { this.attr({ viewBox: "0 0 " + this.attr("width") + " " + this.attr("height") }) }, duration: K(e, !0) ? void 0 : 0 }); k--;)b[k].align() }, g: function (a) { var g = this.createElement("g"); return a ? g.attr({ "class": "highcharts-" + a }) : g }, image: function (a, g, e, b, k) {
                    var c = { preserveAspectRatio: "none" };
                    1 < arguments.length && t(c, { x: g, y: e, width: b, height: k }); c = this.createElement("image").attr(c); c.element.setAttributeNS ? c.element.setAttributeNS("http://www.w3.org/1999/xlink", "href", a) : c.element.setAttribute("hc-svg-href", a); return c
                }, symbol: function (a, g, e, b, k, c) {
                    var B = this, r, H = this.symbols[a], m = u(g) && H && H(Math.round(g), Math.round(e), b, k, c), w = /^url\((.*?)\)$/, q, x; H ? (r = this.path(m), r.attr("fill", "none"), t(r, { symbolName: a, x: g, y: e, width: b, height: k }), c && t(r, c)) : w.test(a) && (q = a.match(w)[1], r = this.image(q),
                        r.imgwidth = K(M[q] && M[q].width, c && c.width), r.imgheight = K(M[q] && M[q].height, c && c.height), x = function () { r.attr({ width: r.width, height: r.height }) }, y(["width", "height"], function (a) { r[a + "Setter"] = function (a, g) { var e = {}, b = this["img" + g], k = "width" === g ? "translateX" : "translateY"; this[g] = a; u(b) && (this.element && this.element.setAttribute(g, b), this.alignByTranslate || (e[k] = ((this[g] || 0) - b) / 2, this.attr(e))) } }), u(g) && r.attr({ x: g, y: e }), r.isImg = !0, u(r.imgwidth) && u(r.imgheight) ? x() : (r.attr({ width: 0, height: 0 }), l("img", {
                            onload: function () {
                                var a =
                                    f[B.chartIndex]; 0 === this.width && (v(this, { position: "absolute", top: "-999em" }), n.body.appendChild(this)); M[q] = { width: this.width, height: this.height }; r.imgwidth = this.width; r.imgheight = this.height; r.element && x(); this.parentNode && this.parentNode.removeChild(this); B.imgCount--; if (!B.imgCount && a && a.onload) a.onload()
                            }, src: q
                        }), this.imgCount++)); return r
                }, symbols: {
                    circle: function (a, g, e, b) { var k = .166 * e; return ["M", a + e / 2, g, "C", a + e + k, g, a + e + k, g + b, a + e / 2, g + b, "C", a - k, g + b, a - k, g, a + e / 2, g, "Z"] }, square: function (a, g, e, b) {
                        return ["M",
                            a, g, "L", a + e, g, a + e, g + b, a, g + b, "Z"]
                    }, triangle: function (a, g, e, b) { return ["M", a + e / 2, g, "L", a + e, g + b, a, g + b, "Z"] }, "triangle-down": function (a, g, e, b) { return ["M", a, g, "L", a + e, g, a + e / 2, g + b, "Z"] }, diamond: function (a, g, e, b) { return ["M", a + e / 2, g, "L", a + e, g + b / 2, a + e / 2, g + b, a, g + b / 2, "Z"] }, arc: function (a, g, e, b, k) {
                        var c = k.start; e = k.r || e || b; var B = k.end - .001; b = k.innerR; var r = k.open, m = Math.cos(c), H = Math.sin(c), w = Math.cos(B), B = Math.sin(B); k = k.end - c < Math.PI ? 0 : 1; return ["M", a + e * m, g + e * H, "A", e, e, 0, k, 1, a + e * w, g + e * B, r ? "M" : "L", a + b * w, g + b * B,
                            "A", b, b, 0, k, 0, a + b * m, g + b * H, r ? "" : "Z"]
                    }, callout: function (a, g, e, b, k) {
                        var c = Math.min(k && k.r || 0, e, b), B = c + 6, r = k && k.anchorX; k = k && k.anchorY; var m; m = ["M", a + c, g, "L", a + e - c, g, "C", a + e, g, a + e, g, a + e, g + c, "L", a + e, g + b - c, "C", a + e, g + b, a + e, g + b, a + e - c, g + b, "L", a + c, g + b, "C", a, g + b, a, g + b, a, g + b - c, "L", a, g + c, "C", a, g, a, g, a + c, g]; r && r > e ? k > g + B && k < g + b - B ? m.splice(13, 3, "L", a + e, k - 6, a + e + 6, k, a + e, k + 6, a + e, g + b - c) : m.splice(13, 3, "L", a + e, b / 2, r, k, a + e, b / 2, a + e, g + b - c) : r && 0 > r ? k > g + B && k < g + b - B ? m.splice(33, 3, "L", a, k + 6, a - 6, k, a, k - 6, a, g + c) : m.splice(33, 3, "L",
                            a, b / 2, r, k, a, b / 2, a, g + c) : k && k > b && r > a + B && r < a + e - B ? m.splice(23, 3, "L", r + 6, g + b, r, g + b + 6, r - 6, g + b, a + c, g + b) : k && 0 > k && r > a + B && r < a + e - B && m.splice(3, 3, "L", r - 6, g, r, g - 6, r + 6, g, e - c, g); return m
                    }
                }, clipRect: function (g, e, b, k) { var c = a.uniqueKey(), B = this.createElement("clipPath").attr({ id: c }).add(this.defs); g = this.rect(g, e, b, k, 0).add(B); g.id = c; g.clipPath = B; g.count = 0; return g }, text: function (a, g, e, b) {
                    var k = !B && this.forExport, c = {}; if (b && (this.allowHTML || !this.forExport)) return this.html(a, g, e); c.x = Math.round(g || 0); e && (c.y = Math.round(e));
                    if (a || 0 === a) c.text = a; a = this.createElement("text").attr(c); k && a.css({ position: "absolute" }); b || (a.xSetter = function (a, g, e) { var b = e.getElementsByTagName("tspan"), k, c = e.getAttribute(g), B; for (B = 0; B < b.length; B++)k = b[B], k.getAttribute(g) === c && k.setAttribute(g, a); e.setAttribute(g, a) }); return a
                }, fontMetrics: function (a, g) {
                    a = a || g && g.style && g.style.fontSize || this.style && this.style.fontSize; a = /px/.test(a) ? J(a) : /em/.test(a) ? parseFloat(a) * (g ? this.fontMetrics(null, g.parentNode).f : 16) : 12; g = 24 > a ? a + 3 : Math.round(1.2 *
                        a); return { h: g, b: Math.round(.8 * g), f: a }
                }, rotCorr: function (a, g, e) { var b = a; g && e && (b = Math.max(b * Math.cos(g * d), 4)); return { x: -a / 3 * Math.sin(g * d), y: b } }, label: function (a, g, e, b, c, B, r, m, w) {
                    var q = this, x = q.g("button" !== w && "label"), d = x.text = q.text("", 0, 0, r).attr({ zIndex: 1 }), H, n, l = 0, A = 3, z = 0, F, f, K, p, J, h = {}, M, S, E = /^url\((.*?)\)$/.test(b), v = E, P, R, O, Q; w && x.addClass("highcharts-" + w); v = E; P = function () { return (M || 0) % 2 / 2 }; R = function () {
                        var a = d.element.style, g = {}; n = (void 0 === F || void 0 === f || J) && u(d.textStr) && d.getBBox(); x.width =
                            (F || n.width || 0) + 2 * A + z; x.height = (f || n.height || 0) + 2 * A; S = A + q.fontMetrics(a && a.fontSize, d).b; v && (H || (x.box = H = q.symbols[b] || E ? q.symbol(b) : q.rect(), H.addClass(("button" === w ? "" : "highcharts-label-box") + (w ? " highcharts-" + w + "-box" : "")), H.add(x), a = P(), g.x = a, g.y = (m ? -S : 0) + a), g.width = Math.round(x.width), g.height = Math.round(x.height), H.attr(t(g, h)), h = {})
                    }; O = function () {
                        var a = z + A, g; g = m ? 0 : S; u(F) && n && ("center" === J || "right" === J) && (a += { center: .5, right: 1 }[J] * (F - n.width)); if (a !== d.x || g !== d.y) d.attr("x", a), void 0 !== g && d.attr("y",
                            g); d.x = a; d.y = g
                    }; Q = function (a, g) { H ? H.attr(a, g) : h[a] = g }; x.onAdd = function () { d.add(x); x.attr({ text: a || 0 === a ? a : "", x: g, y: e }); H && u(c) && x.attr({ anchorX: c, anchorY: B }) }; x.widthSetter = function (a) { F = a }; x.heightSetter = function (a) { f = a }; x["text-alignSetter"] = function (a) { J = a }; x.paddingSetter = function (a) { u(a) && a !== A && (A = x.padding = a, O()) }; x.paddingLeftSetter = function (a) { u(a) && a !== z && (z = a, O()) }; x.alignSetter = function (a) { a = { left: 0, center: .5, right: 1 }[a]; a !== l && (l = a, n && x.attr({ x: K })) }; x.textSetter = function (a) {
                        void 0 !==
                            a && d.textSetter(a); R(); O()
                    }; x["stroke-widthSetter"] = function (a, g) { a && (v = !0); M = this["stroke-width"] = a; Q(g, a) }; x.strokeSetter = x.fillSetter = x.rSetter = function (a, g) { "fill" === g && a && (v = !0); Q(g, a) }; x.anchorXSetter = function (a, g) { c = a; Q(g, Math.round(a) - P() - K) }; x.anchorYSetter = function (a, g) { B = a; Q(g, a - p) }; x.xSetter = function (a) { x.x = a; l && (a -= l * ((F || n.width) + 2 * A)); K = Math.round(a); x.attr("translateX", K) }; x.ySetter = function (a) { p = x.y = Math.round(a); x.attr("translateY", p) }; var V = x.css; return t(x, {
                        css: function (a) {
                            if (a) {
                                var g =
                                    {}; a = k(a); y(x.textProps, function (e) { void 0 !== a[e] && (g[e] = a[e], delete a[e]) }); d.css(g)
                            } return V.call(x, a)
                        }, getBBox: function () { return { width: n.width + 2 * A, height: n.height + 2 * A, x: n.x - A, y: n.y - A } }, shadow: function (a) { a && (R(), H && H.shadow(a)); return x }, destroy: function () { N(x.element, "mouseenter"); N(x.element, "mouseleave"); d && (d = d.destroy()); H && (H = H.destroy()); D.prototype.destroy.call(x); x = q = R = O = Q = null }
                    })
                }
            }; a.Renderer = C
        })(L); (function (a) {
            var D = a.attr, C = a.createElement, G = a.css, I = a.defined, h = a.each, f = a.extend, p =
                a.isFirefox, v = a.isMS, l = a.isWebKit, u = a.pInt, d = a.SVGRenderer, c = a.win, n = a.wrap; f(a.SVGElement.prototype, {
                    htmlCss: function (a) { var c = this.element; if (c = a && "SPAN" === c.tagName && a.width) delete a.width, this.textWidth = c, this.updateTransform(); a && "ellipsis" === a.textOverflow && (a.whiteSpace = "nowrap", a.overflow = "hidden"); this.styles = f(this.styles, a); G(this.element, a); return this }, htmlGetBBox: function () {
                        var a = this.element; "text" === a.nodeName && (a.style.position = "absolute"); return {
                            x: a.offsetLeft, y: a.offsetTop, width: a.offsetWidth,
                            height: a.offsetHeight
                        }
                    }, htmlUpdateTransform: function () {
                        if (this.added) {
                            var a = this.renderer, c = this.element, m = this.translateX || 0, b = this.translateY || 0, q = this.x || 0, d = this.y || 0, n = this.textAlign || "left", e = { left: 0, center: .5, right: 1 }[n], r = this.styles; G(c, { marginLeft: m, marginTop: b }); this.shadows && h(this.shadows, function (a) { G(a, { marginLeft: m + 1, marginTop: b + 1 }) }); this.inverted && h(c.childNodes, function (e) { a.invertChild(e, c) }); if ("SPAN" === c.tagName) {
                                var x = this.rotation, A = u(this.textWidth), k = r && r.whiteSpace, w = [x,
                                    n, c.innerHTML, this.textWidth, this.textAlign].join(); w !== this.cTT && (r = a.fontMetrics(c.style.fontSize).b, I(x) && this.setSpanRotation(x, e, r), G(c, { width: "", whiteSpace: k || "nowrap" }), c.offsetWidth > A && /[ \-]/.test(c.textContent || c.innerText) && G(c, { width: A + "px", display: "block", whiteSpace: k || "normal" }), this.getSpanCorrection(c.offsetWidth, r, e, x, n)); G(c, { left: q + (this.xCorr || 0) + "px", top: d + (this.yCorr || 0) + "px" }); l && (r = c.offsetHeight); this.cTT = w
                            }
                        } else this.alignOnAdd = !0
                    }, setSpanRotation: function (a, d, m) {
                        var b = {},
                            q = v ? "-ms-transform" : l ? "-webkit-transform" : p ? "MozTransform" : c.opera ? "-o-transform" : ""; b[q] = b.transform = "rotate(" + a + "deg)"; b[q + (p ? "Origin" : "-origin")] = b.transformOrigin = 100 * d + "% " + m + "px"; G(this.element, b)
                    }, getSpanCorrection: function (a, c, m) { this.xCorr = -a * m; this.yCorr = -c }
                }); f(d.prototype, {
                    html: function (a, c, m) {
                        var b = this.createElement("span"), q = b.element, d = b.renderer, l = d.isSVG, e = function (a, e) { h(["opacity", "visibility"], function (b) { n(a, b + "Setter", function (a, b, c, r) { a.call(this, b, c, r); e[c] = b }) }) }; b.textSetter =
                            function (a) { a !== q.innerHTML && delete this.bBox; q.innerHTML = this.textStr = a; b.htmlUpdateTransform() }; l && e(b, b.element.style); b.xSetter = b.ySetter = b.alignSetter = b.rotationSetter = function (a, e) { "align" === e && (e = "textAlign"); b[e] = a; b.htmlUpdateTransform() }; b.attr({ text: a, x: Math.round(c), y: Math.round(m) }).css({ fontFamily: this.style.fontFamily, fontSize: this.style.fontSize, position: "absolute" }); q.style.whiteSpace = "nowrap"; b.css = b.htmlCss; l && (b.add = function (a) {
                                var c, r = d.box.parentNode, k = []; if (this.parentGroup =
                                    a) {
                                    if (c = a.div, !c) {
                                        for (; a;)k.push(a), a = a.parentGroup; h(k.reverse(), function (a) {
                                            var m, x = D(a.element, "class"); x && (x = { className: x }); c = a.div = a.div || C("div", x, { position: "absolute", left: (a.translateX || 0) + "px", top: (a.translateY || 0) + "px", display: a.display, opacity: a.opacity, pointerEvents: a.styles && a.styles.pointerEvents }, c || r); m = c.style; f(a, {
                                                on: function () { b.on.apply({ element: k[0].div }, arguments); return a }, translateXSetter: function (e, g) { m.left = e + "px"; a[g] = e; a.doTransform = !0 }, translateYSetter: function (e, g) {
                                                    m.top =
                                                        e + "px"; a[g] = e; a.doTransform = !0
                                                }
                                            }); e(a, m)
                                        })
                                    }
                                } else c = r; c.appendChild(q); b.added = !0; b.alignOnAdd && b.htmlUpdateTransform(); return b
                            }); return b
                    }
                })
        })(L); (function (a) {
            var D, C, G = a.createElement, I = a.css, h = a.defined, f = a.deg2rad, p = a.discardElement, v = a.doc, l = a.each, u = a.erase, d = a.extend; D = a.extendClass; var c = a.isArray, n = a.isNumber, y = a.isObject, t = a.merge; C = a.noop; var m = a.pick, b = a.pInt, q = a.SVGElement, z = a.SVGRenderer, F = a.win; a.svg || (C = {
                docMode8: v && 8 === v.documentMode, init: function (a, b) {
                    var e = ["\x3c", b, ' filled\x3d"f" stroked\x3d"f"'],
                        c = ["position: ", "absolute", ";"], k = "div" === b; ("shape" === b || k) && c.push("left:0;top:0;width:1px;height:1px;"); c.push("visibility: ", k ? "hidden" : "visible"); e.push(' style\x3d"', c.join(""), '"/\x3e'); b && (e = k || "span" === b || "img" === b ? e.join("") : a.prepVML(e), this.element = G(e)); this.renderer = a
                }, add: function (a) {
                    var e = this.renderer, b = this.element, c = e.box, k = a && a.inverted, c = a ? a.element || a : c; a && (this.parentGroup = a); k && e.invertChild(b, c); c.appendChild(b); this.added = !0; this.alignOnAdd && !this.deferUpdateTransform && this.updateTransform();
                    if (this.onAdd) this.onAdd(); this.className && this.attr("class", this.className); return this
                }, updateTransform: q.prototype.htmlUpdateTransform, setSpanRotation: function () { var a = this.rotation, b = Math.cos(a * f), c = Math.sin(a * f); I(this.element, { filter: a ? ["progid:DXImageTransform.Microsoft.Matrix(M11\x3d", b, ", M12\x3d", -c, ", M21\x3d", c, ", M22\x3d", b, ", sizingMethod\x3d'auto expand')"].join("") : "none" }) }, getSpanCorrection: function (a, b, c, q, k) {
                    var e = q ? Math.cos(q * f) : 1, r = q ? Math.sin(q * f) : 0, x = m(this.elemHeight, this.element.offsetHeight),
                        d; this.xCorr = 0 > e && -a; this.yCorr = 0 > r && -x; d = 0 > e * r; this.xCorr += r * b * (d ? 1 - c : c); this.yCorr -= e * b * (q ? d ? c : 1 - c : 1); k && "left" !== k && (this.xCorr -= a * c * (0 > e ? -1 : 1), q && (this.yCorr -= x * c * (0 > r ? -1 : 1)), I(this.element, { textAlign: k }))
                }, pathToVML: function (a) { for (var e = a.length, b = []; e--;)n(a[e]) ? b[e] = Math.round(10 * a[e]) - 5 : "Z" === a[e] ? b[e] = "x" : (b[e] = a[e], !a.isArc || "wa" !== a[e] && "at" !== a[e] || (b[e + 5] === b[e + 7] && (b[e + 7] += a[e + 7] > a[e + 5] ? 1 : -1), b[e + 6] === b[e + 8] && (b[e + 8] += a[e + 8] > a[e + 6] ? 1 : -1))); return b.join(" ") || "x" }, clip: function (a) {
                    var e =
                        this, b; a ? (b = a.members, u(b, e), b.push(e), e.destroyClip = function () { u(b, e) }, a = a.getCSS(e)) : (e.destroyClip && e.destroyClip(), a = { clip: e.docMode8 ? "inherit" : "rect(auto)" }); return e.css(a)
                }, css: q.prototype.htmlCss, safeRemoveChild: function (a) { a.parentNode && p(a) }, destroy: function () { this.destroyClip && this.destroyClip(); return q.prototype.destroy.apply(this) }, on: function (a, b) { this.element["on" + a] = function () { var a = F.event; a.target = a.srcElement; b(a) }; return this }, cutOffPath: function (a, c) {
                    var e; a = a.split(/[ ,]/);
                    e = a.length; if (9 === e || 11 === e) a[e - 4] = a[e - 2] = b(a[e - 2]) - 10 * c; return a.join(" ")
                }, shadow: function (a, c, q) {
                    var e = [], k, r = this.element, d = this.renderer, x, n = r.style, g, B = r.path, l, t, z, f; B && "string" !== typeof B.value && (B = "x"); t = B; if (a) {
                        z = m(a.width, 3); f = (a.opacity || .15) / z; for (k = 1; 3 >= k; k++)l = 2 * z + 1 - 2 * k, q && (t = this.cutOffPath(B.value, l + .5)), g = ['\x3cshape isShadow\x3d"true" strokeweight\x3d"', l, '" filled\x3d"false" path\x3d"', t, '" coordsize\x3d"10 10" style\x3d"', r.style.cssText, '" /\x3e'], x = G(d.prepVML(g), null, {
                            left: b(n.left) +
                                m(a.offsetX, 1), top: b(n.top) + m(a.offsetY, 1)
                        }), q && (x.cutOff = l + 1), g = ['\x3cstroke color\x3d"', a.color || "#000000", '" opacity\x3d"', f * k, '"/\x3e'], G(d.prepVML(g), null, null, x), c ? c.element.appendChild(x) : r.parentNode.insertBefore(x, r), e.push(x); this.shadows = e
                    } return this
                }, updateShadows: C, setAttr: function (a, b) { this.docMode8 ? this.element[a] = b : this.element.setAttribute(a, b) }, classSetter: function (a) { (this.added ? this.element : this).className = a }, dashstyleSetter: function (a, b, c) {
                    (c.getElementsByTagName("stroke")[0] ||
                        G(this.renderer.prepVML(["\x3cstroke/\x3e"]), null, null, c))[b] = a || "solid"; this[b] = a
                }, dSetter: function (a, b, c) { var e = this.shadows; a = a || []; this.d = a.join && a.join(" "); c.path = a = this.pathToVML(a); if (e) for (c = e.length; c--;)e[c].path = e[c].cutOff ? this.cutOffPath(a, e[c].cutOff) : a; this.setAttr(b, a) }, fillSetter: function (a, b, c) { var e = c.nodeName; "SPAN" === e ? c.style.color = a : "IMG" !== e && (c.filled = "none" !== a, this.setAttr("fillcolor", this.renderer.color(a, c, b, this))) }, "fill-opacitySetter": function (a, b, c) {
                    G(this.renderer.prepVML(["\x3c",
                        b.split("-")[0], ' opacity\x3d"', a, '"/\x3e']), null, null, c)
                }, opacitySetter: C, rotationSetter: function (a, b, c) { c = c.style; this[b] = c[b] = a; c.left = -Math.round(Math.sin(a * f) + 1) + "px"; c.top = Math.round(Math.cos(a * f)) + "px" }, strokeSetter: function (a, b, c) { this.setAttr("strokecolor", this.renderer.color(a, c, b, this)) }, "stroke-widthSetter": function (a, b, c) { c.stroked = !!a; this[b] = a; n(a) && (a += "px"); this.setAttr("strokeweight", a) }, titleSetter: function (a, b) { this.setAttr(b, a) }, visibilitySetter: function (a, b, c) {
                    "inherit" === a &&
                        (a = "visible"); this.shadows && l(this.shadows, function (c) { c.style[b] = a }); "DIV" === c.nodeName && (a = "hidden" === a ? "-999em" : 0, this.docMode8 || (c.style[b] = a ? "visible" : "hidden"), b = "top"); c.style[b] = a
                }, xSetter: function (a, b, c) { this[b] = a; "x" === b ? b = "left" : "y" === b && (b = "top"); this.updateClipping ? (this[b] = a, this.updateClipping()) : c.style[b] = a }, zIndexSetter: function (a, b, c) { c.style[b] = a }
            }, C["stroke-opacitySetter"] = C["fill-opacitySetter"], a.VMLElement = C = D(q, C), C.prototype.ySetter = C.prototype.widthSetter = C.prototype.heightSetter =
            C.prototype.xSetter, C = {
                Element: C, isIE8: -1 < F.navigator.userAgent.indexOf("MSIE 8.0"), init: function (a, b, c) {
                    var e, k; this.alignedObjects = []; e = this.createElement("div").css({ position: "relative" }); k = e.element; a.appendChild(e.element); this.isVML = !0; this.box = k; this.boxWrapper = e; this.gradients = {}; this.cache = {}; this.cacheKeys = []; this.imgCount = 0; this.setSize(b, c, !1); if (!v.namespaces.hcv) {
                        v.namespaces.add("hcv", "urn:schemas-microsoft-com:vml"); try { v.createStyleSheet().cssText = "hcv\\:fill, hcv\\:path, hcv\\:shape, hcv\\:stroke{ behavior:url(#default#VML); display: inline-block; } " } catch (w) {
                            v.styleSheets[0].cssText +=
                                "hcv\\:fill, hcv\\:path, hcv\\:shape, hcv\\:stroke{ behavior:url(#default#VML); display: inline-block; } "
                        }
                    }
                }, isHidden: function () { return !this.box.offsetWidth }, clipRect: function (a, b, c, m) {
                    var e = this.createElement(), r = y(a); return d(e, {
                        members: [], count: 0, left: (r ? a.x : a) + 1, top: (r ? a.y : b) + 1, width: (r ? a.width : c) - 1, height: (r ? a.height : m) - 1, getCSS: function (a) {
                            var b = a.element, c = b.nodeName, g = a.inverted, e = this.top - ("shape" === c ? b.offsetTop : 0), k = this.left, b = k + this.width, m = e + this.height, e = {
                                clip: "rect(" + Math.round(g ?
                                    k : e) + "px," + Math.round(g ? m : b) + "px," + Math.round(g ? b : m) + "px," + Math.round(g ? e : k) + "px)"
                            }; !g && a.docMode8 && "DIV" === c && d(e, { width: b + "px", height: m + "px" }); return e
                        }, updateClipping: function () { l(e.members, function (a) { a.element && a.css(e.getCSS(a)) }) }
                    })
                }, color: function (b, c, m, q) {
                    var e = this, r, d = /^rgba/, n, x, g = "none"; b && b.linearGradient ? x = "gradient" : b && b.radialGradient && (x = "pattern"); if (x) {
                        var B, t, z = b.linearGradient || b.radialGradient, f, F, H, A, u, p = ""; b = b.stops; var h, y = [], v = function () {
                            n = ['\x3cfill colors\x3d"' + y.join(",") +
                                '" opacity\x3d"', H, '" o:opacity2\x3d"', F, '" type\x3d"', x, '" ', p, 'focus\x3d"100%" method\x3d"any" /\x3e']; G(e.prepVML(n), null, null, c)
                        }; f = b[0]; h = b[b.length - 1]; 0 < f[0] && b.unshift([0, f[1]]); 1 > h[0] && b.push([1, h[1]]); l(b, function (g, b) { d.test(g[1]) ? (r = a.color(g[1]), B = r.get("rgb"), t = r.get("a")) : (B = g[1], t = 1); y.push(100 * g[0] + "% " + B); b ? (H = t, A = B) : (F = t, u = B) }); if ("fill" === m) if ("gradient" === x) m = z.x1 || z[0] || 0, b = z.y1 || z[1] || 0, f = z.x2 || z[2] || 0, z = z.y2 || z[3] || 0, p = 'angle\x3d"' + (90 - 180 * Math.atan((z - b) / (f - m)) / Math.PI) + '"',
                            v(); else { var g = z.r, C = 2 * g, D = 2 * g, I = z.cx, U = z.cy, L = c.radialReference, T, g = function () { L && (T = q.getBBox(), I += (L[0] - T.x) / T.width - .5, U += (L[1] - T.y) / T.height - .5, C *= L[2] / T.width, D *= L[2] / T.height); p = 'src\x3d"' + a.getOptions().global.VMLRadialGradientURL + '" size\x3d"' + C + "," + D + '" origin\x3d"0.5,0.5" position\x3d"' + I + "," + U + '" color2\x3d"' + u + '" '; v() }; q.added ? g() : q.onAdd = g; g = A } else g = B
                    } else d.test(b) && "IMG" !== c.tagName ? (r = a.color(b), q[m + "-opacitySetter"](r.get("a"), m, c), g = r.get("rgb")) : (g = c.getElementsByTagName(m),
                        g.length && (g[0].opacity = 1, g[0].type = "solid"), g = b); return g
                }, prepVML: function (a) { var b = this.isIE8; a = a.join(""); b ? (a = a.replace("/\x3e", ' xmlns\x3d"urn:schemas-microsoft-com:vml" /\x3e'), a = -1 === a.indexOf('style\x3d"') ? a.replace("/\x3e", ' style\x3d"display:inline-block;behavior:url(#default#VML);" /\x3e') : a.replace('style\x3d"', 'style\x3d"display:inline-block;behavior:url(#default#VML);')) : a = a.replace("\x3c", "\x3chcv:"); return a }, text: z.prototype.html, path: function (a) {
                    var b = { coordsize: "10 10" }; c(a) ? b.d =
                        a : y(a) && d(b, a); return this.createElement("shape").attr(b)
                }, circle: function (a, b, c) { var e = this.symbol("circle"); y(a) && (c = a.r, b = a.y, a = a.x); e.isCircle = !0; e.r = c; return e.attr({ x: a, y: b }) }, g: function (a) { var b; a && (b = { className: "highcharts-" + a, "class": "highcharts-" + a }); return this.createElement("div").attr(b) }, image: function (a, b, c, m, k) { var e = this.createElement("img").attr({ src: a }); 1 < arguments.length && e.attr({ x: b, y: c, width: m, height: k }); return e }, createElement: function (a) {
                    return "rect" === a ? this.symbol(a) : z.prototype.createElement.call(this,
                        a)
                }, invertChild: function (a, c) { var e = this; c = c.style; var m = "IMG" === a.tagName && a.style; I(a, { flip: "x", left: b(c.width) - (m ? b(m.top) : 1), top: b(c.height) - (m ? b(m.left) : 1), rotation: -90 }); l(a.childNodes, function (b) { e.invertChild(b, a) }) }, symbols: {
                    arc: function (a, b, c, m, k) {
                        var e = k.start, q = k.end, d = k.r || c || m; c = k.innerR; m = Math.cos(e); var r = Math.sin(e), g = Math.cos(q), B = Math.sin(q); if (0 === q - e) return ["x"]; e = ["wa", a - d, b - d, a + d, b + d, a + d * m, b + d * r, a + d * g, b + d * B]; k.open && !c && e.push("e", "M", a, b); e.push("at", a - c, b - c, a + c, b + c, a + c * g,
                            b + c * B, a + c * m, b + c * r, "x", "e"); e.isArc = !0; return e
                    }, circle: function (a, b, c, m, k) { k && h(k.r) && (c = m = 2 * k.r); k && k.isCircle && (a -= c / 2, b -= m / 2); return ["wa", a, b, a + c, b + m, a + c, b + m / 2, a + c, b + m / 2, "e"] }, rect: function (a, b, c, m, k) { return z.prototype.symbols[h(k) && k.r ? "callout" : "square"].call(0, a, b, c, m, k) }
                }
            }, a.VMLRenderer = D = function () { this.init.apply(this, arguments) }, D.prototype = t(z.prototype, C), a.Renderer = D); z.prototype.measureSpanWidth = function (a, b) {
                var c = v.createElement("span"); a = v.createTextNode(a); c.appendChild(a); I(c,
                    b); this.box.appendChild(c); b = c.offsetWidth; p(c); return b
            }
        })(L); (function (a) {
            function D() {
                var h = a.defaultOptions.global, l, u = h.useUTC, d = u ? "getUTC" : "get", c = u ? "setUTC" : "set"; a.Date = l = h.Date || p.Date; l.hcTimezoneOffset = u && h.timezoneOffset; l.hcGetTimezoneOffset = u && h.getTimezoneOffset; l.hcMakeTime = function (a, c, d, m, b, q) { var n; u ? (n = l.UTC.apply(0, arguments), n += I(n)) : n = (new l(a, c, f(d, 1), f(m, 0), f(b, 0), f(q, 0))).getTime(); return n }; G("Minutes Hours Day Date Month FullYear".split(" "), function (a) {
                    l["hcGet" + a] = d +
                        a
                }); G("Milliseconds Seconds Minutes Hours Date Month FullYear".split(" "), function (a) { l["hcSet" + a] = c + a })
            } var C = a.color, G = a.each, I = a.getTZOffset, h = a.merge, f = a.pick, p = a.win; a.defaultOptions = {
                colors: "#7cb5ec #434348 #90ed7d #f7a35c #8085e9 #f15c80 #e4d354 #2b908f #f45b5b #91e8e1".split(" "), symbols: ["circle", "diamond", "square", "triangle", "triangle-down"], lang: {
                    loading: "Loading...", months: "January February March April May June July August September October November December".split(" "), shortMonths: "Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec".split(" "),
                    weekdays: "Sunday Monday Tuesday Wednesday Thursday Friday Saturday".split(" "), decimalPoint: ".", numericSymbols: "kMGTPE".split(""), resetZoom: "Reset zoom", resetZoomTitle: "Reset zoom level 1:1", thousandsSep: " "
                }, global: { useUTC: !0, VMLRadialGradientURL: "http://code.highcharts.com/5.0.6/gfx/vml-radial-gradient.png" }, chart: {
                    borderRadius: 0, defaultSeriesType: "line", ignoreHiddenSeries: !0, spacing: [10, 10, 15, 10], resetZoomButton: { theme: { zIndex: 20 }, position: { align: "right", x: -10, y: 10 } }, width: null, height: null, borderColor: "#335cad",
                    backgroundColor: "#ffffff", plotBorderColor: "#cccccc"
                }, title: { text: "Chart title", align: "center", margin: 15, widthAdjust: -44 }, subtitle: { text: "", align: "center", widthAdjust: -44 }, plotOptions: {}, labels: { style: { position: "absolute", color: "#333333" } }, legend: {
                    enabled: !0, align: "center", layout: "horizontal", labelFormatter: function () { return this.name }, borderColor: "#999999", borderRadius: 0, navigation: { activeColor: "#003399", inactiveColor: "#cccccc" }, itemStyle: { color: "#333333", fontSize: "12px", fontWeight: "bold" }, itemHoverStyle: { color: "#000000" },
                    itemHiddenStyle: { color: "#cccccc" }, shadow: !1, itemCheckboxStyle: { position: "absolute", width: "13px", height: "13px" }, squareSymbol: !0, symbolPadding: 5, verticalAlign: "bottom", x: 0, y: 0, title: { style: { fontWeight: "bold" } }
                }, loading: { labelStyle: { fontWeight: "bold", position: "relative", top: "45%" }, style: { position: "absolute", backgroundColor: "#ffffff", opacity: .5, textAlign: "center" } }, tooltip: {
                    enabled: !0, animation: a.svg, borderRadius: 3, dateTimeLabelFormats: {
                        millisecond: "%A, %b %e, %H:%M:%S.%L", second: "%A, %b %e, %H:%M:%S",
                        minute: "%A, %b %e, %H:%M", hour: "%A, %b %e, %H:%M", day: "%A, %b %e, %Y", week: "Week from %A, %b %e, %Y", month: "%B %Y", year: "%Y"
                    }, footerFormat: "", padding: 8, snap: a.isTouchDevice ? 25 : 10, backgroundColor: C("#f7f7f7").setOpacity(.85).get(), borderWidth: 1, headerFormat: '\x3cspan style\x3d"font-size: 10px"\x3e{point.key}\x3c/span\x3e\x3cbr/\x3e', pointFormat: '\x3cspan style\x3d"color:{point.color}"\x3e\u25cf\x3c/span\x3e {series.name}: \x3cb\x3e{point.y}\x3c/b\x3e\x3cbr/\x3e', shadow: !0, style: {
                        color: "#333333", cursor: "default",
                        fontSize: "12px", pointerEvents: "none", whiteSpace: "nowrap"
                    }
                }, credits: { enabled: !0, href: "http://www.highcharts.com", position: { align: "right", x: -10, verticalAlign: "bottom", y: -5 }, style: { cursor: "pointer", color: "#999999", fontSize: "9px" }, text: "Highcharts.com" }
            }; a.setOptions = function (f) { a.defaultOptions = h(!0, a.defaultOptions, f); D(); return a.defaultOptions }; a.getOptions = function () { return a.defaultOptions }; a.defaultPlotOptions = a.defaultOptions.plotOptions; D()
        })(L); (function (a) {
            var D = a.arrayMax, C = a.arrayMin, G = a.defined,
                I = a.destroyObjectProperties, h = a.each, f = a.erase, p = a.merge, v = a.pick; a.PlotLineOrBand = function (a, f) { this.axis = a; f && (this.options = f, this.id = f.id) }; a.PlotLineOrBand.prototype = {
                    render: function () {
                        var a = this, f = a.axis, d = f.horiz, c = a.options, n = c.label, h = a.label, t = c.to, m = c.from, b = c.value, q = G(m) && G(t), z = G(b), F = a.svgElem, e = !F, r = [], x, A = c.color, k = v(c.zIndex, 0), w = c.events, r = { "class": "highcharts-plot-" + (q ? "band " : "line ") + (c.className || "") }, K = {}, J = f.chart.renderer, N = q ? "bands" : "lines", g = f.log2lin; f.isLog && (m = g(m), t =
                            g(t), b = g(b)); z ? (r = { stroke: A, "stroke-width": c.width }, c.dashStyle && (r.dashstyle = c.dashStyle)) : q && (A && (r.fill = A), c.borderWidth && (r.stroke = c.borderColor, r["stroke-width"] = c.borderWidth)); K.zIndex = k; N += "-" + k; (A = f[N]) || (f[N] = A = J.g("plot-" + N).attr(K).add()); e && (a.svgElem = F = J.path().attr(r).add(A)); if (z) r = f.getPlotLinePath(b, F.strokeWidth()); else if (q) r = f.getPlotBandPath(m, t, c); else return; if (e && r && r.length) { if (F.attr({ d: r }), w) for (x in c = function (g) { F.on(g, function (b) { w[g].apply(a, [b]) }) }, w) c(x) } else F &&
                                (r ? (F.show(), F.animate({ d: r })) : (F.hide(), h && (a.label = h = h.destroy()))); n && G(n.text) && r && r.length && 0 < f.width && 0 < f.height && !r.flat ? (n = p({ align: d && q && "center", x: d ? !q && 4 : 10, verticalAlign: !d && q && "middle", y: d ? q ? 16 : 10 : q ? 6 : -4, rotation: d && !q && 90 }, n), this.renderLabel(n, r, q, k)) : h && h.hide(); return a
                    }, renderLabel: function (a, f, d, c) {
                        var n = this.label, l = this.axis.chart.renderer; n || (n = { align: a.textAlign || a.align, rotation: a.rotation, "class": "highcharts-plot-" + (d ? "band" : "line") + "-label " + (a.className || "") }, n.zIndex = c,
                            this.label = n = l.text(a.text, 0, 0, a.useHTML).attr(n).add(), n.css(a.style)); c = [f[1], f[4], d ? f[6] : f[1]]; f = [f[2], f[5], d ? f[7] : f[2]]; d = C(c); l = C(f); n.align(a, !1, { x: d, y: l, width: D(c) - d, height: D(f) - l }); n.show()
                    }, destroy: function () { f(this.axis.plotLinesAndBands, this); delete this.axis; I(this) }
                }; a.AxisPlotLineOrBandExtension = {
                    getPlotBandPath: function (a, f) {
                        f = this.getPlotLinePath(f, null, null, !0); (a = this.getPlotLinePath(a, null, null, !0)) && f ? (a.flat = a.toString() === f.toString(), a.push(f[4], f[5], f[1], f[2], "z")) : a = null;
                        return a
                    }, addPlotBand: function (a) { return this.addPlotBandOrLine(a, "plotBands") }, addPlotLine: function (a) { return this.addPlotBandOrLine(a, "plotLines") }, addPlotBandOrLine: function (f, h) { var d = (new a.PlotLineOrBand(this, f)).render(), c = this.userOptions; d && (h && (c[h] = c[h] || [], c[h].push(f)), this.plotLinesAndBands.push(d)); return d }, removePlotBandOrLine: function (a) {
                        for (var l = this.plotLinesAndBands, d = this.options, c = this.userOptions, n = l.length; n--;)l[n].id === a && l[n].destroy(); h([d.plotLines || [], c.plotLines ||
                            [], d.plotBands || [], c.plotBands || []], function (c) { for (n = c.length; n--;)c[n].id === a && f(c, c[n]) })
                    }
                }
        })(L); (function (a) {
            var D = a.correctFloat, C = a.defined, G = a.destroyObjectProperties, I = a.isNumber, h = a.merge, f = a.pick, p = a.deg2rad; a.Tick = function (a, f, h, d) { this.axis = a; this.pos = f; this.type = h || ""; this.isNew = !0; h || d || this.addLabel() }; a.Tick.prototype = {
                addLabel: function () {
                    var a = this.axis, l = a.options, p = a.chart, d = a.categories, c = a.names, n = this.pos, y = l.labels, t = a.tickPositions, m = n === t[0], b = n === t[t.length - 1], c = d ? f(d[n],
                        c[n], n) : n, d = this.label, t = t.info, q; a.isDatetimeAxis && t && (q = l.dateTimeLabelFormats[t.higherRanks[n] || t.unitName]); this.isFirst = m; this.isLast = b; l = a.labelFormatter.call({ axis: a, chart: p, isFirst: m, isLast: b, dateTimeLabelFormat: q, value: a.isLog ? D(a.lin2log(c)) : c }); C(d) ? d && d.attr({ text: l }) : (this.labelLength = (this.label = d = C(l) && y.enabled ? p.renderer.text(l, 0, 0, y.useHTML).css(h(y.style)).add(a.labelGroup) : null) && d.getBBox().width, this.rotation = 0)
                }, getLabelSize: function () {
                    return this.label ? this.label.getBBox()[this.axis.horiz ?
                        "height" : "width"] : 0
                }, handleOverflow: function (a) {
                    var l = this.axis, h = a.x, d = l.chart.chartWidth, c = l.chart.spacing, n = f(l.labelLeft, Math.min(l.pos, c[3])), c = f(l.labelRight, Math.max(l.pos + l.len, d - c[1])), y = this.label, t = this.rotation, m = { left: 0, center: .5, right: 1 }[l.labelAlign], b = y.getBBox().width, q = l.getSlotWidth(), z = q, F = 1, e, r = {}; if (t) 0 > t && h - m * b < n ? e = Math.round(h / Math.cos(t * p) - n) : 0 < t && h + m * b > c && (e = Math.round((d - h) / Math.cos(t * p))); else if (d = h + (1 - m) * b, h - m * b < n ? z = a.x + z * (1 - m) - n : d > c && (z = c - a.x + z * m, F = -1), z = Math.min(q,
                        z), z < q && "center" === l.labelAlign && (a.x += F * (q - z - m * (q - Math.min(b, z)))), b > z || l.autoRotation && (y.styles || {}).width) e = z; e && (r.width = e, (l.options.labels.style || {}).textOverflow || (r.textOverflow = "ellipsis"), y.css(r))
                }, getPosition: function (a, f, h, d) {
                    var c = this.axis, n = c.chart, l = d && n.oldChartHeight || n.chartHeight; return {
                        x: a ? c.translate(f + h, null, null, d) + c.transB : c.left + c.offset + (c.opposite ? (d && n.oldChartWidth || n.chartWidth) - c.right - c.left : 0), y: a ? l - c.bottom + c.offset - (c.opposite ? c.height : 0) : l - c.translate(f + h, null,
                            null, d) - c.transB
                    }
                }, getLabelPosition: function (a, f, h, d, c, n, y, t) { var m = this.axis, b = m.transA, q = m.reversed, z = m.staggerLines, l = m.tickRotCorr || { x: 0, y: 0 }, e = c.y; C(e) || (e = 0 === m.side ? h.rotation ? -8 : -h.getBBox().height : 2 === m.side ? l.y + 8 : Math.cos(h.rotation * p) * (l.y - h.getBBox(!1, 0).height / 2)); a = a + c.x + l.x - (n && d ? n * b * (q ? -1 : 1) : 0); f = f + e - (n && !d ? n * b * (q ? 1 : -1) : 0); z && (h = y / (t || 1) % z, m.opposite && (h = z - h - 1), f += m.labelOffset / z * h); return { x: a, y: Math.round(f) } }, getMarkPath: function (a, f, h, d, c, n) {
                    return n.crispLine(["M", a, f, "L", a + (c ?
                        0 : -h), f + (c ? h : 0)], d)
                }, render: function (a, l, h) {
                    var d = this.axis, c = d.options, n = d.chart.renderer, p = d.horiz, t = this.type, m = this.label, b = this.pos, q = c.labels, z = this.gridLine, F = t ? t + "Tick" : "tick", e = d.tickSize(F), r = this.mark, x = !r, A = q.step, k = {}, w = !0, K = d.tickmarkOffset, J = this.getPosition(p, b, K, l), u = J.x, J = J.y, g = p && u === d.pos + d.len || !p && J === d.pos ? -1 : 1, B = t ? t + "Grid" : "grid", S = c[B + "LineWidth"], M = c[B + "LineColor"], v = c[B + "LineDashStyle"], B = f(c[F + "Width"], !t && d.isXAxis ? 1 : 0), F = c[F + "Color"]; h = f(h, 1); this.isActive = !0; z || (k.stroke =
                        M, k["stroke-width"] = S, v && (k.dashstyle = v), t || (k.zIndex = 1), l && (k.opacity = 0), this.gridLine = z = n.path().attr(k).addClass("highcharts-" + (t ? t + "-" : "") + "grid-line").add(d.gridGroup)); if (!l && z && (b = d.getPlotLinePath(b + K, z.strokeWidth() * g, l, !0))) z[this.isNew ? "attr" : "animate"]({ d: b, opacity: h }); e && (d.opposite && (e[0] = -e[0]), x && (this.mark = r = n.path().addClass("highcharts-" + (t ? t + "-" : "") + "tick").add(d.axisGroup), r.attr({ stroke: F, "stroke-width": B })), r[x ? "attr" : "animate"]({
                            d: this.getMarkPath(u, J, e[0], r.strokeWidth() *
                                g, p, n), opacity: h
                        })); m && I(u) && (m.xy = J = this.getLabelPosition(u, J, m, p, q, K, a, A), this.isFirst && !this.isLast && !f(c.showFirstLabel, 1) || this.isLast && !this.isFirst && !f(c.showLastLabel, 1) ? w = !1 : !p || d.isRadial || q.step || q.rotation || l || 0 === h || this.handleOverflow(J), A && a % A && (w = !1), w && I(J.y) ? (J.opacity = h, m[this.isNew ? "attr" : "animate"](J)) : m.attr("y", -9999), this.isNew = !1)
                }, destroy: function () { G(this, this.axis) }
            }
        })(L); (function (a) {
            var D = a.addEvent, C = a.animObject, G = a.arrayMax, I = a.arrayMin, h = a.AxisPlotLineOrBandExtension,
                f = a.color, p = a.correctFloat, v = a.defaultOptions, l = a.defined, u = a.deg2rad, d = a.destroyObjectProperties, c = a.each, n = a.extend, y = a.fireEvent, t = a.format, m = a.getMagnitude, b = a.grep, q = a.inArray, z = a.isArray, F = a.isNumber, e = a.isString, r = a.merge, x = a.normalizeTickInterval, A = a.pick, k = a.PlotLineOrBand, w = a.removeEvent, K = a.splat, J = a.syncTimeout, N = a.Tick; a.Axis = function () { this.init.apply(this, arguments) }; a.Axis.prototype = {
                    defaultOptions: {
                        dateTimeLabelFormats: {
                            millisecond: "%H:%M:%S.%L", second: "%H:%M:%S", minute: "%H:%M", hour: "%H:%M",
                            day: "%e. %b", week: "%e. %b", month: "%b '%y", year: "%Y"
                        }, endOnTick: !1, labels: { enabled: !0, style: { color: "#666666", cursor: "default", fontSize: "11px" }, x: 0 }, minPadding: .01, maxPadding: .01, minorTickLength: 2, minorTickPosition: "outside", startOfWeek: 1, startOnTick: !1, tickLength: 10, tickmarkPlacement: "between", tickPixelInterval: 100, tickPosition: "outside", title: { align: "middle", style: { color: "#666666" } }, type: "linear", minorGridLineColor: "#f2f2f2", minorGridLineWidth: 1, minorTickColor: "#999999", lineColor: "#ccd6eb", lineWidth: 1,
                        gridLineColor: "#e6e6e6", tickColor: "#ccd6eb"
                    }, defaultYAxisOptions: { endOnTick: !0, tickPixelInterval: 72, showLastLabel: !0, labels: { x: -8 }, maxPadding: .05, minPadding: .05, startOnTick: !0, title: { rotation: 270, text: "Values" }, stackLabels: { enabled: !1, formatter: function () { return a.numberFormat(this.total, -1) }, style: { fontSize: "11px", fontWeight: "bold", color: "#000000", textOutline: "1px contrast" } }, gridLineWidth: 1, lineWidth: 0 }, defaultLeftAxisOptions: { labels: { x: -15 }, title: { rotation: 270 } }, defaultRightAxisOptions: {
                        labels: { x: 15 },
                        title: { rotation: 90 }
                    }, defaultBottomAxisOptions: { labels: { autoRotation: [-45], x: 0 }, title: { rotation: 0 } }, defaultTopAxisOptions: { labels: { autoRotation: [-45], x: 0 }, title: { rotation: 0 } }, init: function (a, b) {
                        var g = b.isX; this.chart = a; this.horiz = a.inverted ? !g : g; this.isXAxis = g; this.coll = this.coll || (g ? "xAxis" : "yAxis"); this.opposite = b.opposite; this.side = b.side || (this.horiz ? this.opposite ? 0 : 2 : this.opposite ? 1 : 3); this.setOptions(b); var c = this.options, e = c.type; this.labelFormatter = c.labels.formatter || this.defaultLabelFormatter;
                        this.userOptions = b; this.minPixelPadding = 0; this.reversed = c.reversed; this.visible = !1 !== c.visible; this.zoomEnabled = !1 !== c.zoomEnabled; this.hasNames = "category" === e || !0 === c.categories; this.categories = c.categories || this.hasNames; this.names = this.names || []; this.isLog = "logarithmic" === e; this.isDatetimeAxis = "datetime" === e; this.isLinked = l(c.linkedTo); this.ticks = {}; this.labelEdge = []; this.minorTicks = {}; this.plotLinesAndBands = []; this.alternateBands = {}; this.len = 0; this.minRange = this.userMinRange = c.minRange || c.maxZoom;
                        this.range = c.range; this.offset = c.offset || 0; this.stacks = {}; this.oldStacks = {}; this.stacksTouched = 0; this.min = this.max = null; this.crosshair = A(c.crosshair, K(a.options.tooltip.crosshairs)[g ? 0 : 1], !1); var k; b = this.options.events; -1 === q(this, a.axes) && (g ? a.axes.splice(a.xAxis.length, 0, this) : a.axes.push(this), a[this.coll].push(this)); this.series = this.series || []; a.inverted && g && void 0 === this.reversed && (this.reversed = !0); this.removePlotLine = this.removePlotBand = this.removePlotBandOrLine; for (k in b) D(this, k, b[k]);
                        this.isLog && (this.val2lin = this.log2lin, this.lin2val = this.lin2log)
                    }, setOptions: function (a) { this.options = r(this.defaultOptions, "yAxis" === this.coll && this.defaultYAxisOptions, [this.defaultTopAxisOptions, this.defaultRightAxisOptions, this.defaultBottomAxisOptions, this.defaultLeftAxisOptions][this.side], r(v[this.coll], a)) }, defaultLabelFormatter: function () {
                        var g = this.axis, b = this.value, c = g.categories, e = this.dateTimeLabelFormat, k = v.lang, m = k.numericSymbols, k = k.numericSymbolMagnitude || 1E3, q = m && m.length, d, r = g.options.labels.format,
                            g = g.isLog ? b : g.tickInterval; if (r) d = t(r, this); else if (c) d = b; else if (e) d = a.dateFormat(e, b); else if (q && 1E3 <= g) for (; q-- && void 0 === d;)c = Math.pow(k, q + 1), g >= c && 0 === 10 * b % c && null !== m[q] && 0 !== b && (d = a.numberFormat(b / c, -1) + m[q]); void 0 === d && (d = 1E4 <= Math.abs(b) ? a.numberFormat(b, -1) : a.numberFormat(b, -1, void 0, "")); return d
                    }, getSeriesExtremes: function () {
                        var a = this, e = a.chart; a.hasVisibleSeries = !1; a.dataMin = a.dataMax = a.threshold = null; a.softThreshold = !a.isXAxis; a.buildStacks && a.buildStacks(); c(a.series, function (g) {
                            if (g.visible ||
                                !e.options.chart.ignoreHiddenSeries) {
                                var c = g.options, k = c.threshold, B; a.hasVisibleSeries = !0; a.isLog && 0 >= k && (k = null); if (a.isXAxis) c = g.xData, c.length && (g = I(c), F(g) || g instanceof Date || (c = b(c, function (a) { return F(a) }), g = I(c)), a.dataMin = Math.min(A(a.dataMin, c[0]), g), a.dataMax = Math.max(A(a.dataMax, c[0]), G(c))); else if (g.getExtremes(), B = g.dataMax, g = g.dataMin, l(g) && l(B) && (a.dataMin = Math.min(A(a.dataMin, g), g), a.dataMax = Math.max(A(a.dataMax, B), B)), l(k) && (a.threshold = k), !c.softThreshold || a.isLog) a.softThreshold =
                                    !1
                            }
                        })
                    }, translate: function (a, b, c, e, k, m) { var g = this.linkedParent || this, B = 1, q = 0, d = e ? g.oldTransA : g.transA; e = e ? g.oldMin : g.min; var r = g.minPixelPadding; k = (g.isOrdinal || g.isBroken || g.isLog && k) && g.lin2val; d || (d = g.transA); c && (B *= -1, q = g.len); g.reversed && (B *= -1, q -= B * (g.sector || g.len)); b ? (a = (a * B + q - r) / d + e, k && (a = g.lin2val(a))) : (k && (a = g.val2lin(a)), a = B * (a - e) * d + q + B * r + (F(m) ? d * m : 0)); return a }, toPixels: function (a, b) { return this.translate(a, !1, !this.horiz, null, !0) + (b ? 0 : this.pos) }, toValue: function (a, b) {
                        return this.translate(a -
                            (b ? 0 : this.pos), !0, !this.horiz, null, !0)
                    }, getPlotLinePath: function (a, b, c, e, k) {
                        var g = this.chart, B = this.left, m = this.top, q, d, r = c && g.oldChartHeight || g.chartHeight, n = c && g.oldChartWidth || g.chartWidth, f; q = this.transB; var w = function (a, g, b) { if (a < g || a > b) e ? a = Math.min(Math.max(g, a), b) : f = !0; return a }; k = A(k, this.translate(a, null, null, c)); a = c = Math.round(k + q); q = d = Math.round(r - k - q); F(k) ? this.horiz ? (q = m, d = r - this.bottom, a = c = w(a, B, B + this.width)) : (a = B, c = n - this.right, q = d = w(q, m, m + this.height)) : f = !0; return f && !e ? null : g.renderer.crispLine(["M",
                            a, q, "L", c, d], b || 1)
                    }, getLinearTickPositions: function (a, b, c) { var g, k = p(Math.floor(b / a) * a), e = p(Math.ceil(c / a) * a), B = []; if (b === c && F(b)) return [b]; for (b = k; b <= e;) { B.push(b); b = p(b + a); if (b === g) break; g = b } return B }, getMinorTickPositions: function () {
                        var a = this.options, b = this.tickPositions, c = this.minorTickInterval, k = [], e, m = this.pointRangePadding || 0; e = this.min - m; var m = this.max + m, q = m - e; if (q && q / c < this.len / 3) if (this.isLog) for (m = b.length, e = 1; e < m; e++)k = k.concat(this.getLogTickPositions(c, b[e - 1], b[e], !0)); else if (this.isDatetimeAxis &&
                            "auto" === a.minorTickInterval) k = k.concat(this.getTimeTicks(this.normalizeTimeTickInterval(c), e, m, a.startOfWeek)); else for (b = e + (b[0] - e) % c; b <= m && b !== k[0]; b += c)k.push(b); 0 !== k.length && this.trimTicks(k, a.startOnTick, a.endOnTick); return k
                    }, adjustForMinRange: function () {
                        var a = this.options, b = this.min, k = this.max, e, m = this.dataMax - this.dataMin >= this.minRange, q, d, r, f, n, w; this.isXAxis && void 0 === this.minRange && !this.isLog && (l(a.min) || l(a.max) ? this.minRange = null : (c(this.series, function (a) {
                            f = a.xData; for (d = n = a.xIncrement ?
                                1 : f.length - 1; 0 < d; d--)if (r = f[d] - f[d - 1], void 0 === q || r < q) q = r
                        }), this.minRange = Math.min(5 * q, this.dataMax - this.dataMin))); k - b < this.minRange && (w = this.minRange, e = (w - k + b) / 2, e = [b - e, A(a.min, b - e)], m && (e[2] = this.isLog ? this.log2lin(this.dataMin) : this.dataMin), b = G(e), k = [b + w, A(a.max, b + w)], m && (k[2] = this.isLog ? this.log2lin(this.dataMax) : this.dataMax), k = I(k), k - b < w && (e[0] = k - w, e[1] = A(a.min, k - w), b = G(e))); this.min = b; this.max = k
                    }, getClosest: function () {
                        var a; this.categories ? a = 1 : c(this.series, function (b) {
                            var g = b.closestPointRange,
                                c = b.visible || !b.chart.options.chart.ignoreHiddenSeries; !b.noSharedTooltip && l(g) && c && (a = l(a) ? Math.min(a, g) : g)
                        }); return a
                    }, nameToX: function (a) { var b = z(this.categories), g = b ? this.categories : this.names, c = a.options.x, k; a.series.requireSorting = !1; l(c) || (c = !1 === this.options.uniqueNames ? a.series.autoIncrement() : q(a.name, g)); -1 === c ? b || (k = g.length) : k = c; this.names[k] = a.name; return k }, updateNames: function () {
                        var a = this; 0 < this.names.length && (this.names.length = 0, this.minRange = void 0, c(this.series || [], function (b) {
                            b.xIncrement =
                                null; if (!b.points || b.isDirtyData) b.processData(), b.generatePoints(); c(b.points, function (g, c) { var k; g.options && void 0 === g.options.x && (k = a.nameToX(g), k !== g.x && (g.x = k, b.xData[c] = k)) })
                        }))
                    }, setAxisTranslation: function (a) {
                        var b = this, g = b.max - b.min, k = b.axisPointRange || 0, m, q = 0, d = 0, r = b.linkedParent, f = !!b.categories, n = b.transA, w = b.isXAxis; if (w || f || k) m = b.getClosest(), r ? (q = r.minPointOffset, d = r.pointRangePadding) : c(b.series, function (a) {
                            var g = f ? 1 : w ? A(a.options.pointRange, m, 0) : b.axisPointRange || 0; a = a.options.pointPlacement;
                            k = Math.max(k, g); b.single || (q = Math.max(q, e(a) ? 0 : g / 2), d = Math.max(d, "on" === a ? 0 : g))
                        }), r = b.ordinalSlope && m ? b.ordinalSlope / m : 1, b.minPointOffset = q *= r, b.pointRangePadding = d *= r, b.pointRange = Math.min(k, g), w && (b.closestPointRange = m); a && (b.oldTransA = n); b.translationSlope = b.transA = n = b.len / (g + d || 1); b.transB = b.horiz ? b.left : b.bottom; b.minPixelPadding = n * q
                    }, minFromRange: function () { return this.max - this.range }, setTickInterval: function (b) {
                        var g = this, k = g.chart, e = g.options, q = g.isLog, d = g.log2lin, r = g.isDatetimeAxis, f = g.isXAxis,
                            n = g.isLinked, w = e.maxPadding, t = e.minPadding, z = e.tickInterval, h = e.tickPixelInterval, K = g.categories, J = g.threshold, u = g.softThreshold, N, v, C, D; r || K || n || this.getTickAmount(); C = A(g.userMin, e.min); D = A(g.userMax, e.max); n ? (g.linkedParent = k[g.coll][e.linkedTo], k = g.linkedParent.getExtremes(), g.min = A(k.min, k.dataMin), g.max = A(k.max, k.dataMax), e.type !== g.linkedParent.options.type && a.error(11, 1)) : (!u && l(J) && (g.dataMin >= J ? (N = J, t = 0) : g.dataMax <= J && (v = J, w = 0)), g.min = A(C, N, g.dataMin), g.max = A(D, v, g.dataMax)); q && (!b && 0 >=
                                Math.min(g.min, A(g.dataMin, g.min)) && a.error(10, 1), g.min = p(d(g.min), 15), g.max = p(d(g.max), 15)); g.range && l(g.max) && (g.userMin = g.min = C = Math.max(g.min, g.minFromRange()), g.userMax = D = g.max, g.range = null); y(g, "foundExtremes"); g.beforePadding && g.beforePadding(); g.adjustForMinRange(); !(K || g.axisPointRange || g.usePercentage || n) && l(g.min) && l(g.max) && (d = g.max - g.min) && (!l(C) && t && (g.min -= d * t), !l(D) && w && (g.max += d * w)); F(e.floor) ? g.min = Math.max(g.min, e.floor) : F(e.softMin) && (g.min = Math.min(g.min, e.softMin)); F(e.ceiling) ?
                                    g.max = Math.min(g.max, e.ceiling) : F(e.softMax) && (g.max = Math.max(g.max, e.softMax)); u && l(g.dataMin) && (J = J || 0, !l(C) && g.min < J && g.dataMin >= J ? g.min = J : !l(D) && g.max > J && g.dataMax <= J && (g.max = J)); g.tickInterval = g.min === g.max || void 0 === g.min || void 0 === g.max ? 1 : n && !z && h === g.linkedParent.options.tickPixelInterval ? z = g.linkedParent.tickInterval : A(z, this.tickAmount ? (g.max - g.min) / Math.max(this.tickAmount - 1, 1) : void 0, K ? 1 : (g.max - g.min) * h / Math.max(g.len, h)); f && !b && c(g.series, function (a) {
                                        a.processData(g.min !== g.oldMin || g.max !==
                                            g.oldMax)
                                    }); g.setAxisTranslation(!0); g.beforeSetTickPositions && g.beforeSetTickPositions(); g.postProcessTickInterval && (g.tickInterval = g.postProcessTickInterval(g.tickInterval)); g.pointRange && !z && (g.tickInterval = Math.max(g.pointRange, g.tickInterval)); b = A(e.minTickInterval, g.isDatetimeAxis && g.closestPointRange); !z && g.tickInterval < b && (g.tickInterval = b); r || q || z || (g.tickInterval = x(g.tickInterval, null, m(g.tickInterval), A(e.allowDecimals, !(.5 < g.tickInterval && 5 > g.tickInterval && 1E3 < g.max && 9999 > g.max)), !!this.tickAmount));
                        this.tickAmount || (g.tickInterval = g.unsquish()); this.setTickPositions()
                    }, setTickPositions: function () {
                        var a = this.options, b, c = a.tickPositions, k = a.tickPositioner, e = a.startOnTick, m = a.endOnTick, q; this.tickmarkOffset = this.categories && "between" === a.tickmarkPlacement && 1 === this.tickInterval ? .5 : 0; this.minorTickInterval = "auto" === a.minorTickInterval && this.tickInterval ? this.tickInterval / 5 : a.minorTickInterval; this.tickPositions = b = c && c.slice(); !b && (b = this.isDatetimeAxis ? this.getTimeTicks(this.normalizeTimeTickInterval(this.tickInterval,
                            a.units), this.min, this.max, a.startOfWeek, this.ordinalPositions, this.closestPointRange, !0) : this.isLog ? this.getLogTickPositions(this.tickInterval, this.min, this.max) : this.getLinearTickPositions(this.tickInterval, this.min, this.max), b.length > this.len && (b = [b[0], b.pop()]), this.tickPositions = b, k && (k = k.apply(this, [this.min, this.max]))) && (this.tickPositions = b = k); this.isLinked || (this.trimTicks(b, e, m), this.min === this.max && l(this.min) && !this.tickAmount && (q = !0, this.min -= .5, this.max += .5), this.single = q, c || k || this.adjustTickAmount())
                    },
                    trimTicks: function (a, b, c) { var g = a[0], k = a[a.length - 1], e = this.minPointOffset || 0; if (b) this.min = g; else for (; this.min - e > a[0];)a.shift(); if (c) this.max = k; else for (; this.max + e < a[a.length - 1];)a.pop(); 0 === a.length && l(g) && a.push((k + g) / 2) }, alignToOthers: function () { var a = {}, b, k = this.options; !1 === this.chart.options.chart.alignTicks || !1 === k.alignTicks || this.isLog || c(this.chart[this.coll], function (g) { var c = g.options, c = [g.horiz ? c.left : c.top, c.width, c.height, c.pane].join(); g.series.length && (a[c] ? b = !0 : a[c] = 1) }); return b },
                    getTickAmount: function () { var a = this.options, b = a.tickAmount, c = a.tickPixelInterval; !l(a.tickInterval) && this.len < c && !this.isRadial && !this.isLog && a.startOnTick && a.endOnTick && (b = 2); !b && this.alignToOthers() && (b = Math.ceil(this.len / c) + 1); 4 > b && (this.finalTickAmt = b, b = 5); this.tickAmount = b }, adjustTickAmount: function () {
                        var a = this.tickInterval, b = this.tickPositions, c = this.tickAmount, k = this.finalTickAmt, e = b && b.length; if (e < c) {
                            for (; b.length < c;)b.push(p(b[b.length - 1] + a)); this.transA *= (e - 1) / (c - 1); this.max = b[b.length -
                                1]
                        } else e > c && (this.tickInterval *= 2, this.setTickPositions()); if (l(k)) { for (a = c = b.length; a--;)(3 === k && 1 === a % 2 || 2 >= k && 0 < a && a < c - 1) && b.splice(a, 1); this.finalTickAmt = void 0 }
                    }, setScale: function () {
                        var a, b; this.oldMin = this.min; this.oldMax = this.max; this.oldAxisLength = this.len; this.setAxisSize(); b = this.len !== this.oldAxisLength; c(this.series, function (b) { if (b.isDirtyData || b.isDirty || b.xAxis.isDirty) a = !0 }); b || a || this.isLinked || this.forceRedraw || this.userMin !== this.oldUserMin || this.userMax !== this.oldUserMax || this.alignToOthers() ?
                            (this.resetStacks && this.resetStacks(), this.forceRedraw = !1, this.getSeriesExtremes(), this.setTickInterval(), this.oldUserMin = this.userMin, this.oldUserMax = this.userMax, this.isDirty || (this.isDirty = b || this.min !== this.oldMin || this.max !== this.oldMax)) : this.cleanStacks && this.cleanStacks()
                    }, setExtremes: function (a, b, k, e, m) { var g = this, q = g.chart; k = A(k, !0); c(g.series, function (a) { delete a.kdTree }); m = n(m, { min: a, max: b }); y(g, "setExtremes", m, function () { g.userMin = a; g.userMax = b; g.eventArgs = m; k && q.redraw(e) }) }, zoom: function (a,
                        b) { var g = this.dataMin, c = this.dataMax, k = this.options, e = Math.min(g, A(k.min, g)), k = Math.max(c, A(k.max, c)); if (a !== this.min || b !== this.max) this.allowZoomOutside || (l(g) && (a < e && (a = e), a > k && (a = k)), l(c) && (b < e && (b = e), b > k && (b = k))), this.displayBtn = void 0 !== a || void 0 !== b, this.setExtremes(a, b, !1, void 0, { trigger: "zoom" }); return !0 }, setAxisSize: function () {
                            var a = this.chart, b = this.options, c = b.offsetLeft || 0, k = this.horiz, e = A(b.width, a.plotWidth - c + (b.offsetRight || 0)), m = A(b.height, a.plotHeight), q = A(b.top, a.plotTop), b = A(b.left,
                                a.plotLeft + c), c = /%$/; c.test(m) && (m = Math.round(parseFloat(m) / 100 * a.plotHeight)); c.test(q) && (q = Math.round(parseFloat(q) / 100 * a.plotHeight + a.plotTop)); this.left = b; this.top = q; this.width = e; this.height = m; this.bottom = a.chartHeight - m - q; this.right = a.chartWidth - e - b; this.len = Math.max(k ? e : m, 0); this.pos = k ? b : q
                        }, getExtremes: function () { var a = this.isLog, b = this.lin2log; return { min: a ? p(b(this.min)) : this.min, max: a ? p(b(this.max)) : this.max, dataMin: this.dataMin, dataMax: this.dataMax, userMin: this.userMin, userMax: this.userMax } },
                    getThreshold: function (a) { var b = this.isLog, g = this.lin2log, c = b ? g(this.min) : this.min, b = b ? g(this.max) : this.max; null === a ? a = c : c > a ? a = c : b < a && (a = b); return this.translate(a, 0, 1, 0, 1) }, autoLabelAlign: function (a) { a = (A(a, 0) - 90 * this.side + 720) % 360; return 15 < a && 165 > a ? "right" : 195 < a && 345 > a ? "left" : "center" }, tickSize: function (a) { var b = this.options, g = b[a + "Length"], c = A(b[a + "Width"], "tick" === a && this.isXAxis ? 1 : 0); if (c && g) return "inside" === b[a + "Position"] && (g = -g), [g, c] }, labelMetrics: function () {
                        return this.chart.renderer.fontMetrics(this.options.labels.style &&
                            this.options.labels.style.fontSize, this.ticks[0] && this.ticks[0].label)
                    }, unsquish: function () {
                        var a = this.options.labels, b = this.horiz, k = this.tickInterval, e = k, m = this.len / (((this.categories ? 1 : 0) + this.max - this.min) / k), q, d = a.rotation, r = this.labelMetrics(), f, n = Number.MAX_VALUE, w, t = function (a) { a /= m || 1; a = 1 < a ? Math.ceil(a) : 1; return a * k }; b ? (w = !a.staggerLines && !a.step && (l(d) ? [d] : m < A(a.autoRotationLimit, 80) && a.autoRotation)) && c(w, function (a) {
                            var b; if (a === d || a && -90 <= a && 90 >= a) f = t(Math.abs(r.h / Math.sin(u * a))), b = f +
                                Math.abs(a / 360), b < n && (n = b, q = a, e = f)
                        }) : a.step || (e = t(r.h)); this.autoRotation = w; this.labelRotation = A(q, d); return e
                    }, getSlotWidth: function () { var a = this.chart, b = this.horiz, c = this.options.labels, k = Math.max(this.tickPositions.length - (this.categories ? 0 : 1), 1), e = a.margin[3]; return b && 2 > (c.step || 0) && !c.rotation && (this.staggerLines || 1) * a.plotWidth / k || !b && (e && e - a.spacing[3] || .33 * a.chartWidth) }, renderUnsquish: function () {
                        var a = this.chart, b = a.renderer, k = this.tickPositions, m = this.ticks, q = this.options.labels, d = this.horiz,
                            f = this.getSlotWidth(), n = Math.max(1, Math.round(f - 2 * (q.padding || 5))), w = {}, t = this.labelMetrics(), z = q.style && q.style.textOverflow, h, l = 0, x, F; e(q.rotation) || (w.rotation = q.rotation || 0); c(k, function (a) { (a = m[a]) && a.labelLength > l && (l = a.labelLength) }); this.maxLabelLength = l; if (this.autoRotation) l > n && l > t.h ? w.rotation = this.labelRotation : this.labelRotation = 0; else if (f && (h = { width: n + "px" }, !z)) for (h.textOverflow = "clip", x = k.length; !d && x--;)if (F = k[x], n = m[F].label) n.styles && "ellipsis" === n.styles.textOverflow ? n.css({ textOverflow: "clip" }) :
                                m[F].labelLength > f && n.css({ width: f + "px" }), n.getBBox().height > this.len / k.length - (t.h - t.f) && (n.specCss = { textOverflow: "ellipsis" }); w.rotation && (h = { width: (l > .5 * a.chartHeight ? .33 * a.chartHeight : a.chartHeight) + "px" }, z || (h.textOverflow = "ellipsis")); if (this.labelAlign = q.align || this.autoLabelAlign(this.labelRotation)) w.align = this.labelAlign; c(k, function (a) { var b = (a = m[a]) && a.label; b && (b.attr(w), h && b.css(r(h, b.specCss)), delete b.specCss, a.rotation = w.rotation) }); this.tickRotCorr = b.rotCorr(t.b, this.labelRotation ||
                                    0, 0 !== this.side)
                    }, hasData: function () { return this.hasVisibleSeries || l(this.min) && l(this.max) && !!this.tickPositions }, addTitle: function (a) {
                        var b = this.chart.renderer, g = this.horiz, c = this.opposite, k = this.options.title, e; this.axisTitle || ((e = k.textAlign) || (e = (g ? { low: "left", middle: "center", high: "right" } : { low: c ? "right" : "left", middle: "center", high: c ? "left" : "right" })[k.align]), this.axisTitle = b.text(k.text, 0, 0, k.useHTML).attr({ zIndex: 7, rotation: k.rotation || 0, align: e }).addClass("highcharts-axis-title").css(k.style).add(this.axisGroup),
                            this.axisTitle.isNew = !0); this.axisTitle[a ? "show" : "hide"](!0)
                    }, getOffset: function () {
                        var a = this, b = a.chart, k = b.renderer, e = a.options, m = a.tickPositions, q = a.ticks, d = a.horiz, r = a.side, n = b.inverted ? [1, 0, 3, 2][r] : r, w, f, t = 0, z, h = 0, x = e.title, F = e.labels, p = 0, K = b.axisOffset, b = b.clipOffset, J = [-1, 1, 1, -1][r], u, y = e.className, v = a.axisParent, C = this.tickSize("tick"); w = a.hasData(); a.showAxis = f = w || A(e.showEmpty, !0); a.staggerLines = a.horiz && F.staggerLines; a.axisGroup || (a.gridGroup = k.g("grid").attr({ zIndex: e.gridZIndex || 1 }).addClass("highcharts-" +
                            this.coll.toLowerCase() + "-grid " + (y || "")).add(v), a.axisGroup = k.g("axis").attr({ zIndex: e.zIndex || 2 }).addClass("highcharts-" + this.coll.toLowerCase() + " " + (y || "")).add(v), a.labelGroup = k.g("axis-labels").attr({ zIndex: F.zIndex || 7 }).addClass("highcharts-" + a.coll.toLowerCase() + "-labels " + (y || "")).add(v)); if (w || a.isLinked) c(m, function (b) { q[b] ? q[b].addLabel() : q[b] = new N(a, b) }), a.renderUnsquish(), !1 === F.reserveSpace || 0 !== r && 2 !== r && { 1: "left", 3: "right" }[r] !== a.labelAlign && "center" !== a.labelAlign || c(m, function (a) {
                                p =
                                    Math.max(q[a].getLabelSize(), p)
                            }), a.staggerLines && (p *= a.staggerLines, a.labelOffset = p * (a.opposite ? -1 : 1)); else for (u in q) q[u].destroy(), delete q[u]; x && x.text && !1 !== x.enabled && (a.addTitle(f), f && (t = a.axisTitle.getBBox()[d ? "height" : "width"], z = x.offset, h = l(z) ? 0 : A(x.margin, d ? 5 : 10))); a.renderLine(); a.offset = J * A(e.offset, K[r]); a.tickRotCorr = a.tickRotCorr || { x: 0, y: 0 }; k = 0 === r ? -a.labelMetrics().h : 2 === r ? a.tickRotCorr.y : 0; h = Math.abs(p) + h; p && (h = h - k + J * (d ? A(F.y, a.tickRotCorr.y + 8 * J) : F.x)); a.axisTitleMargin = A(z, h);
                        K[r] = Math.max(K[r], a.axisTitleMargin + t + J * a.offset, h, w && m.length && C ? C[0] : 0); e = e.offset ? 0 : 2 * Math.floor(a.axisLine.strokeWidth() / 2); b[n] = Math.max(b[n], e)
                    }, getLinePath: function (a) { var b = this.chart, c = this.opposite, g = this.offset, k = this.horiz, e = this.left + (c ? this.width : 0) + g, g = b.chartHeight - this.bottom - (c ? this.height : 0) + g; c && (a *= -1); return b.renderer.crispLine(["M", k ? this.left : e, k ? g : this.top, "L", k ? b.chartWidth - this.right : e, k ? g : b.chartHeight - this.bottom], a) }, renderLine: function () {
                        this.axisLine || (this.axisLine =
                            this.chart.renderer.path().addClass("highcharts-axis-line").add(this.axisGroup), this.axisLine.attr({ stroke: this.options.lineColor, "stroke-width": this.options.lineWidth, zIndex: 7 }))
                    }, getTitlePosition: function () {
                        var a = this.horiz, b = this.left, c = this.top, k = this.len, e = this.options.title, m = a ? b : c, q = this.opposite, d = this.offset, r = e.x || 0, n = e.y || 0, w = this.chart.renderer.fontMetrics(e.style && e.style.fontSize, this.axisTitle).f, k = { low: m + (a ? 0 : k), middle: m + k / 2, high: m + (a ? k : 0) }[e.align], b = (a ? c + this.height : b) + (a ? 1 : -1) *
                            (q ? -1 : 1) * this.axisTitleMargin + (2 === this.side ? w : 0); return { x: a ? k + r : b + (q ? this.width : 0) + d + r, y: a ? b + n - (q ? this.height : 0) + d : k + n }
                    }, render: function () {
                        var a = this, b = a.chart, e = b.renderer, m = a.options, q = a.isLog, d = a.lin2log, r = a.isLinked, n = a.tickPositions, w = a.axisTitle, f = a.ticks, t = a.minorTicks, z = a.alternateBands, h = m.stackLabels, l = m.alternateGridColor, x = a.tickmarkOffset, p = a.axisLine, A = b.hasRendered && F(a.oldMin), K = a.showAxis, u = C(e.globalAnimation), y, v; a.labelEdge.length = 0; a.overlap = !1; c([f, t, z], function (a) {
                            for (var b in a) a[b].isActive =
                                !1
                        }); if (a.hasData() || r) a.minorTickInterval && !a.categories && c(a.getMinorTickPositions(), function (b) { t[b] || (t[b] = new N(a, b, "minor")); A && t[b].isNew && t[b].render(null, !0); t[b].render(null, !1, 1) }), n.length && (c(n, function (b, c) { if (!r || b >= a.min && b <= a.max) f[b] || (f[b] = new N(a, b)), A && f[b].isNew && f[b].render(c, !0, .1), f[b].render(c) }), x && (0 === a.min || a.single) && (f[-1] || (f[-1] = new N(a, -1, null, !0)), f[-1].render(-1))), l && c(n, function (c, g) {
                            v = void 0 !== n[g + 1] ? n[g + 1] + x : a.max - x; 0 === g % 2 && c < a.max && v <= a.max + (b.polar ? -x : x) &&
                                (z[c] || (z[c] = new k(a)), y = c + x, z[c].options = { from: q ? d(y) : y, to: q ? d(v) : v, color: l }, z[c].render(), z[c].isActive = !0)
                        }), a._addedPlotLB || (c((m.plotLines || []).concat(m.plotBands || []), function (b) { a.addPlotBandOrLine(b) }), a._addedPlotLB = !0); c([f, t, z], function (a) { var c, g, k = [], e = u.duration; for (c in a) a[c].isActive || (a[c].render(c, !1, 0), a[c].isActive = !1, k.push(c)); J(function () { for (g = k.length; g--;)a[k[g]] && !a[k[g]].isActive && (a[k[g]].destroy(), delete a[k[g]]) }, a !== z && b.hasRendered && e ? e : 0) }); p && (p[p.isPlaced ? "animate" :
                            "attr"]({ d: this.getLinePath(p.strokeWidth()) }), p.isPlaced = !0, p[K ? "show" : "hide"](!0)); w && K && (w[w.isNew ? "attr" : "animate"](a.getTitlePosition()), w.isNew = !1); h && h.enabled && a.renderStackTotals(); a.isDirty = !1
                    }, redraw: function () { this.visible && (this.render(), c(this.plotLinesAndBands, function (a) { a.render() })); c(this.series, function (a) { a.isDirty = !0 }) }, keepProps: "extKey hcEvents names series userMax userMin".split(" "), destroy: function (a) {
                        var b = this, g = b.stacks, k, e = b.plotLinesAndBands, m; a || w(b); for (k in g) d(g[k]),
                            g[k] = null; c([b.ticks, b.minorTicks, b.alternateBands], function (a) { d(a) }); if (e) for (a = e.length; a--;)e[a].destroy(); c("stackTotalGroup axisLine axisTitle axisGroup gridGroup labelGroup cross".split(" "), function (a) { b[a] && (b[a] = b[a].destroy()) }); for (m in b) b.hasOwnProperty(m) && -1 === q(m, b.keepProps) && delete b[m]
                    }, drawCrosshair: function (a, b) {
                        var c, g = this.crosshair, k = A(g.snap, !0), e, m = this.cross; a || (a = this.cross && this.cross.e); this.crosshair && !1 !== (l(b) || !k) ? (k ? l(b) && (e = this.isXAxis ? b.plotX : this.len - b.plotY) :
                            e = a && (this.horiz ? a.chartX - this.pos : this.len - a.chartY + this.pos), l(e) && (c = this.getPlotLinePath(b && (this.isXAxis ? b.x : A(b.stackY, b.y)), null, null, null, e) || null), l(c) ? (b = this.categories && !this.isRadial, m || (this.cross = m = this.chart.renderer.path().addClass("highcharts-crosshair highcharts-crosshair-" + (b ? "category " : "thin ") + g.className).attr({ zIndex: A(g.zIndex, 2) }).add(), m.attr({ stroke: g.color || (b ? f("#ccd6eb").setOpacity(.25).get() : "#cccccc"), "stroke-width": A(g.width, 1) }), g.dashStyle && m.attr({ dashstyle: g.dashStyle })),
                                m.show().attr({ d: c }), b && !g.width && m.attr({ "stroke-width": this.transA }), this.cross.e = a) : this.hideCrosshair()) : this.hideCrosshair()
                    }, hideCrosshair: function () { this.cross && this.cross.hide() }
                }; n(a.Axis.prototype, h)
        })(L); (function (a) {
            var D = a.Axis, C = a.Date, G = a.dateFormat, I = a.defaultOptions, h = a.defined, f = a.each, p = a.extend, v = a.getMagnitude, l = a.getTZOffset, u = a.normalizeTickInterval, d = a.pick, c = a.timeUnits; D.prototype.getTimeTicks = function (a, y, t, m) {
                var b = [], q = {}, n = I.global.useUTC, F, e = new C(y - l(y)), r = C.hcMakeTime,
                    x = a.unitRange, A = a.count, k; if (h(y)) {
                        e[C.hcSetMilliseconds](x >= c.second ? 0 : A * Math.floor(e.getMilliseconds() / A)); if (x >= c.second) e[C.hcSetSeconds](x >= c.minute ? 0 : A * Math.floor(e.getSeconds() / A)); if (x >= c.minute) e[C.hcSetMinutes](x >= c.hour ? 0 : A * Math.floor(e[C.hcGetMinutes]() / A)); if (x >= c.hour) e[C.hcSetHours](x >= c.day ? 0 : A * Math.floor(e[C.hcGetHours]() / A)); if (x >= c.day) e[C.hcSetDate](x >= c.month ? 1 : A * Math.floor(e[C.hcGetDate]() / A)); x >= c.month && (e[C.hcSetMonth](x >= c.year ? 0 : A * Math.floor(e[C.hcGetMonth]() / A)), F = e[C.hcGetFullYear]());
                        if (x >= c.year) e[C.hcSetFullYear](F - F % A); if (x === c.week) e[C.hcSetDate](e[C.hcGetDate]() - e[C.hcGetDay]() + d(m, 1)); F = e[C.hcGetFullYear](); m = e[C.hcGetMonth](); var w = e[C.hcGetDate](), K = e[C.hcGetHours](); if (C.hcTimezoneOffset || C.hcGetTimezoneOffset) k = (!n || !!C.hcGetTimezoneOffset) && (t - y > 4 * c.month || l(y) !== l(t)), e = e.getTime(), e = new C(e + l(e)); n = e.getTime(); for (y = 1; n < t;)b.push(n), n = x === c.year ? r(F + y * A, 0) : x === c.month ? r(F, m + y * A) : !k || x !== c.day && x !== c.week ? k && x === c.hour ? r(F, m, w, K + y * A) : n + x * A : r(F, m, w + y * A * (x === c.day ? 1 :
                            7)), y++; b.push(n); x <= c.hour && f(b, function (a) { "000000000" === G("%H%M%S%L", a) && (q[a] = "day") })
                    } b.info = p(a, { higherRanks: q, totalRange: x * A }); return b
            }; D.prototype.normalizeTimeTickInterval = function (a, d) {
                var f = d || [["millisecond", [1, 2, 5, 10, 20, 25, 50, 100, 200, 500]], ["second", [1, 2, 5, 10, 15, 30]], ["minute", [1, 2, 5, 10, 15, 30]], ["hour", [1, 2, 3, 4, 6, 8, 12]], ["day", [1, 2]], ["week", [1, 2]], ["month", [1, 2, 3, 4, 6]], ["year", null]]; d = f[f.length - 1]; var m = c[d[0]], b = d[1], q; for (q = 0; q < f.length && !(d = f[q], m = c[d[0]], b = d[1], f[q + 1] && a <= (m *
                    b[b.length - 1] + c[f[q + 1][0]]) / 2); q++); m === c.year && a < 5 * m && (b = [1, 2, 5]); a = u(a / m, b, "year" === d[0] ? Math.max(v(a / m), 1) : 1); return { unitRange: m, count: a, unitName: d[0] }
            }
        })(L); (function (a) {
            var D = a.Axis, C = a.getMagnitude, G = a.map, I = a.normalizeTickInterval, h = a.pick; D.prototype.getLogTickPositions = function (a, p, v, l) {
                var f = this.options, d = this.len, c = this.lin2log, n = this.log2lin, y = []; l || (this._minorAutoInterval = null); if (.5 <= a) a = Math.round(a), y = this.getLinearTickPositions(a, p, v); else if (.08 <= a) for (var d = Math.floor(p), t, m,
                    b, q, z, f = .3 < a ? [1, 2, 4] : .15 < a ? [1, 2, 4, 6, 8] : [1, 2, 3, 4, 5, 6, 7, 8, 9]; d < v + 1 && !z; d++)for (m = f.length, t = 0; t < m && !z; t++)b = n(c(d) * f[t]), b > p && (!l || q <= v) && void 0 !== q && y.push(q), q > v && (z = !0), q = b; else p = c(p), v = c(v), a = f[l ? "minorTickInterval" : "tickInterval"], a = h("auto" === a ? null : a, this._minorAutoInterval, f.tickPixelInterval / (l ? 5 : 1) * (v - p) / ((l ? d / this.tickPositions.length : d) || 1)), a = I(a, null, C(a)), y = G(this.getLinearTickPositions(a, p, v), n), l || (this._minorAutoInterval = a / 5); l || (this.tickInterval = a); return y
            }; D.prototype.log2lin =
                function (a) { return Math.log(a) / Math.LN10 }; D.prototype.lin2log = function (a) { return Math.pow(10, a) }
        })(L); (function (a) {
            var D = a.dateFormat, C = a.each, G = a.extend, I = a.format, h = a.isNumber, f = a.map, p = a.merge, v = a.pick, l = a.splat, u = a.syncTimeout, d = a.timeUnits; a.Tooltip = function () { this.init.apply(this, arguments) }; a.Tooltip.prototype = {
                init: function (a, d) { this.chart = a; this.options = d; this.crosshairs = []; this.now = { x: 0, y: 0 }; this.isHidden = !0; this.split = d.split && !a.inverted; this.shared = d.shared || this.split }, cleanSplit: function (a) {
                    C(this.chart.series,
                        function (c) { var d = c && c.tt; d && (!d.isActive || a ? c.tt = d.destroy() : d.isActive = !1) })
                }, getLabel: function () { var a = this.chart.renderer, d = this.options; this.label || (this.split ? this.label = a.g("tooltip") : (this.label = a.label("", 0, 0, d.shape || "callout", null, null, d.useHTML, null, "tooltip").attr({ padding: d.padding, r: d.borderRadius }), this.label.attr({ fill: d.backgroundColor, "stroke-width": d.borderWidth }).css(d.style).shadow(d.shadow)), this.label.attr({ zIndex: 8 }).add()); return this.label }, update: function (a) {
                    this.destroy();
                    this.init(this.chart, p(!0, this.options, a))
                }, destroy: function () { this.label && (this.label = this.label.destroy()); this.split && this.tt && (this.cleanSplit(this.chart, !0), this.tt = this.tt.destroy()); clearTimeout(this.hideTimer); clearTimeout(this.tooltipTimeout) }, move: function (a, d, f, t) {
                    var c = this, b = c.now, q = !1 !== c.options.animation && !c.isHidden && (1 < Math.abs(a - b.x) || 1 < Math.abs(d - b.y)), n = c.followPointer || 1 < c.len; G(b, {
                        x: q ? (2 * b.x + a) / 3 : a, y: q ? (b.y + d) / 2 : d, anchorX: n ? void 0 : q ? (2 * b.anchorX + f) / 3 : f, anchorY: n ? void 0 : q ? (b.anchorY +
                            t) / 2 : t
                    }); c.getLabel().attr(b); q && (clearTimeout(this.tooltipTimeout), this.tooltipTimeout = setTimeout(function () { c && c.move(a, d, f, t) }, 32))
                }, hide: function (a) { var c = this; clearTimeout(this.hideTimer); a = v(a, this.options.hideDelay, 500); this.isHidden || (this.hideTimer = u(function () { c.getLabel()[a ? "fadeOut" : "hide"](); c.isHidden = !0 }, a)) }, getAnchor: function (a, d) {
                    var c, n = this.chart, m = n.inverted, b = n.plotTop, q = n.plotLeft, z = 0, h = 0, e, r; a = l(a); c = a[0].tooltipPos; this.followPointer && d && (void 0 === d.chartX && (d = n.pointer.normalize(d)),
                        c = [d.chartX - n.plotLeft, d.chartY - b]); c || (C(a, function (a) { e = a.series.yAxis; r = a.series.xAxis; z += a.plotX + (!m && r ? r.left - q : 0); h += (a.plotLow ? (a.plotLow + a.plotHigh) / 2 : a.plotY) + (!m && e ? e.top - b : 0) }), z /= a.length, h /= a.length, c = [m ? n.plotWidth - h : z, this.shared && !m && 1 < a.length && d ? d.chartY - b : m ? n.plotHeight - z : h]); return f(c, Math.round)
                }, getPosition: function (a, d, f) {
                    var c = this.chart, m = this.distance, b = {}, q = f.h || 0, n, h = ["y", c.chartHeight, d, f.plotY + c.plotTop, c.plotTop, c.plotTop + c.plotHeight], e = ["x", c.chartWidth, a, f.plotX +
                        c.plotLeft, c.plotLeft, c.plotLeft + c.plotWidth], r = !this.followPointer && v(f.ttBelow, !c.inverted === !!f.negative), l = function (a, c, k, g, e, d) { var f = k < g - m, w = g + m + k < c, n = g - m - k; g += m; if (r && w) b[a] = g; else if (!r && f) b[a] = n; else if (f) b[a] = Math.min(d - k, 0 > n - q ? n : n - q); else if (w) b[a] = Math.max(e, g + q + k > c ? g : g + q); else return !1 }, p = function (a, c, k, g) { var e; g < m || g > c - m ? e = !1 : b[a] = g < k / 2 ? 1 : g > c - k / 2 ? c - k - 2 : g - k / 2; return e }, k = function (a) { var b = h; h = e; e = b; n = a }, w = function () {
                            !1 !== l.apply(0, h) ? !1 !== p.apply(0, e) || n || (k(!0), w()) : n ? b.x = b.y = 0 : (k(!0),
                                w())
                        }; (c.inverted || 1 < this.len) && k(); w(); return b
                }, defaultFormatter: function (a) { var c = this.points || l(this), d; d = [a.tooltipFooterHeaderFormatter(c[0])]; d = d.concat(a.bodyFormatter(c)); d.push(a.tooltipFooterHeaderFormatter(c[0], !0)); return d }, refresh: function (a, d) {
                    var c = this.chart, f, m = this.options, b, q, n = {}, h = []; f = m.formatter || this.defaultFormatter; var n = c.hoverPoints, e = this.shared; clearTimeout(this.hideTimer); this.followPointer = l(a)[0].series.tooltipOptions.followPointer; q = this.getAnchor(a, d); d = q[0]; b =
                        q[1]; !e || a.series && a.series.noSharedTooltip ? n = a.getLabelConfig() : (c.hoverPoints = a, n && C(n, function (a) { a.setState() }), C(a, function (a) { a.setState("hover"); h.push(a.getLabelConfig()) }), n = { x: a[0].category, y: a[0].y }, n.points = h, this.len = h.length, a = a[0]); n = f.call(n, this); e = a.series; this.distance = v(e.tooltipOptions.distance, 16); !1 === n ? this.hide() : (f = this.getLabel(), this.isHidden && f.attr({ opacity: 1 }).show(), this.split ? this.renderSplit(n, c.hoverPoints) : (f.attr({ text: n && n.join ? n.join("") : n }), f.removeClass(/highcharts-color-[\d]+/g).addClass("highcharts-color-" +
                            v(a.colorIndex, e.colorIndex)), f.attr({ stroke: m.borderColor || a.color || e.color || "#666666" }), this.updatePosition({ plotX: d, plotY: b, negative: a.negative, ttBelow: a.ttBelow, h: q[2] || 0 })), this.isHidden = !1)
                }, renderSplit: function (c, d) {
                    var f = this, n = [], m = this.chart, b = m.renderer, q = !0, h = this.options, l, e = this.getLabel(); C(c.slice(0, c.length - 1), function (a, c) {
                        c = d[c - 1] || { isHeader: !0, plotX: d[0].plotX }; var r = c.series || f, k = r.tt, w = c.series || {}, t = "highcharts-color-" + v(c.colorIndex, w.colorIndex, "none"); k || (r.tt = k = b.label(null,
                            null, null, "callout").addClass("highcharts-tooltip-box " + t).attr({ padding: h.padding, r: h.borderRadius, fill: h.backgroundColor, stroke: c.color || w.color || "#333333", "stroke-width": h.borderWidth }).add(e)); k.isActive = !0; k.attr({ text: a }); k.css(h.style); a = k.getBBox(); w = a.width + k.strokeWidth(); c.isHeader ? (l = a.height, w = Math.max(0, Math.min(c.plotX + m.plotLeft - w / 2, m.chartWidth - w))) : w = c.plotX + m.plotLeft - v(h.distance, 16) - w; 0 > w && (q = !1); a = (c.series && c.series.yAxis && c.series.yAxis.pos) + (c.plotY || 0); a -= m.plotTop; n.push({
                                target: c.isHeader ?
                                    m.plotHeight + l : a, rank: c.isHeader ? 1 : 0, size: r.tt.getBBox().height + 1, point: c, x: w, tt: k
                            })
                    }); this.cleanSplit(); a.distribute(n, m.plotHeight + l); C(n, function (a) { var b = a.point, c = b.series; a.tt.attr({ visibility: void 0 === a.pos ? "hidden" : "inherit", x: q || b.isHeader ? a.x : b.plotX + m.plotLeft + v(h.distance, 16), y: a.pos + m.plotTop, anchorX: b.isHeader ? b.plotX + m.plotLeft : b.plotX + c.xAxis.pos, anchorY: b.isHeader ? a.pos + m.plotTop - 15 : b.plotY + c.yAxis.pos }) })
                }, updatePosition: function (a) {
                    var c = this.chart, d = this.getLabel(), d = (this.options.positioner ||
                        this.getPosition).call(this, d.width, d.height, a); this.move(Math.round(d.x), Math.round(d.y || 0), a.plotX + c.plotLeft, a.plotY + c.plotTop)
                }, getXDateFormat: function (a, f, h) {
                    var c; f = f.dateTimeLabelFormats; var m = h && h.closestPointRange, b, q = { millisecond: 15, second: 12, minute: 9, hour: 6, day: 3 }, n, l = "millisecond"; if (m) {
                        n = D("%m-%d %H:%M:%S.%L", a.x); for (b in d) {
                            if (m === d.week && +D("%w", a.x) === h.options.startOfWeek && "00:00:00.000" === n.substr(6)) { b = "week"; break } if (d[b] > m) { b = l; break } if (q[b] && n.substr(q[b]) !== "01-01 00:00:00.000".substr(q[b])) break;
                            "week" !== b && (l = b)
                        } b && (c = f[b])
                    } else c = f.day; return c || f.year
                }, tooltipFooterHeaderFormatter: function (a, d) { var c = d ? "footer" : "header"; d = a.series; var f = d.tooltipOptions, m = f.xDateFormat, b = d.xAxis, q = b && "datetime" === b.options.type && h(a.key), c = f[c + "Format"]; q && !m && (m = this.getXDateFormat(a, f, b)); q && m && (c = c.replace("{point.key}", "{point.key:" + m + "}")); return I(c, { point: a, series: d }) }, bodyFormatter: function (a) {
                    return f(a, function (a) {
                        var c = a.series.tooltipOptions; return (c.pointFormatter || a.point.tooltipFormatter).call(a.point,
                            c.pointFormat)
                    })
                }
            }
        })(L); (function (a) {
            var D = a.addEvent, C = a.attr, G = a.charts, I = a.color, h = a.css, f = a.defined, p = a.doc, v = a.each, l = a.extend, u = a.fireEvent, d = a.offset, c = a.pick, n = a.removeEvent, y = a.splat, t = a.Tooltip, m = a.win; a.Pointer = function (a, c) { this.init(a, c) }; a.Pointer.prototype = {
                init: function (a, m) {
                    this.options = m; this.chart = a; this.runChartClick = m.chart.events && !!m.chart.events.click; this.pinchDown = []; this.lastValidTouch = {}; t && m.tooltip.enabled && (a.tooltip = new t(a, m.tooltip), this.followTouchMove = c(m.tooltip.followTouchMove,
                        !0)); this.setDOMEvents()
                }, zoomOption: function (a) { var b = this.chart, m = b.options.chart, d = m.zoomType || "", b = b.inverted; /touch/.test(a.type) && (d = c(m.pinchType, d)); this.zoomX = a = /x/.test(d); this.zoomY = d = /y/.test(d); this.zoomHor = a && !b || d && b; this.zoomVert = d && !b || a && b; this.hasZoom = a || d }, normalize: function (a, c) {
                    var b, q; a = a || m.event; a.target || (a.target = a.srcElement); q = a.touches ? a.touches.length ? a.touches.item(0) : a.changedTouches[0] : a; c || (this.chartPosition = c = d(this.chart.container)); void 0 === q.pageX ? (b = Math.max(a.x,
                        a.clientX - c.left), c = a.y) : (b = q.pageX - c.left, c = q.pageY - c.top); return l(a, { chartX: Math.round(b), chartY: Math.round(c) })
                }, getCoordinates: function (a) { var b = { xAxis: [], yAxis: [] }; v(this.chart.axes, function (c) { b[c.isXAxis ? "xAxis" : "yAxis"].push({ axis: c, value: c.toValue(a[c.horiz ? "chartX" : "chartY"]) }) }); return b }, runPointActions: function (b) {
                    var m = this.chart, d = m.series, f = m.tooltip, e = f ? f.shared : !1, r = !0, n = m.hoverPoint, h = m.hoverSeries, k, w, l, t = [], u; if (!e && !h) for (k = 0; k < d.length; k++)if (d[k].directTouch || !d[k].options.stickyTracking) d =
                        []; h && (e ? h.noSharedTooltip : h.directTouch) && n ? t = [n] : (e || !h || h.options.stickyTracking || (d = [h]), v(d, function (a) { w = a.noSharedTooltip && e; l = !e && a.directTouch; a.visible && !w && !l && c(a.options.enableMouseTracking, !0) && (u = a.searchPoint(b, !w && 1 === a.kdDimensions)) && u.series && t.push(u) }), t.sort(function (a, b) { var c = a.distX - b.distX, g = a.dist - b.dist, k = b.series.group.zIndex - a.series.group.zIndex; return 0 !== c && e ? c : 0 !== g ? g : 0 !== k ? k : a.series.index > b.series.index ? -1 : 1 })); if (e) for (k = t.length; k--;)(t[k].x !== t[0].x || t[k].series.noSharedTooltip) &&
                            t.splice(k, 1); if (t[0] && (t[0] !== this.prevKDPoint || f && f.isHidden)) { if (e && !t[0].series.noSharedTooltip) { for (k = 0; k < t.length; k++)t[k].onMouseOver(b, t[k] !== (h && h.directTouch && n || t[0])); t.length && f && f.refresh(t.sort(function (a, b) { return a.series.index - b.series.index }), b) } else if (f && f.refresh(t[0], b), !h || !h.directTouch) t[0].onMouseOver(b); this.prevKDPoint = t[0]; r = !1 } r && (d = h && h.tooltipOptions.followPointer, f && d && !f.isHidden && (d = f.getAnchor([{}], b), f.updatePosition({ plotX: d[0], plotY: d[1] }))); this.unDocMouseMove ||
                                (this.unDocMouseMove = D(p, "mousemove", function (b) { if (G[a.hoverChartIndex]) G[a.hoverChartIndex].pointer.onDocumentMouseMove(b) })); v(e ? t : [c(n, t[0])], function (a) { v(m.axes, function (c) { (!a || a.series && a.series[c.coll] === c) && c.drawCrosshair(b, a) }) })
                }, reset: function (a, c) {
                    var b = this.chart, m = b.hoverSeries, e = b.hoverPoint, d = b.hoverPoints, q = b.tooltip, f = q && q.shared ? d : e; a && f && v(y(f), function (b) { b.series.isCartesian && void 0 === b.plotX && (a = !1) }); if (a) q && f && (q.refresh(f), e && (e.setState(e.state, !0), v(b.axes, function (a) {
                        a.crosshair &&
                            a.drawCrosshair(null, e)
                    }))); else { if (e) e.onMouseOut(); d && v(d, function (a) { a.setState() }); if (m) m.onMouseOut(); q && q.hide(c); this.unDocMouseMove && (this.unDocMouseMove = this.unDocMouseMove()); v(b.axes, function (a) { a.hideCrosshair() }); this.hoverX = this.prevKDPoint = b.hoverPoints = b.hoverPoint = null }
                }, scaleGroups: function (a, c) {
                    var b = this.chart, m; v(b.series, function (e) {
                        m = a || e.getPlotBox(); e.xAxis && e.xAxis.zoomEnabled && e.group && (e.group.attr(m), e.markerGroup && (e.markerGroup.attr(m), e.markerGroup.clip(c ? b.clipRect :
                            null)), e.dataLabelsGroup && e.dataLabelsGroup.attr(m))
                    }); b.clipRect.attr(c || b.clipBox)
                }, dragStart: function (a) { var b = this.chart; b.mouseIsDown = a.type; b.cancelClick = !1; b.mouseDownX = this.mouseDownX = a.chartX; b.mouseDownY = this.mouseDownY = a.chartY }, drag: function (a) {
                    var b = this.chart, c = b.options.chart, m = a.chartX, e = a.chartY, d = this.zoomHor, f = this.zoomVert, n = b.plotLeft, k = b.plotTop, w = b.plotWidth, h = b.plotHeight, l, t = this.selectionMarker, g = this.mouseDownX, p = this.mouseDownY, u = c.panKey && a[c.panKey + "Key"]; t && t.touch ||
                        (m < n ? m = n : m > n + w && (m = n + w), e < k ? e = k : e > k + h && (e = k + h), this.hasDragged = Math.sqrt(Math.pow(g - m, 2) + Math.pow(p - e, 2)), 10 < this.hasDragged && (l = b.isInsidePlot(g - n, p - k), b.hasCartesianSeries && (this.zoomX || this.zoomY) && l && !u && !t && (this.selectionMarker = t = b.renderer.rect(n, k, d ? 1 : w, f ? 1 : h, 0).attr({ fill: c.selectionMarkerFill || I("#335cad").setOpacity(.25).get(), "class": "highcharts-selection-marker", zIndex: 7 }).add()), t && d && (m -= g, t.attr({ width: Math.abs(m), x: (0 < m ? 0 : m) + g })), t && f && (m = e - p, t.attr({
                            height: Math.abs(m), y: (0 < m ? 0 : m) +
                                p
                        })), l && !t && c.panning && b.pan(a, c.panning)))
                }, drop: function (a) {
                    var b = this, c = this.chart, m = this.hasPinched; if (this.selectionMarker) {
                        var e = { originalEvent: a, xAxis: [], yAxis: [] }, d = this.selectionMarker, n = d.attr ? d.attr("x") : d.x, t = d.attr ? d.attr("y") : d.y, k = d.attr ? d.attr("width") : d.width, w = d.attr ? d.attr("height") : d.height, p; if (this.hasDragged || m) v(c.axes, function (c) {
                            if (c.zoomEnabled && f(c.min) && (m || b[{ xAxis: "zoomX", yAxis: "zoomY" }[c.coll]])) {
                                var d = c.horiz, g = "touchend" === a.type ? c.minPixelPadding : 0, q = c.toValue((d ?
                                    n : t) + g), d = c.toValue((d ? n + k : t + w) - g); e[c.coll].push({ axis: c, min: Math.min(q, d), max: Math.max(q, d) }); p = !0
                            }
                        }), p && u(c, "selection", e, function (a) { c.zoom(l(a, m ? { animation: !1 } : null)) }); this.selectionMarker = this.selectionMarker.destroy(); m && this.scaleGroups()
                    } c && (h(c.container, { cursor: c._cursor }), c.cancelClick = 10 < this.hasDragged, c.mouseIsDown = this.hasDragged = this.hasPinched = !1, this.pinchDown = [])
                }, onContainerMouseDown: function (a) { a = this.normalize(a); this.zoomOption(a); a.preventDefault && a.preventDefault(); this.dragStart(a) },
                onDocumentMouseUp: function (b) { G[a.hoverChartIndex] && G[a.hoverChartIndex].pointer.drop(b) }, onDocumentMouseMove: function (a) { var b = this.chart, c = this.chartPosition; a = this.normalize(a, c); !c || this.inClass(a.target, "highcharts-tracker") || b.isInsidePlot(a.chartX - b.plotLeft, a.chartY - b.plotTop) || this.reset() }, onContainerMouseLeave: function (b) { var c = G[a.hoverChartIndex]; c && (b.relatedTarget || b.toElement) && (c.pointer.reset(), c.pointer.chartPosition = null) }, onContainerMouseMove: function (b) {
                    var c = this.chart; f(a.hoverChartIndex) &&
                        G[a.hoverChartIndex] && G[a.hoverChartIndex].mouseIsDown || (a.hoverChartIndex = c.index); b = this.normalize(b); b.returnValue = !1; "mousedown" === c.mouseIsDown && this.drag(b); !this.inClass(b.target, "highcharts-tracker") && !c.isInsidePlot(b.chartX - c.plotLeft, b.chartY - c.plotTop) || c.openMenu || this.runPointActions(b)
                }, inClass: function (a, c) { for (var b; a;) { if (b = C(a, "class")) { if (-1 !== b.indexOf(c)) return !0; if (-1 !== b.indexOf("highcharts-container")) return !1 } a = a.parentNode } }, onTrackerMouseOut: function (a) {
                    var b = this.chart.hoverSeries;
                    a = a.relatedTarget || a.toElement; if (!(!b || !a || b.options.stickyTracking || this.inClass(a, "highcharts-tooltip") || this.inClass(a, "highcharts-series-" + b.index) && this.inClass(a, "highcharts-tracker"))) b.onMouseOut()
                }, onContainerClick: function (a) {
                    var b = this.chart, c = b.hoverPoint, m = b.plotLeft, e = b.plotTop; a = this.normalize(a); b.cancelClick || (c && this.inClass(a.target, "highcharts-tracker") ? (u(c.series, "click", l(a, { point: c })), b.hoverPoint && c.firePointEvent("click", a)) : (l(a, this.getCoordinates(a)), b.isInsidePlot(a.chartX -
                        m, a.chartY - e) && u(b, "click", a)))
                }, setDOMEvents: function () { var b = this, c = b.chart.container; c.onmousedown = function (a) { b.onContainerMouseDown(a) }; c.onmousemove = function (a) { b.onContainerMouseMove(a) }; c.onclick = function (a) { b.onContainerClick(a) }; D(c, "mouseleave", b.onContainerMouseLeave); 1 === a.chartCount && D(p, "mouseup", b.onDocumentMouseUp); a.hasTouch && (c.ontouchstart = function (a) { b.onContainerTouchStart(a) }, c.ontouchmove = function (a) { b.onContainerTouchMove(a) }, 1 === a.chartCount && D(p, "touchend", b.onDocumentTouchEnd)) },
                destroy: function () { var b; n(this.chart.container, "mouseleave", this.onContainerMouseLeave); a.chartCount || (n(p, "mouseup", this.onDocumentMouseUp), n(p, "touchend", this.onDocumentTouchEnd)); clearInterval(this.tooltipTimeout); for (b in this) this[b] = null }
            }
        })(L); (function (a) {
            var D = a.charts, C = a.each, G = a.extend, I = a.map, h = a.noop, f = a.pick; G(a.Pointer.prototype, {
                pinchTranslate: function (a, f, h, u, d, c) {
                    this.zoomHor && this.pinchTranslateDirection(!0, a, f, h, u, d, c); this.zoomVert && this.pinchTranslateDirection(!1, a, f, h, u, d,
                        c)
                }, pinchTranslateDirection: function (a, f, h, u, d, c, n, y) {
                    var t = this.chart, m = a ? "x" : "y", b = a ? "X" : "Y", q = "chart" + b, l = a ? "width" : "height", p = t["plot" + (a ? "Left" : "Top")], e, r, x = y || 1, A = t.inverted, k = t.bounds[a ? "h" : "v"], w = 1 === f.length, K = f[0][q], J = h[0][q], v = !w && f[1][q], g = !w && h[1][q], B; h = function () { !w && 20 < Math.abs(K - v) && (x = y || Math.abs(J - g) / Math.abs(K - v)); r = (p - J) / x + K; e = t["plot" + (a ? "Width" : "Height")] / x }; h(); f = r; f < k.min ? (f = k.min, B = !0) : f + e > k.max && (f = k.max - e, B = !0); B ? (J -= .8 * (J - n[m][0]), w || (g -= .8 * (g - n[m][1])), h()) : n[m] = [J,
                        g]; A || (c[m] = r - p, c[l] = e); c = A ? 1 / x : x; d[l] = e; d[m] = f; u[A ? a ? "scaleY" : "scaleX" : "scale" + b] = x; u["translate" + b] = c * p + (J - c * K)
                }, pinch: function (a) {
                    var p = this, l = p.chart, u = p.pinchDown, d = a.touches, c = d.length, n = p.lastValidTouch, y = p.hasZoom, t = p.selectionMarker, m = {}, b = 1 === c && (p.inClass(a.target, "highcharts-tracker") && l.runTrackerClick || p.runChartClick), q = {}; 1 < c && (p.initiated = !0); y && p.initiated && !b && a.preventDefault(); I(d, function (a) { return p.normalize(a) }); "touchstart" === a.type ? (C(d, function (a, b) {
                        u[b] = {
                            chartX: a.chartX,
                            chartY: a.chartY
                        }
                    }), n.x = [u[0].chartX, u[1] && u[1].chartX], n.y = [u[0].chartY, u[1] && u[1].chartY], C(l.axes, function (a) { if (a.zoomEnabled) { var b = l.bounds[a.horiz ? "h" : "v"], c = a.minPixelPadding, m = a.toPixels(f(a.options.min, a.dataMin)), d = a.toPixels(f(a.options.max, a.dataMax)), q = Math.max(m, d); b.min = Math.min(a.pos, Math.min(m, d) - c); b.max = Math.max(a.pos + a.len, q + c) } }), p.res = !0) : p.followTouchMove && 1 === c ? this.runPointActions(p.normalize(a)) : u.length && (t || (p.selectionMarker = t = G({ destroy: h, touch: !0 }, l.plotBox)), p.pinchTranslate(u,
                        d, m, t, q, n), p.hasPinched = y, p.scaleGroups(m, q), p.res && (p.res = !1, this.reset(!1, 0)))
                }, touch: function (h, v) {
                    var l = this.chart, p, d; if (l.index !== a.hoverChartIndex) this.onContainerMouseLeave({ relatedTarget: !0 }); a.hoverChartIndex = l.index; 1 === h.touches.length ? (h = this.normalize(h), (d = l.isInsidePlot(h.chartX - l.plotLeft, h.chartY - l.plotTop)) && !l.openMenu ? (v && this.runPointActions(h), "touchmove" === h.type && (v = this.pinchDown, p = v[0] ? 4 <= Math.sqrt(Math.pow(v[0].chartX - h.chartX, 2) + Math.pow(v[0].chartY - h.chartY, 2)) : !1), f(p,
                        !0) && this.pinch(h)) : v && this.reset()) : 2 === h.touches.length && this.pinch(h)
                }, onContainerTouchStart: function (a) { this.zoomOption(a); this.touch(a, !0) }, onContainerTouchMove: function (a) { this.touch(a) }, onDocumentTouchEnd: function (f) { D[a.hoverChartIndex] && D[a.hoverChartIndex].pointer.drop(f) }
            })
        })(L); (function (a) {
            var D = a.addEvent, C = a.charts, G = a.css, I = a.doc, h = a.extend, f = a.noop, p = a.Pointer, v = a.removeEvent, l = a.win, u = a.wrap; if (l.PointerEvent || l.MSPointerEvent) {
                var d = {}, c = !!l.PointerEvent, n = function () {
                    var a, c = [];
                    c.item = function (a) { return this[a] }; for (a in d) d.hasOwnProperty(a) && c.push({ pageX: d[a].pageX, pageY: d[a].pageY, target: d[a].target }); return c
                }, y = function (c, m, b, d) { "touch" !== c.pointerType && c.pointerType !== c.MSPOINTER_TYPE_TOUCH || !C[a.hoverChartIndex] || (d(c), d = C[a.hoverChartIndex].pointer, d[m]({ type: b, target: c.currentTarget, preventDefault: f, touches: n() })) }; h(p.prototype, {
                    onContainerPointerDown: function (a) {
                        y(a, "onContainerTouchStart", "touchstart", function (a) {
                            d[a.pointerId] = {
                                pageX: a.pageX, pageY: a.pageY,
                                target: a.currentTarget
                            }
                        })
                    }, onContainerPointerMove: function (a) { y(a, "onContainerTouchMove", "touchmove", function (a) { d[a.pointerId] = { pageX: a.pageX, pageY: a.pageY }; d[a.pointerId].target || (d[a.pointerId].target = a.currentTarget) }) }, onDocumentPointerUp: function (a) { y(a, "onDocumentTouchEnd", "touchend", function (a) { delete d[a.pointerId] }) }, batchMSEvents: function (a) {
                        a(this.chart.container, c ? "pointerdown" : "MSPointerDown", this.onContainerPointerDown); a(this.chart.container, c ? "pointermove" : "MSPointerMove", this.onContainerPointerMove);
                        a(I, c ? "pointerup" : "MSPointerUp", this.onDocumentPointerUp)
                    }
                }); u(p.prototype, "init", function (a, c, b) { a.call(this, c, b); this.hasZoom && G(c.container, { "-ms-touch-action": "none", "touch-action": "none" }) }); u(p.prototype, "setDOMEvents", function (a) { a.apply(this); (this.hasZoom || this.followTouchMove) && this.batchMSEvents(D) }); u(p.prototype, "destroy", function (a) { this.batchMSEvents(v); a.call(this) })
            }
        })(L); (function (a) {
            var D, C = a.addEvent, G = a.css, I = a.discardElement, h = a.defined, f = a.each, p = a.extend, v = a.isFirefox, l = a.marginNames,
                u = a.merge, d = a.pick, c = a.setAnimation, n = a.stableSort, y = a.win, t = a.wrap; D = a.Legend = function (a, b) { this.init(a, b) }; D.prototype = {
                    init: function (a, b) { this.chart = a; this.setOptions(b); b.enabled && (this.render(), C(this.chart, "endResize", function () { this.legend.positionCheckboxes() })) }, setOptions: function (a) {
                        var b = d(a.padding, 8); this.options = a; this.itemStyle = a.itemStyle; this.itemHiddenStyle = u(this.itemStyle, a.itemHiddenStyle); this.itemMarginTop = a.itemMarginTop || 0; this.initialItemX = this.padding = b; this.initialItemY =
                            b - 5; this.itemHeight = this.maxItemWidth = 0; this.symbolWidth = d(a.symbolWidth, 16); this.pages = []
                    }, update: function (a, b) { var c = this.chart; this.setOptions(u(!0, this.options, a)); this.destroy(); c.isDirtyLegend = c.isDirtyBox = !0; d(b, !0) && c.redraw() }, colorizeItem: function (a, b) {
                        a.legendGroup[b ? "removeClass" : "addClass"]("highcharts-legend-item-hidden"); var c = this.options, d = a.legendItem, m = a.legendLine, e = a.legendSymbol, f = this.itemHiddenStyle.color, c = b ? c.itemStyle.color : f, h = b ? a.color || f : f, n = a.options && a.options.marker,
                            k = { fill: h }, w; d && d.css({ fill: c, color: c }); m && m.attr({ stroke: h }); if (e) { if (n && e.isMarker && (k = a.pointAttribs(), !b)) for (w in k) k[w] = f; e.attr(k) }
                    }, positionItem: function (a) { var b = this.options, c = b.symbolPadding, b = !b.rtl, d = a._legendItemPos, m = d[0], d = d[1], e = a.checkbox; (a = a.legendGroup) && a.element && a.translate(b ? m : this.legendWidth - m - 2 * c - 4, d); e && (e.x = m, e.y = d) }, destroyItem: function (a) { var b = a.checkbox; f(["legendItem", "legendLine", "legendSymbol", "legendGroup"], function (b) { a[b] && (a[b] = a[b].destroy()) }); b && I(a.checkbox) },
                    destroy: function () { function a(a) { this[a] && (this[a] = this[a].destroy()) } f(this.getAllItems(), function (b) { f(["legendItem", "legendGroup"], a, b) }); f(["box", "title", "group"], a, this); this.display = null }, positionCheckboxes: function (a) { var b = this.group && this.group.alignAttr, c, d = this.clipHeight || this.legendHeight, m = this.titleHeight; b && (c = b.translateY, f(this.allItems, function (e) { var f = e.checkbox, h; f && (h = c + m + f.y + (a || 0) + 3, G(f, { left: b.translateX + e.checkboxOffset + f.x - 20 + "px", top: h + "px", display: h > c - 6 && h < c + d - 6 ? "" : "none" })) })) },
                    renderTitle: function () { var a = this.padding, b = this.options.title, c = 0; b.text && (this.title || (this.title = this.chart.renderer.label(b.text, a - 3, a - 4, null, null, null, null, null, "legend-title").attr({ zIndex: 1 }).css(b.style).add(this.group)), a = this.title.getBBox(), c = a.height, this.offsetWidth = a.width, this.contentGroup.attr({ translateY: c })); this.titleHeight = c }, setText: function (c) { var b = this.options; c.legendItem.attr({ text: b.labelFormat ? a.format(b.labelFormat, c) : b.labelFormatter.call(c) }) }, renderItem: function (a) {
                        var b =
                            this.chart, c = b.renderer, m = this.options, f = "horizontal" === m.layout, e = this.symbolWidth, h = m.symbolPadding, n = this.itemStyle, l = this.itemHiddenStyle, k = this.padding, w = f ? d(m.itemDistance, 20) : 0, t = !m.rtl, p = m.width, y = m.itemMarginBottom || 0, g = this.itemMarginTop, B = this.initialItemX, v = a.legendItem, M = !a.series, C = !M && a.series.drawLegendSymbol ? a.series : a, E = C.options, E = this.createCheckboxForItem && E && E.showCheckbox, H = m.useHTML; v || (a.legendGroup = c.g("legend-item").addClass("highcharts-" + C.type + "-series highcharts-color-" +
                                a.colorIndex + (a.options.className ? " " + a.options.className : "") + (M ? " highcharts-series-" + a.index : "")).attr({ zIndex: 1 }).add(this.scrollGroup), a.legendItem = v = c.text("", t ? e + h : -h, this.baseline || 0, H).css(u(a.visible ? n : l)).attr({ align: t ? "left" : "right", zIndex: 2 }).add(a.legendGroup), this.baseline || (n = n.fontSize, this.fontMetrics = c.fontMetrics(n, v), this.baseline = this.fontMetrics.f + 3 + g, v.attr("y", this.baseline)), C.drawLegendSymbol(this, a), this.setItemEvents && this.setItemEvents(a, v, H), E && this.createCheckboxForItem(a));
                        this.colorizeItem(a, a.visible); this.setText(a); c = v.getBBox(); e = a.checkboxOffset = m.itemWidth || a.legendItemWidth || e + h + c.width + w + (E ? 20 : 0); this.itemHeight = h = Math.round(a.legendItemHeight || c.height); f && this.itemX - B + e > (p || b.chartWidth - 2 * k - B - m.x) && (this.itemX = B, this.itemY += g + this.lastLineHeight + y, this.lastLineHeight = 0); this.maxItemWidth = Math.max(this.maxItemWidth, e); this.lastItemY = g + this.itemY + y; this.lastLineHeight = Math.max(h, this.lastLineHeight); a._legendItemPos = [this.itemX, this.itemY]; f ? this.itemX += e :
                            (this.itemY += g + h + y, this.lastLineHeight = h); this.offsetWidth = p || Math.max((f ? this.itemX - B - w : e) + k, this.offsetWidth)
                    }, getAllItems: function () { var a = []; f(this.chart.series, function (b) { var c = b && b.options; b && d(c.showInLegend, h(c.linkedTo) ? !1 : void 0, !0) && (a = a.concat(b.legendItems || ("point" === c.legendType ? b.data : b))) }); return a }, adjustMargins: function (a, b) {
                        var c = this.chart, m = this.options, n = m.align.charAt(0) + m.verticalAlign.charAt(0) + m.layout.charAt(0); m.floating || f([/(lth|ct|rth)/, /(rtv|rm|rbv)/, /(rbh|cb|lbh)/,
                            /(lbv|lm|ltv)/], function (e, f) { e.test(n) && !h(a[f]) && (c[l[f]] = Math.max(c[l[f]], c.legend[(f + 1) % 2 ? "legendHeight" : "legendWidth"] + [1, -1, -1, 1][f] * m[f % 2 ? "x" : "y"] + d(m.margin, 12) + b[f])) })
                    }, render: function () {
                        var a = this, b = a.chart, c = b.renderer, d = a.group, h, e, r, l, t = a.box, k = a.options, w = a.padding; a.itemX = a.initialItemX; a.itemY = a.initialItemY; a.offsetWidth = 0; a.lastItemY = 0; d || (a.group = d = c.g("legend").attr({ zIndex: 7 }).add(), a.contentGroup = c.g().attr({ zIndex: 1 }).add(d), a.scrollGroup = c.g().add(a.contentGroup)); a.renderTitle();
                        h = a.getAllItems(); n(h, function (a, b) { return (a.options && a.options.legendIndex || 0) - (b.options && b.options.legendIndex || 0) }); k.reversed && h.reverse(); a.allItems = h; a.display = e = !!h.length; a.lastLineHeight = 0; f(h, function (b) { a.renderItem(b) }); r = (k.width || a.offsetWidth) + w; l = a.lastItemY + a.lastLineHeight + a.titleHeight; l = a.handleOverflow(l); l += w; t || (a.box = t = c.rect().addClass("highcharts-legend-box").attr({ r: k.borderRadius }).add(d), t.isNew = !0); t.attr({
                            stroke: k.borderColor, "stroke-width": k.borderWidth || 0, fill: k.backgroundColor ||
                                "none"
                        }).shadow(k.shadow); 0 < r && 0 < l && (t[t.isNew ? "attr" : "animate"](t.crisp({ x: 0, y: 0, width: r, height: l }, t.strokeWidth())), t.isNew = !1); t[e ? "show" : "hide"](); a.legendWidth = r; a.legendHeight = l; f(h, function (b) { a.positionItem(b) }); e && d.align(p({ width: r, height: l }, k), !0, "spacingBox"); b.isResizing || this.positionCheckboxes()
                    }, handleOverflow: function (a) {
                        var b = this, c = this.chart, m = c.renderer, h = this.options, e = h.y, c = c.spacingBox.height + ("top" === h.verticalAlign ? -e : e) - this.padding, e = h.maxHeight, n, l = this.clipRect, t = h.navigation,
                            k = d(t.animation, !0), w = t.arrowSize || 12, p = this.nav, u = this.pages, y = this.padding, g, B = this.allItems, v = function (a) { a ? l.attr({ height: a }) : l && (b.clipRect = l.destroy(), b.contentGroup.clip()); b.contentGroup.div && (b.contentGroup.div.style.clip = a ? "rect(" + y + "px,9999px," + (y + a) + "px,0)" : "auto") }; "horizontal" !== h.layout || "middle" === h.verticalAlign || h.floating || (c /= 2); e && (c = Math.min(c, e)); u.length = 0; a > c && !1 !== t.enabled ? (this.clipHeight = n = Math.max(c - 20 - this.titleHeight - y, 0), this.currentPage = d(this.currentPage, 1), this.fullHeight =
                                a, f(B, function (a, b) { var c = a._legendItemPos[1]; a = Math.round(a.legendItem.getBBox().height); var k = u.length; if (!k || c - u[k - 1] > n && (g || c) !== u[k - 1]) u.push(g || c), k++; b === B.length - 1 && c + a - u[k - 1] > n && u.push(c); c !== g && (g = c) }), l || (l = b.clipRect = m.clipRect(0, y, 9999, 0), b.contentGroup.clip(l)), v(n), p || (this.nav = p = m.g().attr({ zIndex: 1 }).add(this.group), this.up = m.symbol("triangle", 0, 0, w, w).on("click", function () { b.scroll(-1, k) }).add(p), this.pager = m.text("", 15, 10).addClass("highcharts-legend-navigation").css(t.style).add(p),
                                    this.down = m.symbol("triangle-down", 0, 0, w, w).on("click", function () { b.scroll(1, k) }).add(p)), b.scroll(0), a = c) : p && (v(), p.hide(), this.scrollGroup.attr({ translateY: 1 }), this.clipHeight = 0); return a
                    }, scroll: function (a, b) {
                        var d = this.pages, f = d.length; a = this.currentPage + a; var m = this.clipHeight, e = this.options.navigation, h = this.pager, n = this.padding; a > f && (a = f); 0 < a && (void 0 !== b && c(b, this.chart), this.nav.attr({ translateX: n, translateY: m + this.padding + 7 + this.titleHeight, visibility: "visible" }), this.up.attr({
                            "class": 1 ===
                                a ? "highcharts-legend-nav-inactive" : "highcharts-legend-nav-active"
                        }), h.attr({ text: a + "/" + f }), this.down.attr({ x: 18 + this.pager.getBBox().width, "class": a === f ? "highcharts-legend-nav-inactive" : "highcharts-legend-nav-active" }), this.up.attr({ fill: 1 === a ? e.inactiveColor : e.activeColor }).css({ cursor: 1 === a ? "default" : "pointer" }), this.down.attr({ fill: a === f ? e.inactiveColor : e.activeColor }).css({ cursor: a === f ? "default" : "pointer" }), b = -d[a - 1] + this.initialItemY, this.scrollGroup.animate({ translateY: b }), this.currentPage =
                            a, this.positionCheckboxes(b))
                    }
                }; a.LegendSymbolMixin = {
                    drawRectangle: function (a, b) { var c = a.options, f = c.symbolHeight || a.fontMetrics.f, c = c.squareSymbol; b.legendSymbol = this.chart.renderer.rect(c ? (a.symbolWidth - f) / 2 : 0, a.baseline - f + 1, c ? f : a.symbolWidth, f, d(a.options.symbolRadius, f / 2)).addClass("highcharts-point").attr({ zIndex: 3 }).add(b.legendGroup) }, drawLineMarker: function (a) {
                        var b = this.options, c = b.marker, d = a.symbolWidth, f = this.chart.renderer, e = this.legendGroup; a = a.baseline - Math.round(.3 * a.fontMetrics.b);
                        var m; m = { "stroke-width": b.lineWidth || 0 }; b.dashStyle && (m.dashstyle = b.dashStyle); this.legendLine = f.path(["M", 0, a, "L", d, a]).addClass("highcharts-graph").attr(m).add(e); c && !1 !== c.enabled && (b = 0 === this.symbol.indexOf("url") ? 0 : c.radius, this.legendSymbol = c = f.symbol(this.symbol, d / 2 - b, a - b, 2 * b, 2 * b, c).addClass("highcharts-point").add(e), c.isMarker = !0)
                    }
                }; (/Trident\/7\.0/.test(y.navigator.userAgent) || v) && t(D.prototype, "positionItem", function (a, b) { var c = this, d = function () { b._legendItemPos && a.call(c, b) }; d(); setTimeout(d) })
        })(L);
        (function (a) {
            var D = a.addEvent, C = a.animate, G = a.animObject, I = a.attr, h = a.doc, f = a.Axis, p = a.createElement, v = a.defaultOptions, l = a.discardElement, u = a.charts, d = a.css, c = a.defined, n = a.each, y = a.extend, t = a.find, m = a.fireEvent, b = a.getStyle, q = a.grep, z = a.isNumber, F = a.isObject, e = a.isString, r = a.Legend, x = a.marginNames, A = a.merge, k = a.Pointer, w = a.pick, K = a.pInt, J = a.removeEvent, N = a.seriesTypes, g = a.splat, B = a.svg, S = a.syncTimeout, M = a.win, R = a.Renderer, E = a.Chart = function () { this.getArgs.apply(this, arguments) }; a.chart = function (a,
                b, c) { return new E(a, b, c) }; E.prototype = {
                    callbacks: [], getArgs: function () { var a = [].slice.call(arguments); if (e(a[0]) || a[0].nodeName) this.renderTo = a.shift(); this.init(a[0], a[1]) }, init: function (b, c) {
                        var k, g = b.series; b.series = null; k = A(v, b); k.series = b.series = g; this.userOptions = b; this.respRules = []; b = k.chart; g = b.events; this.margin = []; this.spacing = []; this.bounds = { h: {}, v: {} }; this.callback = c; this.isResizing = 0; this.options = k; this.axes = []; this.series = []; this.hasCartesianSeries = b.showAxes; var e; this.index = u.length;
                        u.push(this); a.chartCount++; if (g) for (e in g) D(this, e, g[e]); this.xAxis = []; this.yAxis = []; this.pointCount = this.colorCounter = this.symbolCounter = 0; this.firstRender()
                    }, initSeries: function (b) { var c = this.options.chart; (c = N[b.type || c.type || c.defaultSeriesType]) || a.error(17, !0); c = new c; c.init(this, b); return c }, isInsidePlot: function (a, b, c) { var k = c ? b : a; a = c ? a : b; return 0 <= k && k <= this.plotWidth && 0 <= a && a <= this.plotHeight }, redraw: function (b) {
                        var c = this.axes, k = this.series, g = this.pointer, e = this.legend, d = this.isDirtyLegend,
                            f, h, w = this.hasCartesianSeries, r = this.isDirtyBox, l = k.length, q = l, t = this.renderer, p = t.isHidden(), H = []; a.setAnimation(b, this); p && this.cloneRenderTo(); for (this.layOutTitles(); q--;)if (b = k[q], b.options.stacking && (f = !0, b.isDirty)) { h = !0; break } if (h) for (q = l; q--;)b = k[q], b.options.stacking && (b.isDirty = !0); n(k, function (a) { a.isDirty && "point" === a.options.legendType && (a.updateTotals && a.updateTotals(), d = !0); a.isDirtyData && m(a, "updatedData") }); d && e.options.enabled && (e.render(), this.isDirtyLegend = !1); f && this.getStacks();
                        w && n(c, function (a) { a.updateNames(); a.setScale() }); this.getMargins(); w && (n(c, function (a) { a.isDirty && (r = !0) }), n(c, function (a) { var b = a.min + "," + a.max; a.extKey !== b && (a.extKey = b, H.push(function () { m(a, "afterSetExtremes", y(a.eventArgs, a.getExtremes())); delete a.eventArgs })); (r || f) && a.redraw() })); r && this.drawChartBox(); n(k, function (a) { (r || a.isDirty) && a.visible && a.redraw() }); g && g.reset(!0); t.draw(); m(this, "redraw"); p && this.cloneRenderTo(!0); n(H, function (a) { a.call() })
                    }, get: function (a) {
                        function b(b) {
                            return b.id ===
                                a || b.options.id === a
                        } var c, k = this.series, g; c = t(this.axes, b) || t(this.series, b); for (g = 0; !c && g < k.length; g++)c = t(k[g].points || [], b); return c
                    }, getAxes: function () { var a = this, b = this.options, c = b.xAxis = g(b.xAxis || {}), b = b.yAxis = g(b.yAxis || {}); n(c, function (a, b) { a.index = b; a.isX = !0 }); n(b, function (a, b) { a.index = b }); c = c.concat(b); n(c, function (b) { new f(a, b) }) }, getSelectedPoints: function () { var a = []; n(this.series, function (b) { a = a.concat(q(b.points || [], function (a) { return a.selected })) }); return a }, getSelectedSeries: function () {
                        return q(this.series,
                            function (a) { return a.selected })
                    }, setTitle: function (a, b, c) {
                        var k = this, g = k.options, e; e = g.title = A({ style: { color: "#333333", fontSize: g.isStock ? "16px" : "18px" } }, g.title, a); g = g.subtitle = A({ style: { color: "#666666" } }, g.subtitle, b); n([["title", a, e], ["subtitle", b, g]], function (a, b) {
                            var c = a[0], g = k[c], e = a[1]; a = a[2]; g && e && (k[c] = g = g.destroy()); a && a.text && !g && (k[c] = k.renderer.text(a.text, 0, 0, a.useHTML).attr({ align: a.align, "class": "highcharts-" + c, zIndex: a.zIndex || 4 }).add(), k[c].update = function (a) {
                                k.setTitle(!b && a, b &&
                                    a)
                            }, k[c].css(a.style))
                        }); k.layOutTitles(c)
                    }, layOutTitles: function (a) {
                        var b = 0, c, k = this.renderer, g = this.spacingBox; n(["title", "subtitle"], function (a) { var c = this[a], e = this.options[a], d; c && (d = e.style.fontSize, d = k.fontMetrics(d, c).b, c.css({ width: (e.width || g.width + e.widthAdjust) + "px" }).align(y({ y: b + d + ("title" === a ? -3 : 2) }, e), !1, "spacingBox"), e.floating || e.verticalAlign || (b = Math.ceil(b + c.getBBox().height))) }, this); c = this.titleOffset !== b; this.titleOffset = b; !this.isDirtyBox && c && (this.isDirtyBox = c, this.hasRendered &&
                            w(a, !0) && this.isDirtyBox && this.redraw())
                    }, getChartSize: function () { var a = this.options.chart, k = a.width, a = a.height, g = this.renderToClone || this.renderTo; c(k) || (this.containerWidth = b(g, "width")); c(a) || (this.containerHeight = b(g, "height")); this.chartWidth = Math.max(0, k || this.containerWidth || 600); this.chartHeight = Math.max(0, w(a, 19 < this.containerHeight ? this.containerHeight : 400)) }, cloneRenderTo: function (a) {
                        var b = this.renderToClone, c = this.container; if (a) {
                            if (b) {
                                for (; b.childNodes.length;)this.renderTo.appendChild(b.firstChild);
                                l(b); delete this.renderToClone
                            }
                        } else c && c.parentNode === this.renderTo && this.renderTo.removeChild(c), this.renderToClone = b = this.renderTo.cloneNode(0), d(b, { position: "absolute", top: "-9999px", display: "block" }), b.style.setProperty && b.style.setProperty("display", "block", "important"), h.body.appendChild(b), c && b.appendChild(c)
                    }, setClassName: function (a) { this.container.className = "highcharts-container " + (a || "") }, getContainer: function () {
                        var b, c = this.options, k = c.chart, g, d; b = this.renderTo; var f = a.uniqueKey(), m; b ||
                            (this.renderTo = b = k.renderTo); e(b) && (this.renderTo = b = h.getElementById(b)); b || a.error(13, !0); g = K(I(b, "data-highcharts-chart")); z(g) && u[g] && u[g].hasRendered && u[g].destroy(); I(b, "data-highcharts-chart", this.index); b.innerHTML = ""; k.skipClone || b.offsetWidth || this.cloneRenderTo(); this.getChartSize(); g = this.chartWidth; d = this.chartHeight; m = y({ position: "relative", overflow: "hidden", width: g + "px", height: d + "px", textAlign: "left", lineHeight: "normal", zIndex: 0, "-webkit-tap-highlight-color": "rgba(0,0,0,0)" }, k.style);
                        this.container = b = p("div", { id: f }, m, this.renderToClone || b); this._cursor = b.style.cursor; this.renderer = new (a[k.renderer] || R)(b, g, d, null, k.forExport, c.exporting && c.exporting.allowHTML); this.setClassName(k.className); this.renderer.setStyle(k.style); this.renderer.chartIndex = this.index
                    }, getMargins: function (a) {
                        var b = this.spacing, k = this.margin, g = this.titleOffset; this.resetMargins(); g && !c(k[0]) && (this.plotTop = Math.max(this.plotTop, g + this.options.title.margin + b[0])); this.legend.display && this.legend.adjustMargins(k,
                            b); this.extraBottomMargin && (this.marginBottom += this.extraBottomMargin); this.extraTopMargin && (this.plotTop += this.extraTopMargin); a || this.getAxisMargins()
                    }, getAxisMargins: function () { var a = this, b = a.axisOffset = [0, 0, 0, 0], k = a.margin; a.hasCartesianSeries && n(a.axes, function (a) { a.visible && a.getOffset() }); n(x, function (g, e) { c(k[e]) || (a[g] += b[e]) }); a.setChartSize() }, reflow: function (a) {
                        var k = this, g = k.options.chart, e = k.renderTo, d = c(g.width), f = g.width || b(e, "width"), g = g.height || b(e, "height"), e = a ? a.target : M; if (!d &&
                            !k.isPrinting && f && g && (e === M || e === h)) { if (f !== k.containerWidth || g !== k.containerHeight) clearTimeout(k.reflowTimeout), k.reflowTimeout = S(function () { k.container && k.setSize(void 0, void 0, !1) }, a ? 100 : 0); k.containerWidth = f; k.containerHeight = g }
                    }, initReflow: function () { var a = this, b; b = D(M, "resize", function (b) { a.reflow(b) }); D(a, "destroy", b) }, setSize: function (b, c, k) {
                        var g = this, e = g.renderer; g.isResizing += 1; a.setAnimation(k, g); g.oldChartHeight = g.chartHeight; g.oldChartWidth = g.chartWidth; void 0 !== b && (g.options.chart.width =
                            b); void 0 !== c && (g.options.chart.height = c); g.getChartSize(); b = e.globalAnimation; (b ? C : d)(g.container, { width: g.chartWidth + "px", height: g.chartHeight + "px" }, b); g.setChartSize(!0); e.setSize(g.chartWidth, g.chartHeight, k); n(g.axes, function (a) { a.isDirty = !0; a.setScale() }); g.isDirtyLegend = !0; g.isDirtyBox = !0; g.layOutTitles(); g.getMargins(); g.setResponsive && g.setResponsive(!1); g.redraw(k); g.oldChartHeight = null; m(g, "resize"); S(function () { g && m(g, "endResize", null, function () { --g.isResizing }) }, G(b).duration)
                    }, setChartSize: function (a) {
                        var b =
                            this.inverted, c = this.renderer, g = this.chartWidth, k = this.chartHeight, e = this.options.chart, d = this.spacing, f = this.clipOffset, m, h, w, r; this.plotLeft = m = Math.round(this.plotLeft); this.plotTop = h = Math.round(this.plotTop); this.plotWidth = w = Math.max(0, Math.round(g - m - this.marginRight)); this.plotHeight = r = Math.max(0, Math.round(k - h - this.marginBottom)); this.plotSizeX = b ? r : w; this.plotSizeY = b ? w : r; this.plotBorderWidth = e.plotBorderWidth || 0; this.spacingBox = c.spacingBox = { x: d[3], y: d[0], width: g - d[3] - d[1], height: k - d[0] - d[2] };
                        this.plotBox = c.plotBox = { x: m, y: h, width: w, height: r }; g = 2 * Math.floor(this.plotBorderWidth / 2); b = Math.ceil(Math.max(g, f[3]) / 2); c = Math.ceil(Math.max(g, f[0]) / 2); this.clipBox = { x: b, y: c, width: Math.floor(this.plotSizeX - Math.max(g, f[1]) / 2 - b), height: Math.max(0, Math.floor(this.plotSizeY - Math.max(g, f[2]) / 2 - c)) }; a || n(this.axes, function (a) { a.setAxisSize(); a.setAxisTranslation() })
                    }, resetMargins: function () {
                        var a = this, b = a.options.chart; n(["margin", "spacing"], function (c) {
                            var g = b[c], k = F(g) ? g : [g, g, g, g]; n(["Top", "Right",
                                "Bottom", "Left"], function (g, e) { a[c][e] = w(b[c + g], k[e]) })
                        }); n(x, function (b, c) { a[b] = w(a.margin[c], a.spacing[c]) }); a.axisOffset = [0, 0, 0, 0]; a.clipOffset = [0, 0, 0, 0]
                    }, drawChartBox: function () {
                        var a = this.options.chart, b = this.renderer, c = this.chartWidth, g = this.chartHeight, k = this.chartBackground, e = this.plotBackground, d = this.plotBorder, f, m = this.plotBGImage, h = a.backgroundColor, w = a.plotBackgroundColor, n = a.plotBackgroundImage, r, l = this.plotLeft, q = this.plotTop, t = this.plotWidth, p = this.plotHeight, x = this.plotBox, K = this.clipRect,
                            u = this.clipBox, A = "animate"; k || (this.chartBackground = k = b.rect().addClass("highcharts-background").add(), A = "attr"); f = a.borderWidth || 0; r = f + (a.shadow ? 8 : 0); h = { fill: h || "none" }; if (f || k["stroke-width"]) h.stroke = a.borderColor, h["stroke-width"] = f; k.attr(h).shadow(a.shadow); k[A]({ x: r / 2, y: r / 2, width: c - r - f % 2, height: g - r - f % 2, r: a.borderRadius }); A = "animate"; e || (A = "attr", this.plotBackground = e = b.rect().addClass("highcharts-plot-background").add()); e[A](x); e.attr({ fill: w || "none" }).shadow(a.plotShadow); n && (m ? m.animate(x) :
                                this.plotBGImage = b.image(n, l, q, t, p).add()); K ? K.animate({ width: u.width, height: u.height }) : this.clipRect = b.clipRect(u); A = "animate"; d || (A = "attr", this.plotBorder = d = b.rect().addClass("highcharts-plot-border").attr({ zIndex: 1 }).add()); d.attr({ stroke: a.plotBorderColor, "stroke-width": a.plotBorderWidth || 0, fill: "none" }); d[A](d.crisp({ x: l, y: q, width: t, height: p }, -d.strokeWidth())); this.isDirtyBox = !1
                    }, propFromSeries: function () {
                        var a = this, b = a.options.chart, c, g = a.options.series, k, e; n(["inverted", "angular", "polar"],
                            function (d) { c = N[b.type || b.defaultSeriesType]; e = b[d] || c && c.prototype[d]; for (k = g && g.length; !e && k--;)(c = N[g[k].type]) && c.prototype[d] && (e = !0); a[d] = e })
                    }, linkSeries: function () { var a = this, b = a.series; n(b, function (a) { a.linkedSeries.length = 0 }); n(b, function (b) { var c = b.options.linkedTo; e(c) && (c = ":previous" === c ? a.series[b.index - 1] : a.get(c)) && c.linkedParent !== b && (c.linkedSeries.push(b), b.linkedParent = c, b.visible = w(b.options.visible, c.options.visible, b.visible)) }) }, renderSeries: function () {
                        n(this.series, function (a) {
                            a.translate();
                            a.render()
                        })
                    }, renderLabels: function () { var a = this, b = a.options.labels; b.items && n(b.items, function (c) { var g = y(b.style, c.style), k = K(g.left) + a.plotLeft, e = K(g.top) + a.plotTop + 12; delete g.left; delete g.top; a.renderer.text(c.html, k, e).attr({ zIndex: 2 }).css(g).add() }) }, render: function () {
                        var a = this.axes, b = this.renderer, c = this.options, g, k, e; this.setTitle(); this.legend = new r(this, c.legend); this.getStacks && this.getStacks(); this.getMargins(!0); this.setChartSize(); c = this.plotWidth; g = this.plotHeight -= 21; n(a, function (a) { a.setScale() });
                        this.getAxisMargins(); k = 1.1 < c / this.plotWidth; e = 1.05 < g / this.plotHeight; if (k || e) n(a, function (a) { (a.horiz && k || !a.horiz && e) && a.setTickInterval(!0) }), this.getMargins(); this.drawChartBox(); this.hasCartesianSeries && n(a, function (a) { a.visible && a.render() }); this.seriesGroup || (this.seriesGroup = b.g("series-group").attr({ zIndex: 3 }).add()); this.renderSeries(); this.renderLabels(); this.addCredits(); this.setResponsive && this.setResponsive(); this.hasRendered = !0
                    }, addCredits: function (a) {
                        var b = this; a = A(!0, this.options.credits,
                            a); a.enabled && !this.credits && (this.credits = this.renderer.text(a.text + (this.mapCredits || ""), 0, 0).addClass("highcharts-credits").on("click", function () { a.href && (M.location.href = a.href) }).attr({ align: a.position.align, zIndex: 8 }).css(a.style).add().align(a.position), this.credits.update = function (a) { b.credits = b.credits.destroy(); b.addCredits(a) })
                    }, destroy: function () {
                        var b = this, c = b.axes, g = b.series, k = b.container, e, d = k && k.parentNode; m(b, "destroy"); u[b.index] = void 0; a.chartCount--; b.renderTo.removeAttribute("data-highcharts-chart");
                        J(b); for (e = c.length; e--;)c[e] = c[e].destroy(); this.scroller && this.scroller.destroy && this.scroller.destroy(); for (e = g.length; e--;)g[e] = g[e].destroy(); n("title subtitle chartBackground plotBackground plotBGImage plotBorder seriesGroup clipRect credits pointer rangeSelector legend resetZoomButton tooltip renderer".split(" "), function (a) { var c = b[a]; c && c.destroy && (b[a] = c.destroy()) }); k && (k.innerHTML = "", J(k), d && l(k)); for (e in b) delete b[e]
                    }, isReadyToRender: function () {
                        var a = this; return B || M != M.top || "complete" ===
                            h.readyState ? !0 : (h.attachEvent("onreadystatechange", function () { h.detachEvent("onreadystatechange", a.firstRender); "complete" === h.readyState && a.firstRender() }), !1)
                    }, firstRender: function () {
                        var a = this, b = a.options; if (a.isReadyToRender()) {
                            a.getContainer(); m(a, "init"); a.resetMargins(); a.setChartSize(); a.propFromSeries(); a.getAxes(); n(b.series || [], function (b) { a.initSeries(b) }); a.linkSeries(); m(a, "beforeRender"); k && (a.pointer = new k(a, b)); a.render(); a.renderer.draw(); if (!a.renderer.imgCount && a.onload) a.onload();
                            a.cloneRenderTo(!0)
                        }
                    }, onload: function () { n([this.callback].concat(this.callbacks), function (a) { a && void 0 !== this.index && a.apply(this, [this]) }, this); m(this, "load"); c(this.index) && !1 !== this.options.chart.reflow && this.initReflow(); this.onload = null }
                }
        })(L); (function (a) {
            var D, C = a.each, G = a.extend, I = a.erase, h = a.fireEvent, f = a.format, p = a.isArray, v = a.isNumber, l = a.pick, u = a.removeEvent; D = a.Point = function () { }; D.prototype = {
                init: function (a, c, f) {
                    this.series = a; this.color = a.color; this.applyOptions(c, f); a.options.colorByPoint ?
                        (c = a.options.colors || a.chart.options.colors, this.color = this.color || c[a.colorCounter], c = c.length, f = a.colorCounter, a.colorCounter++, a.colorCounter === c && (a.colorCounter = 0)) : f = a.colorIndex; this.colorIndex = l(this.colorIndex, f); a.chart.pointCount++; return this
                }, applyOptions: function (a, c) {
                    var d = this.series, f = d.options.pointValKey || d.pointValKey; a = D.prototype.optionsToObject.call(this, a); G(this, a); this.options = this.options ? G(this.options, a) : a; a.group && delete this.group; f && (this.y = this[f]); this.isNull = l(this.isValid &&
                        !this.isValid(), null === this.x || !v(this.y, !0)); this.selected && (this.state = "select"); "name" in this && void 0 === c && d.xAxis && d.xAxis.hasNames && (this.x = d.xAxis.nameToX(this)); void 0 === this.x && d && (this.x = void 0 === c ? d.autoIncrement(this) : c); return this
                }, optionsToObject: function (a) {
                    var c = {}, d = this.series, f = d.options.keys, h = f || d.pointArrayMap || ["y"], m = h.length, b = 0, l = 0; if (v(a) || null === a) c[h[0]] = a; else if (p(a)) for (!f && a.length > m && (d = typeof a[0], "string" === d ? c.name = a[0] : "number" === d && (c.x = a[0]), b++); l < m;)f && void 0 ===
                        a[b] || (c[h[l]] = a[b]), b++, l++; else "object" === typeof a && (c = a, a.dataLabels && (d._hasPointLabels = !0), a.marker && (d._hasPointMarkers = !0)); return c
                }, getClassName: function () { return "highcharts-point" + (this.selected ? " highcharts-point-select" : "") + (this.negative ? " highcharts-negative" : "") + (this.isNull ? " highcharts-null-point" : "") + (void 0 !== this.colorIndex ? " highcharts-color-" + this.colorIndex : "") + (this.options.className ? " " + this.options.className : "") + (this.zone && this.zone.className ? " " + this.zone.className : "") },
                getZone: function () { var a = this.series, c = a.zones, a = a.zoneAxis || "y", f = 0, h; for (h = c[f]; this[a] >= h.value;)h = c[++f]; h && h.color && !this.options.color && (this.color = h.color); return h }, destroy: function () { var a = this.series.chart, c = a.hoverPoints, f; a.pointCount--; c && (this.setState(), I(c, this), c.length || (a.hoverPoints = null)); if (this === a.hoverPoint) this.onMouseOut(); if (this.graphic || this.dataLabel) u(this), this.destroyElements(); this.legendItem && a.legend.destroyItem(this); for (f in this) this[f] = null }, destroyElements: function () {
                    for (var a =
                        ["graphic", "dataLabel", "dataLabelUpper", "connector", "shadowGroup"], c, f = 6; f--;)c = a[f], this[c] && (this[c] = this[c].destroy())
                }, getLabelConfig: function () { return { x: this.category, y: this.y, color: this.color, key: this.name || this.category, series: this.series, point: this, percentage: this.percentage, total: this.total || this.stackTotal } }, tooltipFormatter: function (a) {
                    var c = this.series, d = c.tooltipOptions, h = l(d.valueDecimals, ""), t = d.valuePrefix || "", m = d.valueSuffix || ""; C(c.pointArrayMap || ["y"], function (b) {
                        b = "{point." + b;
                        if (t || m) a = a.replace(b + "}", t + b + "}" + m); a = a.replace(b + "}", b + ":,." + h + "f}")
                    }); return f(a, { point: this, series: this.series })
                }, firePointEvent: function (a, c, f) { var d = this, n = this.series.options; (n.point.events[a] || d.options && d.options.events && d.options.events[a]) && this.importEvents(); "click" === a && n.allowPointSelect && (f = function (a) { d.select && d.select(null, a.ctrlKey || a.metaKey || a.shiftKey) }); h(this, a, c, f) }, visible: !0
            }
        })(L); (function (a) {
            var D = a.addEvent, C = a.animObject, G = a.arrayMax, I = a.arrayMin, h = a.correctFloat,
                f = a.Date, p = a.defaultOptions, v = a.defaultPlotOptions, l = a.defined, u = a.each, d = a.erase, c = a.extend, n = a.fireEvent, y = a.grep, t = a.isArray, m = a.isNumber, b = a.isString, q = a.merge, z = a.pick, F = a.removeEvent, e = a.splat, r = a.SVGElement, x = a.syncTimeout, A = a.win; a.Series = a.seriesType("line", null, {
                    lineWidth: 2, allowPointSelect: !1, showCheckbox: !1, animation: { duration: 1E3 }, events: {}, marker: {
                        lineWidth: 0, lineColor: "#ffffff", radius: 4, states: {
                            hover: { animation: { duration: 50 }, enabled: !0, radiusPlus: 2, lineWidthPlus: 1 }, select: {
                                fillColor: "#cccccc",
                                lineColor: "#000000", lineWidth: 2
                            }
                        }
                    }, point: { events: {} }, dataLabels: { align: "center", formatter: function () { return null === this.y ? "" : a.numberFormat(this.y, -1) }, style: { fontSize: "11px", fontWeight: "bold", color: "contrast", textOutline: "1px contrast" }, verticalAlign: "bottom", x: 0, y: 0, padding: 5 }, cropThreshold: 300, pointRange: 0, softThreshold: !0, states: { hover: { lineWidthPlus: 1, marker: {}, halo: { size: 10, opacity: .25 } }, select: { marker: {} } }, stickyTracking: !0, turboThreshold: 1E3
                }, {
                    isCartesian: !0, pointClass: a.Point, sorted: !0, requireSorting: !0,
                    directTouch: !1, axisTypes: ["xAxis", "yAxis"], colorCounter: 0, parallelArrays: ["x", "y"], coll: "series", init: function (a, b) {
                        var k = this, e, d, g = a.series, f; k.chart = a; k.options = b = k.setOptions(b); k.linkedSeries = []; k.bindAxes(); c(k, { name: b.name, state: "", visible: !1 !== b.visible, selected: !0 === b.selected }); d = b.events; for (e in d) D(k, e, d[e]); if (d && d.click || b.point && b.point.events && b.point.events.click || b.allowPointSelect) a.runTrackerClick = !0; k.getColor(); k.getSymbol(); u(k.parallelArrays, function (a) { k[a + "Data"] = [] }); k.setData(b.data,
                            !1); k.isCartesian && (a.hasCartesianSeries = !0); g.length && (f = g[g.length - 1]); k._i = z(f && f._i, -1) + 1; for (a = this.insert(g); a < g.length; a++)g[a].index = a, g[a].name = g[a].name || "Series " + (g[a].index + 1)
                    }, insert: function (a) { var b = this.options.index, c; if (m(b)) { for (c = a.length; c--;)if (b >= z(a[c].options.index, a[c]._i)) { a.splice(c + 1, 0, this); break } -1 === c && a.unshift(this); c += 1 } else a.push(this); return z(c, a.length - 1) }, bindAxes: function () {
                        var b = this, c = b.options, e = b.chart, d; u(b.axisTypes || [], function (k) {
                            u(e[k], function (a) {
                                d =
                                    a.options; if (c[k] === d.index || void 0 !== c[k] && c[k] === d.id || void 0 === c[k] && 0 === d.index) b.insert(a.series), b[k] = a, a.isDirty = !0
                            }); b[k] || b.optionalAxis === k || a.error(18, !0)
                        })
                    }, updateParallelArrays: function (a, b) { var c = a.series, k = arguments, e = m(b) ? function (g) { var k = "y" === g && c.toYData ? c.toYData(a) : a[g]; c[g + "Data"][b] = k } : function (a) { Array.prototype[b].apply(c[a + "Data"], Array.prototype.slice.call(k, 2)) }; u(c.parallelArrays, e) }, autoIncrement: function () {
                        var a = this.options, b = this.xIncrement, c, e = a.pointIntervalUnit,
                            b = z(b, a.pointStart, 0); this.pointInterval = c = z(this.pointInterval, a.pointInterval, 1); e && (a = new f(b), "day" === e ? a = +a[f.hcSetDate](a[f.hcGetDate]() + c) : "month" === e ? a = +a[f.hcSetMonth](a[f.hcGetMonth]() + c) : "year" === e && (a = +a[f.hcSetFullYear](a[f.hcGetFullYear]() + c)), c = a - b); this.xIncrement = b + c; return b
                    }, setOptions: function (a) {
                        var b = this.chart, c = b.options.plotOptions, b = b.userOptions || {}, k = b.plotOptions || {}, e = c[this.type]; this.userOptions = a; c = q(e, c.series, a); this.tooltipOptions = q(p.tooltip, p.plotOptions[this.type].tooltip,
                            b.tooltip, k.series && k.series.tooltip, k[this.type] && k[this.type].tooltip, a.tooltip); null === e.marker && delete c.marker; this.zoneAxis = c.zoneAxis; a = this.zones = (c.zones || []).slice(); !c.negativeColor && !c.negativeFillColor || c.zones || a.push({ value: c[this.zoneAxis + "Threshold"] || c.threshold || 0, className: "highcharts-negative", color: c.negativeColor, fillColor: c.negativeFillColor }); a.length && l(a[a.length - 1].value) && a.push({ color: this.color, fillColor: this.fillColor }); return c
                    }, getCyclic: function (a, b, c) {
                        var k, e = this.userOptions,
                            g = a + "Index", d = a + "Counter", f = c ? c.length : z(this.chart.options.chart[a + "Count"], this.chart[a + "Count"]); b || (k = z(e[g], e["_" + g]), l(k) || (e["_" + g] = k = this.chart[d] % f, this.chart[d] += 1), c && (b = c[k])); void 0 !== k && (this[g] = k); this[a] = b
                    }, getColor: function () { this.options.colorByPoint ? this.options.color = null : this.getCyclic("color", this.options.color || v[this.type].color, this.chart.options.colors) }, getSymbol: function () { this.getCyclic("symbol", this.options.marker.symbol, this.chart.options.symbols) }, drawLegendSymbol: a.LegendSymbolMixin.drawLineMarker,
                    setData: function (c, e, d, f) {
                        var k = this, g = k.points, h = g && g.length || 0, n, r = k.options, w = k.chart, l = null, q = k.xAxis, p = r.turboThreshold, x = this.xData, A = this.yData, F = (n = k.pointArrayMap) && n.length; c = c || []; n = c.length; e = z(e, !0); if (!1 !== f && n && h === n && !k.cropped && !k.hasGroupedData && k.visible) u(c, function (a, b) { g[b].update && a !== r.data[b] && g[b].update(a, !1, null, !1) }); else {
                            k.xIncrement = null; k.colorCounter = 0; u(this.parallelArrays, function (a) { k[a + "Data"].length = 0 }); if (p && n > p) {
                                for (d = 0; null === l && d < n;)l = c[d], d++; if (m(l)) for (d =
                                    0; d < n; d++)x[d] = this.autoIncrement(), A[d] = c[d]; else if (t(l)) if (F) for (d = 0; d < n; d++)l = c[d], x[d] = l[0], A[d] = l.slice(1, F + 1); else for (d = 0; d < n; d++)l = c[d], x[d] = l[0], A[d] = l[1]; else a.error(12)
                            } else for (d = 0; d < n; d++)void 0 !== c[d] && (l = { series: k }, k.pointClass.prototype.applyOptions.apply(l, [c[d]]), k.updateParallelArrays(l, d)); b(A[0]) && a.error(14, !0); k.data = []; k.options.data = k.userOptions.data = c; for (d = h; d--;)g[d] && g[d].destroy && g[d].destroy(); q && (q.minRange = q.userMinRange); k.isDirty = w.isDirtyBox = !0; k.isDirtyData =
                                !!g; d = !1
                        } "point" === r.legendType && (this.processData(), this.generatePoints()); e && w.redraw(d)
                    }, processData: function (b) {
                        var c = this.xData, k = this.yData, e = c.length, d; d = 0; var g, f, m = this.xAxis, h, n = this.options; h = n.cropThreshold; var l = this.getExtremesFromAll || n.getExtremesFromAll, r = this.isCartesian, n = m && m.val2lin, q = m && m.isLog, t, p; if (r && !this.isDirty && !m.isDirty && !this.yAxis.isDirty && !b) return !1; m && (b = m.getExtremes(), t = b.min, p = b.max); if (r && this.sorted && !l && (!h || e > h || this.forceCrop)) if (c[e - 1] < t || c[0] > p) c = [],
                            k = []; else if (c[0] < t || c[e - 1] > p) d = this.cropData(this.xData, this.yData, t, p), c = d.xData, k = d.yData, d = d.start, g = !0; for (h = c.length || 1; --h;)e = q ? n(c[h]) - n(c[h - 1]) : c[h] - c[h - 1], 0 < e && (void 0 === f || e < f) ? f = e : 0 > e && this.requireSorting && a.error(15); this.cropped = g; this.cropStart = d; this.processedXData = c; this.processedYData = k; this.closestPointRange = f
                    }, cropData: function (a, b, c, e) {
                        var k = a.length, g = 0, d = k, f = z(this.cropShoulder, 1), h; for (h = 0; h < k; h++)if (a[h] >= c) { g = Math.max(0, h - f); break } for (c = h; c < k; c++)if (a[c] > e) { d = c + f; break } return {
                            xData: a.slice(g,
                                d), yData: b.slice(g, d), start: g, end: d
                        }
                    }, generatePoints: function () {
                        var a = this.options.data, b = this.data, c, d = this.processedXData, f = this.processedYData, g = this.pointClass, h = d.length, m = this.cropStart || 0, n, r = this.hasGroupedData, l, q = [], t; b || r || (b = [], b.length = a.length, b = this.data = b); for (t = 0; t < h; t++)n = m + t, r ? (l = (new g).init(this, [d[t]].concat(e(f[t]))), l.dataGroup = this.groupMap[t]) : (l = b[n]) || void 0 === a[n] || (b[n] = l = (new g).init(this, a[n], d[t])), l.index = n, q[t] = l; if (b && (h !== (c = b.length) || r)) for (t = 0; t < c; t++)t !== m ||
                            r || (t += h), b[t] && (b[t].destroyElements(), b[t].plotX = void 0); this.data = b; this.points = q
                    }, getExtremes: function (a) {
                        var b = this.yAxis, c = this.processedXData, e, k = [], g = 0; e = this.xAxis.getExtremes(); var d = e.min, f = e.max, h, n, l, r; a = a || this.stackedYData || this.processedYData || []; e = a.length; for (r = 0; r < e; r++)if (n = c[r], l = a[r], h = (m(l, !0) || t(l)) && (!b.isLog || l.length || 0 < l), n = this.getExtremesFromAll || this.options.getExtremesFromAll || this.cropped || (c[r + 1] || n) >= d && (c[r - 1] || n) <= f, h && n) if (h = l.length) for (; h--;)null !== l[h] && (k[g++] =
                            l[h]); else k[g++] = l; this.dataMin = I(k); this.dataMax = G(k)
                    }, translate: function () {
                        this.processedXData || this.processData(); this.generatePoints(); var a = this.options, b = a.stacking, c = this.xAxis, e = c.categories, d = this.yAxis, g = this.points, f = g.length, n = !!this.modifyValue, r = a.pointPlacement, t = "between" === r || m(r), q = a.threshold, p = a.startFromThreshold ? q : 0, x, u, A, F, v = Number.MAX_VALUE; "between" === r && (r = .5); m(r) && (r *= z(a.pointRange || c.pointRange)); for (a = 0; a < f; a++) {
                            var y = g[a], C = y.x, D = y.y; u = y.low; var G = b && d.stacks[(this.negStacks &&
                                D < (p ? 0 : q) ? "-" : "") + this.stackKey], I; d.isLog && null !== D && 0 >= D && (y.isNull = !0); y.plotX = x = h(Math.min(Math.max(-1E5, c.translate(C, 0, 0, 0, 1, r, "flags" === this.type)), 1E5)); b && this.visible && !y.isNull && G && G[C] && (F = this.getStackIndicator(F, C, this.index), I = G[C], D = I.points[F.key], u = D[0], D = D[1], u === p && F.key === G[C].base && (u = z(q, d.min)), d.isLog && 0 >= u && (u = null), y.total = y.stackTotal = I.total, y.percentage = I.total && y.y / I.total * 100, y.stackY = D, I.setOffset(this.pointXOffset || 0, this.barW || 0)); y.yBottom = l(u) ? d.translate(u, 0,
                                    1, 0, 1) : null; n && (D = this.modifyValue(D, y)); y.plotY = u = "number" === typeof D && Infinity !== D ? Math.min(Math.max(-1E5, d.translate(D, 0, 1, 0, 1)), 1E5) : void 0; y.isInside = void 0 !== u && 0 <= u && u <= d.len && 0 <= x && x <= c.len; y.clientX = t ? h(c.translate(C, 0, 0, 0, 1, r)) : x; y.negative = y.y < (q || 0); y.category = e && void 0 !== e[y.x] ? e[y.x] : y.x; y.isNull || (void 0 !== A && (v = Math.min(v, Math.abs(x - A))), A = x); y.zone = this.zones.length && y.getZone()
                        } this.closestPointRangePx = v
                    }, getValidPoints: function (a, b) {
                        var c = this.chart; return y(a || this.points || [],
                            function (a) { return b && !c.isInsidePlot(a.plotX, a.plotY, c.inverted) ? !1 : !a.isNull })
                    }, setClip: function (a) {
                        var b = this.chart, c = this.options, e = b.renderer, k = b.inverted, g = this.clipBox, d = g || b.clipBox, f = this.sharedClipKey || ["_sharedClip", a && a.duration, a && a.easing, d.height, c.xAxis, c.yAxis].join(), h = b[f], m = b[f + "m"]; h || (a && (d.width = 0, b[f + "m"] = m = e.clipRect(-99, k ? -b.plotLeft : -b.plotTop, 99, k ? b.chartWidth : b.chartHeight)), b[f] = h = e.clipRect(d), h.count = { length: 0 }); a && !h.count[this.index] && (h.count[this.index] = !0, h.count.length +=
                            1); !1 !== c.clip && (this.group.clip(a || g ? h : b.clipRect), this.markerGroup.clip(m), this.sharedClipKey = f); a || (h.count[this.index] && (delete h.count[this.index], --h.count.length), 0 === h.count.length && f && b[f] && (g || (b[f] = b[f].destroy()), b[f + "m"] && (b[f + "m"] = b[f + "m"].destroy())))
                    }, animate: function (a) { var b = this.chart, c = C(this.options.animation), e; a ? this.setClip(c) : (e = this.sharedClipKey, (a = b[e]) && a.animate({ width: b.plotSizeX }, c), b[e + "m"] && b[e + "m"].animate({ width: b.plotSizeX + 99 }, c), this.animate = null) }, afterAnimate: function () {
                        this.setClip();
                        n(this, "afterAnimate")
                    }, drawPoints: function () {
                        var a = this.points, b = this.chart, c, e, d, g, f = this.options.marker, h, n, r, l, t = this.markerGroup, q = z(f.enabled, this.xAxis.isRadial ? !0 : null, this.closestPointRangePx > 2 * f.radius); if (!1 !== f.enabled || this._hasPointMarkers) for (e = a.length; e--;)d = a[e], c = d.plotY, g = d.graphic, h = d.marker || {}, n = !!d.marker, r = q && void 0 === h.enabled || h.enabled, l = d.isInside, r && m(c) && null !== d.y ? (c = z(h.symbol, this.symbol), d.hasImage = 0 === c.indexOf("url"), r = this.markerAttribs(d, d.selected && "select"),
                            g ? g[l ? "show" : "hide"](!0).animate(r) : l && (0 < r.width || d.hasImage) && (d.graphic = g = b.renderer.symbol(c, r.x, r.y, r.width, r.height, n ? h : f).add(t)), g && g.attr(this.pointAttribs(d, d.selected && "select")), g && g.addClass(d.getClassName(), !0)) : g && (d.graphic = g.destroy())
                    }, markerAttribs: function (a, b) {
                        var c = this.options.marker, e = a && a.options, k = e && e.marker || {}, e = z(k.radius, c.radius); b && (c = c.states[b], b = k.states && k.states[b], e = z(b && b.radius, c && c.radius, e + (c && c.radiusPlus || 0))); a.hasImage && (e = 0); a = {
                            x: Math.floor(a.plotX) -
                                e, y: a.plotY - e
                        }; e && (a.width = a.height = 2 * e); return a
                    }, pointAttribs: function (a, b) {
                        var c = this.options.marker, e = a && a.options, k = e && e.marker || {}, g = this.color, d = e && e.color, f = a && a.color, e = z(k.lineWidth, c.lineWidth); a = a && a.zone && a.zone.color; g = d || a || f || g; a = k.fillColor || c.fillColor || g; g = k.lineColor || c.lineColor || g; b && (c = c.states[b], b = k.states && k.states[b] || {}, e = z(b.lineWidth, c.lineWidth, e + z(b.lineWidthPlus, c.lineWidthPlus, 0)), a = b.fillColor || c.fillColor || a, g = b.lineColor || c.lineColor || g); return {
                            stroke: g, "stroke-width": e,
                            fill: a
                        }
                    }, destroy: function () {
                        var a = this, b = a.chart, c = /AppleWebKit\/533/.test(A.navigator.userAgent), e, f = a.data || [], g, h, m; n(a, "destroy"); F(a); u(a.axisTypes || [], function (b) { (m = a[b]) && m.series && (d(m.series, a), m.isDirty = m.forceRedraw = !0) }); a.legendItem && a.chart.legend.destroyItem(a); for (e = f.length; e--;)(g = f[e]) && g.destroy && g.destroy(); a.points = null; clearTimeout(a.animationTimeout); for (h in a) a[h] instanceof r && !a[h].survive && (e = c && "group" === h ? "hide" : "destroy", a[h][e]()); b.hoverSeries === a && (b.hoverSeries =
                            null); d(b.series, a); for (h in a) delete a[h]
                    }, getGraphPath: function (a, b, c) {
                        var e = this, k = e.options, g = k.step, d, f = [], h = [], m; a = a || e.points; (d = a.reversed) && a.reverse(); (g = { right: 1, center: 2 }[g] || g && 3) && d && (g = 4 - g); !k.connectNulls || b || c || (a = this.getValidPoints(a)); u(a, function (d, n) {
                            var r = d.plotX, t = d.plotY, q = a[n - 1]; (d.leftCliff || q && q.rightCliff) && !c && (m = !0); d.isNull && !l(b) && 0 < n ? m = !k.connectNulls : d.isNull && !b ? m = !0 : (0 === n || m ? n = ["M", d.plotX, d.plotY] : e.getPointSpline ? n = e.getPointSpline(a, d, n) : g ? (n = 1 === g ? ["L", q.plotX,
                                t] : 2 === g ? ["L", (q.plotX + r) / 2, q.plotY, "L", (q.plotX + r) / 2, t] : ["L", r, q.plotY], n.push("L", r, t)) : n = ["L", r, t], h.push(d.x), g && h.push(d.x), f.push.apply(f, n), m = !1)
                        }); f.xMap = h; return e.graphPath = f
                    }, drawGraph: function () {
                        var a = this, b = this.options, c = (this.gappedPath || this.getGraphPath).call(this), e = [["graph", "highcharts-graph", b.lineColor || this.color, b.dashStyle]]; u(this.zones, function (c, g) { e.push(["zone-graph-" + g, "highcharts-graph highcharts-zone-graph-" + g + " " + (c.className || ""), c.color || a.color, c.dashStyle || b.dashStyle]) });
                        u(e, function (e, g) { var k = e[0], d = a[k]; d ? (d.endX = c.xMap, d.animate({ d: c })) : c.length && (a[k] = a.chart.renderer.path(c).addClass(e[1]).attr({ zIndex: 1 }).add(a.group), d = { stroke: e[2], "stroke-width": b.lineWidth, fill: a.fillGraph && a.color || "none" }, e[3] ? d.dashstyle = e[3] : "square" !== b.linecap && (d["stroke-linecap"] = d["stroke-linejoin"] = "round"), d = a[k].attr(d).shadow(2 > g && b.shadow)); d && (d.startX = c.xMap, d.isArea = c.isArea) })
                    }, applyZones: function () {
                        var a = this, b = this.chart, c = b.renderer, e = this.zones, d, g, f = this.clips || [],
                            h, m = this.graph, n = this.area, r = Math.max(b.chartWidth, b.chartHeight), l = this[(this.zoneAxis || "y") + "Axis"], q, t, p = b.inverted, x, A, F, y, v = !1; e.length && (m || n) && l && void 0 !== l.min && (t = l.reversed, x = l.horiz, m && m.hide(), n && n.hide(), q = l.getExtremes(), u(e, function (e, k) {
                                d = t ? x ? b.plotWidth : 0 : x ? 0 : l.toPixels(q.min); d = Math.min(Math.max(z(g, d), 0), r); g = Math.min(Math.max(Math.round(l.toPixels(z(e.value, q.max), !0)), 0), r); v && (d = g = l.toPixels(q.max)); A = Math.abs(d - g); F = Math.min(d, g); y = Math.max(d, g); l.isXAxis ? (h = {
                                    x: p ? y : F, y: 0, width: A,
                                    height: r
                                }, x || (h.x = b.plotHeight - h.x)) : (h = { x: 0, y: p ? y : F, width: r, height: A }, x && (h.y = b.plotWidth - h.y)); p && c.isVML && (h = l.isXAxis ? { x: 0, y: t ? F : y, height: h.width, width: b.chartWidth } : { x: h.y - b.plotLeft - b.spacingBox.x, y: 0, width: h.height, height: b.chartHeight }); f[k] ? f[k].animate(h) : (f[k] = c.clipRect(h), m && a["zone-graph-" + k].clip(f[k]), n && a["zone-area-" + k].clip(f[k])); v = e.value > q.max
                            }), this.clips = f)
                    }, invertGroups: function (a) {
                        function b() {
                            var b = { width: c.yAxis.len, height: c.xAxis.len }; u(["group", "markerGroup"], function (e) {
                                c[e] &&
                                    c[e].attr(b).invert(a)
                            })
                        } var c = this, e; c.xAxis && (e = D(c.chart, "resize", b), D(c, "destroy", e), b(a), c.invertGroups = b)
                    }, plotGroup: function (a, b, c, e, d) { var g = this[a], k = !g; k && (this[a] = g = this.chart.renderer.g(b).attr({ zIndex: e || .1 }).add(d), g.addClass("highcharts-series-" + this.index + " highcharts-" + this.type + "-series highcharts-color-" + this.colorIndex + " " + (this.options.className || ""))); g.attr({ visibility: c })[k ? "attr" : "animate"](this.getPlotBox()); return g }, getPlotBox: function () {
                        var a = this.chart, b = this.xAxis, c =
                            this.yAxis; a.inverted && (b = c, c = this.xAxis); return { translateX: b ? b.left : a.plotLeft, translateY: c ? c.top : a.plotTop, scaleX: 1, scaleY: 1 }
                    }, render: function () {
                        var a = this, b = a.chart, c, e = a.options, d = !!a.animate && b.renderer.isSVG && C(e.animation).duration, g = a.visible ? "inherit" : "hidden", f = e.zIndex, h = a.hasRendered, m = b.seriesGroup, n = b.inverted; c = a.plotGroup("group", "series", g, f, m); a.markerGroup = a.plotGroup("markerGroup", "markers", g, f, m); d && a.animate(!0); c.inverted = a.isCartesian ? n : !1; a.drawGraph && (a.drawGraph(), a.applyZones());
                        a.drawDataLabels && a.drawDataLabels(); a.visible && a.drawPoints(); a.drawTracker && !1 !== a.options.enableMouseTracking && a.drawTracker(); a.invertGroups(n); !1 === e.clip || a.sharedClipKey || h || c.clip(b.clipRect); d && a.animate(); h || (a.animationTimeout = x(function () { a.afterAnimate() }, d)); a.isDirty = a.isDirtyData = !1; a.hasRendered = !0
                    }, redraw: function () {
                        var a = this.chart, b = this.isDirty || this.isDirtyData, c = this.group, e = this.xAxis, d = this.yAxis; c && (a.inverted && c.attr({ width: a.plotWidth, height: a.plotHeight }), c.animate({
                            translateX: z(e &&
                                e.left, a.plotLeft), translateY: z(d && d.top, a.plotTop)
                        })); this.translate(); this.render(); b && delete this.kdTree
                    }, kdDimensions: 1, kdAxisArray: ["clientX", "plotY"], searchPoint: function (a, b) { var c = this.xAxis, e = this.yAxis, d = this.chart.inverted; return this.searchKDTree({ clientX: d ? c.len - a.chartY + c.pos : a.chartX - c.pos, plotY: d ? e.len - a.chartX + e.pos : a.chartY - e.pos }, b) }, buildKDTree: function () {
                        function a(c, e, g) {
                            var d, k; if (k = c && c.length) return d = b.kdAxisArray[e % g], c.sort(function (a, b) { return a[d] - b[d] }), k = Math.floor(k /
                                2), { point: c[k], left: a(c.slice(0, k), e + 1, g), right: a(c.slice(k + 1), e + 1, g) }
                        } var b = this, c = b.kdDimensions; delete b.kdTree; x(function () { b.kdTree = a(b.getValidPoints(null, !b.directTouch), c, c) }, b.options.kdNow ? 0 : 1)
                    }, searchKDTree: function (a, b) {
                        function c(a, b, f, h) {
                            var m = b.point, n = e.kdAxisArray[f % h], r, q, t = m; q = l(a[d]) && l(m[d]) ? Math.pow(a[d] - m[d], 2) : null; r = l(a[g]) && l(m[g]) ? Math.pow(a[g] - m[g], 2) : null; r = (q || 0) + (r || 0); m.dist = l(r) ? Math.sqrt(r) : Number.MAX_VALUE; m.distX = l(q) ? Math.sqrt(q) : Number.MAX_VALUE; n = a[n] - m[n]; r =
                                0 > n ? "left" : "right"; q = 0 > n ? "right" : "left"; b[r] && (r = c(a, b[r], f + 1, h), t = r[k] < t[k] ? r : m); b[q] && Math.sqrt(n * n) < t[k] && (a = c(a, b[q], f + 1, h), t = a[k] < t[k] ? a : t); return t
                        } var e = this, d = this.kdAxisArray[0], g = this.kdAxisArray[1], k = b ? "distX" : "dist"; this.kdTree || this.buildKDTree(); if (this.kdTree) return c(a, this.kdTree, this.kdDimensions, this.kdDimensions)
                    }
                })
        })(L); (function (a) {
            function D(a, d, c, f, h) {
                var n = a.chart.inverted; this.axis = a; this.isNegative = c; this.options = d; this.x = f; this.total = null; this.points = {}; this.stack = h; this.rightCliff =
                    this.leftCliff = 0; this.alignOptions = { align: d.align || (n ? c ? "left" : "right" : "center"), verticalAlign: d.verticalAlign || (n ? "middle" : c ? "bottom" : "top"), y: l(d.y, n ? 4 : c ? 14 : -6), x: l(d.x, n ? c ? -6 : 6 : 0) }; this.textAlign = d.textAlign || (n ? c ? "right" : "left" : "center")
            } var C = a.Axis, G = a.Chart, I = a.correctFloat, h = a.defined, f = a.destroyObjectProperties, p = a.each, v = a.format, l = a.pick; a = a.Series; D.prototype = {
                destroy: function () { f(this, this.axis) }, render: function (a) {
                    var d = this.options, c = d.format, c = c ? v(c, this) : d.formatter.call(this); this.label ?
                        this.label.attr({ text: c, visibility: "hidden" }) : this.label = this.axis.chart.renderer.text(c, null, null, d.useHTML).css(d.style).attr({ align: this.textAlign, rotation: d.rotation, visibility: "hidden" }).add(a)
                }, setOffset: function (a, d) {
                    var c = this.axis, f = c.chart, h = f.inverted, l = c.reversed, l = this.isNegative && !l || !this.isNegative && l, m = c.translate(c.usePercentage ? 100 : this.total, 0, 0, 0, 1), c = c.translate(0), c = Math.abs(m - c); a = f.xAxis[0].translate(this.x) + a; var b = f.plotHeight, h = {
                        x: h ? l ? m : m - c : a, y: h ? b - a - d : l ? b - m - c : b - m, width: h ?
                            c : d, height: h ? d : c
                    }; if (d = this.label) d.align(this.alignOptions, null, h), h = d.alignAttr, d[!1 === this.options.crop || f.isInsidePlot(h.x, h.y) ? "show" : "hide"](!0)
                }
            }; G.prototype.getStacks = function () { var a = this; p(a.yAxis, function (a) { a.stacks && a.hasVisibleSeries && (a.oldStacks = a.stacks) }); p(a.series, function (d) { !d.options.stacking || !0 !== d.visible && !1 !== a.options.chart.ignoreHiddenSeries || (d.stackKey = d.type + l(d.options.stack, "")) }) }; C.prototype.buildStacks = function () {
                var a = this.series, d, c = l(this.options.reversedStacks,
                    !0), f = a.length, h; if (!this.isXAxis) { this.usePercentage = !1; for (h = f; h--;)a[c ? h : f - h - 1].setStackedPoints(); for (h = f; h--;)d = a[c ? h : f - h - 1], d.setStackCliffs && d.setStackCliffs(); if (this.usePercentage) for (h = 0; h < f; h++)a[h].setPercentStacks() }
            }; C.prototype.renderStackTotals = function () { var a = this.chart, d = a.renderer, c = this.stacks, f, h, l = this.stackTotalGroup; l || (this.stackTotalGroup = l = d.g("stack-labels").attr({ visibility: "visible", zIndex: 6 }).add()); l.translate(a.plotLeft, a.plotTop); for (f in c) for (h in a = c[f], a) a[h].render(l) };
            C.prototype.resetStacks = function () { var a = this.stacks, d, c; if (!this.isXAxis) for (d in a) for (c in a[d]) a[d][c].touched < this.stacksTouched ? (a[d][c].destroy(), delete a[d][c]) : (a[d][c].total = null, a[d][c].cum = null) }; C.prototype.cleanStacks = function () { var a, d, c; if (!this.isXAxis) for (d in this.oldStacks && (a = this.stacks = this.oldStacks), a) for (c in a[d]) a[d][c].cum = a[d][c].total }; a.prototype.setStackedPoints = function () {
                if (this.options.stacking && (!0 === this.visible || !1 === this.chart.options.chart.ignoreHiddenSeries)) {
                    var a =
                        this.processedXData, d = this.processedYData, c = [], f = d.length, p = this.options, t = p.threshold, m = p.startFromThreshold ? t : 0, b = p.stack, p = p.stacking, q = this.stackKey, v = "-" + q, F = this.negStacks, e = this.yAxis, r = e.stacks, x = e.oldStacks, A, k, w, C, J, G, g; e.stacksTouched += 1; for (J = 0; J < f; J++)G = a[J], g = d[J], A = this.getStackIndicator(A, G, this.index), C = A.key, w = (k = F && g < (m ? 0 : t)) ? v : q, r[w] || (r[w] = {}), r[w][G] || (x[w] && x[w][G] ? (r[w][G] = x[w][G], r[w][G].total = null) : r[w][G] = new D(e, e.options.stackLabels, k, G, b)), w = r[w][G], null !== g && (w.points[C] =
                            w.points[this.index] = [l(w.cum, m)], h(w.cum) || (w.base = C), w.touched = e.stacksTouched, 0 < A.index && !1 === this.singleStacks && (w.points[C][0] = w.points[this.index + "," + G + ",0"][0])), "percent" === p ? (k = k ? q : v, F && r[k] && r[k][G] ? (k = r[k][G], w.total = k.total = Math.max(k.total, w.total) + Math.abs(g) || 0) : w.total = I(w.total + (Math.abs(g) || 0))) : w.total = I(w.total + (g || 0)), w.cum = l(w.cum, m) + (g || 0), null !== g && (w.points[C].push(w.cum), c[J] = w.cum); "percent" === p && (e.usePercentage = !0); this.stackedYData = c; e.oldStacks = {}
                }
            }; a.prototype.setPercentStacks =
                function () { var a = this, d = a.stackKey, c = a.yAxis.stacks, f = a.processedXData, h; p([d, "-" + d], function (d) { for (var m = f.length, b, n; m--;)if (b = f[m], h = a.getStackIndicator(h, b, a.index, d), b = (n = c[d] && c[d][b]) && n.points[h.key]) n = n.total ? 100 / n.total : 0, b[0] = I(b[0] * n), b[1] = I(b[1] * n), a.stackedYData[m] = b[1] }) }; a.prototype.getStackIndicator = function (a, d, c, f) { !h(a) || a.x !== d || f && a.key !== f ? a = { x: d, index: 0, key: f } : a.index++; a.key = [c, d, a.index].join(); return a }
        })(L); (function (a) {
            var D = a.addEvent, C = a.animate, G = a.Axis, I = a.createElement,
                h = a.css, f = a.defined, p = a.each, v = a.erase, l = a.extend, u = a.fireEvent, d = a.inArray, c = a.isNumber, n = a.isObject, y = a.merge, t = a.pick, m = a.Point, b = a.Series, q = a.seriesTypes, z = a.setAnimation, F = a.splat; l(a.Chart.prototype, {
                    addSeries: function (a, b, c) { var e, d = this; a && (b = t(b, !0), u(d, "addSeries", { options: a }, function () { e = d.initSeries(a); d.isDirtyLegend = !0; d.linkSeries(); b && d.redraw(c) })); return e }, addAxis: function (a, b, c, d) {
                        var e = b ? "xAxis" : "yAxis", f = this.options; a = y(a, { index: this[e].length, isX: b }); new G(this, a); f[e] = F(f[e] ||
                            {}); f[e].push(a); t(c, !0) && this.redraw(d)
                    }, showLoading: function (a) {
                        var b = this, c = b.options, e = b.loadingDiv, d = c.loading, f = function () { e && h(e, { left: b.plotLeft + "px", top: b.plotTop + "px", width: b.plotWidth + "px", height: b.plotHeight + "px" }) }; e || (b.loadingDiv = e = I("div", { className: "highcharts-loading highcharts-loading-hidden" }, null, b.container), b.loadingSpan = I("span", { className: "highcharts-loading-inner" }, null, e), D(b, "redraw", f)); e.className = "highcharts-loading"; b.loadingSpan.innerHTML = a || c.lang.loading; h(e, l(d.style,
                            { zIndex: 10 })); h(b.loadingSpan, d.labelStyle); b.loadingShown || (h(e, { opacity: 0, display: "" }), C(e, { opacity: d.style.opacity || .5 }, { duration: d.showDuration || 0 })); b.loadingShown = !0; f()
                    }, hideLoading: function () { var a = this.options, b = this.loadingDiv; b && (b.className = "highcharts-loading highcharts-loading-hidden", C(b, { opacity: 0 }, { duration: a.loading.hideDuration || 100, complete: function () { h(b, { display: "none" }) } })); this.loadingShown = !1 }, propsRequireDirtyBox: "backgroundColor borderColor borderWidth margin marginTop marginRight marginBottom marginLeft spacing spacingTop spacingRight spacingBottom spacingLeft borderRadius plotBackgroundColor plotBackgroundImage plotBorderColor plotBorderWidth plotShadow shadow".split(" "),
                    propsRequireUpdateSeries: "chart.inverted chart.polar chart.ignoreHiddenSeries chart.type colors plotOptions".split(" "), update: function (a, b) {
                        var e, h = { credits: "addCredits", title: "setTitle", subtitle: "setSubtitle" }, k = a.chart, m, n; if (k) {
                            y(!0, this.options.chart, k); "className" in k && this.setClassName(k.className); if ("inverted" in k || "polar" in k) this.propFromSeries(), m = !0; for (e in k) k.hasOwnProperty(e) && (-1 !== d("chart." + e, this.propsRequireUpdateSeries) && (n = !0), -1 !== d(e, this.propsRequireDirtyBox) && (this.isDirtyBox =
                                !0)); "style" in k && this.renderer.setStyle(k.style)
                        } for (e in a) { if (this[e] && "function" === typeof this[e].update) this[e].update(a[e], !1); else if ("function" === typeof this[h[e]]) this[h[e]](a[e]); "chart" !== e && -1 !== d(e, this.propsRequireUpdateSeries) && (n = !0) } a.colors && (this.options.colors = a.colors); a.plotOptions && y(!0, this.options.plotOptions, a.plotOptions); p(["xAxis", "yAxis", "series"], function (b) { a[b] && p(F(a[b]), function (a) { var c = f(a.id) && this.get(a.id) || this[b][0]; c && c.coll === b && c.update(a, !1) }, this) }, this);
                        m && p(this.axes, function (a) { a.update({}, !1) }); n && p(this.series, function (a) { a.update({}, !1) }); a.loading && y(!0, this.options.loading, a.loading); e = k && k.width; k = k && k.height; c(e) && e !== this.chartWidth || c(k) && k !== this.chartHeight ? this.setSize(e, k) : t(b, !0) && this.redraw()
                    }, setSubtitle: function (a) { this.setTitle(void 0, a) }
                }); l(m.prototype, {
                    update: function (a, b, c, d) {
                        function e() {
                            f.applyOptions(a); null === f.y && m && (f.graphic = m.destroy()); n(a, !0) && (m && m.element && a && a.marker && a.marker.symbol && (f.graphic = m.destroy()),
                                a && a.dataLabels && f.dataLabel && (f.dataLabel = f.dataLabel.destroy())); l = f.index; h.updateParallelArrays(f, l); r.data[l] = n(r.data[l], !0) ? f.options : a; h.isDirty = h.isDirtyData = !0; !h.fixedBox && h.hasCartesianSeries && (g.isDirtyBox = !0); "point" === r.legendType && (g.isDirtyLegend = !0); b && g.redraw(c)
                        } var f = this, h = f.series, m = f.graphic, l, g = h.chart, r = h.options; b = t(b, !0); !1 === d ? e() : f.firePointEvent("update", { options: a }, e)
                    }, remove: function (a, b) { this.series.removePoint(d(this, this.series.data), a, b) }
                }); l(b.prototype, {
                    addPoint: function (a,
                        b, c, d) {
                        var e = this.options, f = this.data, h = this.chart, m = this.xAxis && this.xAxis.names, n = e.data, g, l, r = this.xData, q, p; b = t(b, !0); g = { series: this }; this.pointClass.prototype.applyOptions.apply(g, [a]); p = g.x; q = r.length; if (this.requireSorting && p < r[q - 1]) for (l = !0; q && r[q - 1] > p;)q--; this.updateParallelArrays(g, "splice", q, 0, 0); this.updateParallelArrays(g, q); m && g.name && (m[p] = g.name); n.splice(q, 0, a); l && (this.data.splice(q, 0, null), this.processData()); "point" === e.legendType && this.generatePoints(); c && (f[0] && f[0].remove ?
                            f[0].remove(!1) : (f.shift(), this.updateParallelArrays(g, "shift"), n.shift())); this.isDirtyData = this.isDirty = !0; b && h.redraw(d)
                    }, removePoint: function (a, b, c) { var e = this, d = e.data, f = d[a], h = e.points, m = e.chart, n = function () { h && h.length === d.length && h.splice(a, 1); d.splice(a, 1); e.options.data.splice(a, 1); e.updateParallelArrays(f || { series: e }, "splice", a, 1); f && f.destroy(); e.isDirty = !0; e.isDirtyData = !0; b && m.redraw() }; z(c, m); b = t(b, !0); f ? f.firePointEvent("remove", null, n) : n() }, remove: function (a, b, c) {
                        function e() {
                            d.destroy();
                            f.isDirtyLegend = f.isDirtyBox = !0; f.linkSeries(); t(a, !0) && f.redraw(b)
                        } var d = this, f = d.chart; !1 !== c ? u(d, "remove", null, e) : e()
                    }, update: function (a, b) {
                        var c = this, e = this.chart, d = this.userOptions, f = this.type, h = a.type || d.type || e.options.chart.type, m = q[f].prototype, n = ["group", "markerGroup", "dataLabelsGroup"], g; if (h && h !== f || void 0 !== a.zIndex) n.length = 0; p(n, function (a) { n[a] = c[a]; delete c[a] }); a = y(d, { animation: !1, index: this.index, pointStart: this.xData[0] }, { data: this.options.data }, a); this.remove(!1, null, !1); for (g in m) this[g] =
                            void 0; l(this, q[h || f].prototype); p(n, function (a) { c[a] = n[a] }); this.init(e, a); e.linkSeries(); t(b, !0) && e.redraw(!1)
                    }
                }); l(G.prototype, {
                    update: function (a, b) { var c = this.chart; a = c.options[this.coll][this.options.index] = y(this.userOptions, a); this.destroy(!0); this.init(c, l(a, { events: void 0 })); c.isDirtyBox = !0; t(b, !0) && c.redraw() }, remove: function (a) {
                        for (var b = this.chart, c = this.coll, e = this.series, d = e.length; d--;)e[d] && e[d].remove(!1); v(b.axes, this); v(b[c], this); b.options[c].splice(this.options.index, 1); p(b[c],
                            function (a, b) { a.options.index = b }); this.destroy(); b.isDirtyBox = !0; t(a, !0) && b.redraw()
                    }, setTitle: function (a, b) { this.update({ title: a }, b) }, setCategories: function (a, b) { this.update({ categories: a }, b) }
                })
        })(L); (function (a) {
            var D = a.color, C = a.each, G = a.map, I = a.pick, h = a.Series, f = a.seriesType; f("area", "line", { softThreshold: !1, threshold: 0 }, {
                singleStacks: !1, getStackPoints: function () {
                    var a = [], f = [], h = this.xAxis, u = this.yAxis, d = u.stacks[this.stackKey], c = {}, n = this.points, y = this.index, t = u.series, m = t.length, b, q = I(u.options.reversedStacks,
                        !0) ? 1 : -1, z, F; if (this.options.stacking) {
                            for (z = 0; z < n.length; z++)c[n[z].x] = n[z]; for (F in d) null !== d[F].total && f.push(F); f.sort(function (a, b) { return a - b }); b = G(t, function () { return this.visible }); C(f, function (e, n) {
                                var l = 0, r, k; if (c[e] && !c[e].isNull) a.push(c[e]), C([-1, 1], function (a) { var h = 1 === a ? "rightNull" : "leftNull", l = 0, t = d[f[n + a]]; if (t) for (z = y; 0 <= z && z < m;)r = t.points[z], r || (z === y ? c[e][h] = !0 : b[z] && (k = d[e].points[z]) && (l -= k[1] - k[0])), z += q; c[e][1 === a ? "rightCliff" : "leftCliff"] = l }); else {
                                    for (z = y; 0 <= z && z < m;) {
                                        if (r =
                                            d[e].points[z]) { l = r[1]; break } z += q
                                    } l = u.toPixels(l, !0); a.push({ isNull: !0, plotX: h.toPixels(e, !0), plotY: l, yBottom: l })
                                }
                            })
                        } return a
                }, getGraphPath: function (a) {
                    var f = h.prototype.getGraphPath, l = this.options, p = l.stacking, d = this.yAxis, c, n, y = [], t = [], m = this.index, b, q = d.stacks[this.stackKey], z = l.threshold, F = d.getThreshold(l.threshold), e, l = l.connectNulls || "percent" === p, r = function (c, e, f) {
                        var k = a[c]; c = p && q[k.x].points[m]; var h = k[f + "Null"] || 0; f = k[f + "Cliff"] || 0; var n, l, k = !0; f || h ? (n = (h ? c[0] : c[1]) + f, l = c[0] + f, k = !!h) : !p &&
                            a[e] && a[e].isNull && (n = l = z); void 0 !== n && (t.push({ plotX: b, plotY: null === n ? F : d.getThreshold(n), isNull: k }), y.push({ plotX: b, plotY: null === l ? F : d.getThreshold(l), doCurve: !1 }))
                    }; a = a || this.points; p && (a = this.getStackPoints()); for (c = 0; c < a.length; c++)if (n = a[c].isNull, b = I(a[c].rectPlotX, a[c].plotX), e = I(a[c].yBottom, F), !n || l) l || r(c, c - 1, "left"), n && !p && l || (t.push(a[c]), y.push({ x: c, plotX: b, plotY: e })), l || r(c, c + 1, "right"); c = f.call(this, t, !0, !0); y.reversed = !0; n = f.call(this, y, !0, !0); n.length && (n[0] = "L"); n = c.concat(n); f =
                        f.call(this, t, !1, l); n.xMap = c.xMap; this.areaPath = n; return f
                }, drawGraph: function () {
                    this.areaPath = []; h.prototype.drawGraph.apply(this); var a = this, f = this.areaPath, l = this.options, u = [["area", "highcharts-area", this.color, l.fillColor]]; C(this.zones, function (d, c) { u.push(["zone-area-" + c, "highcharts-area highcharts-zone-area-" + c + " " + d.className, d.color || a.color, d.fillColor || l.fillColor]) }); C(u, function (d) {
                        var c = d[0], h = a[c]; h ? (h.endX = f.xMap, h.animate({ d: f })) : (h = a[c] = a.chart.renderer.path(f).addClass(d[1]).attr({
                            fill: I(d[3],
                                D(d[2]).setOpacity(I(l.fillOpacity, .75)).get()), zIndex: 0
                        }).add(a.group), h.isArea = !0); h.startX = f.xMap; h.shiftUnit = l.step ? 2 : 1
                    })
                }, drawLegendSymbol: a.LegendSymbolMixin.drawRectangle
            })
        })(L); (function (a) {
            var D = a.pick; a = a.seriesType; a("spline", "line", {}, {
                getPointSpline: function (a, G, I) {
                    var h = G.plotX, f = G.plotY, p = a[I - 1]; I = a[I + 1]; var v, l, u, d; if (p && !p.isNull && !1 !== p.doCurve && I && !I.isNull && !1 !== I.doCurve) {
                        a = p.plotY; u = I.plotX; I = I.plotY; var c = 0; v = (1.5 * h + p.plotX) / 2.5; l = (1.5 * f + a) / 2.5; u = (1.5 * h + u) / 2.5; d = (1.5 * f + I) / 2.5;
                        u !== v && (c = (d - l) * (u - h) / (u - v) + f - d); l += c; d += c; l > a && l > f ? (l = Math.max(a, f), d = 2 * f - l) : l < a && l < f && (l = Math.min(a, f), d = 2 * f - l); d > I && d > f ? (d = Math.max(I, f), l = 2 * f - d) : d < I && d < f && (d = Math.min(I, f), l = 2 * f - d); G.rightContX = u; G.rightContY = d
                    } G = ["C", D(p.rightContX, p.plotX), D(p.rightContY, p.plotY), D(v, h), D(l, f), h, f]; p.rightContX = p.rightContY = null; return G
                }
            })
        })(L); (function (a) {
            var D = a.seriesTypes.area.prototype, C = a.seriesType; C("areaspline", "spline", a.defaultPlotOptions.area, {
                getStackPoints: D.getStackPoints, getGraphPath: D.getGraphPath,
                setStackCliffs: D.setStackCliffs, drawGraph: D.drawGraph, drawLegendSymbol: a.LegendSymbolMixin.drawRectangle
            })
        })(L); (function (a) {
            var D = a.animObject, C = a.color, G = a.each, I = a.extend, h = a.isNumber, f = a.merge, p = a.pick, v = a.Series, l = a.seriesType, u = a.svg; l("column", "line", {
                borderRadius: 0, groupPadding: .2, marker: null, pointPadding: .1, minPointLength: 0, cropThreshold: 50, pointRange: null, states: { hover: { halo: !1, brightness: .1, shadow: !1 }, select: { color: "#cccccc", borderColor: "#000000", shadow: !1 } }, dataLabels: {
                    align: null, verticalAlign: null,
                    y: null
                }, softThreshold: !1, startFromThreshold: !0, stickyTracking: !1, tooltip: { distance: 6 }, threshold: 0, borderColor: "#ffffff"
            }, {
                cropShoulder: 0, directTouch: !0, trackerGroups: ["group", "dataLabelsGroup"], negStacks: !0, init: function () { v.prototype.init.apply(this, arguments); var a = this, c = a.chart; c.hasRendered && G(c.series, function (c) { c.type === a.type && (c.isDirty = !0) }) }, getColumnMetrics: function () {
                    var a = this, c = a.options, f = a.xAxis, h = a.yAxis, l = f.reversed, m, b = {}, q = 0; !1 === c.grouping ? q = 1 : G(a.chart.series, function (c) {
                        var e =
                            c.options, d = c.yAxis, f; c.type === a.type && c.visible && h.len === d.len && h.pos === d.pos && (e.stacking ? (m = c.stackKey, void 0 === b[m] && (b[m] = q++), f = b[m]) : !1 !== e.grouping && (f = q++), c.columnIndex = f)
                    }); var u = Math.min(Math.abs(f.transA) * (f.ordinalSlope || c.pointRange || f.closestPointRange || f.tickInterval || 1), f.len), F = u * c.groupPadding, e = (u - 2 * F) / q, c = Math.min(c.maxPointWidth || f.len, p(c.pointWidth, e * (1 - 2 * c.pointPadding))); a.columnMetrics = { width: c, offset: (e - c) / 2 + (F + ((a.columnIndex || 0) + (l ? 1 : 0)) * e - u / 2) * (l ? -1 : 1) }; return a.columnMetrics
                },
                crispCol: function (a, c, f, h) { var d = this.chart, m = this.borderWidth, b = -(m % 2 ? .5 : 0), m = m % 2 ? .5 : 1; d.inverted && d.renderer.isVML && (m += 1); f = Math.round(a + f) + b; a = Math.round(a) + b; h = Math.round(c + h) + m; b = .5 >= Math.abs(c) && .5 < h; c = Math.round(c) + m; h -= c; b && h && (--c, h += 1); return { x: a, y: c, width: f - a, height: h } }, translate: function () {
                    var a = this, c = a.chart, f = a.options, h = a.dense = 2 > a.closestPointRange * a.xAxis.transA, h = a.borderWidth = p(f.borderWidth, h ? 0 : 1), l = a.yAxis, m = a.translatedThreshold = l.getThreshold(f.threshold), b = p(f.minPointLength,
                        5), q = a.getColumnMetrics(), u = q.width, F = a.barW = Math.max(u, 1 + 2 * h), e = a.pointXOffset = q.offset; c.inverted && (m -= .5); f.pointPadding && (F = Math.ceil(F)); v.prototype.translate.apply(a); G(a.points, function (d) {
                            var f = p(d.yBottom, m), h = 999 + Math.abs(f), h = Math.min(Math.max(-h, d.plotY), l.len + h), k = d.plotX + e, n = F, q = Math.min(h, f), r, t = Math.max(h, f) - q; Math.abs(t) < b && b && (t = b, r = !l.reversed && !d.negative || l.reversed && d.negative, q = Math.abs(q - m) > b ? f - b : m - (r ? b : 0)); d.barX = k; d.pointWidth = u; d.tooltipPos = c.inverted ? [l.len + l.pos - c.plotLeft -
                                h, a.xAxis.len - k - n / 2, t] : [k + n / 2, h + l.pos - c.plotTop, t]; d.shapeType = "rect"; d.shapeArgs = a.crispCol.apply(a, d.isNull ? [d.plotX, l.len / 2, 0, 0] : [k, q, n, t])
                        })
                }, getSymbol: a.noop, drawLegendSymbol: a.LegendSymbolMixin.drawRectangle, drawGraph: function () { this.group[this.dense ? "addClass" : "removeClass"]("highcharts-dense-data") }, pointAttribs: function (a, c) {
                    var d = this.options, f, h = this.pointAttrToOptions || {}; f = h.stroke || "borderColor"; var m = h["stroke-width"] || "borderWidth", b = a && a.color || this.color, l = a[f] || d[f] || this.color ||
                        b, p = a[m] || d[m] || this[m] || 0, h = d.dashStyle; a && this.zones.length && (b = (b = a.getZone()) && b.color || a.options.color || this.color); c && (a = d.states[c], c = a.brightness, b = a.color || void 0 !== c && C(b).brighten(a.brightness).get() || b, l = a[f] || l, p = a[m] || p, h = a.dashStyle || h); f = { fill: b, stroke: l, "stroke-width": p }; d.borderRadius && (f.r = d.borderRadius); h && (f.dashstyle = h); return f
                }, drawPoints: function () {
                    var a = this, c = this.chart, l = a.options, p = c.renderer, t = l.animationLimit || 250, m; G(a.points, function (b) {
                        var d = b.graphic; if (h(b.plotY) &&
                            null !== b.y) { m = b.shapeArgs; if (d) d[c.pointCount < t ? "animate" : "attr"](f(m)); else b.graphic = d = p[b.shapeType](m).attr({ "class": b.getClassName() }).add(b.group || a.group); d.attr(a.pointAttribs(b, b.selected && "select")).shadow(l.shadow, null, l.stacking && !l.borderRadius) } else d && (b.graphic = d.destroy())
                    })
                }, animate: function (a) {
                    var c = this, d = this.yAxis, f = c.options, h = this.chart.inverted, m = {}; u && (a ? (m.scaleY = .001, a = Math.min(d.pos + d.len, Math.max(d.pos, d.toPixels(f.threshold))), h ? m.translateX = a - d.len : m.translateY = a, c.group.attr(m)) :
                        (m[h ? "translateX" : "translateY"] = d.pos, c.group.animate(m, I(D(c.options.animation), { step: function (a, d) { c.group.attr({ scaleY: Math.max(.001, d.pos) }) } })), c.animate = null))
                }, remove: function () { var a = this, c = a.chart; c.hasRendered && G(c.series, function (c) { c.type === a.type && (c.isDirty = !0) }); v.prototype.remove.apply(a, arguments) }
            })
        })(L); (function (a) { a = a.seriesType; a("bar", "column", null, { inverted: !0 }) })(L); (function (a) {
            var D = a.Series; a = a.seriesType; a("scatter", "line", {
                lineWidth: 0, marker: { enabled: !0 }, tooltip: {
                    headerFormat: '\x3cspan style\x3d"color:{point.color}"\x3e\u25cf\x3c/span\x3e \x3cspan style\x3d"font-size: 0.85em"\x3e {series.name}\x3c/span\x3e\x3cbr/\x3e',
                    pointFormat: "x: \x3cb\x3e{point.x}\x3c/b\x3e\x3cbr/\x3ey: \x3cb\x3e{point.y}\x3c/b\x3e\x3cbr/\x3e"
                }
            }, { sorted: !1, requireSorting: !1, noSharedTooltip: !0, trackerGroups: ["group", "markerGroup", "dataLabelsGroup"], takeOrdinalPosition: !1, kdDimensions: 2, drawGraph: function () { this.options.lineWidth && D.prototype.drawGraph.call(this) } })
        })(L); (function (a) {
            var D = a.pick, C = a.relativeLength; a.CenteredSeriesMixin = {
                getCenter: function () {
                    var a = this.options, I = this.chart, h = 2 * (a.slicedOffset || 0), f = I.plotWidth - 2 * h, I = I.plotHeight -
                        2 * h, p = a.center, p = [D(p[0], "50%"), D(p[1], "50%"), a.size || "100%", a.innerSize || 0], v = Math.min(f, I), l, u; for (l = 0; 4 > l; ++l)u = p[l], a = 2 > l || 2 === l && /%$/.test(u), p[l] = C(u, [f, I, v, p[2]][l]) + (a ? h : 0); p[3] > p[2] && (p[3] = p[2]); return p
                }
            }
        })(L); (function (a) {
            var D = a.addEvent, C = a.defined, G = a.each, I = a.extend, h = a.inArray, f = a.noop, p = a.pick, v = a.Point, l = a.Series, u = a.seriesType, d = a.setAnimation; u("pie", "line", {
                center: [null, null], clip: !1, colorByPoint: !0, dataLabels: {
                    distance: 30, enabled: !0, formatter: function () {
                        return null === this.y ?
                            void 0 : this.point.name
                    }, x: 0
                }, ignoreHiddenPoint: !0, legendType: "point", marker: null, size: null, showInLegend: !1, slicedOffset: 10, stickyTracking: !1, tooltip: { followPointer: !0 }, borderColor: "#ffffff", borderWidth: 1, states: { hover: { brightness: .1, shadow: !1 } }
            }, {
                isCartesian: !1, requireSorting: !1, directTouch: !0, noSharedTooltip: !0, trackerGroups: ["group", "dataLabelsGroup"], axisTypes: [], pointAttribs: a.seriesTypes.column.prototype.pointAttribs, animate: function (a) {
                    var c = this, d = c.points, f = c.startAngleRad; a || (G(d, function (a) {
                        var b =
                            a.graphic, d = a.shapeArgs; b && (b.attr({ r: a.startR || c.center[3] / 2, start: f, end: f }), b.animate({ r: d.r, start: d.start, end: d.end }, c.options.animation))
                    }), c.animate = null)
                }, updateTotals: function () { var a, d = 0, f = this.points, h = f.length, m, b = this.options.ignoreHiddenPoint; for (a = 0; a < h; a++)m = f[a], 0 > m.y && (m.y = null), d += b && !m.visible ? 0 : m.y; this.total = d; for (a = 0; a < h; a++)m = f[a], m.percentage = 0 < d && (m.visible || !b) ? m.y / d * 100 : 0, m.total = d }, generatePoints: function () { l.prototype.generatePoints.call(this); this.updateTotals() }, translate: function (a) {
                    this.generatePoints();
                    var c = 0, d = this.options, f = d.slicedOffset, h = f + (d.borderWidth || 0), b, l, u, F = d.startAngle || 0, e = this.startAngleRad = Math.PI / 180 * (F - 90), F = (this.endAngleRad = Math.PI / 180 * (p(d.endAngle, F + 360) - 90)) - e, r = this.points, x = d.dataLabels.distance, d = d.ignoreHiddenPoint, A, k = r.length, w; a || (this.center = a = this.getCenter()); this.getX = function (b, c) { u = Math.asin(Math.min((b - a[1]) / (a[2] / 2 + x), 1)); return a[0] + (c ? -1 : 1) * Math.cos(u) * (a[2] / 2 + x) }; for (A = 0; A < k; A++) {
                        w = r[A]; b = e + c * F; if (!d || w.visible) c += w.percentage / 100; l = e + c * F; w.shapeType =
                            "arc"; w.shapeArgs = { x: a[0], y: a[1], r: a[2] / 2, innerR: a[3] / 2, start: Math.round(1E3 * b) / 1E3, end: Math.round(1E3 * l) / 1E3 }; u = (l + b) / 2; u > 1.5 * Math.PI ? u -= 2 * Math.PI : u < -Math.PI / 2 && (u += 2 * Math.PI); w.slicedTranslation = { translateX: Math.round(Math.cos(u) * f), translateY: Math.round(Math.sin(u) * f) }; b = Math.cos(u) * a[2] / 2; l = Math.sin(u) * a[2] / 2; w.tooltipPos = [a[0] + .7 * b, a[1] + .7 * l]; w.half = u < -Math.PI / 2 || u > Math.PI / 2 ? 1 : 0; w.angle = u; h = Math.min(h, x / 5); w.labelPos = [a[0] + b + Math.cos(u) * x, a[1] + l + Math.sin(u) * x, a[0] + b + Math.cos(u) * h, a[1] + l + Math.sin(u) *
                                h, a[0] + b, a[1] + l, 0 > x ? "center" : w.half ? "right" : "left", u]
                    }
                }, drawGraph: null, drawPoints: function () {
                    var a = this, d = a.chart.renderer, f, h, m, b, l = a.options.shadow; l && !a.shadowGroup && (a.shadowGroup = d.g("shadow").add(a.group)); G(a.points, function (c) {
                        if (null !== c.y) {
                            h = c.graphic; b = c.shapeArgs; f = c.sliced ? c.slicedTranslation : {}; var n = c.shadowGroup; l && !n && (n = c.shadowGroup = d.g("shadow").add(a.shadowGroup)); n && n.attr(f); m = a.pointAttribs(c, c.selected && "select"); h ? h.setRadialReference(a.center).attr(m).animate(I(b, f)) : (c.graphic =
                                h = d[c.shapeType](b).addClass(c.getClassName()).setRadialReference(a.center).attr(f).add(a.group), c.visible || h.attr({ visibility: "hidden" }), h.attr(m).attr({ "stroke-linejoin": "round" }).shadow(l, n))
                        }
                    })
                }, searchPoint: f, sortByAngle: function (a, d) { a.sort(function (a, c) { return void 0 !== a.angle && (c.angle - a.angle) * d }) }, drawLegendSymbol: a.LegendSymbolMixin.drawRectangle, getCenter: a.CenteredSeriesMixin.getCenter, getSymbol: f
            }, {
                init: function () {
                    v.prototype.init.apply(this, arguments); var a = this, d; a.name = p(a.name, "Slice");
                    d = function (c) { a.slice("select" === c.type) }; D(a, "select", d); D(a, "unselect", d); return a
                }, setVisible: function (a, d) { var c = this, f = c.series, m = f.chart, b = f.options.ignoreHiddenPoint; d = p(d, b); a !== c.visible && (c.visible = c.options.visible = a = void 0 === a ? !c.visible : a, f.options.data[h(c, f.data)] = c.options, G(["graphic", "dataLabel", "connector", "shadowGroup"], function (b) { if (c[b]) c[b][a ? "show" : "hide"](!0) }), c.legendItem && m.legend.colorizeItem(c, a), a || "hover" !== c.state || c.setState(""), b && (f.isDirty = !0), d && m.redraw()) },
                slice: function (a, f, l) { var c = this.series; d(l, c.chart); p(f, !0); this.sliced = this.options.sliced = a = C(a) ? a : !this.sliced; c.options.data[h(this, c.data)] = this.options; a = a ? this.slicedTranslation : { translateX: 0, translateY: 0 }; this.graphic.animate(a); this.shadowGroup && this.shadowGroup.animate(a) }, haloPath: function (a) { var c = this.shapeArgs; return this.sliced || !this.visible ? [] : this.series.chart.renderer.symbols.arc(c.x, c.y, c.r + a, c.r + a, { innerR: this.shapeArgs.r, start: c.start, end: c.end }) }
            })
        })(L); (function (a) {
            var D =
                a.addEvent, C = a.arrayMax, G = a.defined, I = a.each, h = a.extend, f = a.format, p = a.map, v = a.merge, l = a.noop, u = a.pick, d = a.relativeLength, c = a.Series, n = a.seriesTypes, y = a.stableSort; a.distribute = function (a, c) {
                    function b(a, b) { return a.target - b.target } var d, f = !0, h = a, e = [], m; m = 0; for (d = a.length; d--;)m += a[d].size; if (m > c) { y(a, function (a, b) { return (b.rank || 0) - (a.rank || 0) }); for (m = d = 0; m <= c;)m += a[d].size, d++; e = a.splice(d - 1, a.length) } y(a, b); for (a = p(a, function (a) { return { size: a.size, targets: [a.target] } }); f;) {
                        for (d = a.length; d--;)f =
                            a[d], m = (Math.min.apply(0, f.targets) + Math.max.apply(0, f.targets)) / 2, f.pos = Math.min(Math.max(0, m - f.size / 2), c - f.size); d = a.length; for (f = !1; d--;)0 < d && a[d - 1].pos + a[d - 1].size > a[d].pos && (a[d - 1].size += a[d].size, a[d - 1].targets = a[d - 1].targets.concat(a[d].targets), a[d - 1].pos + a[d - 1].size > c && (a[d - 1].pos = c - a[d - 1].size), a.splice(d, 1), f = !0)
                    } d = 0; I(a, function (a) { var b = 0; I(a.targets, function () { h[d].pos = a.pos + b; b += h[d].size; d++ }) }); h.push.apply(h, e); y(h, b)
                }; c.prototype.drawDataLabels = function () {
                    var a = this, c = a.options,
                        b = c.dataLabels, d = a.points, l, n, e = a.hasRendered || 0, r, p, A = u(b.defer, !0), k = a.chart.renderer; if (b.enabled || a._hasPointLabels) a.dlProcessOptions && a.dlProcessOptions(b), p = a.plotGroup("dataLabelsGroup", "data-labels", A && !e ? "hidden" : "visible", b.zIndex || 6), A && (p.attr({ opacity: +e }), e || D(a, "afterAnimate", function () { a.visible && p.show(!0); p[c.animation ? "animate" : "attr"]({ opacity: 1 }, { duration: 200 }) })), n = b, I(d, function (e) {
                            var d, m = e.dataLabel, q, g, t = e.connector, F = !0, x, A = {}; l = e.dlOptions || e.options && e.options.dataLabels;
                            d = u(l && l.enabled, n.enabled) && null !== e.y; if (m && !d) e.dataLabel = m.destroy(); else if (d) {
                                b = v(n, l); x = b.style; d = b.rotation; q = e.getLabelConfig(); r = b.format ? f(b.format, q) : b.formatter.call(q, b); x.color = u(b.color, x.color, a.color, "#000000"); if (m) G(r) ? (m.attr({ text: r }), F = !1) : (e.dataLabel = m = m.destroy(), t && (e.connector = t.destroy())); else if (G(r)) {
                                    m = { fill: b.backgroundColor, stroke: b.borderColor, "stroke-width": b.borderWidth, r: b.borderRadius || 0, rotation: d, padding: b.padding, zIndex: 1 }; "contrast" === x.color && (A.color = b.inside ||
                                        0 > b.distance || c.stacking ? k.getContrast(e.color || a.color) : "#000000"); c.cursor && (A.cursor = c.cursor); for (g in m) void 0 === m[g] && delete m[g]; m = e.dataLabel = k[d ? "text" : "label"](r, 0, -9999, b.shape, null, null, b.useHTML, null, "data-label").attr(m); m.addClass("highcharts-data-label-color-" + e.colorIndex + " " + (b.className || "") + (b.useHTML ? "highcharts-tracker" : "")); m.css(h(x, A)); m.add(p); m.shadow(b.shadow)
                                } m && a.alignDataLabel(e, m, b, null, F)
                            }
                        })
                }; c.prototype.alignDataLabel = function (a, c, b, d, f) {
                    var m = this.chart, e = m.inverted,
                        l = u(a.plotX, -9999), n = u(a.plotY, -9999), p = c.getBBox(), k, q = b.rotation, t = b.align, v = this.visible && (a.series.forceDL || m.isInsidePlot(l, Math.round(n), e) || d && m.isInsidePlot(l, e ? d.x + 1 : d.y + d.height - 1, e)), z = "justify" === u(b.overflow, "justify"); v && (k = b.style.fontSize, k = m.renderer.fontMetrics(k, c).b, d = h({ x: e ? m.plotWidth - n : l, y: Math.round(e ? m.plotHeight - l : n), width: 0, height: 0 }, d), h(b, { width: p.width, height: p.height }), q ? (z = !1, e = m.renderer.rotCorr(k, q), e = {
                            x: d.x + b.x + d.width / 2 + e.x, y: d.y + b.y + { top: 0, middle: .5, bottom: 1 }[b.verticalAlign] *
                                d.height
                        }, c[f ? "attr" : "animate"](e).attr({ align: t }), l = (q + 720) % 360, l = 180 < l && 360 > l, "left" === t ? e.y -= l ? p.height : 0 : "center" === t ? (e.x -= p.width / 2, e.y -= p.height / 2) : "right" === t && (e.x -= p.width, e.y -= l ? 0 : p.height)) : (c.align(b, null, d), e = c.alignAttr), z ? this.justifyDataLabel(c, b, e, p, d, f) : u(b.crop, !0) && (v = m.isInsidePlot(e.x, e.y) && m.isInsidePlot(e.x + p.width, e.y + p.height)), b.shape && !q && c.attr({ anchorX: a.plotX, anchorY: a.plotY })); v || (c.attr({ y: -9999 }), c.placed = !1)
                }; c.prototype.justifyDataLabel = function (a, c, b, d, f, h) {
                    var e =
                        this.chart, m = c.align, l = c.verticalAlign, n, k, p = a.box ? 0 : a.padding || 0; n = b.x + p; 0 > n && ("right" === m ? c.align = "left" : c.x = -n, k = !0); n = b.x + d.width - p; n > e.plotWidth && ("left" === m ? c.align = "right" : c.x = e.plotWidth - n, k = !0); n = b.y + p; 0 > n && ("bottom" === l ? c.verticalAlign = "top" : c.y = -n, k = !0); n = b.y + d.height - p; n > e.plotHeight && ("top" === l ? c.verticalAlign = "bottom" : c.y = e.plotHeight - n, k = !0); k && (a.placed = !h, a.align(c, null, f))
                }; n.pie && (n.pie.prototype.drawDataLabels = function () {
                    var d = this, f = d.data, b, h = d.chart, l = d.options.dataLabels, n =
                        u(l.connectorPadding, 10), e = u(l.connectorWidth, 1), r = h.plotWidth, v = h.plotHeight, A, k = l.distance, w = d.center, y = w[2] / 2, D = w[1], G = 0 < k, g, B, L, M, R = [[], []], E, H, P, Q, O = [0, 0, 0, 0]; d.visible && (l.enabled || d._hasPointLabels) && (c.prototype.drawDataLabels.apply(d), I(f, function (a) { a.dataLabel && a.visible && (R[a.half].push(a), a.dataLabel._pos = null) }), I(R, function (c, e) {
                            var f, m, q = c.length, t, u, F; if (q) for (d.sortByAngle(c, e - .5), 0 < k && (f = Math.max(0, D - y - k), m = Math.min(D + y + k, h.plotHeight), t = p(c, function (a) {
                                if (a.dataLabel) return F =
                                    a.dataLabel.getBBox().height || 21, { target: a.labelPos[1] - f + F / 2, size: F, rank: a.y }
                            }), a.distribute(t, m + F - f)), Q = 0; Q < q; Q++)b = c[Q], L = b.labelPos, g = b.dataLabel, P = !1 === b.visible ? "hidden" : "inherit", u = L[1], t ? void 0 === t[Q].pos ? P = "hidden" : (M = t[Q].size, H = f + t[Q].pos) : H = u, E = l.justify ? w[0] + (e ? -1 : 1) * (y + k) : d.getX(H < f + 2 || H > m - 2 ? u : H, e), g._attr = { visibility: P, align: L[6] }, g._pos = { x: E + l.x + ({ left: n, right: -n }[L[6]] || 0), y: H + l.y - 10 }, L.x = E, L.y = H, null === d.options.size && (B = g.width, E - B < n ? O[3] = Math.max(Math.round(B - E + n), O[3]) : E + B > r - n &&
                                (O[1] = Math.max(Math.round(E + B - r + n), O[1])), 0 > H - M / 2 ? O[0] = Math.max(Math.round(-H + M / 2), O[0]) : H + M / 2 > v && (O[2] = Math.max(Math.round(H + M / 2 - v), O[2])))
                        }), 0 === C(O) || this.verifyDataLabelOverflow(O)) && (this.placeDataLabels(), G && e && I(this.points, function (a) {
                            var b; A = a.connector; if ((g = a.dataLabel) && g._pos && a.visible) {
                                P = g._attr.visibility; if (b = !A) a.connector = A = h.renderer.path().addClass("highcharts-data-label-connector highcharts-color-" + a.colorIndex).add(d.dataLabelsGroup), A.attr({
                                    "stroke-width": e, stroke: l.connectorColor ||
                                        a.color || "#666666"
                                }); A[b ? "attr" : "animate"]({ d: d.connectorPath(a.labelPos) }); A.attr("visibility", P)
                            } else A && (a.connector = A.destroy())
                        }))
                }, n.pie.prototype.connectorPath = function (a) { var c = a.x, b = a.y; return u(this.options.dataLabels.softConnector, !0) ? ["M", c + ("left" === a[6] ? 5 : -5), b, "C", c, b, 2 * a[2] - a[4], 2 * a[3] - a[5], a[2], a[3], "L", a[4], a[5]] : ["M", c + ("left" === a[6] ? 5 : -5), b, "L", a[2], a[3], "L", a[4], a[5]] }, n.pie.prototype.placeDataLabels = function () {
                    I(this.points, function (a) {
                        var c = a.dataLabel; c && a.visible && ((a = c._pos) ?
                            (c.attr(c._attr), c[c.moved ? "animate" : "attr"](a), c.moved = !0) : c && c.attr({ y: -9999 }))
                    })
                }, n.pie.prototype.alignDataLabel = l, n.pie.prototype.verifyDataLabelOverflow = function (a) {
                    var c = this.center, b = this.options, f = b.center, h = b.minSize || 80, l, e; null !== f[0] ? l = Math.max(c[2] - Math.max(a[1], a[3]), h) : (l = Math.max(c[2] - a[1] - a[3], h), c[0] += (a[3] - a[1]) / 2); null !== f[1] ? l = Math.max(Math.min(l, c[2] - Math.max(a[0], a[2])), h) : (l = Math.max(Math.min(l, c[2] - a[0] - a[2]), h), c[1] += (a[0] - a[2]) / 2); l < c[2] ? (c[2] = l, c[3] = Math.min(d(b.innerSize ||
                        0, l), l), this.translate(c), this.drawDataLabels && this.drawDataLabels()) : e = !0; return e
                }); n.column && (n.column.prototype.alignDataLabel = function (a, d, b, f, h) {
                    var l = this.chart.inverted, e = a.series, m = a.dlBox || a.shapeArgs, n = u(a.below, a.plotY > u(this.translatedThreshold, e.yAxis.len)), p = u(b.inside, !!this.options.stacking); m && (f = v(m), 0 > f.y && (f.height += f.y, f.y = 0), m = f.y + f.height - e.yAxis.len, 0 < m && (f.height -= m), l && (f = { x: e.yAxis.len - f.y - f.height, y: e.xAxis.len - f.x - f.width, width: f.height, height: f.width }), p || (l ? (f.x += n ?
                        0 : f.width, f.width = 0) : (f.y += n ? f.height : 0, f.height = 0))); b.align = u(b.align, !l || p ? "center" : n ? "right" : "left"); b.verticalAlign = u(b.verticalAlign, l || p ? "middle" : n ? "top" : "bottom"); c.prototype.alignDataLabel.call(this, a, d, b, f, h)
                })
        })(L); (function (a) {
            var D = a.Chart, C = a.each, G = a.pick, I = a.addEvent; D.prototype.callbacks.push(function (a) {
                function f() {
                    var f = []; C(a.series, function (a) {
                        var h = a.options.dataLabels, p = a.dataLabelCollections || ["dataLabel"]; (h.enabled || a._hasPointLabels) && !h.allowOverlap && a.visible && C(p, function (d) {
                            C(a.points,
                                function (a) { a[d] && (a[d].labelrank = G(a.labelrank, a.shapeArgs && a.shapeArgs.height), f.push(a[d])) })
                        })
                    }); a.hideOverlappingLabels(f)
                } f(); I(a, "redraw", f)
            }); D.prototype.hideOverlappingLabels = function (a) {
                var f = a.length, h, v, l, u, d, c, n, y, t, m = function (a, c, d, f, e, h, l, m) { return !(e > a + d || e + l < a || h > c + f || h + m < c) }; for (v = 0; v < f; v++)if (h = a[v]) h.oldOpacity = h.opacity, h.newOpacity = 1; a.sort(function (a, c) { return (c.labelrank || 0) - (a.labelrank || 0) }); for (v = 0; v < f; v++)for (l = a[v], h = v + 1; h < f; ++h)if (u = a[h], l && u && l.placed && u.placed && 0 !==
                    l.newOpacity && 0 !== u.newOpacity && (d = l.alignAttr, c = u.alignAttr, n = l.parentGroup, y = u.parentGroup, t = 2 * (l.box ? 0 : l.padding), d = m(d.x + n.translateX, d.y + n.translateY, l.width - t, l.height - t, c.x + y.translateX, c.y + y.translateY, u.width - t, u.height - t))) (l.labelrank < u.labelrank ? l : u).newOpacity = 0; C(a, function (a) { var b, c; a && (c = a.newOpacity, a.oldOpacity !== c && a.placed && (c ? a.show(!0) : b = function () { a.hide() }, a.alignAttr.opacity = c, a[a.isOld ? "animate" : "attr"](a.alignAttr, null, b)), a.isOld = !0) })
            }
        })(L); (function (a) {
            var D = a.addEvent,
                C = a.Chart, G = a.createElement, I = a.css, h = a.defaultOptions, f = a.defaultPlotOptions, p = a.each, v = a.extend, l = a.fireEvent, u = a.hasTouch, d = a.inArray, c = a.isObject, n = a.Legend, y = a.merge, t = a.pick, m = a.Point, b = a.Series, q = a.seriesTypes, z = a.svg; a = a.TrackerMixin = {
                    drawTrackerPoint: function () {
                        var a = this, b = a.chart, c = b.pointer, d = function (a) { for (var c = a.target, e; c && !e;)e = c.point, c = c.parentNode; if (void 0 !== e && e !== b.hoverPoint) e.onMouseOver(a) }; p(a.points, function (a) {
                            a.graphic && (a.graphic.element.point = a); a.dataLabel && (a.dataLabel.div ?
                                a.dataLabel.div.point = a : a.dataLabel.element.point = a)
                        }); a._hasTracking || (p(a.trackerGroups, function (b) { if (a[b]) { a[b].addClass("highcharts-tracker").on("mouseover", d).on("mouseout", function (a) { c.onTrackerMouseOut(a) }); if (u) a[b].on("touchstart", d); a.options.cursor && a[b].css(I).css({ cursor: a.options.cursor }) } }), a._hasTracking = !0)
                    }, drawTrackerGraph: function () {
                        var a = this, b = a.options, c = b.trackByArea, d = [].concat(c ? a.areaPath : a.graphPath), f = d.length, h = a.chart, l = h.pointer, m = h.renderer, n = h.options.tooltip.snap,
                            q = a.tracker, g, t = function () { if (h.hoverSeries !== a) a.onMouseOver() }, v = "rgba(192,192,192," + (z ? .0001 : .002) + ")"; if (f && !c) for (g = f + 1; g--;)"M" === d[g] && d.splice(g + 1, 0, d[g + 1] - n, d[g + 2], "L"), (g && "M" === d[g] || g === f) && d.splice(g, 0, "L", d[g - 2] + n, d[g - 1]); q ? q.attr({ d: d }) : a.graph && (a.tracker = m.path(d).attr({ "stroke-linejoin": "round", visibility: a.visible ? "visible" : "hidden", stroke: v, fill: c ? v : "none", "stroke-width": a.graph.strokeWidth() + (c ? 0 : 2 * n), zIndex: 2 }).add(a.group), p([a.tracker, a.markerGroup], function (a) {
                                a.addClass("highcharts-tracker").on("mouseover",
                                    t).on("mouseout", function (a) { l.onTrackerMouseOut(a) }); b.cursor && a.css({ cursor: b.cursor }); if (u) a.on("touchstart", t)
                            }))
                    }
                }; q.column && (q.column.prototype.drawTracker = a.drawTrackerPoint); q.pie && (q.pie.prototype.drawTracker = a.drawTrackerPoint); q.scatter && (q.scatter.prototype.drawTracker = a.drawTrackerPoint); v(n.prototype, {
                    setItemEvents: function (a, b, c) {
                        var e = this, d = e.chart, f = "highcharts-legend-" + (a.series ? "point" : "series") + "-active"; (c ? b : a.legendGroup).on("mouseover", function () {
                            a.setState("hover"); d.seriesGroup.addClass(f);
                            b.css(e.options.itemHoverStyle)
                        }).on("mouseout", function () { b.css(a.visible ? e.itemStyle : e.itemHiddenStyle); d.seriesGroup.removeClass(f); a.setState() }).on("click", function (b) { var c = function () { a.setVisible && a.setVisible() }; b = { browserEvent: b }; a.firePointEvent ? a.firePointEvent("legendItemClick", b, c) : l(a, "legendItemClick", b, c) })
                    }, createCheckboxForItem: function (a) {
                        a.checkbox = G("input", { type: "checkbox", checked: a.selected, defaultChecked: a.selected }, this.options.itemCheckboxStyle, this.chart.container); D(a.checkbox,
                            "click", function (b) { l(a.series || a, "checkboxClick", { checked: b.target.checked, item: a }, function () { a.select() }) })
                    }
                }); h.legend.itemStyle.cursor = "pointer"; v(C.prototype, {
                    showResetZoom: function () {
                        var a = this, b = h.lang, c = a.options.chart.resetZoomButton, d = c.theme, f = d.states, k = "chart" === c.relativeTo ? null : "plotBox"; this.resetZoomButton = a.renderer.button(b.resetZoom, null, null, function () { a.zoomOut() }, d, f && f.hover).attr({ align: c.position.align, title: b.resetZoomTitle }).addClass("highcharts-reset-zoom").add().align(c.position,
                            !1, k)
                    }, zoomOut: function () { var a = this; l(a, "selection", { resetSelection: !0 }, function () { a.zoom() }) }, zoom: function (a) { var b, d = this.pointer, f = !1, h; !a || a.resetSelection ? p(this.axes, function (a) { b = a.zoom() }) : p(a.xAxis.concat(a.yAxis), function (a) { var c = a.axis; d[c.isXAxis ? "zoomX" : "zoomY"] && (b = c.zoom(a.min, a.max), c.displayBtn && (f = !0)) }); h = this.resetZoomButton; f && !h ? this.showResetZoom() : !f && c(h) && (this.resetZoomButton = h.destroy()); b && this.redraw(t(this.options.chart.animation, a && a.animation, 100 > this.pointCount)) },
                    pan: function (a, b) {
                        var c = this, e = c.hoverPoints, d; e && p(e, function (a) { a.setState() }); p("xy" === b ? [1, 0] : [1], function (b) { b = c[b ? "xAxis" : "yAxis"][0]; var e = b.horiz, f = a[e ? "chartX" : "chartY"], e = e ? "mouseDownX" : "mouseDownY", h = c[e], k = (b.pointRange || 0) / 2, g = b.getExtremes(), l = b.toValue(h - f, !0) + k, k = b.toValue(h + b.len - f, !0) - k, m = k < l, h = m ? k : l, l = m ? l : k, k = Math.min(g.dataMin, g.min) - h, g = l - Math.max(g.dataMax, g.max); b.series.length && 0 > k && 0 > g && (b.setExtremes(h, l, !1, !1, { trigger: "pan" }), d = !0); c[e] = f }); d && c.redraw(!1); I(c.container,
                            { cursor: "move" })
                    }
                }); v(m.prototype, {
                    select: function (a, b) { var c = this, e = c.series, f = e.chart; a = t(a, !c.selected); c.firePointEvent(a ? "select" : "unselect", { accumulate: b }, function () { c.selected = c.options.selected = a; e.options.data[d(c, e.data)] = c.options; c.setState(a && "select"); b || p(f.getSelectedPoints(), function (a) { a.selected && a !== c && (a.selected = a.options.selected = !1, e.options.data[d(a, e.data)] = a.options, a.setState(""), a.firePointEvent("unselect")) }) }) }, onMouseOver: function (a, b) {
                        var c = this.series, e = c.chart, d =
                            e.tooltip, f = e.hoverPoint; if (this.series) { if (!b) { if (f && f !== this) f.onMouseOut(); if (e.hoverSeries !== c) c.onMouseOver(); e.hoverPoint = this } !d || d.shared && !c.noSharedTooltip ? d || this.setState("hover") : (this.setState("hover"), d.refresh(this, a)); this.firePointEvent("mouseOver") }
                    }, onMouseOut: function () { var a = this.series.chart, b = a.hoverPoints; this.firePointEvent("mouseOut"); b && -1 !== d(this, b) || (this.setState(), a.hoverPoint = null) }, importEvents: function () {
                        if (!this.hasImportedEvents) {
                            var a = y(this.series.options.point,
                                this.options).events, b; this.events = a; for (b in a) D(this, b, a[b]); this.hasImportedEvents = !0
                        }
                    }, setState: function (a, b) {
                        var c = Math.floor(this.plotX), d = this.plotY, e = this.series, h = e.options.states[a] || {}, l = f[e.type].marker && e.options.marker, m = l && !1 === l.enabled, n = l && l.states && l.states[a] || {}, p = !1 === n.enabled, g = e.stateMarkerGraphic, q = this.marker || {}, u = e.chart, y = e.halo, z, F = l && e.markerAttribs; a = a || ""; if (!(a === this.state && !b || this.selected && "select" !== a || !1 === h.enabled || a && (p || m && !1 === n.enabled) || a && q.states &&
                            q.states[a] && !1 === q.states[a].enabled)) {
                            F && (z = e.markerAttribs(this, a)); if (this.graphic) this.state && this.graphic.removeClass("highcharts-point-" + this.state), a && this.graphic.addClass("highcharts-point-" + a), this.graphic.attr(e.pointAttribs(this, a)), z && this.graphic.animate(z, t(u.options.chart.animation, n.animation, l.animation)), g && g.hide(); else {
                                if (a && n) {
                                    l = q.symbol || e.symbol; g && g.currentSymbol !== l && (g = g.destroy()); if (g) g[b ? "animate" : "attr"]({ x: z.x, y: z.y }); else l && (e.stateMarkerGraphic = g = u.renderer.symbol(l,
                                        z.x, z.y, z.width, z.height).add(e.markerGroup), g.currentSymbol = l); g && g.attr(e.pointAttribs(this, a))
                                } g && (g[a && u.isInsidePlot(c, d, u.inverted) ? "show" : "hide"](), g.element.point = this)
                            } (c = h.halo) && c.size ? (y || (e.halo = y = u.renderer.path().add(F ? e.markerGroup : e.group)), y[b ? "animate" : "attr"]({ d: this.haloPath(c.size) }), y.attr({ "class": "highcharts-halo highcharts-color-" + t(this.colorIndex, e.colorIndex) }), y.point = this, y.attr(v({ fill: this.color || e.color, "fill-opacity": c.opacity, zIndex: -1 }, c.attributes))) : y && y.point &&
                                y.point.haloPath && y.animate({ d: y.point.haloPath(0) }); this.state = a
                        }
                    }, haloPath: function (a) { return this.series.chart.renderer.symbols.circle(Math.floor(this.plotX) - a, this.plotY - a, 2 * a, 2 * a) }
                }); v(b.prototype, {
                    onMouseOver: function () { var a = this.chart, b = a.hoverSeries; if (b && b !== this) b.onMouseOut(); this.options.events.mouseOver && l(this, "mouseOver"); this.setState("hover"); a.hoverSeries = this }, onMouseOut: function () {
                        var a = this.options, b = this.chart, c = b.tooltip, d = b.hoverPoint; b.hoverSeries = null; if (d) d.onMouseOut();
                        this && a.events.mouseOut && l(this, "mouseOut"); !c || a.stickyTracking || c.shared && !this.noSharedTooltip || c.hide(); this.setState()
                    }, setState: function (a) {
                        var b = this, c = b.options, d = b.graph, f = c.states, h = c.lineWidth, c = 0; a = a || ""; if (b.state !== a && (p([b.group, b.markerGroup], function (c) { c && (b.state && c.removeClass("highcharts-series-" + b.state), a && c.addClass("highcharts-series-" + a)) }), b.state = a, !f[a] || !1 !== f[a].enabled) && (a && (h = f[a].lineWidth || h + (f[a].lineWidthPlus || 0)), d && !d.dashstyle)) for (f = { "stroke-width": h }, d.attr(f); b["zone-graph-" +
                            c];)b["zone-graph-" + c].attr(f), c += 1
                    }, setVisible: function (a, b) {
                        var c = this, d = c.chart, e = c.legendItem, f, h = d.options.chart.ignoreHiddenSeries, m = c.visible; f = (c.visible = a = c.options.visible = c.userOptions.visible = void 0 === a ? !m : a) ? "show" : "hide"; p(["group", "dataLabelsGroup", "markerGroup", "tracker", "tt"], function (a) { if (c[a]) c[a][f]() }); if (d.hoverSeries === c || (d.hoverPoint && d.hoverPoint.series) === c) c.onMouseOut(); e && d.legend.colorizeItem(c, a); c.isDirty = !0; c.options.stacking && p(d.series, function (a) {
                            a.options.stacking &&
                                a.visible && (a.isDirty = !0)
                        }); p(c.linkedSeries, function (b) { b.setVisible(a, !1) }); h && (d.isDirtyBox = !0); !1 !== b && d.redraw(); l(c, f)
                    }, show: function () { this.setVisible(!0) }, hide: function () { this.setVisible(!1) }, select: function (a) { this.selected = a = void 0 === a ? !this.selected : a; this.checkbox && (this.checkbox.checked = a); l(this, a ? "select" : "unselect") }, drawTracker: a.drawTrackerGraph
                })
        })(L); (function (a) {
            var D = a.Chart, C = a.each, G = a.inArray, I = a.isObject, h = a.pick, f = a.splat; D.prototype.setResponsive = function (a) {
                var f = this.options.responsive;
                f && f.rules && C(f.rules, function (f) { this.matchResponsiveRule(f, a) }, this)
            }; D.prototype.matchResponsiveRule = function (f, v) {
                var l = this.respRules, p = f.condition, d; d = p.callback || function () { return this.chartWidth <= h(p.maxWidth, Number.MAX_VALUE) && this.chartHeight <= h(p.maxHeight, Number.MAX_VALUE) && this.chartWidth >= h(p.minWidth, 0) && this.chartHeight >= h(p.minHeight, 0) }; void 0 === f._id && (f._id = a.uniqueKey()); d = d.call(this); !l[f._id] && d ? f.chartOptions && (l[f._id] = this.currentOptions(f.chartOptions), this.update(f.chartOptions,
                    v)) : l[f._id] && !d && (this.update(l[f._id], v), delete l[f._id])
            }; D.prototype.currentOptions = function (a) { function h(a, d, c) { var l, p; for (l in a) if (-1 < G(l, ["series", "xAxis", "yAxis"])) for (a[l] = f(a[l]), c[l] = [], p = 0; p < a[l].length; p++)c[l][p] = {}, h(a[l][p], d[l][p], c[l][p]); else I(a[l]) ? (c[l] = {}, h(a[l], d[l] || {}, c[l])) : c[l] = d[l] || null } var l = {}; h(a, this.options, l); return l }
        })(L); return L
    });
</script>
<script type="text/javascript">/*
                         Highcharts JS v5.0.6 (2016-12-07)
                        
                         (c) 2009-2016 Torstein Honsi
                        
                         License: www.highcharts.com/license
                        */
    (function (n) { "object" === typeof module && module.exports ? module.exports = n : n(Highcharts) })(function (n) {
        (function (c) {
            var k = c.Axis, r = c.Chart, m = c.color, l, e = c.each, v = c.extend, w = c.isNumber, p = c.Legend, f = c.LegendSymbolMixin, x = c.noop, q = c.merge, u = c.pick, t = c.wrap; l = c.ColorAxis = function () { this.init.apply(this, arguments) }; v(l.prototype, k.prototype); v(l.prototype, {
                defaultColorAxisOptions: {
                    lineWidth: 0, minPadding: 0, maxPadding: 0, gridLineWidth: 1, tickPixelInterval: 72, startOnTick: !0, endOnTick: !0, offset: 0, marker: {
                        animation: { duration: 50 },
                        width: .01, color: "#999999"
                    }, labels: { overflow: "justify" }, minColor: "#e6ebf5", maxColor: "#003399", tickLength: 5, showInLegend: !0
                }, keepProps: ["legendGroup", "legendItem", "legendSymbol"].concat(k.prototype.keepProps), init: function (a, b) {
                    var d = "vertical" !== a.options.legend.layout, g; this.coll = "colorAxis"; g = q(this.defaultColorAxisOptions, { side: d ? 2 : 1, reversed: !d }, b, { opposite: !d, showEmpty: !1, title: null }); k.prototype.init.call(this, a, g); b.dataClasses && this.initDataClasses(b); this.initStops(b); this.horiz = d; this.zoomEnabled =
                        !1; this.defaultLegendLength = 200
                }, tweenColors: function (a, b, d) { var g; b.rgba.length && a.rgba.length ? (a = a.rgba, b = b.rgba, g = 1 !== b[3] || 1 !== a[3], a = (g ? "rgba(" : "rgb(") + Math.round(b[0] + (a[0] - b[0]) * (1 - d)) + "," + Math.round(b[1] + (a[1] - b[1]) * (1 - d)) + "," + Math.round(b[2] + (a[2] - b[2]) * (1 - d)) + (g ? "," + (b[3] + (a[3] - b[3]) * (1 - d)) : "") + ")") : a = b.input || "none"; return a }, initDataClasses: function (a) {
                    var b = this, d = this.chart, g, h = 0, c = d.options.chart.colorCount, y = this.options, f = a.dataClasses.length; this.dataClasses = g = []; this.legendItems =
                        []; e(a.dataClasses, function (a, e) { a = q(a); g.push(a); a.color || ("category" === y.dataClassColor ? (e = d.options.colors, c = e.length, a.color = e[h], a.colorIndex = h, h++, h === c && (h = 0)) : a.color = b.tweenColors(m(y.minColor), m(y.maxColor), 2 > f ? .5 : e / (f - 1))) })
                }, initStops: function (a) { this.stops = a.stops || [[0, this.options.minColor], [1, this.options.maxColor]]; e(this.stops, function (a) { a.color = m(a[1]) }) }, setOptions: function (a) { k.prototype.setOptions.call(this, a); this.options.crosshair = this.options.marker }, setAxisSize: function () {
                    var a =
                        this.legendSymbol, b = this.chart, d = b.options.legend || {}, g, h; a ? (this.left = d = a.attr("x"), this.top = g = a.attr("y"), this.width = h = a.attr("width"), this.height = a = a.attr("height"), this.right = b.chartWidth - d - h, this.bottom = b.chartHeight - g - a, this.len = this.horiz ? h : a, this.pos = this.horiz ? d : g) : this.len = (this.horiz ? d.symbolWidth : d.symbolHeight) || this.defaultLegendLength
                }, toColor: function (a, b) {
                    var d = this.stops, g, h, c = this.dataClasses, e, f; if (c) for (f = c.length; f--;) {
                        if (e = c[f], g = e.from, d = e.to, (void 0 === g || a >= g) && (void 0 ===
                            d || a <= d)) { h = e.color; b && (b.dataClass = f, b.colorIndex = e.colorIndex); break }
                    } else { this.isLog && (a = this.val2lin(a)); a = 1 - (this.max - a) / (this.max - this.min || 1); for (f = d.length; f-- && !(a > d[f][0]);); g = d[f] || d[f + 1]; d = d[f + 1] || g; a = 1 - (d[0] - a) / (d[0] - g[0] || 1); h = this.tweenColors(g.color, d.color, a) } return h
                }, getOffset: function () {
                    var a = this.legendGroup, b = this.chart.axisOffset[this.side]; a && (this.axisParent = a, k.prototype.getOffset.call(this), this.added || (this.added = !0, this.labelLeft = 0, this.labelRight = this.width), this.chart.axisOffset[this.side] =
                        b)
                }, setLegendColor: function () { var a, b = this.options, d = this.reversed; a = d ? 1 : 0; d = d ? 0 : 1; a = this.horiz ? [a, 0, d, 0] : [0, d, 0, a]; this.legendColor = { linearGradient: { x1: a[0], y1: a[1], x2: a[2], y2: a[3] }, stops: b.stops || [[0, b.minColor], [1, b.maxColor]] } }, drawLegendSymbol: function (a, b) {
                    var d = a.padding, g = a.options, h = this.horiz, c = u(g.symbolWidth, h ? this.defaultLegendLength : 12), f = u(g.symbolHeight, h ? 12 : this.defaultLegendLength), e = u(g.labelPadding, h ? 16 : 30), g = u(g.itemDistance, 10); this.setLegendColor(); b.legendSymbol = this.chart.renderer.rect(0,
                        a.baseline - 11, c, f).attr({ zIndex: 1 }).add(b.legendGroup); this.legendItemWidth = c + d + (h ? g : e); this.legendItemHeight = f + d + (h ? e : 0)
                }, setState: x, visible: !0, setVisible: x, getSeriesExtremes: function () { var a; this.series.length && (a = this.series[0], this.dataMin = a.valueMin, this.dataMax = a.valueMax) }, drawCrosshair: function (a, b) {
                    var d = b && b.plotX, c = b && b.plotY, h, f = this.pos, e = this.len; b && (h = this.toPixels(b[b.series.colorKey]), h < f ? h = f - 2 : h > f + e && (h = f + e + 2), b.plotX = h, b.plotY = this.len - h, k.prototype.drawCrosshair.call(this, a, b),
                        b.plotX = d, b.plotY = c, this.cross && (this.cross.addClass("highcharts-coloraxis-marker").add(this.legendGroup), this.cross.attr({ fill: this.crosshair.color })))
                }, getPlotLinePath: function (a, b, d, c, h) { return w(h) ? this.horiz ? ["M", h - 4, this.top - 6, "L", h + 4, this.top - 6, h, this.top, "Z"] : ["M", this.left, h, "L", this.left - 6, h + 6, this.left - 6, h - 6, "Z"] : k.prototype.getPlotLinePath.call(this, a, b, d, c) }, update: function (a, b) {
                    var d = this.chart, c = d.legend; e(this.series, function (a) { a.isDirtyData = !0 }); a.dataClasses && c.allItems && (e(c.allItems,
                        function (a) { a.isDataClass && a.legendGroup.destroy() }), d.isDirtyLegend = !0); d.options[this.coll] = q(this.userOptions, a); k.prototype.update.call(this, a, b); this.legendItem && (this.setLegendColor(), c.colorizeItem(this, !0))
                }, getDataClassLegendSymbols: function () {
                    var a = this, b = this.chart, d = this.legendItems, g = b.options.legend, h = g.valueDecimals, t = g.valueSuffix || "", k; d.length || e(this.dataClasses, function (g, p) {
                        var l = !0, q = g.from, m = g.to; k = ""; void 0 === q ? k = "\x3c " : void 0 === m && (k = "\x3e "); void 0 !== q && (k += c.numberFormat(q,
                            h) + t); void 0 !== q && void 0 !== m && (k += " - "); void 0 !== m && (k += c.numberFormat(m, h) + t); d.push(v({ chart: b, name: k, options: {}, drawLegendSymbol: f.drawRectangle, visible: !0, setState: x, isDataClass: !0, setVisible: function () { l = this.visible = !l; e(a.series, function (a) { e(a.points, function (a) { a.dataClass === p && a.setVisible(l) }) }); b.legend.colorizeItem(this, l) } }, g))
                    }); return d
                }, name: ""
            }); e(["fill", "stroke"], function (a) {
                c.Fx.prototype[a + "Setter"] = function () {
                    this.elem.attr(a, l.prototype.tweenColors(m(this.start), m(this.end),
                        this.pos), null, !0)
                }
            }); t(r.prototype, "getAxes", function (a) { var b = this.options.colorAxis; a.call(this); this.colorAxis = []; b && new l(this, b) }); t(p.prototype, "getAllItems", function (a) { var b = [], d = this.chart.colorAxis[0]; d && d.options && (d.options.showInLegend && (d.options.dataClasses ? b = b.concat(d.getDataClassLegendSymbols()) : b.push(d)), e(d.series, function (a) { a.options.showInLegend = !1 })); return b.concat(a.call(this)) }); t(p.prototype, "colorizeItem", function (a, b, d) { a.call(this, b, d); d && b.legendColor && b.legendSymbol.attr({ fill: b.legendColor }) })
        })(n);
        (function (c) {
            var k = c.defined, r = c.each, m = c.noop, l = c.seriesTypes; c.colorPointMixin = { isValid: function () { return null !== this.value }, setVisible: function (c) { var e = this, k = c ? "show" : "hide"; r(["graphic", "dataLabel"], function (c) { if (e[c]) e[c][k]() }) }, setState: function (e) { c.Point.prototype.setState.call(this, e); this.graphic && this.graphic.attr({ zIndex: "hover" === e ? 1 : 0 }) } }; c.colorSeriesMixin = {
                pointArrayMap: ["value"], axisTypes: ["xAxis", "yAxis", "colorAxis"], optionalAxis: "colorAxis", trackerGroups: ["group", "markerGroup",
                    "dataLabelsGroup"], getSymbol: m, parallelArrays: ["x", "y", "value"], colorKey: "value", pointAttribs: l.column.prototype.pointAttribs, translateColors: function () { var c = this, k = this.options.nullColor, l = this.colorAxis, m = this.colorKey; r(this.data, function (f) { var e = f[m]; if (e = f.options.color || (f.isNull ? k : l && void 0 !== e ? l.toColor(e, f) : f.color || c.color)) f.color = e }) }, colorAttribs: function (c) { var e = {}; k(c.color) && (e[this.colorProp || "fill"] = c.color); return e }
            }
        })(n); (function (c) {
            var k = c.colorPointMixin, r = c.each, m = c.merge,
                l = c.noop, e = c.pick, n = c.Series, w = c.seriesType, p = c.seriesTypes; w("heatmap", "scatter", { animation: !1, borderWidth: 0, nullColor: "#f7f7f7", dataLabels: { formatter: function () { return this.point.value }, inside: !0, verticalAlign: "middle", crop: !1, overflow: !1, padding: 0 }, marker: null, pointRange: null, tooltip: { pointFormat: "{point.x}, {point.y}: {point.value}\x3cbr/\x3e" }, states: { normal: { animation: !0 }, hover: { halo: !1, brightness: .2 } } }, m(c.colorSeriesMixin, {
                    pointArrayMap: ["y", "value"], hasPointSpecificOptions: !0, supportsDrilldown: !0,
                    getExtremesFromAll: !0, directTouch: !0, init: function () { var c; p.scatter.prototype.init.apply(this, arguments); c = this.options; c.pointRange = e(c.pointRange, c.colsize || 1); this.yAxis.axisPointRange = c.rowsize || 1 }, translate: function () {
                        var c = this.options, e = this.xAxis, k = this.yAxis, l = function (c, a, b) { return Math.min(Math.max(a, c), b) }; this.generatePoints(); r(this.points, function (f) {
                            var a = (c.colsize || 1) / 2, b = (c.rowsize || 1) / 2, d = l(Math.round(e.len - e.translate(f.x - a, 0, 1, 0, 1)), -e.len, 2 * e.len), a = l(Math.round(e.len - e.translate(f.x +
                                a, 0, 1, 0, 1)), -e.len, 2 * e.len), g = l(Math.round(k.translate(f.y - b, 0, 1, 0, 1)), -k.len, 2 * k.len), b = l(Math.round(k.translate(f.y + b, 0, 1, 0, 1)), -k.len, 2 * k.len); f.plotX = f.clientX = (d + a) / 2; f.plotY = (g + b) / 2; f.shapeType = "rect"; f.shapeArgs = { x: Math.min(d, a), y: Math.min(g, b), width: Math.abs(a - d), height: Math.abs(b - g) }
                        }); this.translateColors()
                    }, drawPoints: function () { p.column.prototype.drawPoints.call(this); r(this.points, function (c) { c.graphic.attr(this.colorAttribs(c)) }, this) }, animate: l, getBox: l, drawLegendSymbol: c.LegendSymbolMixin.drawRectangle,
                    alignDataLabel: p.column.prototype.alignDataLabel, getExtremes: function () { n.prototype.getExtremes.call(this, this.valueData); this.valueMin = this.dataMin; this.valueMax = this.dataMax; n.prototype.getExtremes.call(this) }
                }), k)
        })(n)
    });
</script>
<script type="text/javascript">/*
                         Highcharts JS v5.0.6 (2016-12-07)
                         Exporting module
                        
                         (c) 2010-2016 Torstein Honsi
                        
                         License: www.highcharts.com/license
                        */
    (function (h) { "object" === typeof module && module.exports ? module.exports = h : h(Highcharts) })(function (h) {
        (function (f) {
            var h = f.defaultOptions, n = f.doc, A = f.Chart, u = f.addEvent, F = f.removeEvent, D = f.fireEvent, q = f.createElement, B = f.discardElement, v = f.css, p = f.merge, C = f.pick, k = f.each, r = f.extend, G = f.isTouchDevice, E = f.win, H = f.Renderer.prototype.symbols; r(h.lang, {
                printChart: "Print chart", downloadPNG: "Download PNG image", downloadJPEG: "Download JPEG image", downloadPDF: "Download PDF document", downloadSVG: "Download SVG vector image",
                contextButtonTitle: "Chart context menu"
            }); h.navigation = { buttonOptions: { theme: {}, symbolSize: 14, symbolX: 12.5, symbolY: 10.5, align: "right", buttonSpacing: 3, height: 22, verticalAlign: "top", width: 24 } }; p(!0, h.navigation, {
                menuStyle: { border: "1px solid #999999", background: "#ffffff", padding: "5px 0" }, menuItemStyle: { padding: "0.5em 1em", background: "none", color: "#333333", fontSize: G ? "14px" : "11px", transition: "background 250ms, color 250ms" }, menuItemHoverStyle: { background: "#335cad", color: "#ffffff" }, buttonOptions: {
                    symbolFill: "#666666",
                    symbolStroke: "#666666", symbolStrokeWidth: 3, theme: { fill: "#ffffff", stroke: "none", padding: 5 }
                }
            }); h.exporting = {
                type: "image/png", url: "https://export.highcharts.com/", printMaxWidth: 780, scale: 2, buttons: {
                    contextButton: {
                        className: "highcharts-contextbutton", menuClassName: "highcharts-contextmenu", symbol: "menu", _titleKey: "contextButtonTitle", menuItems: [{ textKey: "printChart", onclick: function () { this.print() } }, { separator: !0 }, { textKey: "downloadPNG", onclick: function () { this.exportChart() } }, { textKey: "downloadJPEG", onclick: function () { this.exportChart({ type: "image/jpeg" }) } },
                        { textKey: "downloadPDF", onclick: function () { this.exportChart({ type: "application/pdf" }) } }, { textKey: "downloadSVG", onclick: function () { this.exportChart({ type: "image/svg+xml" }) } }]
                    }
                }
            }; f.post = function (a, c, e) { var b; a = q("form", p({ method: "post", action: a, enctype: "multipart/form-data" }, e), { display: "none" }, n.body); for (b in c) q("input", { type: "hidden", name: b, value: c[b] }, null, a); a.submit(); B(a) }; r(A.prototype, {
                sanitizeSVG: function (a, c) {
                    if (c && c.exporting && c.exporting.allowHTML) {
                        var e = a.match(/<\/svg>(.*?$)/); e && (e =
                            '\x3cforeignObject x\x3d"0" y\x3d"0" width\x3d"' + c.chart.width + '" height\x3d"' + c.chart.height + '"\x3e\x3cbody xmlns\x3d"http://www.w3.org/1999/xhtml"\x3e' + e[1] + "\x3c/body\x3e\x3c/foreignObject\x3e", a = a.replace("\x3c/svg\x3e", e + "\x3c/svg\x3e"))
                    } a = a.replace(/zIndex="[^"]+"/g, "").replace(/isShadow="[^"]+"/g, "").replace(/symbolName="[^"]+"/g, "").replace(/jQuery[0-9]+="[^"]+"/g, "").replace(/url\(("|&quot;)(\S+)("|&quot;)\)/g, "url($2)").replace(/url\([^#]+#/g, "url(#").replace(/<svg /, '\x3csvg xmlns:xlink\x3d"http://www.w3.org/1999/xlink" ').replace(/ (NS[0-9]+\:)?href=/g,
                        " xlink:href\x3d").replace(/\n/, " ").replace(/<\/svg>.*?$/, "\x3c/svg\x3e").replace(/(fill|stroke)="rgba\(([ 0-9]+,[ 0-9]+,[ 0-9]+),([ 0-9\.]+)\)"/g, '$1\x3d"rgb($2)" $1-opacity\x3d"$3"').replace(/&nbsp;/g, "\u00a0").replace(/&shy;/g, "\u00ad"); return a = a.replace(/<IMG /g, "\x3cimage ").replace(/<(\/?)TITLE>/g, "\x3c$1title\x3e").replace(/height=([^" ]+)/g, 'height\x3d"$1"').replace(/width=([^" ]+)/g, 'width\x3d"$1"').replace(/hc-svg-href="([^"]+)">/g, 'xlink:href\x3d"$1"/\x3e').replace(/ id=([^" >]+)/g, ' id\x3d"$1"').replace(/class=([^" >]+)/g,
                            'class\x3d"$1"').replace(/ transform /g, " ").replace(/:(path|rect)/g, "$1").replace(/style="([^"]+)"/g, function (a) { return a.toLowerCase() })
                }, getChartHTML: function () { return this.container.innerHTML }, getSVG: function (a) {
                    var c, e, b, w, m, g = p(this.options, a); n.createElementNS || (n.createElementNS = function (a, c) { return n.createElement(c) }); e = q("div", null, { position: "absolute", top: "-9999em", width: this.chartWidth + "px", height: this.chartHeight + "px" }, n.body); b = this.renderTo.style.width; m = this.renderTo.style.height;
                    b = g.exporting.sourceWidth || g.chart.width || /px$/.test(b) && parseInt(b, 10) || 600; m = g.exporting.sourceHeight || g.chart.height || /px$/.test(m) && parseInt(m, 10) || 400; r(g.chart, { animation: !1, renderTo: e, forExport: !0, renderer: "SVGRenderer", width: b, height: m }); g.exporting.enabled = !1; delete g.data; g.series = []; k(this.series, function (a) { w = p(a.userOptions, { animation: !1, enableMouseTracking: !1, showCheckbox: !1, visible: a.visible }); w.isInternal || g.series.push(w) }); k(this.axes, function (a) { a.userOptions.internalKey = f.uniqueKey() });
                    c = new f.Chart(g, this.callback); a && k(["xAxis", "yAxis", "series"], function (b) { var d = {}; a[b] && (d[b] = a[b], c.update(d)) }); k(this.axes, function (a) { var b = f.find(c.axes, function (b) { return b.options.internalKey === a.userOptions.internalKey }), d = a.getExtremes(), e = d.userMin, d = d.userMax; !b || void 0 === e && void 0 === d || b.setExtremes(e, d, !0, !1) }); b = c.getChartHTML(); b = this.sanitizeSVG(b, g); g = null; c.destroy(); B(e); return b
                }, getSVGForExport: function (a, c) {
                    var e = this.options.exporting; return this.getSVG(p({ chart: { borderRadius: 0 } },
                        e.chartOptions, c, { exporting: { sourceWidth: a && a.sourceWidth || e.sourceWidth, sourceHeight: a && a.sourceHeight || e.sourceHeight } }))
                }, exportChart: function (a, c) { c = this.getSVGForExport(a, c); a = p(this.options.exporting, a); f.post(a.url, { filename: a.filename || "chart", type: a.type, width: a.width || 0, scale: a.scale, svg: c }, a.formAttributes) }, print: function () {
                    var a = this, c = a.container, e = [], b = c.parentNode, f = n.body, m = f.childNodes, g = a.options.exporting.printMaxWidth, d, t; if (!a.isPrinting) {
                        a.isPrinting = !0; a.pointer.reset(null,
                            0); D(a, "beforePrint"); if (t = g && a.chartWidth > g) d = [a.options.chart.width, void 0, !1], a.setSize(g, void 0, !1); k(m, function (a, b) { 1 === a.nodeType && (e[b] = a.style.display, a.style.display = "none") }); f.appendChild(c); E.focus(); E.print(); setTimeout(function () { b.appendChild(c); k(m, function (a, b) { 1 === a.nodeType && (a.style.display = e[b]) }); a.isPrinting = !1; t && a.setSize.apply(a, d); D(a, "afterPrint") }, 1E3)
                    }
                }, contextMenu: function (a, c, e, b, f, m, g) {
                    var d = this, t = d.options.navigation, w = d.chartWidth, h = d.chartHeight, p = "cache-" + a,
                        l = d[p], x = Math.max(f, m), y, z; l || (d[p] = l = q("div", { className: a }, { position: "absolute", zIndex: 1E3, padding: x + "px" }, d.container), y = q("div", { className: "highcharts-menu" }, null, l), v(y, r({ MozBoxShadow: "3px 3px 10px #888", WebkitBoxShadow: "3px 3px 10px #888", boxShadow: "3px 3px 10px #888" }, t.menuStyle)), z = function () { v(l, { display: "none" }); g && g.setState(0); d.openMenu = !1 }, u(l, "mouseleave", function () { l.hideTimer = setTimeout(z, 500) }), u(l, "mouseenter", function () { clearTimeout(l.hideTimer) }), p = u(n, "mouseup", function (b) {
                            d.pointer.inClass(b.target,
                                a) || z()
                        }), u(d, "destroy", p), k(c, function (a) { if (a) { var b; a.separator ? b = q("hr", null, null, y) : (b = q("div", { className: "highcharts-menu-item", onclick: function (b) { b && b.stopPropagation(); z(); a.onclick && a.onclick.apply(d, arguments) }, innerHTML: a.text || d.options.lang[a.textKey] }, null, y), b.onmouseover = function () { v(this, t.menuItemHoverStyle) }, b.onmouseout = function () { v(this, t.menuItemStyle) }, v(b, r({ cursor: "pointer" }, t.menuItemStyle))); d.exportDivElements.push(b) } }), d.exportDivElements.push(y, l), d.exportMenuWidth =
                            l.offsetWidth, d.exportMenuHeight = l.offsetHeight); c = { display: "block" }; e + d.exportMenuWidth > w ? c.right = w - e - f - x + "px" : c.left = e - x + "px"; b + m + d.exportMenuHeight > h && "top" !== g.alignOptions.verticalAlign ? c.bottom = h - b - x + "px" : c.top = b + m - x + "px"; v(l, c); d.openMenu = !0
                }, addButton: function (a) {
                    var c = this, e = c.renderer, b = p(c.options.navigation.buttonOptions, a), f = b.onclick, m = b.menuItems, g, d, h = b.symbolSize || 12; c.btnCount || (c.btnCount = 0); c.exportDivElements || (c.exportDivElements = [], c.exportSVGElements = []); if (!1 !== b.enabled) {
                        var k =
                            b.theme, n = k.states, q = n && n.hover, n = n && n.select, l; delete k.states; f ? l = function (a) { a.stopPropagation(); f.call(c, a) } : m && (l = function () { c.contextMenu(d.menuClassName, m, d.translateX, d.translateY, d.width, d.height, d); d.setState(2) }); b.text && b.symbol ? k.paddingLeft = C(k.paddingLeft, 25) : b.text || r(k, { width: b.width, height: b.height, padding: 0 }); d = e.button(b.text, 0, 0, l, k, q, n).addClass(a.className).attr({ "stroke-linecap": "round", title: c.options.lang[b._titleKey], zIndex: 3 }); d.menuClassName = a.menuClassName || "highcharts-menu-" +
                                c.btnCount++; b.symbol && (g = e.symbol(b.symbol, b.symbolX - h / 2, b.symbolY - h / 2, h, h).addClass("highcharts-button-symbol").attr({ zIndex: 1 }).add(d), g.attr({ stroke: b.symbolStroke, fill: b.symbolFill, "stroke-width": b.symbolStrokeWidth || 1 })); d.add().align(r(b, { width: d.width, x: C(b.x, c.buttonOffset) }), !0, "spacingBox"); c.buttonOffset += (d.width + b.buttonSpacing) * ("right" === b.align ? -1 : 1); c.exportSVGElements.push(d, g)
                    }
                }, destroyExport: function (a) {
                    var c = a ? a.target : this; a = c.exportSVGElements; var e = c.exportDivElements; a &&
                        (k(a, function (a, e) { a && (a.onclick = a.ontouchstart = null, c.exportSVGElements[e] = a.destroy()) }), a.length = 0); e && (k(e, function (a, e) { clearTimeout(a.hideTimer); F(a, "mouseleave"); c.exportDivElements[e] = a.onmouseout = a.onmouseover = a.ontouchstart = a.onclick = null; B(a) }), e.length = 0)
                }
            }); H.menu = function (a, c, e, b) { return ["M", a, c + 2.5, "L", a + e, c + 2.5, "M", a, c + b / 2 + .5, "L", a + e, c + b / 2 + .5, "M", a, c + b - 1.5, "L", a + e, c + b - 1.5] }; A.prototype.renderExporting = function () {
                var a, c = this.options.exporting, e = c.buttons, b = this.isDirtyExporting || !this.exportSVGElements;
                this.buttonOffset = 0; this.isDirtyExporting && this.destroyExport(); if (b && !1 !== c.enabled) { for (a in e) this.addButton(e[a]); this.isDirtyExporting = !1 } u(this, "destroy", this.destroyExport)
            }; A.prototype.callbacks.push(function (a) { a.renderExporting(); u(a, "redraw", a.renderExporting); k(["exporting", "navigation"], function (c) { a[c] = { update: function (e, b) { a.isDirtyExporting = !0; p(!0, a.options[c], e); C(b, !0) && a.redraw() } } }) })
        })(h)
    });
</script>
<script type="text/javascript">/*
                         Highcharts JS v5.0.6 (2016-12-07)
                         Client side exporting module
                        
                         (c) 2015 Torstein Honsi / Oystein Moseng
                        
                         License: www.highcharts.com/license
                        */
    (function (h) { "object" === typeof module && module.exports ? module.exports = h : h(Highcharts) })(function (h) {
        (function (a) {
            function w(d, a) { var c = t.getElementsByTagName("head")[0], b = t.createElement("script"); b.type = "text/javascript"; b.src = d; b.onload = a; b.onerror = function () { console.error("Error loading script", d) }; c.appendChild(b) } var h = a.merge, e = a.win, u = e.navigator, t = e.document, y = a.each, A = e.URL || e.webkitURL || e, B = /Edge\/|Trident\/|MSIE /.test(u.userAgent), C = B ? 150 : 0; a.CanVGRenderer = {}; a.downloadURL = function (d, a) {
                var c =
                    t.createElement("a"), b; if (u.msSaveOrOpenBlob) u.msSaveOrOpenBlob(d, a); else if (void 0 !== c.download) c.href = d, c.download = a, c.target = "_blank", t.body.appendChild(c), c.click(), t.body.removeChild(c); else try { if (b = e.open(d, "chart"), void 0 === b || null === b) throw "Failed to open window"; } catch (v) { e.location.href = d }
            }; a.svgToDataUrl = function (d) {
                var a = -1 < u.userAgent.indexOf("WebKit") && 0 > u.userAgent.indexOf("Chrome"); try { if (!a && 0 > u.userAgent.toLowerCase().indexOf("firefox")) return A.createObjectURL(new e.Blob([d], { type: "image/svg+xml;charset-utf-16" })) } catch (c) { } return "data:image/svg+xml;charset\x3dUTF-8," +
                    encodeURIComponent(d)
            }; a.imageToDataUrl = function (a, f, c, b, v, l, k, m, p) {
                var d = new e.Image, g, r = function () { setTimeout(function () { var n = t.createElement("canvas"), e = n.getContext && n.getContext("2d"), x; try { if (e) { n.height = d.height * b; n.width = d.width * b; e.drawImage(d, 0, 0, n.width, n.height); try { x = n.toDataURL(f), v(x, f, c, b) } catch (D) { g(a, f, c, b) } } else k(a, f, c, b) } finally { p && p(a, f, c, b) } }, C) }, q = function () { m(a, f, c, b); p && p(a, f, c, b) }; g = function () { d = new e.Image; g = l; d.crossOrigin = "Anonymous"; d.onload = r; d.onerror = q; d.src = a };
                d.onload = r; d.onerror = q; d.src = a
            }; a.downloadSVGLocal = function (d, f, c, b) {
                function v(b, a) { a = new e.jsPDF("l", "pt", [b.width.baseVal.value + 2 * a, b.height.baseVal.value + 2 * a]); e.svgElementToPdf(b, a, { removeInvalid: !0 }); return a.output("datauristring") } function l() {
                    r.innerHTML = d; var c = r.getElementsByTagName("text"), e, g = r.getElementsByTagName("svg")[0].style; y(c, function (a) {
                        y(["font-family", "font-size"], function (b) { !a.style[b] && g[b] && (a.style[b] = g[b]) }); a.style["font-family"] = a.style["font-family"] && a.style["font-family"].split(" ").splice(-1);
                        e = a.getElementsByTagName("title"); y(e, function (b) { a.removeChild(b) })
                    }); c = v(r.firstChild, 0); a.downloadURL(c, n); b && b()
                } var k, m, p = !0, z, g = f.libURL || a.getOptions().exporting.libURL, r = t.createElement("div"), q = f.type || "image/png", n = (f.filename || "chart") + "." + ("image/svg+xml" === q ? "svg" : q.split("/")[1]), h = f.scale || 1, g = "/" !== g.slice(-1) ? g + "/" : g; if ("image/svg+xml" === q) try { u.msSaveOrOpenBlob ? (m = new MSBlobBuilder, m.append(d), k = m.getBlob("image/svg+xml")) : k = a.svgToDataUrl(d), a.downloadURL(k, n), b && b() } catch (x) { c() } else "application/pdf" ===
                    q ? e.jsPDF && e.svgElementToPdf ? l() : (p = !0, w(g + "jspdf.js", function () { w(g + "rgbcolor.js", function () { w(g + "svg2pdf.js", function () { l() }) }) })) : (k = a.svgToDataUrl(d), z = function () { try { A.revokeObjectURL(k) } catch (x) { } }, a.imageToDataUrl(k, q, {}, h, function (d) { try { a.downloadURL(d, n), b && b() } catch (D) { c() } }, function () {
                        var f = t.createElement("canvas"), v = f.getContext("2d"), l = d.match(/^<svg[^>]*width\s*=\s*\"?(\d+)\"?[^>]*>/)[1] * h, k = d.match(/^<svg[^>]*height\s*=\s*\"?(\d+)\"?[^>]*>/)[1] * h, m = function () {
                            v.drawSvg(d, 0, 0, l, k);
                            try { a.downloadURL(u.msSaveOrOpenBlob ? f.msToBlob() : f.toDataURL(q), n), b && b() } catch (E) { c() } finally { z() }
                        }; f.width = l; f.height = k; e.canvg ? m() : (p = !0, w(g + "rgbcolor.js", function () { w(g + "canvg.js", function () { m() }) }))
                    }, c, c, function () { p && z() }))
            }; a.Chart.prototype.getSVGForLocalExport = function (d, f, c, b) {
                var e = this, l, k = 0, m, p, h, g, r, q = function (a, d, c) { ++k; c.imageElement.setAttributeNS("http://www.w3.org/1999/xlink", "href", a); k === l.length && b(e.sanitizeSVG(m.innerHTML, p)) }; a.wrap(a.Chart.prototype, "getChartHTML", function (a) {
                    var b =
                        a.apply(this, Array.prototype.slice.call(arguments, 1)); p = this.options; m = this.container.cloneNode(!0); return b
                }); e.getSVGForExport(d, f); l = m.getElementsByTagName("image"); try { if (l.length) for (g = 0, r = l.length; g < r; ++g)h = l[g], a.imageToDataUrl(h.getAttributeNS("http://www.w3.org/1999/xlink", "href"), "image/png", { imageElement: h }, d.scale, q, c, c, c); else b(e.sanitizeSVG(m.innerHTML, p)) } catch (n) { c() }
            }; a.Chart.prototype.exportChartLocal = function (d, e) {
                var c = this, b = a.merge(c.options.exporting, d), f = function () {
                    if (!1 ===
                        b.fallbackToExportServer) if (b.error) b.error(); else throw "Fallback to export server disabled"; else c.exportChart(b)
                }; (B && "image/svg+xml" !== b.type || "application/pdf" === b.type) && c.container.getElementsByTagName("image").length ? f() : c.getSVGForLocalExport(b, e, f, function (c) { -1 < c.indexOf("\x3cforeignObject") && "image/svg+xml" !== b.type ? f() : a.downloadSVGLocal(c, b, f) })
            }; h(!0, a.getOptions().exporting, {
                libURL: "https://code.highcharts.com/5.0.6/lib/", buttons: {
                    contextButton: {
                        menuItems: [{ textKey: "printChart", onclick: function () { this.print() } },
                        { separator: !0 }, { textKey: "downloadPNG", onclick: function () { this.exportChartLocal() } }, { textKey: "downloadJPEG", onclick: function () { this.exportChartLocal({ type: "image/jpeg" }) } }, { textKey: "downloadSVG", onclick: function () { this.exportChartLocal({ type: "image/svg+xml" }) } }, { textKey: "downloadPDF", onclick: function () { this.exportChartLocal({ type: "application/pdf" }) } }]
                    }
                }
            })
        })(h)
    });
</script>
<script type="text/javascript">/**
                         * A Highcharts plugin for exporting data from a rendered chart as CSV, XLS or HTML table
                         * https://github.com/highcharts/export-csv
                         * Commit: d5d2b83ca6588f06166b74e779288ea683e69cc5
                         *
                         * Author:   Torstein Honsi
                         * Licence:  MIT
                         * Version:  1.4.7
                         */
    !function (a) { "object" == typeof module && module.exports ? module.exports = a : a(Highcharts) }(function (a) { "use strict"; function f(b, c, d, f, g) { var h, i, j, k = (b.options.exporting || {}).csv || {}, l = k.url || "http://www.highcharts.com/studies/csv-export/download.php"; j = b.options.exporting.filename ? b.options.exporting.filename : b.title ? b.title.textStr.replace(/ /g, "-").toLowerCase() : "chart", window.Blob && window.navigator.msSaveOrOpenBlob ? (i = new Blob([f]), window.navigator.msSaveOrOpenBlob(i, j + "." + d)) : e ? (h = document.createElement("a"), h.href = c, h.target = "_blank", h.download = j + "." + d, b.container.append(h), h.click(), h.remove()) : a.post(l, { data: f, type: g, extension: d }) } var b = a.each, c = a.pick, d = a.seriesTypes, e = void 0 !== document.createElement("a").download; a.setOptions({ lang: { downloadCSV: "Download CSV", downloadXLS: "Download XLS", viewData: "View data table" } }), a.Chart.prototype.getDataRows = function () { var e, i, k, l, m, d = (this.options.exporting || {}).csv || {}, f = this.xAxis, g = {}, h = [], j = [], n = d.dateFormat || "%Y-%m-%d %H:%M:%S", o = d.columnHeaderFormatter || function (b, c, d) { return b instanceof a.Axis ? b.options.title && b.options.title.text || (b.isDatetimeAxis ? "DateTime" : "Category") : b ? b.name + (d > 1 ? " (" + c + ")" : "") : "Category" }, p = []; k = 0, b(this.series, function (d) { var q, e = d.options.keys, h = e || d.pointArrayMap || ["y"], i = h.length, l = d.requireSorting, m = {}, n = a.inArray(d.xAxis, f); if (b(h, function (a) { m[a] = d[a + "Axis"] && d[a + "Axis"].categories || [] }), !1 !== d.options.includeInCSVExport && !1 !== d.visible) { for (a.find(p, function (a) { return a[0] === n }) || p.push([n, k]), q = 0; q < i;)j.push(o(d, h[q], h.length)), q += 1; b(d.points, function (a, b) { var f, j, e = l ? a.x : b; for (q = 0, g[e] || (g[e] = [], g[e].xValues = []), g[e].x = a.x, g[e].xValues[n] = a.x, d.xAxis && "name" !== d.exportKey || (g[e].name = a.name); q < i;)f = h[q], j = a[f], g[e][k + q] = c(m[f][j], j), q += 1 }), k += q } }); for (l in g) g.hasOwnProperty(l) && h.push(g[l]); var r, s; for (i = [j], k = p.length; k--;)r = p[k][0], s = p[k][1], e = f[r], h.sort(function (a, b) { return a.xValues[r] - b.xValues[r] }), m = o(e), i[0].splice(s, 0, m), b(h, function (b) { var d = b.name; d || (e.isDatetimeAxis ? (b.x instanceof Date && (b.x = b.x.getTime()), d = a.dateFormat(n, b.x)) : d = e.categories ? c(e.names[b.x], e.categories[b.x], b.x) : b.x), b.splice(s, 0, d) }); return i = i.concat(h) }, a.Chart.prototype.getCSV = function (a) { var c = "", d = this.getDataRows(), e = (this.options.exporting || {}).csv || {}, f = e.itemDelimiter || ",", g = e.lineDelimiter || "\n"; return b(d, function (b, e) { for (var h = "", i = b.length, j = a ? 1.1.toLocaleString()[1] : "."; i--;)h = b[i], "string" == typeof h && (h = '"' + h + '"'), "number" == typeof h && "," === j && (h = h.toString().replace(".", ",")), b[i] = h; c += b.join(f), e < d.length - 1 && (c += g) }), c }, a.Chart.prototype.getTable = function (a) { var c = "<table><thead>", d = this.getDataRows(); return b(d, function (b, d) { var f, g, e = d ? "td" : "th", h = a ? 1.1.toLocaleString()[1] : "."; for (c += "<tr>", g = 0; g < b.length; g += 1)f = b[g], "number" == typeof f ? (f = f.toString(), "," === h && (f = f.replace(".", h)), c += "<" + e + ' class="number">' + f + "</" + e + ">") : c += "<" + e + ">" + (void 0 === f ? "" : f) + "</" + e + ">"; c += "</tr>", d || (c += "</thead><tbody>") }), c += "</tbody></table>" }, a.Chart.prototype.downloadCSV = function () { var a = this.getCSV(!0); f(this, "data:text/csv,\ufeff" + encodeURIComponent(a), "csv", a, "text/csv") }, a.Chart.prototype.downloadXLS = function () { var b = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head>\x3c!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>Ark1</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--\x3e<style>td{border:none;font-family: Calibri, sans-serif;} .number{mso-number-format:"0.00";}</style><meta name=ProgId content=Excel.Sheet><meta charset=UTF-8></head><body>' + this.getTable(!0) + "</body></html>"; f(this, "data:application/vnd.ms-excel;base64," + function (a) { return window.btoa(unescape(encodeURIComponent(a))) }(b), "xls", b, "application/vnd.ms-excel") }, a.Chart.prototype.viewData = function () { this.dataTableDiv || (this.dataTableDiv = document.createElement("div"), this.dataTableDiv.className = "highcharts-data-table", this.renderTo.parentNode.insertBefore(this.dataTableDiv, this.renderTo.nextSibling)), this.dataTableDiv.innerHTML = this.getTable() }, a.getOptions().exporting && a.getOptions().exporting.buttons.contextButton.menuItems.push({ textKey: "downloadCSV", onclick: function () { this.downloadCSV() } }, { textKey: "downloadXLS", onclick: function () { this.downloadXLS() } }, { textKey: "viewData", onclick: function () { this.viewData() } }), d.map && (d.map.prototype.exportKey = "name"), d.mapbubble && (d.mapbubble.prototype.exportKey = "name"), d.treemap && (d.treemap.prototype.exportKey = "name") });</script>
<script type="text/javascript">
    (function ($) {
        $.extend({
            tablesorter: new
                function () {
                    var parsers = [], widgets = []; this.defaults = { cssHeader: "header", cssAsc: "headerSortUp", cssDesc: "headerSortDown", cssChildRow: "expand-child", sortInitialOrder: "asc", sortMultiSortKey: "shiftKey", sortForce: null, sortAppend: null, sortLocaleCompare: true, textExtraction: "simple", parsers: {}, widgets: [], widgetZebra: { css: ["even", "odd"] }, headers: {}, widthFixed: false, cancelSelection: true, sortList: [], headerList: [], dateFormat: "us", decimal: '/\.|\,/g', onRenderHeader: null, selectorHeaders: 'thead th', debug: false }; function benchmark(s, d) { log(s + "," + (new Date().getTime() - d.getTime()) + "ms"); } this.benchmark = benchmark; function log(s) { if (typeof console != "undefined" && typeof console.debug != "undefined") { console.log(s); } else { alert(s); } } function buildParserCache(table, $headers) { if (table.config.debug) { var parsersDebug = ""; } if (table.tBodies.length == 0) return; var rows = table.tBodies[0].rows; if (rows[0]) { var list = [], cells = rows[0].cells, l = cells.length; for (var i = 0; i < l; i++) { var p = false; if ($.metadata && ($($headers[i]).metadata() && $($headers[i]).metadata().sorter)) { p = getParserById($($headers[i]).metadata().sorter); } else if ((table.config.headers[i] && table.config.headers[i].sorter)) { p = getParserById(table.config.headers[i].sorter); } if (!p) { p = detectParserForColumn(table, rows, -1, i); } if (table.config.debug) { parsersDebug += "column:" + i + " parser:" + p.id + "\n"; } list.push(p); } } if (table.config.debug) { log(parsersDebug); } return list; }; function detectParserForColumn(table, rows, rowIndex, cellIndex) { var l = parsers.length, node = false, nodeValue = false, keepLooking = true; while (nodeValue == '' && keepLooking) { rowIndex++; if (rows[rowIndex]) { node = getNodeFromRowAndCellIndex(rows, rowIndex, cellIndex); nodeValue = trimAndGetNodeText(table.config, node); if (table.config.debug) { log('Checking if value was empty on row:' + rowIndex); } } else { keepLooking = false; } } for (var i = 1; i < l; i++) { if (parsers[i].is(nodeValue, table, node)) { return parsers[i]; } } return parsers[0]; } function getNodeFromRowAndCellIndex(rows, rowIndex, cellIndex) { return rows[rowIndex].cells[cellIndex]; } function trimAndGetNodeText(config, node) { return $.trim(getElementText(config, node)); } function getParserById(name) { var l = parsers.length; for (var i = 0; i < l; i++) { if (parsers[i].id.toLowerCase() == name.toLowerCase()) { return parsers[i]; } } return false; } function buildCache(table) { if (table.config.debug) { var cacheTime = new Date(); } var totalRows = (table.tBodies[0] && table.tBodies[0].rows.length) || 0, totalCells = (table.tBodies[0].rows[0] && table.tBodies[0].rows[0].cells.length) || 0, parsers = table.config.parsers, cache = { row: [], normalized: [] }; for (var i = 0; i < totalRows; ++i) { var c = $(table.tBodies[0].rows[i]), cols = []; if (c.hasClass(table.config.cssChildRow)) { cache.row[cache.row.length - 1] = cache.row[cache.row.length - 1].add(c); continue; } cache.row.push(c); for (var j = 0; j < totalCells; ++j) { cols.push(parsers[j].format(getElementText(table.config, c[0].cells[j]), table, c[0].cells[j])); } cols.push(cache.normalized.length); cache.normalized.push(cols); cols = null; }; if (table.config.debug) { benchmark("Building cache for " + totalRows + " rows:", cacheTime); } return cache; }; function getElementText(config, node) { var text = ""; if (!node) return ""; if (!config.supportsTextContent) config.supportsTextContent = node.textContent || false; if (config.textExtraction == "simple") { if (config.supportsTextContent) { text = node.textContent; } else { if (node.childNodes[0] && node.childNodes[0].hasChildNodes()) { text = node.childNodes[0].innerHTML; } else { text = node.innerHTML; } } } else { if (typeof (config.textExtraction) == "function") { text = config.textExtraction(node); } else { text = $(node).text(); } } return text; } function appendToTable(table, cache) { if (table.config.debug) { var appendTime = new Date() } var c = cache, r = c.row, n = c.normalized, totalRows = n.length, checkCell = (n[0].length - 1), tableBody = $(table.tBodies[0]), rows = []; for (var i = 0; i < totalRows; i++) { var pos = n[i][checkCell]; rows.push(r[pos]); if (!table.config.appender) { var l = r[pos].length; for (var j = 0; j < l; j++) { tableBody[0].appendChild(r[pos][j]); } } } if (table.config.appender) { table.config.appender(table, rows); } rows = null; if (table.config.debug) { benchmark("Rebuilt table:", appendTime); } applyWidget(table); setTimeout(function () { $(table).trigger("sortEnd"); }, 0); }; function buildHeaders(table) { if (table.config.debug) { var time = new Date(); } var meta = ($.metadata) ? true : false; var header_index = computeTableHeaderCellIndexes(table); $tableHeaders = $(table.config.selectorHeaders, table).each(function (index) { this.column = header_index[this.parentNode.rowIndex + "-" + this.cellIndex]; this.order = formatSortingOrder(table.config.sortInitialOrder); this.count = this.order; if (checkHeaderMetadata(this) || checkHeaderOptions(table, index)) this.sortDisabled = true; if (checkHeaderOptionsSortingLocked(table, index)) this.order = this.lockedOrder = checkHeaderOptionsSortingLocked(table, index); if (!this.sortDisabled) { var $th = $(this).addClass(table.config.cssHeader); if (table.config.onRenderHeader) table.config.onRenderHeader.apply($th); } table.config.headerList[index] = this; }); if (table.config.debug) { benchmark("Built headers:", time); log($tableHeaders); } return $tableHeaders; }; function computeTableHeaderCellIndexes(t) {
                        var matrix = []; var lookup = {}; var thead = t.getElementsByTagName('THEAD')[0]; var trs = thead.getElementsByTagName('TR'); for (var i = 0; i < trs.length; i++) {
                            var cells = trs[i].cells; for (var j = 0; j < cells.length; j++) {
                                var c = cells[j]; var rowIndex = c.parentNode.rowIndex; var cellId = rowIndex + "-" + c.cellIndex; var rowSpan = c.rowSpan || 1; var colSpan = c.colSpan || 1
                                var firstAvailCol; if (typeof (matrix[rowIndex]) == "undefined") { matrix[rowIndex] = []; } for (var k = 0; k < matrix[rowIndex].length + 1; k++) { if (typeof (matrix[rowIndex][k]) == "undefined") { firstAvailCol = k; break; } } lookup[cellId] = firstAvailCol; for (var k = rowIndex; k < rowIndex + rowSpan; k++) { if (typeof (matrix[k]) == "undefined") { matrix[k] = []; } var matrixrow = matrix[k]; for (var l = firstAvailCol; l < firstAvailCol + colSpan; l++) { matrixrow[l] = "x"; } }
                            }
                        } return lookup;
                    } function checkCellColSpan(table, rows, row) { var arr = [], r = table.tHead.rows, c = r[row].cells; for (var i = 0; i < c.length; i++) { var cell = c[i]; if (cell.colSpan > 1) { arr = arr.concat(checkCellColSpan(table, headerArr, row++)); } else { if (table.tHead.length == 1 || (cell.rowSpan > 1 || !r[row + 1])) { arr.push(cell); } } } return arr; }; function checkHeaderMetadata(cell) { if (($.metadata) && ($(cell).metadata().sorter === false)) { return true; }; return false; } function checkHeaderOptions(table, i) { if ((table.config.headers[i]) && (table.config.headers[i].sorter === false)) { return true; }; return false; } function checkHeaderOptionsSortingLocked(table, i) { if ((table.config.headers[i]) && (table.config.headers[i].lockedOrder)) return table.config.headers[i].lockedOrder; return false; } function applyWidget(table) { var c = table.config.widgets; var l = c.length; for (var i = 0; i < l; i++) { getWidgetById(c[i]).format(table); } } function getWidgetById(name) { var l = widgets.length; for (var i = 0; i < l; i++) { if (widgets[i].id.toLowerCase() == name.toLowerCase()) { return widgets[i]; } } }; function formatSortingOrder(v) { if (typeof (v) != "Number") { return (v.toLowerCase() == "desc") ? 1 : 0; } else { return (v == 1) ? 1 : 0; } } function isValueInArray(v, a) { var l = a.length; for (var i = 0; i < l; i++) { if (a[i][0] == v) { return true; } } return false; } function setHeadersCss(table, $headers, list, css) { $headers.removeClass(css[0]).removeClass(css[1]); var h = []; $headers.each(function (offset) { if (!this.sortDisabled) { h[this.column] = $(this); } }); var l = list.length; for (var i = 0; i < l; i++) { h[list[i][0]].addClass(css[list[i][1]]); } } function fixColumnWidth(table, $headers) { var c = table.config; if (c.widthFixed) { var colgroup = $('<colgroup>'); $("tr:first td", table.tBodies[0]).each(function () { colgroup.append($('<col>').css('width', $(this).width())); }); $(table).prepend(colgroup); }; } function updateHeaderSortCount(table, sortList) { var c = table.config, l = sortList.length; for (var i = 0; i < l; i++) { var s = sortList[i], o = c.headerList[s[0]]; o.count = s[1]; o.count++; } } function multisort(table, sortList, cache) { if (table.config.debug) { var sortTime = new Date(); } var dynamicExp = "var sortWrapper = function(a,b) {", l = sortList.length; for (var i = 0; i < l; i++) { var c = sortList[i][0]; var order = sortList[i][1]; var s = (table.config.parsers[c].type == "text") ? ((order == 0) ? makeSortFunction("text", "asc", c) : makeSortFunction("text", "desc", c)) : ((order == 0) ? makeSortFunction("numeric", "asc", c) : makeSortFunction("numeric", "desc", c)); var e = "e" + i; dynamicExp += "var " + e + " = " + s; dynamicExp += "if(" + e + ") { return " + e + "; } "; dynamicExp += "else { "; } var orgOrderCol = cache.normalized[0].length - 1; dynamicExp += "return a[" + orgOrderCol + "]-b[" + orgOrderCol + "];"; for (var i = 0; i < l; i++) { dynamicExp += "}; "; } dynamicExp += "return 0; "; dynamicExp += "}; "; if (table.config.debug) { benchmark("Evaling expression:" + dynamicExp, new Date()); } eval(dynamicExp); cache.normalized.sort(sortWrapper); if (table.config.debug) { benchmark("Sorting on " + sortList.toString() + " and dir " + order + " time:", sortTime); } return cache; }; function makeSortFunction(type, direction, index) { var a = "a[" + index + "]", b = "b[" + index + "]"; if (type == 'text' && direction == 'asc') { return "(" + a + " == " + b + " ? 0 : (" + a + " === null ? Number.POSITIVE_INFINITY : (" + b + " === null ? Number.NEGATIVE_INFINITY : (" + a + " < " + b + ") ? -1 : 1 )));"; } else if (type == 'text' && direction == 'desc') { return "(" + a + " == " + b + " ? 0 : (" + a + " === null ? Number.POSITIVE_INFINITY : (" + b + " === null ? Number.NEGATIVE_INFINITY : (" + b + " < " + a + ") ? -1 : 1 )));"; } else if (type == 'numeric' && direction == 'asc') { return "(" + a + " === null && " + b + " === null) ? 0 :(" + a + " === null ? Number.POSITIVE_INFINITY : (" + b + " === null ? Number.NEGATIVE_INFINITY : " + a + " - " + b + "));"; } else if (type == 'numeric' && direction == 'desc') { return "(" + a + " === null && " + b + " === null) ? 0 :(" + a + " === null ? Number.POSITIVE_INFINITY : (" + b + " === null ? Number.NEGATIVE_INFINITY : " + b + " - " + a + "));"; } }; function makeSortText(i) { return "((a[" + i + "] < b[" + i + "]) ? -1 : ((a[" + i + "] > b[" + i + "]) ? 1 : 0));"; }; function makeSortTextDesc(i) { return "((b[" + i + "] < a[" + i + "]) ? -1 : ((b[" + i + "] > a[" + i + "]) ? 1 : 0));"; }; function makeSortNumeric(i) { return "a[" + i + "]-b[" + i + "];"; }; function makeSortNumericDesc(i) { return "b[" + i + "]-a[" + i + "];"; }; function sortText(a, b) { if (table.config.sortLocaleCompare) return a.localeCompare(b); return ((a < b) ? -1 : ((a > b) ? 1 : 0)); }; function sortTextDesc(a, b) { if (table.config.sortLocaleCompare) return b.localeCompare(a); return ((b < a) ? -1 : ((b > a) ? 1 : 0)); }; function sortNumeric(a, b) { return a - b; }; function sortNumericDesc(a, b) { return b - a; }; function getCachedSortType(parsers, i) { return parsers[i].type; }; this.construct = function (settings) { return this.each(function () { if (!this.tHead || !this.tBodies) return; var $this, $document, $headers, cache, config, shiftDown = 0, sortOrder; this.config = {}; config = $.extend(this.config, $.tablesorter.defaults, settings); $this = $(this); $.data(this, "tablesorter", config); $headers = buildHeaders(this); this.config.parsers = buildParserCache(this, $headers); cache = buildCache(this); var sortCSS = [config.cssDesc, config.cssAsc]; fixColumnWidth(this); $headers.click(function (e) { var totalRows = ($this[0].tBodies[0] && $this[0].tBodies[0].rows.length) || 0; if (!this.sortDisabled && totalRows > 0) { $this.trigger("sortStart"); var $cell = $(this); var i = this.column; this.order = this.count++ % 2; if (this.lockedOrder) this.order = this.lockedOrder; if (!e[config.sortMultiSortKey]) { config.sortList = []; if (config.sortForce != null) { var a = config.sortForce; for (var j = 0; j < a.length; j++) { if (a[j][0] != i) { config.sortList.push(a[j]); } } } config.sortList.push([i, this.order]); } else { if (isValueInArray(i, config.sortList)) { for (var j = 0; j < config.sortList.length; j++) { var s = config.sortList[j], o = config.headerList[s[0]]; if (s[0] == i) { o.count = s[1]; o.count++; s[1] = o.count % 2; } } } else { config.sortList.push([i, this.order]); } }; setTimeout(function () { setHeadersCss($this[0], $headers, config.sortList, sortCSS); appendToTable($this[0], multisort($this[0], config.sortList, cache)); }, 1); return false; } }).mousedown(function () { if (config.cancelSelection) { this.onselectstart = function () { return false }; return false; } }); $this.bind("update", function () { var me = this; setTimeout(function () { me.config.parsers = buildParserCache(me, $headers); cache = buildCache(me); }, 1); }).bind("updateCell", function (e, cell) { var config = this.config; var pos = [(cell.parentNode.rowIndex - 1), cell.cellIndex]; cache.normalized[pos[0]][pos[1]] = config.parsers[pos[1]].format(getElementText(config, cell), cell); }).bind("sorton", function (e, list) { $(this).trigger("sortStart"); config.sortList = list; var sortList = config.sortList; updateHeaderSortCount(this, sortList); setHeadersCss(this, $headers, sortList, sortCSS); appendToTable(this, multisort(this, sortList, cache)); }).bind("appendCache", function () { appendToTable(this, cache); }).bind("applyWidgetId", function (e, id) { getWidgetById(id).format(this); }).bind("applyWidgets", function () { applyWidget(this); }); if ($.metadata && ($(this).metadata() && $(this).metadata().sortlist)) { config.sortList = $(this).metadata().sortlist; } if (config.sortList.length > 0) { $this.trigger("sorton", [config.sortList]); } applyWidget(this); }); }; this.addParser = function (parser) { var l = parsers.length, a = true; for (var i = 0; i < l; i++) { if (parsers[i].id.toLowerCase() == parser.id.toLowerCase()) { a = false; } } if (a) { parsers.push(parser); }; }; this.addWidget = function (widget) { widgets.push(widget); }; this.formatFloat = function (s) { var i = parseFloat(s); return (isNaN(i)) ? 0 : i; }; this.formatInt = function (s) { var i = parseInt(s); return (isNaN(i)) ? 0 : i; }; this.isDigit = function (s, config) { return /^[-+]?\d*$/.test($.trim(s.replace(/[,.']/g, ''))); }; this.clearTableBody = function (table) { if ($.browser.msie) { function empty() { while (this.firstChild) this.removeChild(this.firstChild); } empty.apply(table.tBodies[0]); } else { table.tBodies[0].innerHTML = ""; } };
                }
        }); $.fn.extend({ tablesorter: $.tablesorter.construct }); var ts = $.tablesorter; ts.addParser({ id: "text", is: function (s) { return true; }, format: function (s) { return $.trim(s.toLocaleLowerCase()); }, type: "text" }); ts.addParser({ id: "digit", is: function (s, table) { var c = table.config; return $.tablesorter.isDigit(s, c); }, format: function (s) { return $.tablesorter.formatFloat(s); }, type: "numeric" }); ts.addParser({ id: "currency", is: function (s) { return /^[£$€?.]/.test(s); }, format: function (s) { return $.tablesorter.formatFloat(s.replace(new RegExp(/[£$€]/g), "")); }, type: "numeric" }); ts.addParser({ id: "ipAddress", is: function (s) { return /^\d{2,3}[\.]\d{2,3}[\.]\d{2,3}[\.]\d{2,3}$/.test(s); }, format: function (s) { var a = s.split("."), r = "", l = a.length; for (var i = 0; i < l; i++) { var item = a[i]; if (item.length == 2) { r += "0" + item; } else { r += item; } } return $.tablesorter.formatFloat(r); }, type: "numeric" }); ts.addParser({ id: "url", is: function (s) { return /^(https?|ftp|file):\/\/$/.test(s); }, format: function (s) { return jQuery.trim(s.replace(new RegExp(/(https?|ftp|file):\/\//), '')); }, type: "text" }); ts.addParser({ id: "isoDate", is: function (s) { return /^\d{4}[\/-]\d{1,2}[\/-]\d{1,2}$/.test(s); }, format: function (s) { return $.tablesorter.formatFloat((s != "") ? new Date(s.replace(new RegExp(/-/g), "/")).getTime() : "0"); }, type: "numeric" }); ts.addParser({ id: "percent", is: function (s) { return /\%$/.test($.trim(s)); }, format: function (s) { return $.tablesorter.formatFloat(s.replace(new RegExp(/%/g), "")); }, type: "numeric" }); ts.addParser({ id: "usLongDate", is: function (s) { return s.match(new RegExp(/^[A-Za-z]{3,10}\.? [0-9]{1,2}, ([0-9]{4}|'?[0-9]{2}) (([0-2]?[0-9]:[0-5][0-9])|([0-1]?[0-9]:[0-5][0-9]\s(AM|PM)))$/)); }, format: function (s) { return $.tablesorter.formatFloat(new Date(s).getTime()); }, type: "numeric" }); ts.addParser({ id: "shortDate", is: function (s) { return /\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4}/.test(s); }, format: function (s, table) { var c = table.config; s = s.replace(/\-/g, "/"); if (c.dateFormat == "us") { s = s.replace(/(\d{1,2})[\/\-](\d{1,2})[\/\-](\d{4})/, "$3/$1/$2"); } else if (c.dateFormat == "pt") { s = s.replace(/(\d{1,2})[\/\-](\d{1,2})[\/\-](\d{4})/, "$3/$2/$1"); } else if (c.dateFormat == "uk") { s = s.replace(/(\d{1,2})[\/\-](\d{1,2})[\/\-](\d{4})/, "$3/$2/$1"); } else if (c.dateFormat == "dd/mm/yy" || c.dateFormat == "dd-mm-yy") { s = s.replace(/(\d{1,2})[\/\-](\d{1,2})[\/\-](\d{2})/, "$1/$2/$3"); } return $.tablesorter.formatFloat(new Date(s).getTime()); }, type: "numeric" }); ts.addParser({ id: "time", is: function (s) { return /^(([0-2]?[0-9]:[0-5][0-9])|([0-1]?[0-9]:[0-5][0-9]\s(am|pm)))$/.test(s); }, format: function (s) { return $.tablesorter.formatFloat(new Date("2000/01/01 " + s).getTime()); }, type: "numeric" }); ts.addParser({ id: "metadata", is: function (s) { return false; }, format: function (s, table, cell) { var c = table.config, p = (!c.parserMetadataName) ? 'sortValue' : c.parserMetadataName; return $(cell).metadata()[p]; }, type: "numeric" }); ts.addWidget({ id: "zebra", format: function (table) { if (table.config.debug) { var time = new Date(); } var $tr, row = -1, odd; $("tr:visible", table.tBodies[0]).each(function (i) { $tr = $(this); if (!$tr.hasClass(table.config.cssChildRow)) row++; odd = (row % 2 == 0); $tr.removeClass(table.config.widgetZebra.css[odd ? 0 : 1]).addClass(table.config.widgetZebra.css[odd ? 1 : 0]) }); if (table.config.debug) { $.tablesorter.benchmark("Applying Zebra widget", time); } } });
    })(jQuery);
</script>
<script type="text/javascript">/*!
                         * clipboard.js v1.5.16
                         * https://zenorocha.github.io/clipboard.js
                         *
                         * Licensed MIT © Zeno Rocha
                         */
    !function (e) { if ("object" == typeof exports && "undefined" != typeof module) module.exports = e(); else if ("function" == typeof define && define.amd) define([], e); else { var t; t = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof self ? self : this, t.Clipboard = e() } }(function () { var e, t, n; return function e(t, n, i) { function o(a, c) { if (!n[a]) { if (!t[a]) { var l = "function" == typeof require && require; if (!c && l) return l(a, !0); if (r) return r(a, !0); var s = new Error("Cannot find module '" + a + "'"); throw s.code = "MODULE_NOT_FOUND", s } var u = n[a] = { exports: {} }; t[a][0].call(u.exports, function (e) { var n = t[a][1][e]; return o(n ? n : e) }, u, u.exports, e, t, n, i) } return n[a].exports } for (var r = "function" == typeof require && require, a = 0; a < i.length; a++)o(i[a]); return o }({ 1: [function (e, t, n) { function i(e, t) { for (; e && e.nodeType !== o;) { if (e.matches(t)) return e; e = e.parentNode } } var o = 9; if (Element && !Element.prototype.matches) { var r = Element.prototype; r.matches = r.matchesSelector || r.mozMatchesSelector || r.msMatchesSelector || r.oMatchesSelector || r.webkitMatchesSelector } t.exports = i }, {}], 2: [function (e, t, n) { function i(e, t, n, i, r) { var a = o.apply(this, arguments); return e.addEventListener(n, a, r), { destroy: function () { e.removeEventListener(n, a, r) } } } function o(e, t, n, i) { return function (n) { n.delegateTarget = r(n.target, t), n.delegateTarget && i.call(e, n) } } var r = e("./closest"); t.exports = i }, { "./closest": 1 }], 3: [function (e, t, n) { n.node = function (e) { return void 0 !== e && e instanceof HTMLElement && 1 === e.nodeType }, n.nodeList = function (e) { var t = Object.prototype.toString.call(e); return void 0 !== e && ("[object NodeList]" === t || "[object HTMLCollection]" === t) && "length" in e && (0 === e.length || n.node(e[0])) }, n.string = function (e) { return "string" == typeof e || e instanceof String }, n.fn = function (e) { var t = Object.prototype.toString.call(e); return "[object Function]" === t } }, {}], 4: [function (e, t, n) { function i(e, t, n) { if (!e && !t && !n) throw new Error("Missing required arguments"); if (!c.string(t)) throw new TypeError("Second argument must be a String"); if (!c.fn(n)) throw new TypeError("Third argument must be a Function"); if (c.node(e)) return o(e, t, n); if (c.nodeList(e)) return r(e, t, n); if (c.string(e)) return a(e, t, n); throw new TypeError("First argument must be a String, HTMLElement, HTMLCollection, or NodeList") } function o(e, t, n) { return e.addEventListener(t, n), { destroy: function () { e.removeEventListener(t, n) } } } function r(e, t, n) { return Array.prototype.forEach.call(e, function (e) { e.addEventListener(t, n) }), { destroy: function () { Array.prototype.forEach.call(e, function (e) { e.removeEventListener(t, n) }) } } } function a(e, t, n) { return l(document.body, e, t, n) } var c = e("./is"), l = e("delegate"); t.exports = i }, { "./is": 3, delegate: 2 }], 5: [function (e, t, n) { function i(e) { var t; if ("SELECT" === e.nodeName) e.focus(), t = e.value; else if ("INPUT" === e.nodeName || "TEXTAREA" === e.nodeName) e.focus(), e.setSelectionRange(0, e.value.length), t = e.value; else { e.hasAttribute("contenteditable") && e.focus(); var n = window.getSelection(), i = document.createRange(); i.selectNodeContents(e), n.removeAllRanges(), n.addRange(i), t = n.toString() } return t } t.exports = i }, {}], 6: [function (e, t, n) { function i() { } i.prototype = { on: function (e, t, n) { var i = this.e || (this.e = {}); return (i[e] || (i[e] = [])).push({ fn: t, ctx: n }), this }, once: function (e, t, n) { function i() { o.off(e, i), t.apply(n, arguments) } var o = this; return i._ = t, this.on(e, i, n) }, emit: function (e) { var t = [].slice.call(arguments, 1), n = ((this.e || (this.e = {}))[e] || []).slice(), i = 0, o = n.length; for (i; i < o; i++)n[i].fn.apply(n[i].ctx, t); return this }, off: function (e, t) { var n = this.e || (this.e = {}), i = n[e], o = []; if (i && t) for (var r = 0, a = i.length; r < a; r++)i[r].fn !== t && i[r].fn._ !== t && o.push(i[r]); return o.length ? n[e] = o : delete n[e], this } }, t.exports = i }, {}], 7: [function (t, n, i) { !function (o, r) { if ("function" == typeof e && e.amd) e(["module", "select"], r); else if ("undefined" != typeof i) r(n, t("select")); else { var a = { exports: {} }; r(a, o.select), o.clipboardAction = a.exports } }(this, function (e, t) { "use strict"; function n(e) { return e && e.__esModule ? e : { default: e } } function i(e, t) { if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function") } var o = n(t), r = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (e) { return typeof e } : function (e) { return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e }, a = function () { function e(e, t) { for (var n = 0; n < t.length; n++) { var i = t[n]; i.enumerable = i.enumerable || !1, i.configurable = !0, "value" in i && (i.writable = !0), Object.defineProperty(e, i.key, i) } } return function (t, n, i) { return n && e(t.prototype, n), i && e(t, i), t } }(), c = function () { function e(t) { i(this, e), this.resolveOptions(t), this.initSelection() } return a(e, [{ key: "resolveOptions", value: function e() { var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}; this.action = t.action, this.emitter = t.emitter, this.target = t.target, this.text = t.text, this.trigger = t.trigger, this.selectedText = "" } }, { key: "initSelection", value: function e() { this.text ? this.selectFake() : this.target && this.selectTarget() } }, { key: "selectFake", value: function e() { var t = this, n = "rtl" == document.documentElement.getAttribute("dir"); this.removeFake(), this.fakeHandlerCallback = function () { return t.removeFake() }, this.fakeHandler = document.body.addEventListener("click", this.fakeHandlerCallback) || !0, this.fakeElem = document.createElement("textarea"), this.fakeElem.style.fontSize = "12pt", this.fakeElem.style.border = "0", this.fakeElem.style.padding = "0", this.fakeElem.style.margin = "0", this.fakeElem.style.position = "absolute", this.fakeElem.style[n ? "right" : "left"] = "-9999px"; var i = window.pageYOffset || document.documentElement.scrollTop; this.fakeElem.addEventListener("focus", window.scrollTo(0, i)), this.fakeElem.style.top = i + "px", this.fakeElem.setAttribute("readonly", ""), this.fakeElem.value = this.text, document.body.appendChild(this.fakeElem), this.selectedText = (0, o.default)(this.fakeElem), this.copyText() } }, { key: "removeFake", value: function e() { this.fakeHandler && (document.body.removeEventListener("click", this.fakeHandlerCallback), this.fakeHandler = null, this.fakeHandlerCallback = null), this.fakeElem && (document.body.removeChild(this.fakeElem), this.fakeElem = null) } }, { key: "selectTarget", value: function e() { this.selectedText = (0, o.default)(this.target), this.copyText() } }, { key: "copyText", value: function e() { var t = void 0; try { t = document.execCommand(this.action) } catch (e) { t = !1 } this.handleResult(t) } }, { key: "handleResult", value: function e(t) { this.emitter.emit(t ? "success" : "error", { action: this.action, text: this.selectedText, trigger: this.trigger, clearSelection: this.clearSelection.bind(this) }) } }, { key: "clearSelection", value: function e() { this.target && this.target.blur(), window.getSelection().removeAllRanges() } }, { key: "destroy", value: function e() { this.removeFake() } }, { key: "action", set: function e() { var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "copy"; if (this._action = t, "copy" !== this._action && "cut" !== this._action) throw new Error('Invalid "action" value, use either "copy" or "cut"') }, get: function e() { return this._action } }, { key: "target", set: function e(t) { if (void 0 !== t) { if (!t || "object" !== ("undefined" == typeof t ? "undefined" : r(t)) || 1 !== t.nodeType) throw new Error('Invalid "target" value, use a valid Element'); if ("copy" === this.action && t.hasAttribute("disabled")) throw new Error('Invalid "target" attribute. Please use "readonly" instead of "disabled" attribute'); if ("cut" === this.action && (t.hasAttribute("readonly") || t.hasAttribute("disabled"))) throw new Error('Invalid "target" attribute. You can\'t cut text from elements with "readonly" or "disabled" attributes'); this._target = t } }, get: function e() { return this._target } }]), e }(); e.exports = c }) }, { select: 5 }], 8: [function (t, n, i) { !function (o, r) { if ("function" == typeof e && e.amd) e(["module", "./clipboard-action", "tiny-emitter", "good-listener"], r); else if ("undefined" != typeof i) r(n, t("./clipboard-action"), t("tiny-emitter"), t("good-listener")); else { var a = { exports: {} }; r(a, o.clipboardAction, o.tinyEmitter, o.goodListener), o.clipboard = a.exports } }(this, function (e, t, n, i) { "use strict"; function o(e) { return e && e.__esModule ? e : { default: e } } function r(e, t) { if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function") } function a(e, t) { if (!e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); return !t || "object" != typeof t && "function" != typeof t ? e : t } function c(e, t) { if ("function" != typeof t && null !== t) throw new TypeError("Super expression must either be null or a function, not " + typeof t); e.prototype = Object.create(t && t.prototype, { constructor: { value: e, enumerable: !1, writable: !0, configurable: !0 } }), t && (Object.setPrototypeOf ? Object.setPrototypeOf(e, t) : e.__proto__ = t) } function l(e, t) { var n = "data-clipboard-" + e; if (t.hasAttribute(n)) return t.getAttribute(n) } var s = o(t), u = o(n), f = o(i), d = function () { function e(e, t) { for (var n = 0; n < t.length; n++) { var i = t[n]; i.enumerable = i.enumerable || !1, i.configurable = !0, "value" in i && (i.writable = !0), Object.defineProperty(e, i.key, i) } } return function (t, n, i) { return n && e(t.prototype, n), i && e(t, i), t } }(), h = function (e) { function t(e, n) { r(this, t); var i = a(this, (t.__proto__ || Object.getPrototypeOf(t)).call(this)); return i.resolveOptions(n), i.listenClick(e), i } return c(t, e), d(t, [{ key: "resolveOptions", value: function e() { var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}; this.action = "function" == typeof t.action ? t.action : this.defaultAction, this.target = "function" == typeof t.target ? t.target : this.defaultTarget, this.text = "function" == typeof t.text ? t.text : this.defaultText } }, { key: "listenClick", value: function e(t) { var n = this; this.listener = (0, f.default)(t, "click", function (e) { return n.onClick(e) }) } }, { key: "onClick", value: function e(t) { var n = t.delegateTarget || t.currentTarget; this.clipboardAction && (this.clipboardAction = null), this.clipboardAction = new s.default({ action: this.action(n), target: this.target(n), text: this.text(n), trigger: n, emitter: this }) } }, { key: "defaultAction", value: function e(t) { return l("action", t) } }, { key: "defaultTarget", value: function e(t) { var n = l("target", t); if (n) return document.querySelector(n) } }, { key: "defaultText", value: function e(t) { return l("text", t) } }, { key: "destroy", value: function e() { this.listener.destroy(), this.clipboardAction && (this.clipboardAction.destroy(), this.clipboardAction = null) } }]), t }(u.default); e.exports = h }) }, { "./clipboard-action": 7, "good-listener": 4, "tiny-emitter": 6 }] }, {}, [8])(8) });</script>
<script type="text/javascript">/*! @source http://purl.eligrey.com/github/FileSaver.js/blob/master/FileSaver.js */
    var saveAs = saveAs || function (e) { "use strict"; if (typeof e === "undefined" || typeof navigator !== "undefined" && /MSIE [1-9]\./.test(navigator.userAgent)) { return } var t = e.document, n = function () { return e.URL || e.webkitURL || e }, r = t.createElementNS("http://www.w3.org/1999/xhtml", "a"), o = "download" in r, a = function (e) { var t = new MouseEvent("click"); e.dispatchEvent(t) }, i = /constructor/i.test(e.HTMLElement) || e.safari, f = /CriOS\/[\d]+/.test(navigator.userAgent), u = function (t) { (e.setImmediate || e.setTimeout)(function () { throw t }, 0) }, s = "application/octet-stream", d = 1e3 * 40, c = function (e) { var t = function () { if (typeof e === "string") { n().revokeObjectURL(e) } else { e.remove() } }; setTimeout(t, d) }, l = function (e, t, n) { t = [].concat(t); var r = t.length; while (r--) { var o = e["on" + t[r]]; if (typeof o === "function") { try { o.call(e, n || e) } catch (a) { u(a) } } } }, p = function (e) { if (/^\s*(?:text\/\S*|application\/xml|\S*\/\S*\+xml)\s*;.*charset\s*=\s*utf-8/i.test(e.type)) { return new Blob([String.fromCharCode(65279), e], { type: e.type }) } return e }, v = function (t, u, d) { if (!d) { t = p(t) } var v = this, w = t.type, m = w === s, y, h = function () { l(v, "writestart progress write writeend".split(" ")) }, S = function () { if ((f || m && i) && e.FileReader) { var r = new FileReader; r.onloadend = function () { var t = f ? r.result : r.result.replace(/^data:[^;]*;/, "data:attachment/file;"); var n = e.open(t, "_blank"); if (!n) e.location.href = t; t = undefined; v.readyState = v.DONE; h() }; r.readAsDataURL(t); v.readyState = v.INIT; return } if (!y) { y = n().createObjectURL(t) } if (m) { e.location.href = y } else { var o = e.open(y, "_blank"); if (!o) { e.location.href = y } } v.readyState = v.DONE; h(); c(y) }; v.readyState = v.INIT; if (o) { y = n().createObjectURL(t); setTimeout(function () { r.href = y; r.download = u; a(r); h(); c(y); v.readyState = v.DONE }); return } S() }, w = v.prototype, m = function (e, t, n) { return new v(e, t || e.name || "download", n) }; if (typeof navigator !== "undefined" && navigator.msSaveOrOpenBlob) { return function (e, t, n) { t = t || e.name || "download"; if (!n) { e = p(e) } return navigator.msSaveOrOpenBlob(e, t) } } w.abort = function () { }; w.readyState = w.INIT = 0; w.WRITING = 1; w.DONE = 2; w.error = w.onwritestart = w.onprogress = w.onwrite = w.onabort = w.onerror = w.onwriteend = null; return m }(typeof self !== "undefined" && self || typeof window !== "undefined" && window || this.content); if (typeof module !== "undefined" && module.exports) { module.exports.saveAs = saveAs } else if (typeof define !== "undefined" && define !== null && define.amd !== null) { define("FileSaver.js", function () { return saveAs }) }
</script>
<script type="text/javascript">var LZString = function () { function o(o, r) { if (!t[o]) { t[o] = {}; for (var n = 0; n < o.length; n++)t[o][o.charAt(n)] = n } return t[o][r] } var r = String.fromCharCode, n = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=", e = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+-$", t = {}, i = { compressToBase64: function (o) { if (null == o) return ""; var r = i._compress(o, 6, function (o) { return n.charAt(o) }); switch (r.length % 4) { default: case 0: return r; case 1: return r + "==="; case 2: return r + "=="; case 3: return r + "=" } }, decompressFromBase64: function (r) { return null == r ? "" : "" == r ? null : i._decompress(r.length, 32, function (e) { return o(n, r.charAt(e)) }) }, compressToUTF16: function (o) { return null == o ? "" : i._compress(o, 15, function (o) { return r(o + 32) }) + " " }, decompressFromUTF16: function (o) { return null == o ? "" : "" == o ? null : i._decompress(o.length, 16384, function (r) { return o.charCodeAt(r) - 32 }) }, compressToUint8Array: function (o) { for (var r = i.compress(o), n = new Uint8Array(2 * r.length), e = 0, t = r.length; t > e; e++) { var s = r.charCodeAt(e); n[2 * e] = s >>> 8, n[2 * e + 1] = s % 256 } return n }, decompressFromUint8Array: function (o) { if (null === o || void 0 === o) return i.decompress(o); for (var n = new Array(o.length / 2), e = 0, t = n.length; t > e; e++)n[e] = 256 * o[2 * e] + o[2 * e + 1]; var s = []; return n.forEach(function (o) { s.push(r(o)) }), i.decompress(s.join("")) }, compressToEncodedURIComponent: function (o) { return null == o ? "" : i._compress(o, 6, function (o) { return e.charAt(o) }) }, decompressFromEncodedURIComponent: function (r) { return null == r ? "" : "" == r ? null : (r = r.replace(/ /g, "+"), i._decompress(r.length, 32, function (n) { return o(e, r.charAt(n)) })) }, compress: function (o) { return i._compress(o, 16, function (o) { return r(o) }) }, _compress: function (o, r, n) { if (null == o) return ""; var e, t, i, s = {}, p = {}, u = "", c = "", a = "", l = 2, f = 3, h = 2, d = [], m = 0, v = 0; for (i = 0; i < o.length; i += 1)if (u = o.charAt(i), Object.prototype.hasOwnProperty.call(s, u) || (s[u] = f++, p[u] = !0), c = a + u, Object.prototype.hasOwnProperty.call(s, c)) a = c; else { if (Object.prototype.hasOwnProperty.call(p, a)) { if (a.charCodeAt(0) < 256) { for (e = 0; h > e; e++)m <<= 1, v == r - 1 ? (v = 0, d.push(n(m)), m = 0) : v++; for (t = a.charCodeAt(0), e = 0; 8 > e; e++)m = m << 1 | 1 & t, v == r - 1 ? (v = 0, d.push(n(m)), m = 0) : v++, t >>= 1 } else { for (t = 1, e = 0; h > e; e++)m = m << 1 | t, v == r - 1 ? (v = 0, d.push(n(m)), m = 0) : v++, t = 0; for (t = a.charCodeAt(0), e = 0; 16 > e; e++)m = m << 1 | 1 & t, v == r - 1 ? (v = 0, d.push(n(m)), m = 0) : v++, t >>= 1 } l--, 0 == l && (l = Math.pow(2, h), h++), delete p[a] } else for (t = s[a], e = 0; h > e; e++)m = m << 1 | 1 & t, v == r - 1 ? (v = 0, d.push(n(m)), m = 0) : v++, t >>= 1; l--, 0 == l && (l = Math.pow(2, h), h++), s[c] = f++, a = String(u) } if ("" !== a) { if (Object.prototype.hasOwnProperty.call(p, a)) { if (a.charCodeAt(0) < 256) { for (e = 0; h > e; e++)m <<= 1, v == r - 1 ? (v = 0, d.push(n(m)), m = 0) : v++; for (t = a.charCodeAt(0), e = 0; 8 > e; e++)m = m << 1 | 1 & t, v == r - 1 ? (v = 0, d.push(n(m)), m = 0) : v++, t >>= 1 } else { for (t = 1, e = 0; h > e; e++)m = m << 1 | t, v == r - 1 ? (v = 0, d.push(n(m)), m = 0) : v++, t = 0; for (t = a.charCodeAt(0), e = 0; 16 > e; e++)m = m << 1 | 1 & t, v == r - 1 ? (v = 0, d.push(n(m)), m = 0) : v++, t >>= 1 } l--, 0 == l && (l = Math.pow(2, h), h++), delete p[a] } else for (t = s[a], e = 0; h > e; e++)m = m << 1 | 1 & t, v == r - 1 ? (v = 0, d.push(n(m)), m = 0) : v++, t >>= 1; l--, 0 == l && (l = Math.pow(2, h), h++) } for (t = 2, e = 0; h > e; e++)m = m << 1 | 1 & t, v == r - 1 ? (v = 0, d.push(n(m)), m = 0) : v++, t >>= 1; for (; ;) { if (m <<= 1, v == r - 1) { d.push(n(m)); break } v++ } return d.join("") }, decompress: function (o) { return null == o ? "" : "" == o ? null : i._decompress(o.length, 32768, function (r) { return o.charCodeAt(r) }) }, _decompress: function (o, n, e) { var t, i, s, p, u, c, a, l, f = [], h = 4, d = 4, m = 3, v = "", w = [], A = { val: e(0), position: n, index: 1 }; for (i = 0; 3 > i; i += 1)f[i] = i; for (p = 0, c = Math.pow(2, 2), a = 1; a != c;)u = A.val & A.position, A.position >>= 1, 0 == A.position && (A.position = n, A.val = e(A.index++)), p |= (u > 0 ? 1 : 0) * a, a <<= 1; switch (t = p) { case 0: for (p = 0, c = Math.pow(2, 8), a = 1; a != c;)u = A.val & A.position, A.position >>= 1, 0 == A.position && (A.position = n, A.val = e(A.index++)), p |= (u > 0 ? 1 : 0) * a, a <<= 1; l = r(p); break; case 1: for (p = 0, c = Math.pow(2, 16), a = 1; a != c;)u = A.val & A.position, A.position >>= 1, 0 == A.position && (A.position = n, A.val = e(A.index++)), p |= (u > 0 ? 1 : 0) * a, a <<= 1; l = r(p); break; case 2: return "" }for (f[3] = l, s = l, w.push(l); ;) { if (A.index > o) return ""; for (p = 0, c = Math.pow(2, m), a = 1; a != c;)u = A.val & A.position, A.position >>= 1, 0 == A.position && (A.position = n, A.val = e(A.index++)), p |= (u > 0 ? 1 : 0) * a, a <<= 1; switch (l = p) { case 0: for (p = 0, c = Math.pow(2, 8), a = 1; a != c;)u = A.val & A.position, A.position >>= 1, 0 == A.position && (A.position = n, A.val = e(A.index++)), p |= (u > 0 ? 1 : 0) * a, a <<= 1; f[d++] = r(p), l = d - 1, h--; break; case 1: for (p = 0, c = Math.pow(2, 16), a = 1; a != c;)u = A.val & A.position, A.position >>= 1, 0 == A.position && (A.position = n, A.val = e(A.index++)), p |= (u > 0 ? 1 : 0) * a, a <<= 1; f[d++] = r(p), l = d - 1, h--; break; case 2: return w.join("") }if (0 == h && (h = Math.pow(2, m), m++), f[l]) v = f[l]; else { if (l !== d) return null; v = s + s.charAt(0) } w.push(v), f[d++] = s + v.charAt(0), h--, s = v, 0 == h && (h = Math.pow(2, m), m++) } } }; return i }(); "function" == typeof define && define.amd ? define(function () { return LZString }) : "undefined" != typeof module && null != module && (module.exports = LZString);
</script>
<script type="text/javascript">"function" != typeof Object.create && (Object.create = function (t) { function o() { } return o.prototype = t, new o }), function (t, o) { "use strict"; var i = { _positionClasses: ["bottom-left", "bottom-right", "top-right", "top-left", "bottom-center", "top-center", "mid-center"], _defaultIcons: ["success", "error", "info", "warning"], init: function (o) { this.prepareOptions(o, t.toast.options), this.process() }, prepareOptions: function (o, i) { var s = {}; "string" == typeof o || o instanceof Array ? s.text = o : s = o, this.options = t.extend({}, i, s) }, process: function () { this.setup(), this.addToDom(), this.position(), this.bindToast(), this.animate() }, setup: function () { var o = ""; if (this._toastEl = this._toastEl || t("<div></div>", { "class": "jq-toast-single" }), o += '<span class="jq-toast-loader"></span>', this.options.allowToastClose && (o += '<span class="close-jq-toast-single">&times;</span>'), this.options.text instanceof Array) { this.options.heading && (o += '<h2 class="jq-toast-heading">' + this.options.heading + "</h2>"), o += '<ul class="jq-toast-ul">'; for (var i = 0; i < this.options.text.length; i++)o += '<li class="jq-toast-li" id="jq-toast-item-' + i + '">' + this.options.text[i] + "</li>"; o += "</ul>" } else this.options.heading && (o += '<h2 class="jq-toast-heading">' + this.options.heading + "</h2>"), o += this.options.text; this._toastEl.html(o), this.options.bgColor !== !1 && this._toastEl.css("background-color", this.options.bgColor), this.options.textColor !== !1 && this._toastEl.css("color", this.options.textColor), this.options.textAlign && this._toastEl.css("text-align", this.options.textAlign), this.options.icon !== !1 && (this._toastEl.addClass("jq-has-icon"), -1 !== t.inArray(this.options.icon, this._defaultIcons) && this._toastEl.addClass("jq-icon-" + this.options.icon)) }, position: function () { "string" == typeof this.options.position && -1 !== t.inArray(this.options.position, this._positionClasses) ? "bottom-center" === this.options.position ? this._container.css({ left: t(o).outerWidth() / 2 - this._container.outerWidth() / 2, bottom: 20 }) : "top-center" === this.options.position ? this._container.css({ left: t(o).outerWidth() / 2 - this._container.outerWidth() / 2, top: 20 }) : "mid-center" === this.options.position ? this._container.css({ left: t(o).outerWidth() / 2 - this._container.outerWidth() / 2, top: t(o).outerHeight() / 2 - this._container.outerHeight() / 2 }) : this._container.addClass(this.options.position) : "object" == typeof this.options.position ? this._container.css({ top: this.options.position.top ? this.options.position.top : "auto", bottom: this.options.position.bottom ? this.options.position.bottom : "auto", left: this.options.position.left ? this.options.position.left : "auto", right: this.options.position.right ? this.options.position.right : "auto" }) : this._container.addClass("bottom-left") }, bindToast: function () { var t = this; this._toastEl.on("afterShown", function () { t.processLoader() }), this._toastEl.find(".close-jq-toast-single").on("click", function (o) { o.preventDefault(), "fade" === t.options.showHideTransition ? (t._toastEl.trigger("beforeHide"), t._toastEl.fadeOut(function () { t._toastEl.trigger("afterHidden") })) : "slide" === t.options.showHideTransition ? (t._toastEl.trigger("beforeHide"), t._toastEl.slideUp(function () { t._toastEl.trigger("afterHidden") })) : (t._toastEl.trigger("beforeHide"), t._toastEl.hide(function () { t._toastEl.trigger("afterHidden") })) }), "function" == typeof this.options.beforeShow && this._toastEl.on("beforeShow", function () { t.options.beforeShow() }), "function" == typeof this.options.afterShown && this._toastEl.on("afterShown", function () { t.options.afterShown() }), "function" == typeof this.options.beforeHide && this._toastEl.on("beforeHide", function () { t.options.beforeHide() }), "function" == typeof this.options.afterHidden && this._toastEl.on("afterHidden", function () { t.options.afterHidden() }) }, addToDom: function () { var o = t(".jq-toast-wrap"); if (0 === o.length ? (o = t("<div></div>", { "class": "jq-toast-wrap" }), t("body").append(o)) : (!this.options.stack || isNaN(parseInt(this.options.stack, 10))) && o.empty(), o.find(".jq-toast-single:hidden").remove(), o.append(this._toastEl), this.options.stack && !isNaN(parseInt(this.options.stack), 10)) { var i = o.find(".jq-toast-single").length, s = i - this.options.stack; s > 0 && t(".jq-toast-wrap").find(".jq-toast-single").slice(0, s).remove() } this._container = o }, canAutoHide: function () { return this.options.hideAfter !== !1 && !isNaN(parseInt(this.options.hideAfter, 10)) }, processLoader: function () { if (!this.canAutoHide() || this.options.loader === !1) return !1; var t = this._toastEl.find(".jq-toast-loader"), o = (this.options.hideAfter - 400) / 1e3 + "s", i = this.options.loaderBg, s = t.attr("style") || ""; s = s.substring(0, s.indexOf("-webkit-transition")), s += "-webkit-transition: width " + o + " ease-in;                       -o-transition: width " + o + " ease-in;                       transition: width " + o + " ease-in;                       background-color: " + i + ";", t.attr("style", s).addClass("jq-toast-loaded") }, animate: function () { var t = this; if (this._toastEl.hide(), this._toastEl.trigger("beforeShow"), "fade" === this.options.showHideTransition.toLowerCase() ? this._toastEl.fadeIn(function () { t._toastEl.trigger("afterShown") }) : "slide" === this.options.showHideTransition.toLowerCase() ? this._toastEl.slideDown(function () { t._toastEl.trigger("afterShown") }) : this._toastEl.show(function () { t._toastEl.trigger("afterShown") }), this.canAutoHide()) { var t = this; o.setTimeout(function () { "fade" === t.options.showHideTransition.toLowerCase() ? (t._toastEl.trigger("beforeHide"), t._toastEl.fadeOut(function () { t._toastEl.trigger("afterHidden") })) : "slide" === t.options.showHideTransition.toLowerCase() ? (t._toastEl.trigger("beforeHide"), t._toastEl.slideUp(function () { t._toastEl.trigger("afterHidden") })) : (t._toastEl.trigger("beforeHide"), t._toastEl.hide(function () { t._toastEl.trigger("afterHidden") })) }, this.options.hideAfter) } }, reset: function (o) { "all" === o ? t(".jq-toast-wrap").remove() : this._toastEl.remove() }, update: function (t) { this.prepareOptions(t, this.options), this.setup(), this.bindToast() } }; t.toast = function (t) { var o = Object.create(i); return o.init(t, this), { reset: function (t) { o.reset(t) }, update: function (t) { o.update(t) } } }, t.toast.options = { text: "", heading: "", showHideTransition: "fade", allowToastClose: !0, hideAfter: 3e3, loader: !0, loaderBg: "#9EC600", stack: 5, position: "bottom-left", bgColor: !1, textColor: !1, textAlign: "left", icon: !1, beforeShow: function () { }, afterShown: function () { }, beforeHide: function () { }, afterHidden: function () { } } }(jQuery, window, document);
</script>
<script type="text/javascript">////////////////////////////////////////////////
    // Base JS for MultiQC Reports
    ////////////////////////////////////////////////

    // Helper config - is defined and object length > 0?
    function notEmptyObj(obj) {
        try {
            if (obj === undefined) { return false; }
            if (obj.length == 0) { return false; }
        } catch (e) { return false; }
        return true;
    }

    $(function () {

        // Enable the bootstrap tooltip hovers
        $('[data-toggle="tooltip"]').tooltip();

        // Side nav expansion
        $('#side-nav-handle').click(function (e) {
            $('.mainpage, .side-nav, .footer').toggleClass('hidden-nav');
            $('#side-nav-handle span').toggleClass('glyphicon-triangle-left glyphicon-triangle-right');
            // send resize trigger for replotting after css animation
            setTimeout(function () { $(document).resize(); }, 510);
        });

        // Hide welcome alert if setting saved
        try {
            var hide_welcome = localStorage.getItem("mqc_hide_welcome");
            if (hide_welcome !== 'true') {
                $('#mqc_header_hr').slideUp();
                $('#mqc_welcome').slideDown();
            }
            $('#mqc_hide_welcome_btn').click(function (e) {
                localStorage.setItem("mqc_hide_welcome", 'true');
            });
        } catch (e) {
            console.log("Could not access localStorage: " + e + "\nPlease disable 'Block third-party cookies and site data' or browser equivalent.")
        }
        $('#mqc_hide_welcome_btn, #mqc_welcome .close').click(function (e) {
            $('#mqc_header_hr').show();
        });

    });</script>
<script type="text/javascript">////////////////////////////////////////////////
    // MultiQC Table code
    ////////////////////////////////////////////////

    var brewer_scales = ['YlOrRd', 'YlOrBr', 'YlGnBu', 'YlGn', 'Reds', 'RdPu',
        'Purples', 'PuRd', 'PuBuGn', 'PuBu', 'OrRd', 'Oranges', 'Greys', 'Greens',
        'GnBu', 'BuPu', 'BuGn', 'Blues', 'Set3', 'Set2', 'Set1', 'Pastel2', 'Pastel1',
        'Paired', 'Dark2', 'Accent', 'Spectral', 'RdYlGn', 'RdYlBu', 'RdGy', 'RdBu',
        'PuOr', 'PRGn', 'PiYG', 'BrBG'];

    // Execute when page load has finished loading
    $(function () {

        if ($('.mqc_table').length > 0) {

            // Enable tablesorter on MultiQC tables
            var strip_non_numeric = function (node) {
                return node.innerText.replace(/[^\d.-]/g, '');
            }
            $('.mqc_table').tablesorter({ sortInitialOrder: 'desc', textExtraction: strip_non_numeric });

            // Update tablesorter if samples renamed
            $(document).on('mqc_renamesamples', function (e, f_texts, t_texts, regex_mode) {
                $('.mqc_table').trigger('update');
            });

            // Copy table contents to clipboard
            var clipboard = new Clipboard('.mqc_table_copy_btn');
            clipboard.on('success', function (e) { e.clearSelection(); });
            $('.mqc_table_copy_btn').click(function () {
                var btn = $(this);
                btn.addClass('active').html('<span class="glyphicon glyphicon-copy"></span> Copied!');
                setTimeout(function () {
                    btn.removeClass('active').html('<span class="glyphicon glyphicon-copy"></span> Copy table');
                }, 2000);
            });

            // Make table headers fixed when table body scrolls (use CSS transforms)
            // http://stackoverflow.com/a/25902860/713980
            $('.mqc-table-responsive').scroll(function () {
                $(this).find('thead').css('transform', "translate(0," + $(this).scrollTop() + "px)");
            });

            // Table header-specific bootstrap tooltips
            $('.mqc_table_tooltip').tooltip({ container: 'body' });

            // Expand tables to full height
            $('.mqc-table-expand').click(function () {
                if ($(this).find('span').hasClass('glyphicon-chevron-down')) {
                    $(this).parent().find('.mqc-table-responsive').css('max-height', 'none');
                    $(this).find('span').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
                } else {
                    $(this).parent().find('.mqc-table-responsive').css('max-height', '400px');
                    $(this).find('span').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-down');
                }
            });

            /////// COLUMN CONFIG
            // show + hide columns
            $('.mqc_table_col_visible').change(function () {
                var target = $(this).data('target');
                mqc_table_col_updateVisible(target);
            });
            // Bulk set visible / hidden
            $('.mqc_configModal_bulkVisible').click(function (e) {
                e.preventDefault();
                var target = $(this).data('target');
                var visible = $(this).data('action') == 'showAll';
                $(target + '_configModal_table tbody .mqc_table_col_visible').prop('checked', visible);
                mqc_table_col_updateVisible(target);
            });
            function mqc_table_col_updateVisible(target) {
                $(target + '_configModal_table .mqc_table_col_visible').each(function () {
                    var cclass = $(this).val();
                    if ($(this).is(":checked")) {
                        $(target + ' .' + cclass).removeClass('hidden');
                        $(target + '_configModal_table .' + cclass).removeClass('text-muted');
                    } else {
                        $(target + ' .' + cclass).addClass('hidden');
                        $(target + '_configModal_table .' + cclass).addClass('text-muted');
                    }
                });
                // Hide empty rows
                $(target + ' tbody tr').show();
                $(target + ' tbody tr').each(function () {
                    var hasVal = false;
                    $(this).find('td:visible').each(function () {
                        if (!$(this).hasClass('sorthandle') && $(this).text() !== '') {
                            hasVal = true;
                        }
                    });
                    if (!hasVal) {
                        $(this).hide();
                    }
                });
                // Update counts
                $(target + '_numrows').text($(target + ' tbody tr:visible').length);
                $(target + '_numcols').text($(target + ' thead th:visible').length - 1);
            }

            // Make rows in MultiQC tables sortable
            $('.mqc_table.mqc_sortable tbody').sortable({
                handle: '.sorthandle',
                helper: function fixWidthHelper(e, ui) {
                    ui.children().each(function () { $(this).width($(this).width()); });
                    return ui;
                }
            });

            // Change order of columns
            $('.mqc_configModal_table').on('sortstop', function (e, ui) {
                change_mqc_table_col_order($(this));
            });
            $('.mqc_configModal_table').bind('sortEnd', function () {
                change_mqc_table_col_order($(this));
            });

            // TOOLBOX LISTENERS

            // highlight samples
            $(document).on('mqc_highlights', function (e, f_texts, f_cols, regex_mode) {
                $('.mqc_table_sortHighlight').hide();
                $('.mqc_table tbody th').removeClass('highlighted').removeData('highlight');
                $('.mqc_table tbody th').each(function (i) {
                    var th = $(this);
                    var thtext = $(this).text();
                    var thiscol = '#333';
                    $.each(f_texts, function (idx, f_text) {
                        if ((regex_mode && thtext.match(f_text)) || (!regex_mode && thtext.indexOf(f_text) > -1)) {
                            thiscol = f_cols[idx];
                            th.addClass('highlighted').data('highlight', idx);
                            $('.mqc_table_sortHighlight').show();
                        }
                    });
                    $(this).css('color', thiscol);
                });
            });

            // Sort MultiQC tables by highlight
            $('.mqc_table_sortHighlight').click(function (e) {
                e.preventDefault();
                var target = $(this).data('target');
                // collect highlighted rows
                var hrows = $(target + ' tbody th.highlighted').parent().detach();
                hrows = hrows.sort(function (a, b) {
                    return $(a).find('th').data('highlight') - $(b).find('th').data('highlight');
                });
                if ($(this).data('direction') == 'desc') {
                    hrows = hrows.get().reverse();
                    $(target + ' tbody').prepend(hrows);
                    $(this).data('direction', 'asc');
                } else {
                    $(target + ' tbody').append(hrows);
                    $(this).data('direction', 'desc');
                }
            });

            // Rename samples
            $(document).on('mqc_renamesamples', function (e, f_texts, t_texts, regex_mode) {
                $(".mqc_table tbody th").each(function () {
                    var s_name = String($(this).data('original-sn'));
                    $.each(f_texts, function (idx, f_text) {
                        if (regex_mode) {
                            var re = new RegExp(f_text, "g");
                            s_name = s_name.replace(re, t_texts[idx]);
                        } else {
                            s_name = s_name.replace(f_text, t_texts[idx]);
                        }
                    });
                    $(this).text(s_name);
                });
            });

            // Hide samples
            $(document).on('mqc_hidesamples', function (e, f_texts, regex_mode) {

                // Hide rows in MultiQC tables
                $(".mqc_table tbody th").each(function () {
                    var match = false;
                    var hfilter = $(this).text();
                    $.each(f_texts, function (idx, f_text) {
                        if ((regex_mode && hfilter.match(f_text)) || (!regex_mode && hfilter.indexOf(f_text) > -1)) {
                            match = true;
                        }
                    });
                    if (window.mqc_hide_mode == 'show') {
                        match = !match;
                    }
                    if (match) {
                        $(this).parent().hide().addClass('hidden');
                    } else {
                        $(this).parent().show().removeClass('hidden');
                    }
                });
                $('.mqc_table_numrows').each(function () {
                    var tid = $(this).attr('id').replace('_numrows', '');
                    $(this).text($('#' + tid + ' tbody tr:visible').length);
                });

                // Hide empty columns
                $('.mqc_table').each(function () {
                    var table = $(this);
                    var gsthidx = 0;
                    table.find("thead th, tbody tr td").show();
                    table.find("thead th").each(function () {
                        if (gsthidx == 0) { gsthidx += 1; return true; }
                        var count = 0;
                        var empties = 0;
                        table.find("tbody tr td:nth-child(" + (gsthidx + 2) + ")").filter(":visible").each(function () {
                            count += 1;
                            if ($(this).text() == '') { empties += 1; }
                        });
                        if (count > 0 && count == empties) {
                            $(this).hide();
                            table.find("tbody tr td:nth-child(" + (gsthidx + 2) + ")").hide();
                        }
                        gsthidx += 1;
                    });
                });
                $('.mqc_table_numcols').each(function () {
                    var tid = $(this).attr('id').replace('_numcols', '');
                    $(this).text($('#' + tid + ' thead th:visible').length - 1);
                });
            });

        } // End of check for table

        // Table Scatter Modal
        $('#tableScatterForm').submit(function (e) {
            e.preventDefault();
        });
        $('.mqc_table_makeScatter').click(function (e) {
            // Reset dropdowns
            if ($('#tableScatter_tid').val() != $(this).data('table')) {
                $('#tableScatter_col1, #tableScatter_col2').html('<option value="">Select Column</option>');
                // Add columns to dropdowns
                $($(this).data('table') + ' thead tr th').each(function (e) {
                    var c_id = $(this).attr('id');
                    if (c_id != undefined) {
                        var c_name = $(this).attr('data-namespace') + ': ' + $(this).text();
                        $('#tableScatter_col1, #tableScatter_col2').append('<option value="' + c_id + '">' + c_name + '</select>');
                    }
                });
                $('#tableScatter_tid').val($(this).data('table'));
                $('#tableScatterPlot').html('<small>Please select two table columns.</small>').addClass('not_rendered');
            }
        });
        $('#tableScatterForm select').change(function (e) {
            var tid = $('#tableScatter_tid').val();
            var col1 = $('#tableScatter_col1').val().replace('header_', '');
            var col2 = $('#tableScatter_col2').val().replace('header_', '');
            var col1_name = $('#tableScatter_col1 option:selected').text();
            var col2_name = $('#tableScatter_col2 option:selected').text();
            var col1_max = parseFloat($(tid + ' thead th#header_' + col1).data('dmax'));
            var col1_min = parseFloat($(tid + ' thead th#header_' + col1).data('dmin'));
            var col2_max = parseFloat($(tid + ' thead th#header_' + col2).data('dmax'));
            var col2_min = parseFloat($(tid + ' thead th#header_' + col2).data('dmin'));
            if (isNaN(col1_max)) { col1_max = undefined; }
            if (isNaN(col1_min)) { col1_min = undefined; }
            if (isNaN(col2_max)) { col2_max = undefined; }
            if (isNaN(col2_min)) { col2_min = undefined; }
            if (col1 != '' && col2 != '') {
                $('#tableScatterPlot').html('<small>loading..</small>');
                if ($(tid).attr('data-title')) {
                    plot_title = $(tid).attr('data-title');
                } else {
                    plot_title = tid.replace(/^#/, '').replace(/_/g, ' ');
                }
                // Get the data values
                mqc_plots['tableScatterPlot'] = {
                    'plot_type': 'scatter',
                    'config': {
                        'id': 'tableScatter_' + tid,
                        'title': plot_title,
                        'xlab': col1_name,
                        'ylab': col2_name,
                        'xmin': col1_min,
                        'xmax': col1_max,
                        'ymin': col2_min,
                        'ymax': col2_max,
                    },
                    'datasets': [[]]
                };
                $(tid + ' tbody tr').each(function (e) {
                    var s_name = $(this).children('th.rowheader').text();
                    var val_1 = $(this).children('td.' + col1).text().replace(/[^\d\.]/g, '');
                    var val_2 = $(this).children('td.' + col2).text().replace(/[^\d\.]/g, '');
                    if (!isNaN(parseFloat(val_1)) && isFinite(val_1) && !isNaN(parseFloat(val_2)) && isFinite(val_2)) {
                        mqc_plots['tableScatterPlot']['datasets'][0].push({
                            'name': s_name,
                            'x': parseFloat(val_1),
                            'y': parseFloat(val_2)
                        });
                    }
                });
                if (Object.keys(mqc_plots['tableScatterPlot']['datasets'][0]).length > 0) {
                    if (plot_scatter_plot('tableScatterPlot') == false) {
                        $('#tableScatterPlot').html('<small>Error: Something went wrong when plotting the scatter plot.</small>');
                        $('#tableScatterPlot').addClass('not_rendered');
                    } else {
                        $('#tableScatterPlot').removeClass('not_rendered');
                    }
                } else {
                    $('#tableScatterPlot').html('<small>Error: No data pairs found for these columns.</small>');
                    $('#tableScatterPlot').addClass('not_rendered');
                }
            } else {
                $('#tableScatterPlot').html('<small>Please select two table columns.</small>');
                $('#tableScatterPlot').addClass('not_rendered');
            }
        });

    });

    // Reorder columns in MultiQC tables.
    // Note: Don't have to worry about floating headers, as 'Configure Columns'
    // button is only visible when this is hidden. Ace!
    function change_mqc_table_col_order(table) {

        // Find the targets of this sorting
        var tid = table.attr('id');
        var target = tid.replace('_configModal_table', '');

        // Collect the desired order of columns
        var classes = [];
        $('#' + tid + ' tbody tr').each(function () {
            classes.push($(this).attr('class'));
        });
        // Go through each row
        $('#' + target + ' tr').each(function () {
            var cols = {};
            var row = $(this);
            // Detach any cell that matches a known class from above
            row.find('td, th').each(function () {
                var cell = $(this);
                $.each(classes, function (idx, c) {
                    if (cell.hasClass(c)) {
                        cols[c] = cell.detach();
                    }
                });
            });
            // Insert detached cells back in the order given in the sorted table
            for (var idx in classes) {
                var c = classes[idx];
                if (cols[c] !== undefined) {
                    row.append(cols[c]);
                }
            }
        });
    }
</script>
<script type="text/javascript">////////////////////////////////////////////////
    // HighCharts Plotting Code
    ////////////////////////////////////////////////

    // Global plot data variable
    mqc_plots = {};

    // Initialise the toolbox filters
    window.mqc_highlight_f_texts = [];
    window.mqc_highlight_f_cols = [];
    window.mqc_highlight_regex_mode = false;
    window.mqc_rename_f_texts = [];
    window.mqc_rename_t_texts = [];
    window.mqc_rename_regex_mode = false;
    window.mqc_hide_mode = 'hide';
    window.mqc_hide_f_texts = [];
    window.mqc_hide_regex_mode = false;
    window.HCDefaults = undefined;

    // Execute when page load has finished loading
    $(function () {

        // Show loading warning
        $('.mqc_loading_warning').show();

        // Decompress the JSON plot data
        //   mqc_plots = JSON.parse(LZString.decompressFromBase64(mqc_compressed_plotdata));
        mqc_plots = mqc_compressed_plotdata;

        // HighCharts Defaults
        window.HCDefaults = $.extend(true, {}, Highcharts.getOptions(), {});
        Highcharts.setOptions({
            credits: {
                enabled: true,
                text: 'Created with MultiQC',
                href: 'http://multiqc.info'
            },
            lang: {
                decimalPoint: (mqc_config['decimalPoint_format'] == undefined ? '.' : mqc_config['decimalPoint_format']),
                thousandsSep: (mqc_config['thousandsSep_format'] == undefined ? ' ' : mqc_config['thousandsSep_format']),
            },
            exporting: {
                buttons: {
                    contextButton: {
                        menuItems: null,
                        onclick: function () {
                            // Tick only this plot in the toolbox and slide out
                            $('#mqc_export_selectplots input').prop('checked', false);
                            $('#mqc_export_selectplots input[value="' + this.renderTo.id + '"]').prop('checked', true);
                            // Special case - Table scatter plots are in a modal, need to close this first
                            if (this.renderTo.id == 'tableScatterPlot') {
                                $('#tableScatterModal').modal('hide');
                            }
                            mqc_toolbox_openclose('#mqc_exportplots', true);
                        },
                        text: '<span style="color:#999999;">Export Plot</span>',
                        symbol: 'url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAABWzo5XAAAAAXNSR0IArs4c6QAAAAlwSFlzAAALEwAACxMBAJqcGAAAAVlpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IlhNUCBDb3JlIDUuNC4wIj4KICAgPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iPgogICAgICAgICA8dGlmZjpPcmllbnRhdGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KTMInWQAAAXNJREFUOBHNUsuqwkAMPX2g4kJd+wOCuKgL//8btAXXIogvtOhCax9xzkBqveLg8gamHZKck+RMgP9mnquh5XIpaZrC8zx0Oh1EUfQ1P3QRkeR6vcL3fdxuN1cqnERhGIKHREEQOIl8V1RE0DyuXCeRC/g39iFeHMdSlqUV+HK5oCgKeyew1+vZEauqwnQ6fcN+aJTnObbbLdrtttWGL0bjiBT/fr9jMBhYX/PzxsrA4/EQ8+zY7/dotVpgdRoFZ5F+v4/ZbPaBCw+Hg8znc5s8Ho8J9kxV04DAxCwZg6aAJWEO7XQ6yWKxQJZlGI1Gr+fXEZhkls8zCTUZfexkMpmg2+2+dUMci1qNlKS5K0YjC0iSRDgSO1EfiblfxOmpxaaDr3Q8HqWpC1+NFbnhu91OSMKC5/OZ19pqIoq5Xq+xWq3qIAnoZxFdCQ3Sx65o9WisqsYENb0rofr1T3Iexi1qs9mIgjTp1z9JhsPhq/qvwG95Tw3FukJt8JteAAAAAElFTkSuQmCC)',
                        symbolX: 23,
                        symbolY: 19
                    }
                }
            }
        });

        // Render plots on page load
        $('.hc-plot.not_rendered:visible:not(.gt_max_num_ds)').each(function () {
            var target = $(this).attr('id');
            // Only one point per dataset, so multiply limit by arbitrary number.
            var max_num = mqc_config['num_datasets_plot_limit'] * 50;
            // Deferring each plot call prevents browser from locking up
            setTimeout(function () {
                plot_graph(target, undefined, max_num);
                if ($('.hc-plot.not_rendered:visible:not(.gt_max_num_ds)').length == 0) {
                    $('.mqc_loading_warning').hide();
                }
            }, 50);
        });
        if ($('.hc-plot.not_rendered:visible:not(.gt_max_num_ds)').length == 0) {
            $('.mqc_loading_warning').hide();
        }

        // Render a plot when clicked
        $('body').on('click', '.render_plot', function (e) {
            var target = $(this).parent().attr('id');
            plot_graph(target);
            if ($('.hc-plot.not_rendered').length == 0) {
                $('#mqc-warning-many-samples').hide();
            }
        });

        // Render all plots from header
        $('#mqc-render-all-plots').click(function () {
            $('.hc-plot.not_rendered').each(function () {
                var target = $(this).attr('id');
                plot_graph(target);
            });
            $('#mqc-warning-many-samples').hide();
        });

        // Replot graphs when something changed in filters
        $(document).on('mqc_highlights mqc_renamesamples mqc_hidesamples', function () {
            // Replot graphs
            $('.hc-plot:not(.not_rendered)').each(function () {
                var target = $(this).attr('id');
                plot_graph(target);
            });
        });

        // Switch a HighCharts axis or data source
        $('.hc_switch_group button').click(function (e) {
            e.preventDefault();
            $(this).siblings('button.active').removeClass('active');
            $(this).addClass('active');
            var target = $(this).data('target');
            var action = $(this).data('action');
            // Switch between values and percentages
            if (action == 'set_percent' || action == 'set_numbers') {
                var sym = (action == 'set_percent') ? '%' : '#';
                var stack_type = (action == 'set_percent') ? 'percent' : 'normal';
                mqc_plots[target]['config']['stacking'] = stack_type;
                mqc_plots[target]['config']['ytype'] = 'linear';
                plot_graph(target);
                var ylab = $(this).data('ylab');
                if (ylab != undefined) {
                    $('#' + target).highcharts().yAxis[0].setTitle({ text: ylab });
                }
                var xlab = $(this).data('xlab');
                if (xlab != undefined) {
                    $('#' + target).highcharts().xAxis[0].setTitle({ text: xlab });
                }
            }
            // Switch to log10 axis
            if (action == 'set_log') {
                mqc_plots[target]['config']['ytype'] = 'logarithmic';
                plot_graph(target);
            }
            // Switch data source
            if (action == 'set_data') {
                var ds = $(this).data('newdata');
                plot_graph(target, ds);
                var ylab = $(this).data('ylab');
                var xlab = $(this).data('xlab');
                var ymax = $(this).data('ymax');
                if (ylab != undefined) {
                    $('#' + target).highcharts().yAxis[0].setTitle({ text: ylab });
                }
                if (xlab != undefined) {
                    $('#' + target).highcharts().xAxis[0].setTitle({ text: xlab });
                }
                if (ymax != undefined) {
                    $('#' + target).highcharts().yAxis[0].setExtremes(null, ymax);
                }
            }
        });

        // Make HighCharts divs height-draggable
        // http://jsfiddle.net/Lkwb86c8/
        $('.hc-plot:not(.no-handle)').each(function () {
            if (!$(this).parent().hasClass('hc-plot-wrapper')) {
                $(this).wrap('<div class="hc-plot-wrapper"></div>');
            }
            if (!$(this).siblings().hasClass('hc-plot-handle')) {
                $(this).after('<div class="hc-plot-handle"><span></span><span></span><span></span></div>');
            }
            $(this).css({ height: 'auto', top: 0, bottom: '10px', position: 'absolute' });
        });
        $('.hc-plot-handle').on('mousedown', function (e) {
            var wrapper = $(this).parent();
            var handle = $(this);
            var startHeight = wrapper.height();
            var pY = e.pageY;
            $(document).on('mouseup', function (e) {
                // Clear listeners now that we've let go
                $(document).off('mousemove');
                $(document).off('mouseup');
                // Fire off a custom jQuery event for other javascript chunks to tie into
                // Bind to the plot div, which should have a custom ID
                $(wrapper.parent().find('.hc-plot, .beeswarm-plot')).trigger('mqc_plotresize');
            });
            $(document).on('mousemove', function (me) {
                wrapper.css('height', startHeight + (me.pageY - pY));
            });
        });
        // Trigger HighCharts reflow when a plot is resized
        $('.hc-plot, .beeswarm-plot').on('mqc_plotresize', function (e) {
            if ($(this).highcharts()) {
                $(this).highcharts().reflow();
            }
        });

        // Switch a y axis limit on or off
        $('.mqc_hcplot_plotgroup').on('click', '.mqc_hcplot_yaxis_limit_toggle .mqc_switch_wrapper', function () {
            var target = $($(this).data('target')).highcharts();
            var ymax = $(this).data('ymax');
            var ymin = $(this).data('ymin');
            ymax = ymax == 'undefined' ? null : ymax;
            ymin = ymin == 'undefined' ? null : ymin;
            var mqc_switch = $(this).find('.mqc_switch');
            if (mqc_switch.hasClass('on')) {
                target.yAxis[0].update({ max: null, min: null });
                mqc_switch.removeClass('on').addClass('off').text('off');
            } else {
                target.yAxis[0].update({ max: ymax, min: ymin });
                mqc_switch.removeClass('off').addClass('on').text('on');
            }
        });

        // Sort a heatmap by highlighted names
        $('.mqc_heatmap_sortHighlight').click(function (e) {
            e.preventDefault();
            var target = $(this).data('target').substr(1);
            if (mqc_plots[target]['config']['sortHighlights'] == true) {
                mqc_plots[target]['config']['sortHighlights'] = false;
                $(this).removeClass('active');
            } else {
                mqc_plots[target]['config']['sortHighlights'] = true;
                $(this).addClass('active');
            }
            $(this).blur();
            plot_heatmap(target);
        });

    });

    // Call to render any plot
    function plot_graph(target, ds, max_num) {
        if (mqc_plots[target] === undefined) { return false; }
        else {
            // XY Line charts
            if (mqc_plots[target]['plot_type'] == 'xy_line') {
                if (max_num === undefined || mqc_plots[target]['datasets'][0].length < max_num) {
                    plot_xy_line_graph(target, ds);
                    $('#' + target).removeClass('not_rendered');
                } else {
                    $('#' + target).addClass('not_rendered gt_max_num_ds').html('<button class="btn btn-default btn-lg render_plot">Show plot</button>');
                }
            }
            // Bar graphs
            else if (mqc_plots[target]['plot_type'] == 'bar_graph') {
                if (max_num === undefined || mqc_plots[target]['samples'][0].length < max_num) {
                    plot_stacked_bar_graph(target, ds);
                    $('#' + target).removeClass('not_rendered');
                } else {
                    $('#' + target).addClass('not_rendered gt_max_num_ds').html('<button class="btn btn-default btn-lg render_plot">Show plot</button>');
                }
            }
            // Scatter plots
            else if (mqc_plots[target]['plot_type'] == 'scatter') {
                if (max_num === undefined || Object.keys(mqc_plots[target]['datasets'][0]).length < max_num) {
                    plot_scatter_plot(target, ds);
                    $('#' + target).removeClass('not_rendered');
                } else {
                    $('#' + target).addClass('not_rendered gt_max_num_ds').html('<button class="btn btn-default btn-lg render_plot">Show plot</button>');
                }
            }
            // Beeswarm graphs
            else if (mqc_plots[target]['plot_type'] == 'beeswarm') {
                if (max_num === undefined || mqc_plots[target]['samples'][0].length < max_num) {
                    plot_beeswarm_graph(target, ds);
                    $('#' + target).removeClass('not_rendered');
                } else {
                    $('#' + target).addClass('not_rendered gt_max_num_ds').html('<button class="btn btn-default btn-lg render_plot">Show plot</button>');
                }
            }
            // Heatmap plots
            else if (mqc_plots[target]['plot_type'] == 'heatmap') {
                if (max_num === undefined || mqc_plots[target]['xcats'][0].length < max_num) {
                    plot_heatmap(target, ds);
                    $('#' + target).removeClass('not_rendered');
                } else {
                    $('#' + target).addClass('not_rendered gt_max_num_ds').html('<button class="btn btn-default btn-lg render_plot">Show plot</button>');
                }
            }
            // Not recognised
            else { console.log('Did not recognise plot type: ' + mqc_plots[target]['plot_type']); }
        }
    }

    // Basic Line Graph
    function plot_xy_line_graph(target, ds) {
        if (mqc_plots[target] === undefined || mqc_plots[target]['plot_type'] !== 'xy_line') {
            return false;
        }
        var config = mqc_plots[target]['config'];
        var data = mqc_plots[target]['datasets'];
        if (ds === undefined) { ds = 0; }

        if (config['tt_label'] === undefined) {
            config['tt_label'] = '{point.x}: {point.y:.2f}';
            if (config['categories']) {
                config['tt_formatter'] = function () {
                    return '<div style="background-color:' + this.series.color + '; display:inline-block; height: 10px; width: 10px; border:1px solid #333;"></div> <span style="text-decoration:underline; font-weight:bold;">' + this.series.name + '</span><br><strong>' + this.key + ':</strong> ' + this.y;
                }
            }
        }
        if (config['click_func'] === undefined) { config['click_func'] = function () { }; }
        else {
            config['click_func'] = eval("(" + config['click_func'] + ")");
            if (config['cursor'] === undefined) { config['cursor'] = 'pointer'; }
        }
        if (config['xDecimals'] === undefined) { config['xDecimals'] = true; }
        if (config['yDecimals'] === undefined) { config['yDecimals'] = true; }
        if (config['pointFormat'] === undefined) {
            config['pointFormat'] = '<div style="background-color:{series.color}; display:inline-block; height: 10px; width: 10px; border:1px solid #333;"></div> <span style="text-decoration:underline; font-weight:bold;">{series.name}</span><br>' + config['tt_label'];
        }

        // Make a clone of the data, so that we can mess with it,
        // while keeping the original data in tact
        var data = JSON.parse(JSON.stringify(mqc_plots[target]['datasets'][ds]));

        // Rename samples
        if (window.mqc_rename_f_texts.length > 0) {
            $.each(data, function (j, s) {
                $.each(window.mqc_rename_f_texts, function (idx, f_text) {
                    if (window.mqc_rename_regex_mode) {
                        var re = new RegExp(f_text, "g");
                        data[j]['name'] = data[j]['name'].replace(re, window.mqc_rename_t_texts[idx]);
                    } else {
                        data[j]['name'] = data[j]['name'].replace(f_text, window.mqc_rename_t_texts[idx]);
                    }
                });
            });
        }

        // Highlight samples
        if (window.mqc_highlight_f_texts.length > 0) {
            $.each(data, function (j, s) {
                $.each(window.mqc_highlight_f_texts, function (idx, f_text) {
                    if ((window.mqc_highlight_regex_mode && data[j]['name'].match(f_text)) || (!window.mqc_highlight_regex_mode && data[j]['name'].indexOf(f_text) > -1)) {
                        data[j]['color'] = window.mqc_highlight_f_cols[idx];
                    }
                });
            });
        }

        // Hide samples
        $('#' + target).closest('.mqc_hcplot_plotgroup').parent().find('.samples-hidden-warning').remove();
        $('#' + target).closest('.mqc_hcplot_plotgroup').show();
        if (window.mqc_hide_f_texts.length > 0) {
            var num_hidden = 0;
            var num_total = data.length;
            var j = data.length;
            while (j--) {
                var match = false;
                for (i = 0; i < window.mqc_hide_f_texts.length; i++) {
                    var f_text = window.mqc_hide_f_texts[i];
                    if (window.mqc_hide_regex_mode) {
                        if (data[j]['name'].match(f_text)) { match = true; }
                    } else {
                        if (data[j]['name'].indexOf(f_text) > -1) { match = true; }
                    }
                }
                if (window.mqc_hide_mode == 'show') {
                    match = !match;
                }
                if (match) {
                    data.splice(j, 1);
                    num_hidden += 1;
                }
            };
            // Some series hidden. Show a warning text string.
            if (num_hidden > 0) {
                var alert = '<div class="samples-hidden-warning alert alert-warning"><span class="glyphicon glyphicon-info-sign"></span> <strong>Warning:</strong> ' + num_hidden + ' samples hidden. <a href="#mqc_hidesamples" class="alert-link" onclick="mqc_toolbox_openclose(\'#mqc_hidesamples\', true); return false;">See toolbox.</a></div>';
                $('#' + target).closest('.mqc_hcplot_plotgroup').before(alert);
            }
            // All series hidden. Hide the graph.
            if (num_hidden == num_total) {
                $('#' + target).closest('.mqc_hcplot_plotgroup').hide();
                return false;
            }
        }

        // Toggle buttons for y-axis limis
        // Handler for this is at top, so doesn't get created multiple times
        if (config['ymax'] != undefined || config['ymin'] != undefined) {
            var pgroup = $('#' + target).closest('.mqc_hcplot_plotgroup');
            var wrapper = $('<div class="mqc_hcplot_yaxis_limit_toggle hidden-xs" />').prependTo(pgroup);
            wrapper.append('<span class="mqc_switch_wrapper" data-ymax="' + config['ymax'] + '" data-ymin="' + config['ymin'] + '" data-target="#' + target + '">Y-Limits: <span class="mqc_switch on">on</span></span>');
            wrapper.after('<div class="clearfix" />');
        }

        // Make the highcharts plot
        Highcharts.chart(target, {
            chart: {
                type: 'line',
                zoomType: 'x'
            },
            title: {
                text: config['title'],
                x: 30 // fudge to center over plot area rather than whole plot
            },
            xAxis: {
                title: {
                    text: config['xlab']
                },
                labels: { format: config['xLabelFormat'] ? config['xLabelFormat'] : '{value}' },
                type: config['xLog'] ? 'logarithmic' : 'linear',
                categories: config['categories'],
                ceiling: config['xCeiling'],
                floor: config['xFloor'],
                max: config['xmax'],
                min: config['xmin'],
                minRange: config['xMinRange'],
                allowDecimals: config['xDecimals'],
                plotBands: config['xPlotBands'],
                plotLines: config['xPlotLines']
            },
            yAxis: {
                title: {
                    text: config['ylab']
                },
                labels: { format: config['yLabelFormat'] ? config['yLabelFormat'] : '{value}' },
                type: config['yLog'] ? 'logarithmic' : 'linear',
                ceiling: config['yCeiling'],
                floor: config['yFloor'],
                max: config['ymax'],
                min: config['ymin'],
                minRange: config['yMinRange'],
                allowDecimals: config['yDecimals'],
                plotBands: config['yPlotBands'],
                plotLines: config['yPlotLines']
            },
            plotOptions: {
                series: {
                    marker: { enabled: false },
                    cursor: config['cursor'],
                    point: {
                        events: {
                            click: config['click_func']
                        }
                    }
                }
            },
            legend: {
                enabled: false
            },
            tooltip: {
                headerFormat: '',
                pointFormat: config['pointFormat'],
                formatter: config['tt_formatter'],
                useHTML: true
            },
            series: data
        });
    }

    // Stacked Bar Graph
    function plot_stacked_bar_graph(target, ds) {
        if (mqc_plots[target] === undefined || mqc_plots[target]['plot_type'] !== 'bar_graph') {
            return false;
        }
        if (ds === undefined) { ds = 0; }

        // Make a clone of the everything, so that we can mess with it,
        // while keeping the original data in tact
        var data = JSON.parse(JSON.stringify(mqc_plots[target]['datasets'][ds]));
        var cats = JSON.parse(JSON.stringify(mqc_plots[target]['samples'][ds]));
        var config = JSON.parse(JSON.stringify(mqc_plots[target]['config']));

        if (config['stacking'] === undefined) { config['stacking'] = 'normal'; }
        if (config['stacking'] === 'normal') { config['groupPadding'] = '0.02'; config['pointPadding'] = '0.1'; }
        else { config['groupPadding'] = '0.1'; config['pointPadding'] = 0 }
        if (config['ytype'] === undefined) { config['ytype'] = 'linear'; }
        if (config['reversedStacks'] === undefined) { config['reversedStacks'] = false; }
        if (config['use_legend'] === undefined) { config['use_legend'] = true; }
        if (config['yDecimals'] === undefined) { config['yDecimals'] = true; }
        if (config['click_func'] === undefined) { config['click_func'] = function () { }; }
        else { if (config['cursor'] === undefined) { config['cursor'] = 'pointer'; } }
        if (config['tt_percentages'] === undefined) { config['tt_percentages'] = true; }
        if (config['borderWidth'] === undefined) { config['borderWidth'] = 0; }

        if (config['ytype'] == 'logarithmic') {
            if (config['ymin'] == 0 || config['ymin'] == undefined) {
                config['ymin'] = 1;
            }
            var minTickInt = 'auto';
        } else {
            var minTickInt = undefined;
        }

        // Rename samples
        if (window.mqc_rename_f_texts.length > 0) {
            $.each(cats, function (j, s_name) {
                $.each(window.mqc_rename_f_texts, function (idx, f_text) {
                    if (window.mqc_rename_regex_mode) {
                        var re = new RegExp(f_text, "g");
                        cats[j] = cats[j].replace(re, window.mqc_rename_t_texts[idx]);
                    } else {
                        cats[j] = cats[j].replace(f_text, window.mqc_rename_t_texts[idx]);
                    }
                });
            });
        }

        // Highlight samples
        if (window.mqc_highlight_f_texts.length > 0) {
            $.each(cats, function (j, s_name) {
                $.each(window.mqc_highlight_f_texts, function (idx, f_text) {
                    if (f_text == '') { return true; } // skip blanks
                    if ((window.mqc_highlight_regex_mode && s_name.match(f_text)) || (!window.mqc_highlight_regex_mode && s_name.indexOf(f_text) > -1)) {
                        // Make the data point in each series with this index have a border colour
                        $.each(data, function (k, d) {
                            data[k]['data'][j] = {
                                'y': data[k]['data'][j],
                                'borderColor': window.mqc_highlight_f_cols[idx]
                            }
                        });
                    }
                });
            });
            // Bump the borderWidth to make the highlights more obvious
            if (config['borderWidth'] <= 2) { config['borderWidth'] = 2; }
        }

        // Hide samples
        $('#' + target).closest('.mqc_hcplot_plotgroup').parent().find('.samples-hidden-warning').remove();
        $('#' + target).closest('.mqc_hcplot_plotgroup').show();
        if (window.mqc_hide_f_texts.length > 0) {
            var num_hidden = 0;
            var num_total = cats.length;
            var j = cats.length;
            while (j--) {
                var s_name = cats[j];
                var match = false;
                for (i = 0; i < window.mqc_hide_f_texts.length; i++) {
                    var f_text = window.mqc_hide_f_texts[i];
                    if (window.mqc_hide_regex_mode) {
                        if (s_name.match(f_text)) { match = true; }
                    } else {
                        if (s_name.indexOf(f_text) > -1) { match = true; }
                    }
                }
                if (window.mqc_hide_mode == 'show') {
                    match = !match;
                }
                if (match) {
                    cats.splice(j, 1);
                    $.each(data, function (k, d) {
                        data[k]['data'].splice(j, 1);
                    });
                    num_hidden += 1;
                }
            };
            // Some series hidden. Show a warning text string.
            if (num_hidden > 0) {
                var alert = '<div class="samples-hidden-warning alert alert-warning"><span class="glyphicon glyphicon-info-sign"></span> <strong>Warning:</strong> ' + num_hidden + ' samples hidden. <a href="#mqc_hidesamples" class="alert-link" onclick="mqc_toolbox_openclose(\'#mqc_hidesamples\', true); return false;">See toolbox.</a></div>';
                $('#' + target).closest('.mqc_hcplot_plotgroup').before(alert);
            }
            // All series hidden. Hide the graph.
            if (num_hidden == num_total) {
                $('#' + target).closest('.mqc_hcplot_plotgroup').hide();
                return false;
            }
        }

        // Make the highcharts plot
        Highcharts.chart(target, {
            chart: {
                type: 'bar',
                zoomType: 'x'
            },
            title: {
                text: config['title'],
            },
            xAxis: {
                categories: cats,
                min: 0,
                title: {
                    text: config['xlab']
                },
            },
            yAxis: {
                title: {
                    text: config['ylab']
                },
                labels: { format: config['yLabelFormat'] ? config['yLabelFormat'] : '{value}' },
                ceiling: config['yCeiling'],
                floor: config['yFloor'],
                minRange: config['yMinRange'],
                max: config['ymax'],
                min: config['ymin'],
                type: config['ytype'],
                labels: {
                    format: config['ylab_format']
                },
                allowDecimals: config['yDecimals'],
                reversedStacks: config['reversedStacks'],
                minorTickInterval: minTickInt
            },
            plotOptions: {
                series: {
                    stacking: config['stacking'],
                    pointPadding: config['pointPadding'],
                    groupPadding: config['groupPadding'],
                    borderWidth: config['borderWidth']
                },
                cursor: config['cursor'],
                point: {
                    events: {
                        click: config['click_func']
                    }
                }
            },
            legend: {
                enabled: config['use_legend']
            },
            tooltip: {
                formatter: function () {
                    var colspan = config['tt_percentages'] ? 3 : 2;
                    var s = '<table><tr><th colspan="' + colspan + '" style="font-weight:bold; text-decoration:underline;">' + this.x + '</th></tr>';
                    $.each(this.points, function () {
                        yval = Highcharts.numberFormat(this.y, (config['tt_decimals'] == undefined ? 0 : config['tt_decimals'])) + (config['tt_suffix'] || '');
                        ypct = Highcharts.numberFormat(this.percentage, 1);
                        s += '<tr> \
            <td style="font-weight:bold; color:'+ this.series.color + '; border-bottom:1px solid #dedede;">' + this.series.name + ':</td>\
            <td style="text-align:right; border-bottom:1px solid #dedede; padding: 0 15px;">' + yval + '</td>';
                        if (config['tt_percentages']) {
                            s += '<td style="text-align:right; border-bottom:1px solid #dedede;">(' + ypct + '%)</td>';
                        }
                        s += '</tr>';
                    });
                    s += '</table>';
                    return s;
                },
                shared: true,
                useHTML: true
            },
            series: data
        });
    }


    // Scatter plot
    function plot_scatter_plot(target, ds) {
        if (mqc_plots[target] === undefined || mqc_plots[target]['plot_type'] !== 'scatter') {
            return false;
        }
        var config = mqc_plots[target]['config'];
        var data = mqc_plots[target]['datasets'];
        if (ds === undefined) { ds = 0; }

        if (config['marker_colour'] === undefined) { config['marker_colour'] = 'rgba(124, 181, 236, .5)'; }
        if (config['marker_size'] === undefined) { config['marker_size'] = 5; }
        if (config['marker_line_colour'] === undefined) { config['marker_line_colour'] = '#999'; }
        if (config['marker_line_width'] === undefined) { config['marker_line_width'] = 1; }
        if (config['tt_label'] === undefined) { config['tt_label'] = 'X: <strong>{point.x:.2f}</strong><br/>Y: <strong>{point.y:.2f}</strong>'; }
        if (config['click_func'] === undefined) { config['click_func'] = function () { }; }
        else {
            config['click_func'] = eval("(" + config['click_func'] + ")");
            if (config['cursor'] === undefined) { config['cursor'] = 'pointer'; }
        }
        if (config['xDecimals'] === undefined) { config['xDecimals'] = true; }
        if (config['yDecimals'] === undefined) { config['yDecimals'] = true; }
        if (config['pointFormat'] === undefined) {
            config['pointFormat'] = '<div style="background-color:{point.color}; display:inline-block; height: 10px; width: 10px; border:1px solid #333;"></div> <span style="text-decoration:underline; font-weight:bold;">{point.name}</span><br>' + config['tt_label'];
        }

        // Make a clone of the data, so that we can mess with it,
        // while keeping the original data in tact
        var data = JSON.parse(JSON.stringify(mqc_plots[target]['datasets'][ds]));

        // Rename samples
        if (window.mqc_rename_f_texts.length > 0) {
            $.each(data, function (j, s) {
                $.each(window.mqc_rename_f_texts, function (idx, f_text) {
                    if (window.mqc_rename_regex_mode) {
                        var re = new RegExp(f_text, "g");
                        data[j]['name'] = data[j]['name'].replace(re, window.mqc_rename_t_texts[idx]);
                    } else {
                        data[j]['name'] = data[j]['name'].replace(f_text, window.mqc_rename_t_texts[idx]);
                    }
                });
            });
        }

        // Highlight samples
        if (window.mqc_highlight_f_texts.length > 0) {
            $.each(data, function (j, s) {
                if ('marker' in data[j]) {
                    data[j]['marker']['lineWidth'] = 0;
                } else {
                    data[j]['marker'] = { 'lineWidth': 0 };
                }
                var match = false;
                $.each(window.mqc_highlight_f_texts, function (idx, f_text) {
                    if (f_text == '') { return true; }
                    if ((window.mqc_highlight_regex_mode && data[j]['name'].match(f_text)) || (!window.mqc_highlight_regex_mode && data[j]['name'].indexOf(f_text) > -1)) {
                        data[j]['color'] = window.mqc_highlight_f_cols[idx];
                        match = true;
                    }
                });
                if (!match) {
                    data[j]['color'] = 'rgba(100,100,100,0.2)';
                }
            });
        }

        // Hide samples
        $('#' + target).closest('.mqc_hcplot_plotgroup').parent().find('.samples-hidden-warning').remove();
        $('#' + target).closest('.mqc_hcplot_plotgroup').show();
        if (window.mqc_hide_f_texts.length > 0) {
            var num_hidden = 0;
            var num_total = data.length;
            var j = data.length;
            while (j--) {
                var match = false;
                for (i = 0; i < window.mqc_hide_f_texts.length; i++) {
                    var f_text = window.mqc_hide_f_texts[i];
                    if (window.mqc_hide_regex_mode) {
                        if (data[j]['name'].match(f_text)) { match = true; }
                    } else {
                        if (data[j]['name'].indexOf(f_text) > -1) { match = true; }
                    }
                }
                if (window.mqc_hide_mode == 'show') {
                    match = !match;
                }
                if (match) {
                    data.splice(j, 1);
                    num_hidden += 1;
                }
            };
            // Some series hidden. Show a warning text string.
            if (num_hidden > 0) {
                var alert = '<div class="samples-hidden-warning alert alert-warning"><span class="glyphicon glyphicon-info-sign"></span> <strong>Warning:</strong> ' + num_hidden + ' samples hidden. <a href="#mqc_hidesamples" class="alert-link" onclick="mqc_toolbox_openclose(\'#mqc_hidesamples\', true); return false;">See toolbox.</a></div>';
                $('#' + target).closest('.mqc_hcplot_plotgroup').before(alert);
            }
            // All series hidden. Hide the graph.
            if (num_hidden == num_total) {
                $('#' + target).closest('.mqc_hcplot_plotgroup').hide();
                return false;
            }
        }

        // Make the highcharts plot
        Highcharts.chart(target, {
            chart: {
                type: 'scatter',
                zoomType: 'xy',
                plotBorderWidth: 1,
                height: config['square'] ? 500 : undefined,
                width: config['square'] ? 500 : undefined
            },
            title: {
                text: config['title'],
                x: 30 // fudge to center over plot area rather than whole plot
            },
            xAxis: {
                title: {
                    text: config['xlab']
                },
                type: config['xLog'] ? 'logarithmic' : 'linear',
                gridLineWidth: 1,
                categories: config['categories'],
                ceiling: config['xCeiling'],
                floor: config['xFloor'],
                max: config['xmax'],
                min: config['xmin'],
                minRange: config['xMinRange'],
                allowDecimals: config['xDecimals'],
                plotBands: config['xPlotBands'],
                plotLines: config['xPlotLines']
            },
            yAxis: {
                title: {
                    text: config['ylab']
                },
                type: config['yLog'] ? 'logarithmic' : 'linear',
                ceiling: config['yCeiling'],
                floor: config['yFloor'],
                max: config['ymax'],
                min: config['ymin'],
                minRange: config['yMinRange'],
                allowDecimals: config['yDecimals'],
                plotBands: config['yPlotBands'],
                plotLines: config['yPlotLines']
            },
            plotOptions: {
                series: {
                    animation: false,
                    marker: {
                        radius: config['marker_size'],
                        lineColor: config['marker_line_colour'],
                        lineWidth: config['marker_line_width'],
                        states: {
                            hover: {
                                enabled: config['enableHover'] == undefined ? true : config['enableHover'],
                                lineColor: 'rgb(100,100,100)'
                            }
                        }
                    },
                    turboThreshold: config['turboThreshold'],
                    enableMouseTracking: config['enableMouseTracking'],
                    cursor: config['cursor'],
                    point: {
                        events: {
                            click: config['click_func']
                        }
                    }
                }
            },
            legend: {
                enabled: false
            },
            tooltip: {
                headerFormat: '',
                pointFormat: config['pointFormat'],
                useHTML: true,
                formatter: (function () {
                    if (!this.point.noTooltip) {
                        // Formatter function doesn't do name for some reason
                        fstring = config['pointFormat'].replace('{point.name}', this.point.name);
                        return Highcharts.Point.prototype.tooltipFormatter.call(this, fstring);
                    }
                    return false;
                })
            },
            series: [{
                color: config['marker_colour'],
                data: data
            }]
        },
            // Maintain aspect ratio as chart size changes
            function (this_chart) {
                if (config['square']) {
                    var resizeCh = function (chart) {
                        // Extra width for legend
                        var lWidth = chart.options.legend.enabled ? 30 : 0;
                        // Work out new chart width, assuming needs to be narrower
                        var chHeight = $(chart.renderTo).height();
                        var chWidth = $(chart.renderTo).width();
                        var nChHeight = chHeight;
                        var nChWidth = chHeight + lWidth;
                        // Chart is already too narrow, make it less tall
                        if (chWidth < nChWidth) {
                            nChHeight = chWidth - lWidth;
                            nChWidth = chWidth;
                        }
                        chart.setSize(nChWidth, nChHeight);
                    }
                    // Resize on load
                    resizeCh(this_chart);
                    // Resize on graph resize
                    $(this_chart.renderTo).on('mqc_plotresize', function (e) {
                        resizeCh(this_chart);
                    });
                }
            });
    }

    // Beeswarm plot
    function plot_beeswarm_graph(target, ds) {
        if (mqc_plots[target] === undefined || mqc_plots[target]['plot_type'] !== 'beeswarm') {
            return false;
        }
        var config = mqc_plots[target]['config'];
        if (ds === undefined) { ds = 0; }

        // Make a clone of the data, so that we can mess with it,
        // while keeping the original data in tact
        var datasets = JSON.parse(JSON.stringify(mqc_plots[target]['datasets']));
        var samples = JSON.parse(JSON.stringify(mqc_plots[target]['samples']));
        var categories = JSON.parse(JSON.stringify(mqc_plots[target]['categories']));

        // Rename samples
        if (window.mqc_rename_f_texts.length > 0) {
            for (i = 0; i < samples.length; i++) {
                for (j = 0; j < samples[i].length; j++) {
                    $.each(window.mqc_rename_f_texts, function (idx, f_text) {
                        if (window.mqc_rename_regex_mode) {
                            var re = new RegExp(f_text, "g");
                            samples[i][j] = samples[i][j].replace(re, window.mqc_rename_t_texts[idx]);
                        } else {
                            samples[i][j] = samples[i][j].replace(f_text, window.mqc_rename_t_texts[idx]);
                        }
                    });
                }
            }
        }

        // Highlight samples
        var baseColour = 'rgb(55,126,184)'; // Blue points by default
        var seriesColours = {};
        if (window.mqc_highlight_f_texts.length > 0) {
            baseColour = 'rgb(80,80,80)'; // Grey points if no highlight
            for (i = 0; i < samples.length; i++) {
                for (j = 0; j < samples[i].length; j++) {
                    $.each(window.mqc_highlight_f_texts, function (idx, f_text) {
                        if ((window.mqc_highlight_regex_mode && samples[i][j].match(f_text)) || (!window.mqc_highlight_regex_mode && samples[i][j].indexOf(f_text) > -1)) {
                            seriesColours[samples[i][j]] = window.mqc_highlight_f_cols[idx];
                        }
                    });
                }
            }
        }

        // Hide samples
        $('#' + target).closest('.hc-plot-wrapper').parent().find('.samples-hidden-warning').remove();
        $('#' + target).closest('.hc-plot-wrapper').show();
        if (window.mqc_hide_f_texts.length > 0) {
            var num_hidden = 0;
            var num_total = 0;
            for (i = 0; i < samples.length; i++) {
                num_total = Math.max(num_total, samples[i].length);
                var j = samples[i].length;
                var hidden_here = 0;
                while (j--) {
                    var s_name = samples[i][j];
                    var match = false;
                    for (k = 0; k < window.mqc_hide_f_texts.length; k++) {
                        var f_text = window.mqc_hide_f_texts[k];
                        if (window.mqc_hide_regex_mode) {
                            if (s_name.match(f_text)) { match = true; }
                        } else {
                            if (s_name.indexOf(f_text) > -1) { match = true; }
                        }
                    }
                    if (window.mqc_hide_mode == 'show') {
                        match = !match;
                    }
                    if (match) {
                        samples[i].splice(j, 1);
                        datasets[i].splice(j, 1);
                        hidden_here += 1;
                    }
                };
                num_hidden = Math.max(num_hidden, hidden_here);
            };
            // Some series hidden. Show a warning text string.
            if (num_hidden > 0) {
                var alert = '<div class="samples-hidden-warning alert alert-warning"><span class="glyphicon glyphicon-info-sign"></span> <strong>Warning:</strong> ' + num_hidden + ' samples hidden. <a href="#mqc_hidesamples" class="alert-link" onclick="mqc_toolbox_openclose(\'#mqc_hidesamples\', true); return false;">See toolbox.</a></div>';
                $('#' + target).closest('.hc-plot-wrapper').before(alert);
            }
            // All series hidden. Hide the graph.
            if (num_hidden == num_total) {
                $('#' + target).closest('.hc-plot-wrapper').hide();
                return false;
            }
        }

        // Figure out how tall to make each plot
        var ph_min = 40;
        var ph_max = 100;
        var pheight = 600 / categories.length;
        pheight = Math.min(ph_max, Math.max(ph_min, pheight));

        // Clear the loading text and add hover text placeholder
        $('#' + target).html('<div class="beeswarm-hovertext"><em class="placeholder">Hover over a data point for more information</em></div><div class="beeswarm-plots"></div>');
        // Resize the parent draggable div
        $('#' + target).parent().css('height', ((pheight * categories.length) + 40) + 'px');

        for (var i = 0; i < categories.length; i++) {

            var borderCol = categories[i]['bordercol'];
            if (borderCol == undefined) {
                borderCol = '#cccccc';
            }

            var data = datasets[i];
            var s_names = samples[i];
            if (categories[i]['namespace'] == '') {
                var label = categories[i]['title'];
                var label_long = categories[i]['description'];
            } else {
                var label = categories[i]['namespace'] + '<br/>' + categories[i]['title'];
                var label_long = categories[i]['namespace'] + ': ' + categories[i]['description'];
            }
            var ttSuffix = categories[i]['suffix'];
            var decimalPlaces = categories[i]['decimalPlaces'];
            var minx = categories[i]['min'];
            var maxx = categories[i]['max'];

            // Size and spacing options
            var markerRadius = 2.5
            var yspace = 70;
            var ysep = 10;
            if (data.length > 50) {
                markerRadius = 1.8
                yspace = 50;
                ysep = 20;
            }
            if (data.length > 200) {
                markerRadius = 1
                yspace = 30;
                ysep = 30;
            }

            if (maxx == undefined) {
                maxx = Math.max.apply(null, data);
            }
            if (minx == undefined) {
                minx = Math.max.apply(null, data);
            }
            var range = maxx - minx;
            var sep = range / yspace;
            // Get an array of indexes from a sorted data array
            // Leaves the data order in tact so we don't lose s_name association
            var indices = new Array(data.length);
            for (var n = 0; n < data.length; n++) { indices[n] = n; }
            indices.sort(function (a, b) {
                return data[a] < data[b] ? -1 : data[a] > data[b] ? 1 : 0;
            });
            var xydata = [];
            var last = undefined;
            var side = 1;
            for (var s_idx = 0; s_idx < indices.length; s_idx++) {
                row = indices[s_idx];
                s_name = s_names[row];
                d = data[row];
                if (Math.floor(d / sep) !== last) {
                    last = Math.floor(d / sep);
                    side = 1;
                } else {
                    side += 1;
                }
                multiplier = (side % 2 == 0) ? 1 : -1;
                var y = (Math.floor(side / 2) * multiplier) / ysep;
                // Don't let jitter get too big
                while (y > 1 || y < -1) {
                    var n = Math.floor(Math.abs(y)) + 1;
                    y = (Math.floor(side / 2) * multiplier) / (ysep * n);
                }
                // Get the point colour
                var thisCol = baseColour;
                if (s_name in seriesColours) {
                    thisCol = seriesColours[s_name];
                }
                xydata.push({
                    'x': d,
                    'y': y,
                    'name': s_name,
                    'color': thisCol
                });
            }

            $('<div class="beeswarm-plot" />')
                .appendTo('#' + target + ' .beeswarm-plots')
                .css({
                    'border-left': '2px solid ' + borderCol,
                    'height': (100 / categories.length) + '%'
                })
                .highcharts({
                    chart: {
                        type: 'scatter',
                        spacingTop: 0,
                        marginBottom: 0,
                        marginRight: 20,
                        marginLeft: 180,
                        backgroundColor: 'transparent',
                        // Horrible hacky HighCharts reflow problem.
                        // TODO: Come back and find a better solution!
                        events: {
                            load: function (chart) {
                                setTimeout(function () {
                                    chart.target.reflow();
                                }, 200);
                            }
                        }
                    },
                    title: {
                        text: label,
                        align: 'left',
                        verticalAlign: 'middle',
                        y: 10,
                        useHTML: true,
                        style: {
                            fontSize: '12px'
                        }
                    },
                    yAxis: {
                        title: { text: null },
                        max: 1,
                        min: -1,
                        gridLineWidth: 0,
                        title: { text: null },
                        labels: { enabled: false },
                        lineWidth: 0
                    },
                    xAxis: {
                        lineWidth: 0,
                        tickWidth: 0,
                        tickPixelInterval: 200,
                        labels: {
                            reserveSpace: false,
                            y: (-1 * (pheight / 2)) + 5,
                            zIndex: 1,
                            style: {
                                color: '#999999'
                            }
                        },
                        min: minx,
                        max: maxx,
                    },
                    tooltip: {
                        valueSuffix: ttSuffix,
                        valueDecimals: decimalPlaces,
                        formatter: function () {
                            var value = Highcharts.numberFormat(this.point.x, this.series.tooltipOptions.valueDecimals);
                            var suff = this.series.tooltipOptions.valueSuffix;
                            var ttstring = '<span style="float:right;">' + this.series.name + '</span><samp>' + this.point.name + '</samp>: &nbsp; <strong>' + value + ' ' + suff + '</strong>';
                            $('#' + target + ' .beeswarm-hovertext').html(ttstring);
                            return false;
                        }
                    },
                    plotOptions: {
                        series: {
                            name: label_long,
                            turboThreshold: 0,
                            marker: {
                                radius: markerRadius,
                                states: {
                                    hover: {
                                        radiusPlus: 4,
                                        lineWidthPlus: 2,
                                        lineColor: '#333333'
                                    }
                                }
                            },
                            stickyTracking: false,
                            point: {
                                events: {
                                    mouseOver: function (e) {
                                        var hovName = this.name;
                                        $('#' + target + ' .beeswarm-plot').each(function () {
                                            var plot = $(this).highcharts();
                                            for (i = 0; i < plot.series[0].data.length; ++i) {
                                                if (plot.series[0].data[i].name == hovName) {
                                                    plot.series[0].data[i].setState('hover');
                                                }
                                            }
                                        });

                                    },
                                    mouseOut: function () {
                                        $('#' + target + ' .beeswarm-plot').each(function () {
                                            var plot = $(this).highcharts();
                                            for (i = 0; i < plot.series[0].data.length; ++i) {
                                                plot.series[0].data[i].setState();
                                            }
                                        });
                                        $('#' + target + ' .beeswarm-hovertext').html('<em class="placeholder">Hover over a data point for more information</em>');
                                    }
                                }
                            }
                        }
                    },
                    legend: { enabled: false },
                    credits: { enabled: false },
                    exporting: { enabled: false },
                    series: [{
                        data: xydata,
                        // Workaround for HighCharts bug. See https://github.com/highcharts/highcharts/issues/1440
                        marker: { states: { hover: { fillColor: {} } } }
                    }]

                });

        }
    }

    // Heatmap plot
    function plot_heatmap(target, ds) {
        if (mqc_plots[target] === undefined || mqc_plots[target]['plot_type'] !== 'heatmap') {
            return false;
        }
        var config = mqc_plots[target]['config'];

        if (config['square'] === undefined) { config['square'] = true; }

        // Make a clone of the data, so that we can mess with it,
        // while keeping the original data in tact
        var data = JSON.parse(JSON.stringify(mqc_plots[target]['data']));
        var xcats = JSON.parse(JSON.stringify(mqc_plots[target]['xcats']));
        var ycats = JSON.parse(JSON.stringify(mqc_plots[target]['ycats']));

        // Rename samples
        if (window.mqc_rename_f_texts.length > 0) {
            for (i = 0; i < xcats.length; i++) {
                $.each(window.mqc_rename_f_texts, function (idx, f_text) {
                    if (window.mqc_rename_regex_mode) {
                        var re = new RegExp(f_text, "g");
                        xcats[i] = xcats[i].replace(re, window.mqc_rename_t_texts[idx]);
                    } else {
                        xcats[i] = xcats[i].replace(f_text, window.mqc_rename_t_texts[idx]);
                    }
                });
            }
            for (i = 0; i < ycats.length; i++) {
                $.each(window.mqc_rename_f_texts, function (idx, f_text) {
                    if (window.mqc_rename_regex_mode) {
                        var re = new RegExp(f_text, "g");
                        ycats[i] = ycats[i].replace(re, window.mqc_rename_t_texts[idx]);
                    } else {
                        ycats[i] = ycats[i].replace(f_text, window.mqc_rename_t_texts[idx]);
                    }
                });
            }
        }

        // Sort samples by highlight
        $('.mqc_heatmap_sortHighlight').attr('disabled', false);
        if (config['sortHighlights'] == true) {
            if (window.mqc_highlight_f_texts.length > 0) {
                // Collect the highlighting indices
                var xcat_hl = Array();
                var ycat_hl = Array();
                for (i = 0; i < xcats.length; i++) {
                    $.each(window.mqc_highlight_f_texts, function (idx, f_text) {
                        if (f_text == '') { xcat_hl[i] = 0; }
                        else if ((window.mqc_highlight_regex_mode && xcats[i].match(f_text)) || (!window.mqc_highlight_regex_mode && xcats[i].indexOf(f_text) > -1)) {
                            xcat_hl[i] = window.mqc_highlight_f_texts.length - idx;
                        }
                    });
                }
                for (i = 0; i < ycats.length; i++) {
                    $.each(window.mqc_highlight_f_texts, function (idx, f_text) {
                        if (f_text == '') { ycat_hl[i] = 0; }
                        else if ((window.mqc_highlight_regex_mode && ycats[i].match(f_text)) || (!window.mqc_highlight_regex_mode && ycats[i].indexOf(f_text) > -1)) {
                            ycat_hl[i] = window.mqc_highlight_f_texts.length - idx;
                        }
                    });
                }
                // Reshape the data - needs deepcopy as indexes are updated
                var newdata = JSON.parse(JSON.stringify(mqc_plots[target]['data']));
                var new_xcats = [], new_ycats = [];
                var xidx = 0, yidx = 0;
                for (hl = window.mqc_highlight_f_texts.length; hl >= 0; hl--) {
                    for (i = 0; i < xcats.length; i++) {
                        if (xcat_hl[i] == hl) {
                            new_xcats.push(xcats[i])
                            for (j = 0; j < data.length; j++) {
                                if (data[j][0] == i) { newdata[j][0] = xidx; }
                            }
                            xidx += 1;
                        }
                    }
                    for (i = 0; i < ycats.length; i++) {
                        if (ycat_hl[i] == hl) {
                            new_ycats.push(ycats[i])
                            for (j = 0; j < data.length; j++) {
                                if (data[j][1] == i) { newdata[j][1] = yidx; }
                            }
                            yidx += 1;
                        }
                    }
                }
                data = newdata;
                xcats = new_xcats;
                ycats = new_ycats;
            }
        }

        // Hide samples
        var num_total = Math.max(xcats.length, ycats.length);
        $('#' + target).closest('.hc-plot-wrapper').parent().find('.samples-hidden-warning').remove();
        $('#' + target).closest('.hc-plot-wrapper').show();
        if (window.mqc_hide_f_texts.length > 0) {
            var remove = Array();
            var i = xcats.length;
            var xhidden = 0;
            while (i--) {
                var match = false;
                for (j = 0; j < window.mqc_hide_f_texts.length; j++) {
                    var f_text = window.mqc_hide_f_texts[j];
                    if (window.mqc_hide_regex_mode) {
                        if (xcats[i].match(f_text)) { match = true; }
                    } else {
                        if (xcats[i].indexOf(f_text) > -1) { match = true; }
                    }
                }
                if (window.mqc_hide_mode == 'show') {
                    match = !match;
                }
                if (match) {
                    xcats.splice(i, 1);
                    for (n = 0; n < data.length; n++) {
                        var x = data[n][1];
                        if (x == i) { remove.push(n); }
                        else if (x > i) { data[n][1] -= 1; }
                    }
                    xhidden += 1;
                }
            }
            var i = ycats.length;
            var yhidden = 0;
            while (i--) {
                var match = false;
                for (j = 0; j < window.mqc_hide_f_texts.length; j++) {
                    var f_text = window.mqc_hide_f_texts[j];
                    if (window.mqc_hide_regex_mode) {
                        if (ycats[i].match(f_text)) { match = true; }
                    } else {
                        if (ycats[i].indexOf(f_text) > -1) { match = true; }
                    }
                }
                if (window.mqc_hide_mode == 'show') {
                    match = !match;
                }
                if (match) {
                    ycats.splice(i, 1);
                    for (n = 0; n < data.length; n++) {
                        var y = data[n][0];
                        if (y == i) {
                            if (remove.indexOf(n) < 0) { remove.push(n); }
                        } else if (y > i) { data[n][0] -= 1; }
                    }
                    yhidden += 1;
                }
            }
            // Remove the data values that matched
            remove = remove.sort(function (a, b) { return a - b }); // Sorts alphabetically by default, even with integers
            var r = remove.length;
            while (r--) {
                data.splice(remove[r], 1);
            }
            // Report / hide the plot if we're hiding stuff
            var num_hidden = Math.max(xhidden, yhidden);
            // Some series hidden. Show a warning text string.
            if (num_hidden > 0) {
                var alert = '<div class="samples-hidden-warning alert alert-warning"><span class="glyphicon glyphicon-info-sign"></span> <strong>Warning:</strong> ' + num_hidden + ' samples hidden. <a href="#mqc_hidesamples" class="alert-link" onclick="mqc_toolbox_openclose(\'#mqc_hidesamples\', true); return false;">See toolbox.</a></div>';
                $('#' + target).closest('.hc-plot-wrapper').before(alert);
            }
            // All series hidden. Hide the graph.
            if (num_hidden >= num_total) {
                $('#' + target).closest('.hc-plot-wrapper').hide();
                return false;
            }
        }

        // Highlight samples - do this last as we convert numerical arrays to associative
        if (window.mqc_highlight_f_texts.length > 0) {
            $('.mqc_heatmap_sortHighlight').attr('disabled', false);
            var highlight_cells = Array();
            for (i = 0; i < xcats.length; i++) {
                $.each(window.mqc_highlight_f_texts, function (idx, f_text) {
                    if (f_text == '') { return true; }
                    if ((window.mqc_highlight_regex_mode && xcats[i].match(f_text)) || (!window.mqc_highlight_regex_mode && xcats[i].indexOf(f_text) > -1)) {
                        for (n = 0; n < data.length; n++) {
                            highlight_cells[idx] = (typeof highlight_cells[idx] != 'undefined' && highlight_cells[idx] instanceof Array) ? highlight_cells[idx] : [];
                            if (data[n][1] == i) { highlight_cells[idx].push(n); }
                        }
                    }
                });
            }
            for (i = 0; i < ycats.length; i++) {
                $.each(window.mqc_highlight_f_texts, function (idx, f_text) {
                    if (f_text == '') { return true; }
                    if ((window.mqc_highlight_regex_mode && ycats[i].match(f_text)) || (!window.mqc_highlight_regex_mode && ycats[i].indexOf(f_text) > -1)) {
                        for (n = 0; n < data.length; n++) {
                            if (data[n][0] == i) {
                                highlight_cells[idx] = (typeof highlight_cells[idx] != 'undefined' && highlight_cells[idx] instanceof Array) ? highlight_cells[idx] : [];
                                if (highlight_cells[idx].indexOf(n) < 0) { highlight_cells[idx].push(n); }
                            }
                        }
                    }
                });
            }
            // Give highlighted cells a border
            for (var idx in highlight_cells) {
                var hl = highlight_cells[idx];
                hl = hl.sort(function (a, b) { return a - b }); // Sorts alphabetically by default, even with integers
                var h = hl.length;
                while (h--) {
                    var i = hl[h];
                    data[i] = {
                        x: data[i][1] === undefined ? data[i]['x'] : data[i][1],
                        y: data[i][0] === undefined ? data[i]['y'] : data[i][0],
                        value: data[i][2] === undefined ? data[i]['value'] : data[i][2],
                        borderWidth: 2,
                        borderColor: window.mqc_highlight_f_cols[idx]
                    }
                }
            }
        } else {
            $('.mqc_heatmap_sortHighlight').attr('disabled', true);
        }

        // We set undefined config vars so that they stay the same when hiding samples
        if (config['min'] === undefined || config['max'] === undefined) {
            var dmin = data[0][2];
            var dmax = data[0][2];
            for (n = 0; n < data.length; n++) {
                dmin = Math.min(dmin, data[n][2]);
                dmax = Math.max(dmax, data[n][2]);
            }
            if (config['min'] === undefined) { config['min'] = dmin; }
            if (config['max'] === undefined) { config['max'] = dmax; }
        }
        if (config['colstops'] === undefined) {
            config['colstops'] = [
                [0, '#313695'],
                [0.1, '#4575b4'],
                [0.2, '#74add1'],
                [0.3, '#abd9e9'],
                [0.4, '#e0f3f8'],
                [0.5, '#ffffbf'],
                [0.6, '#fee090'],
                [0.7, '#fdae61'],
                [0.8, '#f46d43'],
                [0.9, '#d73027'],
                [1, '#a50026'],
            ];
        }
        if (config['reverseColors'] === undefined) { config['reverseColors'] = false; }
        if (config['decimalPlaces'] === undefined) { config['decimalPlaces'] = 2; }
        if (config['legend'] === undefined) { config['legend'] = true; }
        if (config['borderWidth'] === undefined) { config['borderWidth'] = 0; }
        var datalabels = config['datalabels'];
        if (datalabels === undefined) {
            if (data.length < 20) { datalabels = true; }
            else { datalabels = false; }
        }
        // Clone the colstops before we mess around with them
        var colstops = JSON.parse(JSON.stringify(config['colstops']));
        // Reverse the colour scale if the axis is reversed
        if (config['reverseColors']) {
            for (var i = 0; i < colstops.length; i++) {
                colstops[i][0] = 1 - colstops[i][0];
            }
            colstops.reverse();
        }

        // Make the highcharts plot
        Highcharts.chart(target, {
            chart: {
                type: 'heatmap',
                zoomType: 'xy',
                height: config['square'] ? 500 : undefined,
                width: config['square'] ? 530 : undefined,
                marginTop: config['title'] ? 60 : 50
            },
            plotOptions: {
                series: {
                    states: {
                        hover: {
                            borderWidth: 2,
                            borderColor: 'red'
                        }
                    }
                }
            },
            title: {
                text: config['title'],
            },
            xAxis: {
                endOnTick: false,
                maxPadding: 0,
                categories: xcats,
                title: { enabled: true, text: config['xTitle'] },
                labels: {
                    formatter: function () {
                        try { return this.value.substr(0, 20); }
                        catch (err) { return this.value; }
                    }
                }
            },
            yAxis: {
                endOnTick: false,
                maxPadding: 0,
                categories: ycats,
                reversed: true,
                opposite: true,
                title: config['yTitle'],
                labels: {
                    formatter: function () {
                        try { return this.value.substr(0, 20); }
                        catch (err) { return this.value; }
                    }
                }
            },
            colorAxis: {
                reversed: config['reverseColors'],
                stops: colstops,
                min: config['min'],
                max: config['max'],
            },
            legend: {
                align: 'right',
                layout: 'vertical',
                margin: 0,
                verticalAlign: 'top',
                y: 25,
                symbolHeight: 280,
                enabled: config['legend']
            },
            tooltip: {
                useHTML: true,
                formatter: function () {
                    return 'X: <span style="font-weight:bold; font-family:monospace;">' + this.series.xAxis.categories[this.point.x] + '</span><br>' +
                        'Y: <span style="font-weight:bold; font-family:monospace;">' + this.series.yAxis.categories[this.point.y] + '</span><br>' +
                        '<div style="background-color:' + this.point.color + '; display:inline-block; height: 10px; width: 10px; border:1px solid #333;"></div> ' +
                        '<span style="font-weight: bold; text-decoration:underline;">' + Highcharts.numberFormat(this.point.value, config['decimalPlaces']) + '</span>'
                }
            },
            series: [{
                turboThreshold: 0,
                borderWidth: config['borderWidth'],
                data: data,
                dataLabels: {
                    enabled: datalabels,
                    format: '{point.value:.' + config['decimalPlaces'] + 'f}',
                    color: config['datalabel_colour']
                }
            }]
        }, function (this_chart) {
            // Maintain aspect ratio as chart size changes
            if (config['square']) {
                var resizeCh = function (chart) {
                    // Extra width for legend
                    var lWidth = chart.options.legend.enabled ? 30 : 0;
                    // Work out new chart width, assuming needs to be narrower
                    var chHeight = $(chart.renderTo).height();
                    var chWidth = $(chart.renderTo).width();
                    var nChHeight = chHeight;
                    var nChWidth = chHeight + lWidth;
                    // Chart is already too narrow, make it less tall
                    if (chWidth < nChWidth) {
                        nChHeight = chWidth - lWidth;
                        nChWidth = chWidth;
                    }
                    chart.setSize(nChWidth, nChHeight);
                }
                // Resize on load
                resizeCh(this_chart);
                // Resize on graph resize
                $(this_chart.renderTo).on('mqc_plotresize', function (e) {
                    try {
                        resizeCh(this_chart);
                    } catch (e) {
                        plot_heatmap($(this).attr('id'));
                    }
                });
            }
        });

    }

    // Highlight text with a fadeout background colour highlight
    function highlight_fade_text(obj) {
        var orig_col = $(obj).css('color');
        obj.css({
            'display': 'inline-block',
            'background-color': '#5bc0de',
            'color': '#FFFFFF',
            'WebkitTransition': 'background-color 0s, color 0s',
            'MozTransition': 'background-color 0s, color 0s',
            'MsTransition': 'background-color 0s, color 0s',
            'OTransition': 'background-color 0s, color 0s',
            'transition': 'background-color 0s, color 0s'
        });
        setTimeout(function () {
            obj.css({
                'background-color': '#FFFFFF',
                'color': orig_col,
                'WebkitTransition': 'background-color 0.5s, color 0.5s',
                'MozTransition': 'background-color 0.5s, color 0.5s',
                'MsTransition': 'background-color 0.5s, color 0.5s',
                'OTransition': 'background-color 0.5s, color 0.5s',
                'transition': 'background-color 0.5s, color 0.5s'
            });
        }, 500);
    }
</script>
<script type="text/javascript">////////////////////////////////////////////////
    // Static MatPlotLib Plots Javascript Code
    ////////////////////////////////////////////////

    // On page load
    $(function () {

        // Switch between counts and percentages in a bar plot
        $('.mqc_mplplot_bargraph_setcountspcnt button').click(function (e) {
            e.preventDefault();
            if (!$(this).hasClass('active')) {
                $(this).siblings('button.active').removeClass('active');
                $(this).addClass('active');
                var wrapper = $(this).closest('.mqc_mplplot_plotgroup');
                var current = '#' + wrapper.find('.mqc_mplplot:visible').attr('id');
                if (current.substr(current.length - 3) == '_pc') {
                    var target = current.substr(0, current.length - 3);
                } else {
                    var target = current + '_pc';
                }
                wrapper.find('.mqc_mplplot').hide();
                $(target).show();
            }
        });

        // Switch datasets in a bar plot
        $('.mqc_mplplot_bargraph_switchds button').click(function (e) {
            e.preventDefault();
            if (!$(this).hasClass('active')) {
                $(this).siblings('button.active').removeClass('active');
                $(this).addClass('active');
                var target = $(this).data('target');
                var wrapper = $(target).closest('.mqc_mplplot_plotgroup');
                if (wrapper.find('.mqc_mplplot_bargraph_setcountspcnt .pcnt').hasClass('active')) {
                    target += '_pc';
                }
                wrapper.find('.mqc_mplplot').hide();
                $(target).show();
            }
        });

    });</script>
<script type="text/javascript">////////////////////////////////////////////////
    // MultiQC Report Toolbox Code
    ////////////////////////////////////////////////

    var mqc_colours_idx = 0;
    var mqc_colours = ['#e41a1c', '#377eb8', '#4daf4a', '#984ea3', '#ff7f00', '#ffff33', '#a65628', '#f781bf', '#999999'];

    //////////////////////////////////////////////////////
    // TOOLBOX LISTENERS
    //////////////////////////////////////////////////////
    $(function () {

        // Batch sample renaming buttons
        $('.mqc_sname_switches').click(function (e) {
            e.preventDefault();
            if ($(this).hasClass('active')) {
                return false;
            }
            $('#mqc_sname_switches button').removeClass('active');
            $(this).addClass('active');
            // Clear previous bulk renaming entries
            $('.mqc_sname_switches_li').remove();
            // Build new renaming entries and apply
            var j = $(this).data('index');
            if (j == 0) {
                apply_mqc_renamesamples();
            } else {
                for (i = 0; i < mqc_config['sample_names_rename'].length; i++) {
                    var ft = mqc_config['sample_names_rename'][i][0];
                    var tt = mqc_config['sample_names_rename'][i][j];
                    $('#mqc_renamesamples_filters').append('<li class="mqc_sname_switches_li"> \
          <input class="f_text from_text" value="'+ ft + '" /><small class="glyphicon glyphicon-chevron-right"></small><input class="f_text to_text" value="' + tt + '" /> \
          <button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button> \
        </li>');
                }
                apply_mqc_renamesamples();
            }
        });

        // Hide toolbox when clicking outside
        $(document).mouseup(function (e) {
            if (!$(".mqc-toolbox").is(e.target) && $(".mqc-toolbox").has(e.target).length === 0) {
                if ($('.mqc-toolbox').hasClass('active')) {
                    mqc_toolbox_openclose(undefined, false);
                }
            }
        });

        // Hide toolbox when a modal is shown
        $('.modal').on('show.bs.modal', function (e) {
            if ($('.mqc-toolbox').hasClass('active')) {
                mqc_toolbox_openclose(undefined, false);
            }
        });

        // Listener to re-plot graphs if config loaded
        $(document).on('mqc_config_loaded', function (e) {
            $('.hc-plot').each(function () {
                var target = $(this).attr('id');
                plot_graph(target, undefined, mqc_config['num_datasets_plot_limit']);
            });
        });

        // Toolbox buttons
        $('.mqc-toolbox-buttons a').click(function (e) {
            e.preventDefault();
            var target = $(this).attr('href');
            mqc_toolbox_openclose(target);
        });

        // Highlight colour filters
        $('#mqc_color_form').submit(function (e) {
            e.preventDefault();
            var f_text = $('#mqc_colour_filter').val().trim();
            var f_col = $('#mqc_colour_filter_color').val().trim();
            $('#mqc_col_filters').append('<li style="color:' + f_col + ';" id="' + hashCode(f_text + f_col) + '"><span class="hc_handle"><span></span><span></span></span><input class="f_text" value="' + f_text + '" tabindex="' + (mqc_colours_idx) + '" /><button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button></li>');
            $('#mqc_cols_apply').attr('disabled', false).removeClass('btn-default').addClass('btn-primary');
            $('#mqc_colour_filter').val('');
            mqc_colours_idx += 1;
            if (mqc_colours_idx >= mqc_colours.length) { mqc_colours_idx = 0; }
            $('#mqc_colour_filter_color').val(mqc_colours[mqc_colours_idx]);
        });
        $('#mqc_cols_apply').click(function (e) {
            if (apply_mqc_highlights()) {
                $(this).attr('disabled', true).removeClass('btn-primary').addClass('btn-default');
            }
        });

        // Rename samples
        var mqc_renamesamples_idx = 300;
        $('#mqc_renamesamples_form').submit(function (event) {
            event.preventDefault();

            var from_text = $('#mqc_renamesamples_from').val().trim();
            var to_text = $('#mqc_renamesamples_to').val().trim();

            if (from_text.length == 0) {
                alert('Error - "From" text must not be blank.');
                return false;
            }

            var li = '<li><input class="f_text from_text" value="' + from_text + '" tabindex="' + (mqc_renamesamples_idx) + '" />'
            li += '<small class="glyphicon glyphicon-chevron-right"></small><input class="f_text to_text" value="' + to_text + '" tabindex="' + (mqc_renamesamples_idx + 1) + '" />'
            li += '<button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button></li>'
            $('#mqc_renamesamples_filters').append(li);
            $('#mqc_rename_apply').attr('disabled', false).removeClass('btn-default').addClass('btn-primary');

            // Reset form
            $('#mqc_renamesamples_from').val('');
            $('#mqc_renamesamples_to').val('');
            mqc_renamesamples_idx += 2;
            $('#mqc_renamesamples_form input:first').focus();
        });

        $('#mqc_rename_apply').click(function (e) {
            if (apply_mqc_renamesamples()) {
                $(this).attr('disabled', true).removeClass('btn-primary').addClass('btn-default');
            }
        });

        // Bulk rename samples
        $('#mqc_renamesamples_bulk_collapse').on('shown.bs.collapse', function () {
            $('#mqc_renamesamples_bulk_form textarea').focus();
        });
        $('#mqc_renamesamples_bulk_form').submit(function (e) {
            e.preventDefault();
            var raw = $(this).find('textarea').val();
            var lines = raw.match(/^.*([\n\r]+|$)/gm);
            $.each(lines, function (i, l) {
                var sections = l.split("\t", 2);
                if (sections.length < 2) { return true; }
                var from_text = sections[0].trim();
                var to_text = sections[1].trim();
                if (from_text.length == 0) { return true; }
                var li = '<li><input class="f_text from_text" value="' + from_text + '" tabindex="' + (mqc_renamesamples_idx) + '" />'
                li += '<small class="glyphicon glyphicon-chevron-right"></small><input class="f_text to_text" value="' + to_text + '" tabindex="' + (mqc_renamesamples_idx + 1) + '" />'
                li += '<button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button></li>'
                $('#mqc_renamesamples_filters').append(li);
            });
            $('#mqc_rename_apply').attr('disabled', false).removeClass('btn-default').addClass('btn-primary');
            $(this).find('textarea').val('');
            $('#mqc_renamesamples_bulk_collapse').collapse('hide');
        });

        // Hide sample filters
        var mqc_hidesamples_idx = 200;
        $('#mqc_hidesamples_form').submit(function (e) {
            e.preventDefault();
            var f_text = $('#mqc_hidesamples_filter').val().trim();
            if (f_text.length == 0) {
                alert('Error - filter text must not be blank.');
                return false;
            }
            $('#mqc_hidesamples_filters').append('<li><input class="f_text" value="' + f_text + '" tabindex="' + (mqc_hidesamples_idx) + '" /><button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button></li>');
            $('#mqc_hide_apply').attr('disabled', false).removeClass('btn-default').addClass('btn-primary');
            $('#mqc_hidesamples_filter').val('');
            mqc_hidesamples_idx += 1;
        });
        $('.mqc_hidesamples_showhide').change(function (e) {
            $('#mqc_hide_apply').attr('disabled', false).removeClass('btn-default').addClass('btn-primary');
        });
        $('#mqc_hide_apply').click(function (e) {
            if (apply_mqc_hidesamples()) {
                $(this).attr('disabled', true).removeClass('btn-primary').addClass('btn-default');
            }
        });

        // EXPORTING PLOTS
        // Change text on download button
        $('#mqc_exportplots a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            if ($(e.target).attr('href') == '#mqc_data_download') {
                $('#mqc-dl-plot-txt').text('Data');
            } else {
                $('#mqc-dl-plot-txt').text('Images');
            }
        });
        // Load the plot exporter
        if ($('.hc-plot').length > 0) {
            $('.hc-plot').each(function () {
                var fname = $(this).attr('id');
                $('#mqc_export_selectplots').append('<div class="checkbox"><label><input type="checkbox" value="' + fname + '" checked> ' + fname + '</label></div>');
            });
            // Select all / none for checkboxes
            $('#mqc_export_sall').click(function (e) {
                e.preventDefault();
                $('#mqc_export_selectplots input').prop('checked', true);
            });
            $('#mqc_export_snone').click(function (e) {
                e.preventDefault();
                $('#mqc_export_selectplots input').prop('checked', false);
            });
            // Aspect ratio fixed
            var mqc_exp_aspect_ratio = $('#mqc_exp_width').val() / $('#mqc_exp_height').val();
            $('#mqc_export_aspratio').change(function () {
                if ($(this).is(':checked')) {
                    mqc_exp_aspect_ratio = $('#mqc_exp_width').val() / $('#mqc_exp_height').val();
                }
            });
            $('#mqc_exp_width').keyup(function () {
                if ($('#mqc_export_aspratio').is(':checked')) {
                    $('#mqc_exp_height').val($(this).val() / mqc_exp_aspect_ratio);
                }
            });
            $('#mqc_exp_height').keyup(function () {
                if ($('#mqc_export_aspratio').is(':checked')) {
                    $('#mqc_exp_width').val($(this).val() * mqc_exp_aspect_ratio);
                }
            });

            // Export the plots
            $('#mqc_exportplots').submit(function (e) {
                e.preventDefault();
                var skipped_plots = 0;
                ////// EXPORT PLOT IMAGES
                //////
                if ($('#mqc_image_download').is(':visible')) {
                    var ft = $('#mqc_export_ft').val();
                    var f_scale = parseInt($('#mqc_export_scaling').val());
                    var f_width = parseInt($('#mqc_exp_width').val()) / f_scale;
                    var f_height = parseInt($('#mqc_exp_height').val()) / f_scale;
                    $('#mqc_export_selectplots input:checked').each(function () {
                        var fname = $(this).val();
                        var hc = $('#' + fname).highcharts();
                        var cfg = {
                            type: ft,
                            filename: fname,
                            sourceWidth: f_width,
                            sourceHeight: f_height,
                            scale: f_scale
                        };
                        if (hc !== undefined) {
                            hc.exportChartLocal(cfg);
                        } else if ($('#' + fname).hasClass('has-custom-export')) {
                            $('#' + fname).trigger('mqc_plotexport_image', cfg);
                        } else {
                            skipped_plots += 1;
                        }
                    });
                    if (skipped_plots > 0) {
                        alert("Warning: " + skipped_plots + " plots skipped.\n\nNote that it is not currently possible to export dot plot images from reports. Data exports do work.");
                    }
                }
                ////// EXPORT PLOT DATA
                //////
                else if ($('#mqc_data_download').is(':visible')) {
                    $('#mqc_export_selectplots input:checked').each(function () {
                        try {
                            var target = $(this).val();
                            var ft = $('#mqc_export_data_ft').val();
                            var fname = target + '.' + ft;
                            var sep = ft == 'tsv' ? "\t" : ',';
                            // Custom plot not in mqc_plots
                            if (mqc_plots[target] == undefined) {
                                if ($('#' + target).hasClass('has-custom-export')) {
                                    $('#' + target).trigger('mqc_plotexport_data', { 'target': target, 'ft': ft, 'fname': fname, 'sep': sep });
                                } else {
                                    skipped_plots += 1;
                                }
                            }
                            // If JSON then just dump everything
                            else if (ft == 'json') {
                                json_str = JSON.stringify(mqc_plots[target], null, 2);
                                var blob = new Blob([json_str], { type: "text/plain;charset=utf-8" });
                                saveAs(blob, fname);
                            }
                            // Beeswarm plots must be done manually
                            else if (mqc_plots[target]['plot_type'] == 'beeswarm') {
                                // Header line
                                datastring = 'Sample';
                                for (var j = 0; j < mqc_plots[target]['categories'].length; j++) {
                                    datastring += sep + mqc_plots[target]['categories'][j]['description'];
                                }
                                datastring += "\n";
                                // This assumes that the same samples are in all rows
                                // TODO: Check and throw error if this isn't the case
                                var rows = Array();
                                for (var j = 0; j < mqc_plots[target]['samples'][0].length; j++) {
                                    rows[j] = Array(mqc_plots[target]['samples'][0][j]);
                                }
                                for (var j = 0; j < mqc_plots[target]['datasets'].length; j++) {
                                    for (var k = 0; k < mqc_plots[target]['datasets'][j].length; k++) {
                                        rows[k].push(mqc_plots[target]['datasets'][j][k]);
                                    }
                                }
                                for (var j = 0; j < rows.length; j++) {
                                    datastring += rows[j].join(sep) + "\n";
                                }
                                var blob = new Blob([datastring], { type: "text/plain;charset=utf-8" });
                                saveAs(blob, fname);
                            }
                            // Normal plot - use HighCharts plugin to get the data from the plot
                            else if (ft == 'tsv' || ft == 'csv') {
                                var hc = $('#' + target).highcharts();
                                if (hc !== undefined) {
                                    hc.update({ exporting: { csv: { itemDelimiter: sep } } });
                                    var blob = new Blob([hc.getCSV()], { type: "text/plain;charset=utf-8" });
                                    saveAs(blob, fname);
                                } else {
                                    skipped_plots += 1;
                                }
                            } else {
                                skipped_plots += 1;
                            }
                        } catch (e) {
                            console.error(e);
                            skipped_plots += 1;
                        }
                    });
                    if (skipped_plots > 0) {
                        alert("Warning: Could not export data from " + skipped_plots + " plots.");
                    }
                } else { alert("Error - don't know what to export!"); }
            });
        } else {
            $('#mqc_exportplots').hide();
            $('.mqc-toolbox-buttons a[href=#mqc_exportplots]').parent().hide();
        }

        /// SAVING STUFF
        // Load the saved setting names
        populate_mqc_saveselect();
        // Save config
        $('#mqc_saveconfig_form').submit(function (e) {
            e.preventDefault();
            var name = $(this).find('input').val().trim();
            if (name == '') {
                alert('Error - you must name the saved settings.');
            } else {
                mqc_save_config(name);
            }
        });
        // Load config
        $('#mqc_loadconfig_form').submit(function (e) {
            e.preventDefault();
            var name = $(this).find('select').val().trim();
            if (name == '') {
                alert('Error - No saved setting selected.');
            } else {
                load_mqc_config(name);
            }
        });
        // Delete config
        $('.mqc_config_clear').click(function (e) {
            e.preventDefault();
            var name = $('#mqc_loadconfig_form select').val().trim();
            if (name == '') {
                alert('Error - no saved settings selected.');
            } else {
                if (confirm("Delete saved settings '" + name + "'?")) {
                    mqc_save_config(name, true);
                }
            }
        });
        // Set current config as default
        $('.mqc_config_set_default').click(function (e) {
            e.preventDefault();
            var name = $('#mqc_loadconfig_form select').val().trim();
            if (name == '') {
                alert('Error - no saved settings selected.');
            } else {
                load_mqc_config(name);
                mqc_save_config(name, false, true);
            }
        });
        // Clear current config default
        $('.mqc_config_clear_default').click(function (e) {
            e.preventDefault();
            mqc_clear_default_config();
        });

        // Filter text is changed
        $('.mqc_filters').on('blur', 'li input', function () {
            var target = $(this).parent().parent().attr('id');
            if (target == 'mqc_col_filters') {
                $('#mqc_cols_apply').attr('disabled', false).removeClass('btn-default').addClass('btn-primary');
            }
            if (target == 'mqc_renamesamples_filters') {
                $('#mqc_rename_apply').attr('disabled', false).removeClass('btn-default').addClass('btn-primary');
            }
            if (target == 'mqc_hidesamples_filters') {
                $('#mqc_hide_apply').attr('disabled', false).removeClass('btn-default').addClass('btn-primary');
            }
        });
        // 'Enter' key pressed whilst editing a filter
        $('.mqc_filters').on('keyup', 'li input', function (e) {
            if (e.keyCode == 13) { // Pressed enter
                $(this).blur();
                $(this).parent().next('li').find('input').focus().select();
            }
        });
        // Remove filter button
        $('.mqc_filters').on('click', 'li button', function () {
            var target = $(this).parent().parent().attr('id');
            $(this).parent().remove();
            if (target == 'mqc_col_filters') { $('#mqc_cols_apply').attr('disabled', false).removeClass('btn-default').addClass('btn-primary'); }
            if (target == 'mqc_hidesamples_filters') { $('#mqc_hide_apply').attr('disabled', false).removeClass('btn-default').addClass('btn-primary'); }
            if (target == 'mqc_renamesamples_filters') { $('#mqc_rename_apply').attr('disabled', false).removeClass('btn-default').addClass('btn-primary'); }
        });
        // Clear all filters button
        $('.mqc_toolbox_clear').click(function () {
            var target = $(this).closest('.mqc_filter_section').find('.mqc_filters').attr('id');
            $('#' + target).empty();
            if (target == 'mqc_col_filters') { $('#mqc_cols_apply').attr('disabled', false).removeClass('btn-default').addClass('btn-primary'); }
            if (target == 'mqc_hidesamples_filters') { $('#mqc_hide_apply').attr('disabled', false).removeClass('btn-default').addClass('btn-primary'); }
            if (target == 'mqc_renamesamples_filters') { $('#mqc_rename_apply').attr('disabled', false).removeClass('btn-default').addClass('btn-primary'); }
        });

        // Use jQuery UI to make the colour filters sortable
        $("#mqc_col_filters").sortable();
        $("#mqc_col_filters").on("sortstop", function (event, ui) {
            $('#mqc_cols_apply').attr('disabled', false).removeClass('btn-default').addClass('btn-primary');
        });
        // Regex mode text
        $('.mqc_regex_mode').click(function () {
            var rswitch = $(this).find('.re_mode');
            if (rswitch.text() == 'off') {
                rswitch.removeClass('off').addClass('on').text('on');
            } else {
                rswitch.removeClass('on').addClass('off').text('off');
            }
            if ($(this).data('target') == 'mqc_cols') {
                $('#mqc_cols_apply').attr('disabled', false).removeClass('btn-default').addClass('btn-primary');
            }
            if ($(this).data('target') == 'mqc_renamesamples') {
                $('#mqc_rename_apply').attr('disabled', false).removeClass('btn-default').addClass('btn-primary');
            }
            if ($(this).data('target') == 'mqc_hidesamples') {
                $('#mqc_hide_apply').attr('disabled', false).removeClass('btn-default').addClass('btn-primary');
            }
        });

        /////////////////////////
        // REGEX HELP MODAL
        /////////////////////////
        $('.regex_example_buttons button').click(function (e) {
            e.preventDefault();
            $('.regex_example_demo input').val($(this).data('example'));
            regex_example_test();
        });
        $('.regex_example_demo input').keyup(function (e) {
            regex_example_test();
        });
        function regex_example_test() {
            var re = $('.regex_example_demo input').val();
            console.log('Testing ' + re);
            $('.regex_example_demo pre span').each(function () {
                $(this).removeClass();
                if ($(this).text().match(re)) {
                    console.log('Matches ' + $(this).text());
                    $(this).addClass('mark text-success');
                } else {
                    console.log('Matches ' + $(this).text());
                    $(this).addClass('text-muted');
                }
            });
        }

    });

    //////////////////////////////////////////////////////
    // UTILITY FUNCTIONS
    //////////////////////////////////////////////////////
    function hashCode(str) {
        var hash = 0;
        if (str.length == 0) return hash;
        for (i = 0; i < str.length; i++) {
            char = str.charCodeAt(i);
            hash = ((hash << 5) - hash) + char;
            hash = hash & hash; // Convert to 32bit integer
        }
        return hash;
    }


    //////////////////////////////////////////////////////
    // GENERAL TOOLBOX FUNCTIONS
    //////////////////////////////////////////////////////
    function mqc_toolbox_openclose(target, open) {
        // Hide any open tooltip so it's not left dangling
        $('.mqc-toolbox-buttons li a').tooltip('hide');
        // Find if what we clicked is already open
        var btn = $('.mqc-toolbox-buttons li a[href="' + target + '"]');
        if (open === undefined) {
            if (btn.hasClass('active')) { open = false; }
            else { open = true; }
        }
        var already_open = $('.mqc-toolbox').hasClass('active');
        if (open) {
            if (already_open) {
                mqc_toolbox_confirmapply();
            }
            $('.mqc-toolbox, .mqc-toolbox-buttons li a, .mqc_filter_section').removeClass('active');
            btn.addClass('active');
            $('.mqc-toolbox, ' + target).addClass('active');
            $(document).trigger('mqc_toolbox_open');
            var timeout = already_open ? 0 : 510;
            setTimeout(function () {
                if (target == '#mqc_cols') { $('#mqc_colour_filter').focus(); }
                if (target == '#mqc_renamesamples') { $('#mqc_renamesamples_from').focus(); }
                if (target == '#mqc_hidesamples') { $('#mqc_hidesamples_filter').focus(); }
            }, timeout);
        } else {
            mqc_toolbox_confirmapply();
            btn.removeClass('active');
            $('.mqc-toolbox, .mqc-toolbox-buttons li a').removeClass('active');
            $(document).trigger('mqc_toolbox_close');
        }
    }
    function mqc_toolbox_confirmapply() {
        // Check if there's anything waiting to be applied
        if ($('#mqc_cols_apply').is(':enabled') && $('#mqc_cols').is(':visible')) {
            $.toast({
                heading: 'Highlights Not Applied',
                text: "Careful - your changes haven't been applied yet! Click the <em>Apply</em> button in the toolbox to set your changes.",
                icon: 'warning',
                position: 'bottom-right',
                hideAfter: 5000
            });
        }
        if ($('#mqc_rename_apply').is(':enabled') && $('#mqc_renamesamples').is(':visible')) {
            $.toast({
                heading: 'Rename Patterns Not Applied',
                text: "Careful - your changes haven't been applied yet! Click the <em>Apply</em> button in the toolbox to set your changes.",
                icon: 'warning',
                position: 'bottom-right',
                hideAfter: 5000
            });
        }
        if ($('#mqc_hide_apply').is(':enabled') && $('#mqc_hidesamples').is(':visible')) {
            $.toast({
                heading: 'Hide Samples Not Applied',
                text: "Careful - your changes haven't been applied yet! Click the <em>Apply</em> button in the toolbox to set your changes.",
                icon: 'warning',
                position: 'bottom-right',
                hideAfter: 5000
            });
        }
    }

    function validate_regexp(pattern) {
        try {
            new RegExp(pattern, 'g');
            return true
        } catch (error) {
            $.toast({
                heading: 'Invalid Regular Expression!',
                text: "Apologies, your regular expression pattern is invalid: <code>" + pattern + "</code><br><br>" +
                    'For more help and testing, try it out at <a href="https://regex101.com/" target="_blank">regex101.com</a>.',
                icon: 'error',
                position: 'bottom-right',
                hideAfter: 5000
            });
            return false
        }
    }

    //////////////////////////////////////////////////////
    // HIGHLIGHT SAMPLES
    //////////////////////////////////////////////////////
    function apply_mqc_highlights() {

        // Collect the filters into an array
        var f_texts = [];
        var f_cols = [];
        var regex_mode = $('#mqc_cols .mqc_regex_mode .re_mode').hasClass('on');
        var num_errors = 0;
        $('#mqc_col_filters li').each(function () {
            var inputElement = $(this).find('.f_text');
            var pattern = inputElement.val();
            // Validate RegExp
            $(this).removeClass('bg-danger');
            if (regex_mode && !validate_regexp(pattern)) {
                $(this).addClass('bg-danger');
                num_errors++;
            }

            // Only add pattern if it hasn't already been added
            if (f_texts.indexOf(pattern) < 0) {
                f_texts.push(pattern);
                f_cols.push(inputElement.css('color'));
            } else {
                f_cols[f_texts.indexOf(pattern)] = inputElement.css('color');
            }
        });
        if (num_errors > 0) {
            return false;
        }

        // Apply a 'background' highlight to remove default colouring first
        // Also highlight toolbox drawer icon
        if (f_texts.length > 0 && f_texts.indexOf('') < 0) {
            f_texts.unshift('');
            f_cols.unshift('#cccccc');
            $('.mqc-toolbox-buttons a[href="#mqc_cols"]').addClass('in_use');
        } else {
            $('.mqc-toolbox-buttons a[href="#mqc_cols"]').removeClass('in_use');
        }

        window.mqc_highlight_f_texts = f_texts;
        window.mqc_highlight_f_cols = f_cols;
        window.mqc_highlight_regex_mode = regex_mode;

        // Fire off a custom jQuery event for other javascript chunks to tie into
        $(document).trigger('mqc_highlights', [f_texts, f_cols, regex_mode]);

        return true;
    }

    //////////////////////////////////////////////////////
    // RENAME SAMPLES
    //////////////////////////////////////////////////////

    function apply_mqc_renamesamples() {
        var valid_from_texts = [];
        var valid_to_texts = [];
        var regex_mode = $('#mqc_renamesamples .mqc_regex_mode .re_mode').hasClass('on');
        var num_errors = 0;
        // Collect filters
        var f_texts = $('#mqc_renamesamples_filters > li').each(function () {
            var from_text = $(this).find(".from_text").val();
            var to_text = $(this).find(".to_text").val();
            // Validate RegExp
            $(this).removeClass('bg-danger')
            if (regex_mode && !validate_regexp(from_text)) {
                $(this).addClass('bg-danger');
                num_errors++;
            }
            valid_from_texts.push(from_text);
            valid_to_texts.push(to_text);
        });
        if (num_errors > 0) {
            return false;
        }

        // If something was renamed, highlight the toolbox icon
        if (valid_from_texts.length > 0) {
            $('.mqc-toolbox-buttons a[href="#mqc_renamesamples"]').addClass('in_use');
        } else {
            $('.mqc-toolbox-buttons a[href="#mqc_renamesamples"]').removeClass('in_use');
        }

        window.mqc_rename_f_texts = valid_from_texts;
        window.mqc_rename_t_texts = valid_to_texts;
        window.mqc_rename_regex_mode = regex_mode;

        // Fire off a custom jQuery event for other javascript chunks to tie into
        $(document).trigger('mqc_renamesamples', [
            window.mqc_rename_f_texts,
            window.mqc_rename_t_texts,
            regex_mode
        ]);

        return true;
    }

    //////////////////////////////////////////////////////
    // HIDE SAMPLES
    //////////////////////////////////////////////////////
    function apply_mqc_hidesamples() {
        // Collect the filters into an array
        var mode = $('.mqc_hidesamples_showhide:checked').val() == 'show' ? 'show' : 'hide';
        var regex_mode = $('#mqc_hidesamples .mqc_regex_mode .re_mode').hasClass('on');
        var f_texts = [];
        var num_errors = 0;
        $('#mqc_hidesamples_filters li').each(function () {
            var pattern = $(this).find('.f_text').val();
            // Validate RegExp
            $(this).removeClass('bg-danger')
            if (regex_mode && !validate_regexp(pattern)) {
                $(this).addClass('bg-danger');
                num_errors++;
            }
            f_texts.push(pattern);
        });
        if (num_errors > 0) {
            return false;
        }

        // If something was hidden, highlight the toolbox icon
        if (f_texts.length > 0) {
            $('.mqc-toolbox-buttons a[href="#mqc_hidesamples"]').addClass('in_use');
        } else {
            $('.mqc-toolbox-buttons a[href="#mqc_hidesamples"]').removeClass('in_use');
        }

        window.mqc_hide_mode = mode;
        window.mqc_hide_f_texts = f_texts;
        window.mqc_hide_regex_mode = regex_mode;

        // Fire off a custom jQuery event for other javascript chunks to tie into
        $(document).trigger('mqc_hidesamples', [f_texts, regex_mode]);

        return true;
    }

    //////////////////////////////////////////////////////
    // SAVE TOOLBOX SETTINGS
    //////////////////////////////////////////////////////

    // Save the current configuration setup
    function mqc_save_config(name, clear, as_default) {
        if (name === undefined) { return false; }
        var config = {};

        // Collect the toolbox vars
        config['highlights_f_texts'] = window.mqc_highlight_f_texts;
        config['highlights_f_cols'] = window.mqc_highlight_f_cols;
        config['highlight_regex'] = window.mqc_highlight_regex_mode;
        config['rename_from_texts'] = window.mqc_rename_f_texts;
        config['rename_to_texts'] = window.mqc_rename_t_texts;
        config['rename_regex'] = window.mqc_rename_regex_mode;
        config['hidesamples_mode'] = window.mqc_hide_mode;
        config['hidesamples_f_texts'] = window.mqc_hide_f_texts;
        config['hidesamples_regex'] = window.mqc_hide_regex_mode;

        var prev_config = {};
        // Load existing configs (inc. from other reports)
        try {
            try {

                prev_config = localStorage.getItem("mqc_config");
                if (prev_config !== null && prev_config !== undefined) {
                    prev_config = JSON.parse(prev_config);
                } else {
                    prev_config = {};
                }

                // Update config obj with current config
                if (clear == true) {
                    delete prev_config[name];
                } else {
                    prev_config[name] = config;
                    prev_config[name]['last_updated'] = Date();
                    if (as_default) {
                        for (var c in prev_config) {
                            if (prev_config.hasOwnProperty(c)) {
                                prev_config[c]['default'] = false;
                            }
                        }
                    }
                    prev_config[name]['default'] = as_default;
                    if (as_default) console.log('Set new default config!');
                }
                localStorage.setItem("mqc_config", JSON.stringify(prev_config));

            } catch (e) {
                console.log('Could not access localStorage');
            }

            if (clear == true) {
                // Remove from load select box
                $("#mqc_loadconfig_form select option:contains('" + name + "')").remove();
                // Successfully deleted message
                $('<p class="text-danger" id="mqc-cleared-success">Settings deleted.</p>').hide().insertBefore($('#mqc_loadconfig_form .actions')).slideDown(function () {
                    setTimeout(function () {
                        $('#mqc-cleared-success').slideUp(function () { $(this).remove(); });
                    }, 5000);
                });
            } else {
                // Remove from load select box
                $("#mqc_loadconfig_form select option:contains('" + name + "')").remove();
                // Add new name to load select box and select it
                $('#mqc_loadconfig_form select').prepend('<option>' + name + (as_default ? ' [default]' : '') + '</option>').val(name + (as_default ? ' [default]' : ''));
                // Success message
                $('<p class="text-success" id="mqc-save-success">Settings saved.</p>').hide().insertBefore($('#mqc_saveconfig_form')).slideDown(function () {
                    setTimeout(function () {
                        $('#mqc-save-success').slideUp(function () { $(this).remove(); });
                    }, 5000);
                });
            }
        } catch (e) { console.log('Error updating localstorage: ' + e); }
    }

    // Clear current default configuration
    function mqc_clear_default_config() {
        try {
            var config = localStorage.getItem("mqc_config");
            if (!config) {
                return;
            } else {
                config = JSON.parse(config);
            }
            for (var c in config) {
                if (config.hasOwnProperty(c)) {
                    config[c]['default'] = false;
                }
            }
            localStorage.setItem("mqc_config", JSON.stringify(config));
            $('<p class="text-danger" id="mqc-cleared-success">Unset default.</p>').hide().insertBefore($('#mqc_loadconfig_form .actions')).slideDown(function () {
                setTimeout(function () {
                    $('#mqc-cleared-success').slideUp(function () { $(this).remove(); });
                }, 5000);
                var name = $('#mqc_loadconfig_form select option:contains("default")').text();
                $('#mqc_loadconfig_form select option:contains("default")').remove();
                name = name.replace(' [default]', '');
                $('#mqc_loadconfig_form select').append('<option>' + name + '</option>').val(name);
            });
        } catch (e) {
            console.log('Could not access localStorage');
        }
    }

    //////////////////////////////////////////////////////
    // LOAD TOOLBOX SAVE NAMES
    //////////////////////////////////////////////////////
    function populate_mqc_saveselect() {
        var default_config = '';
        try {
            var local_config = localStorage.getItem("mqc_config");
            if (local_config !== null && local_config !== undefined) {
                local_config = JSON.parse(local_config);
                default_name = false;
                for (var name in local_config) {
                    if (local_config[name]['default']) {
                        console.log('Loaded default config!');
                        load_mqc_config(name);
                        default_config = name;
                        name = name + ' [default]';
                        default_name = name;
                    }
                    $('#mqc_loadconfig_form select').append('<option>' + name + '</option>').val(name);
                }
                // Set the selected select option
                if (default_name !== false) {
                    $('#mqc_loadconfig_form select option:contains("' + default_name + '")').prop('selected', true);
                } else {
                    $('#mqc_loadconfig_form select option:first').prop('selected', true);
                }
            }
        } catch (e) {
            console.log('Could not load local config: ' + e);
            $('#mqc_saveconfig').html('<h4>Error accessing localStorage</h4>' +
                '<p>This feature uses a web browser feature called "localStorage". ' +
                "We're not able to access this at the moment, which probably means that " +
                'you have the <em>"Block third-party cookies and site data"</em> setting ticked (Chrome) ' +
                'or equivalent in other browsers.</p><p>Please ' +
                '<a href="https://www.google.se/search?q=Block+third-party+cookies+and+site+data" target="_blank">change this browser setting</a>' +
                ' to save MultiQC report configs.</p>');
        }
    }

    //////////////////////////////////////////////////////
    // LOAD TOOLBOX SETTINGS
    //////////////////////////////////////////////////////
    function load_mqc_config(name) {
        if (name === undefined) { return false; }
        var config = {};
        try {
            try {
                var local_config = localStorage.getItem("mqc_config");
            } catch (e) { console.log('Could not access localStorage'); }
            if (local_config !== null && local_config !== undefined) {
                local_config = JSON.parse(local_config);
                for (var attr in local_config[name]) {
                    config[attr] = local_config[name][attr];
                }
            }
        } catch (e) { console.log('Could not load local config: ' + e); }

        // Apply config - rename samples
        if (notEmptyObj(config['rename_regex'])) {
            if (config['rename_regex'] == true) {
                $('#mqc_renamesamples .mqc_regex_mode .re_mode').removeClass('off').addClass('on').text('on');
                window.mqc_rename_regex_mode = true;
            }
        }
        if (notEmptyObj(config['rename_from_texts']) && notEmptyObj(config['rename_to_texts'])) {
            window.mqc_rename_f_texts = [];
            window.mqc_rename_t_texts = [];
            $.each(config['rename_from_texts'], function (idx, from_text) {
                var to_text = config['rename_to_texts'][idx];
                if (from_text.length == 0) { return true; }
                var li = '<li><input class="f_text from_text" value="' + from_text + '" />'
                li += '<small class="glyphicon glyphicon-chevron-right"></small><input class="f_text to_text" value="' + to_text + '" />'
                li += '<button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button></li>'
                window.mqc_rename_f_texts.push(from_text);
                window.mqc_rename_t_texts.push(to_text);
                $('#mqc_renamesamples_filters').append(li);
            });
            $(document).trigger('mqc_renamesamples', [window.mqc_rename_f_texts, window.mqc_rename_t_texts, config['rename_regex']]);
        }

        // Apply config - highlights
        if (notEmptyObj(config['highlight_regex'])) {
            if (config['highlight_regex'] == true) {
                $('#mqc_cols .mqc_regex_mode .re_mode').removeClass('off').addClass('on').text('on');
                window.mqc_highlight_regex_mode = true;
            }
        }
        if (notEmptyObj(config['highlights_f_texts']) && notEmptyObj(config['highlights_f_cols'])) {
            window.mqc_highlight_f_texts = [];
            window.mqc_highlight_f_cols = [];
            $.each(config['highlights_f_texts'], function (idx, f_text) {
                var f_col = config['highlights_f_cols'][idx];
                $('#' + hashCode(f_text + f_col)).remove();
                $('#mqc_col_filters').append('<li style="color:' + f_col + ';" id="' + hashCode(f_text + f_col) + '"><span class="hc_handle"><span></span><span></span></span><input class="f_text" value="' + f_text + '" /><button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button></li>');
                window.mqc_highlight_f_texts.push(f_text);
                window.mqc_highlight_f_cols.push(f_col);
                mqc_colours_idx += 1;
            });
            $('#mqc_colour_filter_color').val(mqc_colours[mqc_colours_idx]);
            $(document).trigger('mqc_highlights', [window.mqc_highlight_f_texts, window.mqc_highlight_f_cols, config['highlight_regex']]);
        }

        // Apply config - hide samples
        if (notEmptyObj(config['hidesamples_regex'])) {
            if (config['hidesamples_regex'] == true) {
                $('#mqc_hidesamples .mqc_regex_mode .re_mode').removeClass('off').addClass('on').text('on');
                window.mqc_hide_regex_mode = true;
            }
        }
        if (notEmptyObj(config['hidesamples_mode'])) {
            if (config['hidesamples_mode'] == 'show') {
                $('.mqc_hidesamples_showhide').prop('checked', false);
                $('.mqc_hidesamples_showhide[val=show]').prop('checked', true);
                window.mqc_hide_mode = 'show';
            }
        }
        if (notEmptyObj(config['hidesamples_f_texts'])) {
            window.mqc_hide_f_texts = [];
            $.each(config['hidesamples_f_texts'], function (idx, f_text) {
                if (f_text.length == 0) { return true; }
                $('#mqc_hidesamples_filters').append('<li><input class="f_text" value="' + f_text + '" /><button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button></li>');
                window.mqc_hide_f_texts.push(f_text);
            });
            $(document).trigger('mqc_hidesamples', [window.mqc_hide_f_texts, config['hidesamples_regex']]);
        }

        // Trigger loaded event to initialise plots
        $(document).trigger('mqc_config_loaded');

    }
</script>


<script type="text/javascript">// Javascript for the FastQC MultiQC Mod

    ///////////////
    // Per Base Sequence Content
    ///////////////

    // Global vars
    fastqc_passfails = {}; // { <module>: { <section>: { <sample>: { data } } }
    fastqc_seq_content = {}; // { <module>: { <sample>: data } }

    function load_fastqc_passfails() {
        $('.fastqc_passfails').each(function (i, elem) {
            var key_value = JSON.parse(elem.innerHTML);
            fastqc_passfails[key_value[0]] = key_value[1];
        });
    }

    function load_fastqc_seq_content() {
        $('.fastqc_seq_content').each(function (i, elem) {
            var key_value = JSON.parse(elem.innerHTML);
            fastqc_seq_content[key_value[0]] = key_value[1];
        });
    }

    // Set up listeners etc on page load
    $(function () {
        load_fastqc_seq_content();

        // Go through each FastQC module in case there are multiple
        // #mqc-module-section-fastqc, #mqc-module-section-fastqc-1, ...
        // or #mqc-module-section-configured-anchor, #mqc-module-section-configured-anchor-1, ...
        var fastqc_modules = $('.fastqc_passfails').closest('.mqc-module-section');
        fastqc_modules.each(function () {
            var module_element = $(this);
            var module_key = module_element.attr('id').replace(/-/g, '_').replace('mqc_module_section_', '');
            fastqc_module(module_element, module_key);
        });
    });

    function fastqc_module(module_element, module_key) {
        // Per-module shared vars
        var s_height = 10;
        var num_samples = 0;
        var sample_names = [];
        var sample_statuses = [];
        var labels = [];
        var c_width = 0;
        var c_height = 0;
        var ypos = 0;
        var max_bp = 0;
        var current_single_plot = undefined;

        // Make a lookup hash of sample names, in case we rename stuff later
        module_element
        orig_s_names = {}
        for (var s_name in fastqc_seq_content[module_key]) {
            if (Object.prototype.hasOwnProperty.call(fastqc_seq_content[module_key], s_name)) {
                orig_s_names[s_name] = s_name
            }
        }

        // Function to plot heatmap
        function fastqc_seq_content_heatmap() {
            // Get sample names, rename and skip hidden samples
            sample_names = [];
            sample_statuses = [];
            var p_data = {};
            var hidden_samples = 0;
            $.each(fastqc_seq_content[module_key], function (s_name, data) {
                // rename sample names
                var orig_s_name = s_name;
                var t_status = fastqc_passfails[module_key]['per_base_sequence_content'][s_name];
                $.each(window.mqc_rename_f_texts, function (idx, f_text) {
                    if (window.mqc_rename_regex_mode) {
                        var re = new RegExp(f_text, 'g');
                        s_name = s_name.replace(re, window.mqc_rename_t_texts[idx]);
                    } else {
                        s_name = s_name.replace(f_text, window.mqc_rename_t_texts[idx]);
                    }
                });
                orig_s_names[s_name] = orig_s_name;
                sample_statuses[s_name] = t_status;
                p_data[s_name] = JSON.parse(JSON.stringify(data)); // clone data

                var hide_sample = false;
                for (i = 0; i < window.mqc_hide_f_texts.length; i++) {
                    var f_text = window.mqc_hide_f_texts[i];
                    if (window.mqc_hide_regex_mode) {
                        if (s_name.match(f_text)) { hide_sample = true; }
                    } else {
                        if (s_name.indexOf(f_text) > -1) { hide_sample = true; }
                    }
                }
                if (window.mqc_hide_mode == 'show') {
                    hide_sample = !hide_sample;
                }
                if (!hide_sample) { sample_names.push(s_name); }
                else { hidden_samples += 1; }
            });
            num_samples = sample_names.length;
            module_element.find('#fastqc_seq_heatmap_div .samples-hidden-warning, #fastqc_seq_heatmap_div .fastqc-heatmap-no-samples').remove();
            module_element.find('#fastqc_seq_heatmap_div .hc-plot-wrapper').show();
            if (num_samples == 0) {
                module_element.find('#fastqc_seq_heatmap_div .hc-plot-wrapper').hide();
                module_element.find('#fastqc_seq_heatmap_div').prepend('<p class="fastqc-heatmap-no-samples text-muted">No samples found.</p>');
            }
            if (hidden_samples > 0) {
                module_element.find('#fastqc_seq_heatmap_div').prepend('<div class="samples-hidden-warning alert alert-warning"> \
                <span class="glyphicon glyphicon-info-sign"></span> \
                <strong>Warning:</strong> '+ hidden_samples + ' samples hidden in toolbox. \
                <a href="#mqc_hidesamples" class="alert-link" onclick="mqc_toolbox_openclose(\'#mqc_hidesamples\', true); return false;">See toolbox.</a>\
            </div>');
            }
            if (num_samples == 0) { return; }

            // Convert the CSS percentage size into pixels
            c_width = module_element.find('#fastqc_seq_heatmap').parent().width() - 5; // -5 for status bar
            c_height = module_element.find('#fastqc_seq_heatmap').parent().height() - 2; // -2 for bottom line padding
            s_height = c_height / num_samples;
            // Minimum row height
            if (s_height < 2) {
                s_height = 2;
                c_height = num_samples * 2;
                module_element.find('#fastqc_seq_heatmap').parent().parent().height(c_height + 10);
            }
            // Resize the canvas properties
            module_element.find('#fastqc_seq_heatmap').prop({
                'width': c_width,
                'height': c_height + 1
            });
            var canvas = module_element.find('#fastqc_seq_heatmap')[0];
            if (canvas && canvas.getContext) {
                var ctx = canvas.getContext('2d');
                ctx.strokeStyle = '#666666';
                // First, do labels and get max base pairs
                max_bp = 0;
                labels = [];
                $.each(sample_names, function (idx, s_name) {
                    var s = p_data[s_name];
                    labels.push(s_name);
                    $.each(s, function (bp, v) {
                        bp = parseInt(bp);
                        if (bp > max_bp) {
                            max_bp = bp;
                        }
                    });
                });
                ypos = 0;
                $.each(sample_names, function (idx, s_name) {

                    // Add a 5px wide bar indicating either status or Highlight
                    var status = sample_statuses[s_name];
                    var s_col = '#999999';
                    if (status == 'pass') { s_col = '#5cb85c'; }
                    if (status == 'warn') { s_col = '#f0ad4e'; }
                    if (status == 'fail') { s_col = '#d9534f'; }
                    // Override status colour with highlights
                    $.each(window.mqc_highlight_f_texts, function (idx, f_text) {
                        if ((window.mqc_highlight_regex_mode && s_name.match(f_text)) || (!window.mqc_highlight_regex_mode && s_name.indexOf(f_text) > -1)) {
                            s_col = window.mqc_highlight_f_cols[idx];
                        }
                    });
                    ctx.fillStyle = s_col;
                    ctx.fillRect(0, ypos + 1, 5, s_height - 2);

                    // Plot the squares for the heatmap
                    var s = p_data[s_name];
                    var xpos = 6;
                    var last_bp = 0;
                    $.each(s, function (bp, v) {
                        bp = parseInt(bp);
                        var this_width = (bp - last_bp) * (c_width / max_bp);
                        last_bp = bp;
                        // Very old versions of FastQC give counts instead of percentages
                        if (v['t'] > 100) {
                            var t = v['t'] + v['a'] + v['c'] + v['g'];
                            v['t'] = (v['t'] / t) * 100;
                            v['a'] = (v['a'] / t) * 100;
                            v['c'] = (v['c'] / t) * 100;
                            v['g'] = (v['g'] / t) * 100;
                        }
                        var r = Math.round((v['t'] / 100) * 255);
                        var g = Math.round((v['a'] / 100) * 255);
                        var b = Math.round((v['c'] / 100) * 255);
                        ctx.fillStyle = 'rgb(' + r + ',' + g + ',' + b + ')';
                        // width+1 to avoid vertical white line gaps.
                        ctx.fillRect(xpos, ypos, this_width + 1, s_height);
                        xpos += this_width;
                    });
                    // Draw a line under this row if we don't have too many samples
                    if (num_samples <= 20) {
                        ctx.beginPath();
                        ctx.moveTo(6, ypos);
                        ctx.lineTo(c_width, ypos);
                        ctx.stroke();
                    }
                    ypos += s_height;
                });
                // Final line under row
                ctx.beginPath();
                ctx.moveTo(6, ypos);
                ctx.lineTo(c_width, ypos);
                ctx.stroke();
            }
        }

        // Draw sequence content heatmap
        fastqc_seq_content_heatmap();


        // Add the pass / warning / fails counts to each of the FastQC submodule headings
        $.each(fastqc_passfails[module_key], function (k, vals) {
            var total = 0;
            var v = { 'pass': 0, 'warn': 0, 'fail': 0 };
            $.each(vals, function (s_name, status) {
                total += 1;
                v[status] += 1;
            });
            var p_bar = '<div class="progress fastqc_passfail_progress"> \
            <div class="progress-bar progress-bar-success" style="width: '+ (v['pass'] / total) * 100 + '%" title="' + v['pass'] + '&nbsp;/&nbsp;' + total + ' samples passed">' + v['pass'] + '</div> \
            <div class="progress-bar progress-bar-warning" style="width: '+ (v['warn'] / total) * 100 + '%" title="' + v['warn'] + '&nbsp;/&nbsp;' + total + ' samples with warnings">' + v['warn'] + '</div> \
            <div class="progress-bar progress-bar-danger" style="width: '+ (v['fail'] / total) * 100 + '%" title="' + v['fail'] + '&nbsp;/&nbsp;' + total + ' samples failed">' + v['fail'] + '</div> \
        </div>';
            module_element.find('[id^=fastqc_' + k + ']').first().append(p_bar);
        });

        // Create popovers on click
        module_element.find('.fastqc_passfail_progress .progress-bar').mouseover(function () {
            // Does this element already have a popover?
            if ($(this).attr('data-original-title')) { return false; }
            // Create it
            var pid = $(this).closest('h3').attr('id');
            var k = pid.substr(7);
            // Remove suffix when there are multiple fastqc sections
            var n = k.indexOf('-');
            k = k.substring(0, n != -1 ? n : k.length);
            var vals = fastqc_passfails[module_key][k];
            var passes = $(this).hasClass('progress-bar-success') ? true : false;
            var warns = $(this).hasClass('progress-bar-warning') ? true : false;
            var fails = $(this).hasClass('progress-bar-danger') ? true : false;
            var pclass = '';
            if (passes) { pclass = 'success'; }
            if (warns) { pclass = 'warning'; }
            if (fails) { pclass = 'danger'; }
            var samples = Array();
            $.each(vals, function (s_name, status) {
                if (status == 'pass' && passes) { samples.push(s_name); }
                else if (status == 'warn' && warns) { samples.push(s_name); }
                else if (status == 'fail' && fails) { samples.push(s_name); }
            });
            $(this).popover({
                title: $(this).attr('title'),
                content: samples.sort().join('<br>'),
                html: true,
                trigger: 'hover click focus',
                placement: 'bottom auto',
                template: '<div class="popover popover-fastqc-status popover-' + pclass + '" role="tooltip"> \
                <div class="arrow"></div>\
                <h3 class="popover-title"></h3>\
                <div class="fastqc-popover-intro">\
                    Click bar to fix in place <br>\
                    <a href="#" class="fastqc-status-highlight"><span class="glyphicon glyphicon-pushpin"></span> Highlight these samples</a><br>\
                    <a href="#" class="fastqc-status-hideothers"><span class="glyphicon glyphicon-eye-close"></span> Show only these samples</a>\
                </div>\
                <div class="popover-content"></div>\
            </div>'
            }).popover('show');
        });

        // Listener for Status highlight click
        module_element.find('.fastqc_passfail_progress').on('click', '.fastqc-status-highlight', function (e) {
            e.preventDefault();
            // Get sample names and highlight colour
            var samples = $(this).parent().parent().find('.popover-content').html().split('<br>');
            var f_col = $('#mqc_colour_filter_color').val();
            // Add sample names to the toolbox
            for (i = 0; i < samples.length; i++) {
                var f_text = samples[i];
                $('#mqc_col_filters').append('<li style="color:' + f_col + ';"><span class="hc_handle"><span></span><span></span></span><input class="f_text" value="' + f_text + '"/><button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button></li>');
            }
            // Apply highlights and open toolbox
            apply_mqc_highlights();
            mqc_toolbox_openclose('#mqc_cols', true);
            // Update next highlight colour
            mqc_colours_idx += 1;
            if (mqc_colours_idx >= mqc_colours.length) { mqc_colours_idx = 0; }
            $('#mqc_colour_filter_color').val(mqc_colours[mqc_colours_idx]);
            // Hide the popover
            $(this).closest('.popover').popover('hide');
        });

        // Listener for Status hide others click
        module_element.find('.fastqc_passfail_progress').on('click', '.fastqc-status-hideothers', function (e) {
            e.preventDefault();
            // Get sample names
            var samples = $(this).parent().parent().find('.popover-content').html().split('<br>');
            // Check if we're already hiding anything, remove after confirm if so
            if ($('#mqc_hidesamples_filters li').length > 0) {
                if (!confirm($('#mqc_hidesamples_filters li').length + ' Hide filters already exist - discard?')) {
                    return false;
                } else {
                    $('#mqc_hidesamples_filters').empty();
                }
            }
            // Set to "show only" and disable regex
            $('.mqc_hidesamples_showhide[value="show"]').prop('checked', true);
            $('#mqc_hidesamples .mqc_regex_mode .re_mode').removeClass('on').addClass('off').text('off');
            // Add sample names to the toolbox
            for (i = 0; i < samples.length; i++) {
                var f_text = samples[i];
                $('#mqc_hidesamples_filters').append('<li><input class="f_text" value="' + f_text + '" /><button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button></li>');
            }
            // Apply highlights and open toolbox
            apply_mqc_hidesamples();
            mqc_toolbox_openclose('#mqc_hidesamples', true);
            // Hide the popover
            $(this).closest('.popover').popover('hide');
        });

        /////////
        /// SEQ CONTENT HEATMAP LISTENERS
        /////////


        // Seq Content heatmap export button
        module_element.find('#fastqc_per_base_sequence_content_export_btn').click(function (e) {
            e.preventDefault();
            // In case of repeated modules: #fastqc_per_base_sequence_content_plot, #fastqc_per_base_sequence_content_plot-1, ..
            var plot_id = module_element.find('.fastqc_per_base_sequence_content_plot').attr('id');
            // Tick only this plot in the toolbox and slide out
            $('#mqc_export_selectplots input').prop('checked', false);
            $('#mqc_export_selectplots input[value="' + plot_id + '"]').prop('checked', true);
            mqc_toolbox_openclose('#mqc_exportplots', true);
        });

        // Export plot
        module_element.find('.fastqc_per_base_sequence_content_plot').on('mqc_plotexport_image', function (e, cfg) {
            alert("Apologies, it's not yet possible to export this plot.\nPlease take a screengrab or export the JSON data.");
        });
        module_element.find('.fastqc_per_base_sequence_content_plot').on('mqc_plotexport_data', function (e, cfg) {
            if (cfg['ft'] == 'json') {
                json_str = JSON.stringify(fastqc_seq_content[module_key], null, 2);
                var blob = new Blob([json_str], { type: "text/plain;charset=utf-8" });
                saveAs(blob, cfg['fname']);
            } else {
                alert('Apologies, this plot can only be exported as JSON currently.');
            }
        });

        // Seq Content heatmap mouse rollover
        module_element.find('#fastqc_seq_heatmap').mousemove(function (e) {

            // Replace the heading above the heatmap
            var pos = findPos(this);
            var x = e.pageX - pos.x + 3;
            var y = e.pageY - pos.y;

            // Get label from y position
            var idx = Math.floor(y / s_height);
            var s_name = sample_names[idx];
            var orig_s_name = orig_s_names[sample_names[idx]];
            if (s_name === undefined) { return false; }

            // Show the pass/warn/fail status heading for this sample
            var s_status = sample_statuses[s_name];
            var s_status_class = 'label-default';
            if (s_status == 'pass') { s_status_class = 'label-success'; }
            if (s_status == 'warn') { s_status_class = 'label-warning'; }
            if (s_status == 'fail') { s_status_class = 'label-danger'; }
            module_element.find('#fastqc_per_base_sequence_content_plot_div .s_name').html('<span class="glyphicon glyphicon-info-sign"></span> ' + s_name + ' <span class="label s_status ' + s_status_class + '">' + s_status + '</span>');

            // Update the key with the raw data for this position
            var hover_bp = Math.max(1, Math.floor((x / c_width) * max_bp));
            var thispoint = fastqc_seq_content[module_key][orig_s_name][hover_bp];
            if (!thispoint) {
                var nearestkey = 0;
                var guessdata = null;
                $.each(fastqc_seq_content[module_key][orig_s_name], function (bp, v) {
                    bp = parseInt(bp);
                    if (bp < hover_bp && bp > nearestkey) {
                        nearestkey = bp;
                        guessdata = v;
                    }
                });
                if (guessdata === null) {
                    console.error("Couldn't guess key for " + hover_bp);
                    return false;
                } else {
                    thispoint = guessdata;
                }
            }
            module_element.find('#fastqc_seq_heatmap_key_t span').text(thispoint['t'].toFixed(0) + '%');
            module_element.find('#fastqc_seq_heatmap_key_c span').text(thispoint['c'].toFixed(0) + '%');
            module_element.find('#fastqc_seq_heatmap_key_a span').text(thispoint['a'].toFixed(0) + '%');
            module_element.find('#fastqc_seq_heatmap_key_g span').text(thispoint['g'].toFixed(0) + '%');
            module_element.find('#fastqc_seq_heatmap_key_pos').text(thispoint['base'] + ' bp');
        });

        // Remove sample name again when mouse leaves
        module_element.find('#fastqc_seq_heatmap').mouseout(function (e) {
            module_element.find('#fastqc_per_base_sequence_content_plot_div .s_name').html('<span class="glyphicon glyphicon-info-sign"></span> Rollover for sample name');
            module_element.find('#fastqc_seq_heatmap_key_pos').text('-');
            module_element.find('#fastqc_seq_heatmap_key_t span').text('-');
            module_element.find('#fastqc_seq_heatmap_key_c span').text('-');
            module_element.find('#fastqc_seq_heatmap_key_a span').text('-');
            module_element.find('#fastqc_seq_heatmap_key_g span').text('-');
        });

        // Click sample
        module_element.find('#fastqc_seq_heatmap').click(function (e) {
            e.preventDefault();
            // Get label from y position
            var pos = findPos(this);
            var x = e.pageX - pos.x;
            var y = e.pageY - pos.y;
            var idx = Math.floor(y / s_height);
            var s_name = sample_names[idx];
            var orig_s_name = orig_s_names[sample_names[idx]];
            if (orig_s_name !== undefined) {
                plot_single_seqcontent(s_name);
            }
        });
        module_element.on('click', '.fastqc_seqcontent_single_prevnext', function (e) {
            e.preventDefault();
            // Find next / prev sample name
            var idx = sample_names.indexOf(current_single_plot);
            if ($(this).data('action') == 'next') { idx++; }
            else { idx--; }
            if (idx < 0) { idx = sample_names.length - 1; }
            if (idx >= sample_names.length) { idx = 0; }
            var s_name = sample_names[idx];
            var orig_s_name = orig_s_names[sample_names[idx]];
            current_single_plot = s_name;
            // Prep the new plot data
            var plot_data = [[], [], [], []];
            var bases = Object.keys(fastqc_seq_content[module_key][orig_s_name]).sort(function (a, b) { return a - b; });
            for (i = 0; i < bases.length; i++) {
                var base = fastqc_seq_content[module_key][orig_s_name][bases[i]]['base'].toString().split('-');
                base = parseFloat(base[0]);
                plot_data[0].push([base, fastqc_seq_content[module_key][orig_s_name][bases[i]]['t']]);
                plot_data[1].push([base, fastqc_seq_content[module_key][orig_s_name][bases[i]]['c']]);
                plot_data[2].push([base, fastqc_seq_content[module_key][orig_s_name][bases[i]]['a']]);
                plot_data[3].push([base, fastqc_seq_content[module_key][orig_s_name][bases[i]]['g']]);
            }
            // Update the chart
            var hc = module_element.find('#fastqc_sequence_content_single').highcharts();
            for (i = 0; i < plot_data.length; i++) {
                hc.series[i].setData(plot_data[i], false);
            }
            hc.setTitle({ text: s_name });
            hc.redraw({ duration: 200 });
        });
        module_element.on('click', '#fastqc_sequence_content_single_back', function (e) {
            e.preventDefault();
            module_element.find('#fastqc_per_base_sequence_content_plot_div').slideDown();
            module_element.find('#fastqc_sequence_content_single_wrapper').slideUp(function () {
                $(this).remove();
            });
        });

        // Highlight the custom heatmap
        $(document).on('mqc_highlights mqc_hidesamples mqc_renamesamples mqc_plotresize', function (e) {
            fastqc_seq_content_heatmap();
        });
        // Seq content - window resized
        $(window).resize(function () {
            fastqc_seq_content_heatmap();
        });


        function plot_single_seqcontent(s_name) {
            current_single_plot = s_name;
            var orig_s_name = orig_s_names[s_name];
            var data = fastqc_seq_content[module_key][orig_s_name];
            var plot_data = [
                { 'name': '% T', 'data': [] },
                { 'name': '% C', 'data': [] },
                { 'name': '% A', 'data': [] },
                { 'name': '% G', 'data': [] }
            ];
            var bases = Object.keys(data).sort(function (a, b) { return a - b; });
            for (i = 0; i < bases.length; i++) {
                var d = bases[i];
                var base = data[d]['base'].toString().split('-');
                base = parseFloat(base[0]);
                plot_data[0]['data'].push({ x: base, y: data[d]['t'], name: data[d]['base'] });
                plot_data[1]['data'].push({ x: base, y: data[d]['c'], name: data[d]['base'] });
                plot_data[2]['data'].push({ x: base, y: data[d]['a'], name: data[d]['base'] });
                plot_data[3]['data'].push({ x: base, y: data[d]['g'], name: data[d]['base'] });
            }

            // Create plot div if it doesn't exist, and hide overview
            if (module_element.find('#fastqc_sequence_content_single_wrapper').length == 0) {
                var plot_div = module_element.find('#fastqc_per_base_sequence_content_plot_div');
                plot_div.slideUp();
                var newplot = '<div id="fastqc_sequence_content_single_wrapper"> \
            <div id="fastqc_sequence_content_single_controls">\
                <button class="btn btn-primary btn-sm" id="fastqc_sequence_content_single_back">Back to overview heatmap</button> \
                <div class="btn-group btn-group-sm"> \
                    <button class="btn btn-default fastqc_seqcontent_single_prevnext" data-action="prev">&laquo; Prev</button> \
                    <button class="btn btn-default fastqc_seqcontent_single_prevnext" data-action="next">Next &raquo;</button> \
                </div>\
            </div>\
            <div class="hc-plot-wrapper"><div id="fastqc_sequence_content_single" class="hc-plot hc-line-plot"><small>loading..</small></div></div></div>';
                $(newplot).insertAfter(plot_div).hide().slideDown();
            }

            module_element.find('#fastqc_sequence_content_single').highcharts({
                chart: {
                    type: 'line',
                    zoomType: 'x'
                },
                colors: ['#dc0000', '#0000dc', '#00dc00', '#404040'],
                title: {
                    text: s_name,
                    x: 30 // fudge to center over plot area rather than whole plot
                },
                xAxis: {
                    title: { text: 'Position (bp)' },
                    allowDecimals: false,
                },
                yAxis: {
                    title: { text: '% Reads' },
                    max: 100,
                    min: 0,
                },
                legend: {
                    floating: true,
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'top',
                    y: 40
                },
                tooltip: {
                    backgroundColor: '#FFFFFF',
                    borderColor: '#CCCCCC',
                    formatter: function () {
                        var texts = [];
                        var bars = [];
                        var xlabel = this.x;
                        $.each(this.points, function () {
                            texts.push('<span style="display: inline-block; border-left: 3px solid ' + this.color + '; padding-left:5px; margin-bottom: 2px;"></div>' + this.y.toFixed(1) + this.series.name + '</span>');
                            bars.push('<div class="progress-bar" style="width:' + this.y + '%; float:left; font-size:8px; line-height:12px; padding:0; background-color:' + this.color + ';">' + this.series.name.replace('%', '').trim() + '</div>');
                            if (this.point.name) { xlabel = this.point.name; }
                        });
                        return '<p style="font-weight:bold; text-decoration: underline;">Position: ' + xlabel + ' bp</p>\
                            <p>'+ texts.join('<br>') + '</p><div class="progress" style="height: 12px; width: 150px; margin:0;">' + bars.join('') + '</div>';
                    },
                    useHTML: true,
                    crosshairs: true,
                    shared: true,
                },
                plotOptions: {
                    series: {
                        animation: false,
                        marker: { enabled: false },
                    }
                },
                exporting: {
                    buttons: {
                        contextButton: {
                            menuItems: window.HCDefaults.exporting.buttons.contextButton.menuItems,
                            onclick: window.HCDefaults.exporting.buttons.contextButton.onclick
                        }
                    }
                },
                series: plot_data
            });
        }
    }


    // Find the position of the mouse cursor over the canvas
    // http://stackoverflow.com/questions/6735470/get-pixel-color-from-canvas-on-mouseover
    function findPos(obj) {
        var curleft = 0, curtop = 0;
        if (obj.offsetParent) {
            do {
                curleft += obj.offsetLeft;
                curtop += obj.offsetTop;
            } while (obj = obj.offsetParent);
            return { x: curleft, y: curtop };
        }
        return undefined;
    }
</script>
