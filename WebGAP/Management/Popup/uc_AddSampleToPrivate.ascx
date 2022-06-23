<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_AddSampleToPrivate.ascx.cs" Inherits="WebGAP.Management.Popup.uc_AddSampleToPrivate" %>

<style>
    /** Columns */
    .rcbHeader ul,
    .rcbFooter ul,
    .rcbItem ul,
    .rcbHovered ul,
    .rcbDisabled ul {
        margin: 0;
        padding: 0;
        width: 100%;
        display: inline-block;
        list-style-type: none;
    }

    .RCB_UserDataset.RadComboBoxDropDown .rcbHeader {
        padding: 5px 27px 4px 7px;
    }

    .rcbScroll {
        overflow: scroll !important;
        overflow-x: hidden !important;
    }

    .col1,
    .col2,
    .col3,
    .col4 {
        margin: 0;
        padding: 0 5px 0 0;
        width: 25%;
        line-height: 14px;
        float: left;
    }


    /** Multiple rows and columns */
    .multipleRowsColumns .rcbItem,
    .multipleRowsColumns .rcbHovered {
        float: left;
        margin: 0 1px;
        min-height: 13px;
        overflow: hidden;
        padding: 2px 19px 2px 6px;
        width: 193px;
    }

    .results {
        display: block;
        margin-top: 20px;
    }
</style>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<telerik:RadCodeBlock runat="server" ID="rcb1">
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
            oWnd.close();
        }
    </script>
</telerik:RadCodeBlock>
<body>
    <telerik:RadAjaxManager ID="RadAjaxManager2" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RCB_UserDataset">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RCB_UserDataset" LoadingPanelID="RadAjaxLoadingPanel2" />
                    <telerik:AjaxUpdatedControl ControlID="RLB_ADS" />
                    <telerik:AjaxUpdatedControl ControlID="RLB_YDS" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
        Skin="Office2007">
    </telerik:RadAjaxLoadingPanel>

    <div class="card-content collapse show">
        <div class="card-bodypopup">
            <form class="form">
                <div class="form-body">
                    <h4 class="form-sectionpopup"><i class="ft-user"></i>Add Sample to Private Dataset</h4>
                    <div class="row ml-1">

                        <telerik:RadComboBox ID="RCB_UserDataset" RenderMode="Lightweight" runat="server" Width="850" EmptyMessage="Select a Dataset"
                            EnableAutomaticLoadOnDemand="True" ItemsPerRequest="10" ShowMoreResultsBox="true" EnableVirtualScrolling="true" DataValueField="DatasetID" DataTextField="DatasetName"
                            DataSourceID="Ds_RCB_UserDataset" DropDownCssClass="RCB_AddSample" OnClientDropDownOpening="RCB_UserDataset_DropDownOpening" HighlightTemplatedItems="true"
                            Label="Dataset:" Skin="Windows7" AutoPostBack="True" Font-Size="X-Small">
                            <HeaderTemplate>
                                <ul>
                                    <li class="col1">Dataset ID</li>
                                    <li class="col2">Center</li>
                                    <li class="col3">PI</li>
                                    <li class="col4">Dataset Name</li>
                                </ul>
                            </HeaderTemplate>
                            <ItemTemplate >
                                <ul>
                                    <li class="col1">
                                        <%# DataBinder.Eval(Container.DataItem, "DatasetID")%></li>
                                    <li class="col2">
                                        <%# DataBinder.Eval(Container.DataItem, "CenterDesc")%></li>
                                    <li class="col3">
                                        <%# DataBinder.Eval(Container.DataItem, "PIName")%></li>
                                    <li class="col4">
                                        <%# DataBinder.Eval(Container.DataItem, "DatasetName")%></li>
                                </ul>
                            </ItemTemplate>
                        </telerik:RadComboBox>

                    </div>
                    <div class="row mt-1">
                            <div class="col-xs-11 px-0 m-0">
                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator7" runat="server" Display="Dynamic"
                                ControlToValidate="RCB_UserDataset" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-6">
                            <telerik:RadListBox runat="server" ID="RLB_ADS" Height="200px" Width="100%" AllowTransfer="true" Font-Size="Small"
                                TransferToID="RLB_YDS" EmptyMessage="There is No Assigned Dataset" ToolTip="Available Dataset" DataValueField="SampleID" DataTextField="LocalID"
                                TransferMode="Copy" Skin="Web20" DataSourceID="Ds_RLB_YDS">
                                <ButtonSettings TransferButtons="All"></ButtonSettings>
                                <EmptyMessageTemplate>
                                    There is No Assigned Dataset
                                </EmptyMessageTemplate>
                                <HeaderTemplate>
                                    <itemtemplate>
                           <table style="width: 100%; ">
                              <tr>
                                 <td style="width: 50%; vertical-align: middle; text-align: left">
                                     Sample ID
                                  </td>
                                  <td style="width: 50%; vertical-align: middle; text-align: left">
                                    Local Name
                                 </td>
                                </tr>
                           </table>
                        </itemtemplate>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <table style="width: 100%;">
                                        <tr>
                                            <td style="width: 50%; vertical-align: middle; text-align: left">
                                                <%# DataBinder.Eval(Container.DataItem, "SampleID")%>
                                            </td>
                                            <td style="width: 50%; vertical-align: middle; text-align: left">
                                                <%# DataBinder.Eval(Container.DataItem, "LocalID")%>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </telerik:RadListBox>
                        </div>

                        <div class="col-6">
                            <div>
                            <telerik:RadListBox runat="server" ID="RLB_YDS"  Width="100%" ToolTip="Active Dataset"
                                    Skin="Web20" AutoPostBack="True">
                                </telerik:RadListBox>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="form-actionspopup center" style="height: 20%">
                    <asp:Button ID="btn_Inset" ValidationGroup="SubmitGroup" Text="Insert" class="btn btn-success mr-1 ladda-button btn-sm" data-style="expand-right"
                        runat="server" OnClick="btn_Inset_Click"></asp:Button>&nbsp;
                              <asp:Button ID="btn_cacel" Text="Cancel" runat="server" CausesValidation="true" class="btn btn-danger mr-1 ladda-button btn-sm" OnClientClick="btn_cacel_click();return false;"></asp:Button>
                </div>
            </form>

        </div>
    </div>

    <asp:SqlDataSource ID="Ds_RCB_UserDataset" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
        SelectCommand="Sp_UPDS_Avail_DataSet_To_CreatePDS_Sel" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Ds_RLB_YDS" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
        SelectCommand="Sp_UPDS_Dataset_Samples_Sel" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="RCB_UserDataset" Name="DatasetID" PropertyName="SelectedValue" Type="Int32" />
            <asp:SessionParameter Name="UserID" SessionField="WiNGSMasterId" Type="Int32" />
            <asp:QueryStringParameter Name="UserDatasetID" QueryStringField="DatasetID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">

            function pageLoad() {
             
                var h = $(document).height();
                var RLB_AADS = $find("<%=RLB_ADS.ClientID%>");
                var RLB_SYDS = $find("<%=RLB_YDS.ClientID%>");
            var NewH = 0.65 * h;
            if (h < 400) {
              
                RLB_AADS.get_element().style.height = "160px";
                RLB_AADS._groupElement.style.height = "160px";
                RLB_SYDS.get_element().style.height = "160px";
                RLB_SYDS._groupElement.style.height = "160px";
            }
            else {
                RLB_AADS.get_element().style.height = NewH + "px";
                RLB_AADS._groupElement.style.height = NewH + "px";
                RLB_SYDS.get_element().style.height = NewH + "px";
                RLB_SYDS._groupElement.style.height = NewH + "px";

            }

            }

            function RCB_UserDataset_DropDownOpening(sender, args) {
                var combo = $find('<%= RCB_UserDataset.ClientID%>');
                combo.clearSelection();
            }
        </script>
    </telerik:RadCodeBlock>
