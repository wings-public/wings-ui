using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.Admin.Popup
{
    public partial class uc_SamplesheetLog_detail : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}  
        protected void Page_Load(object sender, EventArgs e)
        {
            DataView dvSql = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView drvSql in dvSql)
            {
                Description.Text = drvSql["OverallLog"].ToString().Replace("*", "<br>*"); ;
                summary.Text = drvSql["summary"].ToString();
            }
        }

        protected void RG_SampleSheetLOG_detail_system_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("sendfeedbacktoAPI"))
            {
               
                    GridDataItem item = (GridDataItem)e.Item;

                    HiddenField hdn_SeqTypeID = (HiddenField)item.FindControl("hdn_SeqTypeID");
                    HiddenField hdn_PanelTypeID = (HiddenField)item.FindControl("hdn_PanelTypeID");
                    HiddenField hdn_FileTypeID = (HiddenField)item.FindControl("hdn_FileTypeID");
                    HiddenField hdn_ReferenceBuildID = (HiddenField)item.FindControl("hdn_ReferenceBuildID");
                    HiddenField hdn_LogID = (HiddenField)item.FindControl("hdn_LogID");
                    HiddenField hdn_HostID = (HiddenField)item.FindControl("hdn_HostID");
                    HiddenField hdn_I_LocalID = (HiddenField)item.FindControl("hdn_I_LocalID");

                

                    SqlConnection cnn = new SqlConnection(CnnStr);
                    SqlCommand cmd = new SqlCommand("Sp_SampleSheetLog_SendReleasecommand_To_API", cnn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlDataAdptrCmd.InsertCommand = cmd;
                    SqlParCol = cmd.Parameters;

                    SqlParCol.Add(new SqlParameter("@logID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@HostID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@SampleLocalID", SqlDbType.NVarChar, 100));
                    SqlParCol.Add(new SqlParameter("@IndividualLocalID", SqlDbType.NVarChar, 100));
                    SqlParCol.Add(new SqlParameter("@SeqTypeID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@PanelTypeID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@ReferenceBuildID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@FileTypeID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));

                    SqlParCol["@logID"].Value = Convert.ToInt32(hdn_LogID.Value);
                    SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
                    SqlParCol["@HostID"].Value = Convert.ToInt32(hdn_HostID.Value);
                    SqlParCol["@SampleLocalID"].Value = item["localID"].Text;
                    SqlParCol["@IndividualLocalID"].Value = hdn_I_LocalID.Value;
                    SqlParCol["@SeqTypeID"].Value = Convert.ToInt32(hdn_SeqTypeID.Value);
                    SqlParCol["@PanelTypeID"].Value = Convert.ToInt32(hdn_PanelTypeID.Value);
                    SqlParCol["@ReferenceBuildID"].Value = (hdn_ReferenceBuildID.Value == "" ? System.Data.SqlTypes.SqlInt32.Null : Convert.ToInt32(hdn_ReferenceBuildID.Value));
                    SqlParCol["@FileTypeID"].Value = (hdn_FileTypeID.Value == "" ? System.Data.SqlTypes.SqlInt32.Null : Convert.ToInt32(hdn_FileTypeID.Value));  
                    SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];



                    try
                    {
                        cmd.Connection.Open();
                        cmd.ExecuteNonQuery();
                        cmd.Connection.Close();
                    }
                    catch (Exception ex)
                    {
                        Label lblError = new Label();
                        lblError.Text = "Unable to update the status. Reason: " + ex.Message;
                        lblError.ForeColor = System.Drawing.Color.Red;
                    }
                RG_SampleSheetLOG_detail_system.Rebind();



            }

            if (e.CommandName.Equals("notifySys_admin"))
            {

               
                GridDataItem item = (GridDataItem)e.Item;

                HiddenField hdn_SeqTypeID = (HiddenField)item.FindControl("hdn_SeqTypeID");
                HiddenField hdn_PanelTypeID = (HiddenField)item.FindControl("hdn_PanelTypeID");

                HiddenField hdn_LogID = (HiddenField)item.FindControl("hdn_LogID");
                HiddenField hdn_HostID = (HiddenField)item.FindControl("hdn_HostID");


                //  string mailbody = "<html><body> <p> Dear Ms.Susan,</p><p> Thank you for your letter of yesterday inviting me to come for an interview on Friday afternoon, 5th July, at 2:30.I shall be happy to be there as requested and will bring my diploma and other papers with me.</p><p> Sincerely,<br> -Jack </br></p> </body> </html> ";
                string mailbody = "Log number: " + hdn_LogID.Value+ ", Sample localID: " + item["localID"].Text + ", seqtype: " + hdn_SeqTypeID.Value + ", Center:" + Session["Current_CenterID"].ToString() + ", HostID:" + hdn_HostID.Value + ", Error: " + item["ErrorDescription"].Text;


                SqlConnection cnn = new SqlConnection(CnnStr);
                SqlCommand cmd = new SqlCommand("Sp_SampleSheetSendEmail_ToSystemAdmin", cnn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                SqlDataAdptrCmd.InsertCommand = cmd;
                SqlParCol = cmd.Parameters;

                SqlParCol.Add(new SqlParameter("@body", SqlDbType.NVarChar, -1));
                SqlParCol.Add(new SqlParameter("@S_LocalID", SqlDbType.NVarChar, 200));
                SqlParCol.Add(new SqlParameter("@SeqType", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@PanelType", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@logID", SqlDbType.Int));



                SqlParCol["@body"].Value = mailbody;
                SqlParCol["@S_LocalID"].Value = item["localID"].Text;
                SqlParCol["@SeqType"].Value = Convert.ToInt32(hdn_SeqTypeID.Value);
                SqlParCol["@PanelType"].Value = Convert.ToInt32(hdn_PanelTypeID.Value);
                SqlParCol["@logID"].Value = Convert.ToInt32(hdn_LogID.Value);


                try
                {
                    cmd.Connection.Open();
                    cmd.ExecuteNonQuery();
                    cmd.Connection.Close();
                }
                catch (Exception ex)
                {
                    Label lblError = new Label();
                    lblError.Text = "Unable to update the status. Reason: " + ex.Message;
                    lblError.ForeColor = System.Drawing.Color.Red;
                }
                RG_SampleSheetLOG_detail_system.Rebind();

            }

            //protected void RG_SampleSheetLOG_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
            //{
            //    if (e.CommandName == "ReportAPI")
            //    {
            //        GridDataItem item = (GridDataItem)e.Item;

            //        HiddenField hdn_SeqTypeID = (HiddenField)item.FindControl("hdn_SeqTypeID");
            //        HiddenField hdn_PanelTypeID = (HiddenField)item.FindControl("hdn_PanelTypeID");
            //        HiddenField hdn_FileTypeID = (HiddenField)item.FindControl("hdn_FileTypeID");
            //        HiddenField hdn_ReferenceBuildID = (HiddenField)item.FindControl("hdn_ReferenceBuildID");
            //        HiddenField hdn_LogID = (HiddenField)item.FindControl("hdn_LogID");
            //        HiddenField hdn_HostID = (HiddenField)item.FindControl("hdn_HostID");


            //        SqlConnection cnn = new SqlConnection(CnnStr);
            //        SqlCommand cmd = new SqlCommand("Sp_SampleSheetLog_SendReleasecommand_To_API", cnn);
            //        cmd.CommandType = CommandType.StoredProcedure;
            //        SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            //        SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            //        SqlDataAdptrCmd.InsertCommand = cmd;
            //        SqlParCol = cmd.Parameters;

            //        SqlParCol.Add(new SqlParameter("@logID", SqlDbType.Int));
            //        SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
            //        SqlParCol.Add(new SqlParameter("@HostID", SqlDbType.Int));
            //        SqlParCol.Add(new SqlParameter("@SampleLocalID", SqlDbType.NVarChar, 100));
            //        SqlParCol.Add(new SqlParameter("@SeqTypeID", SqlDbType.Int));
            //        SqlParCol.Add(new SqlParameter("@PanelTypeID", SqlDbType.Int));
            //        SqlParCol.Add(new SqlParameter("@ReferenceBuildID", SqlDbType.Int));
            //        SqlParCol.Add(new SqlParameter("@FileTypeID", SqlDbType.Int));
            //        SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));

            //        SqlParCol["@logID"].Value = Convert.ToInt32(hdn_LogID.Value);
            //        SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
            //        SqlParCol["@HostID"].Value = Convert.ToInt32(hdn_HostID.Value);
            //        SqlParCol["@SampleLocalID"].Value = item["localID"].Text;
            //        SqlParCol["@SeqTypeID"].Value = Convert.ToInt32(hdn_SeqTypeID.Value);
            //        SqlParCol["@PanelTypeID"].Value = Convert.ToInt32(hdn_PanelTypeID.Value);
            //        SqlParCol["@ReferenceBuildID"].Value = Convert.ToInt32(hdn_ReferenceBuildID.Value);
            //        SqlParCol["@FileTypeID"].Value = Convert.ToInt32(hdn_FileTypeID.Value);
            //        SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];



            //        try
            //        {
            //            cmd.Connection.Open();
            //            cmd.ExecuteNonQuery();
            //            cmd.Connection.Close();
            //        }
            //        catch (Exception ex)
            //        {
            //            Label lblError = new Label();
            //            lblError.Text = "Unable to update the status. Reason: " + ex.Message;
            //            lblError.ForeColor = System.Drawing.Color.Red;
            //        }

            //    }


            //}

            //protected void RG_SampleSheetLOG_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
            //{
            //    if (e.Item is GridDataItem)
            //    {
            //        GridDataItem item = (GridDataItem)e.Item;


            //        HiddenField hdnsp = (HiddenField)item.FindControl("hdn_errorType");
            //        string sp = hdnsp.Value.ToString();

            //        if (sp == "user-error")
            //        {
            //            ImageButton release = (ImageButton)item.FindControl("status");
            //            release.Enabled = false;
            //        }



            //    }
            //}
        }

        protected void RG_SampleSheetLOG_detail_system_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;


                HiddenField hdnsp = (HiddenField)item.FindControl("hdn_errorType");
                string sp = hdnsp.Value.ToString();

                if (sp == "system-error")
                {
                    ImageButton release = (ImageButton)item.FindControl("sendfeedbacktoAPI");
                    release.Visible = false;
                  
                }
                if (sp == "Notified_sysAdmin")
                {
                    ImageButton Notify = (ImageButton)item.FindControl("Notify");
                    Notify.Visible = false;
                    Label err = (Label)item.FindControl("lbl_errordesc");
                    err.Attributes.Add("style", "padding-left: 20px;");
                    err.Text = "Suspend";
                    ImageButton release = (ImageButton)item.FindControl("sendfeedbacktoAPI");
                    release.Visible = false;

                }
                if (sp == "Solved")
                {
                    ImageButton Notify = (ImageButton)item.FindControl("Notify");
                    Notify.Visible = false;

                }
                if (sp == "Released")
                {
                    ImageButton Notify = (ImageButton)item.FindControl("Notify");
                    Notify.Visible = false;
                    Label err = (Label)item.FindControl("lbl_errordesc");
                    err.Attributes.Add("style", "padding-left: 20px;");
                    err.Text = "Released";
                    ImageButton release = (ImageButton)item.FindControl("sendfeedbacktoAPI");
                    release.Visible = false;

                }




            }
        }
    }
}