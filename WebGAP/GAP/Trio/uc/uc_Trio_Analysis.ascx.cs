using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.GAP.Trio.uc
{
    // Father -> Control 1
    // Mother -> Control 2
    public partial class uc_Trio_Analysis : System.Web.UI.UserControl
    {

        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion} 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                
               // .Text = Session["Trio_Control1_ID"].ToString();
              //  lbl_Control2.Text = Session["Trio_Control2_ID"].ToString();
                lbl_AnalysisID.Text = Session["TriolocalID"].ToString();

                SqlConnection conn = new SqlConnection(CnnStr);
                SqlCommand Cmd = new SqlCommand("Sp_GAP_Trio_IndividualsInfo_Sel", new SqlConnection(CnnStr));
                Cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                SqlDataAdptrCmd.SelectCommand = Cmd;

                SqlParCol = Cmd.Parameters;
                SqlParCol.Add(new SqlParameter("@TriolocalID", SqlDbType.NVarChar, -1));
                SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.BigInt));
                SqlParCol.Add(new SqlParameter("@PIID", SqlDbType.BigInt));
                SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.BigInt));
                SqlParCol["@TriolocalID"].Value = Session["TriolocalID"].ToString();
                SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
                SqlParCol["@PIID"].Value = Session["Current_PIID"];
                SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];

                DataTable myDataTable = new DataTable();
                conn.Open();
                try
                {
                    SqlDataAdptrCmd.Fill(myDataTable);
                    conn.Close();

                    foreach (DataRow row in myDataTable.Rows)
                    {
                        if (row["IndividualID"].ToString().Equals(Session["Trio_ProbandID"].ToString()))
                        {
                            Proband_Name.Text = row["IndividualFullname"].ToString();
                            Proband_age.Text = row["age"].ToString();
                            Proband_SampleID.Text = row["LocalID"].ToString();
                            Proband_IndividualID.Text = row["IndividualID"].ToString();
                            lbl_Proband.Text = row["InLocalID"].ToString();
                            Session["Trio_ProbandlocalID"]= row["InLocalID"].ToString();
                            Session["Trio_ProbandGender"] = row["IndividualSex"].ToString();
                            if (row["IndividualSex"].ToString() == "0")
                            {
                                img_Header_P.Src = "/img/icon/cs_Female.png";
                                img_Proband.Src = "/img/icon/Female_s.png";
                            }
                            else if (row["IndividualSex"].ToString() == "1")
                            {
                                img_Proband.Src = "/img/icon/Male_s.png";
                                img_Header_P.Src = "/img/icon/cs_Male.png";
                            }
                            if (row["FamilyID"].ToString().Equals(""))
                            {
                                Proband_FamilyID.Text = "No Family";
                                Rbtn_pedigree_P.Enabled = false;
                            }
                            else
                                Proband_FamilyID.Text = row["FamilyID"].ToString();
                        }
                        if (row["IndividualID"].ToString().Equals(Session["Trio_Control1_ID"]))
                        {
                            Control1_Name.Text = row["IndividualFullname"].ToString();
                            Control1_age.Text = row["age"].ToString();
                            Control1_SampleID.Text = row["LocalID"].ToString();
                            Control1_IndividualID.Text = row["IndividualID"].ToString();
                            lbl_Control1.Text = row["InLocalID"].ToString();
                            Session["Trio_Control1localID"] = row["InLocalID"].ToString();
                            Session["Trio_Control1Gender"] = row["IndividualSex"].ToString();

                            if (row["IndividualSex"].ToString() == "0")
                            {
                                img_Header_C1.Src = "/img/icon/cs_Female.png";
                                img_Control1.Src = "/img/icon/Female_s.png";
                            }
                            else if (row["IndividualSex"].ToString() == "1")
                            {
                                img_Control1.Src = "/img/icon/Male_s.png";
                                img_Header_C1.Src = "/img/icon/cs_Male.png";
                            }
                           
                                Control1_FamilyID.Text = row["FamilyID"].ToString();
                        }
                        if (row["IndividualID"].ToString().Equals(Session["Trio_Control2_ID"]))
                        {
                            Control2_Name.Text = row["IndividualFullname"].ToString();
                            Control2_age.Text = row["age"].ToString();
                            Control2_SampleID.Text = row["LocalID"].ToString();
                            Control2_IndividualID.Text = row["IndividualID"].ToString();
                            lbl_Control2.Text = row["InLocalID"].ToString();
                            Session["Trio_Control2localID"] = row["InLocalID"].ToString();
                            Session["Trio_Control2Gender"] = row["IndividualSex"].ToString();
                        
                            if (row["IndividualSex"].ToString() == "0")
                            {
                                img_Header_C2.Src = "/img/icon/cs_Female.png";
                                img_Control2.Src = "/img/icon/Female_s.png";
                            }
                            else if (row["IndividualSex"].ToString() == "1")
                            {
                                img_Control2.Src = "/img/icon/Male_s.png";
                                img_Header_C2.Src = "/img/icon/cs_Male.png";
                            }
                         
                                Control2_FamilyID.Text = row["FamilyID"].ToString();
                        }
                    }

               //     Count_Result();
                }
                catch (Exception ex)
                {
                    
                }


               
            }
        }

        
        protected void Rbtn_HPO_C2_Click(object sender, EventArgs e)
        {
            Session["IndividualID_For_HPO_SampleDiscovery"] = Control2_IndividualID.Text;
            string message = "Open_HPO();";
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
        }



        protected void Rbtn_HPO_C1_Click(object sender, EventArgs e)
        {
            Session["IndividualID_For_HPO_SampleDiscovery"] = Control1_IndividualID.Text;
            string message = "Open_HPO();";
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
        }


        protected void Rbtn_HPO_P_Click(object sender, EventArgs e)
        {
            Session["IndividualID_For_HPO_SampleDiscovery"] = Proband_IndividualID.Text;
            string message = "Open_HPO();";
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
        }
        protected void Rbtn_AllControl1_Click(object sender, EventArgs e)
        {
            Session["Trio_TotalCount"] = lbl_AllControl1.Text.ToString(); 

            Session["InWhichOneExists"] = "020";
            Session["TriolocalID_Filter"] = Session["TriolocalID"];
            Response.Redirect(String.Format("/GAP/Trio/TrioVariant_Filter.aspx"));
        }
        protected void Rbtn_AllProband_Click(object sender, EventArgs e)
        {
            Session["Trio_TotalCount"] = lbl_InProband.Text.ToString(); 

            Session["InWhichOneExists"] = "200";
            Session["TriolocalID_Filter"] = Session["TriolocalID"];
            Response.Redirect(String.Format("/GAP/Trio/TrioVariant_Filter.aspx"));
        }

        protected void Rbtn_AllControl2_Click(object sender, EventArgs e)
        {

            Session["Trio_TotalCount"] = lbl_AllControl2.Text.ToString(); 

            Session["InWhichOneExists"] = "002";
            Session["TriolocalID_Filter"] = Session["TriolocalID"];
            Response.Redirect(String.Format("/GAP/Trio/TrioVariant_Filter.aspx"));
        }



        protected void RG_Result_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
               
                GridDataItem item = (GridDataItem)e.Item;
                string InWhichOneExists = item.GetDataKeyValue("InWhichOneExists").ToString();
                 
                HiddenField Count_all = (HiddenField)item.FindControl("hdn_Count");
                string Count_all_str = Count_all.Value.ToString();
                ImageButton imgsp = (ImageButton)item.FindControl("Probandbtn");

                string exists_Proband = InWhichOneExists.Substring(0,1);
                string exists_Control1 = InWhichOneExists.Substring(1, 1);
                string exists_Control2 = InWhichOneExists.Substring(2, 1);

                switch (exists_Proband)
                {
                    case "0":
                        imgsp.ImageUrl = "/img/icon/icon_test_no_selected.png";
                        break;
                    case "1":
                        imgsp.ImageUrl = "/img/icon/icon_test_yes_selected_15.png";
                        break;
                    case "2":
                        lbl_InProband.Text = Count_all_str;
                        item.Display = false;  //hide the row
                        break;
                }
               
                
                ImageButton imgControl_1 = (ImageButton)item.FindControl("Control_1btn");
                switch (exists_Control1)
                {
                    case "0":
                        imgControl_1.ImageUrl = "/img/icon/icon_test_no_selected.png";
                        break;
                    case "1":
                        imgControl_1.ImageUrl = "/img/icon/icon_test_yes_selected_15.png";
                        break;
                    case "2":
                        lbl_AllControl1.Text = Count_all_str;
                        item.Display = false;  //hide the row
                        break;

                }

             
                ImageButton imgControl_2 = (ImageButton)item.FindControl("Control_2btn");
                switch (exists_Control2)
                {
                    case "0":
                        imgControl_2.ImageUrl = "/img/icon/icon_test_no_selected.png";
                        break;
                    case "1":
                        imgControl_2.ImageUrl = "/img/icon/icon_test_yes_selected_15.png";
                        break;
                    case "2":
                        lbl_AllControl2.Text = Count_all_str;
                        item.Display = false;  //hide the row
                        break;

                }

            }
        }

        protected void RG_Result_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if(e.CommandName.Equals("GoToFilter"))
            {
                if (e.Item is GridDataItem)
                {
                    GridDataItem item = (GridDataItem)e.Item;
                    HiddenField Count_all = (HiddenField)item.FindControl("hdn_Count");
                    string Count_all_str = Count_all.Value.ToString();
                    Session["Trio_TotalCount"] = Count_all_str;
                    Session["InWhichOneExists"] = item.GetDataKeyValue("InWhichOneExists").ToString();
                    Session["TriolocalID_Filter"] = Session["TriolocalID"];
                    Response.Redirect(String.Format("/GAP/Trio/TrioVariant_Filter.aspx"));

                }

            }
        }
    }
}
