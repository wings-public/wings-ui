using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Services;

namespace WebGAP.Main_Service
{
    /// <summary>
    /// Summary description for se_Main
    /// </summary>
    [WebService(Namespace = "http://wings.esat.kuleuven.be/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class se_Main : System.Web.Services.WebService
    {

        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}

        [WebMethod()]
        public object Dashboard_GetChartData(List<string> list)
        {
            string ErrMsg = null, query = null;
            if (list[3].Equals("01"))
                query = "Sp_Mindds_Dashboard";
            else
                query = "Sp_Dashboard";


            SqlCommand Cmd = new SqlCommand(query, new SqlConnection(CnnStr));
            Cmd.CommandType = CommandType.StoredProcedure;

            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = Cmd.Parameters;
            Cmd.Parameters.Add("@CenterID", SqlDbType.Int);
            Cmd.Parameters.Add("@PIID", SqlDbType.Int);
            Cmd.Parameters.Add("@UserID", SqlDbType.Int);


            SqlParCol["@CenterID"].Value = Convert.ToInt32(list[0]);
            SqlParCol["@PIID"].Value = Convert.ToInt32(list[1]);
            SqlParCol["@UserID"].Value = Convert.ToInt32(list[2]);


            //SqlParCol["@CenterID"].Value = 2;
            //SqlParCol["@PIID"].Value = 28;

            // DataSet DS = new DataSet();

            DataTable DT = new DataTable();
            try
            {
                Cmd.Connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(Cmd);

                adapter.Fill(DT);

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
         //   foreach (DataTable dt in DT.Tables)
         //   {
                foreach (DataRow dr in DT.Rows)
                {
                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in DT.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }

                    rows.Add(row);
                }
        //    }

            return serializer.Serialize(rows);
        }
    }

}
