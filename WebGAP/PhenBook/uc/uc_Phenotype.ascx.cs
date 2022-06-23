using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.PhenBook.uc
{
    public partial class uc_Phenotype : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}


        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!this.IsPostBack)
            {
                RadTreeList1.ExpandedIndexes.Add(new TreeListHierarchyIndex { LevelIndex = 0, NestedLevel = 0 });
                RadTreeList1.ExpandedIndexes.Add(new TreeListHierarchyIndex { LevelIndex = 1, NestedLevel = 0 });
                RadTreeList1.ExpandedIndexes.Add(new TreeListHierarchyIndex { LevelIndex = 2, NestedLevel = 0 });

             }
        }

        public class ItemsTree
        {
            public string term2_id { get; set; }
            public string desc { get; set; }

            public string term1_id { get; set; }
            public ItemsTree(string id, string Desc, string parentID)
            {
                this.term2_id = id;
                this.desc = Desc;
                this.term1_id = parentID;
            }
        }

        protected void RadTreeList1_NeedDataSource(object sender, TreeListNeedDataSourceEventArgs e)
        {

            DataTable dt = GetDataTable("EXEC Sp_ontology");

            if (dt.Rows.Count > 0)
            {
                List<ItemsTree> list = new List<ItemsTree>();
                foreach (DataRow row in dt.Rows)
                {
                    string ParentID = string.Empty;
                    if (row["term1_id"].ToString().Trim().Equals("1"))
                         ParentID = "";
                    else
                     ParentID = row["term1_id"].ToString().Trim();
                    string id = row["term2_id"].ToString().Trim();
                    string Desc = row["name"].ToString().Trim();
                    list.Add(new ItemsTree(id, Desc, ParentID));
                }
                 RadTreeList1.DataSource = list;
            
            }

            //DataTable dt = GetDataTable("EXEC Sp_ontology");

            //if (dt.Rows.Count > 0)
            //{
            //    List<Items> list = new List<Items>();
            //    foreach (DataRow row in dt.Rows)
            //    {
            //        string ParentID = row["term1_id"].ToString().Trim();
            //        string ID = row["term2_id"].ToString().Trim();
            //        string Desc = row["name"].ToString().Trim();
            //        list.Add(new Items(ID, Desc, ParentID));
            //    }
            //    RadTreeList1.DataSource = list;
            //}
        }


        protected void Page_Init(object sender, System.EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lbl_Individualid.Text = Session["IndividualID"].ToString();
            }
        }

        private int StringToInt(string I)
        {
            int row, a = getIndexofNumber(I);
            string Numberpart = I.Substring(a, I.Length - a);
            row = Convert.ToInt32(Numberpart);
            return row;
        }

        private int getIndexofNumber(string cell)
        {
            int indexofNum = -1;
            foreach (char c in cell)
            {
                indexofNum++;
                if (Char.IsDigit(c))
                {
                    return indexofNum;
                }
            }
            return indexofNum;
        }

        public DataTable GetDataTable(string query)
        {
            SqlConnection connection1 = new SqlConnection(CnnStr);
            SqlDataAdapter adapter1 = new SqlDataAdapter();
            adapter1.SelectCommand = new SqlCommand(query, connection1);
            DataTable myDataTable = new DataTable();
            connection1.Open();
            try
            {
                adapter1.Fill(myDataTable);
            }
            finally
            {
                connection1.Close();
            }
            return myDataTable;
        }

        protected void RG_Requests_ItemCommand(object sender, GridCommandEventArgs e)
        {
            SqlConnection conn = new SqlConnection(CnnStr);
            conn.Open();

            if (e.CommandName == "SelYes" || e.CommandName == "SelNo" || e.CommandName == "SelUnkonwn")
            {
                GridDataItem item = (GridDataItem)e.Item;
                string HpoID = item.GetDataKeyValue("acc").ToString();
                string HpoDesc = item.GetDataKeyValue("name").ToString();
                int HpoStatus;

                if (e.CommandName == "SelYes")
                {
                    HpoStatus = 1;
                }
                else if (e.CommandName == "SelNo")
                {
                    HpoStatus = 0;
                }
                else
                {
                    HpoStatus = 2;
                }

                int parameter = StringToInt(HpoID);
                DataTable data = GetDataTable("EXEC Sp_features_Categories " + parameter);

                if (data.Rows.Count > 0)
                {
                    foreach (DataRow row in data.Rows)
                    {
                        string CurrHpoCategory = row["id"].ToString().Trim();
                        int HpoCategory = StringToInt(CurrHpoCategory);
                        int HpoId = StringToInt(HpoID);
                        SqlCommand Cmd = new SqlCommand("Sp_IndividualPhenotype_Ins", new SqlConnection(CnnStr));
                        Cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                        SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                        SqlParCol = Cmd.Parameters;
                        SqlParCol.Add(new SqlParameter("@IndividualID", SqlDbType.BigInt));
                        SqlParCol.Add(new SqlParameter("@HpoCategoryID", SqlDbType.Int));
                        SqlParCol.Add(new SqlParameter("@HpoID", SqlDbType.Int));
                        SqlParCol.Add(new SqlParameter("@HpoStatus", SqlDbType.Int));
                        SqlParCol.Add(new SqlParameter("@HpoSeverity", SqlDbType.Int));
                        SqlParCol.Add(new SqlParameter("@HpoAcc", SqlDbType.NVarChar));
                        SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                        SqlParCol.Add(new SqlParameter("@Success", SqlDbType.Int));
                        SqlParCol["@IndividualID"].Value = Session["IndividualID"].ToString();
                        SqlParCol["@HpoCategoryID"].Value = HpoCategory;
                        SqlParCol["@HpoID"].Value = HpoId;
                        SqlParCol["@HpoStatus"].Value = HpoStatus;
                        SqlParCol["@HpoSeverity"].Value = 0;
                        SqlParCol["@HpoAcc"].Value = HpoID;
                        SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
                        Cmd.Parameters["@Success"].Direction = ParameterDirection.Output;

                        try
                        {
                            Cmd.Connection.Open();
                            Cmd.ExecuteNonQuery();
                            if (Cmd.Parameters["@Success"].Value.Equals(0))
                            {
                                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>The Hpo Term is already added!!</b><br />');", true);

                            }
                            Cmd.Connection.Close();
                        }
                        catch (Exception ex)
                        {
                            Label lblError = new Label();
                            lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                            lblError.ForeColor = System.Drawing.Color.Red;
                        }

                    }
                }

                RG_IndividualPhenotype.Rebind();

            }
        }

        protected void RG_IndividualPhenotype_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (GridDataItem)e.Item;
            string HpoID = item.GetDataKeyValue("acc").ToString().Trim();
            int HpoId = StringToInt(HpoID);

            try
            {
                SqlConnection conn = new SqlConnection(CnnStr);
                conn.Open();
                //Update Query to update the Datatable  
                String UP = "EXEC Sp_IndividualPhenotype_Del " + HpoId;
                SqlCommand sc = new SqlCommand(UP, conn);
                sc.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ex)
            {
                Label lblError = new Label();
                lblError.Text = "Unable to update User. Reason: " + ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
                e.Canceled = true;
            }
            RG_IndividualPhenotype.Rebind();
        }

        protected void RG_IndividualPhenotype_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridGroupHeaderItem)
            {
                GridGroupHeaderItem item = (GridGroupHeaderItem)e.Item;
                DataRowView groupDataRow = (DataRowView)e.Item.DataItem;
                item.DataCell.Text = groupDataRow["Category_Desc"].ToString();
            }

            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                RadSlider SeverityVal = (RadSlider)item.FindControl("RS_Severity");
                HiddenField hdnseverityval = (HiddenField)item.FindControl("hdn_severityvaforshow");
                SeverityVal.SelectedValue = hdnseverityval.Value;
                HiddenField hdnsp = (HiddenField)item.FindControl("hdn_status");
                string sp = hdnsp.Value.ToString();
                ImageButton imgsp = (ImageButton)item.FindControl("Statusbtn");
                Label desc = (Label)item.FindControl("txt_phenotypeDesc");
                Label id = (Label)item.FindControl("txt_phenotypeID");
                switch (sp)
                {
                    case "0":
                        imgsp.ImageUrl = "/img/icon/icon_no.png";
                        imgsp.ToolTip = "No";
                        desc.Attributes.CssStyle.Add("color", "red !important");
                        id.Attributes.CssStyle.Add("color", "red !important");
                        break;
                    case "1":
                        imgsp.ImageUrl = "/img/icon/icon_yes.png";
                        imgsp.ToolTip = "Yes";
                        desc.Attributes.CssStyle.Add("color", "blue !important");
                        id.Attributes.CssStyle.Add("color", "blue !important");
                        break;
                    default:
                        imgsp.ImageUrl = "/img/icon/icon_na.png";
                        imgsp.ToolTip = "UnKnown";
                        break;
                }
            }

        }

        protected void RG_IndividualPhenotype_ItemCommand(object sender, GridCommandEventArgs e)
        {
            SqlConnection conn = new SqlConnection(CnnStr);
            conn.Open();
            if (e.CommandName == "ChangeSeverity")
            {
                int HpoSeverity = StringToInt(hdn_severityval.Value);
                int HpoId = StringToInt(hdn_Hpoid.Value);
                SqlCommand Cmd = new SqlCommand("Sp_IndividualPhenotype_Update", new SqlConnection(CnnStr));
                Cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                SqlParCol = Cmd.Parameters;
                SqlParCol.Add(new SqlParameter("@IndividualID", SqlDbType.BigInt));
                SqlParCol.Add(new SqlParameter("@HpoID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@HpoSeverity", SqlDbType.Int));
                SqlParCol["@IndividualID"].Value = Session["IndividualID"].ToString();
                SqlParCol["@HpoID"].Value = HpoId;
                SqlParCol["@HpoSeverity"].Value = HpoSeverity;
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
                RG_IndividualPhenotype.Rebind();

            }

        }


        protected void btnDel_IndPheno_Click(object sender, EventArgs e)
        {

            SqlCommand Cmd = new SqlCommand("Sp_IndividualPhenotype_Del_All", new SqlConnection(CnnStr));
            Cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = Cmd.Parameters;
            SqlParCol.Add(new SqlParameter("@IndividualID", SqlDbType.BigInt));
            SqlParCol["@IndividualID"].Value = Session["IndividualID"].ToString();
            try
            {
                Cmd.Connection.Open();
                Cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Label lblError = new Label();
                lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
            }

            RG_IndividualPhenotype.Rebind();

        }

        protected void RG_IndividualPhenotype_DataBound(object sender, EventArgs e)
        {

            SqlCommand Cmd = new SqlCommand("Sp_Count_IndividualPhenotype_Statuse_PerSample", new SqlConnection(CnnStr));
            Cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = Cmd.Parameters;

            SqlParCol.Add(new SqlParameter("@IndividualID", SqlDbType.BigInt));
            SqlParCol["@IndividualID"].Value = Session["IndividualID"].ToString();
            try
            {
                Cmd.Connection.Open();
                DataTable dt = new DataTable();
                dt.Load(Cmd.ExecuteReader());
                int cstat = 0;
                int total = 0;
                Label summ_N = (Label)RG_IndividualPhenotype.MasterTableView.GetItems(GridItemType.CommandItem)[0].FindControl("txt_Summary_N");
                Label summ_Y = (Label)RG_IndividualPhenotype.MasterTableView.GetItems(GridItemType.CommandItem)[0].FindControl("txt_Summary_Y");
                Label summ_NA = (Label)RG_IndividualPhenotype.MasterTableView.GetItems(GridItemType.CommandItem)[0].FindControl("txt_Summary_NA");

                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        switch (row["HpoStatus"])
                        {
                            case 0:
                                cstat = (Int32)row["cc"];
                                summ_N.Text = "No:" + cstat.ToString();
                                break;
                            case 1:
                                cstat = (Int32)row["cc"];
                                summ_Y.Text = "Yes:" + cstat.ToString();
                                break;
                            case 2:
                                cstat = (Int32)row["cc"];
                                summ_NA.Text = "Not Applicable:" + cstat.ToString();
                                break;
                        }

                        cstat = (Int32)row["cc"];
                        total = total + cstat;
                    }
                    summ_NA.Text = summ_NA.Text + "   Total:" + total.ToString();
                }
            }
            catch (Exception ex)
            {
                Label lblError = new Label();
                lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
            }

        }

        protected void RG_DiseasePheno_ItemCommand(object sender, GridCommandEventArgs e)
        {

            SqlConnection conn = new SqlConnection(CnnStr);
            conn.Open();

            if (e.CommandName == "SelYes" || e.CommandName == "SelNo" || e.CommandName == "SelUnkonwn")
            {

                GridDataItem item = (GridDataItem)e.Item;

                string HpoID = item.GetDataKeyValue("acc").ToString();
                string HpoDesc = item.GetDataKeyValue("name").ToString();
                int HpoStatus;
                if (e.CommandName == "SelYes")
                {

                    HpoStatus = 1;
                }
                else if (e.CommandName == "SelNo")
                {
                    HpoStatus = 0;
                }
                else
                {
                    HpoStatus = 2;
                }

                int parameter = StringToInt(HpoID);
                DataTable data = GetDataTable("EXEC Sp_features_Categories " + parameter);

                if (data.Rows.Count > 0)
                {
                    foreach (DataRow row in data.Rows)
                    {

                        string CurrHpoCategory = row["id"].ToString().Trim();
                        int HpoCategory = StringToInt(CurrHpoCategory);
                        int HpoId = StringToInt(HpoID);
                        SqlCommand Cmd = new SqlCommand("Sp_IndividualPhenotype_Ins", new SqlConnection(CnnStr));
                        Cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                        SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                        SqlParCol = Cmd.Parameters;
                        SqlParCol.Add(new SqlParameter("@IndividualID", SqlDbType.BigInt));
                        SqlParCol.Add(new SqlParameter("@HpoCategoryID", SqlDbType.Int));
                        SqlParCol.Add(new SqlParameter("@HpoID", SqlDbType.Int));
                        SqlParCol.Add(new SqlParameter("@HpoStatus", SqlDbType.Int));
                        SqlParCol.Add(new SqlParameter("@HpoSeverity", SqlDbType.Int));
                        SqlParCol.Add(new SqlParameter("@HpoAcc", SqlDbType.NVarChar));
                        SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                        SqlParCol.Add(new SqlParameter("@Success", SqlDbType.Int));

                        SqlParCol["@IndividualID"].Value = Session["IndividualID"].ToString();
                        SqlParCol["@HpoCategoryID"].Value = HpoCategory;
                        SqlParCol["@HpoID"].Value = HpoId;
                        SqlParCol["@HpoStatus"].Value = HpoStatus;
                        SqlParCol["@HpoSeverity"].Value = 0;
                        SqlParCol["@HpoAcc"].Value = HpoID;
                        SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];

                        Cmd.Parameters["@Success"].Direction = ParameterDirection.Output;

                        try
                        {
                            Cmd.Connection.Open();
                            Cmd.ExecuteNonQuery();
                            if (Cmd.Parameters["@Success"].Value.Equals(0))
                            {
                                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>The Hpo Term is already added!!</b><br />');", true);

                            }

                            Cmd.Connection.Close();
                        }
                        catch (Exception ex)
                        {
                            Label lblError = new Label();
                            lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                            lblError.ForeColor = System.Drawing.Color.Red;

                        }
                    }
                }

                RG_IndividualPhenotype.Rebind();

            }
        }

     

        protected void btnChng_layout_Click2(object sender, EventArgs e)
        {

            if (btnChng_layout.SelectedToggleStateIndex.Equals(0))
            {
                GridGroupByExpression expression = new GridGroupByExpression();
                GridGroupByField gridGroupByField = new GridGroupByField();
                gridGroupByField = new GridGroupByField();
                gridGroupByField.FieldName = "Category_Desc";
                gridGroupByField.FormatString = "<strong>{0}</strong>";
                expression.SelectFields.Add(gridGroupByField);
                gridGroupByField = new GridGroupByField();
                gridGroupByField.FieldName = "Category_Desc";
                expression.GroupByFields.Add(gridGroupByField);
                RG_IndividualPhenotype.MasterTableView.GroupByExpressions.Add(expression);

            }
            else
            {
                RG_IndividualPhenotype.MasterTableView.GroupByExpressions.Clear();
            }
            RG_IndividualPhenotype.Rebind();
        }


      

        //protected void RTL_Ontology_NeedDataSource(object sender, TreeListNeedDataSourceEventArgs e)
        //{
        //    DataTable dt = GetDataTable("EXEC Sp_ontology");

        //    if (dt.Rows.Count > 0)
        //    {
        //        List<MyItem> list = new List<MyItem>();
        //        foreach (DataRow row in dt.Rows)
        //        {
        //            string ParentID = row["term1_id"].ToString().Trim();
        //            string ID = row["term2_id"].ToString().Trim();
        //            string Desc = row["name"].ToString().Trim();
        //            list.Add(new MyItem(ID, Desc, ParentID));
        //        }
        //        RTL_Ontology.DataSource = list;
        //    }


        //}
        //protected void RTL_Ontology_ItemCommand(object sender, TreeListCommandEventArgs e)
        //{
        //    if (e.CommandName == RadTreeList.ExpandCollapseCommandName)
        //    {
        //        DataTable dt = GetDataTable("EXEC Sp_ontology");

        //        if (dt.Rows.Count > 0)
        //        {
        //            List<MyItem> list = new List<MyItem>();
        //            foreach (DataRow row in dt.Rows)
        //            {
        //                string ParentID = row["term1_id"].ToString().Trim();
        //                string ID = row["term2_id"].ToString().Trim();
        //                string Desc = row["name"].ToString().Trim();
        //                list.Add(new MyItem(ID, Desc, ParentID));
        //            }
        //            RTL_Ontology.DataSource = list;
        //            RTL_Ontology.DataBind();
        //        }


        //    }
        //}

    }
}