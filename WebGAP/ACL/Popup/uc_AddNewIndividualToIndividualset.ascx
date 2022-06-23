<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_AddNewIndividualToIndividualset.ascx.cs" Inherits="WebGAP.ACL.Popup.uc_AddNewIndividualToIndividualset" %>

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
     <ClientEvents OnRequestStart="onRequestStart"></ClientEvents>
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RCB_AllIndividuals">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RCB_AllIndividuals" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="btn_Insert">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btn_Insert" />
                <telerik:AjaxUpdatedControl ControlID="RLB_AllIndividuals" LoadingPanelID="RadAjaxLoadingPanel1" />
                  <telerik:AjaxUpdatedControl ControlID="RL_feedback" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>

<script type="text/javascript">
    function GetRadWindow() {
        var oWindow = null;
        if (window.radWindow) oWindow = window.radWindow;
        else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
        return oWindow;
    }
    function btn_cacel_click() {
        GetRadWindow().close();
    }


    function CloseModal() {
        var oWnd = GetRadWindow();
        if (oWnd) setTimeout(function () { oWnd.close(); }, 1500);
    }

    function onRequestStart(sender, args) {

        if (args.get_eventTarget().indexOf("btn_Insert") >= 0) {
            args.set_enableAjax(false);
        }
    }
</script>

<div class="card-content collapse show">
    <div class="card-bodypopup">
        <form class="form">
            <div class="form-body">
                <h4 class="form-sectionpopup"><i class="ft-user"></i>Add Individual to Individualset</h4>
                <div class="row">
                    <div class="col-6">
                        <div>
                            <telerik:RadListBox runat="server" ID="RLB_AllIndividuals" Height="200px" Width="100%" AllowTransfer="true"
                                TransferToID="RLB_Individual" ToolTip="Available Dataset" DataValueField="IndividualID" DataTextField="IndividualID"
                                TransferMode="Move" Skin="Web20" DataSourceID="SDS_AllIndividuals">
                                <ButtonSettings TransferButtons="All"></ButtonSettings>
                                <EmptyMessageTemplate>
                                    There is No Individual
                                </EmptyMessageTemplate>
                             
                            </telerik:RadListBox>
                        </div>
                    </div>
                    <div class="col-6">
                        <telerik:RadListBox runat="server" ID="RLB_Individual" Height="200px" Width="100%"
                            Skin="Web20" AutoPostBack="True">
                        </telerik:RadListBox>
                    </div>
                </div>
            </div>
            <div class="form-actionspopup center" style="height: 20%; display: flex; flex-direction: row; justify-content: center; padding: 4px 4px 4px 4px; font-size: smaller;">
                <div>
                    <telerik:RadButton RenderMode="Lightweight" ID="btn_Insert" runat="server" Text="Insert" OnClick="btn_Insert_Click">
                    </telerik:RadButton>
                </div>
                &nbsp;
                <div>
                    <asp:Button ID="btn_cacel" Text="Cancel" runat="server" CausesValidation="true" class="btn btn-danger mr-1 ladda-button btn-sm" OnClientClick="btn_cacel_click();return false;"></asp:Button>
                </div>
            </div>
             <div style="text-align: center; font-size:small; padding-top:5px;">
                <telerik:RadLabel runat="server" ID="RL_feedback" ForeColor="Red"></telerik:RadLabel>
            </div>
        </form>

    </div>
</div>


<asp:SqlDataSource ID="SDS_AllIndividuals" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_II_All_Individual_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="CenterID" SessionField="Individualset_Individuals_Center" Type="Int32" />
        <asp:SessionParameter Name="PIID" SessionField="Individualset_Individuals_PI" Type="Int32" />
        <asp:SessionParameter Name="IndividualsetID" SessionField="Individualset_Individuals_SetID" Type="Int32" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
    <script type="text/javascript">

        function pageLoad() {
           var h = $(document).height();

            var RLB_AIndividual = $find("<%=RLB_AllIndividuals.ClientID%>");
            var RLB_SIndividual = $find("<%=RLB_Individual.ClientID%>");
            var NewH = 0.70 * h;
            if (h < 350) {
                alert(h);
                 RLB_AIndividual.get_element().style.height = "175px";
                 RLB_AIndividual._groupElement.style.height = "175px";
                 RLB_SIndividual.get_element().style.height = "175px";
                 RLB_SIndividual._groupElement.style.height = "175px";
            }
            else
            {
                RLB_AIndividual.get_element().style.height = NewH + "px";
                RLB_AIndividual._groupElement.style.height = NewH + "px";
                RLB_SIndividual.get_element().style.height = NewH + "px";
                RLB_SIndividual._groupElement.style.height = NewH + "px";

            }

        }

    </script>
</telerik:RadCodeBlock>
