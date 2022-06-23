using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace WebGAP.PhenBook.Service
{
    /// <summary>
    /// Summary description for se_PhenBook
    /// </summary>
    /// </summary>
    [WebService(Namespace = "http://wings.esat.kuleuven.be/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // [ScriptService]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class se_PhenBook : System.Web.Services.WebService
    {

        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}

        [WebMethod()]
        public object getPhenotypeNodes(List<string> list)
        {
            //
            string ErrMsg = null;
            SqlCommand Cmd = new SqlCommand("Sp_PhenBook_HPO_Search_Node", new SqlConnection(CnnStr));
            Cmd.CommandType = CommandType.StoredProcedure;
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = Cmd.Parameters;
            SqlParCol.Add(new SqlParameter("@hpo", SqlDbType.VarChar, 10));


            SqlParCol["@hpo"].Value = list[0].ToString();


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
            Dictionary<string, object> srow = default(Dictionary<string, object>);
            Dictionary<string, object> row = default(Dictionary<string, object>);
            foreach (DataTable dt in DS.Tables)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    srow = new Dictionary<string, object>();
                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in dt.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                    srow.Add("data", row);
                   rows.Add(srow);
                }
            }

            return serializer.Serialize(rows);
        }

        [WebMethod()]
           public object getPhenotypeEdges(List<string> list)
        {
            //
            string ErrMsg = null;
            SqlCommand Cmd = new SqlCommand("Sp_PhenBook_HPO_Search_Edges", new SqlConnection(CnnStr));
            Cmd.CommandType = CommandType.StoredProcedure;
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = Cmd.Parameters;
            SqlParCol.Add(new SqlParameter("@hpo", SqlDbType.VarChar, 10));


            SqlParCol["@hpo"].Value = list[0].ToString();


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
            Dictionary<string, object> srow = default(Dictionary<string, object>);
            Dictionary<string, object> row = default(Dictionary<string, object>);
            foreach (DataTable dt in DS.Tables)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    srow = new Dictionary<string, object>();
                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in dt.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                    srow.Add("data", row);
                    rows.Add(srow);
                }
            }

            return serializer.Serialize(rows);
        }
        [WebMethod()]
        public object getPhenotypeNodes_child(List<string> list)
        {
            //
            string ErrMsg = null;
            SqlCommand Cmd = new SqlCommand("Sp_PhenBook_HPO_Search_Node_Parent_To_Child", new SqlConnection(CnnStr));
            Cmd.CommandType = CommandType.StoredProcedure;
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = Cmd.Parameters;
            SqlParCol.Add(new SqlParameter("@hpo", SqlDbType.VarChar, 10));


            SqlParCol["@hpo"].Value = list[0].ToString();


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
            Dictionary<string, object> srow = default(Dictionary<string, object>);
            Dictionary<string, object> row = default(Dictionary<string, object>);
            foreach (DataTable dt in DS.Tables)
            {
              //  Console.WriteLine("row 1 : " + dt.Rows.Count.ToString());
                foreach (DataRow dr in dt.Rows)
                {
                    srow = new Dictionary<string, object>();
                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in dt.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                    srow.Add("data", row);
                    rows.Add(srow);
                }
            }

            return serializer.Serialize(rows);
        }

        [WebMethod()]
        public object getPhenotypeEdges_child(List<string> list)
        {
            //
            string ErrMsg = null;
            SqlCommand Cmd = new SqlCommand("Sp_PhenBook_HPO_Search_Edges_Parent_To_Child", new SqlConnection(CnnStr));
            Cmd.CommandType = CommandType.StoredProcedure;
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = Cmd.Parameters;
            SqlParCol.Add(new SqlParameter("@hpo", SqlDbType.VarChar, 10));


            SqlParCol["@hpo"].Value = list[0].ToString();


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
            Dictionary<string, object> srow = default(Dictionary<string, object>);
            Dictionary<string, object> row = default(Dictionary<string, object>);
            foreach (DataTable dt in DS.Tables)
            {
                //  System.Diagnostics.Debug.WriteLine("row sssssss ssssssssvsvvs ssssssssssssssssssssssssssssssssssss2 : ");
               //Response.Write("<script>console.log('opened window');</script>");

              //  Console.WriteLine();
                foreach (DataRow dr in dt.Rows)
                {
                    srow = new Dictionary<string, object>();
                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in dt.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                    srow.Add("data", row);
                    rows.Add(srow);
                }
            }

            return serializer.Serialize(rows);
        }



    }
}
