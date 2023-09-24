<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Report_Mutation_Description.ascx.cs" Inherits="WebGAP.GAP.Popup.uc_Report_Mutation_Description" %>

<style>
    .RadAjaxPanel {
        width: 15%;
    }

    body {
        background-color: white !important;
    }
</style>

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>

        <telerik:AjaxSetting AjaxControlID="RE_Mutatation_Desc">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RE_Mutatation_Desc" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="btnUpdate">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="btnUpdate" />
                <telerik:AjaxUpdatedControl ControlID="RE_Mutatation_Desc" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30" Skin="Office2007" />
<telerik:RadDataForm RenderMode="Lightweight" runat="server" ID="RAF_Mutation_Desc" DataSourceID="DA_RAF_Mutation_Desc">
    <ItemTemplate>
        <div class="card">
            <div class="card-bodypopup ">
                <div class="form">
                    <div class="form-body">

                        <div class="row">

                            <div class="col-md-6">
                                <div class="card-block">
                                    <h4 class="form-sectionpopup">Mutation Description</h4>
                                </div>
                                <telerik:RadEditor ID="NOTE" runat="server" Width="100%" EditModes="Design" Height="350px" Content='<%# Eval("Mutation_Desc") %>'>
                                    <Tools>
                                        <telerik:EditorToolGroup>
                                            <telerik:EditorTool Name="Cut" />
                                            <telerik:EditorTool Name="Copy" />
                                            <telerik:EditorTool Name="Paste" />
                                            <telerik:EditorTool Name="Bold"></telerik:EditorTool>
                                            <telerik:EditorTool Name="Italic"></telerik:EditorTool>
                                            <telerik:EditorTool Name="Underline"></telerik:EditorTool>
                                            <telerik:EditorTool Name="InsertLink"></telerik:EditorTool>
                                            <telerik:EditorTool Name="AjaxSpellCheck"></telerik:EditorTool>
                                        </telerik:EditorToolGroup>
                                    </Tools>
                                </telerik:RadEditor>
                            </div>
                            <div class="col-md-6">
                                <div class="card-block ">
                                    <h4 class="form-sectionpopup">Mutation Recommendation</h4>
                                </div>
                                <telerik:RadEditor ID="Mutation_Recom" runat="server" Width="100%" EditModes="Design" Height="350px" Content='<%# Eval("Mutation_Recom") %>'>
                                    <Tools>
                                        <telerik:EditorToolGroup>
                                            <telerik:EditorTool Name="Cut" />
                                            <telerik:EditorTool Name="Copy" />
                                            <telerik:EditorTool Name="Paste" />
                                            <telerik:EditorTool Name="Bold"></telerik:EditorTool>
                                            <telerik:EditorTool Name="Italic"></telerik:EditorTool>
                                            <telerik:EditorTool Name="Underline"></telerik:EditorTool>
                                            <telerik:EditorTool Name="InsertLink"></telerik:EditorTool>
                                            <telerik:EditorTool Name="AjaxSpellCheck"></telerik:EditorTool>
                                        </telerik:EditorToolGroup>
                                    </Tools>
                                </telerik:RadEditor>
                            </div>
                        </div>
                        <div class="form-actions m-0 pt-1 pb-0 center">
                            <div style="border-color: gainsboro; display: flex; flex-direction: row; justify-content: center">
                                <asp:Button ID="btnUpdate" Text="Update" class="btn btn-success mr-1 ladda-button btn-sm" data-style="expand-right"
                                    runat="server" OnClick="btnUpdate_Click" />
                                <asp:Button ID="btn_cacel" Text="Cancel" runat="server" OnClientClick="CloseWindow(); return false;"
                                    class="btn btn-danger mr-1 ladda-button btn-sm"></asp:Button>
                            </div>
                        </div>

                        </form>
                    </div>
                </div>
            </div>
    </ItemTemplate>
</telerik:RadDataForm>

<asp:SqlDataSource runat="server" ID="DA_RAF_Mutation_Desc" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
    SelectCommand="Sp_GAP_Report_Items_Mutation_Desc_Sel" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="ReportID" SessionField="Curr_ReportID" Type="Int64" />
        <asp:SessionParameter Name="Report_Version" SessionField="Curr_Report_version" Type="Int32" />
        <asp:SessionParameter Name="CHR" SessionField="Chromosome_Mutation_Desc" Type="String" />
        <asp:SessionParameter Name="START" SessionField="START_Mutation_Desc" Type="Int32" />
        <asp:SessionParameter Name="END" SessionField="END_Mutation_Desc" Type="Int32" />
        <asp:SessionParameter Name="ALT" SessionField="ALT_Mutation_Desc" Type="String" />
        <asp:SessionParameter Name="Ref" SessionField="Ref_Mutation_Desc" Type="String" />
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

        function RE_Mutatation_Desc_OnClientLoad(editor, args) {
            //  if (editor.get_text() == "") {
            //editor.set_html('TEMPLATE DESCRIPTION </br> "A novel disruptive ... was detected in ... state in the ... gene.</br>'+
            //                '</br>Mutations in ... have been shown to cause .... The reported clinical phenotype of this patient ... .'+
            //                'Other symptoms reported for this patient such as ... , .'+
            //               'The typical age of onset of ... , which is in line with the reported age of ... . Further clinical evaluation of the patient will give more insight into ... </br>'+
            //               '</br>The detected variant causes a... of ...  amino acids starting at ... . It is .... population , but has not previously been associated with ... ."');
            //var style = editor.get_contentArea().style;
            //      style.color = "darkgray";
            //      }

        }

    </script>
</telerik:RadScriptBlock>

