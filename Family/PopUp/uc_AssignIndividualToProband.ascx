<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_AssignIndividualToProband.ascx.cs" Inherits="WebGAP.PhenBook.PopUp.uc_AssignIndividualToProband" %>
<link href=".././assets/css/AssIndvToProb_style.css" rel="stylesheet" type="text/css" media="screen" runat="server" />

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_Individuals">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_Individuals" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>

<div class="content-body pt-1">
    <div class="card-content collapse show">
        <div class="card-bodypopup">
            <form class="form">
                <div class="form-body">
                    <h4 class="form-sectionpopup"><i class="ft-user"></i>Assign Individual </h4>
                    <script type="text/javascript" id="telerikClientEvents1">
                        function RG_Individuals_OnColumnMouseOut(sender, args) {
                        }
                    </script>
                    <telerik:RadGrid RenderMode="Lightweight" ID="RG_Individuals" runat="server" GridLines="none" BorderWidth="0"
                         AllowSorting="True" AutoGenerateColumns="False"  Height="350px" CellSpacing="0" OnItemCommand="RG_Individuals_ItemCommand"
                        ShowStatusBar="True" DataKeyNames="IndividualID,IndividualSex,IndividualFName, IndividualLName, IndividualBirthDate, IndividualStatus, LocalID,SampleID" Font-Size="X-Small" OnItemDataBound="RG_Individuals_ItemDataBound"
                        DataSourceID="Ds_Individuals">
                        
                        <MasterTableView CommandItemDisplay="None" DataSourceID="Ds_Individuals" Name="Master" AutoGenerateColumns="false" ClientDataKeyNames="IndividualID,IndividualSex,IndividualFName, IndividualLName, IndividualBirthDate, IndividualStatus, LocalID">
                            <Columns>
                                <telerik:GridBoundColumn DataField="IndividualID" DataType="System.Int64" FilterControlAltText="Filter IndividualID column" HeaderText="Individual ID" SortExpression="IndividualID" UniqueName="IndividualID">
                                    <HeaderStyle Width="35%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="35%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                
                                    <telerik:GridBoundColumn DataField="LocalID" FilterControlAltText="Filter LocalID column" HeaderText="Local ID" SortExpression="LocalID" UniqueName="LocalID">
                                    <HeaderStyle Width="35%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="35%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn DataType="System.int32" DataField="IndividualSex" UniqueName="IndividualSex" Groupable="False" EnableHeaderContextMenu="false"
                                    HeaderText="Gender" FilterControlAltText="Filter IndividualSex column">
                                    <HeaderStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                   
                                        <asp:HiddenField runat="server" ID="hdn_Gender" Value='<%# Bind("IndividualSex") %>' />
                                        <asp:ImageButton ID="Genderbtn" BorderWidth="0px" Width="30px" runat="server" Enabled="false" CssClass="ImgBtn_DisablePointer"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="IndividualStatus" FilterControlAltText="Filter IndividualStatus column" EnableHeaderContextMenu="false"
                                    HeaderText="Status" SortExpression="IndividualStatus" UniqueName="IndividualStatus" ReadOnly="true">
                                    <HeaderStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:HiddenField runat="server" ID="hdn_Status" Value='<%# Eval("IndividualStatus") %>' />
                                        <asp:ImageButton ID="Statusbtn" BorderWidth="0px" Width="30px" runat="server" Enabled="false" CssClass="ImgBtn_DisablePointer"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="AddIndividual" Groupable="False" AllowFiltering="false" ShowFilterIcon="false" EnableHeaderContextMenu="false">
                                    <HeaderStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="X-Small" Height="15px"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="AddIndividual" BorderWidth="0px" ImageUrl="~/img/icon/icon_AddPeople.png" Width="25px" Height="25px"
                                            ToolTip="Assign Individual" 
                                            runat="server"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                            </Columns>
                            <PagerStyle AlwaysVisible="True"></PagerStyle>
                        </MasterTableView>
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings EnableRowHoverStyle="true"  EnablePostBackOnRowClick="true">
                            <Selecting AllowRowSelect="true" />
                            <ClientEvents OnColumnMouseOut="RG_Individuals_OnColumnMouseOut" ></ClientEvents>
                            <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                        </ClientSettings>
                        <FilterMenu RenderMode="Lightweight"></FilterMenu>
                        <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                    </telerik:RadGrid>
                </div>
                <div class="form-actionspopup center" style="height: 20%">
                    <asp:Button ID="btn_cacel" Text="Cancel" runat="server" OnClientClick="CloseWindow(); return false;"
                        class="btn btn-danger mr-1 ladda-button btn-sm"></asp:Button>
                </div>
            </form>
        </div>
    </div>
    </div>



    <asp:SqlDataSource ID="Ds_Individuals" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
        SelectCommand="Sp_IndividualsForFamily_sel" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="CenterID" SessionField="Current_CenterID" Type="Int32" />
            <asp:SessionParameter Name="PIID" SessionField="Current_PIID" Type="Int32" />
            <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
            <asp:SessionParameter Name="FamilyMemberTypeID" SessionField="FamilyMemberTypeID" Type="String" />
             <asp:SessionParameter Name="ProbandID" SessionField="ProbandID" Type="Int64" DefaultValue="-1" />
            

        </SelectParameters>
    </asp:SqlDataSource>

    <telerik:RadScriptBlock runat="server" ID="RadScriptBlock1">
    <script>

            function returnToParent(IndividualID, Gender, individual, IndividualFName, IndividualLName, IndividualBirthDate, IndividualStatus ) {
           
                var oWnd = GetRadWindow();
                var array = {};
                array[0] = IndividualID;
                array[1] = Gender;
                array[2] = IndividualFName;
                array[3] = IndividualLName;
                array[4] = IndividualBirthDate;
                array[5] = IndividualStatus;
                array[6] = individual;
             

            

                oWnd.close(array);
            }

            function GetRadWindow() {
                var oWindow = null;
                if (window.radWindow) oWindow = window.radWindow;
                else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
                return oWindow;
            }
            function CloseWindow() {
                var oWindow = GetRadWindow();  //Obtaining a reference to the current window 
                oWindow.Close(0);
            }
    </script>
    </telerik:RadScriptBlock>w