<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_AskDatasetPermission_Sample.ascx.cs" Inherits="WebGAP.Management.Popup.uc_AskDatasetPermission_Sample" %>


<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="Txt_Desc">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Txt_Desc" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>

<div class="row">
    <div class="col-md-12 ">
        <div class="card">

            <div class="card-body">
                <div class="card-block">
                    <div class="form form-horizontal">
                        <div class="form-body">
                            <label for="Txt_Desc">Comments</label>
                            <telerik:RadTextBox Width="100%" ID="Txt_Desc" runat="server" TextMode="MultiLine" Resize="None" EmptyMessage="type here" Height="240px">
                            </telerik:RadTextBox>
                            <div class="form-actions m-0 pt-1 pb-0 center">
                                <asp:Button ID="btn_Req" ValidationGroup="SubmitGroup" Text="Submit" class="btn btn-success mr-1 ladda-button btn-sm" data-style="expand-right"
                                    runat="server" OnClick="btn_Req_Click"></asp:Button>&nbsp;
                                <asp:Button ID="btn_Cancle" Text="Cancel" runat="server" CausesValidation="False" class="btn btn-danger mr-1 ladda-button btn-sm"
                                    OnClientClick="btn_cacel_click(); return false;" data-style="expand-right"></asp:Button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

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
        GetRadWindow().close();

    }

</script>