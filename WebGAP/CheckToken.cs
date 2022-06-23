using System;

using System.Collections.Generic;

using System.Data;

using System.Data.SqlClient;




namespace WebGAP

{

    public class CheckToken

    {

        #region "CnnStr"{

        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

        #endregion}




        public static List<string> CheckValidity(int ActiveTkn, string WiNGSMasterId, string WiNGSCenterID, string Current_CenterID, string Host)

        {

            var retList = new List<string>();




            String connstring = CnnStr;

            SqlConnection conn = new SqlConnection(connstring);

            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();

            SqlCommand cmd = new SqlCommand("Sp_API_Token", conn);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@UserID", SqlDbType.Int);

            cmd.Parameters.Add("@CenterID", SqlDbType.Int);

            cmd.Parameters.Add("@NewCenterID", SqlDbType.Int);

            cmd.Parameters.Add("@ActiveToken", SqlDbType.Int);

            cmd.Parameters.Add("@Host", SqlDbType.Int);

            cmd.Parameters["@UserID"].Value = Convert.ToInt32(WiNGSMasterId);

            cmd.Parameters["@CenterID"].Value = Convert.ToInt32(WiNGSCenterID);

            if (Current_CenterID != null)

                cmd.Parameters["@NewCenterID"].Value = Convert.ToInt32(Current_CenterID);

            else

                cmd.Parameters["@NewCenterID"].Value = -1;




            cmd.Parameters["@ActiveToken"].Value = ActiveTkn.ToString();

            cmd.Parameters["@Host"].Value = Convert.ToInt32(Host);




            SqlDataAdptrCmd.SelectCommand = cmd;

            DataTable myDataTable = new DataTable();

            conn.Open();

            try

            {

                SqlDataAdptrCmd.Fill(myDataTable);

                foreach (DataRow row in myDataTable.Rows)

                {

                    retList.Add(row["tkn"].ToString());

                }




                return retList;

                //return (myDataTable.Rows[0]["tkn"].ToString());

            }

            finally

            {

                conn.Close();

            }

            return null;

        }




    }

}