using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.GAP.uc
{
    public partial class uc_ClinicalReports : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}


        protected void Page_Load(object sender, EventArgs e)
        {

            lbl_CenterPI.Text = Session["Current_Center"].ToString() + ", " + Session["Current_PI"].ToString();
            // DDL_Centers.Items.Insert(0, new ListItem("All Centers", "-1"));
            //if (Session["WiNGSCenterID"].ToString().Equals("0"))
            //{
            //    DDL_Centers.Attributes["style"] = "visibility: hidden;";
            //    DDL_Centers.Items.Insert(0, new ListItem("Guest", "0"));
            //    DDL_Centers.SelectedIndex = 0;
            //    DDL_PIs.Attributes["style"] = "visibility: hidden;";
            //    DDL_PIs.Items.Insert(0, new ListItem("Guest", Session["WiNGSMasterID"].ToString()));
            //    DDL_PIs.SelectedIndex = 0;

            //}
            //if (Session["WiNGSUserType"].ToString().Equals("2"))
            //{
            //    DDL_Centers.Attributes["style"] = "visibility: hidden;";
            //    DDL_Centers.Items.Insert(0, new ListItem(Session["WiNGSCenterID"].ToString()));
            //    DDL_Centers.SelectedIndex = 0;
            //    DDL_PIs.Attributes["style"] = "visibility: hidden;";
            //    DDL_PIs.Items.Insert(0, new ListItem("PIName", Session["WiNGSMasterID"].ToString()));
            //    DDL_PIs.SelectedIndex = 0;

            //}
        }
        //protected void DDL_PIs_DataBound(object sender, EventArgs e)
        //{
        //    if (!Session["WiNGSUserType"].ToString().Equals("2") && !Session["WiNGSUserType"].ToString().Equals("6"))
        //    {
        //        DDL_PIs.Items.Insert(0, new ListItem("All PIs", "-1"));
        //    }

        //}

        protected void RG_ClincalReports_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                string ReportID = item.GetDataKeyValue("ReportID").ToString();
                string Report_Type = item.GetDataKeyValue("Report_Type").ToString();
                string Report_version = item.GetDataKeyValue("Report_Version").ToString();

                if (e.CommandName == "Report_Decs")
                {
               
                    Session["ReportID_Desc"] = ReportID;
                    string message = "OpenWinReport_Desc();";
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
                }
                if (e.CommandName == "GoToReportItems")
                {

                    SqlConnection conn = new SqlConnection(CnnStr);
                    SqlCommand Cmd = new SqlCommand("Sp_GAP_ReportIsCreated_Sel", new SqlConnection(CnnStr));
                    Cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = Cmd.Parameters;
                    SqlParCol.Add(new SqlParameter("@ReportID", SqlDbType.BigInt));
                    SqlParCol.Add(new SqlParameter("@Report_Version", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@First_V_Approved", SqlDbType.Int)); /*Created*/
                    SqlParCol.Add(new SqlParameter("@Last_V_ApprovedExists", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@HasItems", SqlDbType.Int));
                    SqlParCol["@ReportID"].Value = ReportID;
                    SqlParCol["@Report_Version"].Value = Report_version;
                    SqlParCol["@UserID"].Value = Session["WiNGSMasterID"].ToString();
                    Cmd.Parameters["@First_V_Approved"].Direction = ParameterDirection.Output;
                    Cmd.Parameters["@Last_V_ApprovedExists"].Direction = ParameterDirection.Output;
                    Cmd.Parameters["@HasItems"].Direction = ParameterDirection.Output;

                    try
                    {
                        Cmd.Connection.Open();
                        Cmd.ExecuteNonQuery();
                        if (Cmd.Parameters["@HasItems"].Value.Equals(0))
                        {
                            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>You cannot see the details (there is no selected mutation in report!)</b><br />');", true);
                            e.Canceled = true;
                        }
                        else
                        {
                               Session["Curr_Report_Version"] = Report_version;
                            Session["Curr_ReportID"] = ReportID;
                            Session["AnalysisType"] = Report_Type;
                            Response.Redirect(String.Format("ClinicalReport.aspx"));
                        }
                        Cmd.Connection.Close();

                    }
                    catch (Exception ex)
                    {
                        Label lblError = new Label();
                        lblError.Text = "Unable to read. Reason: " + ex.Message;
                        lblError.ForeColor = System.Drawing.Color.Red;
                    }

                }

                if (e.CommandName == "Delete")
                {

                    SqlConnection cnn = new SqlConnection(CnnStr);
                    SqlCommand cmd = new SqlCommand("Sp_GAP_Report_Del", cnn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlDataAdptrCmd.DeleteCommand = cmd;
                    SqlParCol = cmd.Parameters;
                    SqlParCol.Add(new SqlParameter("@ReportID", SqlDbType.BigInt));
                    SqlParCol.Add(new SqlParameter("@Report_Version", SqlDbType.Int));
                    SqlParCol["@ReportID"].Value = ReportID;
                    SqlParCol["@Report_Version"].Value = Report_version;

                    try
                    {
                        cmd.Connection.Open();
                        cmd.ExecuteNonQuery();
                        cmd.Connection.Close();
                    }
                    catch (Exception ex)
                    {
                        Label lblError = new Label();
                        lblError.Text = "Unable to delete. Reason: " + ex.Message;
                        lblError.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }

        protected void RG_ClincalReports_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;

                string Approved = item["Status"].Text;


                if (Approved.Equals("1"))
                {
                    ImageButton Delete = (ImageButton)item.FindControl("Delete");
                    Delete.Visible = false;

                }


                HiddenField hdnsp = (HiddenField)item.FindControl("hdn_Status");
                string sp = hdnsp.Value.ToString();
                Label lbl_St = (Label)item.FindControl("Status");



                switch (sp)
                {
                    case "0":
                        lbl_St.Text = "Generated";
                        lbl_St.CssClass = "lbl_Status label_Status_Generated";
                        break;
                    case "2":
                        lbl_St.Text = "Approved";
                        lbl_St.CssClass = "lbl_Status label_Status_Approved";
                        break;
                    case "1":
                        lbl_St.Text = "Waiting";
                        lbl_St.CssClass = "lbl_Status label_Status_Rejected";
                        break;
                    case "3":
                        lbl_St.Text = "Rejected";
                        lbl_St.CssClass = "lbl_Status label_Status_Rejected";
                        break;

                }
            }

            if (e.Item is GridGroupHeaderItem)
            {
                GridGroupHeaderItem Hitem = (GridGroupHeaderItem)e.Item;
                HiddenField hdnReport_Type = (HiddenField)Hitem.FindControl("hdn_Report_Type");
                string Report_Type = hdnReport_Type.Value.ToString();
                ImageButton Img_Report_Type = (ImageButton)Hitem.FindControl("img_Report_Type");

                switch (Report_Type)
                {
                    case "0":
                        Img_Report_Type.ImageUrl = "/img/icon/SingleSample.png";
                        Img_Report_Type.ToolTip = "Single Sample";
                        break;
                    case "1":
                        Img_Report_Type.ImageUrl = "/img/icon/CarrierScreening.png";
                        Img_Report_Type.ToolTip = "Carrier Screening";
                        break;
                
                }


            }


           
        }

       
    }
}