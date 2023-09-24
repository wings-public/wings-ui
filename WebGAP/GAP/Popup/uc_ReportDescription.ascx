<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_ReportDescription.ascx.cs" Inherits="WebGAP.GAP.Popup.uc_ReportDescription" %>


<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RDF">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RDF" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>

<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30" Skin="Office2007" />
<telerik:RadDataForm RenderMode="Lightweight" runat="server" ID="RDF" DataSourceID="RDF_Report_Desc">
    <ItemTemplate>
        <div class="card">
            <div class="card-bodypopup ">
                <div class="form">
                    <div class="form-body">
                        <div class="card-block">
                            <h4 class="form-sectionpopup">Report Description</h4>
                        </div>
                        <div style="text-align: justify; overflow-y: auto; height: 351px; padding-right: 12px;">
                            <asp:Label RenderMode="Lightweight" runat="server" ID="desc" Text='<%# Eval("Report_Desc") %>'></asp:Label>
                        </div>
                        <div class="form-actions m-0 pt-1 pb-0 center">
                            <div style="border-color: gainsboro; display: flex; flex-direction: row; justify-content: center">
                                <asp:Button ID="btn_cacel" Text="Cancel" runat="server" OnClientClick="CloseWindow(); return false;"
                                    class="btn btn-danger mr-1 ladda-button btn-sm"></asp:Button>
                            </div>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>


    </ItemTemplate>
</telerik:RadDataForm>

<asp:SqlDataSource runat="server" ID="RDF_Report_Desc" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_GAP_Report_Description_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="ReportID" SessionField="ReportID_Desc" Type="Int64" />
    </SelectParameters>
</asp:SqlDataSource>

<telerik:RadScriptBlock runat="server" ID="RadScriptBlock1">
    <script>

        //  $('TextBox').css('width',((TextBox.getAttribute('Text').length + 1) * 8) + 'px');
        function GetRadWindow() {
            var oWindow = null;
            if (window.radWindow) oWindow = window.radWindow;
            else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
            return oWindow;
        }
        function CloseWindow() {
            var oWindow = GetRadWindow();  //Obtaining a reference to the current window 
            oWindow.Close();
        }


    </script>
</telerik:RadScriptBlock>

