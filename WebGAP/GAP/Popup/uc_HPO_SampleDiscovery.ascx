<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_HPO_SampleDiscovery.ascx.cs" Inherits="WebGAP.GAP.Popup.uc_HPO_SampleDiscovery" %>

<link href=".././assets/css/HpoSampleDisc_style.css" rel="stylesheet" type="text/css" media="screen" runat="server" />

<telerik:RadAjaxManager runat="server" ID="RadAjaxManager1" EnablePageHeadUpdate="false">
    <AjaxSettings>
        
         <telerik:AjaxSetting AjaxControlID="RG_SelectedHPO">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_SelectedHPO" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_OMIM_Association">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_OMIM_Association" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_Gene_Association">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_Gene_Association" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>


<div class="card  match-height">
    <div class="card-content  show">
        <div class="card-body">
            <div class="form">
                <h4 class="form-sectionpopup">Individual ID:  <%=  Session["IndividualID_For_HPO_SampleDiscovery"].ToString() %> </h4>
                <telerik:RadTabStrip ID="RTS_HPO_Indidivdual" runat="server" RenderMode="Lightweight" SelectedIndex="0" MultiPageID="MP_Individual_Phenotypes" Font-Bold="True" Width="100%"
                    CausesValidation="False" ResolvedRenderMode="Classic" ScrollChildren="True" BorderWidth="0px" Skin="Silk" CssClass="RTS_PhenBook_HPO_OMIM_GENE_Padding">
                    <Tabs>
                        <telerik:RadTab Text="Selected HPO Terms" Font-Size="Small" Width="33%">
                        </telerik:RadTab>
                        <telerik:RadTab Text="Associated Disease" Font-Size="Small" Width="33%">
                        </telerik:RadTab>
                        <telerik:RadTab Text="Associated Gene" Font-Size="Small" Width="33%">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>

                <telerik:RadMultiPage ID="MP_Individual_Phenotypes" CssClass="RadMultiPage" runat="server" BorderWidth="0px" SelectedIndex="0" Height="100%" Style="overflow: hidden">

                    <telerik:RadPageView ID="RPW_SelectedHPO_Individual" runat="server" Height="100%">

<%--                        <telerik:RadComboBox RenderMode="Lightweight" ID="RCB_SelectedHPO" runat="server" AutoPostBack="True" DataSourceID="DS_SearchSelectedHPO" EnableViewState="false"                          
                            DataTextField="HPO_Name" DataValueField="HPOID" Width="100%" Height="150px" Filter="Contains" EmptyMessage="Search for Hpo..." CssClass="pt-2 "
                            AppendDataBoundItems="true">
                        </telerik:RadComboBox>--%>

                        <asp:HiddenField runat="server" ID="hdn_severityval" />
                        <asp:HiddenField runat="server" ID="hdn_Hpoid" />
                        <asp:HiddenField runat="server" ID="hdn_HpoStatus" />

                        <telerik:RadGrid RenderMode="Lightweight" ID="RG_SelectedHPO" runat="server"  AllowPaging="true" PageSize="7" AllowFilteringByColumn="true"
                            CellPadding="0" DataKeyNames="HPOID" OnItemDataBound="RG_SelectedHPO_ItemDataBound" CssClass=" pt-2 RG_Min_height" ShowStatusBar="false"
                            AutoGenerateColumns="False" Font-Size="Small" DataSourceID="SDS_SelectedHPO">

                            <MasterTableView Name="Master" DataSourceID="SDS_SelectedHPO" DataKeyNames="HPOID,HPO_Status"  ClientDataKeyNames="HPOID,HPO_Status" AllowFilteringByColumn="True">
                                <Columns>
                                    <telerik:GridTemplateColumn DataField="HPOID" FilterDelay="1000" HeaderText="search by ID" ShowFilterIcon="false" FilterControlToolTip="search by ID" CurrentFilterFunction="Contains" FilterControlWidth="100%" >
                                        <ItemTemplate>
                                            
                                            <asp:HiddenField runat="server" ID="hdn_HPO_Status" Value='<%# Bind("HPO_Status") %>' />
                                            <asp:Label ID="txt_HPO_Status" runat="server" Width="5px" Height="5px"></asp:Label>
                                            <asp:LinkButton ID="lbn_HPOID" Text='<%# Bind("HPOID") %>' soitoPostBack="true" runat="server" UniqueName="lbn_HPOID"></asp:LinkButton>
                                            <asp:Label ID="txt_HPO_Name" Text='<%# Eval("HPO_Name") %>' runat="server"></asp:Label>
                                               
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn DataField="HPO_Name"  UniqueName="Severity" HeaderText="search by description"  FilterDelay="1000" ShowFilterIcon="false" FilterControlToolTip="Search by description" CurrentFilterFunction="Contains" FilterControlWidth="100%" >
                                        <ItemStyle  VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" />
                                        <ItemTemplate>
                                            <div style="margin-bottom:5px; width:20%; float:left">
                                           <asp:Label runat="server" Text="Onset Year/Month: " ></asp:Label>
                                           <asp:Label runat="server" Text='<%# Eval("Onset_Year") + "/"+ Eval("Onset_Month") %>' ></asp:Label>
                                                </div>
                                            <div style="display: inline-flex">
                                                <asp:HiddenField runat="server" ID="hdn_severityvaforshow" Value='<%# Eval("HPO_Severity") %>' />
                                                <telerik:RadSlider RenderMode="Lightweight" ID="RS_Severity" runat="server" Orientation="Horizontal"
                                                    LargeChange="1" TrackPosition="TopLeft" ShowIncreaseHandle="false" AutoPostBack="true" Enabled="false"
                                                    ShowDecreaseHandle="false" Width="190" ItemType="item" Font-Size="X-Small" Height="25" Skin="Web20" CssClass="TicksSlider ml-1 mr-1">
                                                    <Items>
                                                        <telerik:RadSliderItem Text="Mild" ToolTip="Mild" runat="server" Value="0"></telerik:RadSliderItem>
                                                        <telerik:RadSliderItem Text="Moderate" ToolTip="Moderate" runat="server" Value="1"></telerik:RadSliderItem>
                                                        <telerik:RadSliderItem Text="Severe" ToolTip="Sevier" runat="server" Value="2"></telerik:RadSliderItem>
                                                    </Items>
                                                </telerik:RadSlider>
                                                <asp:ImageButton ID="AA_yes" ImageUrl="/img/icon/icon_yes_gray.png" BorderWidth="0px" ToolTip="Yes" runat="server" CssClass="RadGrid_img_NoCursor" Height="20" ></asp:ImageButton>
                                                <asp:ImageButton ID="AA_no" ImageUrl="/img/icon/icon_no_gray.png" BorderWidth="0px" ToolTip="No" runat="server" CssClass="RadGrid_img_NoCursor" Height="20"></asp:ImageButton>
                                                <asp:ImageButton ID="AA_na" ImageUrl="/img/icon/icon_NA_gray.png" BorderWidth="0px" ToolTip="Not Applicable" runat="server" CssClass="RadGrid_img_NoCursor" Height="20"></asp:ImageButton>
                                       
                                        </ItemTemplate>

                                    </telerik:GridTemplateColumn>
                         
                                </Columns>
                            </MasterTableView>
                            <PagerStyle Mode="NextPrev" Position="Bottom"></PagerStyle>
                        </telerik:RadGrid>

                    </telerik:RadPageView>

                    <telerik:RadPageView ID="RPW_SelectedOMIM_Individual" runat="server" Height="100%">

                     <%--   <telerik:RadComboBox RenderMode="Lightweight" ID="RCB_OMIM_Association" runat="server" AutoPostBack="True" DataSourceID="DS_SearchSelectedOMIM" EmptyMessage="Search For OMIM term ..."
                            DataTextField="OMIM_Desc" DataValueField="OMIMID" Width="100%" Height="20px" Filter="Contains" CssClass="pt-2"
                            AppendDataBoundItems="true">
                        </telerik:RadComboBox>--%>

                        <telerik:RadGrid RenderMode="Lightweight" ID="RG_OMIM_Association" runat="server"  AllowPaging="true" PageSize="7" CssClass=" pt-2 RG_Min_height"
                            RetainExpandStateOnRebind="True" CellPadding="0" DataSourceID="SDS_OMIM_Association" Width="100%" OnItemDataBound="RG_OMIM_Association_ItemDataBound"
                            AutoGenerateColumns="False" Font-Size="Small" DataKeyNames="OMIMID" AllowFilteringByColumn="true"
                            RefannosolvedRenderMode="Classic">

                            <MasterTableView Name="Master" DataSourceID="SDS_OMIM_Association" DataKeyNames="OMIMID">
                                <Columns>
                                    <telerik:GridTemplateColumn DataField="OMIMID" FilterDelay="1000" HeaderText="search by ID" ShowFilterIcon="false" FilterControlToolTip="search by ID" CurrentFilterFunction="Contains" FilterControlWidth="100%">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbn_OMIMID" Text='<%# Bind("OMIMID") %>' AutoPostBack="true" runat="server" UniqueName="lbn_OMIMID"></asp:LinkButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn DataField="OMIM_Name" FilterDelay="1000" HeaderText="search by description" ShowFilterIcon="false" FilterControlToolTip="search by description" CurrentFilterFunction="Contains" FilterControlWidth="100%">
                                        <ItemTemplate>
                                            <asp:Label ID="txt_OMIM_Name" Text='<%# Bind("OMIM_Name") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                </Columns>
                            </MasterTableView>
                            <PagerStyle Mode="NextPrev" Position="Bottom"></PagerStyle>
                        </telerik:RadGrid>
                    </telerik:RadPageView>

                    <telerik:RadPageView ID="RPW_SelectedGene_Individual" runat="server" Height="100%">

                       <%-- <telerik:RadComboBox RenderMode="Lightweight" ID="RCB_Gene_Association" runat="server" AutoPostBack="True" DataSourceID="DS_SearchSelectedGene" EmptyMessage="Search For Gene term ..."
                            DataTextField="Gene_Desc" DataValueField="Gene_Symbol" Width="100%" Height="150px" Filter="Contains" CssClass="pt-2"
                            AppendDataBoundItems="true">
                        </telerik:RadComboBox>--%>
                        <telerik:RadGrid RenderMode="Lightweight" ID="RG_Gene_Association" runat="server"  AllowPaging="True" PageSize="7" CssClass=" pt-2 RG_Min_height"
                            RetainExpandStateOnRebind="True" CellPadding="0" DataSourceID="SDS_Gene_Association" Width="100%" AllowFilteringByColumn="true"
                            AutoGenerateColumns="False" Font-Size="Small" DataKeyNames="Gene_Symbol" OnItemDataBound="RG_Gene_Association_ItemDataBound"
                            RefannosolvedRenderMode="Classic">
                            <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                            <MasterTableView DataSourceID="SDS_Gene_Association" Name="Master" DataKeyNames="Gene_Symbol">
                                <Columns>
                                    <telerik:GridTemplateColumn DataField="Gene_Symbol" FilterDelay="1000" HeaderText="search by symbole" ShowFilterIcon="false"  CurrentFilterFunction="Contains" FilterControlWidth="100%">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbn_Gene_Symbol" Text='<%# Bind("Gene_Symbol") %>' AutoPostBack="true" runat="server" UniqueName="lbn_Gene_Symbol"></asp:LinkButton>

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
        <div class="form-actionspopup center">
            <asp:Button ID="btn_cacel" Text="Close" runat="server" OnClientClick="CloseWindow(); return false;"
                class="btn btn-danger mr-1 ladda-button btn-sm"></asp:Button>
        </div>
    </div>
</div>


<asp:SqlDataSource ID="SDS_SelectedHPO" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PhenBook_Individual_HPOs_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="IndividualID" SessionField="IndividualID_For_HPO_SampleDiscovery" Type="Int64" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterID" Type="String" />
        <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
        <asp:SessionParameter Name="HostID" SessionField="HostID" Type="Int32" DefaultValue="-1" />

    </SelectParameters>
</asp:SqlDataSource>
<%--<asp:SqlDataSource ID="DS_SearchSelectedOMIM" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PhenBook_SearchSelectedOMIM_ForIndividual" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="IndividualID" SessionField="IndividualID_For_HPO_SampleDiscovery" Type="Int64" />
    </SelectParameters>
</asp:SqlDataSource>--%>
<asp:SqlDataSource ID="SDS_OMIM_Association" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PhenBook_Individual_OMIMs_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="IndividualID" SessionField="IndividualID_For_HPO_SampleDiscovery" Type="Int64" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterID" Type="String" />
        <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
        <asp:SessionParameter Name="HostID" SessionField="HostID" Type="Int32" DefaultValue="-1"/>
    </SelectParameters>
</asp:SqlDataSource>
<%--<asp:SqlDataSource ID="DS_SearchSelectedGene" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PhenBook_SearchSelectedGene_ForIndividual" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="IndividualID" SessionField="IndividualID_For_HPO_SampleDiscovery" Type="Int64" />
    </SelectParameters>
</asp:SqlDataSource>--%>
<asp:SqlDataSource ID="SDS_Gene_Association" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PhenBook_Individual_Genes_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="IndividualID" SessionField="IndividualID_For_HPO_SampleDiscovery" Type="Int64" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterID" Type="String" />
        <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
        <asp:SessionParameter Name="HostID" SessionField="HostID" Type="Int32" DefaultValue="-1"/>
    </SelectParameters>
</asp:SqlDataSource>

<telerik:RadScriptBlock runat="server" ID="RadScriptBlock1">
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
</telerik:RadScriptBlock>
