using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebGAP.GAP.CS.uc
{
    public partial class uc_CarrierScreening : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion} 

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                lbl_FemaleID.Text = Session["CS_FemaleID"].ToString();
                lbl_MaleID.Text = Session["CS_MaleID"].ToString();
                lbl_AnalysisID.Text = Session["CarrierScreeningID"].ToString();

                SqlConnection conn = new SqlConnection(CnnStr);
                SqlCommand Cmd = new SqlCommand("Sp_GAP_CarrierScreening_IndividualsInfo_Sel", new SqlConnection(CnnStr));
                Cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                SqlDataAdptrCmd.SelectCommand = Cmd;

                SqlParCol = Cmd.Parameters;
                SqlParCol.Add(new SqlParameter("@CarrierScreeningID", SqlDbType.BigInt));

                SqlParCol["@CarrierScreeningID"].Value = Session["CarrierScreeningID"];

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


                foreach (DataRow row in myDataTable.Rows)
                {
                    if (row["IndividualSex"].ToString() == "1")
                    {
                        Male_Name.Text = row["name_Individual"].ToString();
                        Male_age.Text = row["age"].ToString();
                        Male_SampleID.Text = row["SampleID"].ToString();
                        Male_IndividualID.Text = row["IndividualID"].ToString();
                        if (row["FamilyID"].ToString().Equals(""))
                        {
                            Male_FamilyID.Text = "No Family";
                            Rbtn_pedigree_M.Enabled = false;
                        }
                        else
                        { 
                            Male_FamilyID.Text = row["FamilyID"].ToString();
                            Session["PopUP_FamilyID"] = row["FamilyID"].ToString();
                        }
                    }
                    if (row["IndividualSex"].ToString() == "0")
                    {
                        Female_Name.Text = row["name_Individual"].ToString();
                        Female_age.Text = row["age"].ToString();
                        Female_SampleID.Text = row["SampleID"].ToString();
                        Female_IndividualID.Text = row["IndividualID"].ToString();
                        if (row["FamilyID"].ToString().Equals(""))
                        {
                            Female_FamilyID.Text = "No Family";
                            Rbtn_pedigree_F.Enabled = false;
                        }
                        else
                        {
                            Female_FamilyID.Text = row["FamilyID"].ToString();
                            Session["PopUP_FamilyID"] = row["FamilyID"].ToString();
                        }
                    }
                }
            }
        }

    

        protected void Rbtn_Count_Click(object sender, EventArgs e)
        {
           // string caseSwitch = Count_Type.SelectedValue.ToString();



            SqlConnection conn = new SqlConnection(CnnStr);
            SqlCommand Cmd = new SqlCommand("Sp_GAP_CarrierScreening_Count", new SqlConnection(CnnStr));
            Cmd.CommandType = CommandType.StoredProcedure;
           
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlDataAdptrCmd.SelectCommand = Cmd;

            SqlParCol = Cmd.Parameters;
            SqlParCol.Add(new SqlParameter("@FemaleID", SqlDbType.BigInt));
            SqlParCol.Add(new SqlParameter("@MaleID", SqlDbType.BigInt));
           SqlParCol.Add(new SqlParameter("@CarrierScreeningID", SqlDbType.BigInt));
            SqlParCol.Add(new SqlParameter("@All_F", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@All_M", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@In_M_Not_F", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@In_F_Not_M", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@In_M_In_F", SqlDbType.Int));


            SqlParCol["@FemaleID"].Value = Female_SampleID.Text;
            SqlParCol["@MaleID"].Value = Male_SampleID.Text;
            SqlParCol["@CarrierScreeningID"].Value = Session["CarrierScreeningID"];
            //switch (caseSwitch)
            //{
            //    case "0":
            //        SqlParCol["@InputType"].Value = "All";
            //        break;
            //    case "1":
            //        SqlParCol["@InputType"].Value = "SNP";
            //        break;
            //    case "2":
            //        SqlParCol["@InputType"].Value = "Deletion";
            //        break;
            //    case "3":
            //        SqlParCol["@InputType"].Value = "Insertion";
            //        break;
            //    default:
            //        SqlParCol["@InputType"].Value = "All";
            //        break;
            //}
            SqlParCol["@All_F"].Direction = ParameterDirection.Output;
            SqlParCol["@All_M"].Direction = ParameterDirection.Output;
            SqlParCol["@In_M_Not_F"].Direction = ParameterDirection.Output;
            SqlParCol["@In_F_Not_M"].Direction = ParameterDirection.Output;
            SqlParCol["@In_M_In_F"].Direction = ParameterDirection.Output;



            try
            {
                Cmd.Connection.Open();
                Cmd.ExecuteNonQuery();
                All_Female.Text = SqlParCol["@All_F"].Value.ToString();
                All_Male.Text = SqlParCol["@All_M"].Value.ToString();
                IN_Male_IN_Female.Text = SqlParCol["@In_M_In_F"].Value.ToString();
                In_Female_Not_Male.Text = SqlParCol["@In_F_Not_M"].Value.ToString();
                In_Male_Not_Female.Text = SqlParCol["@In_M_Not_F"].Value.ToString();
                Rbtn_INMale_INFemale.Visible = true;
                Rbtn_AllMale.Visible = true;
                Rbtn_AllFemale.Visible = true;
                Rbtn_InFemale_NotMale.Visible = true;
                Rbtn_InMale_NotFemale.Visible = true;

                conn.Close();

            }

            catch (Exception ex)
            {

            }




        }

        protected void Rbtn_HPO_F_Click(object sender, EventArgs e)
        {
            Session["IndividualID_For_HPO_SampleDiscovery"] = Female_IndividualID.Text;
            string message = "Open_HPO();";
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
        }



        protected void Rbtn_HPO_M_Click(object sender, EventArgs e)
        {
            Session["IndividualID_For_HPO_SampleDiscovery"] = Male_IndividualID.Text;
            string message = "Open_HPO();";
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
        }

    

        protected void Rbtn_AllMale_Click1(object sender, EventArgs e)
        {
            //string caseSwitch = Count_Type.SelectedValue.ToString();
            //switch (caseSwitch)
            //{
            //    case "0":
            //        Session["PreCondition_Filter"] = "0";
            //        break;
            //    case "1":
            //        Session["PreCondition_Filter"] = "SNP";
            //        break;
            //    case "2":
            //        Session["PreCondition_Filter"] = "deletion";
            //        break;
            //    case "3":
            //        Session["PreCondition_Filter"] = "insertion";
            //        break;
            //    default:
            //        Session["PreCondition_Filter"] = "0";
            //        break;
            //}


            Session["SampleID_Filter"] = Male_SampleID.Text;
            Session["InWhichOneExists"] = 0;// only male
            Session["CarrierScreeningID_Filter"] = Session["CarrierScreeningID"];
            Response.Redirect(String.Format("/GAP/CS/CSVariant_Filter.aspx"));
        }
  
        protected void Rbtn_AllFemale_Click(object sender, EventArgs e)
        {
            //string caseSwitch = Count_Type.SelectedValue.ToString();
            //switch (caseSwitch)
            //{
            //    case "0":
            //        Session["PreCondition_Filter"] = "0";
            //        break;
            //    case "1":
            //        Session["PreCondition_Filter"] = "SNP";
            //        break;
            //    case "2":
            //        Session["PreCondition_Filter"] = "deletion";
            //        break;
            //    case "3":
            //        Session["PreCondition_Filter"] = "insertion";
            //        break;
            //    default:
            //        Session["PreCondition_Filter"] = "0";
            //        break;
            //}


            Session["SampleID_Filter"] = Female_SampleID.Text;
            Session["InWhichOneExists"] = 1; // only female
          //  Session["InWhichOneExists"] = 1; 
            Session["CarrierScreeningID_Filter"] = Session["CarrierScreeningID"];
            Response.Redirect(String.Format("/GAP/CS/CSVariant_Filter.aspx")); 
        }

        protected void Rbtn_INMale_INFemale_Click(object sender, EventArgs e)
        {
            //string caseSwitch = Count_Type.SelectedValue.ToString();
            //switch (caseSwitch)
            //{
            //    case "0":
            //        Session["PreCondition_Filter"] = "0";
            //        break;
            //    case "1":
            //        Session["PreCondition_Filter"] = "SNP";
            //        break;
            //    case "2":
            //        Session["PreCondition_Filter"] = "deletion";
            //        break;
            //    case "3":
            //        Session["PreCondition_Filter"] = "insertion";
            //        break;
            //    default:
            //        Session["PreCondition_Filter"] = "0";
            //        break;
            //}


            Session["SampleID_Filter"] = "Tbl_CS_" + Session["CarrierScreeningID"].ToString() + "_1";
         //   Session["CS_ExistsINBoth"] = 1;
            Session["InWhichOneExists"] = 2;
            Session["CarrierScreeningID_Filter"] = Session["CarrierScreeningID"];
            Response.Redirect(String.Format("/GAP/CS/CSVariant_Filter.aspx")); // In BOTH
        }

        protected void Rbtn_InFemale_NotMale_Click(object sender, EventArgs e)
        {
            //string caseSwitch = Count_Type.SelectedValue.ToString();
            //switch (caseSwitch)
            //{
            //    case "0":
            //        Session["PreCondition_Filter"] = "0";
            //        break;
            //    case "1":
            //        Session["PreCondition_Filter"] = "SNP";
            //        break;
            //    case "2":
            //        Session["PreCondition_Filter"] = "deletion";
            //        break;
            //    case "3":
            //        Session["PreCondition_Filter"] = "insertion";
            //        break;
            //    default:
            //        Session["PreCondition_Filter"] = "0";
            //        break;
            //}


            Session["SampleID_Filter"] = "Tbl_CS_" + Session["CarrierScreeningID"].ToString() + "_2";
            Session["InWhichOneExists"] = 3;  //InFemale_NotMale
            Session["CarrierScreeningID_Filter"] = Session["CarrierScreeningID"];
            Response.Redirect(String.Format("/GAP/CS/CSVariant_Filter.aspx")); 
        }

        protected void Rbtn_InMale_NotFemale_Click(object sender, EventArgs e)
        {
            //string caseSwitch = Count_Type.SelectedValue.ToString();
            //switch (caseSwitch)
            //{
            //    case "0":
            //        Session["PreCondition_Filter"] = "0";
            //        break;
            //    case "1":
            //        Session["PreCondition_Filter"] = "SNP";
            //        break;
            //    case "2":
            //        Session["PreCondition_Filter"] = "deletion";
            //        break;
            //    case "3":
            //        Session["PreCondition_Filter"] = "insertion";
            //        break;
            //    default:
            //        Session["PreCondition_Filter"] = "0";
            //        break;
            //}


            Session["SampleID_Filter"] = "Tbl_CS_" + Session["CarrierScreeningID"].ToString() + "_3";
            //   Session["CS_ExistsINBoth"] = 0;
            Session["InWhichOneExists"] = 4;
            Session["CarrierScreeningID_Filter"] = Session["CarrierScreeningID"];
            Response.Redirect(String.Format("/GAP/CS/CSVariant_Filter.aspx"));  // In Male not Female
        }
    }
}
