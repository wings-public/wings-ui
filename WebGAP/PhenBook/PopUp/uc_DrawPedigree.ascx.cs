using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.PhenBook.PopUp
{
    public partial class uc_DrawPedigree : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}

      

        protected void Page_Init(object sender, EventArgs e)
        {

            StringBuilder Pedigree = new StringBuilder();
            string probandID = string.Empty;
            string Gender = string.Empty;
            string SpouseTitle = string.Empty;

            string ID_code = Session["ID_drawPedigree"].ToString().Substring(6, 1);
            DataTable myDataTable = new DataTable();

            if (ID_code.Equals("0")) // based on proband
            {
                SqlConnection conn = new SqlConnection(CnnStr);
                SqlCommand Cmd = new SqlCommand("Sp_Family_Individual_sel", new SqlConnection(CnnStr));
                Cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                SqlDataAdptrCmd.SelectCommand = Cmd;

                SqlParCol = Cmd.Parameters;
                SqlParCol.Add(new SqlParameter("@IndividualID", SqlDbType.BigInt));
                SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@HostID", SqlDbType.Int));
                SqlParCol["@IndividualID"].Value = Convert.ToInt64(Session["ID_drawPedigree"].ToString());
                SqlParCol["@CenterID"].Value = Session["Current_CenterID"].ToString();
                SqlParCol["@UserID"].Value = Session["WiNGSMasterId"].ToString();
                //SqlParCol["@HostID"].Value = Session["HostID"].ToString();
                SqlParCol["@HostID"].Value = 1;
                try
                {

                    conn.Open();
                    SqlDataAdptrCmd.Fill(myDataTable);
                }
                finally
                {
                    conn.Close();
                }
            }
            if (ID_code.Equals("1")) //based on family
            {
                SqlConnection conn = new SqlConnection(CnnStr);
                SqlCommand Cmd = new SqlCommand("Sp_FamilyMembers_sel", new SqlConnection(CnnStr));
                Cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                SqlDataAdptrCmd.SelectCommand = Cmd;

                SqlParCol = Cmd.Parameters;
                SqlParCol.Add(new SqlParameter("@FamilyID", SqlDbType.BigInt));
                SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@proband_Hasspouse", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@HostID", SqlDbType.Int));

                SqlParCol["@FamilyID"].Value = Convert.ToInt64(Session["ID_drawPedigree"].ToString());
                SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
                SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
                SqlParCol["@proband_Hasspouse"].Direction = ParameterDirection.Output;
                SqlParCol["@HostID"].Value = Session["HostID"];

                conn.Open();
                try
                {
                    SqlDataAdptrCmd.Fill(myDataTable);
                }
                finally
                {
                    conn.Close();
                }

            }
            if (myDataTable.Rows.Count > 1)
            {
                Pedigree.Append("{" + "\"" + "d" + "\"" + ":[");
                foreach (DataRow row in myDataTable.Rows)
                {

                    string RelationToProband = row["FamilyMemberTypeName"].ToString().Trim();
                    string name = (row["RelativeName"].ToString() != "") ? row["RelativeName"].ToString() : row["FamilyMemberTypeName"].ToString();
                    string status = (row["RelativeStatus"].ToString() == "0") ? "AS" : "";
                    probandID = row["IndividualID"].ToString();
                    Gender = (row["RelativeGender"].ToString() == "0") ? "F" : "M";


                    switch (RelationToProband)
                    {

                        case "Mother":
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ": 1, " + "\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "F" + "\"" + " ," + "\"" + "m" + "\"" + ": -13 , " + "\"" + "f" + "\"" + ":-12 , " + "\"" + "ux" + "\"" + ":0" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Father":
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ": 0, " + "\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "M" + "\"" + " ," + "\"" + "m" + "\"" + ": -11 , " + "\"" + "f" + "\"" + ":-10 , " + "\"" + "ux" + "\"" + ":1" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Paternal Grandmother":
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ": -11, " + "\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "F" + "\"" + "  , " + "\"" + "vir" + "\"" + ": -10" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Paternal Grandfather":
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ": -10, " + "\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "M" + "\"" + "  , " + "\"" + "ux" + "\"" + ": -11" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Maternal Grandmother":
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ": -13, " + "\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "F" + "\"" + ", " + "\"" + "vir" + "\"" + ": -12" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Maternal Grandfather":
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ": -12, " + "\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "M" + "\"" + " , " + "\"" + "ux" + "\"" + ": -13" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Brother":
                            Pedigree.Append("{" + "\"" + "key" + "\":" + row["Node_Key"] + ",\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "M" + "\"" + " ," + "\"" + "m" + "\"" + ": 1 , " + "\"" + "f" + "\"" + ":0" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Sister":
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ":" + row["Node_Key"] + ",\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "F" + "\"" + " ," + "\"" + "m" + "\"" + ": 1 , " + "\"" + "f" + "\"" + ":0" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Son":
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ":" + row["Node_Key"] + ", " + "\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "M" + "\"" + " ," + "\"" + "m" + "\"" + ": 3 , " + "\"" + "f" + "\"" + ":2" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Daughter":
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ":" + row["Node_Key"] + ", " + "\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "F" + "\"" + " ," + "\"" + "m" + "\"" + ": 3 , " + "\"" + "f" + "\"" + ":2" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Maternal Uncle":
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ":" + row["Node_Key"] + ", " + "\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "M" + "\"" + ", " + "\"" + "m" + "\"" + ": -13 , " + "\"" + "f" + "\"" + ":-12" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Maternal Aunt":
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ":" + row["Node_Key"] + ", " + "\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "F" + "\"" + ", " + "\"" + "m" + "\"" + ": -13 , " + "\"" + "f" + "\"" + ":-12" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Paternal Uncle":
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ":" + row["Node_Key"] + ", " + "\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "M" + "\"" + ", " + "\"" + "m" + "\"" + ": -11 , " + "\"" + "f" + "\"" + ":-10" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Paternal Aunt":
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ":" + row["Node_Key"] + ", " + "\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + "F" + "\"" + ", " + "\"" + "m" + "\"" + ": -11 , " + "\"" + "f" + "\"" + ":-10" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Proband":
                            switch (Gender)
                            {
                                case "F":
                                    SpouseTitle = "vir";
                                    break;
                                case "M":
                                    SpouseTitle = "ux";
                                    break;
                                case "":
                                    SpouseTitle = "";
                                    break;
                            }
                       
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ": 2, " + "\"" + "n" + "\"" + ":" + "\"" + probandID + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + Gender + "\"" + " ," + "\"" + "m" + "\"" + ": 1 ," + "\"" + "f" + "\"" + ":0, " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                        case "Spouse":
                            switch (Gender)
                            {
                                case "F":
                                    SpouseTitle = "vir";
                                    break;
                                case "M":
                                    SpouseTitle = "ux";
                                    break;
                                case "":
                                    SpouseTitle = "";
                                    break;
                            }
                            Pedigree.Append("{" + "\"" + "key" + "\"" + ": 3, " + "\"" + "n" + "\"" + ":" + "\"" + name + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + Gender + "\"" + ", " + "\"" + SpouseTitle + "\"" + ": 2, " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
                            break;
                    }

                }

               
                String aa = Pedigree.ToString().Remove(Pedigree.ToString().LastIndexOf(","));
                aa = aa + "]}";

                Txt_PVal.Value = aa.ToString();

              //  string message = "init();";
              //  ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
            }
            else
            {
                lbl_Feedback.Visible = true;
                lbl_Feedback.Text = "There is no pedigree";


            }

        }
    }
}