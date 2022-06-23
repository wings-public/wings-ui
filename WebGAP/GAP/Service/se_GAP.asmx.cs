using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace WebGAP.GAP.Service
{
    /// <summary>
    /// Summary description for se_GAP
    /// </summary>
    [WebService(Namespace = "http://wings.esat.kuleuven.be/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // [ScriptService]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class se_GAP : System.Web.Services.WebService
    {

        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}

        [WebMethod]
        public object InputFile_Path(List<string> list)
        {
            string ErrMsg = null;

            SqlCommand Cmd = new SqlCommand("Sp_GAP_InputFile_Path_Sel", new SqlConnection(CnnStr));
            Cmd.CommandType = CommandType.StoredProcedure;

            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = Cmd.Parameters;
            SqlParCol.Add(new SqlParameter("@SampleID", SqlDbType.BigInt));


            SqlParCol["@SampleID"].Value = list[0].ToString();
            DataSet DS = new DataSet();
            try
            {
                Cmd.Connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(Cmd);

                adapter.Fill(DS);

                Cmd.Connection.Close();
            }
            catch (Exception Exc)
            {
                ErrMsg = Exc.Message;
            }


            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            serializer.MaxJsonLength = int.MaxValue;
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row = default(Dictionary<string, object>);
            foreach (DataTable dt in DS.Tables)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in dt.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                    rows.Add(row);
                }
            }

            return rows;
            //  return Path;
        }



        [WebMethod()]
        public object getResults_Quality_Samples(List<string> list)
        {
            //
            string ErrMsg = null;

            SqlCommand Cmd = new SqlCommand("Sp_SampleQuality_FASTQ_sel", new SqlConnection(CnnStr));
            Cmd.CommandType = CommandType.StoredProcedure;

            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = Cmd.Parameters;
            SqlParCol.Add(new SqlParameter("@SampleID", SqlDbType.BigInt));
            SqlParCol.Add(new SqlParameter("@MetricID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@PIID", SqlDbType.Int));

            SqlParCol["@SampleID"].Value = 18070420002;
            SqlParCol["@MetricID"].Value = list[1].ToString();
            SqlParCol["@UserID"].Value = list[2].ToString();
            SqlParCol["@PIID"].Value = list[3].ToString();


            DataSet DS = new DataSet();
            try
            {
                Cmd.Connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(Cmd);

                adapter.Fill(DS);

                Cmd.Connection.Close();
            }
            catch (Exception Exc)
            {
                ErrMsg = Exc.Message;
            }


            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            serializer.MaxJsonLength = int.MaxValue;
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row = default(Dictionary<string, object>);
            foreach (DataTable dt in DS.Tables)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in dt.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                    rows.Add(row);
                }
            }

            return rows;
        }

        [WebMethod()]
        public object getExoneLoss_Details_PerGene(List<string> list)
        {
            string ErrMsg = null;

            SqlCommand Cmd = new SqlCommand("Sp_GAP_ExoneLoss_ExoneCount_Per_Gene", new SqlConnection(CnnStr));
            Cmd.CommandType = CommandType.StoredProcedure;

            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = Cmd.Parameters;
            SqlParCol.Add(new SqlParameter("@SampleID", SqlDbType.BigInt));
            SqlParCol.Add(new SqlParameter("@Gene", SqlDbType.VarChar));
            SqlParCol.Add(new SqlParameter("@Chr", SqlDbType.VarChar));

            SqlParCol["@SampleID"].Value = Convert.ToInt64(list[0]);
            SqlParCol["@Gene"].Value = list[1].ToString();
            SqlParCol["@Chr"].Value = list[2].ToString();

            DataSet DS = new DataSet();
            try
            {
                Cmd.Connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(Cmd);

                adapter.Fill(DS);

                Cmd.Connection.Close();
            }
            catch (Exception Exc)
            {
                ErrMsg = Exc.Message;
            }

            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            serializer.MaxJsonLength = int.MaxValue;
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row = default(Dictionary<string, object>);
            foreach (DataTable dt in DS.Tables)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in dt.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }

                    rows.Add(row);
                }
            }

            return serializer.Serialize(rows);
        }

    }

}
