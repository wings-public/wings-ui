<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Individuals_History.aspx.cs" Inherits="WebGAP.PhenBook.His.Individuals_History" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>

</head>
<body>
  
    <form id="form1" runat="server">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
 
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    
        <telerik:RadGrid RenderMode="Lightweight" ID="RG_IndividualHistory" runat="server" ShowStatusBar="true" AutoGenerateColumns="False" OnItemDataBound="RG_Individual_ItemDataBound"
            PageSize="7" AllowSorting="True" AllowMultiRowSelection="False" AllowPaging="True" DataSourceID="Sql_Individuals_History"
            OnDetailTableDataBind="RG_IndividualHistory_DetailTableDataBind">
            <PagerStyle Mode="NumericPages"></PagerStyle>
            <MasterTableView DataKeyNames="PhenotypeSID" AllowMultiColumnSorting="True">
                <DetailTables>
                    <telerik:GridTableView DataKeyNames="PhenotypeSID" Name="Orders" Width="100%">
                      
                        <Columns>
                            <telerik:GridBoundColumn SortExpression="PhenotypeSID" HeaderText="OrderID" HeaderButtonType="TextButton" 
                                DataField="PhenotypeSID">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="IndividualBirthDate" DataType="System.DateTime" DataFormatString="{0:M/d/yyyy}" SortExpression="IndividualBirthDate"
                                HeaderText="Date of Birth" UniqueName="IndividualBirthDate" HeaderStyle-Width="200px">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn DataType="System.int32" DataField="IndividualSex" UniqueName="IndividualSex" SortExpression="IndividualSex"
                                HeaderText="Gender" HeaderStyle-Width="200px">


                                <ItemTemplate>
                                    <asp:HiddenField runat="server" ID="hdn_Gender" Value='<%# Eval("IndividualSex") %>' />
                                    <asp:ImageButton ID="Genderbtn" BorderWidth="0px" Width="20px" Height="20px" runat="server"></asp:ImageButton>
                                </ItemTemplate>


                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn DataField="IndividualStatus" HeaderText="Status" UniqueName="IndividualStatus" HeaderStyle-Width="200px">

                                <ItemTemplate>
                                    <asp:HiddenField runat="server" ID="hdn_Status" Value='<%# Eval("IndividualStatus") %>' />
                                    <asp:TextBox ID="Statusbtn" BorderWidth="0px" runat="server"></asp:TextBox>
                                </ItemTemplate>


                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn DataField="Reportedby" DataType="System.Int32" HeaderText="Reported by"
                                UniqueName="Reportedby" HeaderStyle-Width="200px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Updatedby" DataType="System.Int32" HeaderText="Updatebd by"
                                UniqueName="Updatebdby" HeaderStyle-Width="200px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ReportedDate" DataType="System.DateTime" DataFormatString="{0:M/d/yyyy}" HeaderText="Reported Date" UniqueName="ReportedDate" HeaderStyle-Width="200px">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="UpdatedDate" DataType="System.DateTime" DataFormatString="{0:M/d/yyyy}" HeaderText="Updated Date" UniqueName="UpdatedDate">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Action" HeaderText="Action" UniqueName="Action" HeaderStyle-Width="200px">
                            </telerik:GridBoundColumn>

                        </Columns>
                       
                    </telerik:GridTableView>
                </DetailTables>
                <Columns>
                    <telerik:GridBoundColumn DataField="PhenotypeSID" DataType="System.Int64"
                        HeaderText="Phenotype SID" UniqueName="PhenotypeSID" HeaderStyle-Width="200px">
                    </telerik:GridBoundColumn>



                    <telerik:GridBoundColumn DataField="IndividualBirthDate" DataType="System.DateTime" DataFormatString="{0:M/d/yyyy}"
                        HeaderText="Date of Birth" UniqueName="IndividualBirthDate" HeaderStyle-Width="200px">
                    </telerik:GridBoundColumn>

                    <telerik:GridTemplateColumn DataType="System.int32" DataField="IndividualSex" UniqueName="IndividualSex"
                        HeaderText="Gender" HeaderStyle-Width="200px">


                        <ItemTemplate>
                            <asp:HiddenField runat="server" ID="hdn_Gender" Value='<%# Eval("IndividualSex") %>' />
                            <asp:ImageButton ID="Genderbtn" BorderWidth="0px" Width="20px" Height="20px" runat="server"></asp:ImageButton>
                        </ItemTemplate>


                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="IndividualStatus" HeaderText="Status" UniqueName="IndividualStatus" HeaderStyle-Width="200px">

                        <ItemTemplate>
                            <asp:HiddenField runat="server" ID="hdn_Status" Value='<%# Eval("IndividualStatus") %>' />
                            <asp:TextBox ID="Statusbtn" BorderWidth="0px" runat="server"></asp:TextBox>
                        </ItemTemplate>


                    </telerik:GridTemplateColumn>

                 
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
  

         <asp:SqlDataSource ID="Sql_Individuals_History" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>"
            SelectCommand="Sp_Individuals_History_DSel" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

        <asp:SqlDataSource ID="Sql_Individuals_DDL_Status" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand=" Select 0 as val_IndividualStatus , 'Alive' as txt_IndividualStatus union  Select 1 , 'Dead' "></asp:SqlDataSource>
        <asp:SqlDataSource ID="Sql_Individuals_DDL_Gender" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConn %>" SelectCommand=" Select 0 as val_IndividualGender , 'Female' as txt_IndividualGender union  Select 1 , 'Male' as txt_IndividualSex union Select 2,'Unknown' "></asp:SqlDataSource>



    </form>
</body>
</html>


