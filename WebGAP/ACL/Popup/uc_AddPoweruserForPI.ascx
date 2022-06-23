<%@ Control Language="C#" CodeBehind="uc_AddPoweruserForPI.ascx.cs" Inherits="WebGAP.ACL.Popup.uc_AddPoweruserForPI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

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
        if (oWnd) setTimeout(function () { oWnd.close(); }, 1500);
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
                <h4 class="form-sectionpopup"><i class="ft-user"></i>Add User to Dataset</h4>
                <div class="row">
                    <div class="col-6">
                        <div>
                            <telerik:RadListBox runat="server" ID="RLB_AllUsers" Height="200px" Width="100%" AllowTransfer="true"
                                TransferToID="RLB_User"  ToolTip="Available Dataset" DataValueField="UserID" DataTextField="UserFullName"
                                TransferMode="Move" Skin="Web20" DataSourceID="SDS_AllUsers">
                                <ButtonSettings TransferButtons="All"></ButtonSettings>
                                <EmptyMessageTemplate>
                                    There is No User
                                </EmptyMessageTemplate>
                                <HeaderTemplate>
                                    <itemtemplate>
                           <table style="width: 100%; ">
                              <tr>
                                <td style="width:20%; vertical-align: middle; text-align: left">
                                     User ID
                                  </td>
                                  <td style="width:40%; vertical-align: middle; text-align: left">
                                    User Name
                                 </td>
                                 <td style="width:40%; vertical-align: middle; text-align: left">
                                    Center
                                 </td>
                                </tr>
                           </table>
                        </itemtemplate>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <table style="width: 100%;">
                                        <tr>
                                            <td style="width: 20%; vertical-align: middle; text-align: left">
                                                <%# DataBinder.Eval(Container.DataItem, "UserID")%>
                                            </td>
                                            <td style="width: 40%; vertical-align: middle; text-align: left">
                                                <%# DataBinder.Eval(Container.DataItem, "UserFullName")%>
                                            </td>
                                            
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </telerik:RadListBox>
                        </div>
                    </div>
                    <div class="col-6">
                        <div>

                            <telerik:RadListBox runat="server" ID="RLB_User" Height="200px" Width="100%"
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
    SelectCommand="Sp_PP_All_User_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:QueryStringParameter Name="CenterID" QueryStringField="CenterID" Type="Int16" />
        <asp:QueryStringParameter Name="PIID" QueryStringField="PIID" Type="Int16" />
        <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int16" />
    </SelectParameters>

</asp:SqlDataSource>

<telerik:RadScriptBlock runat="server" ID="RadScriptBlock1">
    <script type="text/javascript">

        function pageLoad() {
            var h = $(document).height();

            var RLB_AUser = $find("<%=RLB_AllUsers.ClientID%>");
            var RLB_SUser = $find("<%=RLB_User.ClientID%>");
            var NewH = 0.70 * h;
            if (h < 350) {
                RLB_AUser.get_element().style.height = "175px";
                RLB_AUser._groupElement.style.height = "175px";
                RLB_SUser.get_element().style.height = "175px";
                RLB_SUser._groupElement.style.height = "175px";
            }
            else {
                RLB_AUser.get_element().style.height = NewH + "px";
                RLB_AUser._groupElement.style.height = NewH + "px";
                RLB_SUser.get_element().style.height = NewH + "px";
                RLB_SUser._groupElement.style.height = NewH + "px";
            }

        }

    </script>
</telerik:RadScriptBlock>
