<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_VariantDiscovery.ascx.cs" Inherits="WebGAP.GAP.uc.uc_VariantDiscovery" %>
<style>
    .rbVerticalList .rbCheckBox, .rbVerticalList .rbRadioButton, .rbVerticalList .rbToggleButton {
        float: left;
        width: 120px;
        text-align: left;
    }

    .pageViw {
        background: white;
        border-radius: 5px;
        border: 1px solid lightgray;
        padding: 20px;
    }

    .rtsLevel1 .rtsLI {
        width: 200px !important
    }



    @keyframes spin {
        from {
            transform: rotate(0);
        }

        to {
            transform: rotate(359deg);
        }
    }


    @keyframes pulse {
        from {
            opacity: 1;
            transform: scale(1);
        }

        to {
            opacity: .25;
            transform: scale(.75);
        }
    }

    .spinner-box {
        width: auto;
        height: 22px;
        /*display: flex;*/
        justify-content: center;
        align-items: center;
        background-color: transparent;
        float: right;
    }

    /* PULSE BUBBLES */
    .pulse-container {
        width: 50px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        float: right;
        margin-top: 4px;
    }

    .pulse-bubble {
        width: 11px;
        height: 11px;
        background-color: #3BAFDA;
        border-radius: 20%;
    }

    .pulse-bubble-1 {
        animation: pulse .4s ease 0s infinite alternate;
    }

    .pulse-bubble-2 {
        animation: pulse .4s ease .2s infinite alternate;
    }

    .pulse-bubble-3 {
        animation: pulse .4s ease .4s infinite alternate;
    }

    .displyNon {
        display: none;
    }

    .table-striped {
        width: 100%;
        margin: 10px;
    }

        .table-striped td {
            padding: 15px
        }

    .RadAutoCompleteBox.RadAutoCompleteBoxWithLabel .racTokenList {
        width: 300px !important
    }

    .RadComboBox_Metro .rcbInput {
        height: 25px;
    }

    form .form-actions {
        border-top: 0;
        padding: 0 40px 0 0;
        margin-top: 20px;
    }
</style>


<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="DDL_RefBuild">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_RefBuild" />
                <telerik:AjaxUpdatedControl ControlID="pnl_Region" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="CB_Chromosome" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="DDL_Assay">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_Assay" />
                <telerik:AjaxUpdatedControl ControlID="pnl_Region" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="CB_Chromosome" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="DDL_Assay">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_Assay" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RC_GeneId">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RC_GeneId" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>




        <%--<telerik:AjaxSetting AjaxControlID="btnShowTotalCount">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btnShowTotalCount" />
                <telerik:AjaxUpdatedControl ControlID="lbl_TotalCount" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>--%>
        <%--<telerik:AjaxSetting AjaxControlID="RB_Region_Submit_Click">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RB_Region_Submit_Click" />
                <telerik:AjaxUpdatedControl ControlID="lbl_TotalCount" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>--%>
    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>



<div class="content-header row pt-2">
    <table style="margin-left: 14px; width: 98%; background-color: lightgray; border-radius: 5px">
        <tr>
            <td></td>
            <td rowspan="2">
                <h4 style="margin-bottom: 1px; color: white; text-shadow: 1px 1px 1px #444;">
                    <asp:Label runat="server" ID="Variant" Text="Variant Discovery" CssClass="header"> </asp:Label></h4>
            </td>
        </tr>
        <tr>
            <td></td>
            <td style="float: right; margin: 5px;">
                <telerik:RadComboBox ID="DDL_RefBuild" runat="server" Skin="Metro" CssClass="p-l-20" DataSourceID="SDS_RefBuild"
                    EmptyMessage="Select a reference build" Width="220px" Height="150px" AutoPostBack="true" EnableLoadOnDemand="True"
                    ShowMoreResultsBox="true" EnableVirtualScrolling="true" DataTextField="ReferenceBuildName"
                    DataValueField="Textcode" OnClientDropDownOpening="RC_Gene_DropDownOpening">
                </telerik:RadComboBox>

                <%-- <telerik:RadDropDownList RenderMode="Lightweight" ID="" runat="server" Width="200px" DataTextField="ReferenceBuildName" 
                    DataValueField="Textcode"
                    AppendDataBoundItems="True" AutoPostBack="true" Skin="Metro" DataSourceID="SDS_RefBuild" 
                    DefaultMessage="Select a reference build" ValidationGroup="validRefbuldAssay">
                </telerik:RadDropDownList>--%>

            </td>
            <td style="margin: 5px; width: 14%">

                <telerik:RadComboBox ID="DDL_Assay" runat="server" Skin="Metro" CssClass="p-l-20" DataSourceID="SDS_Assay"
                    EmptyMessage="Select a sequence type:" Width="220px" Height="150px" AutoPostBack="true" EnableLoadOnDemand="True"
                    ShowMoreResultsBox="true" EnableVirtualScrolling="true" DataTextField="SeqTypeName"
                    DataValueField="SeqTypeName" OnClientDropDownOpening="RC_Gene_DropDownOpening">
                </telerik:RadComboBox>

                <%-- <telerik:RadDropDownList RenderMode="Lightweight" Skin="Metro" ID="" runat="server" Width="200px" DataTextField="SeqTypeName"
                    DataValueField="SeqTypeName"
                    AppendDataBoundItems="True" AutoPostBack="true" DataSourceID="SDS_Assay" DefaultMessage="Select a sequence type"
                    OnClientLoad="DDL_Assay_ClicentLoad" ValidationGroup="validRefbuldAssay">
                </telerik:RadDropDownList>--%>

            </td>
        </tr>

    </table>
</div>

<div class="content-body pt-1">
    <section id="basic-form-layouts">
        <div class="row match-height">
            <div class="col-12">
                <telerik:RadTabStrip runat="server" RenderMode="Lightweight" ID="RTS_Region" SelectedIndex="0" Align="Left" MultiPageID="RMP_VariantDiscovery" Skin="Silk">
                    <Tabs>
                        <telerik:RadTab Text="Chromosome regions" PageViewID="RPW_P1">
                        </telerik:RadTab>
                        <telerik:RadTab Text="Gene" PageViewID="RPW_P2">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage ID="RMP_VariantDiscovery" runat="server" SelectedIndex="0" CssClass="outerMultiPage">
                    <telerik:RadPageView runat="server" ID="RPW_P1" CssClass="pageViw" >
                        <asp:Panel ID="pnl_Region" runat="server">
                            <table class=" table-striped">
                                <tr>
                                    <td>
                                        <telerik:RadComboBox ID="CB_Chromosome" runat="server" Skin="MetroTouch" Label="Chromosome:" DataSourceID="SDS_Chromosome"
                                            Width="80px" Height="200px" AutoPostBack="true" DataTextField="chromosome" DataValueField="chromosome"
                                            EnableVirtualScrolling="true" Enabled="true" Font-Size="15px">
                                        </telerik:RadComboBox>


                                    </td>
                                    <td>

                                        <telerik:RadNumericTextBox ID="Txt_SPos" runat="server" Label="Start position:"
                                            Enabled="true" DataType="System.Int64" Width="250px" LabelWidth="100px" Skin="MetroTouch">
                                            <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                            <ClientEvents OnValueChanged="Txt_SPos_KeyPress" />
                                        </telerik:RadNumericTextBox>
                                    </td>
                                    <td style="width: 10px; text-align: center"></td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="Txt_EPos" runat="server" Label="End position:"
                                            Enabled="true" DataType="System.Int64" Width="250px" LabelWidth="100px" Skin="MetroTouch">
                                            <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                            <ClientEvents OnValueChanged="Txt_EPos_KeyPress" OnValueChanging="Txt_EPos_KeyPress" />
                                        </telerik:RadNumericTextBox>
                                    </td>

                                    <td>
                                        <div class="text-right">
                                            <telerik:RadButton runat="server" ID="RB_Region_Submit" AutoPostBack="true"
                                                Text="Submit" Skin="Material" RenderMode="Lightweight" Font-Size="Small" Width="150px" OnClientClicked="Btn_Add_ChrCoordinates_Clicked"
                                                Icon-PrimaryIconLeft="10px" Icon-PrimaryIconTop="12px">
                                                <Icon PrimaryIconUrl="~/img/icon/icon_add-filter.gif" />
                                            </telerik:RadButton>
                                            <asp:Button runat="server" ID="btn_VariantDis_Region_GoToFilter" Text="Submit" Font-Size="Small" Width="150px" CssClass="displyNon" OnClick="btn_VariantDis_Region_GoToFilter_Click" />
                                        </div>
                                        <asp:HiddenField runat="server" ID="Hdn_Region" Value="" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" ID="RPW_P2" CssClass="pageViw" SelectedIndex="0">
                        <table class=" table-striped">
                            <tr>
                                <td>
                                    <telerik:RadComboBox ID="RC_GeneId" RenderMode="Lightweight" runat="server" Skin="MetroTouch" CssClass="p-l-20" DataSourceID="SDS_Gene"
                                        Label="Choose a Gene:" Width="600px" Height="200px" AutoPostBack="true" EnableAutomaticLoadOnDemand="True"
                                        ShowMoreResultsBox="true" EnableVirtualScrolling="true" DataTextField="name" DataValueField="entrez_id"
                                        LoadingMessage="Loading..." ShowWhileLoading="true" ItemsPerRequest="5" Filter="Contains">
                                        <%--OnClientDropDownOpening="RC_Gene_DropDownOpening"--%>
                                    </telerik:RadComboBox>
                                    <%--<telerik:RadAutoCompleteBox ID="RACB_GeneID" runat="server" Skin="MetroTouch" Label="Gene name:" DataSourceID="SDS_Gene"
                                            Width="450px" Height="200px" DropDownWidth="300px" AutoPostBack="true" DataTextField="name" DataValueField="entrez_id"
                                            EnableVirtualScrolling="true" Enabled="true" Font-Size="15px" MaxResultCount="10" ></telerik:RadAutoCompleteBox>
                                    --%>    </td>

                                <td>
                                    <div class="text-right">
                                        <telerik:RadButton runat="server" ID="RB_Gene_Submit" AutoPostBack="true"
                                            Text="Submit" Skin="Material" RenderMode="Lightweight" Font-Size="Small" Width="150px"
                                            Icon-PrimaryIconLeft="10px" Icon-PrimaryIconTop="12px" OnClientClicked="Btn_Add_Gene_Clicked">
                                            <Icon PrimaryIconUrl="~/img/icon/icon_add-filter.gif" />
                                        </telerik:RadButton>
                                        <asp:Button runat="server" ID="btn_VariantDis_Gene_GoToFilter" Text="Submit" Font-Size="Small" Width="150px" CssClass="displyNon" OnClick="btn_VariantDis_Gene_GoToFilter_Click1" />
                                    </div>
                                    <asp:HiddenField runat="server" ID="Hdn_Gene" Value="" />

                                </td>
                            </tr>
                        </table>
                    </telerik:RadPageView>

                </telerik:RadMultiPage>

                <div class="form-actions">
                    <div id="div_loading" runat="server" class="spinner-box displyNon">
                        <span style="font-size: small; float: left; padding-right: 10px">LOADING</span>
                        <div class="pulse-container">
                            <div class="pulse-bubble pulse-bubble-1"></div>
                            <div class="pulse-bubble pulse-bubble-2"></div>
                            <div class="pulse-bubble pulse-bubble-3"></div>
                        </div>
                    </div>
                    <%--<div class="text-right" style="padding: 5px; font-size: 14px; background-color: lightcyan; border-radius: 5px; width: 20%; float: right; margin-top: 5px">
                        <asp:Label runat="server" ID="lbl_TotalCount" Text="" Font-Size="Medium" />
                    </div>--%>

                    <asp:HiddenField ID="Hdn_TotalCount" runat="server" Value="" />
                    <%--<asp:Button runat="server" ID="btnShowTotalCount"  Text="" style="display:none;" OnClick="btnShowTotalCount_Click" />--%>
                </div>

            </div>
        </div>
    </section>
</div>

<asp:SqlDataSource ID="SDS_RefBuild" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand=" Select * from [WiNGS_BaseInfo_Db].[dbo].[Tbl_ReferenceBuild] where status = 1 "></asp:SqlDataSource>
<asp:SqlDataSource ID="SDS_Assay" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="SELECT [SeqTypeName] FROM [WiNGS_BaseInfo_Db].[dbo].[Tbl_SeqType]"></asp:SqlDataSource>
<asp:SqlDataSource ID="SDS_Chromosome" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="SELECT [chromosome], [length] FROM [Tbl_GAP_Chromosome] "><%--WHERE ([ReferenceBuildID] = @ReferenceBuildID) ORDER BY [chrorder]--%>
    <%-- <SelectParameters>
        <asp:ControlParameter ControlID="DDL_RefBuild" Name="ReferenceBuildID" PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>--%>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SDS_Gene" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_GAP_VariantDiscovery_Genes_Sel" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

<telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
    <script type="text/javascript">
        //-----for solving an issue in javascript
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function EndRequestHandler(sender, args) {
            if (args.get_error() != undefined) {
                args.set_errorHandled(true);
            }
        }

        function Btn_Add_ChrCoordinates_Clicked(sender, args) {
            var refBuild = $find("<%= DDL_RefBuild.ClientID %>");
            var assay = $find("<%= DDL_Assay.ClientID %>");
            var tb_spoint = $find("<%= Txt_SPos.ClientID %>");
            var tb_epoint = $find("<%= Txt_EPos.ClientID %>");

            if (refBuild.get_value().length < 1) {
                alert("Please define Refrence build!");
                args.set_cancel(true);
            }
            else if (assay.get_value().length < 1) {
                alert("Please define Sequence Type!");
                args.set_cancel(true);
            }
            else if ((tb_spoint.get_value().length < 1) || (tb_epoint.get_value().length < 1)) {
                alert("Please define Start and end position!");
                args.set_cancel(true);
            }
            else if (parseInt(tb_spoint.get_value()) > parseInt(tb_epoint.get_value())) {
                //console.log(parseInt(tb_spoint.get_value()));
                //console.log(parseInt(tb_epoint.get_value()));
                alert("Please enter valid Start and end position!");
                args.set_cancel(true);
            }
            else {
                totalCount = 0;
                onClick_GetReqId("Region");
            }
        }

        function Txt_SPos_KeyPress(sender, args) {

            <%--if (parseInt($find("<%= Txt_SPos.ClientID %>").get_value()) <= parseInt($find('<%=CB_Chromosome.ClientID %>').get_selectedItem().get_value())) {
                $find("<%= Txt_EPos.ClientID %>").set_value($find("<%= Txt_SPos.ClientID %>").get_value());
            } else {
                alert("Entered value for start position is outside the chromosome!");
                args.set_cancel(true);
            }--%>
        }

        function Txt_EPos_KeyPress(sender, args) {

            <%--if (parseInt($find("<%= Txt_EPos.ClientID %>").get_value()) > parseInt($find('<%=CB_Chromosome.ClientID %>').get_selectedItem().get_value())) {

                alert("Entered value for end position is outside the chromosome!");
                args.set_cancel(true);
            }--%>

        }


        var counter = 0;
        var regionOrGene = 0;
        function onClick_GetReqId(varSearch) {


            if (counter === Number('<%= Session["NumberOfCentersAndHosts"] %>')) {
                counter = 0;
            }
            var url = "/Upload/centerList.json";
           // var UserId = '<%= Session["WiNGSMasterId"] %>';
            //var CenterIdOfUser = '<%= Session["Current_CenterID"] %>';
           // var HostIdOfUser = '<%= Session["Current_Host"] %>';

            var VariantSearch = "";

            if (varSearch === "Region") {
                var chr = $find('<%= CB_Chromosome.ClientID%>');
                var start = $find('<%= Txt_SPos.ClientID%>');
                var end = $find('<%= Txt_EPos.ClientID%>');
                regionOrGene = 1;

                VariantSearch = chr.get_selectedItem().get_value() + '-' + start.get_value() + '-' + end.get_value();
                document.getElementById('<%= Hdn_Region.ClientID %>').value = VariantSearch;

            }
            else if (varSearch === "Gene") {
                var geneId = $find('<%= RC_GeneId.ClientID%>').get_value();
                VariantSearch = geneId;
                regionOrGene = 2;

                document.getElementById('<%= Hdn_Gene.ClientID %>').value = VariantSearch;
            }

            var SeqType = $find('<%= DDL_Assay.ClientID%>').get_selectedItem().get_value();
            var RefBuild = $find('<%= DDL_RefBuild.ClientID%>').get_selectedItem().get_value();

            $.getJSON(url, function (data) {
                $.each(data, function (HostId, model) {

                    var HostId = model.HostId;
                    var CenterId = model.CenterId;

                    if (err === 1) {
                        alert("Error! Invalid region format.\n Expected chr - start - end");
                        return false; // break
                    }
                    else {
                        //var element = row.findElement("div_loading");
                        //element.classList.remove("displyNon");
                        //console.log('Calculation in progress...');

                        //var list = [Region, SeqType, RefBuild, UserId, CenterId, HostId, CenterIdOfUser, HostIdOfUser, 1];
                        var list = [VariantSearch, SeqType, RefBuild, CenterId, HostId, regionOrGene];
                        var jsonText = JSON.stringify({ list: list });
                        console.log("VariantSearch: " + VariantSearch);
                        console.log("SeqType: " + SeqType);
                        console.log("RefBuild: " + RefBuild);
                        console.log("CenterId: " + CenterId);
                        console.log("HostId: " + HostId);

                        $.ajax({
                            type: 'POST',
                            contentType: 'application/json; charset=utf-8',
                            data: jsonText,
                            async: true,
                            dataType: 'JSON',
                            url: '/GAP/Service/se_VariantDiscovery_TotalCount.asmx/GetReqIdAsync',
                            success: function (result) {
                                res = JSON.parse(result.d);
                                console.log("id: " + res["0"].reqId);
                                counter++;

                                if (parseInt(res["0"].centerId) > -1 && parseInt(res["0"].hostId) > -1) {
                                    console.log("res centerId: " + res["0"].centerId + "res reqid" + res["0"].reqId);
                                    get_totalCountAsync(res["0"].centerId, res["0"].hostId, res["0"].reqId, varSearch);
                                }

                            },
                            error: function (jqXHR, exception) {
                                var msg = '';
                                if (jqXHR.status === 0) {
                                    msg = 'Not connect.\n Verify Network.';
                                } else if (jqXHR.status == 404) {
                                    msg = 'Requested page not found. [404]';
                                } else if (jqXHR.status == 500) {
                                    msg = 'Internal Server Error [500].';
                                } else if (exception === 'parsererror') {
                                    msg = 'Requested JSON parse failed.';
                                } else if (exception === 'timeout') {
                                    msg = 'Time out error.';
                                } else if (exception === 'abort') {
                                    msg = 'Ajax request aborted.';
                                } else {
                                    msg = 'Uncaught Error.\n' + jqXHR.responseText;
                                }
                                alert(msg);
                            }

                        });
                    }
                })
            });
        }

        var totalCount = 0;
        var ReturnedTotalCount = 0;
        var err = 0; // No error
        function get_totalCountAsync(centerId, hostId, reqId, variantSearch) {
            var st;

           // var UserId = '<%= Session["WiNGSMasterId"] %>';
           // var CenterIdOfUsr = '<%= Session["Current_CenterID"] %>';
           // var HostIdOfUser = '<%= Session["Current_Host"] %>';


            //var list = [centerId, hostId, reqId, UserId, CenterIdOfUsr, HostIdOfUser];
            var list = [centerId, hostId, reqId];
            var jsonText = JSON.stringify({ list: list });

            jQuery.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                data: jsonText,
                async: true,
                dataType: 'JSON',
                url: '/GAP/Service/se_VariantDiscovery_TotalCount.asmx/GetTotalCountAsync',
                beforeSend: function () {
                    var element = document.getElementById('<%= div_loading.ClientID%>');
                    element.classList.remove("displyNon");
             <%--       var RB_Region_Submit = $find('<%= RB_Region_Submit.ClientID%>');
                    RB_Region_Submit.set_enabled(false);--%>
                    var RB_Gene_Submit = $find('<%= RB_Gene_Submit.ClientID%>');
                    RB_Gene_Submit.set_enabled(false);


                    console.log('Calculation in progress!');

                },
                success: function (result) {
                    var res = JSON.parse(result.d);
                    //console.log('-=-=-=-=-=-');
                    console.log("resss:   " + result.d);

                    st = res["0"].st;


                    if (st == 'inprogress') {
                        sleepVer2(2000);
                        setInterval(get_totalCountAsync(centerId, hostId, reqId, variantSearch), 2000);
                    }
                    else if (st == 'completed') {
                        console.log("completed count" + Number(res["0"].totalCount))
                        totalCount = totalCount + Number(res["0"].totalCount);
                      /*  console.log(" after completed count" + totalCount)*/
                           // document.getElementById("<%= Hdn_TotalCount.ClientID %>").value = totalCount;

                    }

                },
                error: function (jqXHR, exception) {
                    var msg = '';
                    if (jqXHR.status === 0) {
                        msg = 'Not connect.\n Verify Network.';
                    } else if (jqXHR.status == 404) {
                        msg = 'Requested page not found. [404]';
                    } else if (jqXHR.status == 500) {
                        msg = 'Internal Server Error [500].';
                    } else if (exception === 'parsererror') {
                        msg = 'Requested JSON parse failed.';
                    } else if (exception === 'timeout') {
                        msg = 'Time out error.';
                    } else if (exception === 'abort') {
                        msg = 'Ajax request aborted.';
                    } else {
                        msg = 'Uncaught Error.\n' + jqXHR.responseText;
                    }
                    alert(msg);
                },
                complete: function () {
                    if (st == 'completed') {
                        console.log('Done!');
                        console.log("total count: " + totalCount);
                        document.getElementById('<%= Hdn_TotalCount.ClientID%>').value = totalCount;
                        ReturnedTotalCount++;
                        console.log("ReturnedTotalCount: " + ReturnedTotalCount);
                        console.log("Returnedsession: " + Number('<%= Session["NumberOfCentersAndHosts"] %>'));

                        console.log("NumberOfCentersAndHosts: " + Number('<%= Session["NumberOfCentersAndHosts"] %>'));

                        console.log("geneOrRegion: " + variantSearch);
                        if (Number('<%= Session["NumberOfCentersAndHosts"] %>') == ReturnedTotalCount && variantSearch === "Region") {
                            document.getElementById("<%= btn_VariantDis_Region_GoToFilter.ClientID %>").click();
                         /*   console.log("regionnn");*/

                        }
                        else if (Number('<%= Session["NumberOfCentersAndHosts"] %>') == ReturnedTotalCount && variantSearch === "Gene") {
                            document.getElementById("<%= btn_VariantDis_Gene_GoToFilter.ClientID %>").click();
                            /*console.log("geneeee");*/
                        }

                    }

                }
            });
        }

        function Btn_Add_Gene_Clicked(sender, args) {


            var refBuild = $find("<%= DDL_RefBuild.ClientID %>");
            var assay = $find("<%= DDL_Assay.ClientID %>");
            var gene = $find("<%= RC_GeneId.ClientID %>");
            var indx = gene.get_value();
          /*  console.log("refBuild:" + refBuild.get_value().length);*/
            if (refBuild.get_value().length < 1) {
                alert("Please define Refrence build!");
                args.set_cancel(true);
            }
            else if (assay.get_value().length < 1) {
                alert("Please define Sequence Type!");
                args.set_cancel(true);
            }
            else if (indx.length < 1) {
                alert("Please define at least one gene!");
                args.set_cancel(true);
            }
            else {
                totalCount = 0;
                /*console.log("go to onClick_GetReqId()");*/

                onClick_GetReqId("Gene");
            }
        }

        function RC_Gene_DropDownOpening(sender, args) {
            var combo = $find('<%= RC_GeneId.ClientID %>');
            combo.clearSelection();
        }

        function sleepVer2(milliseconds) {
            const date = Date.now();
            let currentDate = null;
            do {
                currentDate = Date.now();
            } while (currentDate - date < milliseconds);
        }

    </script>
</telerik:RadScriptBlock>
