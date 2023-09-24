using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.GAP.uc
{
    public partial class uc_ClinicalReport : System.Web.UI.UserControl
    {

        string ReportID = string.Empty; // 

        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion} 
        protected void Page_Load(object sender, EventArgs e)
        {
          

            if (!IsPostBack)
           {
                // if(Session["Analysis_Type"].Equals("0"))
                lbl_ReportID.Text = Session["Curr_ReportID"].ToString();


                if (Session["AnalysisType"].Equals("0"))
                    lbl_FemaleID.Text = Session["Curr_ReportID"].ToString();
                if (Session["AnalysisType"].Equals("1"))
                {
                    SqlConnection _conn = new SqlConnection(CnnStr);

                    SqlCommand _Cmd = new SqlCommand("Sp_GAP_Report_Samples", new SqlConnection(CnnStr));
                    _Cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter _SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection _SqlParCol = default(SqlParameterCollection);
                    _SqlParCol =_Cmd.Parameters;
                    _SqlParCol.Add(new SqlParameter("@ReportID", SqlDbType.BigInt));
                    _SqlParCol.Add(new SqlParameter("@Report_Type", SqlDbType.Int));
                    _SqlParCol.Add(new SqlParameter("@FemaleID", SqlDbType.BigInt));
                    _SqlParCol.Add(new SqlParameter("@MaleID", SqlDbType.BigInt));

                    _SqlParCol["@ReportID"].Value = Session["Curr_ReportID"].ToString();
                    _SqlParCol["@Report_Type"].Value = Session["AnalysisType"].ToString();
                    _Cmd.Parameters["@FemaleID"].Direction = ParameterDirection.Output;
                    _Cmd.Parameters["@MaleID"].Direction = ParameterDirection.Output;

                    try
                    {
                        _Cmd.Connection.Open();
                        _Cmd.ExecuteNonQuery();
                        lbl_FemaleID.Text = _SqlParCol["@FemaleID"].Value.ToString();
                        Session["FemaleID"] = _SqlParCol["@FemaleID"].Value.ToString();
                        lbl_MaleID.Text = _SqlParCol["@MaleID"].Value.ToString();
                        Session["MaleID"] = _SqlParCol["@MaleID"].Value.ToString();
                        img_Female.Visible = true;
                        img_Male.Visible = true;
                        _Cmd.Connection.Close();

                    }
                    catch (Exception ex)
                    {
                        Label lblError = new Label();
                        lblError.Text = "Unable to read. Reason: " + ex.Message;
                        lblError.ForeColor = System.Drawing.Color.Red;
                    }
                }


                SqlConnection conn = new SqlConnection(CnnStr);

                SqlCommand Cmd = new SqlCommand("Sp_GAP_ReportIsApproved_Updatable_Sel", new SqlConnection(CnnStr));
                Cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                SqlParCol = Cmd.Parameters;


                SqlParCol.Add(new SqlParameter("@ReportID", SqlDbType.BigInt));
                SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@Report_Version", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@Curr_V_Approved", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@ItIsPI", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@Updatable", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@Upd_fromotherCenter", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@Upd_fromSameCenter_PIs", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@AnalysisType", SqlDbType.Int));
                SqlParCol["@ReportID"].Value = Session["Curr_ReportID"];
                SqlParCol["@UserID"].Value = Session["WiNGSMasterID"].ToString();
                SqlParCol["@Report_Version"].Value = Session["Curr_Report_Version"].ToString();
                SqlParCol["@Curr_V_Approved"].Direction = ParameterDirection.Output;
                SqlParCol["@ItIsPI"].Direction = ParameterDirection.Output;
                SqlParCol["@Updatable"].Direction = ParameterDirection.Output;
                Cmd.Parameters["@Upd_fromotherCenter"].Direction = ParameterDirection.Output;
                Cmd.Parameters["@Upd_fromSameCenter_PIs"].Direction = ParameterDirection.Output;
                Cmd.Parameters["@AnalysisType"].Value = Session["AnalysisType"];
                string Status = String.Empty;

                try
                {
                    Cmd.Connection.Open();
                    Cmd.ExecuteNonQuery();

                    hdn_Disable_CellClicking.Value = SqlParCol["@Curr_V_Approved"].Value.ToString();

                    Session["Report_Status"] = SqlParCol["@Curr_V_Approved"].Value.ToString();
                    Session["Report_Updated"] = SqlParCol["@Updatable"].Value.ToString();
                    Session["Report_ItIsPI"] =  SqlParCol["@ItIsPI"].Value.ToString();

                    switch (SqlParCol["@Curr_V_Approved"].Value.ToString())
                    {
                        case "0":
                            Status = "Generated";
                            break;
                        case "1":
                            Status = "Waiting";
                            break;
                        case "2":
                            Status = "Approved";
                            break;
                        case "3":
                            Status = "Rejeacted";
                            break;

                    }

                   switch (SqlParCol["@Updatable"].Value.ToString())
                    {
                        case "1":
                            switch (SqlParCol["@Curr_V_Approved"].Value.ToString())
                            {
                                case "0":
                                    switch (SqlParCol["@ItIsPI"].Value.ToString())
                                    {
                                        case "1":
                                              btn_SendToPI.Visible = false;
                                             btn_approve.Visible = true;
                                          //   btn_SendToPI.Text = "save";
                                          //  btn_Save.Visible = false;
                                            Lbl_ClinicarReport_Status.Text = Status;
                                            break;
                                        default:
                                       //     btn_SendToPI.Visible =false;
                                            Lbl_ClinicarReport_Status.Text = Status;
                                            break;
                                    }
                                    break;
                                case "1":
                                    switch (SqlParCol["@ItIsPI"].Value.ToString())
                                    {
                                        case "1":
                                            //   btn_SendToPI.Visible = false;
                                            btn_approve.Visible = true;
                                            //   btn_SendToPI.Text = "save";
                                            btn_SendToPI.Visible = false;
                                            Lbl_ClinicarReport_Status.Text = "Requested to be approved.";

                                            break;
                                        default:
                                             btn_SendToPI.Visible = false;
                                          //  btn_Save.Visible = false;
                                            Lbl_ClinicarReport_Status.Text = Status;
                                            break;
                                    }
                                    break;


                                case "2":  // report is approved
                                    RAF_ReportInfo.Enabled = false;
                                    RG_Report_Mutations.Enabled = false;
                                    btn_SendToPI.Visible = false;
                                    btn_Print.Text = "print";
                                    btn_Save.Visible = false;
                                    btn_approve.Visible = false;
                                    Lbl_ClinicarReport_Status.Text = Status;
                                    break;

                            }
                            break;
                        case "0":
                            switch (SqlParCol["@Curr_V_Approved"].Value.ToString())
                            {
                            case "2":
                            RAF_ReportInfo.Enabled = false;
                            RG_Report_Mutations.Enabled = false;
                            btn_SendToPI.Visible = false;
                            btn_Print.Text = "print";
                            btn_Save.Visible = false;
                            btn_approve.Visible = false;
                            Lbl_ClinicarReport_Status.Text = Status;
                             break;
                   
                             default:
                            btn_SendToPI.Visible = false;
                            btn_Save.Visible = false;
                            Lbl_ClinicarReport_Status.Text = Status;
                            break;
                            }
                            break;


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

        }

        public void DrawPedigree_Click()
        {
            string Curr_SampleID = string.Empty;
     
            StringBuilder Pedigree = new StringBuilder();
            string spouseGender = string.Empty;
            string SpouseTitle = string.Empty;
            string probandID = string.Empty;
            string Gender = string.Empty;

            SqlConnection conn = new SqlConnection(CnnStr);
            SqlCommand Cmd = new SqlCommand("Sp_GAP_ClininicalReport_FamilyMembers_sel", new SqlConnection(CnnStr));
            Cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlDataAdptrCmd.SelectCommand = Cmd;

            SqlParCol = Cmd.Parameters;
            SqlParCol.Add(new SqlParameter("@SampleID", SqlDbType.BigInt));
            SqlParCol["@SampleID"].Value = Session["SampleID_Filter"];

            DataTable myDataTable = new DataTable();
            conn.Open();
            try
            {
                SqlDataAdptrCmd.Fill(myDataTable);
            }
            finally
            {
                conn.Close();
            }

            if (myDataTable.Rows.Count > 1)
            {
                Pedigree.Append("{" + "\"" + "d" + "\"" + ":[");

                foreach (DataRow row in myDataTable.Rows)
                {
                    string RelationToProband = row["FamilyMemberTypeName"].ToString().Trim();
                    string name = (row["RelativeName"].ToString() != "") ? row["RelativeName"].ToString() : row["FamilyMemberTypeName"].ToString();
                    string status = (row["RelativeStatus"].ToString() == "0") ? "AS" : "";
                    Gender = (row["RelativeGender"].ToString() == "0") ? "F" : "M";
                    probandID = row["IndividualID"].ToString();



                    switch (RelationToProband)
                    {

                        case "Proband":
                            switch (Gender)
                            {
                                case "F":
                                    SpouseTitle = "vir";
                                    break;
                                case "M":
                                    SpouseTitle = "ux";
                                    break;
                                case "":
                                    SpouseTitle = "";
                                    break;
                            }
                            Session["ProbandID"] = probandID;
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ": 2, " + "\"" + "n" + "\"" + ":" + "\"" + probandID + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + Gender + "\"" + " ," + "\"" + "m" + "\"" + ": 1 ," + "\"" + "f" + "\"" + ":0, " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            //   Pedigree.Append("{" + "\"" + "key" + "\"" + ": 2, " + "\"" + "n" + "\"" + ":" + "\"" + probandID + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + Gender + "\"" + " ," + "\"" + "m" + "\"" + ": 1 ," + "\"" + "f" + "\"" + ":0, " + "\"" + SpouseTitle + "\"" + ":3" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Spouse":
                
                            switch (Gender)
                            {
                                case "F":
                                    SpouseTitle = "vir";
                                    break;
                                case "M":
                                    SpouseTitle = "ux";
                                    break;
                                case "":
                                    SpouseTitle = "";
                                    break;
                            }
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ": 3, " + "\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + Gender + "\"" + ", " + "\"" + SpouseTitle + "\"" + ": 2, " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                      break; 
                         case "Mother":
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ": 1, " + "\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "F" + "\"" + " ," + "\"" + "m" + "\"" + ": -13 , " + "\"" + "f" + "\"" + ":-12 , " + "\"" + "ux" + "\"" + ":0" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Father":
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ": 0, " + "\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "M" + "\"" + " ," + "\"" + "m" + "\"" + ": -11 , " + "\"" + "f" + "\"" + ":-10 , " + "\"" + "ux" + "\"" + ":1" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Paternal Grandmother":
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ": -11, " + "\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "F" + "\"" + "  , " + "\"" + "vir" + "\"" + ": -10" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Paternal Grandfather":
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ": -10, " + "\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "M" + "\"" + "  , " + "\"" + "ux" + "\"" + ": -11" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Maternal Grandmother":
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ": -13, " + "\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "F" + "\"" + ", " + "\"" + "vir" + "\"" + ": -12" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Maternal Grandfather":
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ": -12, " + "\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "M" + "\"" + " , " + "\"" + "ux" + "\"" + ": -13" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Brother":
                            Pedigree.Append("{" + "\"" + "key" + "\":" + row["Node_Key"] + ",\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "M" + "\"" + " ," + "\"" + "m" + "\"" + ": 1 , " + "\"" + "f" + "\"" + ":0" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Sister":
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ":" + row["Node_Key"] + ",\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "F" + "\"" + " ," + "\"" + "m" + "\"" + ": 1 , " + "\"" + "f" + "\"" + ":0" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Son":
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ":" + row["Node_Key"] + ", " + "\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "M" + "\"" + " ," + "\"" + "m" + "\"" + ": 3 , " + "\"" + "f" + "\"" + ":2" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Daughter":
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ":" + row["Node_Key"] + ", " + "\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "F" + "\"" + " ," + "\"" + "m" + "\"" + ": 3 , " + "\"" + "f" + "\"" + ":2" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Maternal Uncle":
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ":" + row["Node_Key"] + ", " + "\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "M" + "\"" + ", " + "\"" + "m" + "\"" + ": -13 , " + "\"" + "f" + "\"" + ":-12" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Maternal Aunt":
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ":" + row["Node_Key"] + ", " + "\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "F" + "\"" + ", " + "\"" + "m" + "\"" + ": -13 , " + "\"" + "f" + "\"" + ":-12" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Paternal Uncle":
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ":" + row["Node_Key"] + ", " + "\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "M" + "\"" + ", " + "\"" + "m" + "\"" + ": -11 , " + "\"" + "f" + "\"" + ":-10" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Paternal Aunt":
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ":" + row["Node_Key"] + ", " + "\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "F" + "\"" + ", " + "\"" + "m" + "\"" + ": -11 , " + "\"" + "f" + "\"" + ":-10" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;


                    }


                }


                String aa = Pedigree.ToString().Remove(Pedigree.ToString().LastIndexOf(","));
                aa = aa + "]}";
                Txt_PVal.Value = aa.ToString();

                string message = "init();";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);

            }
          
        }


        protected void btn_Update_Click(object sender, EventArgs e)
        {

            LinkButton lnk = sender as LinkButton;
            string arg = lnk.Attributes["CustomParameter"].ToString();
            string Physician_Name = string.Empty;
            string Report_Desc = string.Empty;
            string Report_Recom = string.Empty;
            string Report_Filter_Path = string.Empty;
            string MessageTo_PI = string.Empty;
            string MessageTo_User = string.Empty;
            foreach (RadDataFormItem item in RAF_ReportInfo.Items)
            {
                TextBox name = (TextBox)item.FindControl("Physician_Name");
                Physician_Name = name.Text;
                RadEditor Desc = (RadEditor)item.FindControl("Report_Desc");
                Report_Desc = Desc.Text;
                RadEditor Recom = (RadEditor)item.FindControl("Report_Recom");
                Report_Recom = Recom.Text;
                RadEditor Filter_Path = (RadEditor)item.FindControl("Report_Filter_Path");
                Report_Filter_Path = Filter_Path.Text;
                RadEditor MPI = (RadEditor)item.FindControl("MessageTo_PI");
                MessageTo_PI = MPI.Text;
                RadEditor MU = (RadEditor)item.FindControl("MessageTo_User");
                MessageTo_User = MU.Text;

            }

            SqlConnection conn = new SqlConnection(CnnStr);

            SqlCommand cmd = new SqlCommand("Sp_GAP_Report_Upd", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = cmd.Parameters;

            SqlParCol.Add(new SqlParameter("@ReportID", SqlDbType.BigInt));
            SqlParCol.Add(new SqlParameter("@Report_Version", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@Report_Desc", SqlDbType.NVarChar, -1));
            SqlParCol.Add(new SqlParameter("@Report_Recom", SqlDbType.NVarChar, -1));
            SqlParCol.Add(new SqlParameter("@Report_Filter_Path", SqlDbType.NVarChar, -1));
            SqlParCol.Add(new SqlParameter("@UserID_Change", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@Status", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@Message_To_PI", SqlDbType.NVarChar, -1));
            SqlParCol.Add(new SqlParameter("@Message_To_User", SqlDbType.NVarChar, -1));
            SqlParCol.Add(new SqlParameter("@Referal_MD", SqlDbType.NVarChar, 50));


            SqlParCol["@ReportID"].Value = Session["Curr_ReportID"];
            SqlParCol["@Report_Version"].Value = Session["Curr_Report_Version"];
            SqlParCol["@Report_Desc"].Value = Report_Desc;
            SqlParCol["@Report_Recom"].Value = Report_Recom;
            SqlParCol["@Report_Filter_Path"].Value = Report_Filter_Path;
            SqlParCol["@UserID_Change"].Value = Session["WiNGSMasterID"].ToString();


            switch (Session["Report_Status"])
            {
                case "0":
                    switch (Session["Report_ItIsPI"])
                    {
                        case "0":
                            switch (arg)
                            {
                                case "Save":
                                    SqlParCol["@Status"].Value = Session["Report_Status"].ToString();
                                    break;
                                case "SendToPI":
                                    SqlParCol["@Status"].Value = 1;
                                    break;
                            }
                            break;
                        case "1":
                            switch (arg)
                            {
                                case "Save":
                                    SqlParCol["@Status"].Value = Session["Report_Status"].ToString();
                                    break;
                            }
                            break;
                    }
                    break;
                case "1":
                    SqlParCol["@Status"].Value = Session["Report_Status"].ToString();
                    break;
            }
     
         
            SqlParCol["@Message_To_PI"].Value = MessageTo_PI;
            SqlParCol["@Message_To_User"].Value = MessageTo_User;
            SqlParCol["@Referal_MD"].Value = Physician_Name;

            try
            {
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                if (arg == "SendToPI" )
                { 
                    btn_SendToPI.Text = "save";
                    btn_Save.Visible = false;
                    Lbl_ClinicarReport_Status.Text = "Waiting";
                }

            }
            catch (Exception ex)
            {
                Label lblError = new Label();
                lblError.Text = "Unable to update. Reason: " + ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;

            }
        }

        protected void RG_Report_Mutations_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;

                GridDataItem dataItem = e.Item as GridDataItem;

                if(Session["AnalysisType"].Equals("1"))
                {
                    HiddenField InWhichOneExists = (HiddenField)item.FindControl("hdn_InWhichOneExists");
                    string InWhichOneExsits_Val = InWhichOneExists.Value.ToString();

                    Image img_Female = (Image)item.FindControl("img_Female");
                    Image img_Male = (Image)item.FindControl("img_Male");

                    switch (InWhichOneExsits_Val)
                    {
                        case "0":
                            img_Male.ImageUrl = "/img/icon/cs_Yes_Male.png";
                            img_Female.Visible = false;
                         //   img_mutation.ToolTip = "SNP";
                            break;
                        case "1":
                            img_Male.Visible = false;
                            img_Female.ImageUrl = "/img/icon/cs_Yes_Female.png";
                        //    img_mutation.ToolTip = "Deletion";
                            break;
                        case "2":
                            img_Male.ImageUrl = "/img/icon/cs_Yes_Male.png";
                            img_Female.ImageUrl = "/img/icon/cs_Yes_Female.png";
                            //   img_mutation.ToolTip = "Insertion";
                            break;
                        case "3":  //InFemale_NotMale
                            img_Male.ImageUrl = "/img/icon/cs_No_Male.png";
                            img_Female.ImageUrl = "/img/icon/cs_Yes_Female.png";
                            //     img_mutation.ToolTip = "Others";
                            break;
                        case "4":  // In Male not Female
                            img_Male.ImageUrl = "/img/icon/cs_Yes_Male.png";
                            img_Female.ImageUrl = "/img/icon/cs_Male_Female.png";
                            //    img_mutation.ToolTip = "Others";
                            break;
                    }

                }

                HiddenField hdnsp = (HiddenField)item.FindControl("hdn_Diagnosis_Type");


                string sp = hdnsp.Value.ToString();
                ImageButton Primary_Mutaion = (ImageButton)item.FindControl("Primary_Mutation");
                ImageButton Secondary_Monogenic_Mutation = (ImageButton)item.FindControl("Secondary_Monogenic_Mutation");
                ImageButton Secondary_Carrier_Mutation = (ImageButton)item.FindControl("Secondary_Carrier_Mutation");


                switch (sp)
                {
                    case "0":
                        Primary_Mutaion.ImageUrl = "/img/icon/icon_Report_Mutation_Selected.png";
                        Secondary_Monogenic_Mutation.ImageUrl = "/img/icon/icon_Report_Mutation_Unselected.png";
                        Secondary_Carrier_Mutation.ImageUrl = "/img/icon/icon_Report_Mutation_Unselected.png";

                        break;
                    case "1":
                        Secondary_Carrier_Mutation.ImageUrl = "/img/icon/icon_Report_Mutation_Selected.png";
                        Primary_Mutaion.ImageUrl = "/img/icon/icon_Report_Mutation_Unselected.png";
                        Secondary_Monogenic_Mutation.ImageUrl = "/img/icon/icon_Report_Mutation_Unselected.png";
                        break;
                    case "2":
                        Secondary_Monogenic_Mutation.ImageUrl = "/img/icon/icon_Report_Mutation_Selected.png";
                        Primary_Mutaion.ImageUrl = "/img/icon/icon_Report_Mutation_Unselected.png";
                        Secondary_Carrier_Mutation.ImageUrl = "/img/icon/icon_Report_Mutation_Unselected.png";
                        break;

                }


                //HiddenField hdn_mutation = (HiddenField)item.FindControl("hdn_mutation_Type");
                //string mutation = hdn_mutation.Value.ToString();
                //Image img_mutation = (Image)item.FindControl("img_mutation");
                //switch (mutation)
                //{
                //    case "SNP":
                //        img_mutation.ImageUrl = "/img/icon/icon_SNP.png";
                //        img_mutation.ToolTip = "SNP";
                //        break;
                //    case "Deletion":
                //        img_mutation.ImageUrl = "/img/icon/icon_deletion.png";
                //        img_mutation.ToolTip = "Deletion";
                //        break;
                //    case "Insertion":
                //        img_mutation.ImageUrl = "/img/icon/icon_insertion.png";
                //        img_mutation.ToolTip = "Insertion";
                //        break;
                //    case "Others":
                //        img_mutation.ImageUrl = "/img/icon/icon_others.png";
                //        img_mutation.ToolTip = "Others";
                //        break;
                //    default:
                //        img_mutation.ImageUrl = "/img/icon/icon_others.png";
                //        img_mutation.ToolTip = "Others";
                //        break;
                //}
              

            }



        }
        protected void RG_Report_Mutations_ItemUpdated(object sender, GridUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
            }
            else
            {
            }
        }

        protected void RG_Report_Mutations_ItemCommand(object sender, GridCommandEventArgs e)
        {


            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;


                if (e.CommandName == "PrimaryMutation" || e.CommandName == "SecondaryCarrierMutation" || e.CommandName == "SecondaryMonogenicMutation")
                {
                    SqlConnection conn = new SqlConnection(CnnStr);
                    conn.Open();
                    int MutationType = 0;

                    Label Mutation_Desc = (Label)item.FindControl("lbl_Mutatation_Desc");

                    if (e.CommandName == "PrimaryMutation")
                    {
                        MutationType = 0;
                    }
                    if (e.CommandName == "SecondaryCarrierMutation")
                    {
                        MutationType = 1;
                    }
                    if (e.CommandName == "SecondaryMonogenicMutation")
                    {
                        MutationType = 2;
                    }

                    //ImageButton imgspNA = (ImageButton)item.FindControl("Primary_Mutation");
                    //ImageButton imgsp_Carrier = (ImageButton)item.FindControl("Secondary_Carrier_Mutation");
                    //ImageButton imgsp_Monogenic = (ImageButton)item.FindControl("Secondary_Monogenic_Mutation");
                    RadComboBox RCB_classification = (RadComboBox)item.FindControl("Classification");

                    HiddenField hdnsp = (HiddenField)item.FindControl("hdn_Diagnosis_Type");

                    SqlCommand Cmd = new SqlCommand("Sp_GAP_Report_Items_Upd", new SqlConnection(CnnStr));
                    Cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = Cmd.Parameters;
                    SqlParCol.Add(new SqlParameter("@ReportID", SqlDbType.BigInt));
                    SqlParCol.Add(new SqlParameter("@Report_Version", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@CHR", SqlDbType.NVarChar, 2));
                    SqlParCol.Add(new SqlParameter("@START", SqlDbType.BigInt));
                    SqlParCol.Add(new SqlParameter("@END", SqlDbType.BigInt));
                    SqlParCol.Add(new SqlParameter("@Ref", SqlDbType.NVarChar, 300));
                    SqlParCol.Add(new SqlParameter("@ALT", SqlDbType.NVarChar, 300));
                    SqlParCol.Add(new SqlParameter("@UpdateValue", SqlDbType.NVarChar, 300));
                    SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@UpdateType", SqlDbType.Int));
                    SqlParCol["@ReportID"].Value = Session["Curr_ReportID"];
                    SqlParCol["@Report_Version"].Value = Session["Curr_Report_Version"];
                    SqlParCol["@CHR"].Value = item["CHR"].Text;
                    SqlParCol["@START"].Value = item["START"].Text;
                    SqlParCol["@END"].Value = item["END"].Text;
                    SqlParCol["@Ref"].Value = item["Ref"].Text;
                    SqlParCol["@ALT"].Value = item.GetDataKeyValue("ALT").ToString();
                    SqlParCol["@UpdateValue"].Value = MutationType;
                    SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
                    SqlParCol["@UpdateType"].Value = 3; //update MutationType

                    try
                    {
                        Cmd.Connection.Open();
                        Cmd.ExecuteNonQuery();
                        Cmd.Connection.Close();
                        RG_Report_Mutations.Rebind();
                    }
                    catch (Exception ex)
                    {
                        Label lblError = new Label();
                        lblError.Text = "Unable to Update. Reason: " + ex.Message;
                        lblError.ForeColor = System.Drawing.Color.Red;
                    }


                }

                if (e.CommandName == "Delete")
                {
                    string ReportID = item.GetDataKeyValue("ReportID").ToString();
                    SqlConnection cnn = new SqlConnection(CnnStr);
                    SqlCommand cmd = new SqlCommand("Sp_GAP_Report_Item_Del", cnn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlDataAdptrCmd.DeleteCommand = cmd;
                    SqlParCol = cmd.Parameters;

                    string Chromosome = item.GetDataKeyValue("CHR").ToString();
                    string START = item.GetDataKeyValue("START").ToString();
                    string END = item.GetDataKeyValue("END").ToString();
                    string Ref = item.GetDataKeyValue("Ref").ToString();
                    string ALT = item.GetDataKeyValue("ALT").ToString();

                    SqlParCol.Add(new SqlParameter("@ReportID", SqlDbType.BigInt));
                    SqlParCol.Add(new SqlParameter("@Report_Version", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@CHR", SqlDbType.NVarChar, 2));
                    SqlParCol.Add(new SqlParameter("@START", SqlDbType.BigInt));
                    SqlParCol.Add(new SqlParameter("@END", SqlDbType.BigInt));
                    SqlParCol.Add(new SqlParameter("@Ref", SqlDbType.NVarChar, 300));
                    SqlParCol.Add(new SqlParameter("@ALT", SqlDbType.NVarChar, 300));
                    SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                    SqlParCol["@ReportID"].Value = Session["Curr_ReportID"];
                    SqlParCol["@Report_Version"].Value = Session["Curr_Report_version"];
                    SqlParCol["@CHR"].Value = Chromosome;
                    SqlParCol["@START"].Value = START;
                    SqlParCol["@END"].Value = END;
                    SqlParCol["@Ref"].Value = Ref;
                    SqlParCol["@ALT"].Value = ALT;
                    SqlParCol["@UserID"].Value = Session["WiNGSMasterID"];

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

                if (e.CommandName == "GoToMutaionInfo")
                {
                    Session["CHR_MutationDetail"] = item.GetDataKeyValue("CHR").ToString();
                    Session["START_MutationDetail"] = item.GetDataKeyValue("START").ToString();
                    Session["END_MutationDetail"] = item.GetDataKeyValue("END").ToString();
                    Session["Ref_MutationDetail"] = item.GetDataKeyValue("Ref").ToString();
                    Session["ALT_MutationDetail"] = item.GetDataKeyValue("ALT").ToString();

                    if (Session["AnalysisType"].Equals("0")) // single sample
                    { 
                         Session["DetailType_Mutation"] = 1; // one sample
                         Session["Sample_MutationDetail"] = item.GetDataKeyValue("ReportID").ToString();
                         Session["InWhichOneExists"] = -1;
                    }


                    if (Session["AnalysisType"].Equals("1")) // carrier screening
                    {
                        HiddenField InWhichOneExists = (HiddenField)item.FindControl("hdn_InWhichOneExists");
                        string InWhichOneExsits_Val = InWhichOneExists.Value.ToString();
                        string Prefix_Tbl = "Tbl_CS_"; 

                        switch (InWhichOneExsits_Val)
                        {
                            case "0":
                                Session["DetailType_Mutation"] = 1; // one sample /male
                                Session["Sample_MutationDetail"] = Session["MaleID"];
                                Session["InWhichOneExists"] = 0;
                                break;
                            case "1":
                                Session["DetailType_Mutation"] = 1; // one sample /Female
                                Session["Sample_MutationDetail"] = Session["FemaleID"];
                                Session["InWhichOneExists"] = 1;
                                break;
                            case "2":
                                Session["DetailType_Mutation"] = 2; // two samples
                                Session["Sample_MutationDetail"] = Prefix_Tbl + item.GetDataKeyValue("ReportID").ToString() + "_1";
                                Session["InWhichOneExists"] = 2;
                                break;
                            case "3":  //InFemale_NotMale
                                Session["DetailType_Mutation"] = 1; // one sample
                                Session["Sample_MutationDetail"] = Prefix_Tbl + item.GetDataKeyValue("ReportID").ToString() + "_2";
                                Session["InWhichOneExists"] = 3;
                                break;
                            case "4":  // In Male not Female
                                Session["DetailType_Mutation"] = 1; // one sample
                                Session["Sample__MutationDetail"] = Prefix_Tbl + item.GetDataKeyValue("ReportID").ToString() + "_3";
                                Session["InWhichOneExists"] = 4;
                                break;
                          
                          
                        }
                    }

                    string message = "OpenWin_MutationDetails();";
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
                    //  Response.Redirect(String.Format("MutationDetails.aspx"));
                }


                if (e.CommandName == "GoToDrawSanger")
                {
                 //   Session["Sample_Report_ID_MutationDetail"] = item.GetDataKeyValue("ReportID").ToString();
                    Session["CHR_MutationDetail"] = item.GetDataKeyValue("CHR").ToString();
                    Session["START_MutationDetail"] = item.GetDataKeyValue("START").ToString();
                    Session["END_MutationDetail"] = item.GetDataKeyValue("END").ToString();

                    string message = "OpenWinSanger();";
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
                }


                if (e.CommandName == "Mutation_Desc")
                {
                    HiddenField row = (HiddenField)FindControl("hdn_RowID_In_EditMODE");
                    int r = Convert.ToInt16(row.Value.ToString());

                    Session["Chromosome_Mutation_Desc"] = RG_Report_Mutations.MasterTableView.Items[r].GetDataKeyValue("CHR").ToString();
                    Session["START_Mutation_Desc"] = RG_Report_Mutations.MasterTableView.Items[r].GetDataKeyValue("START").ToString();
                    Session["END_Mutation_Desc"] = RG_Report_Mutations.MasterTableView.Items[r].GetDataKeyValue("END").ToString();
                    Session["Ref_Mutation_Desc"] = RG_Report_Mutations.MasterTableView.Items[r].GetDataKeyValue("Ref").ToString();
                    Session["ALT_Mutation_Desc"] = RG_Report_Mutations.MasterTableView.Items[r].GetDataKeyValue("ALT").ToString();

                    RadLabel lbl_Disease = (RadLabel)item.FindControl("lbl_Disease");
                    Session["Disease_Mutation_Desc"] = lbl_Disease.Text;

                    RadLabel lbl_Inheritance = (RadLabel)item.FindControl("lbl_Inheritance");
                    Session["Inheritance_Mutation_Desc"] = lbl_Inheritance.Text;

                    RadLabel lbl_Classification = (RadLabel)item.FindControl("lbl_Classification");
                    Session["Classification_Mutation_Desc"] = lbl_Classification.Text;

                    HiddenField hdn_Diagnosis_Type = (HiddenField)item.FindControl("hdn_Diagnosis_Type");
                    Session["Diagnosis_Type_Mutation_Desc"] = hdn_Diagnosis_Type.Value;


                    string message = "OpenWinMutation_Desc();";
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
                }

                if (e.CommandName == "Classification")
                {
                    (RG_Report_Mutations.MasterTableView.GetColumn("Classification") as GridTemplateColumn).ReadOnly = false;
                    HiddenField row = (HiddenField)FindControl("hdn_RowID_In_EditMODE");
                    int r = Convert.ToInt16(row.Value.ToString());
                    RG_Report_Mutations.MasterTableView.Items[r].Edit = true; // Set in EditMode 
                    (RG_Report_Mutations.MasterTableView.GetColumn("Inheritance") as GridTemplateColumn).ReadOnly = true;
                    (RG_Report_Mutations.MasterTableView.GetColumn("Disease") as GridTemplateColumn).ReadOnly = true;

                }

                if (e.CommandName == "Inheritance")
                {

                    (RG_Report_Mutations.MasterTableView.GetColumn("Inheritance") as GridTemplateColumn).ReadOnly = false;
                    HiddenField row = (HiddenField)FindControl("hdn_RowID_In_EditMODE");
                    int r = Convert.ToInt16(row.Value.ToString());
                    RG_Report_Mutations.MasterTableView.Items[r].Edit = true; // Set in EditMode 
                    (RG_Report_Mutations.MasterTableView.GetColumn("Classification") as GridTemplateColumn).ReadOnly = true;
                    (RG_Report_Mutations.MasterTableView.GetColumn("Disease") as GridTemplateColumn).ReadOnly = true;

                }

                if (e.CommandName == "Disease")
                {
                    (RG_Report_Mutations.MasterTableView.GetColumn("Disease") as GridTemplateColumn).ReadOnly = false;
                    HiddenField row = (HiddenField)FindControl("hdn_RowID_In_EditMODE");
                    int r = Convert.ToInt16(row.Value.ToString());
                    RG_Report_Mutations.MasterTableView.Items[r].Edit = true; // Set in EditMode 
                    (RG_Report_Mutations.MasterTableView.GetColumn("Inheritance") as GridTemplateColumn).ReadOnly = true;
                    (RG_Report_Mutations.MasterTableView.GetColumn("Classification") as GridTemplateColumn).ReadOnly = true;

                }

                if (e.CommandName == "Update_INHERITANCE")
                {
                    SqlConnection conn = new SqlConnection(CnnStr);
                    conn.Open();


                    HiddenField hdn_CHR = (HiddenField)FindControl("hdn_CHR");
                    HiddenField hdn_START = (HiddenField)FindControl("hdn_START");
                    HiddenField hdn_END = (HiddenField)FindControl("hdn_END");
                    HiddenField hdn_Ref = (HiddenField)FindControl("hdn_Ref");
                    HiddenField hdn_ALT = (HiddenField)FindControl("hdn_ALT");
                    HiddenField hdn_INHERITANCE = (HiddenField)FindControl("hdn_RCB_INHERITANCE_Value");

                    SqlCommand Cmd = new SqlCommand("Sp_GAP_Report_Items_Upd", new SqlConnection(CnnStr));
                    Cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = Cmd.Parameters;
                    SqlParCol.Add(new SqlParameter("@ReportID", SqlDbType.BigInt));
                    SqlParCol.Add(new SqlParameter("@Report_Version", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@CHR", SqlDbType.NVarChar, 2));
                    SqlParCol.Add(new SqlParameter("@START", SqlDbType.BigInt));
                    SqlParCol.Add(new SqlParameter("@END", SqlDbType.BigInt));
                    SqlParCol.Add(new SqlParameter("@Ref", SqlDbType.NVarChar, 300));
                    SqlParCol.Add(new SqlParameter("@ALT", SqlDbType.NVarChar, 300));
                    SqlParCol.Add(new SqlParameter("@UpdateValue", SqlDbType.NVarChar, 300));
                    SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@UpdateType", SqlDbType.Int));
                    SqlParCol["@ReportID"].Value = Session["Curr_ReportID"];
                    SqlParCol["@Report_Version"].Value = Session["Curr_Report_Version"];
                    SqlParCol["@CHR"].Value = hdn_CHR.Value.ToString();
                    SqlParCol["@START"].Value = hdn_START.Value.ToString();
                    SqlParCol["@END"].Value = hdn_END.Value.ToString();
                    SqlParCol["@Ref"].Value = hdn_Ref.Value.ToString();
                    SqlParCol["@ALT"].Value = hdn_ALT.Value.ToString();
                    SqlParCol["@UpdateValue"].Value = hdn_INHERITANCE.Value.ToString();
                    SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
                    SqlParCol["@UpdateType"].Value = 1; //update INHERITANCE

                    try
                    {
                        Cmd.Connection.Open();
                        Cmd.ExecuteNonQuery();
                        Cmd.Connection.Close();

                        RG_Report_Mutations.Rebind();



                    }
                    catch (Exception ex)
                    {
                        Label lblError = new Label();
                        lblError.Text = "Unable to Update. Reason: " + ex.Message;
                        lblError.ForeColor = System.Drawing.Color.Red;
                    }


                }

                if (e.CommandName == "end")
                {
                    HiddenField row = (HiddenField)FindControl("hdn_RowID_In_EditMODE");
                    int r = Convert.ToInt16(row.Value.ToString());
                    RG_Report_Mutations.MasterTableView.Items[r].Edit = false; // Set in EditMode 
                }
                if (e.CommandName == "Update_Classification")
                {
                    SqlConnection conn = new SqlConnection(CnnStr);
                    conn.Open();

                    HiddenField hdn_CHR = (HiddenField)FindControl("hdn_CHR");
                    HiddenField hdn_START = (HiddenField)FindControl("hdn_START");
                    HiddenField hdn_END = (HiddenField)FindControl("hdn_END");
                    HiddenField hdn_Ref = (HiddenField)FindControl("hdn_Ref");
                    HiddenField hdn_ALT = (HiddenField)FindControl("hdn_ALT");
                    HiddenField hdn_Classifictaion = (HiddenField)FindControl("hdn_RCB_Classification_Value");

                    SqlCommand Cmd = new SqlCommand("Sp_GAP_Report_Items_Upd", new SqlConnection(CnnStr));
                    Cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = Cmd.Parameters;
                    SqlParCol.Add(new SqlParameter("@ReportID", SqlDbType.BigInt));
                    SqlParCol.Add(new SqlParameter("@Report_Version", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@CHR", SqlDbType.NVarChar, 2));
                    SqlParCol.Add(new SqlParameter("@START", SqlDbType.BigInt));
                    SqlParCol.Add(new SqlParameter("@END", SqlDbType.BigInt));
                    SqlParCol.Add(new SqlParameter("@Ref", SqlDbType.NVarChar, 300));
                    SqlParCol.Add(new SqlParameter("@ALT", SqlDbType.NVarChar, 300));
                    SqlParCol.Add(new SqlParameter("@UpdateValue", SqlDbType.NVarChar, 300));
                    SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@UpdateType", SqlDbType.Int));
                    SqlParCol["@ReportID"].Value = Session["Curr_ReportID"];
                    SqlParCol["@Report_Version"].Value = Session["Curr_Report_Version"];
                    SqlParCol["@CHR"].Value = hdn_CHR.Value.ToString();
                    SqlParCol["@START"].Value = hdn_START.Value.ToString();
                    SqlParCol["@END"].Value = hdn_END.Value.ToString();
                    SqlParCol["@Ref"].Value = hdn_Ref.Value.ToString();
                    SqlParCol["@ALT"].Value = hdn_ALT.Value.ToString();
                    SqlParCol["@UpdateValue"].Value = hdn_Classifictaion.Value.ToString();
                    SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
                    SqlParCol["@UpdateType"].Value = 0; //update Classification

                    try
                    {
                        Cmd.Connection.Open();
                        Cmd.ExecuteNonQuery();
                        Cmd.Connection.Close();
                        // RG_Report_Mutations.MasterTableView.Items[0].Edit = false; // Set in EditMode 
                       // R_Flag = -1;
                        RG_Report_Mutations.Rebind();

                    }
                    catch (Exception ex)
                    {
                        Label lblError = new Label();
                        lblError.Text = "Unable to Update. Reason: " + ex.Message;
                        lblError.ForeColor = System.Drawing.Color.Red;
                    }


                }

                if (e.CommandName == "Update_Disease")
                {
                    SqlConnection conn = new SqlConnection(CnnStr);
                    conn.Open();

                    HiddenField hdn_CHR = (HiddenField)FindControl("hdn_CHR");
                    HiddenField hdn_START = (HiddenField)FindControl("hdn_START");
                    HiddenField hdn_END = (HiddenField)FindControl("hdn_END");
                    HiddenField hdn_Ref = (HiddenField)FindControl("hdn_Ref");
                    HiddenField hdn_ALT = (HiddenField)FindControl("hdn_ALT");
                    HiddenField hdn_Disease = (HiddenField)FindControl("hdn_RCB_Disease_Value");

                    SqlCommand Cmd = new SqlCommand("Sp_GAP_Report_Items_Upd", new SqlConnection(CnnStr));
                    Cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = Cmd.Parameters;
                    SqlParCol.Add(new SqlParameter("@ReportID", SqlDbType.BigInt));
                    SqlParCol.Add(new SqlParameter("@Report_Version", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@CHR", SqlDbType.NVarChar, 2));
                    SqlParCol.Add(new SqlParameter("@START", SqlDbType.BigInt));
                    SqlParCol.Add(new SqlParameter("@END", SqlDbType.BigInt));
                    SqlParCol.Add(new SqlParameter("@Ref", SqlDbType.NVarChar, 300));
                    SqlParCol.Add(new SqlParameter("@ALT", SqlDbType.NVarChar, 300));
                    SqlParCol.Add(new SqlParameter("@UpdateValue", SqlDbType.NVarChar, 300));
                    SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@UpdateType", SqlDbType.Int));
                    SqlParCol["@ReportID"].Value = Session["Curr_ReportID"];
                    SqlParCol["@Report_Version"].Value = Session["Curr_Report_Version"];
                    SqlParCol["@CHR"].Value = hdn_CHR.Value.ToString();
                    SqlParCol["@START"].Value = hdn_START.Value.ToString();
                    SqlParCol["@END"].Value = hdn_END.Value.ToString();
                    SqlParCol["@Ref"].Value = hdn_Ref.Value.ToString();
                    SqlParCol["@ALT"].Value = hdn_ALT.Value.ToString();
                    SqlParCol["@UpdateValue"].Value = hdn_Disease.Value.ToString();
                    SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
                    SqlParCol["@UpdateType"].Value = 4; //update Disease

                    try
                    {
                        Cmd.Connection.Open();
                        Cmd.ExecuteNonQuery();
                        Cmd.Connection.Close();



                    }
                    catch (Exception ex)
                    {
                        Label lblError = new Label();
                        lblError.Text = "Unable to Update. Reason: " + ex.Message;
                        lblError.ForeColor = System.Drawing.Color.Red;
                    }


                }

                 RG_Report_Mutations.Rebind();
            }

        }

        protected void btn_approve_Click(object sender, EventArgs e)
        {
            string MessageTo_User = string.Empty;
            foreach (RadDataFormItem item in RAF_ReportInfo.Items)
            {
                RadEditor MU = (RadEditor)item.FindControl("MessageTo_User");
                MessageTo_User = MU.Text;

            }
       
            SqlConnection conn = new SqlConnection(CnnStr);

            SqlCommand cmd = new SqlCommand("Sp_GAP_Report_Approve_Upd", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = cmd.Parameters;

            SqlParCol.Add(new SqlParameter("@ReportID", SqlDbType.BigInt));
            SqlParCol.Add(new SqlParameter("@Report_Version", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@UserID_Approve", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@Status", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@Message_To_User", SqlDbType.NVarChar, -1));


            SqlParCol["@ReportID"].Value = Session["Curr_ReportID"];
            SqlParCol["@Report_Version"].Value = Session["Curr_Report_Version"];
            SqlParCol["@UserID_Approve"].Value = Session["WiNGSMasterID"].ToString();
            SqlParCol["@Status"].Value = 2;
            SqlParCol["@Message_To_User"].Value = MessageTo_User;

            try
            {
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                RAF_ReportInfo.Enabled = false;
                RG_Report_Mutations.Enabled = false;
                btn_SendToPI.Visible = false;
                 btn_Print.Text = "print";
                btn_approve.Visible = false;
                btn_Save.Visible = false;
                Lbl_ClinicarReport_Status.Text = "Approved";
                hdn_Disable_CellClicking.Value = "2";
                if (!Session["AnalysisType"].Equals("1")) // Carrier Screening
                {
                    DrawPedigree_Click();
                }

            }
            catch (Exception ex)
            {
                Label lblError = new Label();
                lblError.Text = "Unable to update. Reason: " + ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;

            }
        }

        protected void RCB_Disease_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            HiddenField R = (HiddenField)FindControl("hdn_RowID_In_EditMODE");
            int r = Convert.ToInt16(R.Value.ToString());

            SqlCommand Cmd = new SqlCommand("Sp_GAP_Report_Disease_Sel", new SqlConnection(CnnStr));
            Cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = Cmd.Parameters;
            SqlParCol.Add(new SqlParameter("@ReportID", SqlDbType.BigInt));
            SqlParCol.Add(new SqlParameter("@CHR", SqlDbType.NVarChar, 2));
            SqlParCol.Add(new SqlParameter("@START", SqlDbType.BigInt));
            SqlParCol.Add(new SqlParameter("@END", SqlDbType.BigInt));
            SqlParCol.Add(new SqlParameter("@Ref", SqlDbType.NVarChar, 300));
            SqlParCol.Add(new SqlParameter("@ALT", SqlDbType.NVarChar, 300));
            SqlParCol.Add(new SqlParameter("@InputType", SqlDbType.Int));

            SqlParCol["@ReportID"].Value = Session["Curr_ReportID"].ToString();
            SqlParCol["@CHR"].Value = RG_Report_Mutations.MasterTableView.Items[r].GetDataKeyValue("CHR").ToString();
            SqlParCol["@START"].Value = RG_Report_Mutations.MasterTableView.Items[r].GetDataKeyValue("START").ToString();
            SqlParCol["@END"].Value = RG_Report_Mutations.MasterTableView.Items[r].GetDataKeyValue("END").ToString();
            SqlParCol["@Ref"].Value = RG_Report_Mutations.MasterTableView.Items[r].GetDataKeyValue("Ref").ToString();
            SqlParCol["@ALT"].Value = RG_Report_Mutations.MasterTableView.Items[r].GetDataKeyValue("ALT").ToString();
            SqlParCol["@InputType"].Value = Convert.ToInt32(RG_Report_Mutations.MasterTableView.Items[r].GetDataKeyValue("InWhichOneExists").ToString()); //current table for variant


            SqlConnection conn = new SqlConnection(CnnStr);
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlDataAdptrCmd.SelectCommand = Cmd;


            DataTable Data = new DataTable();

            Cmd.Connection.Open();
            try
            {
                SqlDataAdptrCmd.Fill(Data);
            }
            finally
            {
                Cmd.Connection.Close();
            }

            RadComboBox comboBox = (RadComboBox)sender;
            // Clear the default Item that has been re-created from ViewState at this point.

           
            comboBox.Items.Clear();

            foreach (DataRow row in Data.Rows)
            {
                RadComboBoxItem item = new RadComboBoxItem();
                item.Text = row["Disease"].ToString();
                item.Value = row["Disease"].ToString();
                item.Attributes.Add("Disease", row["Disease"].ToString());
                comboBox.Items.Add(item);
                item.DataBind();
            }

          
        }

        protected void btn_CANCLE_Edit_Click(object sender, EventArgs e)
        {
            HiddenField row = (HiddenField)FindControl("hdn_RowID_In_EditMODE");
            int r = Convert.ToInt16(row.Value.ToString());
            RG_Report_Mutations.MasterTableView.Items[r].Edit = false; // Set in EditMode 
        }

        protected void btn_Print_Click(object sender, EventArgs e)
        {

            string message = "openWin();";
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
       
        }

        protected void save_pedigree_Click(object sender, EventArgs e)
        {
            string Path = "\\Upload\\Pedigree";
            string filepath = Server.MapPath(Path) + "\\" + Session["SampleID_Filter"].ToString() + "_Pedigree.png";

            HiddenField Pedigree_base64 = (HiddenField)FindControl("Pedigree_base64");
            string base64 = Pedigree_base64.Value;
            String substring = base64.Substring(22, base64.Length -22);

            var bytess = Convert.FromBase64String(substring);
            using (var imageFile = new FileStream(filepath, FileMode.Create))
            {
                imageFile.Write(bytess, 0, bytess.Length);
                imageFile.Flush();
            }
        }
    }  

}