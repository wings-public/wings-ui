<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Phenotypes.ascx.cs" Inherits="WebGAP.PhenBook.uc.uc_Phenotypes" %>
<link href=".././assets/css/Phenotyps_style.css" rel="stylesheet" type="text/css" media="screen" runat="server" />
<link href="../../assets/css/cytoscape.js-panzoom.css" rel="stylesheet" type="text/css" />

<p>
    &nbsp;
</p>

<telerik:RadAjaxManager runat="server" ID="RadAjaxManager1" EnablePageHeadUpdate="false">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RCB_SearchHPO">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RCB_SearchHPO" />
                <telerik:AjaxUpdatedControl ControlID="Cy_Hpo_graph_Parent" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="RB_Hpo_Tree_Parent">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RB_Hpo_Tree_Parent" />
                <telerik:AjaxUpdatedControl ControlID="Cy_Hpo_graph_Parent" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RB_Hpo_Tree_Child">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RB_Hpo_Tree_Child" />
                <telerik:AjaxUpdatedControl ControlID="Cy_Hpo_graph_Child" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="Cy_Hpo_graph_Child">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Cy_Hpo_graph_Child" />
                <telerik:AjaxUpdatedControl ControlID="RG_SelectedHPO" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RCB_SearchOMIM">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RCB_SearchOMIM" />
                <telerik:AjaxUpdatedControl ControlID="RG_OMIM" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RCB_SearchGene">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RCB_SearchGene" />
                <telerik:AjaxUpdatedControl ControlID="RG_Gene" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_Gene">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_SelectedHPO" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_OMIM_Association" />
                <telerik:AjaxUpdatedControl ControlID="RG_Gene_Association" />
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="RG_OMIM">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_SelectedHPO" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_OMIM_Association" />
                <telerik:AjaxUpdatedControl ControlID="RG_Gene_Association" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_SelectedHPO">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_SelectedHPO" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_OMIM_Association" />
                <telerik:AjaxUpdatedControl ControlID="RG_Gene_Association" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="btn_addhpofromgraph">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btn_addhpofromgraph" />
                <telerik:AjaxUpdatedControl ControlID="RG_SelectedHPO" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_OMIM_Association" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_Gene_Association" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RCB_SelectedHPO" />
                <telerik:AjaxUpdatedControl ControlID="RCB_OMIM_Association" />
                <telerik:AjaxUpdatedControl ControlID="RCB_Gene_Association" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RB_Add_HPO">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RB_Add_HPO" />
                <telerik:AjaxUpdatedControl ControlID="RG_SelectedHPO" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_OMIM_Association" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RG_Gene_Association" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RCB_SelectedHPO" />
                <telerik:AjaxUpdatedControl ControlID="RCB_OMIM_Association" />
                <telerik:AjaxUpdatedControl ControlID="RCB_Gene_Association" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RCB_SelectedHPO">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RCB_SelectedHPO" />
                <telerik:AjaxUpdatedControl ControlID="RG_SelectedHPO" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RCB_OMIM_Association">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RCB_OMIM_Association" />
                <telerik:AjaxUpdatedControl ControlID="RG_OMIM_Association" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RCB_Gene_Association">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RCB_SelectedGene" />
                <telerik:AjaxUpdatedControl ControlID="RG_Gene_Association" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RB_History">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RB_History" />
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="RTB_DeleteSearch_SelectedHPO">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RTB_DeleteSearch_SelectedHPO" />
                <telerik:AjaxUpdatedControl ControlID="RG_SelectedHPO" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RCB_SelectedHPO" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RTB_DeleteSearch__AssociatedOMIM">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RTB_DeleteSearch__AssociatedOMIM" />
                <telerik:AjaxUpdatedControl ControlID="RG_OMIM_Association" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RCB_OMIM_Association" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RTB_DeleteSearch__AssociatedGene">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RTB_DeleteSearch__AssociatedGene" />
                <telerik:AjaxUpdatedControl ControlID="RG_Gene_Association" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RCB_Gene_Association" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <%--    <telerik:AjaxSetting AjaxControlID="RB_Add_HPO">
            <UpdatedControls>

                <telerik:AjaxUpdatedControl ControlID="MP_Phenotypes" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>--%>
    </AjaxSettings>
</telerik:RadAjaxManager>

<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="MetroTouch">
</telerik:RadAjaxLoadingPanel>


<div class="content-header row">
    <div class="content-header-left col-md-6 col-12">
        <h3 class="content-header-title">
            <asp:PlaceHolder runat="server"><%: Page.Title %> </asp:PlaceHolder>
        </h3>
    </div>

</div>



<div class="content-body pt-1">
    <section id="basic-form-layouts">
        <div class="row match-height">
            <script type="text/javascript" id="telerikClientEvents1">
                function OnColumnMouseOut(sender, args) {
                }
            </script>

            <div class="col-md-6">
                <div class="card">
                    <div class="card-content collapse show">
                        <div class="card-body">
                            <div class="form">
                                <div class="form-body">
                                    <h4 class="form-section">Phenotype lookup</h4>
                                    <telerik:RadTabStrip ID="RTS_Phenotypes" runat="server" RenderMode="Lightweight" SelectedIndex="1" MultiPageID="MP_Phenotypes" Font-Bold="True"
                                        CausesValidation="False" ResolvedRenderMode="Classic" ScrollChildren="True" BorderWidth="0px" Skin="Silk" CssClass="RTS_PhenBook_HPO_OMIM_GENE_Padding">
                                        <Tabs>
                                            <telerik:RadTab Text="HPO" Font-Size="Small" Selected="True" SelectedIndex="0" ImageUrl="../../img/icon/icon_hpo_min.png">
                                            </telerik:RadTab>
                                            <telerik:RadTab Text="Disease" Font-Size="Small" ImageUrl="../../img/icon/icon_omim.png">
                                            </telerik:RadTab>
                                            <telerik:RadTab Text="Gene" Font-Size="Small" ImageUrl="../../img/icon/icon_gene.png">
                                            </telerik:RadTab>
                                        </Tabs>
                                    </telerik:RadTabStrip>
                                    <telerik:RadMultiPage ID="MP_Phenotypes" CssClass="RadMultiPage" runat="server" BorderWidth="0px" SelectedIndex="0" Height="100%" Style="overflow: hidden">

                                        <telerik:RadPageView ID="RPW_HPO" runat="server" Height="700px">
                                            <div class="col-md-12 pt-3">

                                                <table style="width: 100%">
                                                    <tr>
                                                        <td style="width: 90%">
                                                            <telerik:RadComboBox RenderMode="Lightweight" ID="RCB_SearchHPO" runat="server" Width="100%" Label="Hpo:" Font-Bold="true"
                                                                DataSourceID="SDS_RCB_SearchHPO" DataTextField="HPO_Des" Filter="Contains" DataValueField="HPOID" EmptyMessage="Search HPO"
                                                                EnableAutomaticLoadOnDemand="True" ItemsPerRequest="5" AutoPostBack="true" OnClientDropDownOpening="RCB_SearchHPO_DropDownOpening"
                                                                ShowMoreResultsBox="true" EnableVirtualScrolling="true" Font-Size="Small" Skin="Silk" OnClientSelectedIndexChanged="HPO_Selected">

                                                                <ItemTemplate>
                                                                    <table style="width: 100%">
                                                                        <tr style="font: Small; padding: 0">
                                                                            <td style="width: 100%"><%# DataBinder.Eval(Container.DataItem, "HPO_Des") %></td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                            </telerik:RadComboBox>
                                                        </td>
                                                        <td style="width: 10%">
                                                            <telerik:RadButton ID="RB_Add_HPO" runat="server" Text="Add" OnClick="btnSearch_Click" CssClass="RB_PhenBook_AddHPO" ForeColor="#0092da">
                                                            </telerik:RadButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>

                                            <div style="border: solid 2px  #14AFCA; height: 600px;">
                                                <table id="Div_Tree_Hpo_Content" style="width: 100%; visibility: hidden; margin: 2px; border-radius: 5px; text-align: left; padding: 2px; font-size: 12px;">
                                                    <tr>
                                                        <td style="width: 50%;">
                                                            <telerik:RadButton ID="RB_Hpo_Tree_Parent" runat="server" ToggleType="Radio" ButtonType="ToggleButton" GroupName="StandardButton" OnClientClicked="draw_tree_parent" Font-Size="Small" ForeColor="#0099ff">
                                                                <ToggleStates>
                                                                    <telerik:RadButtonToggleState Text="Hpo - Parent" PrimaryIconCssClass="rbToggleRadioChecked" />
                                                                    <telerik:RadButtonToggleState Text="Hpo - Parent" PrimaryIconCssClass="rbToggleRadio" />
                                                                </ToggleStates>
                                                            </telerik:RadButton>
                                                        </td>
                                                        <td style="width: 50%; text-align: right; color: #0099ff">
                                                            <label style="background-color: aliceblue; margin-right: 3px; padding: 5px; border-radius: 2px; width: 200px; margin-bottom: 0px;">Click on node to add Hpo term</label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 50%;">
                                                            <telerik:RadButton ID="RB_Hpo_Tree_Child" runat="server" ToggleType="Radio" ButtonType="ToggleButton" GroupName="StandardButton" OnClientClicked="draw_tree_child" Font-Size="Small" ForeColor="#0099ff">
                                                                <ToggleStates>
                                                                    <telerik:RadButtonToggleState Text="Hpo - Child" PrimaryIconCssClass="rbToggleRadioChecked" />
                                                                    <telerik:RadButtonToggleState Text="Hpo - Child" PrimaryIconCssClass="rbToggleRadio" />
                                                                </ToggleStates>
                                                            </telerik:RadButton>
                                                        </td>
                                                        <td style="width: 50%; text-align: right; color: #0099ff;">
                                                            <label style="background-color: aliceblue; margin-right: 3px; margin-bottom: 0px; padding: 5px; border-radius: 2px; width: 200px">Roll mouse to zoom in /zoom out</label>
                                                        </td>
                                                    </tr>

                                                </table>
                                                <div id="Cy_Hpo_graph" style="height: 520px; width: 100%;">
                                                </div>

                                            </div>
                                        </telerik:RadPageView>
                                        <telerik:RadPageView ID="RPW_OMIM" runat="server" Height="730px">
                                            <div class="col-md-12 pt-3">
                                                <telerik:RadComboBox RenderMode="Lightweight" ID="RCB_SearchOMIM" runat="server" Width="100%" Label="Disease:" Font-Bold="true"
                                                    DataSourceID="SDS_SearchOMIM" DataTextField="omim" Filter="Contains" DataValueField="OMIMID" EmptyMessage="Search Disease"
                                                    EnableAutomaticLoadOnDemand="True" ItemsPerRequest="5" AutoPostBack="true" OnClientDropDownOpening="RCB_SearchOMIM_DropDownOpening"
                                                    ShowMoreResultsBox="true" EnableVirtualScrolling="true" Font-Size="Small" Skin="Silk">

                                                    <ItemTemplate>
                                                        <table style="width: 100%">
                                                            <tr style="font: Small; padding: 0">
                                                                <td style="width: 100%"><%# DataBinder.Eval(Container.DataItem, "omim") %></td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </telerik:RadComboBox>
                                                <div class="pt-2">
                                                    <telerik:RadGrid RenderMode="Lightweight" ID="RG_OMIM" runat="server" Height="600px" PageSize="15" CssClass="RG_PhenBook_BorderColor"
                                                        RetainExpandStateOnRebind="True" CellPadding="0" OnItemCommand="RG_OMIM_ItemCommand" AllowPaging="true"
                                                        AutoGenerateColumns="False" Width="100%" Font-Size="Small" DataSourceID="SDS_Inddiseasepheno" DataKeyNames="HPOID,HPO_Name"
                                                        RefannosolvedRenderMode="Classic">

                                                        <MasterTableView Name="Master" DataSourceID="SDS_Inddiseasepheno" DataKeyNames="HPOID,HPO_Name">
                                                            <Columns>
                                                                <telerik:GridBoundColumn UniqueName="HPOID" SortExpression="HPOID"
                                                                    DataField="HPOID" FilterControlAltText="Filter HPOID column" HeaderText="HPO Associations">
                                                                    <HeaderStyle></HeaderStyle>
                                                                    <ItemStyle Width="95px" VerticalAlign="Middle" Font-Size="Small" />
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn UniqueName="HPO_Name" SortExpression="HPO_Name"
                                                                    DataField="HPO_Name" FilterControlAltText="HPO_Name">
                                                                    <HeaderStyle Height="0px"></HeaderStyle>
                                                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Font-Size="Small"></ItemStyle>
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" UniqueName="TemplateColumn">
                                                                    <HeaderStyle Height="0px"></HeaderStyle>
                                                                    <ItemStyle Width="115" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="ADD_HPO" ImageUrl="/img/icon/icon_Add_min.png" BorderWidth="0px" CommandName="ADD_HPO" runat="server"></asp:ImageButton>
                                                                    </ItemTemplate>
                                                                </telerik:GridTemplateColumn>
                                                            </Columns>
                                                            <ItemStyle Height="25px" />

                                                        </MasterTableView>
                                                        <ClientSettings>
                                                            <Scrolling UseStaticHeaders="True" />
                                                        </ClientSettings>
                                                        <PagerStyle Mode="NextPrev" Position="Bottom"></PagerStyle>
                                                    </telerik:RadGrid>
                                                </div>
                                            </div>
                                        </telerik:RadPageView>
                                        <telerik:RadPageView ID="RPW_Gene" runat="server" Height="730px">
                                            <div class="col-md-12 pt-3">

                                                <telerik:RadComboBox RenderMode="Lightweight" ID="RCB_SearchGene" runat="server" Width="100%" Label="Gene:" Font-Bold="true"
                                                    DataSourceID="SDS_RCB_SearchGene" DataTextField="gene" Filter="Contains" DataValueField="Gene_Symbol" EmptyMessage="Search Gene"
                                                    EnableAutomaticLoadOnDemand="True" ItemsPerRequest="5" AutoPostBack="true" OnClientDropDownOpening="RCB_SearchGene_DropDownOpening"
                                                    ShowMoreResultsBox="true" EnableVirtualScrolling="true" Font-Size="Small" Skin="Silk">
                                                    <ItemTemplate>
                                                        <table style="width: 100%">
                                                            <tr style="font: Small; padding: 0">
                                                                <td style="width: 100%"><%# DataBinder.Eval(Container.DataItem, "gene") %></td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </telerik:RadComboBox>
                                                <div class="pt-2">

                                                    <telerik:RadGrid RenderMode="Lightweight" ID="RG_Gene" runat="server" PageSize="15" Height="600px" CssClass="RG_PhenBook_BorderColor"
                                                        RetainExpandStateOnRebind="True" CellPadding="0" OnItemCommand="RG_Gene_ItemCommand" AllowPaging="True"
                                                        AutoGenerateColumns="False" Width="100%" Font-Size="Small" DataSourceID="SDS_Gene" DataKeyNames="HPOID, HPO_Name"
                                                        RefannosolvedRenderMode="Classic">
                                                        <MasterTableView Name="Master" DataSourceID="SDS_Gene" DataKeyNames="HPOID">
                                                            <Columns>
                                                                <telerik:GridBoundColumn DataField="HPOID" FilterControlAltText="Filter HPOID column" HeaderText="HPO Associations" SortExpression="HPOID" UniqueName="HPOID">
                                                                    <ItemStyle Width="95px" VerticalAlign="Middle" Font-Size="Small" />
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn UniqueName="HPO_Name" SortExpression="HPO_Name" DataField="HPO_Name" FilterControlAltText="HPO_Name">
                                                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Font-Size="Small"></ItemStyle>
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" UniqueName="TemplateColumn">
                                                                    <ItemStyle Width="115" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="ADD_HPO" ImageUrl="/img/icon/icon_Add_min.png" BorderWidth="0px" CommandName="ADD_HPO" runat="server"></asp:ImageButton>
                                                                    </ItemTemplate>
                                                                </telerik:GridTemplateColumn>
                                                            </Columns>
                                                            <ItemStyle Height="25px" />
                                                        </MasterTableView>
                                                        <ClientSettings>
                                                            <Scrolling UseStaticHeaders="True" />
                                                        </ClientSettings>
                                                        <PagerStyle Mode="NextPrev" Position="Bottom"></PagerStyle>

                                                    </telerik:RadGrid>
                                                </div>
                                            </div>
                                        </telerik:RadPageView>
                                    </telerik:RadMultiPage>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card">
                    <div class="card-content collapse show">
                        <div class="card-body">
                            <div class="form">
                                <telerik:RadButton ID="RB_History" runat="server" CssClass="Btn_History" OnClientClicked="RB_History_Clicked" Text="History">
                                    <Icon PrimaryIconUrl="../../img/icon/icon_History.png" />
                                </telerik:RadButton>
                                <h4 class="form-section">
                                    <asp:Label ID="lbl_Individualid" runat="server"></asp:Label>
                                </h4>
                                <telerik:RadTabStrip ID="RTS_HPO_Indidivdual" runat="server" RenderMode="Lightweight" SelectedIndex="0" MultiPageID="MP_Individual_Phenotypes" Font-Bold="True"
                                    CausesValidation="False" ResolvedRenderMode="Classic" ScrollChildren="True" BorderWidth="0px" Skin="Silk" CssClass="RTS_PhenBook_HPO_OMIM_GENE_Padding">
                                    <Tabs>
                                        <telerik:RadTab Text="Selected HPO Terms" Font-Size="Small" Selected="True" SelectedIndex="0" Width="33%">
                                        </telerik:RadTab>
                                        <telerik:RadTab Text="Associated Disease" Font-Size="Small" Width="33%">
                                        </telerik:RadTab>
                                        <telerik:RadTab Text="Associated Gene" Font-Size="Small" Width="33%">
                                        </telerik:RadTab>

                                    </Tabs>
                                </telerik:RadTabStrip>

                                <telerik:RadMultiPage ID="MP_Individual_Phenotypes" CssClass="RadMultiPage" runat="server" BorderWidth="0px" SelectedIndex="0" Height="100%" Style="overflow: hidden">

                                    <telerik:RadPageView ID="RPW_SelectedHPO_Individual" runat="server" Height="700px">
                                        <%--  <div class="col-md-12 " style="visibility: hidden">
                                           

                                            <table style="width: 100%;">
                                                <tr>
                                                    <td style="width: 95%">
                                                        <telerik:RadComboBox RenderMode="Lightweight" ID="RCB_SelectedHPO" runat="server" AutoPostBack="True" DataSourceID="DS_SearchSelectedHPO" EnableAutomaticLoadOnDemand="true"
                                                            DataTextField="HPO_Desc" DataValueField="HPOID" Width="100%" Height="150px" Filter="Contains" EmptyMessage="Search for Hpo..."
                                                            ItemsPerRequest="5" ShowMoreResultsBox="true" EnableVirtualScrolling="true">
                                                        </telerik:RadComboBox>
                                                    </td>
                                                    <td style="width: 5%">
                                                        <telerik:RadButton RenderMode="Lightweight" runat="server" ID="RTB_DeleteSearch_SelectedHPO" ToolTip="Delete search" OnClientClicked="RB_DeleteSearch_SelectedHPO_Clicked" Height="20px" Font-Size="Smaller">
                                                            <Icon PrimaryIconUrl="~/img/icon/icon_del-trash.gif" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                                                        </telerik:RadButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>--%>

                                        <asp:HiddenField runat="server" ID="hdn_severityval" />
                                        <asp:HiddenField runat="server" ID="hdn_Hpoid" />
                                        <asp:HiddenField runat="server" ID="hdn_HpoStatus" />
                                        <asp:HiddenField runat="server" ID="hdn_Onset_Year" />
                                        <asp:HiddenField runat="server" ID="hdn_Onset_Month" />
                                        <asp:HiddenField runat="server" ID="hdn_RowID_In_EditMODE" />

                                        <telerik:RadGrid RenderMode="Lightweight" ID="RG_SelectedHPO" runat="server" AllowPaging="True" PageSize="6" Height="600px" 
                                            CellPadding="0" DataKeyNames="HPOID" OnItemDataBound="RG_SelectedHPO_ItemDataBound" OnItemCommand="RG_SelectedHPO_ItemCommand" CssClass="Grid_No_Border_Padding RG_NO_Shadow"
                                            AutoGenerateColumns="False" Font-Size="Small" DataSourceID="SDS_SelectedHPO" AllowFilteringByColumn="true">

                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                            <MasterTableView ClientDataKeyNames="HPOID,HPO_Status" DataKeyNames="HPOID" DataSourceID="SDS_SelectedHPO" Name="Master" EditMode="InPlace">
                                                <Columns>

                                                    <telerik:GridTemplateColumn ReadOnly="true" DataField="HPOID" FilterDelay="1000" HeaderText="search by ID" ShowFilterIcon="false" FilterControlToolTip="search by ID" CurrentFilterFunction="Contains" FilterControlWidth="100%">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="btn_Delete" CommandName="Delete" Width="15" ImageUrl="~/img/icon/icon_delete_min.png" BorderWidth="0px" ToolTip="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete?')" CssClass="mt-1"></asp:ImageButton>
                                                            <asp:HiddenField runat="server" ID="hdn_HPO_Status" Value='<%# Bind("HPO_Status") %>' />
                                                            <asp:Label ID="txt_HPO_Status" runat="server" Width="5px" Height="5px"></asp:Label>
                                                            <asp:LinkButton ID="lbn_HPOID" Text='<%# Bind("HPOID") %>' soitoPostBack="true" runat="server" UniqueName="lbn_HPOID"></asp:LinkButton>
                                                            <br />
                                                            <asp:Label ID="txt_HPO_Name" Text='<%# Eval("HPO_Name") %>' runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn DataField="HPO_Name" FilterDelay="1000" HeaderText="search by description" ShowFilterIcon="false" FilterControlToolTip="search by description" CurrentFilterFunction="Contains" FilterControlWidth="100%">
                                                        <ItemTemplate>

                                                            <table style="width: 15%; float: left">
                                                                <tr>
                                                                    <td style="width: 40%">
                                                                        <telerik:RadComboBox RenderMode="Lightweight" ID="DDL_Onset_year" runat="server" AutoPostBack="True" DataSourceID="Sql_DDL_Onset_Year"
                                                                            DataTextField="Onset_Year" SelectedValue='<%# Eval("Onset_Year") %>' DataValueField="Onset_Year_val" Width="50" Height="150px" Font-Size="XX-Small" OnClientSelectedIndexChanged="DDL_Onset_year_SelectedIndexChanged"
                                                                            ItemsPerRequest="5" EnableVirtualScrolling="true" ToolTip="Year for Onset">
                                                                        </telerik:RadComboBox>
                                                                    </td>
                                                                    <td style="width: 60%">
                                                                        <telerik:RadComboBox RenderMode="Lightweight" ID="DDL_Onset_month" runat="server" AutoPostBack="True" DataSourceID="Sql_DDL_Onset_Month"
                                                                            DataTextField="Onset_Month" SelectedValue='<%# Eval("Onset_Month") %>' DataValueField="Onset_Month_val" Width="50" Height="150px" Font-Size="XX-Small" OnClientSelectedIndexChanged="DDL_Onset_month_SelectedIndexChanged"
                                                                            ItemsPerRequest="5" EnableVirtualScrolling="true" ToolTip="Month for Onset">
                                                                        </telerik:RadComboBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 40%">
                                                                        <asp:Label Text="Onset year" runat="server" Font-Size="XX-Small" ForeColor="#7394C7"></asp:Label>
                                                                    </td>
                                                                    <td style="width: 60%">
                                                                        <asp:Label Text="/ month" runat="server" Font-Size="XX-Small" ForeColor="#7394C7"></asp:Label>
                                                                    </td>
                                                                </tr>

                                                            </table>


                                                            <asp:ImageButton ID="GoToOMIM" BorderWidth="0px" ImageUrl="../../img/icon/icon_Omim.png" Width="30px" Height="30px" CommandName="GoToHPO_OMIM"
                                                                runat="server" ToolTip="Disease"></asp:ImageButton>
                                                            <asp:Label ID="OMIM_count" Text='<%# Eval("OMIM_Count") %>' runat="server" CssClass="bgOMIM" ForeColor="#7394C7" ToolTip="No. OMIM"></asp:Label>

                                                            <asp:ImageButton ID="GoToGene" BorderWidth="0px" ImageUrl="../../img/icon/icon_gene.png" Width="25px" Height="25px" CommandName="GoToHPO_Gene"
                                                                runat="server" ToolTip="Gene"></asp:ImageButton>
                                                            <asp:Label ID="Gene_count" Text='<%# Eval("Gene_Count") %>' runat="server" CssClass="bgGene" ForeColor="#7394C7" ToolTip="No. Gene"></asp:Label>

                                                            <div style="float: right">
                                                                <div style="display: inline-flex">
                                                                    <asp:HiddenField runat="server" ID="hdn_severityvaforshow" Value='<%# Eval("HPO_Severity") %>' />
                                                                    <telerik:RadSlider RenderMode="Lightweight" ID="RS_Severity" runat="server" Orientation="Horizontal"
                                                                        LargeChange="1" TrackPosition="TopLeft" ShowIncreaseHandle="false" AutoPostBack="true"
                                                                        OnClientValueChanged="clientValueChange" 
                                                                        ShowDecreaseHandle="false" Width="140" ItemType="item" Font-Size="X-Small" Height="25" Skin="Web20" CssClass="TicksSlider ml-1 mr-1">
                                                                        <Items>
                                                                            <telerik:RadSliderItem Text="Mild" ToolTip="Mild" runat="server" Value="0"></telerik:RadSliderItem>
                                                                            <telerik:RadSliderItem Text="Moderate" ToolTip="Moderate" runat="server" Value="1"></telerik:RadSliderItem>
                                                                            <telerik:RadSliderItem Text="Severe" ToolTip="Sevier" runat="server" Value="2"></telerik:RadSliderItem>
                                                                        </Items>
                                                                    </telerik:RadSlider>
                                                                    <div class="bgStatus">
                                                                        <asp:ImageButton CssClass="PhenBook_Hover_HPO_Status_Yes" ID="AA_yes" ImageUrl="/img/icon/icon_yes_gray.png" BorderWidth="0px" CommandName="SelYes" ToolTip="Yes" runat="server" Height="15px"></asp:ImageButton>
                                                                        <asp:ImageButton CssClass="PhenBook_Hover_HPO_Status_No" ID="AA_no" CommandName="SelNo" ImageUrl="/img/icon/icon_no_gray.png" BorderWidth="0px" ToolTip="No" runat="server" Height="15px"></asp:ImageButton>
                                                                        <asp:ImageButton CssClass="PhenBook_Hover_HPO_Status_NA" ID="AA_na" CommandName="SelUnkonwn" ImageUrl="/img/icon/icon_NA_gray.png" BorderWidth="0px" ToolTip="Not Applicable" runat="server" Height="15px"></asp:ImageButton>
                                                                    </div>
                                                                </div>
                                                                </div>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>

                                                    <%--   <telerik:GridTemplateColumn ReadOnly="true">
                                                        <HeaderStyle Width="40px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle Width="40px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                        <ItemTemplate>
                                                             </ItemTemplate>
                                                    </telerik:GridTemplateColumn>

                                                    <telerik:GridTemplateColumn ReadOnly="true">
                                                        <HeaderStyle Width="40px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle Width="40px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                        <ItemTemplate>
                                                               </ItemTemplate>
                                                    </telerik:GridTemplateColumn>

                                                    <telerik:GridTemplateColumn FilterControlAltText="Filter Severity column" UniqueName="Severity" HeaderText="Severity" ReadOnly="true">
                                                        <HeaderStyle Width="150px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle Width="150px" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                        
                                                        </ItemTemplate>

                                                    </telerik:GridTemplateColumn>--%>
                                                </Columns>
                                            </MasterTableView>

                                            <PagerStyle Mode="NextPrev" Position="Bottom"></PagerStyle>
                                            <FilterMenu RenderMode="Lightweight">
                                            </FilterMenu>
                                            <HeaderContextMenu RenderMode="Lightweight">
                                            </HeaderContextMenu>
                                        </telerik:RadGrid>

                                    </telerik:RadPageView>

                                    <telerik:RadPageView ID="RPW_SelectedOMIM_Individual" runat="server" Height="700px">
                                        <%--  <div class="col-md-12" style="visibility: hidden">
                                       

                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="width: 95%">
                                                        <telerik:RadComboBox RenderMode="Lightweight" ID="RCB_OMIM_Association" runat="server" AutoPostBack="True" DataSourceID="DS_SearchSelectedOMIM" EmptyMessage="Search For Disease ..."
                                                            DataTextField="OMIM_Desc" DataValueField="OMIMID" Width="100%" Height="150px" Filter="Contains" EnableAutomaticLoadOnDemand="true" ItemsPerRequest="5"
                                                            AppendDataBoundItems="true" ShowMoreResultsBox="true" EnableVirtualScrolling="true">
                                                        </telerik:RadComboBox>
                                                    </td>
                                                    <td style="width: 5%">
                                                        <telerik:RadButton RenderMode="Lightweight" runat="server" ID="RTB_DeleteSearch__AssociatedOMIM" ToolTip="Delete search" OnClientClicked="RB_DeleteSearch_AssociatedOMIM_Clicked" Height="20px" Font-Size="Smaller">
                                                            <Icon PrimaryIconUrl="~/img/icon/icon_del-trash.gif" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                                                        </telerik:RadButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>--%>

                                        <telerik:RadGrid RenderMode="Lightweight" ID="RG_OMIM_Association" runat="server" AllowPaging="true" PageSize="14" Height="600px" CssClass="Grid_No_Border_Padding RG_NO_Shadow"
                                            RetainExpandStateOnRebind="True" CellPadding="0" DataSourceID="SDS_OMIM_Association" Width="100%" OnItemDataBound="RG_OMIM_Association_ItemDataBound"
                                            AutoGenerateColumns="False" Font-Size="Small" OnItemCommand="RG_OMIM_Association_ItemCommand" DataKeyNames="OMIMID" AllowFilteringByColumn="true"
                                            RefannosolvedRenderMode="Classic">

                                            <MasterTableView Name="Master" DataSourceID="SDS_OMIM_Association" DataKeyNames="OMIMID">
                                                <Columns>
                                                    <telerik:GridTemplateColumn DataField="OMIMID" FilterDelay="1000" HeaderText="search by ID" ShowFilterIcon="false" FilterControlToolTip="search by ID" CurrentFilterFunction="Contains" FilterControlWidth="100%">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lbn_OMIMID" Text='<%# Bind("OMIMID") %>' AutoPostBack="true" runat="server" UniqueName="lbn_OMIMID"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>


                                                    <telerik:GridTemplateColumn UniqueName="GoToHPO" Groupable="False" DataField="OMIM_Name" FilterDelay="1000" HeaderText="search by description" ShowFilterIcon="false" FilterControlToolTip="search by description" CurrentFilterFunction="Contains" FilterControlWidth="100%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="txt_OMIM_Name" Text='<%# Bind("OMIM_Name") %>' runat="server"></asp:Label>
                                                            <div style="float: right">
<%--                                                             <asp:Label ID="Label1" Text='<%# Eval("ALLHPO_OUTOF_IndividualHPOs") %>' runat="server" CssClass="HPOScore" ToolTip="All HPOs out of selected Individual HPOs"></asp:Label>--%>
                                                                  
                                                                &nbsp;
                                                                <asp:Label ID="HPO_count" Text='<%# Eval("HPO_Count") %>' runat="server" CssClass="bgHPO" ForeColor="#7394C7" ToolTip="No. HPO"></asp:Label>
                                                                <asp:Label ID="Gene_count" Text='<%# Eval("Gene_Count") %>' runat="server" CssClass="bgGene" ForeColor="#7394C7" ToolTip="No. Gene"></asp:Label>
                                                                <asp:ImageButton ID="GoToHPO" BorderWidth="0px" ImageUrl="../../img/icon/icon_HPO_min.png" Width="20px" Height="20px" CommandName="GoToOMIM_HPO"
                                                                    runat="server" ToolTip="HPO" Visible="false"></asp:ImageButton>
                                                                  <asp:ImageButton ID="IndividualHPO_outof_ALL" BorderWidth="0px" ImageUrl="../../img/icon/icon_HPO_min.png" Width="20px" Height="20px" CommandName="GoToIndiHPO_OMIM_Outof_AllHPOs"
                                                                    runat="server" ToolTip="HPO OMIM"></asp:ImageButton>
                                                                &nbsp;
                                                                <asp:ImageButton ID="GoToGene" BorderWidth="0px" ImageUrl="../../img/icon/icon_gene.png" Width="25px" Height="25px" CommandName="GoToOMIM_Gene"
                                                                    runat="server" ToolTip="Gene"></asp:ImageButton>
                                                            </div>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                </Columns>
                                            </MasterTableView>
                                            <PagerStyle Mode="NextPrev" Position="Bottom"></PagerStyle>
                                        </telerik:RadGrid>



                                    </telerik:RadPageView>

                                    <telerik:RadPageView ID="RPW_SelectedGene_Individual" runat="server" Height="700px">

                                        <%--                                        <div class="col-md-12" style="visibility: hidden">
                                          
                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="width: 95%">
                                                        <telerik:RadComboBox RenderMode="Lightweight" ID="RCB_Gene_Association" runat="server" AutoPostBack="True" DataSourceID="DS_SearchSelectedGene" EmptyMessage="Search For Gene ..."
                                                            DataTextField="Gene_Desc" DataValueField="Gene_Symbol" Width="100%" Height="150px" Filter="Contains" EnableAutomaticLoadOnDemand="true" ItemsPerRequest="5"
                                                            AppendDataBoundItems="true" ShowMoreResultsBox="true" EnableVirtualScrolling="true">
                                                        </telerik:RadComboBox>
                                                    </td>
                                                    <td style="width: 5%">
                                                        <telerik:RadButton RenderMode="Lightweight" runat="server" ID="RB_DeleteSearch_AssociatedGene" ToolTip="Delete search" OnClientClicked="RB_DeleteSearch_AssociatedGene_Clicked" Height="20px" Font-Size="Smaller">
                                                            <Icon PrimaryIconUrl="~/img/icon/icon_del-trash.gif" PrimaryIconWidth="20px" PrimaryIconHeight="20px" />
                                                        </telerik:RadButton>
                                                </tr>
                                            </table>
                                        </div>--%>

                                        <telerik:RadGrid RenderMode="Lightweight" ID="RG_Gene_Association" runat="server" AllowPaging="True" PageSize="13" Height="600px" AllowFilteringByColumn="true"
                                            RetainExpandStateOnRebind="True" CellPadding="0" DataSourceID="SDS_Gene_Association" Width="100%" OnItemCommand="RG_Gene_Association_ItemCommand"
                                            AutoGenerateColumns="False" Font-Size="Small" DataKeyNames="Gene_Symbol" OnItemDataBound="RG_Gene_Association_ItemDataBound" CssClass="Grid_No_Border_Padding RG_NO_Shadow"
                                            RefannosolvedRenderMode="Classic">
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                            <MasterTableView DataSourceID="SDS_Gene_Association" Name="Master" DataKeyNames="Gene_Symbol">
                                                <Columns>

                                                    <telerik:GridTemplateColumn DataField="Gene_Symbol" FilterDelay="1000" HeaderText="search by symbole" ShowFilterIcon="false" CurrentFilterFunction="Contains" FilterControlWidth="100%">
                                                         <ItemTemplate>
                                                            <asp:LinkButton ID="lbn_Gene_Symbol" Text='<%# Bind("Gene_Symbol") %>' AutoPostBack="true" runat="server" UniqueName="lbn_Gene_Symbol"></asp:LinkButton>


                                                            <div style="float: right">
                                                             <%--<asp:Label ID="Label1" Text='<%# Eval("ALLHPO_OUTOF_IndividualHPOs") %>' runat="server" CssClass="HPOScore" ToolTip="All HPOs out of selected Individual HPOs"></asp:Label>--%>
                                                                
                                                                <asp:Label ID="HPO_count" Text='<%# Eval("HPO_Count") %>' runat="server" CssClass="bgHPO" ForeColor="#7394C7" ToolTip="No. HPO"></asp:Label>
                                                                <asp:Label ID="OMIM_count" Text='<%# Eval("OMIM_Count") %>' runat="server" CssClass="bgOMIM" ForeColor="#7394C7" ToolTip="No. Disease"></asp:Label>
                                                              <%--  <asp:ImageButton ID="GoToGene_HPO" BorderWidth="0px" ImageUrl="../../img/icon/icon_HPO_min.png" Width="20px" Height="20px" CommandName="GoToGene_HPO"
                                                                    runat="server" ToolTip="HPO"></asp:ImageButton>--%>
                                                                   <asp:ImageButton ID="IndividualHPO_Gene_outof_ALL" BorderWidth="0px" ImageUrl="../../img/icon/icon_HPO_min.png" Width="20px" Height="20px" CommandName="GoToIndiHPO_Gene_Outof_AllHPOs"
                                                                    runat="server" ToolTip="HPO Gene"></asp:ImageButton>
                                                                &nbsp;
                                                            <asp:ImageButton ID="GoToGene_OMIM" BorderWidth="0px" ImageUrl="../../img/icon/icon_omim.png" Width="30px" Height="30px" CommandName="GoToGene_OMIM"
                                                                runat="server" ToolTip="Disease"></asp:ImageButton>
                                                            </div>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                </Columns>
                                            </MasterTableView>
                                            <FilterMenu RenderMode="Lightweight">
                                            </FilterMenu>
                                            <HeaderContextMenu RenderMode="Lightweight">
                                            </HeaderContextMenu>
                                            <PagerStyle Mode="NextPrev" Position="Bottom"></PagerStyle>
                                        </telerik:RadGrid>
                                    </telerik:RadPageView>
                                </telerik:RadMultiPage>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<asp:Button runat="server" ID="btn_addhpofromgraph" Text="" Style="display: none;" OnClick="btn_addhpofromgraph_Click" />
<asp:HiddenField runat="server" ID="hd_SelectedHPOfromGraph" />

<telerik:RadWindowManager ID="RadWindowManager2" ShowContentDuringLoad="true" RenderMode="Lightweight"
    ReloadOnShow="true" runat="server" EnableShadow="true"
    Skin="Windows7" AutoSize="false" VisibleStatusbar="false" VisibleTitlebar="false">
    <Windows>
        <telerik:RadWindow ID="RadWindow2" runat="server" RenderMode="Lightweight" BorderStyle="None" BorderWidth="1px" Width="600px" Height="450px" CssClass="px-0 pb-0" Modal="true">
        </telerik:RadWindow>
        <telerik:RadWindow ID="RadWindow1" runat="server" RenderMode="Lightweight" BorderStyle="None" BorderWidth="1px" CssClass="px-0 pb-0" Modal="true">
        </telerik:RadWindow>
    </Windows>
</telerik:RadWindowManager>



<asp:SqlDataSource ID="SDS_RCB_SearchHPO" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PhenBook_SearchHPO" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

<asp:SqlDataSource ID="SDS_HPO" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PhenBook_HPO_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="RCB_SearchHPO" Name="HPOID" PropertyName="SelectedValue" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SDS_SearchOMIM" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PhenBook_SearchOMIM" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

<asp:SqlDataSource ID="SDS_Inddiseasepheno" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PhenBook_Disease_HPOs_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="RCB_SearchOMIM" Name="OMIMID" PropertyName="SelectedValue" DefaultValue="" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SDS_RCB_SearchGene" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PhenBook_SearchGene" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
<asp:SqlDataSource ID="SDS_Gene" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PhenBook_Gene_HPO_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="RCB_SearchGene" Name="Gene_Symbol" PropertyName="SelectedValue" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
<%--<asp:SqlDataSource ID="DS_SearchSelectedHPO" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PhenBook_SearchSelectedHPO_ForIndividual" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="IndividualID" SessionField="IndividualID" Type="Int64" />
    </SelectParameters>
</asp:SqlDataSource>--%>

<asp:SqlDataSource ID="SDS_SelectedHPO" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PhenBook_Individual_HPOs_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="IndividualID" SessionField="IndividualID" Type="Int64" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterID" Type="String" />
        <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
        <asp:SessionParameter Name="HostID" SessionField="HostID" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<%--<asp:SqlDataSource ID="DS_SearchSelectedOMIM" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PhenBook_SearchSelectedOMIM_ForIndividual" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="IndividualID" SessionField="IndividualID" Type="Int64" />
    </SelectParameters>
</asp:SqlDataSource>--%>
<asp:SqlDataSource ID="SDS_OMIM_Association" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PhenBook_Individual_OMIMs_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="IndividualID" SessionField="IndividualID" Type="Int64" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterID" Type="String" />
        <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
        <asp:SessionParameter Name="HostID" SessionField="HostID" Type="Int32" />    </SelectParameters>
</asp:SqlDataSource>
<%--<asp:SqlDataSource ID="DS_SearchSelectedGene" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PhenBook_SearchSelectedGene_ForIndividual" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="IndividualID" SessionField="IndividualID" Type="Int64" />

    </SelectParameters>
</asp:SqlDataSource>--%>
<asp:SqlDataSource ID="SDS_Gene_Association" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PhenBook_Individual_Genes_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="IndividualID" SessionField="IndividualID" Type="Int64" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterID" Type="String" />
        <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
        <asp:SessionParameter Name="HostID" SessionField="HostID" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="Sql_DDL_Onset_Year" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Select '0' as Onset_Year, 0 as Onset_Year_val union  
 Select '1' , 1 union   Select '2' , 2 union   Select '3' , 3 union   Select '4' , 4 union   Select '5' , 5 union   Select '6' , 6 union   Select '7' , 7 union  
 Select '8' , 8 union   Select '9' , 9 union   Select '10' , 10 union   Select '11' , 11 union   Select '12' , 12 union  
 Select '13' , 13 union   Select '14' , 14 union   Select '15' , 15 union   Select '16' , 16 union   Select '17' , 17 union   Select '18' , 18 union   Select '19' , 19 union   Select '20' , 20 union   Select '21' , 21 union   Select '22' , 22 union   Select '23' , 23 union   Select '24' , 24 union   Select '25' , 25 union   Select '26' , 26 union   Select '27' , 27 union   Select '28' , 28 union  
 Select '29' , 29 union   Select '30' , 30 union   Select '31' , 31 union   Select '32' , 32 union   Select '33' , 33 union   Select '34' , 34 union   Select '35' , 35 union   Select '36' , 36 union   Select '37' , 37 union   Select '38' , 38 union   Select '39' , 39 union   Select '40' , 40 union   Select '41' , 41 union   Select '42' , 42 union   Select '43' , 43 union  
 Select '44' , 44 union   Select '45' , 45 union   Select '46' , 46 union   Select '47' , 47 union   Select '48' , 48 union   Select '49' , 49 union   Select '50' , 50 union   Select '51' , 51 union   Select '52' , 52 union   Select '53' , 53 union   Select '54' , 54 union   Select '55' , 55 union   Select '56' , 56 union   Select '57' , 57 union   Select '58' , 58 union  
 Select '59' , 59 union   Select '60' , 60 union   Select '61' , 61 union   Select '62' , 62 union   Select '63' , 63 union   Select '64' , 64 union   Select '65' , 65 union   Select '66' , 66 union   Select '67' , 67 union   Select '68' , 68 union   Select '69' , 69 union   Select '70' , 70 union   Select '71' , 71 union   Select '72' , 72 union   Select '73' , 73 union  
 Select '74' , 74 union   Select '75' , 75 union   Select '76' , 76 union   Select '77' , 77 union   Select '78' , 78 union   Select '79' , 79 union   Select '80' , 80 union   Select '81' , 81 union   Select '82' , 82 union   Select '83' , 83 union   Select '84' , 84 union   Select '85' , 85 union   Select '86' , 86 union   Select '87' , 87 union   Select '88' , 88 union  
 Select '89' , 89 union   Select '90' , 90 union   Select '91' , 91 union   Select '92' , 92 union   Select '93' , 93 union   Select '94' , 94 union   Select '95' , 95 union   Select '96' , 96 union   Select '97' , 97 union   Select '98' , 98 union   Select '99' , 99 union   Select '100' , 100 "></asp:SqlDataSource>
<asp:SqlDataSource ID="Sql_DDL_Onset_Month" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Select 0 as Onset_Month_val, '0' as Onset_Month union 
 Select 1 , '1' union   Select 2 , '2' union   Select 3 , '3' union   Select 4 , '4' union   Select 5 , '5' union   Select 6 , '6' union   Select 7 , '7' union  
 Select 8 , '8' union   Select 9 , '9' union   Select 10 , '10' union   Select 11 , '11' union   Select 12 , '12' "></asp:SqlDataSource>

<script src="../../Scripts/cytoscape.js"></script>
<script src="../../Scripts/cytoscape-panzoom.js"></script>

<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <script type="text/javascript">



        function clientValueChange(sender, eventArgs) {
            var grid = $find("<%= RG_SelectedHPO.ClientID %>");
            var sliderValue = sender.get_value();
            document.getElementById("<%= hdn_severityval.ClientID %>").value = sliderValue;
            var masterTable = grid.get_masterTableView();
            $telerik.$.grep(masterTable.get_dataItems(), function (item, index) {
                if ($telerik.$.contains(item.get_element(), sender.get_element()) == true) {
                    document.getElementById("<%= hdn_Hpoid.ClientID %>").value = item.getDataKeyValue("HPOID");
                    document.getElementById("<%= hdn_HpoStatus.ClientID %>").value = item.getDataKeyValue("HPO_Status");

                    masterTable.fireCommand("ChangeSeverity");
                }
            });
        }

        function DDL_Onset_year_SelectedIndexChanged(sender) {
            var grid = $find("<%= RG_SelectedHPO.ClientID %>");
            var Year_Value = sender.get_text();
            document.getElementById("<%= hdn_Onset_Year.ClientID %>").value = Year_Value;

            var masterTable = grid.get_masterTableView();
            $telerik.$.grep(masterTable.get_dataItems(), function (item, index) {
                if ($telerik.$.contains(item.get_element(), sender.get_element()) == true) {
                    document.getElementById("<%= hdn_Hpoid.ClientID %>").value = item.getDataKeyValue("HPOID");
                    masterTable.fireCommand("ChangeOnsetYear");
                }
            });
        }


        function DDL_Onset_month_SelectedIndexChanged(sender) {
            var grid = $find("<%= RG_SelectedHPO.ClientID %>");
            var month_Value = sender.get_text();
            document.getElementById("<%= hdn_Onset_Month.ClientID %>").value = month_Value;

            var masterTable = grid.get_masterTableView();
            $telerik.$.grep(masterTable.get_dataItems(), function (item, index) {
                if ($telerik.$.contains(item.get_element(), sender.get_element()) == true) {
                    document.getElementById("<%= hdn_Hpoid.ClientID %>").value = item.getDataKeyValue("HPOID");
                    masterTable.fireCommand("ChangeOnsetMonth");
                }
            });
        }


        function RB_History_Clicked(sender, args) {

            var h = $(document).height();
            var w = $(document).width();

            var oWnd = radopen("/PhenBook/Phenotypes_History.aspx", "RadWindow1");
            oWnd.set_height(0.8 * h);
            oWnd.set_width(0.9 * w);
            oWnd.center();
        }



        var defaults = {
            zoomFactor: 0.05, // zoom factor per zoom tick
            zoomDelay: 45, // how many ms between zoom ticks
            minZoom: 0.1, // min zoom level
            maxZoom: 10, // max zoom level
            fitPadding: 50, // padding when fitting
            panSpeed: 10, // how many ms in between pan ticks
            panDistance: 10, // max pan distance per tick
            panDragAreaSize: 75, // the length of the pan drag box in which the vector for panning is calculated (bigger = finer control of pan speed and direction)
            panMinPercentSpeed: 0.25, // the slowest speed we can pan by (as a percent of panSpeed)
            panInactiveArea: 8, // radius of inactive area in pan drag box
            panIndicatorMinOpacity: 0.5, // min opacity of pan indicator (the draggable nib); scales from this to 1.0
            zoomOnly: false, // a minimal version of the ui only with zooming (useful on systems with bad mousewheel resolution)
            fitSelector: undefined, // selector of elements to fit
            animateOnFit: function () { // whether to animate on fit
                return false;
            },
            fitAnimationDuration: 1000, // duration of animation on fit

            // icon class names
            sliderHandleIcon: 'fa fa-minus',
            zoomInIcon: 'fa fa-plus',
            zoomOutIcon: 'fa fa-minus',
            resetIcon: 'fa fa-expand'
        };


        function RCB_SearchHPO_DropDownOpening(sender, args) {
            var combo = $find('<%= RCB_SearchHPO.ClientID%>');
            combo.set_emptyMessage("");
            combo.clearSelection();
        }
        function RCB_SearchOMIM_DropDownOpening(sender, args) {
            var combo = $find('<%= RCB_SearchOMIM.ClientID%>');
            combo.set_emptyMessage("");
            combo.clearSelection();
        }
        function RCB_SearchGene_DropDownOpening(sender, args) {
            var combo = $find('<%= RCB_SearchGene.ClientID%>');
            combo.set_emptyMessage("");
            combo.clearSelection();
        }

        function OpenWin_HPO_OMIM() {

            var oWnd = radopen("/PhenBook/HPO_OMIM.aspx", "RadWindow2");
            oWnd.center();

        }
        function OpenWin_HPO_Gene() {

            var oWnd = radopen("/PhenBook/HPO_Gene.aspx", "RadWindow2");
            oWnd.center();

        }
        function OpenWin_IndivHpo_OMIM_outof_AllHPO() {

            var oWnd = radopen("/PhenBook/IndivHpo_OMIM_outof_AllHPO.aspx", "RadWindow2");
            oWnd.center();

        }

        function OpenWin_IndivHpo_Gene_outof_AllHPO() {

            var oWnd = radopen("/PhenBook/IndivHpo_Gene_outof_AllHPO.aspx", "RadWindow2");
            oWnd.center();

        }
        function OpenWin_OMIM_HPO() {

            var oWnd = radopen("/PhenBook/OMIM_HPO.aspx", "RadWindow2");
            oWnd.center();

        }
        function OpenWin_OMIM_Gene() {

            var oWnd = radopen("/PhenBook/OMIM_Gene.aspx", "RadWindow2");
            oWnd.center();

        }
        function OpenWin_Gene_HPO() {

            var oWnd = radopen("/PhenBook/Gene_HPO.aspx", "RadWindow2");
            oWnd.center();

        }
        function OpenWin_Gene_OMIM() {

            var oWnd = radopen("/PhenBook/Gene_OMIM.aspx", "RadWindow2");
            oWnd.center();

        }

        //start//--------------------Cytoscape-------------------------//



        function draw_tree_parent() {

            var toggleButton = $find("<%=RB_Hpo_Tree_Parent.ClientID%>");


            var _json_de_node = 0;
            var _json_de_edge = 0;
            var rn = $.Deferred();
            var re = $.Deferred();

            var combo = $find('<%= RCB_SearchHPO.ClientID%>');

            var hpo = combo.get_value();

            document.getElementById("<%= hd_SelectedHPOfromGraph.ClientID %>").value = hpo;


            var list = [hpo];
            var jsonText = JSON.stringify({ list: list });
            var _nodeedge = function () {
                jQuery.ajax({
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    data: jsonText,
                    async: true,
                    dataType: 'JSON',
                    url: '/PhenBook/Service/se_PhenBook.asmx/getPhenotypeNodes',
                    success: function (result) {
                        _json_de_node = $.parseJSON(result.d);

                        rn.resolve();
                    },
                    error: function () {
                        alert('Error on binding the data');
                    }
                });

                jQuery.ajax({
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    data: jsonText,
                    async: true,
                    dataType: 'JSON',
                    url: '/PhenBook/Service/se_PhenBook.asmx/getPhenotypeEdges',
                    success: function (result) {
                        _json_de_edge = $.parseJSON(result.d);
                        re.resolve();
                    },
                    error: function () {
                        alert('Error on binding the data');

                    }
                });

                return $.Deferred(function (def) {
                    $.when(rn, re).done(function () {
                        def.resolve();
                    });
                });
            };

            var _grapg = function () {
                elesJson = {
                    nodes: _json_de_node,
                    edges: _json_de_edge
                };

                if (_json_de_node == 0) {

                    document.getElementById('Cy_Hpo_graph').innerHTML = "";
                    document.getElementById('Cy_Hpo_graph').innerHTML = "there is no Parent for this HPO term";
                    document.getElementById('Cy_Hpo_graph').style.color = "red";
                    document.getElementById('Cy_Hpo_graph').style.textAlign = "center";
                    document.getElementById('Cy_Hpo_graph').style.padding = "10px";
                } else {

                    document.getElementById('Cy_Hpo_graph').style.textAlign = "left";
                    document.getElementById('Cy_Hpo_graph').style.padding = "0px";

                    // container: document.getElementById('Cy_Hpo_graph'),
                    var t = document.getElementById('Cy_Hpo_graph');
                    var cy = window.cy = cytoscape({
                        container: document.getElementById('Cy_Hpo_graph'),
                        boxSelectionEnabled: false,
                        autounselectify: true,
                        style: cytoscape.stylesheet()
                            .selector('node')
                            .style({
                                'content': 'data(lable)',
                                'text-wrap': 'wrap',
                                'text-max-width': '150',
                                'background-color': '#33cccc',
                                'text-outline-color': '#222'
                            })
                            .selector('edge')
                            .style({
                                'curve-style': 'bezier',
                                'target-arrow-shape': 'triangle',
                                'width': 4,
                                'line-color': '#ddd',
                                'target-arrow-color': '#ddd'
                            })
                            .selector('node[id = "' + hpo + '"]')
                            .css({
                                'background-color': '#336699',
                                'line-color': 'red',
                                'target-arrow-color': 'red',
                                'source-arrow-color': 'red',
                                'opacity': 1
                            })
                            .selector('.faded')
                            .css({
                                'opacity': 0.25,
                                'text-opacity': 0
                            }),
                        elements: elesJson,
                        layout: {
                            name: 'breadthfirst',
                            fit: true, // whether to fit the viewport to the graph
                            directed: true, // whether the tree is directed downwards (or edges can point in any direction if false)
                            padding: 30, // padding on fit
                            circle: false, // put depths in concentric circles if true, put depths top down if false
                            grid: false, // whether to create an even grid into which the DAG is placed (circle:false only)
                            spacingFactor: 1.0, // positive spacing factor, larger => more space between nodes (N.B. n/a if causes overlap)
                            boundingBox: undefined, // constrain layout bounds; { x1, y1, x2, y2 } or { x1, y1, w, h }
                            avoidOverlap: true, // prevents node overlap, may overflow boundingBox if not enough space
                            nodeDimensionsIncludeLabels: false, // Excludes the label when calculating node bounding boxes for the layout algorithm
                            roots: undefined, // the roots of the trees
                            maximal: false, // whether to shift nodes down their natural BFS depths in order to avoid upwards edges (DAGS only)
                            animate: false, // whether to transition the node positions
                            animationDuration: 500, // duration of animation in ms if enabled
                            animationEasing: undefined, // easing of animation if enabled,
                            animateFilter: function (node, i) { return true; }, // a function that determines whether the node should be animated.  All nodes animated by default on animate enabled.  Non-animated nodes are positioned immediately when the layout starts
                            ready: undefined, // callback on layoutready
                            stop: undefined, // callback on layoutstop
                            transform: function (node, position) { return position; }

                        }
                    });
                    cy.panzoom(defaults);

                }
                cy.on('click', 'node', selectedNodeHandler);

            };
            _nodeedge().done(_grapg);


        }
        function draw_tree_child() {

            var toggleButton = $find("<%=RB_Hpo_Tree_Child.ClientID%>");
           var toggleButton = $find("<%=RB_Hpo_Tree_Parent.ClientID%>");
            toggleButton.set_selectedToggleStateIndex(1);

            var _json_de_node_child = 0;
            var _json_de_edge_child = 0;

            var rn_Child = $.Deferred();
            var re_Child = $.Deferred();

            var combo = $find('<%= RCB_SearchHPO.ClientID%>');
            var hpo = combo.get_value();
            document.getElementById("<%= hd_SelectedHPOfromGraph.ClientID %>").value = hpo;
            var list = [hpo];
            var jsonText = JSON.stringify({ list: list });
            console.log("jsonText: " + jsonText)



            var _nodeedge_Child = function () {
                jQuery.ajax({
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    data: jsonText,
                    async: true,
                    dataType: 'JSON',
                    url: '/PhenBook/Service/se_PhenBook.asmx/getPhenotypeNodes_child',
                    success: function (result) {
                        _json_de_node_child = $.parseJSON(result.d);
                        console.log("eee : "+result.d);
                        rn_Child.resolve();
                    },
                    error: function () {
                        alert('Error on binding v the data');
                    }
                });

                jQuery.ajax({
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    data: jsonText,
                    async: true,
                    dataType: 'JSON',
                    url: '/PhenBook/Service/se_PhenBook.asmx/getPhenotypeEdges_child',
                    success: function (result) {
                        _json_de_edge_child = $.parseJSON(result.d);
                        console.log("dd : " + result.d);
                        re_Child.resolve();
                    },
                    error: function () {
                        alert('Error on binding dsda the data');

                    }
                });

                return $.Deferred(function (def) {
                    $.when(rn_Child, re_Child).done(function () {
                        def.resolve();
                    });
                });
            };

            var _grapg_Child = function () {
                elesJson = {
                    nodes: _json_de_node_child,
                    edges: _json_de_edge_child
                };

                if (_json_de_node_child == 0) {

                    document.getElementById('Cy_Hpo_graph').innerHTML = "";
                    document.getElementById('Cy_Hpo_graph').innerHTML = "There is no child for this HPO term";
                    document.getElementById('Cy_Hpo_graph').style.color = "red";
                    document.getElementById('Cy_Hpo_graph').style.textAlign = "center";
                    document.getElementById('Cy_Hpo_graph').style.padding = "10px";


                } else {
                    document.getElementById('Cy_Hpo_graph').style.textAlign = "left";
                    document.getElementById('Cy_Hpo_graph').style.padding = "0px";
                    var cy = window.cy = cytoscape({
                        container: document.getElementById('Cy_Hpo_graph'),
                        boxSelectionEnabled: false,
                        autounselectify: true,
                        style: cytoscape.stylesheet()
                            .selector('node')
                            .style({
                                'content': 'data(lable)',
                                'text-wrap': 'wrap',
                                'text-max-width': '150',
                                'background-color': '#009999',
                                'text-outline-color': '#222'
                            })
                            .selector('edge')
                            .style({
                                'curve-style': 'bezier',
                                'target-arrow-shape': 'triangle',
                                'width': 4,
                                'line-color': '#ddd',
                                'target-arrow-color': '#ddd'
                            })
                            .selector('node[id = "' + hpo + '"]')
                            .css({
                                'background-color': '#336699',
                                'line-color': 'red',
                                'target-arrow-color': 'red',
                                'source-arrow-color': 'red',
                                'opacity': 1
                            })
                            .selector('.faded')
                            .css({
                                'opacity': 0.25,
                                'text-opacity': 0
                            }),
                        elements: elesJson,
                        layout: {
                            name: 'breadthfirst',
                            fit: true, // whether to fit the viewport to the graph
                            directed: true, // whether the tree is directed downwards (or edges can point in any direction if false)
                            padding: 30, // padding on fit
                            circle: false, // put depths in concentric circles if true, put depths top down if false
                            grid: false, // whether to create an even grid into which the DAG is placed (circle:false only)
                            spacingFactor: 1.0, // positive spacing factor, larger => more space between nodes (N.B. n/a if causes overlap)
                            boundingBox: undefined, // constrain layout bounds; { x1, y1, x2, y2 } or { x1, y1, w, h }
                            avoidOverlap: true, // prevents node overlap, may overflow boundingBox if not enough space
                            nodeDimensionsIncludeLabels: false, // Excludes the label when calculating node bounding boxes for the layout algorithm
                            roots: undefined, // the roots of the trees
                            maximal: false, // whether to shift nodes down their natural BFS depths in order to avoid upwards edges (DAGS only)
                            animate: false, // whether to transition the node positions
                            animationDuration: 500, // duration of animation in ms if enabled
                            animationEasing: undefined, // easing of animation if enabled,
                            animateFilter: function (node, i) { return true; }, // a function that determines whether the node should be animated.  All nodes animated by default on animate enabled.  Non-animated nodes are positioned immediately when the layout starts
                            ready: undefined, // callback on layoutready
                            stop: undefined, // callback on layoutstop
                            transform: function (node, position) { return position; }

                        }
                    });
                    cy.panzoom(defaults);
                }
                cy.on('click', 'node', selectedNodeHandler);



            };
            _nodeedge_Child().done(_grapg_Child);

        }

        var selectedNodeHandler = function (evt) {
            var target = evt.cyTarget;
            document.getElementById("<%= hd_SelectedHPOfromGraph.ClientID %>").value = target.id();
            document.getElementById("<%= btn_addhpofromgraph.ClientID %>").click();
        };


        function HPO_Selected(sender, args) {

            document.getElementById('Div_Tree_Hpo_Content').style.visibility = 'visible';

            draw_tree_parent();
            var toggleParent = $find("<%=RB_Hpo_Tree_Parent.ClientID%>");
            toggleParent.set_selectedToggleStateIndex(0);
            var togglechild = $find("<%=RB_Hpo_Tree_Child.ClientID%>");
            togglechild.set_selectedToggleStateIndex(1);


        }

   <%--     function RB_DeleteSearch_SelectedHPO_Clicked() {
            var grid = $find("<%= RG_SelectedHPO.ClientID %>");
            master = grid.get_masterTableView();
            var Com = $find("<%= RCB_SelectedHPO.ClientID %>");
            Com.clearSelection();
            Com.value = -1;
            master.rebind();
        }



        function RB_DeleteSearch_AssociatedOMIM_Clicked() {
            var grid = $find("<%= RG_OMIM_Association.ClientID %>");
            master = grid.get_masterTableView();
            var Com = $find("<%= RCB_OMIM_Association.ClientID %>");
            Com.clearSelection();
            Com.value = -1;
            master.rebind();
        }

        function RB_DeleteSearch_AssociatedGene_Clicked() {
            var grid = $find("<%= RG_Gene_Association.ClientID %>");
            master = grid.get_masterTableView();
            var Com = $find("<%= RCB_Gene_Association.ClientID %>");
            Com.clearSelection();
            Com.value = -1;
            master.rebind();
        }--%>

         //end//--------------------Cytoscape-------------------------//
    </script>
</telerik:RadScriptBlock>


<%--  --%>