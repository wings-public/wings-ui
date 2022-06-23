<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Phenotype.ascx.cs" Inherits="WebGAP.PhenBook.uc.uc_Phenotype" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<link href=".././assets/css/Phenotyp_style.css" rel="stylesheet" type="text/css" media="screen" runat="server" />

<telerik:RadAjaxManager runat="server" ID="RadAjaxManager1" EnablePageHeadUpdate="false">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="HpoTabstrip">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="HpoTabstrip"></telerik:AjaxUpdatedControl>
                <telerik:AjaxUpdatedControl ControlID="RadMultiPageHpo" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="txtfilter">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="txtfilter"></telerik:AjaxUpdatedControl>
                <telerik:AjaxUpdatedControl ControlID="RG_Hpo" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="btnChng_layout">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btnChng_layout"></telerik:AjaxUpdatedControl>
                <telerik:AjaxUpdatedControl ControlID="RG_IndividualPhenotype" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_Hpo">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_Hpo"></telerik:AjaxUpdatedControl>
                <telerik:AjaxUpdatedControl ControlID="RG_IndividualPhenotype"></telerik:AjaxUpdatedControl>
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="btnDel_IndPheno">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btnDel_IndPheno" />
                <telerik:AjaxUpdatedControl ControlID="RG_IndividualPhenotype" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RCB_SearchDisease">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RCB_SearchDisease" />
                <telerik:AjaxUpdatedControl ControlID="RG_DiseasePheno" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_DiseasePheno">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_DiseasePheno"></telerik:AjaxUpdatedControl>
                <telerik:AjaxUpdatedControl ControlID="RG_IndividualPhenotype" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RadTreeList1">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadTreeList1"></telerik:AjaxUpdatedControl>
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RTL_Ontology">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RTL_Ontology"></telerik:AjaxUpdatedControl>
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>


<h4 class="card-title">
    <asp:PlaceHolder runat="server"><%: Page.Title %> </asp:PlaceHolder>
    <asp:Label ID="lbl_Individualid" runat="server"></asp:Label>
</h4>
<div class="card-body">
    <div class="card-block">
        <script type="text/javascript" id="telerikClientEvents1">
            function RG_Centers_OnColumnMouseOut(sender, args) {
            }
        </script>

        <div class="content-body pt-1">
            <section id="basic-form-layouts">
                <div class="row match-height">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 40%">
                                <telerik:RadTabStrip RenderMode="Lightweight" ID="HpoTabstrip" SelectedIndex="0" Font-Size="Smaller"
                                    AutoPostBack="True"
                                    runat="server" MultiPageID="RadMultiPageHpo" Width="100%" BorderWidth="0px">
                                    <Tabs>
                                        <telerik:RadTab Text="Features" Enabled="true" Selected="True" Font-Size="Smaller" Height="35px">
                                        </telerik:RadTab>
                                        <telerik:RadTab Text="Diseases" Enabled="true" Font-Size="Smaller" Height="35px">
                                        </telerik:RadTab>
                                        <telerik:RadTab Text="Ontology" Enabled="true" Font-Size="Smaller" Height="35px">
                                        </telerik:RadTab>
                                    </Tabs>
                                </telerik:RadTabStrip>

                                <telerik:RadMultiPage ID="RadMultiPageHpo" CssClass="RadMultiPage" runat="server" BorderWidth="0px" SelectedIndex="0" Width="100%" Height="100%">
                                    <telerik:RadPageView ID="RadPageViewHpo" runat="server" Height="600px" Width="100%">

                                        <div style="border-color: gainsboro; display: flex; padding: 4px 4px 4px 4px; font-size: smaller; background-color: #F3F3F3; box-shadow: inset 10px 10px 10px 10px rgba(0, 0, 197, 0.1)">
                                            <label class="col-md-2 label-control" for="txtfilter" style="margin-top: 5px">Search:</label>
                                            <asp:TextBox ID="txtfilter" class="form-control input-sm" runat="server" Text="" Width="390px"></asp:TextBox>
                                        </div>

                                        <telerik:RadGrid RenderMode="Lightweight" ID="RG_Hpo" runat="server" PageSize="100"
                                            AllowSorting="True" AllowPaging="True" CellPadding="0" CellSpacing="0" RetainExpandStateOnRebind="true"
                                            AutoGenerateColumns="False" DataSourceID="DS_Request" Height="550px" Width="100%" Font-Size="Smaller"
                                            AllowAutomaticDeletes="True" RefannosolvedRenderMode="Classic" OnItemCommand="RG_Requests_ItemCommand">
                                            <PagerStyle Mode="NumericPages" AlwaysVisible="true" Font-Size="Small" Font-Bold="true" ShowPagerText="false" />

                                            <MasterTableView AllowMultiColumnSorting="True" AllowPaging="true"
                                                DataSourceID="DS_Request" DataKeyNames="name,acc" Name="Master">
                                                <ItemStyle Height="25px" CssClass="pt-0 pb-0" />
                                                <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                                                </RowIndicatorColumn>
                                                <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"
                                                    Created="True">
                                                </ExpandCollapseColumn>
                                                <Columns>
                                                    <telerik:GridBoundColumn UniqueName="acc" SortExpression="acc" HeaderText="Hpo Id"
                                                        DataField="acc" FilterControlAltText="Filter acc column" ReadOnly="True">
                                                        <HeaderStyle Width="150px" VerticalAlign="Middle"></HeaderStyle>
                                                        <ItemStyle Width="150px" VerticalAlign="Middle" Font-Size="Smaller" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn UniqueName="name" SortExpression="name" HeaderText="Features"
                                                        DataField="name" FilterControlAltText="Filter name column">
                                                        <HeaderStyle VerticalAlign="Middle"></HeaderStyle>
                                                        <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Font-Size="Smaller" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" UniqueName="TemplateColumn">
                                                        <HeaderStyle Width="115" VerticalAlign="Middle"></HeaderStyle>
                                                        <ItemStyle Width="115" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="AA_yes" BorderWidth="0px" CommandName="SelYes" ImageUrl="/img/icon/icon_yes.png" ToolTip="Yes" runat="server"></asp:ImageButton>
                                                            <asp:ImageButton ID="AA_no" CommandName="SelNo" ImageUrl="/img/icon/icon_no.png" BorderWidth="0px" ToolTip="No" runat="server"></asp:ImageButton>
                                                            <asp:ImageButton ID="AA_na" CommandName="SelUnkonwn" ImageUrl="/img/icon/icon_na.png" BorderWidth="0px" ToolTip="Not Applicable" runat="server"></asp:ImageButton>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                </Columns>
                                            </MasterTableView>
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                            <ClientSettings EnableRowHoverStyle="true" AllowKeyboardNavigation="true">
                                                <Selecting AllowRowSelect="false" />
                                                <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                                                <ClientEvents OnRowMouseOver="RowMouseOver" OnRowMouseOut="RowMouseOut" />
                                            </ClientSettings>
                                            <FilterMenu RenderMode="Lightweight">
                                            </FilterMenu>
                                            <HeaderContextMenu RenderMode="Lightweight">
                                            </HeaderContextMenu>
                                        </telerik:RadGrid>

                                    </telerik:RadPageView>

                                    <telerik:RadPageView ID="RadMultiPageDisease" runat="server" Height="600px">
                                        <div style="border-color: gainsboro; display: flex; padding: 4px 4px 4px 4px; font-size: smaller; background-color: #F3F3F3; box-shadow: inset 10px 10px 10px 10px rgba(0, 0, 197, 0.1)">
                                            <label class="col-md-2 label-control" for="txtfilter" style="margin-top: 5px">Search:</label>
                                            <telerik:RadComboBox RenderMode="Lightweight" ID="RCB_SearchDisease" runat="server" Width="390px"
                                                DataSourceID="SDS_OMIM" DataTextField="omim" EmptyMessage="Search for disease..." Filter="Contains" DataValueField="OMIMID"
                                                EnableAutomaticLoadOnDemand="True" ItemsPerRequest="10" AutoPostBack="true" OnClientDropDownOpening="RCB_SearchDisease_DropDownOpening"
                                                ShowMoreResultsBox="true" EnableVirtualScrolling="true" Font-Size="X-Small">
                                                <HeaderTemplate>
                                                    <table style="width: 100%; font: X-Small">
                                                        <tr style="font: X-Small">
                                                            <td style="width: 100%">Disease ID - Disease Description </td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <table style="width: 100%">
                                                        <tr style="font: X-Small">
                                                            <td style="width: 100%"><%# DataBinder.Eval(Container.DataItem, "omim") %></td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </telerik:RadComboBox>
                                        </div>
                                        <telerik:RadGrid RenderMode="Lightweight" ID="RG_DiseasePheno" runat="server" PageSize="100"
                                            AllowSorting="True" AllowPaging="True" RetainExpandStateOnRebind="True" CellPadding="0" OnItemCommand="RG_DiseasePheno_ItemCommand"
                                            AutoGenerateColumns="False" Height="550px" Width="100%" Font-Size="Smaller" DataSourceID="SDS_Inddiseasepheno"
                                            AllowAutomaticDeletes="True" RefannosolvedRenderMode="Classic">
                                            <MasterTableView AllowMultiColumnSorting="True" AllowPaging="true" Name="Master" DataKeyNames="name,acc">
                                                <ItemStyle Height="25px" CssClass="pt-0 pb-0" />
                                                <Columns>
                                                    <telerik:GridBoundColumn UniqueName="acc" SortExpression="acc" HeaderText="Hpo Id"
                                                        DataField="acc" FilterControlAltText="Filter acc column">
                                                        <HeaderStyle Width="95px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle Width="95px" VerticalAlign="Middle" Font-Size="Smaller" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn UniqueName="name" SortExpression="name" HeaderText="Hpo Description" DataField="name" FilterControlAltText="name">
                                                        <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Left"></HeaderStyle>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" UniqueName="TemplateColumn">
                                                        <HeaderStyle Width="115" VerticalAlign="Middle"></HeaderStyle>
                                                        <ItemStyle Width="115" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImageButton1" BorderWidth="0px" CommandName="SelYes" ImageUrl="/img/icon/icon_yes.png" ToolTip="Yes" runat="server"></asp:ImageButton>
                                                            <asp:ImageButton ID="ImageButton2" CommandName="SelNo" ImageUrl="/img/icon/icon_no.png" BorderWidth="0px" ToolTip="No" runat="server"></asp:ImageButton>
                                                            <asp:ImageButton ID="ImageButton3" CommandName="SelUnkonwn" ImageUrl="/img/icon/icon_na.png" BorderWidth="0px" ToolTip="Not Applicable" runat="server"></asp:ImageButton>
                                                        </ItemTemplate>
                                                        <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Left"></HeaderStyle>
                                                    </telerik:GridTemplateColumn>
                                                </Columns>
                                            </MasterTableView>
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                            <ClientSettings EnableRowHoverStyle="true" AllowKeyboardNavigation="true">
                                                <Selecting AllowRowSelect="false" />
                                                <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                                                <ClientEvents OnRowMouseOver="RowMouseOver" OnRowMouseOut="RowMouseOut" />
                                            </ClientSettings>
                                            <FilterMenu RenderMode="Lightweight">
                                            </FilterMenu>
                                            <HeaderContextMenu RenderMode="Lightweight">
                                            </HeaderContextMenu>
                                        </telerik:RadGrid>
                                    </telerik:RadPageView>

                                    <telerik:RadPageView ID="RadPageView3" runat="server" Height="600px">

                                        <telerik:RadTreeList RenderMode="Lightweight" ID="RadTreeList1" runat="server" OnNeedDataSource="RadTreeList1_NeedDataSource"
                                            ParentDataKeyNames="term1_id" DataKeyNames="term2_id" AllowPaging="true"
                                            AutoGenerateColumns="false" AllowSorting="true" ExpandCollapseMode="Client">
                                            <ClientSettings>
                                                <Selecting AllowItemSelection="true" />
                                            </ClientSettings>
                                            <Columns>
                                                <telerik:TreeListBoundColumn DataField="term2_id" UniqueName="term2_id" HeaderText=" ID">
                                                </telerik:TreeListBoundColumn>
                                                <telerik:TreeListBoundColumn DataField="desc" UniqueName="desc" HeaderText="Description">
                                                </telerik:TreeListBoundColumn>
                                                <telerik:TreeListBoundColumn DataField="term1_id" UniqueName="term1_id" HeaderText="Parent Id">
                                                </telerik:TreeListBoundColumn>
                                            </Columns>
                                        </telerik:RadTreeList>


                                    </telerik:RadPageView>
                                </telerik:RadMultiPage>
                            </td>
                            <td style="width: 1%"></td>
                            <td style="width: 59%; padding-top: 25px;">
                                <asp:HiddenField runat="server" ID="hdn_severityval" />
                                <asp:HiddenField runat="server" ID="hdn_Hpoid" />

                                <div style="border-color: gainsboro; display: flex; flex-direction: row; justify-content: flex-end; padding: 4px 4px 4px 4px; font-size: smaller; background-color: #F3F3F3; box-shadow: inset 10px 10px 10px 10px rgba(0, 0, 197, 0.1)">
                                    <div>
                                        <telerik:RadButton ID="btnChng_layout" runat="server" ButtonType="StandardButton" Checked="true" ToggleType="CustomToggle" AutoPostBack="true" OnClick="btnChng_layout_Click2" Font-Size="Small">
                                            <ToggleStates>
                                                <telerik:RadButtonToggleState Text="Ungrouped" Value="1" />
                                                <telerik:RadButtonToggleState Text="  Grouped  " Selected="true" Value="0" />
                                            </ToggleStates>
                                        </telerik:RadButton>
                                    </div>
                                    <div>
                                        <telerik:RadButton ID="btnDel_IndPheno" runat="server" Text="Delete All" ToolTip="Delete All" OnClick="btnDel_IndPheno_Click" Font-Size="Small">
                                            <Icon PrimaryIconCssClass="rbRemove" PrimaryIconLeft="4" PrimaryIconTop="4"></Icon>
                                        </telerik:RadButton>
                                    </div>
                                </div>
                                <telerik:RadGrid RenderMode="Lightweight" ID="RG_IndividualPhenotype" DataSourceID="SDS_IndividualPhenotype" OnItemCommand="RG_IndividualPhenotype_ItemCommand"
                                    runat="server" Height="550px" Width="100%" PageSize="12" OnItemDataBound="RG_IndividualPhenotype_ItemDataBound" AutoPostBack="true"
                                    AllowSorting="True" AllowAutomaticDelete="true" Font-Size="Smaller" AllowAutomaticUpdates="True" OnDeleteCommand="RG_IndividualPhenotype_DeleteCommand"
                                    OnDataBound="RG_IndividualPhenotype_DataBound" DataKeyNames="IndividualID,acc">
                                    <ItemStyle Height="25px" CssClass="pt-0 pb-0" />
                                    <MasterTableView Width="100%" DataKeyNames="IndividualID,acc" AutoGenerateColumns="False" CommandItemDisplay="Bottom" ClientDataKeyNames="acc">
                                        <Columns>
                                            <telerik:GridTemplateColumn SortExpression="HpoID" HeaderText="Hpo Id" UniqueName="HpoID">
                                                <HeaderStyle Width="95px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="95px" VerticalAlign="Middle" Font-Size="Smaller" />
                                                <ItemTemplate>
                                                    <asp:Label ID="txt_phenotypeID" Text='<%# Eval("acc") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn SortExpression="Hpo_Desc" HeaderText="Features">
                                                <ItemTemplate>
                                                    <asp:Label ID="txt_phenotypeDesc" Text='<%# Eval("Hpo_Desc") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn FilterControlAltText="Filter Severity column" UniqueName="Severity" HeaderText="Severity">
                                                <ItemTemplate>
                                                    <div style="display: inline-flex">
                                                        <asp:HiddenField runat="server" ID="hdn_status" Value='<%# Eval("HpoStatus") %>' />
                                                        <asp:ImageButton ID="Statusbtn" BorderWidth="0px" Height="25px" runat="server"></asp:ImageButton>
                                                        <asp:HiddenField runat="server" ID="hdn_severityvaforshow" Value='<%# Eval("HpoSeverity") %>' />
                                                        <telerik:RadSlider RenderMode="Lightweight" ID="RS_Severity" runat="server" Orientation="Horizontal"
                                                            LargeChange="1" TrackPosition="TopLeft" ShowIncreaseHandle="false" AutoPostBack="true"
                                                            OnClientValueChanged="clientValueChange"
                                                            ShowDecreaseHandle="false" Width="170" ItemType="item" Font-Size="Smaller" Height="30" Skin="Web20" CssClass="TicksSlider ml-1 mr-1">
                                                            <Items>
                                                                <telerik:RadSliderItem Text="Normal" ToolTip="Normal" runat="server" Value="0"></telerik:RadSliderItem>
                                                                <telerik:RadSliderItem Text="Average" ToolTip="Average" runat="server" Value="1"></telerik:RadSliderItem>
                                                                <telerik:RadSliderItem Text="Bad" ToolTip="Bad" runat="server" Value="2"></telerik:RadSliderItem>
                                                                <telerik:RadSliderItem Text="Very bad" ToolTip="Very bad" runat="server" Value="3"></telerik:RadSliderItem>
                                                            </Items>
                                                        </telerik:RadSlider>
                                                        <asp:ImageButton ID="Delete" BorderWidth="0px" Height="25px" CommandName="Delete" ImageUrl="/img/icon/icon_delete.png" ToolTip="Delete" runat="server"></asp:ImageButton>
                                                    </div>
                                                </ItemTemplate>
                                                <HeaderStyle Width="280px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="280px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </telerik:GridTemplateColumn>
                                        </Columns>
                                        <CommandItemTemplate>
                                            <div style="display: inline-flex; text-shadow: 1px 1px 3px #034, 19px 22px 5px blue;">
                                                <asp:Label runat="server" ID="txt_Summary_Y" CssClass="label-control pl-1 pt-1" ForeColor="Blue"> </asp:Label>
                                                <asp:Label runat="server" ID="txt_Summary_N" CssClass="label-control pl-1 pt-1" ForeColor="Red"> </asp:Label>
                                                <asp:Label runat="server" ID="txt_Summary_NA" CssClass="label-control pl-1 pt-1" ForeColor="Black"> </asp:Label>
                                            </div>
                                        </CommandItemTemplate>
                                    </MasterTableView>
                                    <ClientSettings ReorderColumnsOnClient="True" AllowColumnsReorder="True">
                                        <Selecting AllowRowSelect="True"></Selecting>
                                        <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                                    </ClientSettings>
                                    <GroupingSettings ShowUnGroupButton="true"></GroupingSettings>
                                    <FilterMenu RenderMode="Lightweight"></FilterMenu>
                                    <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                                </telerik:RadGrid>
                            </td>
                        </tr>
                    </table>
                </div>
            </section>
        </div>
    </div>
</div>


<span id="Span2"></span>
<asp:SqlDataSource ID="DS_Request" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_term_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtfilter" Name="Name" DefaultValue="1" PropertyName="Text" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SDS_OMIM" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="SELECT OMIMID  ,[Title] , OMIMID +' - '+[Title] as omim FROM [mimTitles]"></asp:SqlDataSource>
<asp:SqlDataSource ID="SDS_Inddiseasepheno" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_Inddiseasepheno_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="RCB_SearchDisease" Name="diseaseId" PropertyName="SelectedValue" DefaultValue="" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SDS_IndividualPhenotype" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_IndividualPhenotype_Desc" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="IndividualID" SessionField="IndividualID" Type="Int64" />
        <asp:ControlParameter ControlID="btnChng_layout" Name="Distinct" Type="Int32" DefaultValue="0" PropertyName="SelectedToggleStateIndex" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SDS_RTL_Ontology" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_ontology" SelectCommandType="StoredProcedure"></asp:SqlDataSource>


<telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
    <script type="text/javascript">
        function RowMouseOver(sender, eventArgs) {
            $get(eventArgs.get_id()).className += " RowMouseOver";
        }
        function RowMouseOut(sender, eventArgs) {
            var row = $get(eventArgs.get_id());
            row.className = row.className.replace("RowMouseOver", "RowMouseOut");
        }
    </script>
</telerik:RadScriptBlock>

<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
    <script type="text/javascript">
        function RCB_SearchDisease_DropDownOpening(sender, args) {
            var combo = $find('<%= RCB_SearchDisease.ClientID%>');
            combo.clearSelection();
        }

        function clientValueChange(sender, eventArgs) {
            var grid = $find("<%=RG_IndividualPhenotype.ClientID %>");
            var sliderValue = sender.get_value();
            document.getElementById("<%= hdn_severityval.ClientID %>").value = sliderValue;
            var masterTable = grid.get_masterTableView();
            $telerik.$.grep(masterTable.get_dataItems(), function (item, index) {
                if ($telerik.$.contains(item.get_element(), sender.get_element()) == true) {
                    document.getElementById("<%= hdn_Hpoid.ClientID %>").value = item.getDataKeyValue("acc");
                    masterTable.fireCommand("ChangeSeverity");
                }
            });
        }
    </script>
</telerik:RadCodeBlock>
