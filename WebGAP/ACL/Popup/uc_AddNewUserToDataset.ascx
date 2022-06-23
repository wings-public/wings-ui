<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_AddNewUserToDataset.ascx.cs" Inherits="WebGAP.ACL.Popup.uc_AddNewUserToDataset" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <ClientEvents OnRequestStart="onRequestStart"></ClientEvents>
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RLB_AllUsers">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_AllUsers"  />
                <telerik:AjaxUpdatedControl ControlID="RLB_User" LoadingPanelID="RadAjaxLoadingPanel1"  />
            </UpdatedControls>
        </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RLB_User">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_User"  />
                <telerik:AjaxUpdatedControl ControlID="RLB_AllUsers" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="btn_Insertt">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btn_Insertt" />
                <telerik:AjaxUpdatedControl ControlID="RLB_AllUsers" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RL_feedback" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>

        <telerik:AjaxSetting AjaxControlID="DDL_Centers">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="DDL_Centers" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RLB_AllUsers" LoadingPanelID="RadAjaxLoadingPanel1" />
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

    function onRequestStart(sender, args) {

        if (args.get_eventTarget().indexOf("btn_Insertt") >= 0) {
            args.set_enableAjax(false);
        }
    }

    function CloseModal() {
        var oWnd = GetRadWindow();
        oWnd.close();
    }



</script>

<div class="card-content collapse show">
    <div class="card-bodypopup">
        <div class="form content-body" >
            <div class="form-body">
                <div class="row pb-1">
                    <div class="col-9">
                        <h4><i class="ft-user"></i>Add User to Dataset</h4>
                    </div>
                    <div class="col-3" style="text-align: right;">
                        <asp:DropDownList ID="DDL_Centers" runat="server" Width="150px"
                            AppendDataBoundItems="True" AutoPostBack="true" DataTextField="CenterDesc" DataValueField="CenterID" DataSourceID="Ds_Centers"
                            class="btn mr-1 mb-1 dropdown-toggle dropdown-menu-right btn-sm">
                        </asp:DropDownList>
                    </div>

                </div>
                <div class="form-sectionpopup"></div>
                <div class="row">
                    <div class="col-6">
                        <div>
                            <telerik:RadListBox runat="server" ID="RLB_AllUsers" Width="100%" AllowTransfer="true" DataSourceID="SDS_AllUsers" 
                                DataTextField="UserFullName" DataValueField="UserID" Height="300px" 
                                TransferToID="RLB_User" ToolTip="Available Dataset"   TransferMode="Move" Skin="Web20" >
                                <ButtonSettings TransferButtons="All"></ButtonSettings>
                                <EmptyMessageTemplate>
                                    There is No User
                                </EmptyMessageTemplate>
                        
                            </telerik:RadListBox>
                        </div>
                    </div>
                    <div class="col-6">
                        <div>
                            <telerik:RadListBox runat="server" ID="RLB_User"  Height="300px" Skin="Web20" Width="100%" >
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
            <div style="text-align: center; font-size: small; padding-top: 5px;">
                <telerik:RadLabel runat="server" ID="RL_feedback" ForeColor="Red"></telerik:RadLabel>
            </div>
        </div>

    </div>
</div>
<asp:SqlDataSource ID="SDS_AllUsers" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_DU_Sel_All_Users" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="DatasetID" SessionField="DatasetID_User" Type="Int16"  />
        <asp:ControlParameter ControlID="DDL_Centers" Name="CenterID" PropertyName="SelectedValue" DefaultValue="-1" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="Ds_Centers" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_Center_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
