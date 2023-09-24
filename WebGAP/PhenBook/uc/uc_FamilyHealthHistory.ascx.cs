using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

using static WebGAP.ACL.Popup.uc_AddNewDatasetToGroup;


namespace WebGAP.PhenBook.uc
{
    public partial class uc_FamilyHealthHistory : System.Web.UI.UserControl
    {

        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion} 



        protected void Page_Init(object sender, EventArgs e)
         {
            if (!IsPostBack)
            {
                StringBuilder Pedigree = new StringBuilder();
                string spouseGender = string.Empty;
                string SpouseTitle = string.Empty;
                string probandID = string.Empty;
                string Gender = string.Empty;
                string FamilyID = Session["FamilyID"].ToString();


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

                SqlParCol["@FamilyID"].Value = Convert.ToInt64(FamilyID);
                SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
                SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
                SqlParCol["@proband_Hasspouse"].Direction = ParameterDirection.Output;
                SqlParCol["@HostID"].Value = Session["HostID_ForFamilyMember"];

                DataTable myDataTable = new DataTable();
                conn.Open();
                try
                {
                    SqlDataAdptrCmd.Fill(myDataTable);
                    Session["proband_Hasspouse"] = SqlParCol["@proband_Hasspouse"].Value.ToString();
                }
                finally
                {
                    conn.Close();
                }

                if (myDataTable.Rows.Count > 1)
                {
                    Pedigree.Append("{" + "\"" + "d" + "\"" + ":[");

                    foreach (DataRow row in myDataTable.Rows)
                    {
                        string RelationToProband = row["FamilyMemberTypeName"].ToString().Trim();
                        string name = (row["RelativeName"].ToString() != "") ? row["RelativeName"].ToString() : row["FamilyMemberTypeName"].ToString();
                        string status = (row["RelativeStatus"].ToString() == "0") ? "AS" : "";
                        Gender = (row["RelativeGender"].ToString() == "0") ? "F" : "M";
                        probandID = row["IndividualID"].ToString();



                        switch (RelationToProband)
                        {

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


                        }


                    }


                    String aa = Pedigree.ToString().Remove(Pedigree.ToString().LastIndexOf(","));
                    aa = aa + "]}";
                    Txt_PVal.Value = aa.ToString();

                    //     string message = "init();";
                    //    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
                }
                else
                {


                    lbl_Feedback.Visible = true;
                    lbl_Feedback.Text = "No Pedigree to Display";


                }

            }

         }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                if ((Session["ProbandID"].ToString().Length > 1))
                    txt_IndivdualID.Text = Session["ProbandID"].ToString();
            }

        }

        protected void btn_FamilyGrid_Click(object sender, EventArgs e)
        {
            long FamilyID = Convert.ToInt64(Session["FamilyID"].ToString());
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

            SqlParCol["@FamilyID"].Value = Convert.ToInt64(FamilyID);
            SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
            SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
            SqlParCol["@proband_Hasspouse"].Direction = ParameterDirection.Output;
            SqlParCol["@HostID"].Value = Session["HostID_ForFamilyMember"];
            DataTable myDataTable = new DataTable();
            conn.Open();
            try
            {
                SqlDataAdptrCmd.Fill(myDataTable); 
                 Session["proband_Hasspouse"] = SqlParCol["@proband_Hasspouse"].Value.ToString();
            }
            finally
            {
                conn.Close();
            }


                string Proband_Gender = RG_FamilyMemeber.MasterTableView.Items[0].GetDataKeyValue("RelativeGender").ToString();
                RadTextBox txtbox = (RadTextBox)FindControl("txt_IndivdualID");
                string IndividualID = txtbox.Text;

                List<ListFamilyStructure> TGList = new List<ListFamilyStructure>();

                int Spouse_Gender = 0;
                bool SpouseIsAlreadyAdded_Flag = false;

                string spouseGender = string.Empty;
                string SpouseTitle = string.Empty;
                switch (Proband_Gender)
                {
                    case "0":
                        Proband_Gender = "F";
                        spouseGender = "M";
                        Spouse_Gender = 1;
                        SpouseTitle = "vir";
                        break;
                    case "1":
                        Proband_Gender = "M";
                        spouseGender = "F";
                        Spouse_Gender = 0;
                        SpouseTitle = "ux";
                        break;
                    case "2":
                        Proband_Gender = "U";
                        spouseGender = "U";
                        SpouseTitle = "U";
                        break;
                    default:

                        break;
                }
              
                if (RG_FamilyMemeber.Items.Count.Equals(1)) // don't duplicate default family member
                {
                    // TGList.Add(new ListFamilyStructure(FamilyID, Convert.ToInt64(IndividualID) , 15, 0, 2, Convert.ToInt32(proband_Gender))); //Proband
   
                    TGList.Add(new ListFamilyStructure("Father", FamilyID, null, 1, 0, 0,null,null, 1, null)); //father
                    TGList.Add(new ListFamilyStructure("Mother", FamilyID, null, 2, 0, 1,null,null, 0, null)); //mother
                    TGList.Add(new ListFamilyStructure("Maternal Grandmother", FamilyID, null, 14, 1, -13, null, null, 0, null)); //Maternal Grandmother
                    TGList.Add(new ListFamilyStructure("Maternal Grandfather",FamilyID, null, 13, 1, -12, null, null, 1, null)); //Maternal Grandfather
                    TGList.Add(new ListFamilyStructure("Paternal Grandmother", FamilyID, null, 12, 2, -11, null, null, 0, null)); //Paternal Grandmother
                    TGList.Add(new ListFamilyStructure("Paternal Grandfather", FamilyID, null, 11, 2, -10, null, null, 1, null)); //Paternal Grandfather
                }

                string add_Spouse_now = hdn_Has_Spouse.Value.ToString();
                if(add_Spouse_now == "1"  && myDataTable.Select("FamilyMemberTypeID = 16").Count() == 0)
                {
                    TGList.Add(new ListFamilyStructure("Spouse", FamilyID, null, 16, 0, 3,null,null, Convert.ToInt32(Spouse_Gender), null)); //Spouse
                    SpouseIsAlreadyAdded_Flag = true; 
                }

                Int32 Brothers = Convert.ToInt32(hdn_Num_Brothers.Value);
                if (Brothers > 0)
                {
                    if (myDataTable.Select("FamilyMemberTypeID = 3").Count() == 0)
                    { 
                        for (int i = 0; i < Brothers; i++)
                        {
                            TGList.Add(new ListFamilyStructure("Brother", FamilyID, null, 3, 0, 30 + i,null,null, 1, null));

                        }
                    }
                    else
                    {
                    DataRow[] Br = myDataTable.Select("FamilyMemberTypeID = 3");
                    int Node = Convert.ToInt32(Br[0]["Node_Key"].ToString()) +1;
                            for (int i = 0; i < Brothers; i++)
                            {
                                TGList.Add(new ListFamilyStructure("Brother", FamilyID, null, 3, 0, Node + i, null,null, 1, null));

                    }
                    
                     }
                }

                Int32 Sisters = Convert.ToInt32(hdn_Num_Sisters.Value);
                 if (Sisters > 0)
                 {
                    if (myDataTable.Select("FamilyMemberTypeID = 4").Count() == 0)
                {
                        for (int i = 0; i < Sisters; i++)
                        {
                            TGList.Add(new ListFamilyStructure("Sister", FamilyID, null, 4, 0, 40 + i,null,null, 0, null));
                    }
                    }
                    else
                    {
                    DataRow[] Br = myDataTable.Select("FamilyMemberTypeID = 4");

                    int Node = Convert.ToInt32(Br[0]["Node_Key"].ToString()) + 1;
                        for (int i = 0; i < Sisters; i++)
                        {
                            TGList.Add(new ListFamilyStructure("Sister", FamilyID, null, 4, 0, Node + i,null,null, 0, null));
                    }
                    }
                 }

            Int32 Sons = Convert.ToInt32(hdn_Num_Sons.Value);
            if (Sons > 0)
            {
                if (myDataTable.Select("FamilyMemberTypeID = 16").Count() == 0 && SpouseIsAlreadyAdded_Flag == false)
                {
                    TGList.Add(new ListFamilyStructure("Son", FamilyID, null, 16, 0, 3, null, null, Convert.ToInt32(Spouse_Gender), null)); //Spouse
                    SpouseIsAlreadyAdded_Flag = true;
                }

                if (myDataTable.Select("FamilyMemberTypeID = 5").Count() == 0)
                {
                    for (int i = 0; i < Sons; i++)
                    {
                        TGList.Add(new ListFamilyStructure("Son", FamilyID, null, 5, 0, 20 + i, null, null, 1, null));

                    }
                }
                else
                {
                    DataRow[] Br = myDataTable.Select("FamilyMemberTypeID = 5");
                    int Node = Convert.ToInt32(Br[0]["Node_Key"].ToString()) + 1;
                    for (int i = 0; i < Sons; i++)
                    {
                        TGList.Add(new ListFamilyStructure("Son", FamilyID, null, 5, 0, Node + i, null, null, 1, null));

                    }
                }
            }

            Int32 Daughters = Convert.ToInt32(hdn_Num_Daughters.Value);
            if (Daughters > 0)
            {
                if (myDataTable.Select("FamilyMemberTypeID = 16").Count() == 0 && SpouseIsAlreadyAdded_Flag == false)
                {
                    TGList.Add(new ListFamilyStructure("Daughter", FamilyID, null, 16, 0, 3, null, null, Convert.ToInt32(Spouse_Gender), null)); //Spouse
                    SpouseIsAlreadyAdded_Flag = true;
                }
                if (myDataTable.Select("FamilyMemberTypeID = 6").Count() == 0)
                {
                    for (int i = 0; i < Daughters; i++)
                    {
                        TGList.Add(new ListFamilyStructure("Daughter", FamilyID, null, 6, 0, 10 + i, null, null, 0, null));
                    }
                }
                else
                {
                    DataRow[] Br = myDataTable.Select("FamilyMemberTypeID = 6");
                    int Node = Convert.ToInt32(Br[0]["Node_Key"].ToString()) + 1;
                    for (int i = 0; i < Daughters; i++)
                    {
                        TGList.Add(new ListFamilyStructure("Daughter", FamilyID, null, 6, 0, Node + i, null, null, 0, null));
                    }

                }

            }

            Int32 MUncles = Convert.ToInt32(hdn_Num_MUncles.Value);
                if (MUncles > 0)
                {
                    if (myDataTable.Select("FamilyMemberTypeID = 7").Count() == 0)
                    {
                        for (int i = 0; i < MUncles; i++)
                        {
                            TGList.Add(new ListFamilyStructure("Maternal Uncle", FamilyID, null, 7, 1, -30 - i, null,null, 1, null));
                    }
                    }
                    else
                    {
                    DataRow[] Br = myDataTable.Select("FamilyMemberTypeID = 7");
                    int Node = Convert.ToInt32(Br[0]["Node_Key"].ToString()) - 1;
                        for (int i = 0; i < MUncles; i++)
                        {
                            TGList.Add(new ListFamilyStructure("Maternal Uncle", FamilyID, null, 7, 1, Node - i, null,null, 1, null));
                    }
                    }
                }

                Int32 MAunts = Convert.ToInt32(hdn_Num_MAunts.Value);
                if (MAunts > 0)
                {
                    if (myDataTable.Select("FamilyMemberTypeID = 8").Count() == 0)
                    {
                        for (int i = 0; i < MAunts; i++)
                        {
                            TGList.Add(new ListFamilyStructure("Maternal Aunt", FamilyID, null, 8, 1, -40 - i,null,null, 0, null));
                        }
                    }
                    else
                    {
                    DataRow[] Br = myDataTable.Select("FamilyMemberTypeID = 8");
                    int Node = Convert.ToInt32(Br[0]["Node_Key"].ToString()) - 1;
                        for (int i = 0; i < MAunts; i++)
                        {
                            TGList.Add(new ListFamilyStructure("Maternal Aunt" , FamilyID, null, 8, 1, Node - i,null,null, 0, null));
                    }

                    }
                }

                Int32 FUncles = Convert.ToInt32(hdn_Num_FUncles.Value);
                if (FUncles > 0)
                {
                    if (myDataTable.Select("FamilyMemberTypeID = 9").Count() == 0)
                    {
                        for (int i = 0; i < FUncles; i++)
                        {
                            TGList.Add(new ListFamilyStructure("Paternal Uncle" , FamilyID, null, 9, 2, -50 - i, null,null, 1, null));
                    }
                    }
                    else

                    {
                    DataRow[] Br = myDataTable.Select("FamilyMemberTypeID = 9");
                    int Node = Convert.ToInt32(Br[0]["Node_Key"].ToString()) - 1;
                        for (int i = 0; i < FUncles; i++)
                        {
                            TGList.Add(new ListFamilyStructure("Paternal Uncle" , FamilyID, null, 9, 2, Node - i, null,null, 1, null));
                    }

                    }

                }

                Int32 FAunts = Convert.ToInt32(hdn_Num_FAunts.Value);
                if (FAunts > 0)
                {
                    if (myDataTable.Select("FamilyMemberTypeID = 10").Count() == 0)
                    {
                        for (int i = 0; i < FAunts; i++)
                        {
                            TGList.Add(new ListFamilyStructure("Paternal Aunt" , FamilyID, null, 10, 2, -60 - i, null,null,0, null));
                    }
                    }
                    else
                    {
                    DataRow[] Br = myDataTable.Select("FamilyMemberTypeID = 10");
                    int Node = Convert.ToInt32(Br[0]["Node_Key"].ToString()) - 1;
                        for (int i = 0; i < FAunts; i++)
                        {
                            TGList.Add(new ListFamilyStructure("Paternal Aunt" , FamilyID, null, 10, 2, Node - i,null,null, 0, null));
                    }

                    }
                }

            DataTable TG_table = new DataTable();
            TG_table.Columns.Add("FamilyMemberTypeName", typeof(String));
            TG_table.Columns.Add("FamilyID", typeof(Int64));
            TG_table.Columns.Add("IndividualID", typeof(Int64));
            TG_table.Columns.Add("FamilyMemberTypeID", typeof(Int32));
            TG_table.Columns.Add("Family_side", typeof(Int32));
            TG_table.Columns.Add("Node_Key", typeof(Int32));
            TG_table.Columns.Add("RelativeName", typeof(String));
            TG_table.Columns.Add("RelativeBirthdate", typeof(String));
            TG_table.Columns.Add("RelativeGender", typeof(Int32));
            TG_table.Columns.Add("RelativeStatus", typeof(Int32));
            TG_table.Columns.Add("UserID", typeof(Int32));
            //TG_table.Columns.Add("Disease_TL", typeof(String));
            //TG_table.Columns.Add("Code_TL", typeof(Int32));
            //TG_table.Columns.Add("Disease_TR", typeof(String));
            //TG_table.Columns.Add("Code_TR", typeof(Int32));
            //TG_table.Columns.Add("Disease_BL", typeof(String));
            //TG_table.Columns.Add("Code_BL", typeof(Int32));
            //TG_table.Columns.Add("Disease_BR", typeof(String));
            //TG_table.Columns.Add("Code_BR", typeof(Int32));
            //TG_table.Columns.Add("Hex_BR", typeof(String));
            //TG_table.Columns.Add("Hex_BL", typeof(String));
            //TG_table.Columns.Add("Hex_TR", typeof(String));
            //TG_table.Columns.Add("Hex_TL", typeof(String));
            //TG_table.Columns.Add("DateAdd", typeof(String));

            for (int i = 0; i <= TGList.Count - 1; i++)
            {
                    TG_table.Rows.Add(TGList[i].FamilyMemberTypeName, TGList[i].FamilyID, TGList[i].IndividualID, TGList[i].FamilyMemberTypeID, TGList[i].Family_Side, TGList[i].Node_Key, TGList[i].RelativeName,
                    TGList[i].RelativeBirthdate, TGList[i].RelativeGender,  TGList[i].RelativeStatus,Session["WiNGSMasterId"]);
            }

            SqlCommand cmd = new SqlCommand("Sp_FamilyMembers_Ins", new SqlConnection(CnnStr));
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParCol = cmd.Parameters;

            SqlParCol.AddWithValue("@PedigreeData", TG_table);
            SqlParCol.AddWithValue("@FamilyID", FamilyID);
            SqlParCol.AddWithValue("@CenterID", Session["Current_CenterID"]);
            SqlParCol.AddWithValue("@UserID", Session["WiNGSMasterId"]);
            SqlParCol.AddWithValue("@HostID", Session["HostID_ForFamilyMember"]);

            try
            {
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
           
            }
            catch (Exception ex)
            {

            }
            RG_FamilyMemeber.Rebind();
            RG_FamilyMemeber.Visible = true;

        }

        public struct ListFamilyStructure
        {
            public string FamilyMemberTypeName;
            public Int64? FamilyID;
            public Int64? IndividualID;
            public int? FamilyMemberTypeID;
            public int? Family_Side; // proband Family is 0, Mother's side 1, Father's side 2
            public int? Node_Key;
            public string RelativeName;
            public string RelativeBirthdate;
            public int? RelativeGender;
            public int? RelativeStatus;
            //public string Disease_TL;
            //public int? Code_TL;
            //public string Disease_TR;
            //public int? Code_TR;
            //public string Disease_BL;
            //public int? Code_BL;
            //public string Disease_BR;
            //public int? Code_BR; 
            //public string Hex_BR;
            //public string Hex_BL;
            //public string Hex_TR;
            //public string Hex_TL;
            //public string DateAdd;



            public ListFamilyStructure(string FamilyMemberTypeName, Int64? FamilyID, Int64? IndividualID, int? FamilyMemberTypeID, int? Family_Side, int? Node_Key,
                string RelativeName, string RelativeBirthdate, int? RelativeGender, int? RelativeStatus)
                //, string Disease_TL, int? Code_TL,
                //string Disease_TR, int? Code_TR, string Disease_BL, int? Code_BL, string Disease_BR, int? Code_BR,string Hex_BR, string Hex_BL,
                //string Hex_TR,string Hex_TL, string DateAdd)
            {
                this.FamilyMemberTypeName = FamilyMemberTypeName;
                this.FamilyID = FamilyID;
                this.IndividualID = IndividualID;
                this.FamilyMemberTypeID = FamilyMemberTypeID;
                this.Family_Side = Family_Side; // proband Family is 0, Mother's side 1, Father's side 2
                this.Node_Key = Node_Key;
                this.RelativeName = RelativeName;
                this.RelativeBirthdate = RelativeBirthdate;
                this.RelativeGender = RelativeGender;
                this.RelativeStatus = RelativeStatus;
                //this.Disease_TL = Disease_TL;
                //this.Code_TL = Code_TL;
                //this.Disease_TR = Disease_TR;
                //this.Code_TR = Code_TR;
                //this.Disease_BL = Disease_BL;
                //this.Code_BL = Code_BL;
                //this.Disease_BR = Disease_BR;
                //this.Code_BR = Code_BR;
                //this.Disease_BL = Disease_BL;
                //this.Code_BL = Code_BL;
                //this.Disease_BR = Disease_BR;
                //this.Code_BR = Code_BR;
                //this.Hex_BR = Hex_BR;
                //this.Hex_BL = Hex_BL;
                //this.Hex_TR = Hex_TR;
                //this.Hex_TL = Hex_TL;
                //this.DateAdd = DateAdd;

        }
        }

        public class ThreadAddFs
        {
            private List<ListFamilyStructure> T_TGList = new List<ListFamilyStructure>();
            public ThreadAddFs(List<ListFamilyStructure> TGList)
            {
                for (int i = 0; i <= TGList.Count - 1; i++)
                {
                    T_TGList.Add(new ListFamilyStructure(TGList[i].FamilyMemberTypeName, TGList[i].FamilyID, TGList[i].IndividualID, TGList[i].FamilyMemberTypeID, TGList[i].Family_Side, TGList[i].Node_Key, TGList[i].RelativeName,
                    TGList[i].RelativeBirthdate, TGList[i].RelativeGender, TGList[i].RelativeStatus));
                    //, TGList[i].Disease_TL, TGList[i].Code_TL, TGList[i].Disease_TR, TGList[i].Code_TR,
                    //TGList[i].Disease_BL, TGList[i].Code_BL, TGList[i].Disease_BR, TGList[i].Code_BR,
                    //TGList[i].Hex_BR, TGList[i].Hex_BL, TGList[i].Hex_TR, TGList[i].Hex_TL, TGList[i].DateAdd));
                }
            }

            public void ThreadProc()
            {
                DataTable TG_table = new DataTable();
                TG_table.Columns.Add("FamilyID", typeof(Int64));
                TG_table.Columns.Add("IndividualID", typeof(Int64));
                TG_table.Columns.Add("FamilyMemberTypeID", typeof(Int32));
                TG_table.Columns.Add("Family_side", typeof(Int32));
                TG_table.Columns.Add("Node_Key", typeof(Int32));
                TG_table.Columns.Add("RelativeGender", typeof(Int32));
                TG_table.Columns.Add("RelativeName", typeof(String));
                TG_table.Columns.Add("RelativeStatus", typeof(Int32));
                //TG_table.Columns.Add("Disease_TL", typeof(String));
                //TG_table.Columns.Add("Code_TL", typeof(Int32));
                //TG_table.Columns.Add("Hex_TL", typeof(String));
                //TG_table.Columns.Add("Disease_TR", typeof(String));
                //TG_table.Columns.Add("Code_TR", typeof(Int32));
                //TG_table.Columns.Add("Hex_TR", typeof(String));
                //TG_table.Columns.Add("Disease_BL", typeof(String));
                //TG_table.Columns.Add("Code_BL", typeof(Int32));
                //TG_table.Columns.Add("Hex_BL", typeof(String));
                //TG_table.Columns.Add("Disease_BR", typeof(String));
                //TG_table.Columns.Add("Code_BR", typeof(Int32));
                //TG_table.Columns.Add("Hex_BR", typeof(String));
                //TG_table.Columns.Add("RelativeBirthdate", typeof(String));
                //TG_table.Columns.Add("DateAdd", typeof(String));

                for (int i = 0; i <= T_TGList.Count - 1; i++)
                {
                    TG_table.Rows.Add( T_TGList[i].FamilyID, T_TGList[i].IndividualID, T_TGList[i].FamilyMemberTypeID, T_TGList[i].Family_Side, T_TGList[i].Node_Key, T_TGList[i].RelativeGender, T_TGList[i].RelativeName,
                     T_TGList[i].RelativeStatus);
                    // , T_TGList[i].Disease_TL, T_TGList[i].Code_TL, T_TGList[i].Disease_TR, T_TGList[i].Code_TR, T_TGList[i].Hex_TR,
                    // T_TGList[i].Disease_BL, T_TGList[i].Code_BL, T_TGList[i].Hex_BL, T_TGList[i].Disease_BR, T_TGList[i].Code_BR, T_TGList[i].Hex_BR, T_TGList[i].RelativeBirthdate, T_TGList[i].DateAdd
                    //);
                    //  TG_table.Rows.Add(T_TGList[i].FamilyID, T_TGList[i].IndividualID, T_TGList[i].FamilyMemberTypeID, T_TGList[i].Family_Side, T_TGList[i].Node_Key, T_TGList[i].RelativeGender);
                }
                using (SqlConnection Conn = new SqlConnection(CnnStr))
                {
                    Conn.Open();
                    using (SqlBulkCopy s = new SqlBulkCopy(Conn))
                    {
                        s.DestinationTableName = "Tbl_FamilyMember";
                        s.WriteToServer(TG_table);
                        s.Close();
                    }
                    Conn.Close();
                }
            }
        }

        protected void RG_FamilyMemeber_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridEditableItem && e.Item.IsInEditMode)
            {

                GridEditableItem edit = (GridEditableItem)e.Item;
                RadTextBox hdn_FMT = (RadTextBox)edit.FindControl("txt_IndividualID");
                HiddenField proband_TypeID = (HiddenField)edit.FindControl("hdn_FamilyMembrType");

                if (proband_TypeID.Value.Equals("15")) // it is proband
                {
                    ImageButton btn_Add = (ImageButton)edit.FindControl("btn_Assign_Individual");
                    btn_Add.Visible = false;

                    ImageButton imgbtn_delete = (ImageButton)edit.FindControl("imgbtn_Delete");
                    imgbtn_delete.Visible = false;
                }

                string node = hdn_FMT.Text;
                if (node.Equals(""))
                {
                    ImageButton imgbtn_delete = (ImageButton)edit.FindControl("imgbtn_Delete");
                    imgbtn_delete.Visible = false;
                }
                if (!node.Equals(""))
                {

                    RadTextBox Txt_RelativeName = (RadTextBox)edit.FindControl("Txt_RelativeName");
                    Txt_RelativeName.Enabled = false;

                    RadTextBox txt_IndividualID = (RadTextBox)edit.FindControl("txt_IndividualID");
                    txt_IndividualID.Enabled = false;

                    hdn_FMT.Enabled = false;

                    RadDatePicker txtBD = (RadDatePicker)edit.FindControl("Txt_Bdate");
                    txtBD.Enabled = false;

                    RadDropDownList DDL_Gender = (RadDropDownList)edit.FindControl("DDL_Gender");
                    DDL_Gender.Enabled = false;

                    RadDropDownList DDL_Status = (RadDropDownList)edit.FindControl("DDL_Status");
                    DDL_Status.Enabled = false;

                }
            }

            if (e.Item is GridGroupHeaderItem)
            {
                GridGroupHeaderItem item = (GridGroupHeaderItem)e.Item;
                DataRowView groupDataRow = (DataRowView)e.Item.DataItem;
                if (groupDataRow["Family_Side"].Equals(0))
                    item.DataCell.Text = "Proband Family";
                if (groupDataRow["Family_Side"].Equals(1))
                    item.DataCell.Text = "Mother's Side of the Family";
                if (groupDataRow["Family_Side"].Equals(2))
                    item.DataCell.Text = "Father's Side of the Family";
                if (groupDataRow["Family_Side"].Equals(-1))
                    item.DataCell.Text = "Proband";

            }
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;

                HiddenField hdnsp = (HiddenField)item.FindControl("hdn_Gender");
                string sp = hdnsp.Value.ToString();
                ImageButton imgsp = (ImageButton)item.FindControl("Genderbtn");
                switch (sp)
                {
                    case "0":
                        imgsp.ImageUrl = "/img/icon/icon_female.png";
                        imgsp.ToolTip = "Female";
                        break;
                    case "1":
                        imgsp.ImageUrl = "/img/icon/icon_male.png";
                        imgsp.ToolTip = "Male";
                        break;
                    default:
                        imgsp.ImageUrl = "/img/icon/icon_unknown.png";
                        imgsp.ToolTip = "UnKnown";
                        break;
                }

                HiddenField hdnsp_Status = (HiddenField)item.FindControl("hdn_Status");
                string sp_Status = hdnsp_Status.Value.ToString();
                ImageButton imgStatus = (ImageButton)item.FindControl("Statusbtn");
                switch (sp_Status)
                {
                    case "0":
                        imgStatus.ImageUrl = "/img/icon/icon_dead.png";
                        imgStatus.ToolTip = "Dead";
                        break;
                    case "1":
                        imgStatus.ImageUrl = "/img/icon/icon_alive.png";
                        imgStatus.ToolTip = "Alive";
                        break;
                    default:
                        imgStatus.ImageUrl = "/img/icon/icon_unknown.png";
                        imgStatus.ToolTip = "UnKnown";
                        break;

                }


                // Avoid to delete probnad & father & mother & Maternal/Grandfather & Paternal Grandmother/Grandfather
                HiddenField hdn_hasChild = (HiddenField)item.FindControl("hdn_proband_Haschild");
                int hasChild = Convert.ToInt32(hdn_hasChild.Value.ToString());
                string spUpD = item.GetDataKeyValue("Node_Key").ToString();
                if ((hasChild > 0 && spUpD == "3")|| spUpD == "0" || spUpD == "1" || spUpD == "2" || spUpD == "-13" || spUpD == "-12" || spUpD == "-11" || spUpD == "-10")
                {
                    ImageButton Edit = (ImageButton)item.FindControl("Delete_FamilyMember");
                    Edit.Visible = false;

                }
            }

        }

        protected void RBtn_DrawPedigree_Click(object sender, EventArgs e)
        {
            StringBuilder Pedigree = new StringBuilder();
            string spouseGender = string.Empty;
            string SpouseTitle = string.Empty;
            string probandID = string.Empty;
            string Gender = string.Empty;
            string FamilyID = Session["FamilyID"].ToString();


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

            SqlParCol["@FamilyID"].Value = Convert.ToInt64(FamilyID);
            SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
            SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
            SqlParCol["@proband_Hasspouse"].Direction = ParameterDirection.Output;
            SqlParCol["@HostID"].Value = Session["HostID_ForFamilyMember"];

            DataTable myDataTable = new DataTable();
            conn.Open();
            try
            {
                SqlDataAdptrCmd.Fill(myDataTable);
                Session["proband_Hasspouse"] =  SqlParCol["@proband_Hasspouse"].Value.ToString();
            }
            finally
            {
                conn.Close();
            }

            if (myDataTable.Rows.Count > 1)
            {
                Pedigree.Append("{" + "\"" + "d" + "\"" + ":[");

                foreach (DataRow row in myDataTable.Rows)
                {
                    string RelationToProband = row["FamilyMemberTypeName"].ToString().Trim();
                    string name = (row["RelativeName"].ToString() != "") ? row["RelativeName"].ToString() : row["FamilyMemberTypeName"].ToString();
                    string status = (row["RelativeStatus"].ToString() == "0") ? "AS" : "";
                    Gender = (row["RelativeGender"].ToString() == "0") ? "F" : "M";
                    probandID = row["IndividualID"].ToString();



                    switch (RelationToProband)
                    {

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
                         //   Pedigree.Append("{" + "\"" + "key" + "\"" + ": 2, " + "\"" + "n" + "\"" + ":" + "\"" + probandID + "\"" + ", " + "\"" + "s" + "\"" + ":" + "\"" + Gender + "\"" + " ," + "\"" + "m" + "\"" + ": 1 ," + "\"" + "f" + "\"" + ":0, " + "\"" + SpouseTitle + "\"" + ":3" + ", " + "\"" + "a" + "\"" + ":[" + "\"" + row["Code_TL"] + "\"" + "," + "\"" + row["Code_TR"] + "\"" + "," + "\"" + row["Code_BL"] + "\"" + "," + "\"" + row["Code_BR"] + "\"" + "," + "\"" + status + "\"" + "]},");
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


                    }


                }


                String aa = Pedigree.ToString().Remove(Pedigree.ToString().LastIndexOf(","));
                aa = aa + "]}";
                Txt_PVal.Value = aa.ToString();


                string message = "init();";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
            }
            else
            {

                string message = "DeleteDiagram();";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);


            }
        }

        protected List<string> Find_Code_For_Color(List<string> ColorList)
        {
            List<string> color_code = new List<string>();

            var TmpList = new List<object>().Select(t => new { name = default(string), value = default(string) }).ToList();
            TmpList.Add(new { name = "Top Left", value = ColorList[0] });
            TmpList.Add(new { name = "Top Right", value = ColorList[1] });
            TmpList.Add(new { name = "Bottom Left", value = ColorList[2] });
            TmpList.Add(new { name = "Bottom Right", value = ColorList[3] });

            String COLOR = string.Empty;

            foreach (var item in TmpList)
            {

                switch (item.value)
                {
                    case "Green":
                        switch (item.name)
                        {
                            case "Top Left":
                                COLOR = "ATL";
                                break;
                            case "Top Right":
                                COLOR = "ATR";
                                break;
                            case "Bottom Left":
                                COLOR = "ABL";
                                break;
                            case "Bottom Right":
                                COLOR = "ABR";
                                break;
                        }
                        break;
                    case "Orange":
                        switch (item.name)
                        {
                            case "Top Left":
                                COLOR = "BTL";
                                break;
                            case "Top Right":
                                COLOR = "BTR";
                                break;
                            case "Bottom Left":
                                COLOR = "BBL";
                                break;
                            case "Bottom Right":
                                COLOR = "BBR";
                                break;
                        }
                        break;
                    case "Red":
                        switch (item.name)
                        {
                            case "Top Left":
                                COLOR = "AS";
                                break;
                            case "Top Right":
                                COLOR = "AS";
                                break;
                            case "Bottom Left":
                                COLOR = "AS";
                                break;
                            case "Bottom Right":
                                COLOR = "AS";
                                break;
                        }
                        break;
                    case "Cyan":
                        switch (item.name)
                        {
                            case "Top Left":
                                COLOR = "DTL";
                                break;
                            case "Top Right":
                                COLOR = "DTR";
                                break;
                            case "Bottom Left":
                                COLOR = "DBL";
                                break;
                            case "Bottom Right":
                                COLOR = "DBR";
                                break;
                        }
                        break;
                    case "Gold":
                        switch (item.name)
                        {
                            case "Top Left":
                                COLOR = "ETL";
                                break;
                            case "Top Right":
                                COLOR = "ETR";
                                break;
                            case "Bottom Left":
                                COLOR = "EBL";
                                break;
                            case "Bottom Right":
                                COLOR = "EBR";
                                break;
                        }
                        break;
                    case "Pink":
                        switch (item.name)
                        {
                            case "Top Left":
                                COLOR = "FTL";
                                break;
                            case "Top Right":
                                COLOR = "FTR";
                                break;
                            case "Bottom Left":
                                COLOR = "FBL";
                                break;
                            case "Bottom Right":
                                COLOR = "FBR";
                                break;
                        }
                        break;
                    case "Blue":
                        switch (item.name)
                        {
                            case "Top Left":
                                COLOR = "GTL";
                                break;
                            case "Top Right":
                                COLOR = "GTR";
                                break;
                            case "Bottom Left":
                                COLOR = "GBL";
                                break;
                            case "Bottom Right":
                                COLOR = "GBR";
                                break;
                        }
                        break;
                    case "Brown":
                        switch (item.name)
                        {
                            case "Top Left":
                                COLOR = "HTL";
                                break;
                            case "Top Right":
                                COLOR = "HTR";
                                break;
                            case "Bottom Left":
                                COLOR = "HBL";
                                break;
                            case "Bottom Right":
                                COLOR = "HBR";
                                break;
                        }
                        break;
                    case "Purple":
                        switch (item.name)
                        {
                            case "Top Left":
                                COLOR = "ITL";
                                break;
                            case "Top Right":
                                COLOR = "ITR";
                                break;
                            case "Bottom Left":
                                COLOR = "IBL";
                                break;
                            case "Bottom Right":
                                COLOR = "IBR";
                                break;
                        }
                        break;
                    case "Chartreuse":
                        switch (item.name)
                        {
                            case "Top Left":
                                COLOR = "JTL";
                                break;
                            case "Top Right":
                                COLOR = "JTR";
                                break;
                            case "Bottom Left":
                                COLOR = "JBL";
                                break;
                            case "Bottom Right":
                                COLOR = "JBR";
                                break;
                        }
                        break;
                    case "Lightgray":
                        switch (item.name)
                        {
                            case "Top Left":
                                COLOR = "KTL";
                                break;
                            case "Top Right":
                                COLOR = "KTR";
                                break;
                            case "Bottom Left":
                                COLOR = "KBL";
                                break;
                            case "Bottom Right":
                                COLOR = "KBR";
                                break;
                        }
                        break;
                    case "Magenta":
                        switch (item.name)
                        {
                            case "Top Left":
                                COLOR = "LTL";
                                break;
                            case "Top Right":
                                COLOR = "LTR";
                                break;
                            case "Bottom Left":
                                COLOR = "LBL";
                                break;
                            case "Bottom Right":
                                COLOR = "LBR";
                                break;
                        }
                        break;

                }

                color_code.Add(COLOR);
            }

            return color_code;

        }

        private string GetSelectedTitle(RadColorPicker picker)
        {
            var selectedColor = System.Drawing.ColorTranslator.ToHtml(picker.SelectedColor);
            var R = picker.SelectedColor.R;
            var G = picker.SelectedColor.G;
            var B = picker.SelectedColor.B;
            string title = string.Empty;
            foreach (ColorPickerItem item in picker.Items)
            {
                if (item.Value.R == R && item.Value.G == G && item.Value.B == B)
                    title = item.Value.Name;

            }

            return title;
        }

        protected void RG_FamilyMemeber_UpdateCommand(object sender, GridCommandEventArgs e)
        {
          
            GridEditFormItem editForm = (GridEditFormItem)e.Item;
            string FamilyMemberTypeID = editForm.GetDataKeyValue("FamilyMemberTypeID").ToString();
            string Node_Key = editForm.GetDataKeyValue("Node_Key").ToString();

            RadTextBox RelativeName = (RadTextBox)editForm.FindControl("Txt_RelativeName");
            string RelativeName_text = RelativeName.Text;

            RadTextBox RelativeID = (RadTextBox)editForm.FindControl("txt_IndividualID");
            string RelativeID_text = RelativeID.Text.ToString();

          

            string status = String.Empty;
            string gender = String.Empty;
            string BDate = String.Empty;

            if (RelativeID_text.Equals(""))
            {
                RadDropDownList Relative_Status = (RadDropDownList)editForm.FindControl("DDL_Status");
                status = Relative_Status.SelectedValue.ToString();

                RadDropDownList Relative_Gender = (RadDropDownList)editForm.FindControl("DDL_Gender");
                gender = Relative_Gender.SelectedValue.ToString();

                RadDatePicker BD = (RadDatePicker)editForm.FindControl("Txt_Bdate");
                BDate = BD.SelectedDate == null ? "" : BD.DbSelectedDate.ToString();


            }
            else
            {
                HiddenField hdn_status = (HiddenField)FindControl("hdn_StatusIndividual_EditTemplate");
                status = hdn_status.Value.ToString();

                HiddenField hdn_gender = (HiddenField)FindControl("hdn_GenderIndividual_EditTemplate");
                gender = hdn_gender.Value.ToString();

                HiddenField hdn_BDate = (HiddenField)FindControl("hdn_BDateIndividual_EditTemplate");
                BDate = hdn_BDate.Value.ToString();
            }

            

            RadColorPicker RCP_color_TL = (RadColorPicker)editForm.FindControl("RCP_TL");
            string Selectedcolor_TL = GetSelectedTitle(RCP_color_TL);// GetSelectedTitle(RCP_color_TL);
            string Hex_TL = ColorTranslator.ToHtml(RCP_color_TL.SelectedColor);

            RadColorPicker RCP_color_TR = (RadColorPicker)editForm.FindControl("RCP_TR");
            string Selectedcolor_TR = GetSelectedTitle(RCP_color_TR);
            string Hex_TR = ColorTranslator.ToHtml(RCP_color_TR.SelectedColor);

            RadColorPicker RCP_color_BR = (RadColorPicker)editForm.FindControl("RCP_BR");
            string Selectedcolor_BR = GetSelectedTitle(RCP_color_BR);
            string Hex_BR = ColorTranslator.ToHtml(RCP_color_BR.SelectedColor);

            RadColorPicker RCP_color_BL = (RadColorPicker)editForm.FindControl("RCP_BL");
            string Selectedcolor_BL = GetSelectedTitle(RCP_color_BL);
            string Hex_BL = ColorTranslator.ToHtml(RCP_color_BL.SelectedColor);



            List<string> color_selected = new List<string>();
            color_selected.Add(Selectedcolor_TL);
            color_selected.Add(Selectedcolor_TR);
            color_selected.Add(Selectedcolor_BL);
            color_selected.Add(Selectedcolor_BR);


            color_selected = Find_Code_For_Color(color_selected);


            RadTextBox Disease_Desc_TL = (RadTextBox)editForm.FindControl("Disease_Desc_TL");
            string Disease_TL = Disease_Desc_TL.Text.ToString();

            RadTextBox Disease_Desc_TR = (RadTextBox)editForm.FindControl("Disease_Desc_TR");
            string Disease_TR = Disease_Desc_TR.Text.ToString();

            RadTextBox Disease_Desc_BL = (RadTextBox)editForm.FindControl("Disease_Desc_BL");
            string Disease_BL = Disease_Desc_BL.Text.ToString();

            RadTextBox Disease_Desc_BR = (RadTextBox)editForm.FindControl("Disease_Desc_BR");
            string Disease_BR = Disease_Desc_BR.Text.ToString();



            SqlCommand Cmd = new SqlCommand("Sp_FamilyMember_Upd", new SqlConnection(CnnStr));
            Cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = Cmd.Parameters;
            SqlParCol.Add(new SqlParameter("@FamilyID", SqlDbType.BigInt));
            SqlParCol.Add(new SqlParameter("@IndividualID", SqlDbType.BigInt));
            SqlParCol.Add(new SqlParameter("@FamilyMemberTypeID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@RelativeName", SqlDbType.NVarChar, 10));
            SqlParCol.Add(new SqlParameter("@RelativeBirthdate", SqlDbType.NVarChar, 50));
            SqlParCol.Add(new SqlParameter("@Node_Key", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@RelativeGender", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@RelativeStatus", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@Disease_TL", SqlDbType.NVarChar, 10));
            SqlParCol.Add(new SqlParameter("@Code_TL", SqlDbType.VarChar, 10));
            SqlParCol.Add(new SqlParameter("@Hex_TL", SqlDbType.VarChar, 10));
            SqlParCol.Add(new SqlParameter("@Disease_TR", SqlDbType.NVarChar, 10));
            SqlParCol.Add(new SqlParameter("@Code_TR", SqlDbType.NVarChar, 3));
            SqlParCol.Add(new SqlParameter("@Hex_TR", SqlDbType.VarChar, 10));
            SqlParCol.Add(new SqlParameter("@Disease_BL", SqlDbType.NVarChar, 10));
            SqlParCol.Add(new SqlParameter("@Code_BL", SqlDbType.NVarChar, 3));
            SqlParCol.Add(new SqlParameter("@Hex_BL", SqlDbType.VarChar, 10));
            SqlParCol.Add(new SqlParameter("@Disease_BR", SqlDbType.NVarChar, 10));
            SqlParCol.Add(new SqlParameter("@Code_BR", SqlDbType.NVarChar, 3));
            SqlParCol.Add(new SqlParameter("@Hex_BR", SqlDbType.VarChar, 10));
            SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@HostID", SqlDbType.Int));

            SqlParCol["@FamilyID"].Value = Session["FamilyID"];
            if (RelativeID_text != "")
            {
                SqlParCol["@IndividualID"].Value = Convert.ToInt64(RelativeID_text);
                
            }
            else
            {
                SqlParCol["@IndividualID"].Value = DBNull.Value;
                

            }

            SqlParCol["@FamilyMemberTypeID"].Value = Convert.ToInt32(FamilyMemberTypeID);

            SqlParCol["@RelativeName"].Value = RelativeName_text;
            if (BDate == "" || BDate.Length < 4)
                SqlParCol["@RelativeBirthdate"].Value = DBNull.Value;
            else
                SqlParCol["@RelativeBirthdate"].Value = Convert.ToDateTime(BDate);



            if (status != "")
                SqlParCol["@RelativeStatus"].Value = Convert.ToInt32(status);
            else
                SqlParCol["@RelativeStatus"].Value = DBNull.Value;

            if (gender != "")
                SqlParCol["@RelativeGender"].Value = Convert.ToInt32(gender);
            else
                SqlParCol["@RelativeGender"].Value = DBNull.Value;



            SqlParCol["@Node_Key"].Value = Convert.ToInt32(Node_Key);
            SqlParCol["@Disease_TL"].Value = Disease_TL;
            SqlParCol["@Code_TL"].Value = color_selected[0];
            SqlParCol["@Hex_TL"].Value = Hex_TL;
            SqlParCol["@Disease_TR"].Value = Disease_TR;
            SqlParCol["@Code_TR"].Value = color_selected[1];
            SqlParCol["@Hex_TR"].Value = Hex_TR;
            SqlParCol["@Disease_BL"].Value = Disease_BL;
            SqlParCol["@Code_BL"].Value = color_selected[2];
            SqlParCol["@Hex_BL"].Value = Hex_BL;
            SqlParCol["@Disease_BR"].Value = Disease_BR;
            SqlParCol["@Code_BR"].Value = color_selected[3];
            SqlParCol["@Hex_BR"].Value = Hex_BR;
            SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
            SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
            SqlParCol["@HostID"].Value = Session["HostID_ForFamilyMember"];

            try
            {
                Cmd.Connection.Open();
                Cmd.ExecuteNonQuery();

                Cmd.Connection.Close();

            }
            catch (Exception ex)
            {
                Label lblError = new Label();
                lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
            }

            RG_FamilyMemeber.Rebind(); // nessesary to rebind

        }

        protected void RCP_TL_DataBinding(object sender, EventArgs e)
        {
            RadColorPicker rc = (RadColorPicker)sender;
            if (rc.Localization.CurrentColorText != "(Current Color is {0})")
            {
                rc.SelectedColor = System.Drawing.ColorTranslator.FromHtml(rc.Localization.CurrentColorText);
            }
        }

        protected void RCP_TR_DataBinding(object sender, EventArgs e)
        {
            RadColorPicker rc = (RadColorPicker)sender;
            if (rc.Localization.CurrentColorText != "(Current Color is {0})")
            {
                rc.SelectedColor = System.Drawing.ColorTranslator.FromHtml(rc.Localization.CurrentColorText);
            }
        }

        protected void RCP_BL_DataBinding(object sender, EventArgs e)
        {
            RadColorPicker rc = (RadColorPicker)sender;
            if (rc.Localization.CurrentColorText != "(Current Color is {0})")
            {
                rc.SelectedColor = System.Drawing.ColorTranslator.FromHtml(rc.Localization.CurrentColorText);
            }
        }

        protected void RCP_BR_DataBinding(object sender, EventArgs e)
        {
            RadColorPicker rc = (RadColorPicker)sender;
            if (rc.Localization.CurrentColorText != "(Current Color is {0})")
            {
                rc.SelectedColor = System.Drawing.ColorTranslator.FromHtml(rc.Localization.CurrentColorText);
            }
        }

        protected void txt_IndivdualID_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Session["ProbandID"].ToString()))
            {

                txt_IndivdualID.Text = Session["ProbandID"].ToString();
            }
            else
            {
                btn_AssignIndividual.Enabled = true;

            }


        }
        protected void RG_FamilyMemeber_ItemCommand(object sender, GridCommandEventArgs e)
        {
          
            //if (e.CommandName.Equals("DeleteAllMembers"))
            //{

            //    SqlCommand Cmd = new SqlCommand("Sp_FamilyMembers_All_Del", new SqlConnection(CnnStr));
            //    Cmd.CommandType = CommandType.StoredProcedure;
            //    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            //    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            //    SqlParCol = Cmd.Parameters;
            //    SqlParCol.Add(new SqlParameter("@FamilyID", SqlDbType.BigInt));
            //    SqlParCol["@FamilyID"].Value = Session["FamilyID"];

            //    try
            //    {
            //        Cmd.Connection.Open();
            //        Cmd.ExecuteNonQuery();
            //        Cmd.Connection.Close();


            //        string message = "DeleteDiagram();";
            //        ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);


            //    }
            //    catch (Exception ex)
            //    {
            //        Label lblError = new Label();
            //        lblError.Text = "Unable to delete. Reason: " + ex.Message;
            //        lblError.ForeColor = System.Drawing.Color.Red;
            //    }
            //   btn_AddFamilyMembers.Disabled = false;
            //    RG_FamilyMemeber.Rebind();


            //}


            if (e.CommandName.Equals("DeleteAssigned_RelativeID"))
            {
                GridEditableItem edititem = (GridEditableItem)e.Item;
                RadTextBox RTB_RelativeID = (RadTextBox)((Telerik.Web.UI.GridDataItem)edititem).EditFormItem.FindControl("txt_IndividualID");
                string RelativeID = RTB_RelativeID.Text;
                string Node_Key = edititem.GetDataKeyValue("Node_Key").ToString();

                SqlCommand Cmd = new SqlCommand("Sp_FamilyMember_info_Del", new SqlConnection(CnnStr));
                Cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                SqlParCol = Cmd.Parameters;

                SqlParCol.Add(new SqlParameter("@FamilyID", SqlDbType.BigInt));
                SqlParCol.Add(new SqlParameter("@RelativeID", SqlDbType.BigInt));
                SqlParCol.Add(new SqlParameter("@Node_Key", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@HostID", SqlDbType.Int));

                SqlParCol["@FamilyID"].Value = Session["FamilyID"];
                SqlParCol["@RelativeID"].Value = Convert.ToInt64(RelativeID);
                SqlParCol["@Node_Key"].Value = Node_Key;
                SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
                SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
                SqlParCol["@HostID"].Value = Session["HostID_ForFamilyMember"];

                try
                {
                    Cmd.Connection.Open();
                    Cmd.ExecuteNonQuery();
                    Cmd.Connection.Close();
                }
                catch (Exception ex)
                {
                    Label lblError = new Label();
                    lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                    lblError.ForeColor = System.Drawing.Color.Red;
                }

                RG_FamilyMemeber.Rebind();
            }

            if (e.CommandName.Equals("Delete_FamilyMember"))
            {

                GridDataItem editForm = (GridDataItem)e.Item;
                GridEditableItem edititem = (GridEditableItem)e.Item;
                string Node_Key = editForm.GetDataKeyValue("Node_Key").ToString();
             //   RadTextBox RTB_RelativeID = editForm["IndividualID"].t; //(RadTextBox)((Telerik.Web.UI.GridDataItem)edititem).EditFormItem.FindControl("txt_IndividualID");
                string RelativeID = editForm["IndividualID"].Text;
              

                SqlCommand Cmd = new SqlCommand("Sp_FamilyMember_Del", new SqlConnection(CnnStr));
                Cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                SqlParCol = Cmd.Parameters;
                SqlParCol.Add(new SqlParameter("@FamilyID", SqlDbType.BigInt));
                SqlParCol.Add(new SqlParameter("@RelativeID", SqlDbType.BigInt));
                SqlParCol.Add(new SqlParameter("@Node_Key", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@HostID", SqlDbType.Int));

                SqlParCol["@FamilyID"].Value = Session["FamilyID"];
                if (RelativeID.Length == 11)
                    SqlParCol["@RelativeID"].Value = Convert.ToInt64(RelativeID);
                else
                    SqlParCol["@RelativeID"].Value = DBNull.Value;
                SqlParCol["@Node_Key"].Value = Convert.ToInt32(Node_Key);
                SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
                SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
                SqlParCol["@HostID"].Value = Session["HostID_ForFamilyMember"];


                try
                {
                    Cmd.Connection.Open();
                    Cmd.ExecuteNonQuery();
                    Cmd.Connection.Close();
                }
                catch (Exception ex)
                {
                    Label lblError = new Label();
                    lblError.Text = "Unable to delete. Reason: " + ex.Message;
                    lblError.ForeColor = System.Drawing.Color.Red;
                }

                RG_FamilyMemeber.Rebind();
            }

        }
        protected void RG_FamilyMemeber_PreRender(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(txt_IndivdualID.Text))
                {
                    btn_AddFamilyMembers.Disabled = false;
                }
            }


        }

        protected void btn_insert_Proband_Click(object sender, EventArgs e)
        {

            // Proband_insertion_API();


            HiddenField hdn_ProbandID = (HiddenField)FindControl("hdn_ProbandID");
            HiddenField hdn_ProbandStatus = (HiddenField)FindControl("hdn_ProbandStatus");
            HiddenField hdn_ProbandBDate = (HiddenField)FindControl("hdn_ProbandBDate");
            HiddenField hdn_ProbandGender = (HiddenField)FindControl("hdn_ProbandGender");


            ////////-----------------



            DataTable TG_table = new DataTable();
            TG_table.Columns.Add("FamilyMemberTypeName", typeof(String));
            TG_table.Columns.Add("FamilyID", typeof(Int64));
            TG_table.Columns.Add("IndividualID", typeof(Int64));
            TG_table.Columns.Add("FamilyMemberTypeID", typeof(Int32));
            TG_table.Columns.Add("Family_side", typeof(Int32));
            TG_table.Columns.Add("Node_Key", typeof(Int32));
            TG_table.Columns.Add("RelativeName", typeof(String));
            TG_table.Columns.Add("RelativeBirthdate", typeof(String));
            TG_table.Columns.Add("RelativeGender", typeof(Int32));
            TG_table.Columns.Add("RelativeStatus", typeof(Int32));
            TG_table.Columns.Add("UserID", typeof(Int32));
          
            

            TG_table.Rows.Add("Proband", Session["FamilyID"], hdn_ProbandID.Value, 15, -1, 2, hdn_ProbandName.Value.ToString(),
            null, hdn_ProbandGender.Value, hdn_ProbandStatus.Value, Session["WiNGSMasterId"]);

            /////------
            SqlCommand Cmd = new SqlCommand("Sp_Family_Proband_Ins", new SqlConnection(CnnStr));
            Cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = Cmd.Parameters;
            SqlParCol.Add(new SqlParameter("@FamilyID", SqlDbType.BigInt));
            SqlParCol.Add(new SqlParameter("@IndividualID", SqlDbType.BigInt));
            SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
            SqlParCol.AddWithValue("@PedigreeData", TG_table);
            SqlParCol.Add(new SqlParameter("@Feedback", SqlDbType.NVarChar, -1));
            SqlParCol.Add(new SqlParameter("@HostID", SqlDbType.Int));

            SqlParCol["@FamilyID"].Value = Session["FamilyID"];
            SqlParCol["@IndividualID"].Value = hdn_ProbandID.Value;
            SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
            SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
            SqlParCol["@Feedback"].Direction = ParameterDirection.Output;
            SqlParCol["@HostID"].Value = Session["HostID_ForFamilyMember"];

            try
            {
                Cmd.Connection.Open();
                Cmd.ExecuteNonQuery();
                Cmd.Connection.Close();
                if (!SqlParCol["@Feedback"].Value.Equals("Success"))
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b> "+ SqlParCol["@Feedback"].Value.ToString()+"</b><br />');", true);
                Session["ProbandID"] = hdn_ProbandID.Value.ToString();
                txt_IndivdualID.Text = Session["ProbandID"].ToString();
                Session["Proband_Gender"] = hdn_ProbandID.Value.ToString();
               
            }
            catch (Exception ex)
            {
                Label lblError = new Label();
                lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>an error occurred</b><br />');", true);
            }
            RG_FamilyMemeber.Rebind();

        }

       
        protected void btn_AssignIndividual_Command(object sender, CommandEventArgs e)
        {
           
           foreach (GridDataItem item in RG_FamilyMemeber.EditItems)
           {
               HiddenField txt = (HiddenField)item.EditFormItem.FindControl("hdn_FamilyMembrType");
               Session["FamilyMemberTypeID"] = txt.Value;
           }
          
            Session["FamilyMember_OR_Proband"] = e.CommandArgument.ToString();
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", "OpenWinAssignID();", true);


        }

        protected void btn_AssignIndividual_Click(object sender, EventArgs e)
        {
          //  Session["ProbandID"] = null;
            Session["FamilyMemberTypeID"] = "15";
            Session["FamilyMember_OR_Proband"] = 0;

            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", "OpenWinAssignID();", true);
        }

        protected void DS_RG_FamilyMember_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            string FamilyID = Session["FamilyID"].ToString();


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

            SqlParCol["@FamilyID"].Value = Convert.ToInt64(FamilyID);
            SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
            SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
            SqlParCol["@proband_Hasspouse"].Direction = ParameterDirection.Output;
            SqlParCol["@HostID"].Value = Session["HostID_ForFamilyMember"];

            DataTable myDataTable = new DataTable();
            conn.Open();
            try
            {
                SqlDataAdptrCmd.Fill(myDataTable);
                Session["proband_Hasspouse"] = SqlParCol["@proband_Hasspouse"].Value.ToString();
            }
            finally
            {
                conn.Close();
            }
        }
    }
}
