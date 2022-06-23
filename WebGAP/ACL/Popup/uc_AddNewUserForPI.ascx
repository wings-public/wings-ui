<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_AddNewUserForPI.ascx.cs" Inherits="WebGAP.ACL.Popup.uc_AddNewUserForPI" %>


<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <ClientEvents OnRequestStart="onRequestStart"></ClientEvents>
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RLB_AllUsers">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_AllUsers" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="btn_Insert">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btn_Insert" />
                <telerik:AjaxUpdatedControl ControlID="RLB_AllUsers" LoadingPanelID="RadAjaxLoadingPanel1" />
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

    function CloseModal() {
        var oWnd = GetRadWindow();
        oWnd.close();
    }

    function btn_cacel_click() {
        GetRadWindow().close();
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
                <h4 class="form-sectionpopup"><i class="ft-user"></i>Add User</h4>
                <div class="row">
                    <div class="col-6">
                        <div>
                            <telerik:RadListBox runat="server" ID="RLB_AllUsers" Height="300px" Width="100%" AllowTransfer="true"
                                TransferToID="RLB_User"  DataValueField="UserID" DataTextField="UserFullName"
                                TransferMode="Move" Skin="Web20" DataSourceID="SDS_AllUsers">
                                <ButtonSettings TransferButtons="All"></ButtonSettings>
                                <EmptyMessageTemplate>
                                    There is No User
                                </EmptyMessageTemplate>
                          
                            </telerik:RadListBox>
                        </div>
                    </div>
                    <div class="col-6">
                        <div>
                            <telerik:RadListBox runat="server" ID="RLB_User" Height="300px" Width="100%"
                                Skin="Web20" AutoPostBack="True">
                            </telerik:RadListBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-actionspopup center" style="height: 20%; display: flex; flex-direction: row; justify-content: center; padding: 4px 4px 4px 4px; font-size: smaller;">
                <div>
                    <telerik:RadButton RenderMode="Lightweight" ID="btn_Insertt" runat="server" Text="Insert" OnClick="btn_Insert_Click">
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


<asp:SqlDataSource ID="SDS_AllUsers" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_PU_All_User_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="CenterID" SessionField="PU_Center" Type="Int16" />
        <asp:SessionParameter Name="PIID" SessionField="PU_PI" Type="Int16" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int16" />
    </SelectParameters>

</asp:SqlDataSource>

