<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Sanger.ascx.cs" Inherits="WebGAP.GAP.uc.uc_Sanger" %>

<style>
    body {
        background-color: wheat;
    }


    .canvasContainer {
        background-color: white;
        position: relative;
        overflow: auto;
    }

    .bases {
        font-family: monospace;
        padding-right: 8px;
        white-space: normal;
        overflow: auto;
    }

    #baseContainer {
        overflow: auto;
    }

    .textInput {
        width: 250px;
    }


    .tt {
        background-color: #3cc3d2;
        border: none;
        border-radius: 8px;
        color: white;
        padding: 16px 32px;
        text-decoration: none;
        margin: 4px 2px;
        cursor: pointer;
        width: 250px;
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
</style>
<!doctype html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
</head>
<body>
    <br>
    <br>
    <div class="content-body pt-1">
        <section id="basic-form-layouts">
            <div class="row" style="height: 500px">
                <script type="text/javascript" id="telerikClientEvents1">
                    function OnColumnMouseOut(sender, args) {
                    }
                </script>
                <div class="col-md-4">
                    <div class="card" style="height: 500px">
                        <h4 class="form-section">index</h4>



                        <br>
                        <label for="fileName" class="tt" onclick="bindButtons('fileName', 'peakCanvas', 'bases')">Custom Upload</label>
                        <input id="fileName" type="file" />



                        <div class="panel-heading">Bases</div>
                        <div class="panel-body" id="baseContainer">
                            <p id="bases" class="bases"></p>
                        </div>



                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="height: 500px">

                        <h4 class="form-section">Mother</h4>

                        <div class="panel panel-default">
                            <div class="panel-body">

                                <label for="test" class="tt" onclick="bindButtons('test', 'peakCanvas1', 'bases1')">Custom Upload</label>
                                <input id="test" type="file" />

                                <br>
                            </div>
                            <div class="inside inside-full-height">
                                <div class="panel panel-default">
                                    <div class="panel-heading">Bases</div>
                                    <div class="panel-body baseContainer" id="baseContainer1">
                                        <p id="bases1" class="bases"></p>
                                    </div>
                                </div>
                            </div>
                            </>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="height: 500px">
                        <h4 class="form-section">father</h4>
                        <div class="col-md-4" style="height: 500px !important">
                            <input type="file" id="filceName" onclick="bindButtons('fileName', 'peakCanvas', 'bases')">
                            <br>
                        </div>
                        <div class="panel-heading">Bases</div>
                        <div class="panel-body" id="baseCocntainer">
                            <p id="bacses" class="bases"></p>
                        </div>
                    </div>
                </div>


            </div>
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <div class="panel panel-default">
                        <div class="panel-heading">Trace</div>
                        <div class="panel-body canvasContainer" id="canvasContainer">
                            <canvas id="peakCanvas" height="350"></canvas>
                        </div>
                    </div>
                </div>
                <div class="col-md-1"></div>
            </div>
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <div class="panel panel-default">
                        <div class="panel-heading">Trace</div>
                        <div class="panel-body canvasContainer" id="canvasContainer1">
                            <canvas id="peakCanvas1" height="350"></canvas>
                        </div>
                    </div>
                </div>
                <div class="col-md-1"></div>
            </div>
        </section>
    </div>

    <script src="../../Scripts/abitoJSON.js"></script>
</body>
</html>
