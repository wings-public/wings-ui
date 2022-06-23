using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.GAP.uc
{
    public partial class uc_ExoneLoss_PerSample : System.Web.UI.UserControl
    {

        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}

        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_SampleID.Text = Request.QueryString["SampleID"];
        }

        protected void RG_ExonLoss_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            SqlConnection conn = new SqlConnection(CnnStr);
            SqlCommand Cmd = new SqlCommand("Sp_GAP_ExoneLoss_Sel", new SqlConnection(CnnStr));
            Cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlDataAdptrCmd.SelectCommand = Cmd;

            SqlParCol = Cmd.Parameters;

            SqlParCol.Add(new SqlParameter("@SampleID", SqlDbType.BigInt));
            SqlParCol.Add(new SqlParameter("@Gene", SqlDbType.VarChar));

            SqlParCol["@SampleID"].Value = Convert.ToInt64(Request.QueryString["SampleID"]);
            if (!String.IsNullOrEmpty(hdn_searchGene.Value) && hdn_searchGene.Value != "0")
                SqlParCol["@Gene"].Value = hdn_searchGene.Value;
            else
                SqlParCol["@Gene"].Value = "0";

            DataTable myDataTable = new DataTable();
            Cmd.Connection.Open();
            try
            {

                SqlDataAdptrCmd.Fill(myDataTable);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error : " + ex);
            }
            finally
            {
                Cmd.Connection.Close();
            }
            RG_ExonLoss.DataSource = myDataTable;
        }

        protected void RG_ByGene_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            SqlConnection conn = new SqlConnection(CnnStr);
            SqlCommand Cmd = new SqlCommand("Sp_GAP_ExoneLoss_Gene_Sel", new SqlConnection(CnnStr));
            Cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlDataAdptrCmd.SelectCommand = Cmd;

            SqlParCol = Cmd.Parameters;

            SqlParCol.Add(new SqlParameter("@SampleID", SqlDbType.BigInt));
            SqlParCol.Add(new SqlParameter("@Gene", SqlDbType.VarChar));

            SqlParCol["@SampleID"].Value = Convert.ToInt64(Request.QueryString["SampleID"]);
            if (!String.IsNullOrEmpty(hdn_searchGene_Tab2.Value) && hdn_searchGene_Tab2.Value != "0")
                SqlParCol["@Gene"].Value = hdn_searchGene_Tab2.Value;
            else
                SqlParCol["@Gene"].Value = "0";

            DataTable myDataTable = new DataTable();
            Cmd.Connection.Open();
            try
            {

                SqlDataAdptrCmd.Fill(myDataTable);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error : " + ex);
            }
            finally
            {
                Cmd.Connection.Close();
            }
            RG_ByGene.DataSource = myDataTable;

        }

    }
}