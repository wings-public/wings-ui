using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.GAP.uc
{
    public partial class uc_InputFile : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}  
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbl_CenterPI.Text = Session["Current_Center"].ToString() + ", " + Session["Current_PI"].ToString();
                Sample.Text = "Sample " + Session["SampleLocalIDFileDetail"] + " - "+ Session["SampleIDFileDetail"].ToString();

            }

        }
   

        protected void RG_InputFile_InsertCommand(object sender, GridCommandEventArgs e)
        {


            GridEditableItem editedItem = e.Item as GridEditableItem;

            RadDropDownList InputFileTypeID = (RadDropDownList)editedItem.FindControl("RCB_InputFileType");
            RadDropDownList SourceType = (RadDropDownList)editedItem.FindControl("DDL_SourceType");
            RadDropDownList ReBuild = (RadDropDownList)editedItem.FindControl("DDL_ReferenceBuild");
            int ReBuildvalue = Convert.ToInt32(ReBuild.SelectedValue);
            TextBox URL = (TextBox)editedItem.FindControl("URL");
           
            TextBox MD5 = (TextBox)editedItem.FindControl("MD5");
            Label Feedback = (Label)editedItem.FindControl("feedback");

            SqlConnection cnn = new SqlConnection(CnnStr);
            SqlCommand cmd = new SqlCommand("Sp_SampleFile_Ins", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlDataAdptrCmd.InsertCommand = cmd;
            SqlParCol = cmd.Parameters;

            SqlParCol.Add(new SqlParameter("@SampleID", SqlDbType.BigInt));
            SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@PIID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@FileTypeID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@SourceTypeID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@URL", SqlDbType.VarChar, -1));
            SqlParCol.Add(new SqlParameter("@Referencebuild", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@MD5", SqlDbType.NVarChar, 100));
            SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@HostID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@Feedback_Out", SqlDbType.NVarChar, -1));

            SqlParCol["@SampleID"].Value = Session["SampleIDFileDetail"];
            SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
            SqlParCol["@PIID"].Value = Session["Current_PIID"];
            SqlParCol["@FileTypeID"].Value = Convert.ToInt32(InputFileTypeID.SelectedValue);
            SqlParCol["@SourceTypeID"].Value = Convert.ToInt32(SourceType.SelectedValue);
            SqlParCol["@URL"].Value = URL.Text;
            SqlParCol["@Referencebuild"].Value = ReBuildvalue;
            SqlParCol["@MD5"].Value = DBNull.Value; // temporary null
            SqlParCol["@UserID"].Value = int.Parse(Session["WiNGSMasterId"].ToString());
            SqlParCol["@HostID"].Value = Session["HostID"];
            SqlParCol["@Feedback_Out"].Direction = ParameterDirection.Output;

            try
            {
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                if (!cmd.Parameters["@Feedback_Out"].Value.Equals("Success"))
                {
                    Feedback.Text = cmd.Parameters["@Feedback_Out"].Value.ToString();
                    Feedback.ForeColor = System.Drawing.Color.Red;
                    Feedback.Attributes.Add("style", "font-weight: bold;");
                    e.Canceled = true;
                }
                cmd.Connection.Close();
            }
            catch (Exception ex)
            {
                Label lblError = new Label();
                lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }



        protected void Timer1_Tick(object sender, EventArgs e)
        {
            if ((RG_InputFilee.MasterTableView.IsItemInserted.Equals(false)) == (RG_InputFilee.EditItems.Count.Equals(0)))
                RG_InputFilee.Rebind();
        }

        protected void RG_InputFilee_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;

                HiddenField hdnsp = (HiddenField)item.FindControl("hdn_ImportID");
                string sp = hdnsp.Value.ToString();
                ImageButton imgsp = (ImageButton)item.FindControl("img_Type");

                HiddenField hdnSt = (HiddenField)item.FindControl("hdn_ImportStatusID");
                string hdnSt_value = hdnSt.Value.ToString();

                HiddenField hdnActive = (HiddenField)item.FindControl("hdn_Status");
                string Active = hdnActive.Value.ToString();
                ImageButton img_Active = (ImageButton)item.FindControl("status");

                switch (Active)
                {
                    case "0":
                        img_Active.ImageUrl = "/img/icon/Deactivated.png";

                        break;
                    case "1":
                        img_Active.ImageUrl = "/img/icon/Active.png";
                        break;
                    
                }



                if (hdnSt_value == "9")
                { 
                    HtmlGenericControl tt = (HtmlGenericControl)item.FindControl("progress_div");
                    RadToolTip RT = (RadToolTip)item.FindControl("RadToolTip1");
                    RadToolTip RTerror = (RadToolTip)item.FindControl("RT_Error");
                    Image ProgressError = (Image)item.FindControl("progressError");
                    ProgressError.Visible = true;
                    RTerror.Visible = true;
                    RT.Visible = false;
                    tt.Visible = false;
                }

                if (sp.Length > 2)
                {
                    imgsp.ImageUrl = "/img/icon/input.png";
                    imgsp.ToolTip = "Input file";
                }
                else
                { 
                        imgsp.ImageUrl = "/img/icon/output.png";
                        imgsp.ToolTip = "Output File";
                        HtmlGenericControl tt = (HtmlGenericControl)item.FindControl("progress_div");
                        RadToolTip RT = (RadToolTip)item.FindControl("RadToolTip1");
                        Image img = (Image)item.FindControl("imgstatus");
                        img.Visible = false;
                        RT.Visible = false;
                        tt.Visible = false;

                }

            }
        }

        protected void RG_InputFilee_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if(e.CommandName == "ChangeStatus")
            {
                GridDataItem item = (GridDataItem)e.Item;
                HiddenField hdn_status = (HiddenField)item.FindControl("hdn_status");

                SqlConnection cnn = new SqlConnection(CnnStr);
                SqlCommand cmd = new SqlCommand("Sp_SampleFile_de_activated", cnn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                SqlDataAdptrCmd.InsertCommand = cmd;
                SqlParCol = cmd.Parameters;

                SqlParCol.Add(new SqlParameter("@SampleFileID", SqlDbType.BigInt));
                SqlParCol.Add(new SqlParameter("@StatusID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@HostID", SqlDbType.Int));

                string value = hdn_status.Value.ToString();
                SqlParCol["@SampleFileID"].Value = item.GetDataKeyValue("SampleFileID").ToString().Trim();
                SqlParCol["@StatusID"].Value = Convert.ToInt32((hdn_status.Value.ToString() == "1" ? "0" : "1"));
                SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
                SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
                SqlParCol["@HostID"].Value = Session["HostID"];


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
                RG_InputFilee.Rebind();

            }
        }

        //  protected void CustomValidator1_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        //{
        //    string value = forValidation.Value;
        //   if (value == "--")
        //        args.IsValid = true;
        //    else
        //        args.IsValid = false;
        //}
    }
}