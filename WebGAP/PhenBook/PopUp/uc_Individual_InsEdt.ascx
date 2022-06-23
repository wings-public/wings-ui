<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Individual_InsEdt.ascx.cs" Inherits="WebGAP.PhenBook.PopUp.uc_Individual_InsEdt" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>




<div class="row">
    <div class="col-md-12 ">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title" id="horz-layout-icons">Center</h4>
                <a class="heading-elements-toggle"><i class="icon-ellipsis font-medium-3"></i></a>
                <div class="heading-elements">
                    <ul class="list-inline mb-0">
                        <li><a data-action="expand"><i class="icon-expand2"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="card-body collapse in">
                <div class="card-block">
                    <div class="form form-horizontal">
                        <div class="form-body">

                            <div class="row mt-1">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <asp:Label ID="Label6" runat="server" Text="Individual ID" Visible='<%# Eval("IndividualID").ToString() == ""%>' class="col-md-4 label-control" for="projectinput1"></asp:Label>
                                        <div class="col-md-9">
                                            <asp:TextBox ValidationGroup="SubmitGroup" ID="Txt_Individual_ID" Visible='<%# Eval("IndividualID").ToString() == ""%>' runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.IndividualID")%>' class="form-control"></asp:TextBox>
                                        </div>
                                        <div class="col-md-1">
                                            <asp:RequiredFieldValidator class="Validation-control" ID="Requiredfieldvalidator5" runat="server" Display="Dynamic"
                                                ValidationGroup="SubmitGroup" ControlToValidate="Txt_Individual_ID" ErrorMessage="!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-md-2 label-control" for="txt_LocalAdmin">PI</label>
                                        <div class="col-md-9">
                                            <asp:DropDownList ID="DDL_PIID" runat="server" Width="150px" class="form-control" DataTextField="UserFullName" DataValueField="UserID"
                                                SelectedValue='<%# Bind("PIID") %>' TabIndex="4"
                                                AppendDataBoundItems="True" DataSourceID="SDS_PI">
                                                <asp:ListItem Value="">Select One</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-1">
                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator7" runat="server" Display="Dynamic"
                                                ControlToValidate="DDL_PIID" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group row">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <asp:Label ID="Label9" runat="server" Text="First Name" class="col-md-4 label-control" for="projectinput2"></asp:Label>
                                        <div class="col-md-9">
                                            <asp:TextBox ValidationGroup="SubmitGroup" ID="Txt_Individual_Fname" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.IndividualFName")%>' class="form-control"></asp:TextBox>
                                        </div>
                                        <div class="col-md-1">
                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator6" runat="server" Display="Dynamic"
                                                ValidationGroup="SubmitGroup" ControlToValidate="Txt_Individual_Fname" ErrorMessage="!" ForeColor="#CC0000"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <asp:Label ID="Label8" runat="server" Text="Last Name" class="col-md-4 label-control" for="projectinput3"></asp:Label>
                                        <div class="col-md-9">
                                            <asp:TextBox ValidationGroup="SubmitGroup" ID="Txt_Individual_Lname" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.IndividualLName")%>' class="form-control"></asp:TextBox>
                                        </div>
                                        <div class="col-md-1">
                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" Display="Dynamic"
                                                ValidationGroup="SubmitGroup" ControlToValidate="Txt_Individual_Lname" ErrorMessage="!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <asp:Label ID="Label10" runat="server" Text="Gender" class="col-md-4 label-control" for="projectinput4"></asp:Label>
                                        <div class="col-md-9">
                                            <asp:DropDownList ValidationGroup="SubmitGroup" ID="DDL_Gender" runat="server" Width="150px" DataSourceID="Sql_Individuals_DDL_Gender" DataTextField="txt_IndividualSex" DataValueField="val_IndividualSex"
                                                SelectedValue='<%# Bind ("IndividualSex")%>' AppendDataBoundItems="True" class="form-control">
                                                <asp:ListItem Value="">Select One</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-1">
                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" Display="Dynamic"
                                                ValidationGroup="SubmitGroup" ControlToValidate="DDL_Gender" ErrorMessage="!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <asp:Label ID="Label11" runat="server" Text="Status" class="col-md-4 label-control" for="projectinput5"></asp:Label>
                                        <div class="col-md-9">
                                            <asp:DropDownList ValidationGroup="SubmitGroup" ID="DDL_Status" runat="server" Width="150px" DataSourceID="Sql_Individuals_DDL_Status" DataTextField="txt_IndividualStatus" DataValueField="val_IndividualStatus"
                                                SelectedValue='<%# DataBinder.Eval(Container, "DataItem.IndividualStatus")%>' AppendDataBoundItems="True" class="form-control">
                                                <asp:ListItem Value="">Select One</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-1">
                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" Display="Dynamic"
                                                ValidationGroup="SubmitGroup" ControlToValidate="DDL_Status" ErrorMessage="!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>
               

                               <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                          <asp:Label ID="Label12" runat="server" Text="Date of Birth" class="col-md-4 label-control" for="projectinput6"></asp:Label>
                                        <div class="col-md-9">
                                        <telerik:RadDatePicker ValidationGroup="SubmitGroup" RenderMode="Lightweight" ID="Txt_Bdate"
                        DbSelectedDate='<%# DataBinder.Eval(Container,"DataItem.IndividualBirthDate") %>' DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy"
                        runat="server">
                        <DateInput runat="server" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" />
                    </telerik:RadDatePicker>
                                        </div>
                                        <div class="col-md-1">
                                         <asp:RequiredFieldValidator ID="Requiredfieldvalidator4" runat="server" Display="Dynamic"
                        ValidationGroup="SubmitGroup" ControlToValidate="Txt_Bdate" ErrorMessage="!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group row">
                                     
                                    </div>
                                </div>
                            </div>
                            
                        </div>



                </div>
                <div class="form-actions m-0 pt-1 pb-0 center">
                    <asp:Button ID="btnUpdate" ValidationGroup="SubmitGroup" Text='<%# (Container is GridEditFormInsertItem) ? "Insert" : "Update" %>' class="btn btn-success mr-1 ladda-button btn-sm" data-style="expand-right"
                        runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'></asp:Button>&nbsp;
                                                                <asp:Button ID="Button1" Text="Cancel" runat="server" CausesValidation="False" class="btn btn-danger mr-1 ladda-button btn-sm" data-style="expand-right"
                                                                    CommandName="Cancel"></asp:Button>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<asp:SqlDataSource ID="Sql_Individuals_DDL_Gender" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand=" Select 0 as val_IndividualSex , 'Female' as txt_IndividualSex union  Select 1 , 'Male' union Select 2 , 'Unknown' "></asp:SqlDataSource>
<asp:SqlDataSource ID="Sql_Individuals_DDL_Status" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand=" Select 0 as val_IndividualStatus , 'Dead' as txt_IndividualStatus union  Select 1 , 'Alive' "></asp:SqlDataSource>
<asp:SqlDataSource ID="SDS_PI" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand=" Select * from Viw_PI "></asp:SqlDataSource>

