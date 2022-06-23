<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_PI_Dataset_Requested.ascx.cs" Inherits="WebGAP.ACL.uc.uc_PI_Dataset_Requested" %>


<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="DDL_Centers">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_Centers" />
                  <telerik:AjaxUpdatedControl ControlID="DDL_PIs" />
                <telerik:AjaxUpdatedControl ControlID="RG_DataSet" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
           <telerik:AjaxSetting AjaxControlID="DDL_PIs">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_PIs" />
                <telerik:AjaxUpdatedControl ControlID="RG_DataSet" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RG_DataSet">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_DataSet" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>

<script type="text/javascript" id="telerikClientEvents1">
    function RG_ActivateUsers_OnColumnMouseOut(sender, args) {
    }
</script>

<div class="content-header row">
    <div class="content-header-left col-md-6 col-12">
        <h3 class="content-header-title">
            <asp:PlaceHolder runat="server"><%: Page.Title %> </asp:PlaceHolder>
        </h3>
    </div>
    <div class="content-header-right col-md-6 col-12">
        <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
           <div class="btn-group" role="group">
               <div>
                 <telerik:RadComboBox RenderMode="Lightweight" runat="server" ID="DDL_Centers" 
                    DataTextField="CenterDesc" DataValueField="CenterID" DropDownWidth="200px" OnSelectedIndexChanged="DDL_Centers_SelectedIndexChanged"
                    HighlightTemplatedItems="true" Height="140px" AutoPostBack="true" Width="100%">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container, "Attributes['CenterID']")%>
                    </ItemTemplate>
                </telerik:RadComboBox>
               </div>
               <div style="padding-left:10px">
                <telerik:RadComboBox RenderMode="Lightweight" runat="server" ID="DDL_PIs"
                    DataTextField="PIName" DataValueField="PIID" DropDownWidth="200px" 
                    HighlightTemplatedItems="true" Height="140px" AutoPostBack="true" Width="100%">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container, "Attributes['PIID']")%>
                    </ItemTemplate>
                </telerik:RadComboBox>
                   </div>
            </div>
        </div>
    </div>
</div>

<div class="content-body pt-1">
    <section id="basic-form-layouts">
        <div class="row match-height">
            <telerik:RadGrid RenderMode="Lightweight" ID="RG_DataSet" runat="server" GridLines="Both" OnItemCommand="RG_DataSet_ItemCommand"
                AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="-1" Height="700px"
                ShowStatusBar="True" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" DataSourceID="DS_DataSet" 
                AllowAutomaticUpdates="True">
                <PagerStyle Mode="NextPrevAndNumeric" AlwaysVisible="true" />
                <MasterTableView CommandItemDisplay="None" DataSourceID="DS_DataSet" Name="Master" AutoGenerateColumns="false" EditFormSettings-PopUpSettings-KeepInScreenBounds="true" DataKeyNames="ReqID,DatasetID">
                    <CommandItemSettings ShowRefreshButton="false" />
                    <Columns>
                         <telerik:GridBoundColumn UniqueName="ReqID" HeaderText="Req. ID" DataField="ReqID" FilterControlAltText="Filter Req. ID column" SortExpression="ReqID">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Smaller" />
                        </telerik:GridBoundColumn>
                        
                        <telerik:GridBoundColumn UniqueName="DatasetID" HeaderText="Dataset ID" DataField="DatasetID" FilterControlAltText="Filter DatasetID column" SortExpression="DatasetID">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Smaller" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn UniqueName="DataSetName" DataField="DataSetName" FilterControlAltText="Filter DataSetName column" HeaderText="Dataset Name" SortExpression="DataSetName" ReadOnly="True">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Smaller" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn UniqueName="UserFullName" DataField="UserFullName" FilterControlAltText="Filter UserFullName column" HeaderText="User Asked" SortExpression="DatasetDesc" ReadOnly="True">
                            <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Smaller" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn UniqueName="ReqDate" DataField="ReqDate" FilterControlAltText="Filter ReqDate column" HeaderText="Req. Date" SortExpression="ReqDate" ReadOnly="True">
                            <HeaderStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Smaller" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn UniqueName="ReqDesc" DataField="ReqDesc" FilterControlAltText="Filter ReqDesc column" HeaderText="Req. Desc." SortExpression="DatasetDesc" ReadOnly="True">
                            <HeaderStyle Width="40%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="40%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Smaller" />
                        </telerik:GridBoundColumn>
                     <telerik:GridTemplateColumn>
                         <ItemTemplate>
                              <asp:ImageButton CssClass="Status_Yes" ID="AA_yes" ImageUrl="/img/icon/icon_yes_gray.png" BorderWidth="0px" CommandName="SelYes" ToolTip="Accept" runat="server" Height="15px" OnClientClick="return confirm('Are you sure you want to accept it?')" ></asp:ImageButton>
                               <asp:ImageButton CssClass="Status_No" ID="AA_no" CommandName="SelNo" ImageUrl="/img/icon/icon_no_gray.png" BorderWidth="0px" ToolTip="Reject" runat="server" Height="15px" OnClientClick="return confirm('Are you sure you want to reject it?')"></asp:ImageButton>
                                                               
                         </ItemTemplate>
                     </telerik:GridTemplateColumn>
                    </Columns>
                
                </MasterTableView>
                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <ClientSettings EnableRowHoverStyle="true" Selecting-AllowRowSelect="false">
                    <ClientEvents OnColumnMouseOut="RG_ActivateUsers_OnColumnMouseOut"></ClientEvents>
                    <Selecting AllowRowSelect="true" />
                    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                </ClientSettings>
                <FilterMenu RenderMode="Lightweight"></FilterMenu>
                <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
            </telerik:RadGrid>
        </div>
    </section>
</div>



<asp:SqlDataSource ID="DS_DataSet" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PI_Dataset_IsAsked_Permission_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDL_PIs" Name="PIID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
    </SelectParameters>
</asp:SqlDataSource>


<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <script type="text/javascript">
      
    </script>
    </telerik:RadScriptBlock>

