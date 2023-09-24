using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;


namespace WebGAP.GAP.Popup
{
    public partial class uc_Report_Mutation_Description : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion} 

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }



        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string Description = String.Empty;
            string Recommendation = String.Empty;
            foreach (RadDataFormItem item in RAF_Mutation_Desc.Items)
            {

                {
                    RadEditor name = (RadEditor)item.FindControl("NOTE");
                    Description = name.Text;

                    RadEditor Recom = (RadEditor)item.FindControl("Mutation_Recom");
                    Recommendation = Recom.Text;

                    //    TextBox T1 = (TextBox)item.FindControl("TextBox1");
                    //    tt += T1.Text + " ";
                    //    Label l1 = (Label)item.FindControl("lbl1");
                    //    tt += l1.Text + " ";
                    //    Label l2 = (Label)item.FindControl("lbl2");
                    //    tt += l2.Text + " ";

                    //    TextBox T2 = (TextBox)item.FindControl("TextBox2");
                    //    tt += T2.Text + " ";
                    //    Label l3 = (Label)item.FindControl("lbl3");
                    //    tt += l3.Text + " ";
                    //    TextBox T3 = (TextBox)item.FindControl("TextBox3");
                    //    tt += T3.Text + " ";
                    //    Label l4 = (Label)item.FindControl("lbl4");
                    //    tt += l4.Text + " ";
                    //    TextBox T4 = (TextBox)item.FindControl("TextBox4");
                    //    tt += T4.Text + " ";
                    //    Label l5 = (Label)item.FindControl("lbl5");
                    //    tt += l5.Text + " ";
                    //    TextBox T5 = (TextBox)item.FindControl("TextBox5");
                    //    tt += T5.Text + " ";
                    //    TextBox T8 = (TextBox)item.FindControl("TextBox8");
                    //    tt += T8.Text + " ";
                    //    TextBox T6 = (TextBox)item.FindControl("TextBox6");
                    //    tt += T6.Text + " ";
                    //    TextBox T9 = (TextBox)item.FindControl("TextBox9");
                    //    tt += T9.Text + " ";
                    //    TextBox T7 = (TextBox)item.FindControl("TextBox7");
                    //    tt += T7.Text + " ";
                    //    Label l6 = (Label)item.FindControl("lbl6");
                    //    tt += l6.Text + " ";
                    //    Label l7 = (Label)item.FindControl("lbl7");
                    //    tt += l7.Text + " ";
                    //    TextBox T10 = (TextBox)item.FindControl("TextBox10");
                    //    tt += T10.Text + " ";
                    //    TextBox T11 = (TextBox)item.FindControl("TextBox11");
                    //    tt += T11.Text + " ";
                    //}
                }

                SqlConnection conn = new SqlConnection(CnnStr);
                conn.Open();

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
                SqlParCol.Add(new SqlParameter("@UpdateValue", SqlDbType.NVarChar, -1));
                SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@UpdateType", SqlDbType.Int));
                SqlParCol["@ReportID"].Value = Session["Curr_ReportID"].ToString();
                SqlParCol["@Report_Version"].Value = Session["Curr_Report_Version"].ToString();
                SqlParCol["@CHR"].Value = Session["Chromosome_Mutation_Desc"];
                SqlParCol["@START"].Value = Session["START_Mutation_Desc"];
                SqlParCol["@END"].Value = Session["END_Mutation_Desc"];
                SqlParCol["@Ref"].Value = Session["Ref_Mutation_Desc"];
                SqlParCol["@ALT"].Value = Session["ALT_Mutation_Desc"];
                SqlParCol["@UpdateValue"].Value = Description + "@#@"+ Recommendation;

                SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
                SqlParCol["@UpdateType"].Value = 2; //update Description and Recommendation
                try
                {
                    Cmd.Connection.Open();
                    Cmd.ExecuteNonQuery();
                    Cmd.Connection.Close();

                    string message = "CloseWindow();";
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
                }
                catch (Exception ex)
                {
                    Label lblError = new Label();
                    lblError.Text = "Unable to Update. Reason: " + ex.Message;
                    lblError.ForeColor = System.Drawing.Color.Red;
                }
            }




        }
    }
}