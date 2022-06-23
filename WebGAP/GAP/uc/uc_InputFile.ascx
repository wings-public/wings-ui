<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_InputFile.ascx.cs" Inherits="WebGAP.GAP.uc.uc_InputFile" %>

<link rel="stylesheet" type="text/css" href="../../assets/css/progress_bar_style.css" />

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RG_InputFilee">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RG_InputFilee" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="Timer1">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Panel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
    Skin="Office2007">
</telerik:RadAjaxLoadingPanel>

<asp:HiddenField ID="forValidation" runat="server" />
<div class="content-header row pt-2">
    <table style="width: 100%; background-color: lightgray">

        <tr>
            <td rowspan="2" style="width: 700px">
                <h4 style="margin-bottom: 1px; color: white; text-shadow: 1px 1px 1px #444;">
                    <asp:Label runat="server" ID="Sample" CssClass="header"> </asp:Label></h4>
            </td>

            <td style="float: right; padding-right: 27px; font-size: unset; color: white; padding: 10px; display: inline-table; background-color: #5e98c4; /* margin: 6px; *//* margin-top: 6px; */margin-right: 16px;">
                <asp:Label runat="server" ID="lbl_CenterPI">  </asp:Label>
            </td>
        </tr>

    </table>
</div>

<div class="content-body pt-1">
    <section id="basic-form-layouts">
        <div class="row match-height">

            <script type="text/javascript" id="telerikClientEvents1">
                function RG_InputFile_OnColuRG_InputFile_OnColumnMouseOutmnMouseOut(sender, args) {
                }
            </script>
            <asp:Panel ID="Panel1" runat="server">
                <asp:Timer ID="Timer1" runat="server" Interval="60000" OnTick="Timer1_Tick"></asp:Timer>
                <telerik:RadGrid ID="RG_InputFilee" RenderMode="Lightweight" runat="server" DataSourceID="Ds_InputFile" CellSpacing="-1" Hieght="700px" OnItemDataBound="RG_InputFilee_ItemDataBound"
                    AllowAutomaticUpdates="True" AllowAutomaticDeletes="True" Font-Size="Smaller" OnInsertCommand="RG_InputFile_InsertCommand" OnItemCommand="RG_InputFilee_ItemCommand" DataKeyNames="SampleFileID">
                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                    <MasterTableView CommandItemDisplay="Top" AutoGenerateColumns="False" DataSourceID="Ds_InputFile" DataKeyNames="SampleFileID">
                        <CommandItemSettings ShowRefreshButton="false" />
                        <Columns>
                            <telerik:GridTemplateColumn>
                                <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="30px"></HeaderStyle>
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="left" Width="30px" />
                                <ItemTemplate>
                                    <asp:ImageButton ID="img_Type" BorderWidth="0px" runat="server" Width="25" />
                                    <asp:HiddenField ID="hdn_type" runat="server" Value='<%# Eval("InputOrOutput") %>' />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="SampleFileID" FilterControlAltText="Filter SampleFileID column" HeaderText="File ID" SortExpression="SampleFileID" UniqueName="SampleFileID">
                                <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="15%"></HeaderStyle>
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="15%" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FileTypeName" FilterControlAltText="Filter FileTypeName column" HeaderText="File Type" SortExpression="FileTypeName" UniqueName="FileTypeName">
                                <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="8%"></HeaderStyle>
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="8%" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SourceTypeName" FilterControlAltText="Filter SourceTypeName column" HeaderText="Source" SortExpression="SourceTypeName" UniqueName="SourceTypeName">
                                <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="5%"></HeaderStyle>
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="5%" />
                            </telerik:GridBoundColumn>
                           <%-- <telerik:GridBoundColumn DataField="URL" FilterControlAltText="Filter URL column" HeaderText="URL" SortExpression="URL" UniqueName="URL">
                                <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="30%"></HeaderStyle>
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="30%" />
                            </telerik:GridBoundColumn>--%>

                            <telerik:GridBoundColumn DataField="ReferenceBuildName" FilterControlAltText="Filter ReferenceBuildName column" HeaderText="Reference Build" SortExpression="ReferenceBuildName" UniqueName="ReferenceBuildName">
                                <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%"></HeaderStyle>
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DateAdd" DataType="System.DateTime" FilterControlAltText="Filter DateAdd column" HeaderText="Date Add" SortExpression="DateAdd" UniqueName="DateAdd" DataFormatString="{0:M/d/yyyy}">
                                <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%"></HeaderStyle>
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="FileDescription" HeaderText="Description" SortExpression="Description" UniqueName="FileDescription">
                                <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="15%"></HeaderStyle>
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="15%" />
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn UniqueName="ImportStatusValue" HeaderText="Status">
                                <HeaderStyle Width="150px" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle Height="150px" HorizontalAlign="left"></ItemStyle>
                                <ItemTemplate>

                                    <div id="progress_div" runat="server" style="text-align: left !important">
                                        <%--   <asp:Label runat="server" Width="90%" id="progressError" Height="10px" ></asp:Label>--%>
                                        <progress id="progress" max="100" value='<%# Eval("ImportStatusValue") %>' class="html5"></progress>
                                    </div>
                                    <asp:Image ID="progressError" runat="server" ImageUrl="~/img/icon/Error.png" Visible="false" Width="138px" />
                                    <asp:Image ID="img_Error" runat="server" ImageUrl="~/img/icon/info.png" Visible="false" />


                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="StatusDescription">
                                <HeaderStyle Width="20px" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle Height="20px"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Image ID="imgstatus" runat="server" ImageUrl="~/img/icon/info.png" />
                                    <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip1" runat="server" TargetControlID="imgstatus" Width="200px"
                                        RelativeTo="Element" Position="BottomCenter">
                                        <%# DataBinder.Eval(Container, "DataItem.StatusDescription") %>
                                    </telerik:RadToolTip>
                                    <telerik:RadToolTip RenderMode="Lightweight" ID="RT_Error" runat="server" TargetControlID="imgstatus" Width="200px"
                                        RelativeTo="Element" Position="BottomCenter" Visible="false">
                                        <%# DataBinder.Eval(Container, "DataItem.ErrorDescription") %>
                                    </telerik:RadToolTip>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                          <%--  <telerik:GridBoundColumn UniqueName="ImportID" HeaderText="Import ID" DataField="ImportID">
                                <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%"></HeaderStyle>
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="center" Width="10%" />
                            </telerik:GridBoundColumn>--%>
                             <telerik:GridTemplateColumn>
                                <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%"></HeaderStyle>
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="importID" Text= '<%# Bind("ImportID") %>' ></asp:Label>
                                    <asp:HiddenField Value='<%# Bind("ImportID") %>' ID="hdn_ImportID" runat="server" />
                                      <asp:HiddenField Value='<%# Bind("ImportStatusID") %>' ID="hdn_ImportStatusID" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            
                            
                            <telerik:GridEditCommandColumn UniqueName="EditCommandColumn" ButtonType="ImageButton" Visible="false"
                                EditImageUrl="~/img/icon/icon_edit.png" EnableHeaderContextMenu="false">
                                <HeaderStyle Width="0px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle Width="0px" VerticalAlign="Middle" HorizontalAlign="Center" />
                            </telerik:GridEditCommandColumn>
                            <telerik:GridButtonColumn CommandName="Delete" Text="Delete" UniqueName="Delete" EnableHeaderContextMenu="false" Visible="false"
                                ButtonType="ImageButton" ImageUrl="~/img/icon/icon_delete.png" ConfirmText="Are you sure?">
                                <HeaderStyle Width="0px" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle Width="0px" VerticalAlign="Middle" HorizontalAlign="Center" />
                            </telerik:GridButtonColumn>
                            <telerik:GridTemplateColumn>
                                <ItemTemplate>
                                    <asp:HiddenField ID="hdn_status" runat="server" Value='<%# Bind("Activated") %>' />
                                    <asp:ImageButton ID="status" BorderWidth="0px" CommandName="ChangeStatus" runat="server" Height="0px" Width="0" Visible="false"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                        <EditFormSettings EditFormType="Template">
                            <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
                            <FormTemplate>
                                <div class="row">
                                    <div class="col-md-12 ">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-block">
                                                    <div class="form form-horizontal">
                                                        <div class="form-body">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group row">
                                                                        <label class="col-md-4 label-control" for="RCB_InputFileType">File Type</label>
                                                                        <div class="col-md-7">

                                                                            <telerik:RadDropDownList ValidationGroup="SubmitGroup" class="form-control" ID="RCB_InputFileType" Width="100%" runat="server" DataSourceID="Ds_InputFileType" DataTextField="FileTypeName" DataValueField="FileTypeID"
                                                                                SelectedValue='<%# Bind("FileTypeID")%>' AppendDataBoundItems="True" DefaultMessage="Select one">
                                                                            </telerik:RadDropDownList>

                                                                        </div>
                                                                        <div class="col-md-1">
                                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator4" runat="server" Display="Dynamic"
                                                                                ControlToValidate="RCB_InputFileType" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-6">
                                                                    <div class="form-group row">
                                                                        <label class="col-md-4 label-control" for="DDL_ReferenceBuild">Refrence build</label>
                                                                        <div class="col-md-7">
                                                                        
                                                                               <telerik:RadDropDownList ValidationGroup="SubmitGroup" class="form-control" ID="DDL_ReferenceBuild" Width="100%" runat="server" DataSourceID="Ds_ReferenceBuild" DataTextField="ReferenceBuildName" DataValueField="ReferenceBuildID" 
                                                                                SelectedValue='<%# Bind("ReferenceBuildID")%>' AppendDataBoundItems="True" DefaultMessage="Select one">
                                                                            </telerik:RadDropDownList>
                                                                        </div>
                                                                        <div class="col-md-1">
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" InitialValue="" ForeColor="#CC0000" ControlToValidate="DDL_SourceType" ErrorMessage="*" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">

                                                                <div class="col-md-6">
                                                                    <div class="form-group row">
                                                                        <label class="col-md-4 label-control" for="DDL_SourceType">Source</label>
                                                                        <div class="col-md-7">
                                                    
                                                                             <telerik:RadDropDownList ValidationGroup="SubmitGroup" class="form-control" ID="DDL_SourceType" Width="100%" runat="server" DataSourceID="Ds_Source" DataTextField="SourceTypeName" DataValueField="SourceTypeID" 
                                                                                SelectedValue='<%# Bind("SourceTypeID")%>' AppendDataBoundItems="True" DefaultMessage="Select one">
                                                                            </telerik:RadDropDownList>
                                                                        </div>
                                                                        <div class="col-md-1">
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="" ForeColor="#CC0000" ControlToValidate="DDL_SourceType" ErrorMessage="*" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>

                                                                        </div>
                                                                    </div>


                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="form-group row">
                                                                        <label class="col-md-4 label-control" for="URL">URL</label>
                                                                        <div class="col-md-7">
                                                                            <asp:TextBox ID="URL" runat="server" Width="400px" class="form-control" Text='<%# Bind("URL") %>'>                                                                   
                                                                            </asp:TextBox>
                                                                        </div>
                                                                        <div class="col-md-1">
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" InitialValue="" ForeColor="#CC0000" ControlToValidate="URL" ErrorMessage="*" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                <%--            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="form-group row">
                                                                        <label class="col-md-4 label-control" for="URL2">URL 2</label>
                                                                        <div class="col-md-7">
                                                                            <asp:TextBox ID="URL2" runat="server" Width="400px" class="form-control" Text='<%# Bind("URL2") %>'>                                                                   
                                                                            </asp:TextBox>
                                                                        </div>
                                                                        <div class="col-md-1">
                                                                            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="*" Display="Dynamic" ValidationGroup="SubmitGroup"
                                                                                ControlToValidate="URL2" ForeColor="#CC0000" OnServerValidate="CustomValidator1_ServerValidate">
                                                                            </asp:CustomValidator>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>--%>
                                                        </div>
                                                        <div class="form-actions  pt-1 pb-1 center">
                                                            <asp:Button ID="btnUpdate" ValidationGroup="SubmitGroup" Text='<%# (Container is GridEditFormInsertItem) ? "Insert" : "Update" %>' class="btn btn-success mr-1 ladda-button btn-sm" data-style="expand-right"
                                                                runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'></asp:Button>&nbsp;
                                                                            <asp:Button ID="btnCancel" Text="Cancel" runat="server" CausesValidation="False" class="btn btn-danger mr-1 ladda-button btn-sm" data-style="expand-right"
                                                                                CommandName="Cancel"></asp:Button>
                                                            <div style="padding-top: 20px">
                                                                <asp:Label runat="server" ID="feedback"></asp:Label>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </FormTemplate>
                        </EditFormSettings>

                    </MasterTableView>
                    <ClientSettings EnableRowHoverStyle="true">
                        <ClientEvents OnColumnMouseOut="RG_InputFile_OnColumnMouseOut"></ClientEvents>
                        <Scrolling AllowScroll="true" ScrollHeight="500px" UseStaticHeaders="false" SaveScrollPosition="true" />
                    </ClientSettings>
                    <FilterMenu RenderMode="Lightweight"></FilterMenu>
                    <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                </telerik:RadGrid>
            </asp:Panel>
            <asp:SqlDataSource ID="Ds_InputFile" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_SampleFile_Sel"
                DeleteCommand="Sp_InputFile_Del" DeleteCommandType="StoredProcedure" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="SampleID" SessionField="SampleIDFileDetail" Type="Int64" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:SessionParameter Name="SampleID" SessionField="SampleIDFileDetail" Type="Int64" />
                    <asp:Parameter Name="InputFileID" Type="Int64" />
                </DeleteParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="Ds_InputFileType" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_SampleFileType_Sel" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter DefaultValue="-1" Name="FileTypeID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="Ds_Source" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_SampleFileSourceType_Sel" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter Name="SourceTypeID" Type="Int32" DefaultValue="-1" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="Ds_ReferenceBuild" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand="Sp_ReferenceBuild_Sel" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter Name="ReferenceBuildID" Type="Int32" DefaultValue="-1" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
    </section>
</div>

<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <script type="text/javascript">


        function RG_InputFile_OnColumnMouseOut(sender, args) {
        }
        function InputFileType_IndexChanged(sender, args) {
            var fileType_Obj;
            var fileType;
            var grid = $find("<%= RG_InputFilee.ClientID %>");
            var masterTable = grid.get_masterTableView();
            //  Edit mode
            if (masterTable.get_insertItem() != null) {

                var insertRow = masterTable.get_insertItem();
          
                fileType_Obj = $(insertRow).find("div[id*='RCB_InputFileType']").get(0);
                    fileType = fileType_Obj.value;

                    var hdn_forvalidation = document.getElementById("<%= forValidation.ClientID %>");

                var URL2 = $(insertRow).find("input[id*='URL2']").get(0);
                    if (fileType == 'VCF' || fileType == 'gVCF') {
                       
                        URL2.value = '--';
                        hdn_forvalidation.value = "--";
                        $(URL2).css({ "pointer-events": "none", "opacity": "0.7" }).attr("tabindex", "-1");

                    }
                    else {
                        var URL2 = $(insertRow).find("input[id*='URL2']").get(0);
                        URL2.value = '';
                        $(URL2).removeAttr("style");
                    }



                
            }

        }
    </script>
</telerik:RadScriptBlock>
