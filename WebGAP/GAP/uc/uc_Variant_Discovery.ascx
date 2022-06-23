<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Variant_Discovery.ascx.cs" Inherits="WebGAP.GAP.uc.uc_Variant_Discovery" %>


<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="DDL_GenomeBuild">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_GenomeBuild" />
                <telerik:AjaxUpdatedControl ControlID="pnl_population" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="CB_Population_Chromosome" />
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="Btn_Add_TrainingGene_ChrCoordinates">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Btn_Add_TrainingGene_ChrCoordinates" />

                <telerik:AjaxUpdatedControl ControlID="RLB_Population_Coordinates" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>

    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>



<div class="content-header row pt-2">
    <table style="width: 100%; background-color: lightgray">
        <tr>
            <td rowspan="2" style="width: 220px">
                <h4 style="margin-bottom: 1px; color: white; text-shadow: 1px 1px 1px #444;">
                    <asp:Label runat="server" ID="Variant" Text="Variant Discovery" CssClass="header"> </asp:Label></h4>
            </td>

            <td style="float: right; padding-right: 27px; font-size: unset; color: white; padding: 10px; display: inline-table; background-color: #5e98c4; /* margin: 6px; *//* margin-top: 6px; */margin-right: 16px;">
                <asp:Label runat="server" ID="lbl_CenterPI">  </asp:Label>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <div class="content-header-right col-md-6 col-12">
        <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
            <div class="btn-group" role="group">
                <asp:DropDownList ID="DDL_GenomeBuild" runat="server" Width="150px" DataTextField="ReferenceBuildName" DataValueField="ReferenceBuildID"
                    AppendDataBoundItems="True" AutoPostBack="true" DataSourceID="SDS_ReferenceBuild"
                    class="btn btn-outline-info dropdown-toggle dropdown-menu-right mr-1 btn-sm">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SDS_ReferenceBuild" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand=" Select * from [WiNGS_BaseInfo_Db].[dbo].Tbl_ReferenceBuild where status = 1 "></asp:SqlDataSource>
            </div>
        </div>
    </div>
            </td>
        </tr>

    </table>
</div>



<%--<div class="content-header row">
    <div class="content-header-left col-md-6 col-12">
        <h3 class="content-header-title">
            <asp:PlaceHolder runat="server"><%: Page.Title %> </asp:PlaceHolder>
        </h3>
    </div>
    <div class="content-header-right col-md-6 col-12">
        <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
            <div class="btn-group" role="group">
                <asp:DropDownList ID="DDL_GenomeBuild" runat="server" Width="150px" DataTextField="ReferenceBuildName" DataValueField="ReferenceBuildID"
                    AppendDataBoundItems="True" AutoPostBack="true" DataSourceID="SDS_ReferenceBuild"
                    class="btn btn-outline-info dropdown-toggle dropdown-menu-right mr-1 btn-sm">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SDS_ReferenceBuild" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand=" Select * from [WiNGS_BaseInfo_Db].[dbo].Tbl_ReferenceBuild where status = 1 "></asp:SqlDataSource>
            </div>
        </div>
    </div>
</div>--%>



<div class="content-body pt-1">
    <section id="basic-form-layouts">
        <div class="row match-height">
            <div class="col-12">
                <%--<telerik:RadTabStrip ID="RadTabStrip1" SelectedIndex="0" runat="server" MultiPageID="RadMultiPage1"
                    Align="Justify" Skin="Silk" CssClass="tabStrip topTab" CausesValidation="False" ResolvedRenderMode="Classic">
                    <Tabs>
                        <telerik:RadTab Text="Population" Enabled="true" SelectedImageUrl="../../img/icon/population_active_icon.png"
                            ImageUrl="../../img/icon/population_normal_icon.png" Selected="True">
                        </telerik:RadTab>
                        <telerik:RadTab Text="Sample based" Enabled="true" SelectedImageUrl="../../img/icon/Samplebased_active_icon.png"
                            ImageUrl="../../img/icon/Samplebased_normal_icon.png">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>--%>

                <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" CssClass="multiPage"
                    Width="100%">
                    <telerik:RadPageView ID="RadPageView1" runat="server">
                        <div class="row col-12 pt-1">
                            <telerik:RadTabStrip runat="server" ID="RTS_Population" SelectedIndex="0" Align="Justify" MultiPageID="RMP_Population">
                                <Tabs>
                                    <telerik:RadTab Text="Chromosome regions" Selected="True">
                                    </telerik:RadTab>
                                    <telerik:RadTab Text="Gene">
                                    </telerik:RadTab>
                                    <%--<telerik:RadTab Text="Gene Ontology">
                                    </telerik:RadTab>
                                    <telerik:RadTab Text="Gene Panel">
                                    </telerik:RadTab>

                                    <telerik:RadTab Text="OMIM">
                                    </telerik:RadTab>
                                    <telerik:RadTab Text="List">
                                    </telerik:RadTab>--%>
                                </Tabs>
                            </telerik:RadTabStrip>
                            <telerik:RadMultiPage runat="server" ID="RMP_Population" SelectedIndex="0" Width="100%"
                                CssClass="multiPage">
                                <telerik:RadPageView runat="server" ID="RPW_P1" CssClass="corporatePageView">

                                    <asp:Panel ID="pnl_population" runat="server">


                                        <table>
                                            <tr>
                                                <td>
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Panel ID="Pnl_population_Chr" runat="server">
                                                        <table>
                                                            <tr>

                                                                <td>

                                                                    <telerik:RadComboBox ID="CB_Population_Chromosome" runat="server" Skin="MetroTouch" Label="Choose chromosome:" DataSourceID="SDS_Population_Chromosome"
                                                                        Width="60px" Height="200px" AutoPostBack="true" DataTextField="chromosome" DataValueField="length"
                                                                        EnableVirtualScrolling="true"
                                                                        Enabled="true">
                                                                    </telerik:RadComboBox>

                                                                    <asp:SqlDataSource ID="SDS_Population_Chromosome" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="SELECT [chromosome], [length] FROM [Tbl_GAP_Chromosome] WHERE ([ReferenceBuildID] = @ReferenceBuildID) ORDER BY [chrorder]">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDL_GenomeBuild" Name="ReferenceBuildID" PropertyName="SelectedValue" Type="Int32" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </td>
                                                                <td style="width: 10px; text-align: center">
                                                                    <i class="fa fa-ellipsis-v"></i>
                                                                </td>
                                                                <td>

                                                                    <table>
                                                                        <tr>
                                                                            <td>
                                                                                <telerik:RadNumericTextBox ID="Txt_Population_SPos" runat="server" Label="Start position:" Style="top: 0px; left: 0px; margin-bottom: 5px;"
                                                                                    Enabled="true" DataType="System.Int64" Width="250px" LabelWidth="100px" Skin="MetroTouch">
                                                                                    <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                                                                    <ClientEvents OnValueChanged="Txt_Population_SPos_KeyPress" />
                                                                                </telerik:RadNumericTextBox>
                                                                            </td>
                                                                            <td style="width: 10px; text-align: center"></td>
                                                                            <td>
                                                                                <telerik:RadNumericTextBox ID="Txt_Population_EPos" runat="server" Label="End position:" Style="top: 0px; left: 10px; margin-bottom: 5px;"
                                                                                    Enabled="true" DataType="System.Int64" Width="250px" LabelWidth="100px" Skin="MetroTouch">
                                                                                    <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                                                                    <ClientEvents OnValueChanged="Txt_Population_EPos_KeyPress" OnValueChanging="Txt_Population_EPos_KeyPress" />
                                                                                </telerik:RadNumericTextBox>
                                                                            </td>
                                                                        </tr>
                                                                    </table>


                                                                </td>
                                                                <td style="width: 10px; text-align: center">
                                                                    <i class="fa fa-ellipsis-v"></i>
                                                                </td>


                                                               <%-- <td style="text-align: right">
                                                                    <telerik:RadButton ID="Btn_Add_TrainingGene_ChrCoordinates" runat="server" Text="Add" Style="top: 0px; left: 10px; margin-bottom: 5px;"
                                                                        AutoPostBack="true" Width="100px" CssClass="btn btn-outline-info btn-min-width"
                                                                        OnClientClicked="Btn_Add_Population_ChrCoordinates_Clicked" OnClick="Btn_Add_TrainingGene_ChrCoordinates_Click">
                                                                        <Icon PrimaryIconCssClass="rbAdd" PrimaryIconLeft="20"></Icon>
                                                                    </telerik:RadButton>
                                                                </td>--%>

                                                            </tr>
                                                        </table>
                                                    </asp:Panel>

                                                </td>
                                            </tr>
                                        </table>

                                    </asp:Panel>


                                </telerik:RadPageView>
                                <telerik:RadPageView runat="server" ID="RPW_P2" CssClass="corporatePageView">
                                </telerik:RadPageView>
                                <%--<telerik:RadPageView runat="server" ID="RPW_P3" CssClass="corporatePageView">
                                </telerik:RadPageView>
                                <telerik:RadPageView runat="server" ID="RPW_P4" CssClass="corporatePageView">
                                </telerik:RadPageView>
                                <telerik:RadPageView runat="server" ID="RPW_P5" CssClass="corporatePageView">
                                </telerik:RadPageView>
                                <telerik:RadPageView runat="server" ID="RadPageView3" CssClass="corporatePageView">
                                </telerik:RadPageView>--%>
                            </telerik:RadMultiPage>
                        </div>
                         <%--<div class="row col-12 pt-1">
                            <telerik:RadListBox ID="RLB_Population_Coordinates" runat="server" CheckBoxes="false" ShowCheckAll="false"
                                Width="100%" Height="300px" EmptyMessage="No items added" ViewStateMode="Enabled" SelectionMode="Multiple">
                                <HeaderTemplate>
                                    <table style="width: 100%">
                                        <tr>
                                            <td style="width: 10%; text-align: left">Chromosome
                                            </td>
                                            <td style="width: 10%; text-align: left">Start position
                                            </td>
                                            <td style="width: 10%; text-align: left">End position
                                            </td>
                                            <td style="width: 70%; text-align: right">
                                                <div class="btn-group" role="group" aria-label="Basic example">
                                                    <button type="button" class="btn btn-icon btn-danger btn-sm" title="Clear All Items"  onclick="Clear_Population_List()"><i class="fa fa-refresh"></i></button>
                                                    <button type="button" class="btn btn-icon btn-warning btn-sm" title="Remove selected item" onclick="RemoveItem_Population_list()"><i class="fa fa-times"></i></button>
                                                </div>
                                                  <telerik:RadButton ID="Btn_Population_Coordinates_Empty" runat="server" Skin="Vista" Text="Clear" AutoPostBack="false"
                                                    OnClientClicked="Clear_Population_List">
                                                    <Icon PrimaryIconCssClass="rbRefresh" PrimaryIconLeft="4" PrimaryIconTop="3"></Icon>
                                                </telerik:RadButton>
                                                <telerik:RadButton ID="Btn_Population_Coordinates_DelItem" runat="server" Skin="Vista" Text="Remove selected item"
                                                    AutoPostBack="false" OnClientClicked="RemoveItem_Population_list">
                                                    <Icon PrimaryIconCssClass="rbRemove" PrimaryIconLeft="4" PrimaryIconTop="3"></Icon>
                                                </telerik:RadButton>





                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                            </telerik:RadListBox>
                        </div>
                       <div class="row col-12 pt-1">
                            <div class="col-12">
                                <div class="form-group">
                                    <asp:TextBox ID="txt_RequestDesc" runat="server" class="form-control" placeholder="Query Description"></asp:TextBox>
                                </div>
                            </div>

                        </div>--%>
                        <div class="form-actions">
                            <div class="text-right">
                                <asp:Button ID="Btn_submit" runat="server" CssClass="btn mr-1 mb-1 btn-success" Text="Submit" OnClick="Btn_submit_Click" />
                            </div>
                        </div>
                    </telerik:RadPageView>
                    <%--<telerik:RadPageView ID="RadPageView2" runat="server">
                    </telerik:RadPageView>--%>
                </telerik:RadMultiPage>

            </div>
        </div>
    </section>
</div>



<%--<telerik:RadListBox ID="Radlisbox_Sample_Population" runat="server" CheckBoxes="false"
    ShowCheckAll="false" Width="0" Height="0" EmptyMessage="No items added" BorderColor="Transparent">
    <ItemTemplate>
        <table style="width: 100%;">
            <tr>
                <td style="width: 10%; text-align: left">
                    <asp:Label ID="lbl_Sel_population_Chr" runat="server" Text=""></asp:Label>
                </td>
                <td style="width: 10%; text-align: left">
                    <asp:Label ID="lbl_Sel_population_SPos" runat="server" Text=""></asp:Label>
                </td>
                <td style="width: 10%; text-align: left">
                    <asp:Label ID="lbl_Sel_population_EPos" runat="server" Text=""></asp:Label>
                </td>
                <td style="width: 70%"></td>
            </tr>
        </table>
    </ItemTemplate>
</telerik:RadListBox>--%>



<telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
    <script type="text/javascript">

        function Btn_Add_Population_ChrCoordinates_Clicked(sender, args) {
            var tb_spoint = $find("<%= Txt_Population_SPos.ClientID %>");
            var tb_epoint = $find("<%= Txt_Population_EPos.ClientID %>");
            if ((tb_spoint.get_value().length < 1) || (tb_epoint.get_value().length < 1)) {
                alert("Please define Start and end position!");
                args.set_cancel(true);
            }
            if (parseInt(tb_spoint.get_value()) > parseInt(tb_epoint.get_value())) {
                console.log(parseInt(tb_spoint.get_value()));
                console.log(parseInt(tb_epoint.get_value()));
                alert("Please enter valid Start and end position!");
                args.set_cancel(true);
            }
        }

        function Txt_Population_SPos_KeyPress(sender, args) {

            if (parseInt($find("<%= Txt_Population_SPos.ClientID %>").get_value()) <= parseInt($find('<%=CB_Population_Chromosome.ClientID %>').get_selectedItem().get_value())) {
                $find("<%= Txt_Population_EPos.ClientID %>").set_value($find("<%= Txt_Population_SPos.ClientID %>").get_value());
            } else {
                alert("Entered value for start position is outside the chromosome!");
                args.set_cancel(true);
            }
        }

        function Txt_Population_EPos_KeyPress(sender, args) {

            if (parseInt($find("<%= Txt_Population_EPos.ClientID %>").get_value()) > parseInt($find('<%=CB_Population_Chromosome.ClientID %>').get_selectedItem().get_value())) {

                alert("Entered value for end position is outside the chromosome!");
                args.set_cancel(true);
            }

        }


        <%--function Clear_Population_List() {
            var list = $find("<%= RLB_Population_Coordinates.ClientID %>");
            var items = list.get_items();
            list.trackChanges();
            items.clear();
            list.commitChanges();
        }


        function RemoveItem_Population_list() {
            var list = $find("<%= RLB_Population_Coordinates.ClientID %>");
            var items = list.get_items();
            var Sel_items = list.get_selectedItems();
            if (Sel_items != null) {
                list.trackChanges();
                Sel_items.forEach(function (sit) {
                    items.remove(sit);
                });
                list.commitChanges();

            }

        }--%>



    </script>
</telerik:RadScriptBlock>
