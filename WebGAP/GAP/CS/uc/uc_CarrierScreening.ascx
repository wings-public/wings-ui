<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_CarrierScreening.ascx.cs" Inherits="WebGAP.GAP.CS.uc.uc_CarrierScreening" %>



<style>
    span.RadButton_Bootstrap .rbDecorated {
        height: 20px;
        line-height: 22px;
        padding: 0;
        font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
        font-size: 12px;
        color: #333;
    }

    .lbl_M_bg {
        color: aliceblue;
        font-weight: 500;
        padding-right: 100px;
        background-color: #3BAFDA;
        padding: 1px 10px 1px 10px;
        border-radius: 4px;
    }



    .lbl_F_bg {
        color: white;
        padding-right: 100px;
        background-color: #37BC9B;
        /*#019797*/
        padding: 1px 10px 1px 10px;
        border-radius: 4px;
    }


    .badge {
        color: #FFFFFF;
        font-weight: 500;
        font-size: small;
    }

    .float_right {
        float: right;
    }

    .RadRadioButton.RadButton .rbText, .RadCheckBox.RadButton .rbText {
        position: relative;
        padding: 0 15px 0 0;
        background-image: none;
    }

    span.RadButton_Bootstrap .rbPrimaryIcon {
        left: 8px;
        width: 20px;
        height: 20px;
    }

    .teal.accent-3 {
        color: #1DE9B6 !important;
        font-size: smaller;
        margin-left: 16px;
    }


    button.rbButton.RadButton.HPO {
        position: relative;
        padding: 0;
        margin: 3px;
        background-image: none;
        line-height: 100px;
    }



    button.rbButton.RadButton.HPO {
        margin-bottom: 6px;
    }

    .btnText {
        display: block;
        font-size: small !important;
        height: 14px;
        line-height: 14px;
        position: absolute;
        left: 5px;
        bottom: 5px;
        color: black;
        font-size: 12px;
    }


    .pedigree_text {
        display: block;
        font-size: small !important;
        height: 14px;
        line-height: 14px;
        position: absolute;
        left: 10px;
        bottom: 5px;
        color: black;
        font-size: 12px;
    }

    button.rbButton.RadButton.HPO {
        text-align: center;
        vertical-align: middle;
    }



        button.rbButton.RadButton.HPO img {
            vertical-align: middle;
            margin-top: -46px;
        }
</style>
<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">

    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="Rbtn_HPO_F">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Rbtn_HPO_F" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>

    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="Rbtn_pedigree_F">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Rbtn_pedigree_F" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="Rbtn_pedigree_M">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Rbtn_pedigree_M" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>

    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="Rbtn_HPO_M">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Rbtn_HPO_M" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="Rbtn_Count">
            <UpdatedControls>

                <telerik:AjaxUpdatedControl ControlID="reload" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>

</telerik:RadAjaxManager>

<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="MetroTouch">
</telerik:RadAjaxLoadingPanel>
<div class="content-header row pt-2">
       <table style="width: 100%; background-color: lightgray">

            <tr>
                <td rowspan="2" style="width: 220px">
                    <asp:Label runat="server" ID="lbl_Analysis_Type" Text="Carrier Screening" CssClass="header"> </asp:Label>
                </td>
                <td rowspan="2" style="text-align: left; padding-left: 30px">
                    <%-- <img runat="server" id="img_Precondition">
                    <asp:Label runat="server" ID="lbl_PreCondition" CssClass="pr-1"></asp:Label>--%>
                    <img runat="server" id="img_Female" src="/img/icon/Female_s.png">
                    <asp:Label runat="server" ID="lbl_FemaleID" ForeColor="#333333" Font-Size="Medium" CssClass="pr-1"></asp:Label>

                    <img id="img_Male" src="/img/icon/Male_s.png" runat="server">
                    <asp:Label runat="server" ID="lbl_MaleID" ForeColor="#333333" Font-Size="Medium" CssClass="pr-1"></asp:Label>
                </td>
                <td style="float: right; padding-right: 27px; font-size: unset; color: white; padding: 10px; display: inline-table; background-color: #cc4e4e; /* margin: 6px; *//* margin-top: 6px; */margin-right: 16px;">
                    <asp:Label runat="server" ID="lbl_AnalysisID"></asp:Label>
                </td>
            </tr>

        </table>
</div>
<div class="content-body pt-3">
    <section id="basic-form-layouts">
        <div class="row">
            <div class="col-xl-3 col-md-6 col-sm-12 pr-0">
                <div class="card mr-1 " style="height: 534px">
                    <div class="card-content">
                        <div class="card-body">

                            <div class="media-body text-center border-bottom-blue-grey border-bottom-lighten-5 p-2">
                                <img src="/img/icon/cs_Male.png">
                            </div>

                            <div class="row pt-1 text-center">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 48%; text-align: right">
                                            <asp:Label ID="SampleID" runat="server" Text="Sample" CssClass="lbl_M_bg"> </asp:Label></td>
                                        <td style="width: 2%;"></td>
                                        <td style="width: 50%; text-align: left">
                                            <asp:Label ID="Male_SampleID" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class=" row pt-1">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 48%; text-align: right">
                                            <asp:Label ID="Label1" runat="server" Text="Individual" CssClass="lbl_M_bg"> </asp:Label></td>
                                        <td style="width: 2%;"></td>
                                        <td style="width: 50%; text-align: left">
                                            <asp:Label ID="Male_IndividualID" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                            </div>
                            <div class=" row media-body text-center border-bottom-blue-grey border-bottom-lighten-5 pt-1 pb-1">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 48%; text-align: right">
                                            <asp:Label ID="Label2" runat="server" Text="Family" CssClass="lbl_M_bg"> </asp:Label></td>
                                        <td style="width: 2%;"></td>
                                        <td style="width: 50%; text-align: left">
                                            <asp:Label ID="Male_FamilyID" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="row pt-1">

                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 48%; text-align: right">
                                            <asp:Label ID="Label3" runat="server" Text="Name" CssClass="lbl_M_bg"> </asp:Label></td>
                                        <td style="width: 2%;"></td>
                                        <td style="width: 50%; text-align: left">
                                            <asp:Label ID="Male_Name" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="row pt-1  ">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 48%; text-align: right">
                                            <asp:Label ID="Label4" runat="server" Text="Age" CssClass="lbl_M_bg"> </asp:Label></td>
                                        <td style="width: 2%;"></td>
                                        <td style="width: 50%; text-align: left">
                                            <asp:Label ID="Male_age" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="row pt-3">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right">
                                            <telerik:RadButton RenderMode="Lightweight" runat="server" Image-HoveredImageUrl="/img/icon/icon_HPO_nohover.png" ID="Rbtn_pedigree_M" Width="70px" Height="70px" CssClass="HPO" OnClientClicked="OpenPedigree_M"
                                                Skin="Default">
                                                <ContentTemplate>
                                                    <img alt="cog" src="/img/icon/icon_pedigree.png" width="30" height="30" />
                                                    <span class="pedigree_text">Pedigree</span>
                                                </ContentTemplate>
                                            </telerik:RadButton>
                                          

                                            <td style="width: 50%; text-align: left">

                                                <telerik:RadButton RenderMode="Lightweight" runat="server" Image-HoveredImageUrl="/img/icon/icon_HPO_nohover.png" ID="Rbtn_HPO_M" Width="70px" Height="70px" CssClass="HPO " OnClick="Rbtn_HPO_M_Click"
                                                    Skin="Default">
                                                    <ContentTemplate>
                                                        <img alt="cog" src="/img/icon/icon_HPO.png" width="30" height="30" />
                                                        <span class="btnText">Phenotype</span>
                                                    </ContentTemplate>
                                                </telerik:RadButton>
                                            </td>
                                    </tr>

                                </table>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 col-sm-12 pl-0">
                <div class="card" runat="server" style="height: 534px">

                    <div class="card-content">
                        <div class="card-body">

                            <div class="media-body text-center border-bottom-blue-grey border-bottom-lighten-5 p-2">
                                <img src="/img/icon/cs_Female.png">
                            </div>

                            <div class="row pt-1 text-center">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 48%; text-align: right">
                                            <asp:Label ID="Label5" runat="server" Text="Sample" CssClass="lbl_F_bg"> </asp:Label></td>
                                        <td style="width: 2%;"></td>
                                        <td style="width: 50%; text-align: left">
                                            <asp:Label ID="Female_SampleID" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class=" row pt-1">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 48%; text-align: right">
                                            <asp:Label ID="Label7" runat="server" Text="Individual" CssClass="lbl_F_bg"> </asp:Label></td>
                                        <td style="width: 2%;"></td>
                                        <td style="width: 50%; text-align: left">
                                            <asp:Label ID="Female_IndividualID" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                            </div>
                            <div class="row pt-1 pb-1 border-bottom-blue-grey border-bottom-lighten-5">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 48%; text-align: right">
                                            <asp:Label ID="Label9" runat="server" Text="Family" CssClass="lbl_F_bg"> </asp:Label></td>
                                        <td style="width: 2%;"></td>
                                        <td style="width: 50%; text-align: left">
                                            <asp:Label ID="Female_FamilyID" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                            </div>

                            <div class="row pt-1">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right">
                                            <asp:Label ID="Label11" runat="server" Text="Name" CssClass="lbl_F_bg"> </asp:Label></td>
                                        <td style="width: 50%; text-align: left">
                                            <asp:Label ID="Female_Name" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="row pt-1  ">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 48%; text-align: right">
                                            <asp:Label ID="Label13" runat="server" Text="Age" CssClass="lbl_F_bg"> </asp:Label></td>
                                        <td style="width: 2%;"></td>
                                        <td style="width: 50%; text-align: left">
                                            <asp:Label ID="Female_age" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="row pt-3">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right">
                                            <telerik:RadButton RenderMode="Lightweight" AutoPostBack="false" runat="server" OnClientClicked="OpenPedigree_F" Image-HoveredImageUrl="/img/icon/icon_HPO_nohover.png" ID="Rbtn_pedigree_F" Width="70px" Height="70px" CssClass="HPO"
                                                Skin="Default">
                                                <ContentTemplate>
                                                    <img alt="cog" src="/img/icon/icon_pedigree.png" width="30" height="30" />
                                                    <span class="pedigree_text">Pedigree</span>
                                                </ContentTemplate>
                                            </telerik:RadButton>

                                            <td style="width: 50%; text-align: left">
                                                <telerik:RadButton RenderMode="Lightweight" runat="server" Image-HoveredImageUrl="/img/icon/icon_HPO_nohover.png" ID="Rbtn_HPO_F" Width="70px" Height="70px" CssClass="HPO" OnClick="Rbtn_HPO_F_Click"
                                                    Skin="Default">
                                                    <ContentTemplate>
                                                        <img alt="cog" src="/img/icon/icon_HPO.png" width="30" height="30" />
                                                        <span class="btnText">Phenotype</span>
                                                    </ContentTemplate>
                                                </telerik:RadButton>
                                            </td>
                                    </tr>
                                </table>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-xl-6 col-md-6 col-sm-12">
                <div class="card" style="height: 534px">

                    <div class="card-content" id="reload" runat="server">
                        <div class="card-header pb-0 pt-0">
                            <table style="width: 100%;">
                                <tr>
                                    <td style="width: 90%; text-align: right">
                                        <h4 class="card-title ">Result</h4>
                                    </td>
                                    <td style="width: 10%; text-align: right">
                                        <img src="/img/icon/icons8-alpha-flag-50.png"  height="22" width="22">
                                    </td>
                                </tr>

                            </table>
                        </div>
                        <div class="card-body pt-0 ">
                            <div class="row my-1">
                                <div class="col align-self-start p-1 ">

                                    <table style="width: 100%; background-color: azure; border-bottom: 1px solid gray; height: 50px">
                                        <tr>
                                            <td style="width: 80%; text-align: left">
                                        <%--        <telerik:RadRadioButtonList Skin="Silk" runat="server" ID="Count_Type" AutoPostBack="true" Direction="Horizontal">
                                                    <Items>
                                                        <telerik:ButtonListItem Text="All" Value="0" />
                                                        <telerik:ButtonListItem Text="SNP" Value="1" />
                                                        <telerik:ButtonListItem Text="Deletion" Value="2" />
                                                        <telerik:ButtonListItem Text="Insertion" Value="3" />
                                                    </Items>
                                                </telerik:RadRadioButtonList>--%>
                                            </td>
                                            <td style="width: 20%; text-align: left">
                                                <telerik:RadButton ID="Rbtn_Count" runat="server" OnClick="Rbtn_Count_Click" Height="20" Text="Analyze" Icon-PrimaryIconUrl="~/img/icon/Analyze.png" Icon-PrimaryHoveredIconUrl="~/img/icon/Analyze_hover.png"></telerik:RadButton>
                                            </td>
                                        </tr>

                                    </table>


                                </div>
                            </div>
                            <div class="row my-1">
                                <div class="col align-self-start p-1 border-bottom-blue-grey border-bottom-lighten-5">
                                    <div class="text-center">
                                        <ul class="list-inline clearfix mb-0 mr-0">
                                            <li class="border-right-grey border-right-lighten-2 pr-1 ">

                                                <h3 class="success text-bold-400">
                                                    <asp:Label ID="All_Male" runat="server" Text="---"></asp:Label>
                                                </h3>

                                                <div class="media-body">
                                                    <span class="font-small-3 grey darken-1 pr-1">
                                                        <img src="/img/icon/cs_Yes_Male.png">
                                                    </span>
                                                    <telerik:RadButton ID="Rbtn_AllMale"  runat="server" OnClick="Rbtn_AllMale_Click1" Text="View" Icon-PrimaryIconUrl="~/img/icon/icon_quality_s.png" Visible="false"></telerik:RadButton>
                                                </div>
                                            
                                            </li>
                                            <li class="pl-2">
                                                <h3 class="success text-bold-400">
                                                    <asp:Label ID="All_Female" runat="server" Text="---"></asp:Label>
                                                </h3>

                                                <div class="media-body">
                                                    <span class="font-small-3 grey darken-1 pr-1">
                                                        <img src="/img/icon/cs_Yes_Female.png">
                                                    </span>
                                                    <telerik:RadButton ID="Rbtn_AllFemale" runat="server" OnClick="Rbtn_AllFemale_Click" Text="View" Icon-PrimaryIconUrl="~/img/icon/icon_quality_s.png" Visible="false"></telerik:RadButton>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>


                                </div>
                            </div>
                            <div class="row my-1">
                                <div class="col align-self-center border-bottom-blue-grey border-bottom-lighten-5">
                                    <div class="text-center">
                                        <ul class="list-inline clearfix mb-1 mr-0">
                                            <li>
                                                <h3 class="success text-bold-400">
                                                    <asp:Label ID="IN_Male_IN_Female" runat="server" Text="---"></asp:Label>
                                                </h3>
                                                <div class="media-body">
                                                    <span class="font-small-3 grey darken-1 pr-1">
                                                        <img src="/img/icon/cs_Yes_Male.png">
                                                        <img src="/img/icon/cs_Yes_Female.png">
                                                    </span>

                                                </div>
                                            </li>
                                            <li>
                                                <telerik:RadButton ID="Rbtn_INMale_INFemale" class="teal accent-3" runat="server" Text="View" Icon-PrimaryIconUrl="~/img/icon/icon_quality_s.png" OnClick="Rbtn_INMale_INFemale_Click" Visible="false"></telerik:RadButton>

                                            </li>
                                        </ul>

                                    </div>

                                </div>
                            </div>
                            <div class="row my-1">
                                <div class="col align-self-center  border-bottom-blue-grey border-bottom-lighten-5">
                                    <div class="text-center">
                                        <ul class="list-inline clearfix mb-1 mr-0">
                                            <li>
                                                <h3 class="success text-bold-400">
                                                    <asp:Label ID="In_Female_Not_Male" runat="server" Text="---"></asp:Label>
                                                </h3>
                                                <div class="media-body">
                                                    <span class="font-small-3 grey darken-1 pr-1">
                                                       <img src="/img/icon/cs_No_Male.png"> <img src="/img/icon/cs_Yes_Female.png">
                                                    </span>
                                                </div>
                                            </li>
                                            <li>
                                                <telerik:RadButton ID="Rbtn_InFemale_NotMale" class="teal accent-3" runat="server" Text="View" Icon-PrimaryIconUrl="~/img/icon/icon_quality_S.png" OnClick="Rbtn_InFemale_NotMale_Click" Visible="false" />

                                            </li>
                                        </ul>

                                    </div>
                                </div>
                            </div>
                            <div class="row my-1">
                                <div class="col align-self-center  p-1">
                                    <div class="text-center">
                                        <ul class="list-inline clearfix mb-1 mr-0">
                                            <li>
                                                <h3 class="success text-bold-400">
                                                    <asp:Label ID="In_Male_Not_Female" runat="server" Text="---"></asp:Label>
                                                </h3>
                                                <div class="media-body">
                                                    <span class="font-small-3 grey darken-1 pr-1">
                                                        <img src="/img/icon/cs_Yes_Male.png"><img src="/img/icon/cs_No_Female.png">
                                                    </span>
                                                </div>
                                            </li>
                                            <li>
                                                <telerik:RadButton ID="Rbtn_InMale_NotFemale" class="teal accent-3" runat="server" Text="View" Icon-PrimaryIconUrl="~/img/icon/icon_quality_s.png" OnClick="Rbtn_InMale_NotFemale_Click" Visible="false" />

                                            </li>
                                        </ul>

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





<telerik:RadWindowManager ID="RadWindowManager2" ShowContentDuringLoad="true" RenderMode="Lightweight"
    ReloadOnShow="true" runat="server" EnableShadow="true"
    Skin="Windows7" AutoSize="false" Modal="true" VisibleStatusbar="false" VisibleTitlebar="false">
    <Windows>
        <telerik:RadWindow ID="RadWindow2" runat="server" RenderMode="Lightweight" BorderStyle="None" BorderWidth="1px" CssClass="RadWindow_Media px-0 pb-0" Modal="true" CenterIfModal="true">
        </telerik:RadWindow>
        <telerik:RadWindow ID="RadWindow1" runat="server" RenderMode="Lightweight" BorderStyle="None" BorderWidth="1px" CssClass="px-0 pb-0" Modal="true" CenterIfModal="true">
        </telerik:RadWindow>
    </Windows>
</telerik:RadWindowManager>



<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

    <script>  

        function OpenPedigree_M() {
            var oWnd = radopen("/PhenBook/DrawPedigree.aspx", "RadWindow1");
            oWnd.set_height(770);
            oWnd.set_width(800);
            oWnd.center();
            oWnd.set_modal(true);
        }
        function OpenPedigree_F() {
            var oWnd = radopen("/PhenBook/DrawPedigree.aspx", "RadWindow1");
            oWnd.set_height(770);
            oWnd.set_width(800);
            oWnd.center();
            oWnd.set_modal(true);
        }

        function Open_HPO() {
            var oWndw = radopen("/GAP/HPO_SampleDiscovery.aspx", "RadWindow2");
          
        }
    </script>
</telerik:RadCodeBlock>
