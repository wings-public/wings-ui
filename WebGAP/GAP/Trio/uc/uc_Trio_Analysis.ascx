<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Trio_Analysis.ascx.cs" Inherits="WebGAP.GAP.Trio.uc.uc_Trio_Analysis" %>



<style>
    .Rbt_padding {
        padding-bottom: 10px !important;
    }

    #RG_Result {
        border-width: 0 0 0 0 !important;
        padding: 0px
    }

    span.RadButton_Bootstrap .rbDecorated {
        height: 20px;
        line-height: 22px;
        padding: 0;
        font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
        font-size: 12px color: #333;
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

    .RadGrid_Bootstrap .rgRow > td, .RadGrid_Bootstrap .rgAltRow > td {
        border-width: 0 0 0 0 !important;
        padding: 0px 0px 0 0px !important;
    }

    .RG_NO_Shadow {
        -webkit-box-shadow: none;
        -moz-box-shadow: none;
        box-shadow: none !important;
    }
</style>
<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">

    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="Rbtn_HPO_P">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Rbtn_HPO_P" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>

    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_Result">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_Result" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="Rbtn_pedigree_P">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Rbtn_pedigree_P" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
 

    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="Rbtn_HPO_C1">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Rbtn_HPO_C1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="Rbtn_HPO_C2">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Rbtn_HPO_C2" />
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
                <asp:Label runat="server" ID="lbl_Analysis_Type" Text="Trio Analysis" CssClass="header"> </asp:Label>
            </td>
            <td rowspan="2" style="text-align: left; padding-left: 30px">
                <img runat="server" id="img_Proband">
                <asp:Label runat="server" ID="lbl_Proband" ForeColor="#333333" Font-Size="Medium" CssClass="pr-1"></asp:Label>
                <img runat="server" id="img_Control1">
                <asp:Label runat="server" ID="lbl_Control1" ForeColor="#333333" Font-Size="Medium" CssClass="pr-1"></asp:Label>
                <img id="img_Control2" runat="server">
                <asp:Label runat="server" ID="lbl_Control2" ForeColor="#333333" Font-Size="Medium" CssClass="pr-1"></asp:Label>
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
            <div class="col-xl-3 col-md-6 col-sm-12 pr-0 pl-0">
                <div class="card mr-1 " style="height: 460px">
                    <div class="card-content">
                        <div class="card-body">
                            <div class="media-body text-center border-bottom-blue-grey border-bottom-lighten-5 p-0">
                                <img id="img_Header_P" runat="server" width="50">
                                <p>Proband </p>
                            </div>
                            <div class="row pt-1 text-center">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 48%; text-align: right">
                                            <asp:Label ID="lbl" runat="server" Text="Sample" CssClass="lbl_M_bg"> </asp:Label></td>
                                        <td style="width: 2%;"></td>
                                        <td style="width: 50%; text-align: left">
                                            <asp:Label ID="Proband_SampleID" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="row pt-1">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 48%; text-align: right">
                                            <asp:Label ID="Label10" runat="server" Text="Individual" CssClass="lbl_M_bg"> </asp:Label></td>
                                        <td style="width: 2%;"></td>
                                        <td style="width: 50%; text-align: left">
                                            <asp:Label ID="Proband_IndividualID" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                            </div>
                            <div class=" row media-body text-center border-bottom-blue-grey border-bottom-lighten-5 pt-1 pb-1">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 48%; text-align: right">
                                            <asp:Label ID="Label14" runat="server" Text="Family" CssClass="lbl_M_bg"> </asp:Label></td>
                                        <td style="width: 2%;"></td>
                                        <td style="width: 50%; text-align: left">
                                            <asp:Label ID="Proband_FamilyID" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="row pt-1">

                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 48%; text-align: right">
                                            <asp:Label ID="Label16" runat="server" Text="Name" CssClass="lbl_M_bg"> </asp:Label></td>
                                        <td style="width: 2%;"></td>
                                        <td style="width: 50%; text-align: left">
                                            <asp:Label ID="Proband_Name" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="row pt-1  ">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 48%; text-align: right">
                                            <asp:Label ID="Label18" runat="server" Text="Age" CssClass="lbl_M_bg"> </asp:Label></td>
                                        <td style="width: 2%;"></td>
                                        <td style="width: 50%; text-align: left">
                                            <asp:Label ID="Proband_age" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="row pt-1">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right">
                                            <telerik:RadButton RenderMode="Lightweight" runat="server" Image-HoveredImageUrl="/img/icon/icon_HPO_nohover.png" ID="Rbtn_pedigree_P" Width="50px" Height="50px" CssClass="HPO" OnClientClicked="OpenPedigree_P"
                                                Skin="Default" ToolTip="Pedigree">
                                                <ContentTemplate>
                                                    <img alt="cog" src="/img/icon/icon_pedigree.png" width="20" height="20" />
                                                </ContentTemplate>
                                            </telerik:RadButton>
                                            <td style="width: 50%; text-align: left">
                                                <telerik:RadButton RenderMode="Lightweight" runat="server" Image-HoveredImageUrl="/img/icon/icon_HPO_nohover.png" ID="Rbtn_HPO_P" Width="50px" Height="50px" CssClass="HPO " OnClick="Rbtn_HPO_P_Click"
                                                    Skin="Default" ToolTip="Phenotype">
                                                    <ContentTemplate>
                                                        <img alt="cog" src="/img/icon/icon_HPO.png" width="20" height="20" />
                                                    </ContentTemplate>
                                                </telerik:RadButton>
                                            </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="row border-top-blue-grey border-top-lighten-5 pt-1">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right; padding-right: 5px">
                                            <asp:Label ID="lbl_InProband" runat="server"></asp:Label>

                                        </td>
                                        <td style="width: 50%; text-align: left">
                                            <telerik:RadButton ID="Rbtn_AllProband" runat="server" OnClick="Rbtn_AllProband_Click" Text="View" Icon-PrimaryIconUrl="~/img/icon/icon_quality_s.png"></telerik:RadButton>

                                        </td>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 col-sm-12 pr-0 pl-0">
                <div class="card mr-1 " style="height: 460px">
                    <div class="card-content">
                        <div class="card-body">

                            <div class="media-body text-center border-bottom-blue-grey border-bottom-lighten-5 p-0">
                                <img runat="server" id="img_Header_C1" width="50">
                                <p>Father</p>
                            </div>

                            <div class="row pt-1 text-center">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 48%; text-align: right">
                                            <asp:Label ID="SampleID" runat="server" Text="Sample" CssClass="lbl_M_bg"> </asp:Label></td>
                                        <td style="width: 2%;"></td>
                                        <td style="width: 50%; text-align: left">
                                            <asp:Label ID="Control1_SampleID" runat="server"></asp:Label>
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
                                            <asp:Label ID="Control1_IndividualID" runat="server"></asp:Label>
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
                                            <asp:Label ID="Control1_FamilyID" runat="server"></asp:Label>
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
                                            <asp:Label ID="Control1_Name" runat="server"></asp:Label>
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
                                            <asp:Label ID="Control1_age" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="row pt-1">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right">
                                          
                                            <td style="width: 50%; text-align: left">
                                                <telerik:RadButton RenderMode="Lightweight" runat="server" Image-HoveredImageUrl="/img/icon/icon_HPO_nohover.png" ID="Rbtn_HPO_C1" Width="50px" Height="50px" CssClass="HPO " OnClick="Rbtn_HPO_C1_Click"
                                                    Skin="Default" ToolTip="Phenotype">
                                                    <ContentTemplate>
                                                        <img alt="cog" src="/img/icon/icon_HPO.png" width="20" height="20" />
                                                    </ContentTemplate>
                                                </telerik:RadButton>
                                            </td>
                                    </tr>

                                </table>

                            </div>
                            <div class="row border-top-blue-grey border-top-lighten-5 pt-1">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right; padding-right: 5px">
                                            <asp:Label ID="lbl_AllControl1" runat="server"></asp:Label>
                                        </td>
                                        <td style="width: 50%; text-align: left">
                                            <telerik:RadButton ID="Rbtn_AllControl1" runat="server" OnClick="Rbtn_AllControl1_Click" Text="View" Icon-PrimaryIconUrl="~/img/icon/icon_quality_s.png"></telerik:RadButton>

                                        </td>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 col-sm-12 pl-0">
                <div class="card" runat="server" style="height: 460px">

                    <div class="card-content">
                        <div class="card-body">
                            <div class="media-body text-center border-bottom-blue-grey border-bottom-lighten-5 p-0">
                                <img runat="server" id="img_Header_C2" width="50">
                                <p>Mother</p>
                            </div>
                            <div class="row pt-1 text-center">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 48%; text-align: right">
                                            <asp:Label ID="Label5" runat="server" Text="Sample" CssClass="lbl_F_bg"> </asp:Label></td>
                                        <td style="width: 2%;"></td>
                                        <td style="width: 50%; text-align: left">
                                            <asp:Label ID="Control2_SampleID" runat="server"></asp:Label>
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
                                            <asp:Label ID="Control2_IndividualID" runat="server"></asp:Label>
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
                                            <asp:Label ID="Control2_FamilyID" runat="server"></asp:Label>
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
                                            <asp:Label ID="Control2_Name" runat="server"></asp:Label>
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
                                            <asp:Label ID="Control2_age" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="row pt-1">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right">
                                         

                                            <td style="width: 50%; text-align: left">
                                                <telerik:RadButton RenderMode="Lightweight" runat="server" Image-HoveredImageUrl="/img/icon/icon_HPO_nohover.png" ID="Rbtn_HPO_C2" Width="50px" Height="50px" CssClass="HPO" OnClick="Rbtn_HPO_C2_Click"
                                                    Skin="Default" ToolTip="Phenotype">
                                                    <ContentTemplate>
                                                        <img alt="cog" src="/img/icon/icon_HPO.png" width="20" height="20" />
                                                    </ContentTemplate>
                                                </telerik:RadButton>
                                            </td>
                                    </tr>
                                </table>

                            </div>
                            <div class="row border-top-blue-grey border-top-lighten-5 pt-1 ">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right; padding-right: 5px">
                                            <asp:Label ID="lbl_AllControl2" runat="server"></asp:Label>
                                        </td>
                                        <td style="width: 50%; text-align: left">
                                            <telerik:RadButton ID="btn_AllControl2" runat="server" OnClick="Rbtn_AllControl2_Click" Text="View" Icon-PrimaryIconUrl="~/img/icon/icon_quality_s.png"></telerik:RadButton>

                                        </td>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-xl-3 col-md-6 col-sm-12 pl-0 pr-0">
                <telerik:RadGrid RenderMode="Lightweight" ID="RG_Result" runat="server" GridLines="Both" DataSourceID="DS_Result" AllowSorting="True" OnItemCommand="RG_Result_ItemCommand"
                    AutoGenerateColumns="False" CellSpacing="-1" Height="460px" OnItemDataBound="RG_Result_ItemDataBound" CssClass="RG_NO_Shadow" DataKeyNames="InWhichOneExists">

                    <MasterTableView Name="Master" AutoGenerateColumns="false" DataSourceID="DS_Result" NoMasterRecordsText="No records to display." DataKeyNames="InWhichOneExists">
                        <Columns>
                            <telerik:GridTemplateColumn DataField="InWhichOneExists" HeaderText="Proband" >
                                <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:ImageButton ID="Probandbtn" BorderWidth="0px" Width="20px" runat="server"></asp:ImageButton>
                                    <asp:HiddenField runat="server" ID="hdn_Count" Value='<%# Bind("Count") %>' />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn  HeaderText="C 1">
                                <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:ImageButton ID="Control_1btn" BorderWidth="0px" Width="20px" runat="server"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn  HeaderText="C 2" >
                                <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:ImageButton ID="Control_2btn" BorderWidth="0px" Width="20px" runat="server"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn UniqueName="Count" HeaderText="# of Mutation" DataField="Count"
                                FilterControlAltText="Filter Count column" SortExpression="Count" DataType="System.Int64" ReadOnly="True" ShowFilterIcon="false">
                                <HeaderStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn>
                                <HeaderStyle Width="40%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle Width="40%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <%-- <asp:ImageButton ID="GoToFilter" BorderWidth="0px" ImageUrl="~/img/icon/icon_quality_s.png" Width="30px" Height="30px" CommandName="GoToFilter"
                                        runat="server" ToolTip="Go To Detail"></asp:ImageButton>--%>

                                    <telerik:RadButton ID="GoToFilter" runat="server" CommandName="GoToFilter" Text="View" Icon-PrimaryIconUrl="~/img/icon/icon_quality_s.png"
                                        Width="100px" Height="15px" ToolTip="Go To Detail" CssClass="Rbt_padding">
                                    </telerik:RadButton>

                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                    <ClientSettings EnableRowHoverStyle="true">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                    </ClientSettings>
                    <FilterMenu RenderMode="Lightweight"></FilterMenu>
                    <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                </telerik:RadGrid>
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
<asp:SqlDataSource ID="DS_Result" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommandType="StoredProcedure" SelectCommand="Sp_GAP_Trio_Count">
    <SelectParameters>
        <asp:SessionParameter Name="TriolocalID" SessionField="TriolocalID" Type="String" />
        <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
        <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
         <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>

</asp:SqlDataSource>


<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

    <script>  


             function OpenPedigree_P() {
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
