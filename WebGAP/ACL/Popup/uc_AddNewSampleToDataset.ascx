<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_AddNewSampleToDataset.ascx.cs" Inherits="WebGAP.ACL.Popup.uc_AddNewSampleToDataset" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <ClientEvents OnRequestStart="onRequestStart"></ClientEvents>
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RLB_AllSamples">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_AllSamples" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RLB_Sample" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
         <telerik:AjaxSetting AjaxControlID="RLB_Sample">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RLB_Sample" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RLB_AllSamples" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="btn_Insert">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btn_Insert" />
                <telerik:AjaxUpdatedControl ControlID="RLB_AllSamples" LoadingPanelID="RadAjaxLoadingPanel1" />
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

    function onRequestStart(sender, args) {

        if (args.get_eventTarget().indexOf("btn_Insert") >= 0) {
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
        <form class="form">
            <div class="form-body">
                <h4 class="form-sectionpopup"><i class="ft-user"></i>Add Sample to Dataset</h4>
                <div class="row">
                    <div class="col-6">
                        <div>

                            <telerik:RadListBox runat="server" ID="RLB_AllSamples" Height="300px" Width="100%" AllowTransfer="true" 
                                TransferToID="RLB_Sample" ToolTip="Available sample" DataValueField="SampleID" DataTextField="SLS"
                                TransferMode="Move" Skin="Web20" DataSourceID="SDS_AllSamples" SelectionMode="Multiple" ><%-- AutoPostBackOnTransfer="true" OnTransferred="RLB_AllSamples_Transferred"--%>
                                <ButtonSettings TransferButtons="All" ShowTransfer="true"></ButtonSettings>
                                <EmptyMessageTemplate>
                                    There is No Sample
                                </EmptyMessageTemplate>
                               <HeaderTemplate>
                                    <span style="width: 89px; font-weight:bold; float:left">Sample ID</span>
                                    <span style="width: 80px; font-weight:bold; float:left">Seq Type</span>
                                    <span style="width: 90px; font-weight:bold; ">Local ID</span>
                                </HeaderTemplate>
                                
                               <%-- <ItemTemplate>
                                        <span style="width: 120px;"><%# DataBinder.Eval(Container, "Value") %></span>
                                        <span style="width: 120px;"><%# DataBinder.Eval(Container, "Text") %></span>
                                </ItemTemplate>--%>
                              
                            </telerik:RadListBox>

                        </div>
                    </div>
                    <div class="col-6">
                        <div>
                            <telerik:RadListBox runat="server" ID="RLB_Sample" Height="300px" Width="100%" ToolTip="Active Dataset"
                                Skin="Web20" AutoPostBack="True" SelectionMode="Multiple">
                               <HeaderTemplate>
                                    <span style="width: 89px; font-weight:bold; float:left">Sample ID</span>
                                    <span style="width: 80px; font-weight:bold; float:left">Seq Type</span>
                                    <span style="width: 90px; font-weight:bold; ">Local ID</span>
                                </HeaderTemplate>
                               <%-- 
                                <ItemTemplate>
                                        <span style="width: 120px;"><%# DataBinder.Eval(Container, "Value") %></span>
                                        <span style="width: 120px;"><%# DataBinder.Eval(Container, "Text") %></span>
                                </ItemTemplate>--%>
                            </telerik:RadListBox>


                        </div>
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
            <div style="text-align: center; font-size: small; padding-top: 5px;">
                <telerik:RadLabel runat="server" ID="RL_feedback" ForeColor="Red"></telerik:RadLabel>
            </div>
        </form>

    </div>
</div>

<asp:SqlDataSource ID="SDS_AllSamples" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_DS_All_Sample_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="CenterID" SessionField="CenterID_DatasetSample" Type="Int32" />
        <asp:SessionParameter Name="PIID" SessionField="PIID_DatasetSample" Type="Int32" />
        <asp:SessionParameter Name="DatasetID" SessionField="DatasetID_Sample" Type="Int32" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
    </SelectParameters>

</asp:SqlDataSource>

