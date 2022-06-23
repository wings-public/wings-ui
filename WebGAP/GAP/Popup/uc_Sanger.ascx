<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Sanger.ascx.cs" Inherits="WebGAP.GAP.Popup.uc_Sanger" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<style>
    html {
        overflow-y: auto !important;
    }

    .canvasContainer {
        background-color: white;
        position: relative;
        overflow: auto;
    }

    .tt {
        background-color: #06717db0;
        border: none;
        border-radius: 2px;
        color: white;
        padding: 5px 8px;
        text-decoration: none;
        margin: 4px 2px;
        cursor: pointer;
        width: 150px;
    }

    input[type="file"] {
        display: none;
    }

    .custom-file-upload {
        border: 1px solid #ccc;
        display: inline-block;
        padding: 6px 12px;
        cursor: pointer;
    }

    input[type=text], select {
        width: 70%;
        padding: 5px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    .bg_gray {
        width: 100%;
        border-radius: 5px;
        background-color: #dddddda6;
        padding: 20px;
    }

    .padding_lbl {
        padding-top: 15px;
        padding-right: 10px;
        padding-left: 19px;
        font-size: small;
    }

    input:disabled {
        background: #dddddd;
    }

        input:disabled + label {
            color: #ccc;
        }

    div.disable {
        pointer-events: none;
        opacity: 0.5;
    }
</style>
<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="btn_save_Sanger">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btn_save_Sanger" />
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="RadUpload_Index">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadUpload_Index" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="Btn_AddToReport">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Btn_AddToReport" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="filterPosition">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="filterPosition" />
                <telerik:AjaxUpdatedControl ControlID="peakCanvas1" />
                <telerik:AjaxUpdatedControl ControlID="peakCanvas2" />
                <telerik:AjaxUpdatedControl ControlID="peakCanvas3" />
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="save_sanger">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="save_sanger" />
            </UpdatedControls>
        </telerik:AjaxSetting>

    </AjaxSettings>
</telerik:RadAjaxManager>
<html>
<body>

    <div class="row">
        <div class="content-header-left col-md-12 col-12">
            <div runat="server" id="Div1">
                <div class="p-1 " style="height: 150px">
                    <h2 class="form-section">
                        <asp:PlaceHolder runat="server"><%=  Session["CHR_MutationDetail"].ToString() %> :  <%=  Session["START_MutationDetail"].ToString() %> - <%=  Session["END_MutationDetail"].ToString() %></asp:PlaceHolder>
                    </h2>
                </div>
            </div>
        </div>
    </div>
    <div class="content-body">
        <div class="card-content collapse show">
            <div class="card-bodypopup p-0">
                <form class="form">
                    <div class="form-body">
                        <section id="basic-form-layouts">
                            <div class="bg_gray">
                                <div class="row">
                                    <div runat="server" id="Index">
                                        <div class="card p-1" style="height: 150px">
                                            <h4 class="form-section">
                                                <img src="../../img/Rep/Primary.jpg" width="25" height="25" class="mr-1" />index</h4>
                                            <div style="border-color: gainsboro; display: flex; flex-direction: row; justify-content: flex-start;">
                                                <label for="FileName1" class="tt">Upload Sanger File</label>
                                                <input id="FileName1" type="file" />
                                                <label id="selectedFile1" class="textInput" style="color: #00b7b7; margin: 9px"></label>
                                            </div>

                                        </div>
                                    </div>
                                    <div runat="server" id="control1" class="disable">
                                        <div class="card p-1" style="height: 150px">

                                            <h4 class="form-section">
                                                <img src="../../img/Rep/Secondary.jpg" width="25" height="25" class="mr-1" />
                                                Control 1</h4>

                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <div style="border-color: gainsboro; display: flex; flex-direction: row; justify-content: flex-start;">

                                                        <label for="FileName2" class="tt">Upload Sanger File</label>
                                                        <input id="FileName2" type="file" />
                                                        <label id="selectedFile2" class="textInput" style="color: #00b7b7; margin: 9px"></label>
                                                    </div>
                                                </div>

                                                </>
                                            </div>
                                        </div>
                                    </div>
                                    <div runat="server" id="control2" class="disable">
                                        <div class="card p-1" style="height: 150px">
                                            <h4 class="form-section">
                                                <img src="../../img/Rep/Secondary.jpg" width="25" height="25" class="mr-1" />
                                                Control 2</h4>
                                            <div style="border-color: gainsboro; display: flex; flex-direction: row; justify-content: flex-start;">

                                                <label for="FileName3" class="tt">Upload Sanger File</label>
                                                <input id="FileName3" type="file" />
                                                <label id="selectedFile3" class="textInput" style="color: #00b7b7; margin: 9px"></label>
                                            </div>
                                            <br>
                                        </div>
                                    </div>


                                </div>

                                <div id="section_filter" class="row disable">
                                    <table style="width: 100%">
                                        <tr>
                                            <td style="width: 15%">
                                                <label class="padding_lbl">Start: </label>
                                                <input type="text" id="start" />
                                            </td>
                                            <td style="width: 15%">
                                                <label class="padding_lbl">End: </label>
                                                <input type="text" id="end" />
                                            </td>

                                            <td style="width: 30%">
                                                <label class="padding_lbl">Target position: </label>
                                                <input type="text" id="Target_Position" />
                                            </td>

                                            <td style="width: 10%; padding-top: 15px; width: 100%">
                                                <button class="btn mr-1 mb-1 btn-outline-success btn-sm" onclick="filter(); return false;" id="filterPosition">apply </button>
                                            </td>
                                            <td style="width: 25%; padding-top: 15px; width: 100%; text-align: left">
                                                <a id="download" download="image.png">
                                                    <button id="btn_save_Sanger" type="button" class="btn mr-1 mb-1 btn-outline-info btn-sm" onclick="download(); return false;">Add Index to Clinical Report </button>
                                                </a>

                                            </td>
                                        </tr>
                                    </table>

                                </div>
                            </div>
                            <div class="row pt-1">
                                <div class="col-md-12">
                                    <div class="card p-1">
                                        <h4 class="form-section">Trace</h4>
                                        <div class="panel-body canvasContainer" id="canvasContainer">
                                            <canvas id="peakCanvas1" height="200"></canvas>
                                            <br>
                                            <canvas id="peakCanvas2" height="200"></canvas>
                                            <br>
                                            <canvas runat="server" id="peakCanvas3" height="200"></canvas>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </section>
                        <asp:Button runat="server" ID="save_sanger" Style="display: none;" OnClick="save_sanger_Click" />
                    </div>
                    <div class="form-actionspopup center">
                        <asp:Button ID="btn_cacel" Text="Cancel" runat="server" OnClientClick="CloseWindow(); return false;"
                            class="btn btn-danger mr-1 ladda-button btn-sm"></asp:Button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <asp:HiddenField ID="sanger_base64" runat="server" />
    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script>
            document.addEventListener('DOMContentLoaded', bindButtons);
            var start = 0;
            var end = 0;
            var peakCanvas;
            var counter = 0;
            var contents1;
            var contents2 = 0;
            var contents3 = 0;

            var tagDict = {
                "baseCalls1": { "tagName": "PBAS", "tagNum": 1, "typeToReturn": "getChar" },
                "baseCalls2": { "tagName": "PBAS", "tagNum": 2, "typeToReturn": "getChar" },
                "qualNums": { "tagName": "PCON", "tagNum": 2, "typeToReturn": "getNumber" },
                "peakLocations": { "tagName": "PLOC", "tagNum": 2, "typeToReturn": "getShort" },
                "peakDev": { "tagName": "P1RL", "tagNum": 1, "typeToReturn": "getShort" },
                "peakOneAmp": { "tagName": "P1AM", "tagNum": 1, "typeToReturn": "getShort" },
                "colorDataA": { "tagName": "DATA", "tagNum": 10, "typeToReturn": "getShort" },
                "colorDataT": { "tagName": "DATA", "tagNum": 11, "typeToReturn": "getShort" },
                "colorDataG": { "tagName": "DATA", "tagNum": 9, "typeToReturn": "getShort" },
                "colorDataC": { "tagName": "DATA", "tagNum": 12, "typeToReturn": "getShort" }
            };

            function filter() {
                var dataview = new DataView(contents1);
                var converter = new abConverter(dataview);
                var baseCalls = converter.getDataTag(tagDict.baseCalls2);

                start = ((document.getElementById("start").value == "") ? 0 : document.getElementById("start").value);
                end = ((document.getElementById("end").value == "") ? baseCalls.length : document.getElementById("end").value);
                Target_Position = document.getElementById("Target_Position").value;
                console.log("1");
                var painter = new drawTrace(converter.getTraceData(), "peakCanvas1");
                painter.paintCanvas("index");
                if (contents2 != 0) {
                    var dataview2 = new DataView(contents2);
                    var converter2 = new abConverter(dataview2);
                    console.log("2");
                    var painter2 = new drawTrace(converter2.getTraceData(), "peakCanvas2");

                    painter2.paintCanvas("Control 1");
                }
                if (contents3 != 0) {
                    var dataview3 = new DataView(contents3);
                    var converter3 = new abConverter(dataview3);
                    console.log("3");
                    var painter3 = new drawTrace(converter3.getTraceData(), "peakCanvas3");
                    painter3.paintCanvas("Control 2");
                }

            }


            function bindButtons() {
                document.getElementById('FileName1').addEventListener('change', function subBind(event) {

                    var fileName = document.getElementById("FileName1").value;
                    //Regex to remove the pathname and just keep filename
                    fileName = fileName.replace(/.*[\/\\]/, '');
                    document.getElementById("selectedFile1").innerHTML = fileName;
                    //Regex to remove file extension
                    fileName = fileName.replace(/\.[^/.]+$/, '');

                    var oFiles = document.getElementById("FileName1").files;
                    var oneFile = oFiles[0];

                    var fileObj = new FileReader();

                    fileObj.onload = function (e) {
                        var element = document.getElementById('<%= control1.ClientID %>');
                        element.style.opacity = 1;
                        element.style.pointerEvents = "visible";
                        element.style.cursor = "pointer";

                        var filter = document.getElementById('section_filter');
                        filter.style.opacity = 1;
                        filter.style.pointerEvents = "visible";
                        filter.style.cursor = "pointer";

                        contents1 = e.target.result;

                        var dataview = new DataView(contents1);
                        console.log("dataview: " + dataview);
                        var converter = new abConverter(dataview);

                        var baseCalls = converter.getDataTag(tagDict.baseCalls2);
                        var qualScores = converter.getDataTag(tagDict.qualNums);

                        start = ((document.getElementById("start").value == "") ? 0 : document.getElementById("start").value);
                        end = ((document.getElementById("end").value == "") ? baseCalls.length : document.getElementById("end").value);
                        Target_Position = document.getElementById("Target_Position").value;

                        var painter = new drawTrace(converter.getTraceData(), "peakCanvas1");
                        painter.paintCanvas("index");
                        var header = fileName;

                        mottTrim(baseCalls, qualScores);
                        var basesString = "";
                        var scoreString = '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
                        var convertedScores = "";
                        for (var baseCounter = 0; baseCounter < baseCalls.length; baseCounter++) {
                            if (baseCounter != 0 && baseCounter % 80 === 0) {
                                basesString += "\r\n";
                                basesString += baseCalls[baseCounter];
                            }
                            else {
                                basesString += baseCalls[baseCounter];
                            }

                            convertedScores += scoreString.charAt(qualScores[baseCounter]);
                        }
                        var fasta = ">" + header + "\r\n" + basesString;
                        var fastq = "@" + header + "\r\n" + basesString + "\r\n" + "+" + "\r\n" + convertedScores;

                    }
                    fileObj.readAsArrayBuffer(oneFile);

                    event.preventDefault();
                })
                // File 2
                document.getElementById('FileName2').addEventListener('change', function subBind(event) {

                    var fileName = document.getElementById("FileName2").value;
                    //Regex to remove the pathname and just keep filename
                    fileName = fileName.replace(/.*[\/\\]/, '');
                    document.getElementById("selectedFile2").innerHTML = fileName;
                    //Regex to remove file extension
                    fileName = fileName.replace(/\.[^/.]+$/, '');

                    var oFiles = document.getElementById("FileName2").files;
                    var oneFile = oFiles[0];

                    var fileObj = new FileReader();

                    fileObj.onload = function (e) {
                        var element = document.getElementById('<%= control2.ClientID %>');
                        element.style.opacity = 1;
                        element.style.pointerEvents = "visible";
                        element.style.cursor = "pointer";

                        contents2 = e.target.result;

                        var dataview = new DataView(contents2);
                        var converter = new abConverter(dataview);

                        var baseCalls = converter.getDataTag(tagDict.baseCalls2);
                        var qualScores = converter.getDataTag(tagDict.qualNums);

                        start = ((document.getElementById("start").value == "") ? 0 : document.getElementById("start").value);
                        end = ((document.getElementById("end").value == "") ? baseCalls.length : document.getElementById("end").value);
                        Target_Position = document.getElementById("Target_Position").value;


                        var painter = new drawTrace(converter.getTraceData(), "peakCanvas2");
                        painter.paintCanvas("Control 1");
                        var header = fileName;

                        mottTrim(baseCalls, qualScores);
                        var basesString = "";
                        var scoreString = '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
                        var convertedScores = "";
                        for (var baseCounter = 0; baseCounter < baseCalls.length; baseCounter++) {
                            if (baseCounter != 0 && baseCounter % 80 === 0) {
                                basesString += "\r\n";
                                basesString += baseCalls[baseCounter];
                            }
                            else {
                                basesString += baseCalls[baseCounter];
                            }

                            convertedScores += scoreString.charAt(qualScores[baseCounter]);
                        }
                        var fasta = ">" + header + "\r\n" + basesString;
                        var fastq = "@" + header + "\r\n" + basesString + "\r\n" + "+" + "\r\n" + convertedScores;

                    }
                    fileObj.readAsArrayBuffer(oneFile);

                    event.preventDefault();
                })
                // File 3
                document.getElementById('FileName3').addEventListener('change', function subBind(event) {

                    var fileName = document.getElementById("FileName3").value;
                    //Regex to remove the pathname and just keep filename
                    fileName = fileName.replace(/.*[\/\\]/, '');
                    document.getElementById("selectedFile3").innerHTML = fileName;

                    var oFiles = document.getElementById("FileName3").files;
                    var oneFile = oFiles[0];

                    var fileObj = new FileReader();
                    var output = "";
                    fileObj.onload = function (e) {
                        contents3 = e.target.result;
                        var dataview = new DataView(contents3);
                        var converter = new abConverter(dataview);
                        var tt = converter.getDirectoryStruct();
                        var painter = new drawTrace(converter.getTraceData(), "peakCanvas3");

                        painter.paintCanvas("control 2");
                        var header = fileName;
                        var baseCalls = converter.getDataTag(tagDict.baseCalls2);
                        var qualScores = converter.getDataTag(tagDict.qualNums);
                        mottTrim(baseCalls, qualScores);
                        var basesString = "";
                        var scoreString = '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
                        var convertedScores = "";
                        for (var baseCounter = 0; baseCounter < baseCalls.length; baseCounter++) {
                            if (baseCounter != 0 && baseCounter % 80 === 0) {
                                basesString += "\r\n";
                                basesString += baseCalls[baseCounter];
                            }
                            else {
                                basesString += baseCalls[baseCounter];
                            }

                            convertedScores += scoreString.charAt(qualScores[baseCounter]);
                        }
                        var fasta = ">" + header + "\r\n" + basesString;
                        var fastq = "@" + header + "\r\n" + basesString + "\r\n" + "+" + "\r\n" + convertedScores;
                        //    document.getElementById("bases3").textContent = basesString;

                    }
                    fileObj.readAsArrayBuffer(oneFile);

                    event.preventDefault();
                })
            }

            function abConverter(inputArrayBuffer) {
                var dirLocation = inputArrayBuffer.getInt32(26);
                var numElements = inputArrayBuffer.getInt32(18);

                var lastEntry = dirLocation + (numElements * 28);

                this.getFileID = function () {
                    var output = "";
                    for (var offset = 0; offset < 4; offset++) {
                        output += String.fromCharCode(inputArrayBuffer.getInt8(offset));
                    }
                    return output;
                }

                this.getFileVersion = function () {
                    return inputArrayBuffer.getInt16(4);
                }

                this.getDirectoryStruct = function () {
                    var br = "<br>";
                    var indent = "  ";
                    var output = br;
                    var name = "";
                    for (var offset = 6; offset < 10; offset++) {
                        name += String.fromCharCode(inputArrayBuffer.getInt8(offset));
                    }
                    output += ("- tag name: " + name + br);
                    output += ("- tag number: " + inputArrayBuffer.getInt32(10) + br);
                    output += ("- element type: " + inputArrayBuffer.getInt16(14) + br);
                    output += ("- element size: " + inputArrayBuffer.getInt16(16) + br);
                    output += ("- num elements: " + inputArrayBuffer.getInt32(18) + br);
                    output += ("- data size: " + inputArrayBuffer.getInt32(22) + br);
                    output += ("- data offset: " + inputArrayBuffer.getInt32(26) + br);

                    return output;
                }

                this.getNumber = function (inOffset, numEntries) {
                    var retArray = [];
                    for (var counter = 0; counter < numEntries; counter += 1) {
                        retArray.push(inputArrayBuffer.getInt8(inOffset + counter));
                    }
                    return retArray;
                }.bind(this);

                this.getChar = function (inOffset, numEntries) {
                    var retArray = [];
                    for (var counter = 0; counter < numEntries; counter += 1) {
                        retArray.push(String.fromCharCode(inputArrayBuffer.getInt8(inOffset + counter)));
                    }
                    return retArray;
                }.bind(this);

                this.getShort = function (inOffset, numEntries) {
                    var retArray = [];
                    for (var counter = 0; counter < numEntries; counter += 2) {
                        retArray.push(inputArrayBuffer.getInt16(inOffset + counter));
                    }
                    return retArray;

                }.bind(this);

                this.getByte = function (inOffset, counter) {
                    return inputArrayBuffer.getUint8(inOffset + counter);
                }.bind(this);

                this.getWord = function (inOffset, numEntries) {
                    var retVal = "";
                    for (var counter = 0; counter < numEntries; counter += 2) {
                        retVal += inputArrayBuffer.getUint16(inOffset + counter);
                    }
                    return retVal;

                }.bind(this);

                this.getLong = function (inOffset, counter) {
                    return inputArrayBuffer.getInt32(inOffset);
                }.bind(this);

                this.getFloat = function (inOffset, counter) {
                    return inputArrayBuffer.getFloat32(inOffset);
                }.bind(this);

                this.getDouble = function (inOffset, counter) {
                    return inputArrayBuffer.getFloat64(inOffset);
                }.bind(this);

                this.getDate = function (inOffset, counter) {
                    var date = "";
                    date += inputArrayBuffer.getInt16(inOffset);
                    date += inputArrayBuffer.getUint8(inOffset + 2);
                    date += inputArrayBuffer.getUint8(inOffset + 3);
                    return date;
                }.bind(this);

                this.getTime = function (inOffset, counter) {
                    var time = "";
                    time += inputArrayBuffer.getUint8(inOffset);
                    time += inputArrayBuffer.getUint8(inOffset + 1);
                    time += inputArrayBuffer.getUint8(inOffset + 2);
                    time += inputArrayBuffer.getUint8(inOffset + 3);
                    return time;
                }.bind(this);

                this.getPString = function (inOffset, counter) {
                    var outString = "";
                    for (var count = 1; count < inputArrayBuffer.getInt8(inOffset); count++) {
                        outString += inputArrayBuffer.getInt8(inOffset + count);
                    }
                }.bind(this);

                this.getCString = function (inOffset, counter) {
                    var outString = "";
                    var offset = inOffset;
                    var currentByte = inputArrayBuffer.getInt8(offset);
                    while (currentByte != 0) {
                        outString += String.fromCharCode(currentByte);
                        offset++;
                        currentByte = inputArrayBuffer.getInt8(offset);
                    }
                    return outString;
                }.bind(this);

                this.getTagName = function (inOffset) {
                    var name = "";
                    for (var loopOffset = inOffset; loopOffset < inOffset + 4; loopOffset++) {
                        name += String.fromCharCode(inputArrayBuffer.getInt8(loopOffset));
                    }
                    return name;
                }.bind(this);

                this.getDataTag = function (inTag) {
                    var output;
                    var curElem = dirLocation;
                    do {
                        var currTagName = this.getTagName(curElem);
                        var tagNum = inputArrayBuffer.getInt32(curElem + 4);
                        if (currTagName == inTag.tagName && tagNum === inTag.tagNum) {
                            var numEntries = inputArrayBuffer.getInt32(curElem + 16);
                            var entryOffset = inputArrayBuffer.getInt32(curElem + 20);
                            output = this[inTag.typeToReturn](entryOffset, numEntries);
                        }
                        curElem += 28;
                    } while (curElem < lastEntry);
                    return output;
                }

                this.getTraceData = function () {
                    var traceData = {};
                    traceData.aTrace = this.getDataTag(tagDict.colorDataA);
                    traceData.tTrace = this.getDataTag(tagDict.colorDataT);
                    traceData.gTrace = this.getDataTag(tagDict.colorDataG);
                    traceData.cTrace = this.getDataTag(tagDict.colorDataC);
                    traceData.basePos = this.getDataTag(tagDict.peakLocations);
                    traceData.baseCalls = this.getDataTag(tagDict.baseCalls2);
                    traceData.qualNums = this.getDataTag(tagDict.qualNums);

                    return traceData;
                }

                this.getTraceBases = function () {
                    var traceBases = {};
                    traceBases.baseCalls = this.getDataTag(tagDict.baseCalls2);
                    return traceBases;
                }

                this.getFirstEntry = function () {

                    var output = "";
                    for (var curElem = dirLocation; curElem < lastEntry; curElem += 28) {
                        var name = "";
                        for (var offset = curElem; offset < curElem + 4; offset++) {
                            name += String.fromCharCode(inputArrayBuffer.getInt8(offset));
                        }
                        output += (" - " + name);
                    }
                    return output;
                }
            }

            function drawTrace(traceData, canvasElement) {
                var colors = { adenine: "green", thymine: "red", guanine: "black", cytosine: "blue", other: "pink" };
                if (canvasElement === "peakCanvas3")
                    var peakCanvas = document.getElementById('<%= peakCanvas3.ClientID%>');
                else
                    var peakCanvas = document.getElementById(canvasElement);
                var ctx = peakCanvas.getContext("2d");

                var formattedPeaks = { a: [], t: [], g: [], c: [] };
                var bottomBuffer = 50;
                var baseBuffer = 35;
                var maxHeight = peakCanvas.height;
                var maxWidth = traceData.basePos[end - 1] - traceData.basePos[start];
                peakCanvas.width = maxWidth;
                ctx.fillStyle = "white";
                ctx.fillRect(0, 0, maxWidth, peakCanvas.height);
                var scaledHeight = maxHeight - bottomBuffer;
                var scalePct = 0;

                this.findTallest = function () {
                    var aMax = Math.max(...traceData.aTrace);
                    var tMax = Math.max(...traceData.tTrace);
                    var gMax = Math.max(...traceData.gTrace);
                    var cMax = Math.max(...traceData.cTrace);
                    scalePct = scaledHeight / Math.max(aMax, tMax, gMax, cMax);
                }

                this.scalePeaks = function (traceIn) {
                    var newPeaks = [];
                    for (var count = 0; count < traceIn.length; count++) {
                        newPeaks[count] = scalePct * traceIn[count];
                    }
                    //   console.log("newPeaks[count]: " + newPeaks[count]);
                    return newPeaks;
                }

                this.preparePeaks = function () {
                    this.findTallest();
                    formattedPeaks.a = this.scalePeaks(traceData.aTrace);
                    formattedPeaks.t = this.scalePeaks(traceData.tTrace);
                    formattedPeaks.g = this.scalePeaks(traceData.gTrace);
                    formattedPeaks.c = this.scalePeaks(traceData.cTrace);
                }

                this.drawPeaks = function (trace, lineColor) {

                    ctx.beginPath();
                    ctx.translate(-traceData.basePos[start], 0);
                    ctx.moveTo(traceData.basePos[start], scaledHeight - traceData.basePos[start]);
                    for (var counter = traceData.basePos[start] + 1; counter < traceData.basePos[end - 1]; counter++) {
                        ctx.lineTo(counter, scaledHeight - trace[counter]);
                        ctx.moveTo(counter, scaledHeight - trace[counter]);
                    }
                    ctx.strokeStyle = lineColor;
                    ctx.translate(traceData.basePos[start], 0);
                    ctx.stroke();

                }

                this.drawBases = function () {
                    //ctx.font = "24px serif";
                    ctx.translate(-traceData.basePos[start], 0);
                    var xOffset = -2;
                    for (var count = start; count < end; count++) {

                        var baseCall = traceData.baseCalls[count];
                        switch (baseCall) {
                            case "A":
                                ctx.fillStyle = colors.adenine;
                                break;
                            case "T":
                                ctx.fillStyle = colors.thymine;
                                break;
                            case "G":
                                ctx.fillStyle = colors.guanine;
                                break;
                            case "C":
                                ctx.fillStyle = colors.cytosine;
                                break;
                            default:
                                ctx.fillStyle = colors.other;
                        }
                        ctx.fillText(baseCall, traceData.basePos[count] + xOffset, maxHeight - baseBuffer);
                        if (traceData.basePos[count] == traceData.basePos[Target_Position]) {
                            ctx.lineWidth = 2;
                            ctx.strokeStyle = "#FF0000";
                            ctx.strokeRect(traceData.basePos[count] + xOffset - 2, maxHeight - baseBuffer - 10, 12, 12);//for white background


                        }
                    }
                }

                this.drawNumbers = function () {
                    var xOffset = -2;
                    var yOffset = -10;
                    for (var count = start; count < end; count++) {
                        if (count % 5 === 0) {
                            ctx.fillStyle = "black";
                            ctx.fillText(count, traceData.basePos[count] + xOffset, maxHeight - baseBuffer - yOffset);
                        }
                    }

                }

                this.drawTarget = function () {
                    var xOffset = -2;
                    var yOffset = -20;
                    ctx.fillStyle = "red";
                    ctx.fillText("|", traceData.basePos[Target_Position] + xOffset, maxHeight - baseBuffer - yOffset);

                }

                this.draw_Target = function () {
                    var xOffset = -2;
                    var yOffset = -20;
                    ctx.fillStyle = "red";
                    ctx.fillText("^", traceData.basePos[Target_Position] + xOffset - 1, maxHeight - baseBuffer - yOffset);

                }

                this.drawlabel = function (el) {

                    ctx.fillStyle = "black";
                    ctx.fillText(el, 10, 10);

                }

                this.paintCanvas = function (el) {

                    this.preparePeaks();
                    this.drawlabel(el);
                    this.drawPeaks(formattedPeaks.a, colors.adenine);
                    this.drawPeaks(formattedPeaks.t, colors.thymine);
                    this.drawPeaks(formattedPeaks.g, colors.guanine);
                    this.drawPeaks(formattedPeaks.c, colors.cytosine);
                    this.drawBases();
                    this.drawNumbers();
                    this.drawTarget();
                    this.draw_Target();


                }
            }

            function mottTrim(baseCalls, qualScores) {

                var startPos = 0;
                var endPos = 0;
                var tempStart = 0;
                var tempEnd;
                var score = 0;
                var cutoff = 0.01;
                for (var count = start; count < end; count++) {
                    score = score + cutoff - Math.pow(10, (qualScores[count]) / -10);
                    if (score < 0) {
                        tempStart = count;
                    }
                    if (count - tempStart > endPos - startPos) {
                        startPos = tempStart;
                        endPos = count;
                    }
                }
                var trimmed = baseCalls.slice(startPos, endPos + 1);
            }

            function download() {
                var Base64 = document.getElementById('<%= sanger_base64.ClientID %>');
                var image = document.getElementById("peakCanvas1");
                Base64.value = image.toDataURL();
                document.getElementById("<%= save_sanger.ClientID %>").click();
            }


            function GetRadWindow() {
                var oWindow = null;
                if (window.radWindow) oWindow = window.radWindow;
                else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
                return oWindow;
            }
            function CloseWindow() {
                var oWindow = GetRadWindow();  //Obtaining a reference to the current window 
                oWindow.Close();
            }

        </script>
    </telerik:RadScriptBlock>
    <%-- <script src="../../Scripts/abitoJSON.js"></script>--%>
</body>
</html>

