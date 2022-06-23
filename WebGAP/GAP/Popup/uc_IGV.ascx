<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_IGV.ascx.cs" Inherits="WebGAP.GAP.Popup.uc_IGV" %>

<div class=" content-body pt-1 ">
    <div class=" card-content collapse show ">
        <div class=" card-bodypopup">
            <form class="form">
                <div class="form-body">
                    <h4 class="form-sectionpopup">Gene <%=  Session["GAPGene"].ToString() %> </h4>
                    <asp:HiddenField ID="Sample1" runat="server" />
                    <asp:HiddenField ID="Sample2" runat="server" />
                    <div id="igv-div" style="padding-top: 10px; padding-bottom: 10px; border: 1px solid lightgray; "></div>

                </div>
                <div class="form-actionspopup center">

                    <asp:Button ID="btn_cacel" Text="Cancel" runat="server" OnClientClick="CloseWindow(); return false;"
                        class="btn btn-danger mr-1 ladda-button btn-sm"></asp:Button>
                </div>
            </form>
        </div>
    </div>
</div>

<telerik:RadScriptBlock runat="server" ID="RadScriptBlock1">
    <script src="../../assets/js/jquery1.8.3.min.js" type="text/javascript"></script>
 <%--   <script type="text/javascript" src="jquery1.8.3.min.js"></script>--%>
    <script src="https://igv.org/web/release/2.2.16/dist/igv.min.js"></script>

    <script>

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
    <script type="text/javascript">

        $(document).ready(function () {

            var URL_F = {};
            var INDEXURL_F = {};


            var URL_M = {};
            var INDEXURL_M = {};

            //      var URL = 'https://www.dropbox.com/s/gyrlesn77srsx3b/9713_test3.bam?dl=0';


            //     var INDEXURL = 'https://www.dropbox.com/s/q1477bwix9tokcl/9713_test3.bam.bai?dl=0';

            var S1 = document.getElementById('<%= Sample1.ClientID%>');
            var list_S1 = [parseInt(S1.value, 10)];

            var S2 = document.getElementById('<%= Sample2.ClientID%>');
            var list_S2 = [parseInt(S2.value, 10)];

            var start = '<%= Session["GAPStrt_POS"] %>';
            var END =  '<%=  Session["GAPEnd_POS"] %>';
            var CHR = '<%=  Session["GAPCHR"] %>';
            var locus = "chr" + CHR + ":" + start + "-" + END;

       
                var jsonText = JSON.stringify({ list: list_S1 });
                jQuery.ajax({
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    data: jsonText,
                    async: false,
                    dataType: 'JSON',
                    url: '/GAP/Service/se_GAP.asmx/InputFile_Path',
                    success: function (result) {
                        URL_M = result.d[0].FilePath_1;
                        INDEXURL_M = result.d[0].FilePath_2;
                    },
                    error: function () {
                        alert('Error on binding the data');
                    }
                });

         

         
              
            


            const options = { genome: "hg19", locus: locus };


            if (list_S2 == 0)
                options.tracks = [{ type: "alignment", format: "cram", name: S1.value, url: URL_M, indexURL: INDEXURL_M }];
            else {
                   var jsonText = JSON.stringify({ list: list_S2 });
                jQuery.ajax({
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    data: jsonText,
                    async: false,
                    dataType: 'JSON',
                    url: '/GAP/Service/se_GAP.asmx/InputFile_Path',
                    success: function (result) {
                        URL_F = result.d[0].FilePath_1;
                        INDEXURL_F = result.d[0].FilePath_2;
                    },
                    error: function () {
                        alert('Error on binding the data');
                    }
                });
                options.tracks = [{ type: "alignment", format: "cram", name: S1.value, url: URL_M, indexURL: INDEXURL_M }, { type: "alignment", format: "cram", name: S2.value, url: URL_F, indexURL: INDEXURL_F }];
            }
            //console.log(list_S2);
            //switch (S2.value) {
            //    case "0":
            //        if (S2.value != "0") {  // female
            //            console.log("tt");
            //            options.tracks = [{ type: "alignment", format: "cram", name: S2.value, url: URL_F, indexURL: INDEXURL_F }];
            //        }
            //        break;
            //    case 1:
            //        if (list_S2 == 0) { // Male or single Sample
            //            console.log("list_S2");
            //            options.tracks = [{ type: "alignment", format: "cram", name: S1.value, url: URL_M, indexURL: INDEXURL_M }];
            //        }
            //        break;
            //    default:  // two samples
            //        options.tracks = [{ type: "alignment", format: "cram", name: S1.value, url: URL_M, indexURL: INDEXURL_M }, { type: "alignment", format: "cram", name: S2.value, url: URL_F, indexURL: INDEXURL_F }];
            //}

            const igvDiv = document.getElementById("igv-div");
            //  igv.setGoogleOauthToken("ya29.GltIByYc8kXdUwVHaw43mZ2ZW3azGQr48U0AOoKSIbYjLC-TSmqiY64eMiN7jPbZyMLTbqw1OAXIOPRgtdE6Cz6-1xSOeisrw0Ek9glqH_gfNJiG4I5DM76F92ET");

            igv.createBrowser(igvDiv, options)
                .then(function (browser) {
                    console.log("Created IGV browser");
                })



        });





    </script>
</telerik:RadScriptBlock>


