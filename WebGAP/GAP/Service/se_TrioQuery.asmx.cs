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
    /// Summary description for se_TrioQuery
    /// </summary>
    [WebService(Namespace = "http://wings.esat.kuleuven.be/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class se_TrioQuery : System.Web.Services.WebService
    {

        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}


        [WebMethod()]
        public object GetReqId_SavedFilter(List<string> list)
        {
            string ErrMsg = null;

            SqlCommand Cmd = new SqlCommand("Sp_GAP_Trio_Filter_Count_SavedItems_ReqId_Sel", new SqlConnection(CnnStr));
            Cmd.CommandType = CommandType.StoredProcedure;

            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = Cmd.Parameters;


            Cmd.Parameters.Add("@TrioLocalID", SqlDbType.NVarChar, 20);
            Cmd.Parameters["@TrioLocalID"].Value = list[0].ToString();
            Cmd.Parameters.Add("@TrioCode", SqlDbType.NVarChar, 20);
            Cmd.Parameters["@TrioCode"].Value = list[1].ToString();
            Cmd.Parameters.Add("@FilterID", SqlDbType.Int);
            Cmd.Parameters["@FilterID"].Value = Convert.ToInt32(list[2]);
            Cmd.Parameters.Add("@UserID", SqlDbType.Int);
            Cmd.Parameters["@UserID"].Value = Convert.ToInt32(list[3]);
            Cmd.Parameters.Add("@CenterID", SqlDbType.Int);
            Cmd.Parameters["@CenterID"].Value = Convert.ToInt32(list[4]);
            Cmd.Parameters.Add("@RefBuild", SqlDbType.VarChar, 20);
            Cmd.Parameters["@RefBuild"].Value = Convert.ToInt32(list[5]);
            Cmd.Parameters.Add("@IndividualID", SqlDbType.BigInt);
            Cmd.Parameters["@IndividualID"].Value = Convert.ToInt64(list[6]);


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

        [WebMethod()]
        public object GetResult_SavedFilter(List<string> list)
        {
            string ErrMsg = null;

            SqlCommand Cmd = new SqlCommand("Sp_GAP_Trio_Filter_Count_SavedItems_Result_Sel", new SqlConnection(CnnStr));
            Cmd.CommandType = CommandType.StoredProcedure;

            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = Cmd.Parameters;

            Cmd.Parameters.Add("@FilterID", SqlDbType.Int);
            Cmd.Parameters["@FilterID"].Value = Convert.ToInt32(list[0]);
            Cmd.Parameters.Add("@UserID", SqlDbType.Int);
            Cmd.Parameters["@UserID"].Value = Convert.ToInt32(list[1]);
            Cmd.Parameters.Add("@CenterID", SqlDbType.Int);
            Cmd.Parameters["@CenterID"].Value = Convert.ToInt32(list[2]);
            Cmd.Parameters.Add("@TrioLocalID", SqlDbType.NVarChar, 200);
            Cmd.Parameters["@TrioLocalID"].Value = list[3].ToString();
            Cmd.Parameters.Add("@ReqId", SqlDbType.Int);
            Cmd.Parameters["@ReqId"].Value = Convert.ToInt32(list[4]);


            DataSet DS = new DataSet();
            try
            {
                SqlDataAdapter adapter = new SqlDataAdapter(Cmd);
                adapter.SelectCommand.CommandTimeout = 7200;  // seconds
                Cmd.Connection.Open();

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

        [WebMethod()]
        public object GetReqId(List<string> list)
        {
            string ErrMsg = null;

            SqlCommand Cmd = new SqlCommand("Sp_GAP_Trio_Filter_Count_ReqId_Sel", new SqlConnection(CnnStr));
            Cmd.CommandType = CommandType.StoredProcedure;
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = Cmd.Parameters;

            Cmd.Parameters.Add("@TrioLocalID", SqlDbType.NVarChar, 20);
            Cmd.Parameters["@TrioLocalID"].Value = list[0].ToString();
            Cmd.Parameters.Add("@TrioCode", SqlDbType.NVarChar, 20);
            Cmd.Parameters["@TrioCode"].Value = list[1].ToString();
            Cmd.Parameters.Add("@FilterID", SqlDbType.Int);
            Cmd.Parameters["@FilterID"].Value = Convert.ToInt32(list[2]);
            Cmd.Parameters.Add("@UserID", SqlDbType.Int);
            Cmd.Parameters["@UserID"].Value = Convert.ToInt32(list[3]);
            Cmd.Parameters.Add("@CenterID", SqlDbType.Int);
            Cmd.Parameters["@CenterID"].Value = Convert.ToInt32(list[4]);
            Cmd.Parameters.Add("@RefBuild", SqlDbType.VarChar, 20);
            Cmd.Parameters["@RefBuild"].Value = Convert.ToInt32(list[5]);
            Cmd.Parameters.Add("@SelectedLevel", SqlDbType.Int);
            Cmd.Parameters["@SelectedLevel"].Value = Convert.ToInt32(list[6]);
            Cmd.Parameters.Add("@IndividualID", SqlDbType.BigInt);
            Cmd.Parameters["@IndividualID"].Value = Convert.ToInt64(list[7]);

           

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

        [WebMethod()]
        public object GetResult(List<string> list)
        {
            string ErrMsg = null;

            SqlCommand Cmd = new SqlCommand("Sp_GAP_Trio_Filter_Count_Result_Sel", new SqlConnection(CnnStr));
            Cmd.CommandType = CommandType.StoredProcedure;

            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = Cmd.Parameters;

            Cmd.Parameters.Add("@FilterID", SqlDbType.Int);
            Cmd.Parameters["@FilterID"].Value = Convert.ToInt32(list[0]);
            Cmd.Parameters.Add("@UserID", SqlDbType.Int);
            Cmd.Parameters["@UserID"].Value = Convert.ToInt32(list[1]);
            Cmd.Parameters.Add("@CenterID", SqlDbType.Int);
            Cmd.Parameters["@CenterID"].Value = Convert.ToInt32(list[2]);
            Cmd.Parameters.Add("@TrioLocalID", SqlDbType.NVarChar , 200);
            Cmd.Parameters["@TrioLocalID"].Value = list[3].ToString();
            Cmd.Parameters.Add("@ReqId", SqlDbType.Int);
            Cmd.Parameters["@ReqId"].Value = Convert.ToInt32(list[4]);


            DataSet DS = new DataSet();
            try
            {
                SqlDataAdapter adapter = new SqlDataAdapter(Cmd);
                adapter.SelectCommand.CommandTimeout = 7200;  // seconds
                Cmd.Connection.Open();

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
