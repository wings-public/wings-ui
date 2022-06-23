using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.Entity.Core.EntityClient;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP
{
  
    public partial class Main : System.Web.UI.Page
    {

        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}


        protected void Page_Load(object sender, EventArgs e)
        {
            

            Load_UserActivity();
            if (!IsPostBack)
            {
                Bind_RDDL_Center();
                Bind_RDDL_PI();

                Check_NewCenter_Api();
            }
            
            if (Session["WiNGSApplication"].Equals("11"))
            {
                //RDDL_Center.Enabled = false;
                //RDDL_PI.Enabled = false;
                AppHolder.Visible = true;

            }

            if (Session["SelectedApp"] != null)
            {
                RDDL_Center.Enabled = true;
                RDDL_PI.Enabled = true;
            }



            //var matrix = new ConfusionMatrix(new int[,]
            //    {
            //                    /*                                Variant                            No-variant  */
            //                    /* Phenotype    */  {   10, 9 },
            //                    /* No-phenotype */  {   11, 13 },
            //    });

            //// totals match:
            //int[] rowTotals = matrix.RowTotals;
            //int[] colTotals = matrix.ColumnTotals;
            //int total = matrix.NumberOfSamples;


            //FisherTest FTest = new FisherTest(matrix);
            //double pValue = FTest.PValueToReturn;

            //double pPValue =
            //    (Factorial_Recursion(rowTotals[0]) * Factorial_Recursion(rowTotals[1]) *
            //    Factorial_Recursion(colTotals[0]) * Factorial_Recursion(colTotals[1])) /
            //    (Factorial_Recursion(10) * Factorial_Recursion(9) * 
            //    Factorial_Recursion(11) * Factorial_Recursion(13) * Factorial_Recursion(total));











            //// This QuickStart Sample illustrates the wide variety of goodness-of-fit
            //// tests available.

            ////
            //// Chi-square Test
            ////

            //Console.WriteLine("Chi-square test.");

            //// The Chi-square test is the simplest of the goodness-of-fit tests.
            //// The results follow a binomial distribution with 3 trials (rolls of the dice):
            //Extreme.Statistics.Distributions.BinomialDistribution sixesDistribution = new Extreme.Statistics.Distributions.BinomialDistribution(3, 1 / 6.0);

            //// First, create a histogram with the expected results.
            //var expected = sixesDistribution.GetExpectedHistogram(100);

            //// And a histogram with the actual results
            //var actual = Vector.Create(new double[] { 51, 35, 12, 2 });
            //var chiSquare = new ChiSquareGoodnessOfFitTest(actual, expected);
            //chiSquare.SignificanceLevel = 0.01;

            //// We can obtan the value of the test statistic through the Statistic property,
            //// and the corresponding P-value through the Probability property:
            //Console.WriteLine("Test statistic: {0:F4}", chiSquare.Statistic);
            //Console.WriteLine("P-value:        {0:F4}", chiSquare.PValue);

            //// We can now print the test results:
            //Console.WriteLine("Reject null hypothesis? {0}",
            //    chiSquare.Reject() ? "yes" : "no");

            ////
            //// One-sample Kolmogorov-Smirnov Test
            ////

            //Console.WriteLine("\nOne-sample Kolmogorov-Smirnov Test");

            //// We will investigate a sample of 25 random numbers from a lognormal distribution
            //// and investigate how well it matches a similar looking Weibull distribution.

            //// We first create the two distributions:
            //Extreme.Statistics.Distributions.LognormalDistribution logNormal = new Extreme.Statistics.Distributions.LognormalDistribution(0, 1);
            //Extreme.Statistics.Distributions.WeibullDistribution weibull = new Extreme.Statistics.Distributions.WeibullDistribution(2, 1);

            //// Then we generate the samples from the lognormal distribution:
            //var logNormalSample = logNormal.Sample(25);

            //// Finally, we construct the Kolmogorov-Smirnov test:
            //var ksTest = new OneSampleKolmogorovSmirnovTest(logNormalSample, weibull);

            //// We can obtan the value of the test statistic through the Statistic property,
            //// and the corresponding P-value through the Probability property:
            //Console.WriteLine("Test statistic: {0:F4}", ksTest.Statistic);
            //Console.WriteLine("P-value:        {0:F4}", ksTest.PValue);

            //// We can now print the test results:
            //Console.WriteLine("Reject null hypothesis? {0}",
            //    ksTest.Reject() ? "yes" : "no");

            ////
            //// Two-sample Kolmogorov-Smirnov Test
            ////

            //Console.WriteLine("\nTwo-sample Kolmogorov-Smirnov Test");

            //// We once again investigate the similarity between a lognormal and 
            //// a Weibull distribution. However, this time, we use 25 random
            //// samples from each distribution.

            //// We already have the lognormal samples.
            //// Generate the samples from the Weibull distribution:
            //var weibullSample = weibull.Sample(25);

            //// Finally, we construct the Kolmogorov-Smirnov test:
            //var ksTest2 = new Extreme.Statistics.Tests.TwoSampleKolmogorovSmirnovTest(logNormalSample, weibullSample);

            //// We can obtan the value of the test statistic through the Statistic property,
            //// and the corresponding P-value through the Probability property:
            //Console.WriteLine("Test statistic: {0:F4}", ksTest2.Statistic);
            //Console.WriteLine("P-value:        {0:F4}", ksTest2.PValue);

            //// We can now print the test results:
            //Console.WriteLine("Reject null hypothesis? {0}",
            //    ksTest2.Reject() ? "yes" : "no");

            ////
            //// Anderson-Darling Test
            ////

            //Console.WriteLine("\nAnderson-Darling Test");

            //// The Anderson-Darling is defined for a small number of
            //// distributions. Currently, only the normal distribution
            //// is supported.

            //// We will investigate the distribution of the strength
            //// of polished airplane windows. The data comes from 
            //// Fuller, e.al. (NIST, 1993) and represents the pressure
            //// (in psi).

            //// First, create a numerical variable:
            //var strength = Vector.Create(new double[]
            //    {18.830, 20.800, 21.657, 23.030, 23.230, 24.050,
            //        24.321, 25.500, 25.520, 25.800, 26.690, 26.770,
            //        26.780, 27.050, 27.670, 29.900, 31.110, 33.200,
            //        33.730, 33.760, 33.890, 34.760, 35.750, 35.910,
            //        36.980, 37.080, 37.090, 39.580, 44.045, 45.290,
            //        45.381});

            //// Let's print some summary statistics:
            //Console.WriteLine("Number of observations: {0}", strength.Length);
            //Console.WriteLine("Mean:                   {0:F3}", strength.Mean());
            //Console.WriteLine("Standard deviation:     {0:F3}", strength.StandardDeviation());

            //// The most refined test of normality is the Anderson-Darling test.
            //Extreme.Statistics.Tests.AndersonDarlingTest adTest = new Extreme.Statistics.Tests.AndersonDarlingTest(strength);

            //// We can obtan the value of the test statistic through the Statistic property,
            //// and the corresponding P-value through the Probability property:
            //Console.WriteLine("Test statistic: {0:F4}", adTest.Statistic);
            //Console.WriteLine("P-value:        {0:F4}", adTest.PValue);

            //// We can now print the test results:
            //Console.WriteLine("Reject null hypothesis? {0}",
            //    adTest.Reject() ? "yes" : "no");

            ////Console.Write("Press any key to exit.");
            ////Console.ReadLine();


            // ChiSquareTest chiSquareTest = new ChiSquareTest(observedArray, expectedArray, DOF);
            //double pVal = chiSquareTest.PValue; // gets p-value
            //bool sign = chiSquareTest.Significant; // true if statistically significant


            //int a = 12, b = 17, c = 4, d = 25;
            //double pvalue = StatsFunctions.FishersExactTest(a, b, c, d, HypothesisType.TwoSided);

        }       

        public void Load_UserActivity()
        {
            SqlConnection Conn = new SqlConnection(CnnStr);
            SqlCommand Cmd = new SqlCommand("Sp_User_Last_Activity", Conn);
            Cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();

            Cmd.Parameters.Add("@UserID", SqlDbType.Int);
            Cmd.Parameters.Add("@LLin", SqlDbType.VarChar, 10);
            Cmd.Parameters.Add("@ip", SqlDbType.VarChar, 100);

            Cmd.Parameters["@UserID"].Value = Session["WiNGSMasterId"].ToString();
            Cmd.Parameters["@LLin"].Direction = ParameterDirection.Output;
            Cmd.Parameters["@ip"].Direction = ParameterDirection.Output;

            SqlDataAdptrCmd.SelectCommand = Cmd;

            try
            {
                Cmd.Connection.Open();
                Cmd.ExecuteNonQuery();
                Cmd.Connection.Close();

                string url = string.Format("https://tools.keycdn.com/geo?host=" + Cmd.Parameters["@ip"].Value.ToString());
                IPLocation.Text = "here";
                IPLocation.NavigateUrl = url;
             
                LastLoginDate.Text = Cmd.Parameters["@LLin"].Value.ToString();

            }
            catch (Exception ex)
            {
                Console.WriteLine("Err:" + ex);
            }

        }

        //If there are some new centers have been assigned to the user, then add current own user panels to the new centers via API
        public void Check_NewCenter_Api()
        {
            SqlConnection Conn = new SqlConnection(CnnStr);
            SqlCommand Cmd = new SqlCommand("Sp_GAP_Filter_UPanel_Ins_API_CheckNewCenter", Conn);
            Cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();

            Cmd.Parameters.Add("@UserID", SqlDbType.Int);
            Cmd.Parameters["@UserID"].Value = Session["WiNGSMasterId"].ToString();

            SqlDataAdptrCmd.SelectCommand = Cmd;

            try
            {
                Cmd.Connection.Open();
                Cmd.ExecuteNonQuery();
                Cmd.Connection.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Err:" + ex);
            }

        }

        protected void RDDL_PI_SelectedIndexChanged(object sender, Telerik.Web.UI.DropDownListEventArgs e)
        {
            Session["Current_PIID"] = RDDL_PI.SelectedValue.ToString();
            Session["Current_PI"] = RDDL_PI.SelectedText.ToString();
            //  ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "drawChart", "get_jqueryData()", true);

        }

        protected void RDDL_Center_SelectedIndexChanged(object sender, DropDownListEventArgs e)
        {
            Session["Current_CenterID"] = RDDL_Center.SelectedValue.ToString();

            Session["Current_Center"] = RDDL_Center.SelectedText.ToString();

            RDDL_PI.Items.Clear();

            if (Session["ValidT"] == null || Session["ValidT"].ToString() != "NoAPI" || Session["WiNGSUserType"].ToString() == "0")

            {
                Session["Current_Host"] = (Session["Current_Host"] != null) ? Session["Current_Host"].ToString() : "1";

                Session["ValidT"] = CheckToken.CheckValidity(1, Session["WiNGSMasterId"].ToString(),

                                                 Session["WiNGSCenterID"].ToString(),

                                                (Session["Current_CenterID"] != null) ? Session["Current_CenterID"].ToString() : null,

                                                Session["Current_Host"].ToString());
                //(Convert.ToInt32(Session["Current_Host"]) > 0) ? Session["Current_Host"].ToString() : "0");

                Bind_RDDL_PI();

            }
        }

     

        protected void RDDL_Center_PreRender(object sender, EventArgs e)
        {
            if (Session["Current_CenterID"] == null || Session["Current_CenterID"].ToString() == ""  || RDDL_Center.SelectedValue.ToString() == "")
            {
                Session["Current_CenterID"] = RDDL_Center.SelectedValue.ToString();
                Session["Current_Center"] = RDDL_Center.SelectedText.ToString();

            }

            if (Session["Current_CenterID"] != null && Session["Current_CenterID"].ToString() != RDDL_Center.SelectedValue.ToString())
            {
                RDDL_Center.SelectedValue = Session["Current_CenterID"].ToString();
            
            }   

        }

        protected void RDDL_PI_PreRender(object sender, EventArgs e)
        {
            if (Session["Current_PIID"] == null || Session["Current_PIID"].ToString() == "" || RDDL_PI.SelectedValue.ToString() == "")
            {
                Session["Current_PIID"] = RDDL_PI.SelectedValue.ToString();
                Session["Current_PI"] = RDDL_PI.SelectedText.ToString();
            }


            if (Session["Current_PIID"] != null && Session["Current_PIID"].ToString() != RDDL_PI.SelectedValue.ToString() && !IsPostBack)
            {
                RDDL_PI.SelectedValue = Session["Current_PIID"].ToString();
                RDDL_PI.SelectedText = Session["Current_PI"].ToString();
            }
            
            else if (Session["Current_PIID"] != null && Session["Current_PIID"].ToString() != RDDL_PI.SelectedValue.ToString() && IsPostBack)
            {
                Session["Current_PIID"] = RDDL_PI.SelectedValue.ToString();
                Session["Current_PI"] = RDDL_PI.SelectedText.ToString();
            }

            //string dd = Session["Current_Host"].ToString();
             ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>  $(document).ready(function () { get_jqueryData();  });</script>", false);

           // ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Fun1", "get_jqueryData()", true);

        }

        protected void RBL_App_SelectedIndexChanged(object sender, EventArgs e)
        {
            RDDL_Center.Enabled = true;
            RDDL_PI.Enabled = true;
            Session["SelectedApp"] = RBL_App.SelectedValue;
            Session["Current_PIID"] = null;
            Response.Redirect("~/Main.aspx");
        }

        private void Bind_RDDL_Center()
        {
            RBL_App.SelectedValue = Session["PortalSelectedApp"].ToString();

            SqlConnection conn = new SqlConnection(CnnStr);
            string query = null;
            if (Session["PortalSelectedApp"] != null)
            {
                if (Session["PortalSelectedApp"].ToString().Equals("10") || Session["PortalSelectedApp"].ToString().Equals("11"))
                    query = "Sp_Center_Sel_ForDashboard";
                else if (Session["PortalSelectedApp"].ToString().Equals("01"))
                    query = "Sp_MinddsCenter_Sel_ForDashboard" ;
            }
            else
                query = "Center_Sel_ForDashboard";


            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@UserID", SqlDbType.Int);
            cmd.Parameters["@UserID"].Value = Convert.ToInt32(Session["WiNGSMasterId"]);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            ////close the SqlConnection
            conn.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                RDDL_Center.DataValueField = "CenterID";
                RDDL_Center.DataTextField = "CenterDesc";
                RDDL_Center.DataSource = ds;
                RDDL_Center.DataBind();

            }

        }

        private void Bind_RDDL_PI()
        {
            SqlConnection conn = new SqlConnection(CnnStr);
            string query = null;
            if (Session["PortalSelectedApp"] != null)
            {
                if (Session["PortalSelectedApp"].ToString().Equals("10") || Session["PortalSelectedApp"].ToString().Equals("11"))
                    query = "Sp_PI_Sel_ForDashboard";
                else if (Session["PortalSelectedApp"].ToString().Equals("01"))
                    query = "Sp_MinddsPI_Sel_ForDashboard";
            }
            else
                query = "Sp_PI_Sel_ForDashboard";


            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@UserID", SqlDbType.Int);
            cmd.Parameters.Add("@CenterID", SqlDbType.Int);
            cmd.Parameters["@UserID"].Value = Convert.ToInt32(Session["WiNGSMasterId"]);
            if (Session["Current_CenterID"] == null || Session["Current_CenterID"].ToString() == "")
            {
                cmd.Parameters["@CenterID"].Value = Convert.ToInt32(RDDL_Center.SelectedValue);
            }
            else
                cmd.Parameters["@CenterID"].Value = Convert.ToInt32(Session["Current_CenterID"].ToString());

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            ////close the SqlConnection
            conn.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                RDDL_PI.DataValueField = "PIID";
                RDDL_PI.DataTextField = "PIName";
                RDDL_PI.DataSource = ds;
                RDDL_PI.DataBind();

            }

        }

        //protected int GetUserType()
        //{
        //    int UType = -1;
        //    SqlConnection connection = new SqlConnection(CnnStr);
        //    SqlCommand com = new SqlCommand("SELECT dbo.Fnc_User_Type(@UserID)", connection);
        //    com.CommandType = CommandType.Text;

        //    com.Parameters.Add(new SqlParameter("@UserID", Session["WiNGSMasterId"].ToString()));
        //    if (com.Connection.State == ConnectionState.Closed) com.Connection.Open();
        //    try
        //    {
        //        var result = com.ExecuteScalar();
        //        UType = (int)result;
        //       // return (int)UType;
        //    }
        //    catch (Exception exc)
        //    {
        //        Console.Write("Error! " + exc.Message);
        //    }

        //    return UType;

        //}

    }
}