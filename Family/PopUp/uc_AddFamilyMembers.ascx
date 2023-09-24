<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_AddFamilyMembers.ascx.cs" Inherits="WebGAP.PhenBook.PopUp.uc_AddFamilyMembers" %>
<link href=".././assets/css/AddFamilyMem_style.css" rel="stylesheet" type="text/css" media="screen" runat="server" />
<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <ClientEvents OnRequestStart="onRequestStart"></ClientEvents>
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="Btn_AddFamilyMember">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Btn_AddFamilyMember" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="Has_Spouse">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Has_Spouse" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>
<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <script type="text/javascript">
        function onRequestStart(sender, args) {

            if (args.get_eventTarget().indexOf("Btn_AddFamilyMember") >= 0) {
                args.set_enableAjax(false);
            }

        }

        function GetRadWindow() {
            var oWindow = null;
            if (window.radWindow) oWindow = window.radWindow;
            else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
            return oWindow;
        }

        function btn_cacel_click() {
            GetRadWindow().close(0);

        }

        function Btn_AddFamilyMember_Clicked(sender, args) {
      
            var HasSpouse = '<%= Session["proband_Hasspouse"]%>'
            console.log("Has_Spouse" + HasSpouse);
            var array = [];
            array[0] = $find("<%= Num_Brothers.ClientID %>").get_value();
            array[1] = $find("<%= Num_Sisters.ClientID %>").get_value();
            array[4] = $find("<%= Num_MUncles.ClientID  %>").get_value();
            array[5] = $find("<%= Num_MAunts.ClientID  %>").get_value();
            array[6] = $find("<%= Num_FUncles.ClientID  %>").get_value();
            array[7] = $find("<%= Num_FAunts.ClientID  %>").get_value(); 
            if (HasSpouse[0]== 0) {
                array[8] = document.getElementById("Has_Spouse").value;
                if (array[8] == 0) {
                    array[2] = 0; // no son
                    array[3] = 0;  // no daughter
                }
                else {
                    array[2] = $find("<%= Num_Sons.ClientID %>").get_value();
                    array[3] = $find("<%= Num_Daughters.ClientID  %>").get_value();
                }
            }
            if (HasSpouse[0] == 1) {
                  array[8] = 0; 
                  array[2] = $find("<%=Num_son_hasalreadyMOM.ClientID  %>").get_value();
                  array[3] = $find("<%=Num_daughter_hasalreadyMOM.ClientID  %>").get_value();
            }
            GetRadWindow().close(array);
        }



    </script>
</telerik:RadScriptBlock>


<div class="card" style="height: 630px">
    <div class="card-bodypopup ">
        <div class="form">
            <div class="form-body">
                <div class="card-block">
                    <h4 class="form-sectionpopup">Add Family Member</h4>
                </div>
           
                <ul class="FamilyMember_ListIemGroup list-group-flush_MemberFamily">
                      <li class="FamilyMember_ListIemGroup">
                        <div class="row">
                            <div class="col-10">
                                <span id="tag_Hasspouse" class="blueBg_FamilyMember">⚭</span>
                                <label id="lblfor_Has_Spouse" style="padding-left: 17px;">Proband has spouse?</label>
                            </div>
                            <div class="col-2">
                                <input type="image" id="Has_Spouse" src="../../img/icon/Proband_HasNotspouse.png" value="0"  style="margin-bottom: -5px; " >
                                
                            </div>
                        </div>
                          <div class="demo-container size-wide no-bg" style=" font-size: 13px !important; visibility: visible; display: none; overflow: hidden;">
                    <telerik:RadPanelBar RenderMode="Lightweight" runat="server" ID="RPB_Spouse" ExpandMode="FullExpandedItem" Height="65" Width="99%" CssClass="Rad_Panel_hidden">
                        <Items>
                            <telerik:RadPanelItem Value="clps" Expanded="true">
                                <ContentTemplate>
                                    <telerik:RadMultiPage runat="server" ID="RMP_NewFilter" SelectedIndex="0">
                                        <telerik:RadPageView runat="server" ID="RPV_NewFilter">
                                            <table class="tbl-container" runat="server" style="margin-left: 50px; width: 100%; margin: 0 auto; background-color: whitesmoke">
                                                <tbody>
                                                    <tr>
                                                        <td style="padding-left: 20px">
                                                            <span class="blueBg_FamilyMember_small">⤷</span>
                                                            <label class=".riLabel  pl-1">How many sons does she/he have?</label>
                                                        </td>
                                                        <td style="float:right">
                                                            <telerik:RadNumericTextBox RenderMode="Lightweight" runat="server" ID="Num_Sons" Value="0" Width="75px" Font-Size="Small" EmptyMessage="Enter units count" MinValue="0"
                                                                ShowSpinButtons="true" NumberFormat-DecimalDigits="0">
                                                            </telerik:RadNumericTextBox><br />
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td style="padding-left: 20px">
                                                            <span class="blueBg_FamilyMember_small">⤷</span>
                                                            <label class=".riLabel pl-1">How many daughters does she/he have?	</label>

                                                        </td>
                                                        <td style="float:right">
                                                            <telerik:RadNumericTextBox RenderMode="Lightweight" runat="server" ID="Num_Daughters" Value="0" Width="75px" Font-Size="Small"  EmptyMessage="Enter units count" MinValue="0"
                                                                ShowSpinButtons="true" NumberFormat-DecimalDigits="0">
                                                            </telerik:RadNumericTextBox><br />
                                                        </td>

                                                    </tr>

                                                </tbody>
                                            </table>
                                        </telerik:RadPageView>
                                    </telerik:RadMultiPage>
                                </ContentTemplate>
                            </telerik:RadPanelItem>
                        </Items>
                        <ExpandAnimation Type="Linear" />
                        <CollapseAnimation Type="Linear" />
                    </telerik:RadPanelBar>
                </div>
                    </li>

                    <li class="FamilyMember_ListIemGroup">
                        <div class="row">
                            <div class="col-10">
                                <span class="blueBg_FamilyMember">∷</span>
                                <label class=".riLabel pl-1">How many brothers does she/he have? </label>
                            </div>
                            <div class="col-2">
                                <telerik:RadNumericTextBox RenderMode="Lightweight" runat="server" ID="Num_Brothers" Value="0" Width="75px" Font-Size="Small" EmptyMessage="Enter units count" MinValue="0"
                                    ShowSpinButtons="true" NumberFormat-DecimalDigits="0">
                                </telerik:RadNumericTextBox><br />
                            </div>
                        </div>
                    </li>
                    <li class="FamilyMember_ListIemGroup">
                        <div class="row">
                            <div class="col-10">
                                <span class="blueBg_FamilyMember">∷</span>
                                <label class=".riLabel pl-1">How many sisters does she/he have?</label>
                            </div>
                            <div class="col-2">
                                <telerik:RadNumericTextBox RenderMode="Lightweight" runat="server" ID="Num_Sisters" Value="0" Width="75px" Font-Size="Small" EmptyMessage="Enter units count" MinValue="0"
                                    ShowSpinButtons="true" NumberFormat-DecimalDigits="0" CssClass="test">
                                </telerik:RadNumericTextBox><br />
                            </div>
                        </div>
                    </li>

                    <li class="FamilyMember_ListIemGroup">
                        <div class="row">
                            <div class="col-10">
                                <span class="blueBg_FamilyMember">∷</span>
                                <label class=".riLabel  pl-1">How many brothers does her/his mother have? (her/his uncles)	</label>
                            </div>
                            <div class="col-2">
                                <telerik:RadNumericTextBox RenderMode="Lightweight" runat="server" ID="Num_MUncles" Value="0" Width="75px" Font-Size="Small" EmptyMessage="Enter units count" MinValue="0"
                                    ShowSpinButtons="true" NumberFormat-DecimalDigits="0">
                                </telerik:RadNumericTextBox><br />
                            </div>
                        </div>
                    </li>
                    <li class="FamilyMember_ListIemGroup">
                        <div class="row">
                            <div class="col-10  pl-1">
                                <span class="blueBg_FamilyMember">∷</span>
                                <label class=".riLabel  pl-1">How many sisters does her/his mother have? (her/his aunts)	</label>
                            </div>
                            <div class="col-2">
                                <telerik:RadNumericTextBox RenderMode="Lightweight" runat="server" ID="Num_MAunts" Value="0" Width="75px" Font-Size="Small" EmptyMessage="Enter units count" MinValue="0"
                                    ShowSpinButtons="true" NumberFormat-DecimalDigits="0">
                                </telerik:RadNumericTextBox><br />
                            </div>
                        </div>
                    </li>
                    <li class="FamilyMember_ListIemGroup">
                        <div class="row">
                            <div class="col-10">
                                <span class="blueBg_FamilyMember">∷</span>
                                <label class=".riLabel  pl-1">How many brothers does her/his father have? (her/his uncles) </label>
                            </div>
                            <div class="col-2">
                                <telerik:RadNumericTextBox RenderMode="Lightweight" runat="server" ID="Num_FUncles" Value="0" Width="75px" Font-Size="Small" EmptyMessage="Enter units count" MinValue="0"
                                    ShowSpinButtons="true" NumberFormat-DecimalDigits="0">
                                </telerik:RadNumericTextBox><br />
                            </div>
                        </div>
                    </li>
                    <li class="FamilyMember_ListIemGroup">
                        <div class="row">
                            <div class="col-10">
                                <span class="blueBg_FamilyMember">∷</span>
                                <label class=".riLabel  pl-1">How many sisters does her/his father have? (her/his aunts) </label>
                            </div>
                            <div class="col-2">
                                <telerik:RadNumericTextBox RenderMode="Lightweight" runat="server" ID="Num_FAunts" Value="0" Width="75px" Font-Size="Small" EmptyMessage="Enter units count" MinValue="0"
                                    ShowSpinButtons="true" NumberFormat-DecimalDigits="0">
                                </telerik:RadNumericTextBox><br />
                            </div>
                        </div>
                    </li>
                    <li class="FamilyMember_ListIemGroup" id="Li_son" style="visibility: hidden">
                        <div class="row">
                            <div class="col-10">
                                <span class="blueBg_FamilyMember">∷</span>
                                <label class=".riLabel pl-1">How many son does she/he have? </label>
                            </div>
                            <div class="col-2">
                                <telerik:RadNumericTextBox RenderMode="Lightweight" runat="server" ID="Num_son_hasalreadyMOM" Value="0" Width="75px" Font-Size="Small" EmptyMessage="Enter units count" MinValue="0"
                                    ShowSpinButtons="true" NumberFormat-DecimalDigits="0">
                                </telerik:RadNumericTextBox><br />
                            </div>
                        </div>
                    </li>
                    <li class="FamilyMember_ListIemGroup" id="Li_daughter" style="visibility: hidden">
                        <div class="row">
                            <div class="col-10">
                                <span class="blueBg_FamilyMember">∷</span>
                                <label class=".riLabel pl-1">How many daughter does she/he have?</label>
                            </div>
                            <div class="col-2">
                                <telerik:RadNumericTextBox RenderMode="Lightweight" runat="server" ID="Num_daughter_hasalreadyMOM" Value="0" Width="75px" Font-Size="Small" EmptyMessage="Enter units count" MinValue="0"
                                    ShowSpinButtons="true" NumberFormat-DecimalDigits="0">
                                </telerik:RadNumericTextBox><br />
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>



    </div>
    <div class="form-actionspopup center" style="height: 20%; display: flex; flex-direction: row; justify-content: center; padding: 4px 4px 4px 4px; font-size: smaller;">
        <div>
            <telerik:RadButton ID="Btn_AddFamilyMember" runat="server" Text="Add" AutoPostBack="true" 
                Width="155px" Style="top: 1px; left: 0px; margin-bottom: 8px;" OnClientClicked="Btn_AddFamilyMember_Clicked">
            </telerik:RadButton>
            <%--     <asp:Button ID="Btn_AddFamilyMember" Text="Add" runat="server" CausesValidation="true" class="btn btn-danger mr-1 ladda-button btn-sm" OnClientClick="Btn_AddFamilyMember_Clicked();return false;"></asp:Button>
  --%>
        </div>
        &nbsp;
   <div>
       <asp:Button ID="btn_cacel" Text="Cancel" runat="server" CausesValidation="true" class="btn btn-danger mr-1 ladda-button btn-sm" OnClientClick="btn_cacel_click();return false;"></asp:Button>
   </div>
    </div>
</div>
<asp:SqlDataSource runat="server" ID="DS_FamilyType" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="select * from [dbo].[Tbl_FamilyMemberType]" SelectCommandType="Text"></asp:SqlDataSource>

<telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
    <script type="text/javascript">
        function pageLoad() {

            var HasSpouse = '<%= Session["proband_Hasspouse"]%>';

          
     
            if (HasSpouse[0] == 1) { 
       
                document.getElementById("Li_daughter").style.visibility = "visible";
                document.getElementById("Li_son").style.visibility = "visible";
                document.getElementById("Has_Spouse").style.visibility = "hidden";
                document.getElementById("lblfor_Has_Spouse").style.visibility = "hidden";
                document.getElementById("tag_Hasspouse").style.visibility = "hidden";
            }
        }

        Sys.Application.add_load(function () {
            demo.leftPanel = $get('<%=RPB_Spouse.ClientID %>');
            demo.leftButton = document.getElementById("Has_Spouse");
            demo.initialize();
        });

        (function () {
            var demo = window.demo = window.demo || {};

            demo.initialize = function () {
                var leftPanel = demo.leftPanel;
                var leftButton = demo.leftButton;

                if (leftPanel) {
                    SetUpAnimation(leftButton, Telerik.Web.UI.jSlideDirection.Right, leftPanel);
                }
            }

            window.SetUpAnimation = function (button, direction, element) {
                element.style.position = "relative";

                var expanded = false;

                var expandAnimation = new Telerik.Web.UI.AnimationSettings({});
                var collapseAnimation = new Telerik.Web.UI.AnimationSettings({});

                var slide = new Telerik.Web.UI.jSlide(element, expandAnimation, collapseAnimation, false);

                slide.initialize();

                slide.set_direction(direction);

                button.onclick = function () {
                    element.parentNode.style.visibility = "visible";
                    element.parentNode.style.display = "block";

                    if (!expanded) {

                        slide.expand();
                        demo.leftButton.src = "../../img/icon/Proband_Hasspouse.png";
                        demo.leftButton.value = 1;
                    }
                    else {
                        slide.collapse();
                        demo.leftButton.src = "../../img/icon/Proband_HasNotspouse.png";
                        demo.leftButton.value = 0;
                    }
                    expanded = !expanded;
                    return false;
                }
            };
        }())

    </script>
</telerik:RadScriptBlock>
