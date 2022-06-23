using Accord.Statistics.Analysis;
using Accord.Statistics.Testing;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Telerik.Web.UI.GridExcelBuilder;
using WebGAP.Statistics;

namespace WebGAP.GAP.uc
{
    public partial class uc_SampleResult : System.Web.UI.UserControl
    {
        bool firstLoadRG = false;

        #region "CnnStr"{
        static string CnnStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}


        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Session["WiNGSMasterID"].ToString()))
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Session is expired!</b>'); height=120,width=250", true);
                Response.Redirect(String.Format("/Main.aspx"), false);
                return;
            }

            Session["TblName"] = Session["WiNGSMasterID"].ToString() + '_' + Session["FilterID_Filter"].ToString() + '_' + Session["SampleID_Filter"].ToString() + '_' + Session["FileID_Filter"].ToString();

            RG_SampleVariant.MasterTableView.CommandItemSettings.ShowExportToExcelButton = false;

            if (!IsPostBack)
            {

                String connString = CnnStr;
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                string selectCommand = "SELECT IndividualID FROM Tbl_Samples where SampleID= " + Session["SampleID_Filter"];


                using (SqlConnection conn = new SqlConnection(connString))
                {
                    conn.Open();
                    using (SqlCommand cmdSelect = new SqlCommand(selectCommand, conn))
                    {

                        SqlDataAdptrCmd.SelectCommand = cmdSelect;
                        cmdSelect.CommandType = CommandType.Text;
                        DataTable myDataTable = new DataTable();
                        SqlDataAdptrCmd.Fill(myDataTable);

                        if ((myDataTable.Rows.Count > 0) && (!String.IsNullOrEmpty(myDataTable.Rows[0]["IndividualID"].ToString())))
                            Session["IndivID"] = myDataTable.Rows[0]["IndividualID"].ToString();
                    }
                }

                if (Session["newQueryIsPassed"].ToString().Equals("true"))
                {
                    string deleteCommand = "Delete FROM Tbl_Filter_Result_SingleSample_Batch_Tracking where TblName= '" + Session["TblName"].ToString() + "' AND [State] = 'done' ";
                    using (SqlConnection conn = new SqlConnection(connString))
                    {
                        conn.Open();
                        using (SqlCommand cmdDel = new SqlCommand(deleteCommand, conn))
                        {
                            cmdDel.ExecuteNonQuery();
                        }
                    }
                    Session["newQueryIsPassed"] = "false";
                }

                GridBind();

            }

        }

        protected void RG_SampleVariant_Detail_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                //var JSONObj = new JavaScriptSerializer().Deserialize<Dictionary<string, string>>(item["gnomAD"].Text);

                Label lbl_StatTitle = item.FindControl("lbl_StatTitle") as Label;
                lbl_StatTitle.Text = "Variant: chr" + RG_SampleVariant.SelectedValues["chr"].ToString() + " : "
                                    + RG_SampleVariant.SelectedValues["start_pos"].ToString() + " "
                                    + RG_SampleVariant.SelectedValues["ref_all"].ToString() + "/" + RG_SampleVariant.SelectedValues["alt_all"].ToString()
                                    + "; in individual " + Session["IndvId_Filter"].ToString();

                Session["StatTitle"] = lbl_StatTitle.Text;

                HiddenField hdn_gnomAD = item.FindControl("hdn_gnomAD") as HiddenField;
                string geneAD = hdn_gnomAD.Value;
                var JSONObj = new JavaScriptSerializer().Deserialize<GnomAD>(geneAD);

                Label lbl_AN_AFR = item.FindControl("lbl_AN_AFR") as Label;
                Label lbl_AF_AFR = item.FindControl("lbl_AF_AFR") as Label;
                Label lbl_AN_ASJ = item.FindControl("lbl_AN_ASJ") as Label;
                Label lbl_AF_ASJ = item.FindControl("lbl_AF_ASJ") as Label;
                Label lbl_AN_EAS = item.FindControl("lbl_AN_EAS") as Label;
                Label lbl_AF_EAS = item.FindControl("lbl_AF_EAS") as Label;
                Label lbl_AN_FIN = item.FindControl("lbl_AN_FIN") as Label;
                Label lbl_AF_FIN = item.FindControl("lbl_AF_FIN") as Label;
                Label lbl_AN_NFE = item.FindControl("lbl_AN_NFE") as Label;
                Label lbl_AF_NFE = item.FindControl("lbl_AF_NFE") as Label;
                Label lbl_AN_AMR = item.FindControl("lbl_AN_AMR") as Label;
                Label lbl_AF_AMR = item.FindControl("lbl_AF_AMR") as Label;
                Label lbl_AN_OTH = item.FindControl("lbl_AN_OTH") as Label;
                Label lbl_AF_OTH = item.FindControl("lbl_AF_OTH") as Label;
                Label lbl_AN = item.FindControl("lbl_AN") as Label;
                Label lbl_AF = item.FindControl("lbl_AF") as Label;
                Label lbl_AN_Female = item.FindControl("lbl_AN_Female") as Label;
                Label lbl_AF_Female = item.FindControl("lbl_AF_Female") as Label;
                Label lbl_AN_Male = item.FindControl("lbl_AN_Male") as Label;
                Label lbl_AF_Male = item.FindControl("lbl_AF_Male") as Label;

                lbl_AN_AFR.Text = JSONObj.AN_AFR.ToString();
                lbl_AF_AFR.Text = JSONObj.AF_AFR.ToString();
                lbl_AN_ASJ.Text = JSONObj.AN_ASJ.ToString();
                lbl_AF_ASJ.Text = JSONObj.AF_ASJ.ToString();
                lbl_AN_EAS.Text = JSONObj.AN_EAS.ToString();
                lbl_AF_EAS.Text = JSONObj.AF_EAS.ToString();
                lbl_AN_FIN.Text = JSONObj.AN_FIN.ToString();
                lbl_AF_FIN.Text = JSONObj.AF_FIN.ToString();
                lbl_AN_NFE.Text = JSONObj.AN_NFE.ToString();
                lbl_AF_NFE.Text = JSONObj.AF_NFE.ToString();
                lbl_AN_AMR.Text = JSONObj.AN_AMR.ToString();
                lbl_AF_AMR.Text = JSONObj.AF_AMR.ToString();
                lbl_AN_OTH.Text = JSONObj.AN_OTH.ToString();
                lbl_AF_OTH.Text = JSONObj.AF_OTH.ToString();
                lbl_AN.Text = JSONObj.AN.ToString();
                lbl_AF.Text = JSONObj.AF.ToString();
                lbl_AN_Female.Text = JSONObj.AN_Female.ToString();
                lbl_AF_Female.Text = JSONObj.AF_Female.ToString();
                lbl_AN_Male.Text = JSONObj.AN_Male.ToString();
                lbl_AF_Male.Text = JSONObj.AF_Male.ToString();


                GridView GrdJSONTranscript = item.FindControl("GrdJSONTranscript") as GridView;
                SqlCommand Cmd = new SqlCommand("Sp_Filter_Result_Variant_Detail_GeneAN_Sel", new SqlConnection(CnnStr));
                Cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                SqlParCol = Cmd.Parameters;
                SqlParCol.Add(new SqlParameter("@TblN", SqlDbType.NVarChar));
                //SqlParCol.Add(new SqlParameter("@SampleID", SqlDbType.VarChar));
                SqlParCol.Add(new SqlParameter("@CHR", SqlDbType.VarChar));
                SqlParCol.Add(new SqlParameter("@START", SqlDbType.NVarChar));
                SqlParCol.Add(new SqlParameter("@END", SqlDbType.NVarChar));
                SqlParCol.Add(new SqlParameter("@REF", SqlDbType.NVarChar));
                SqlParCol.Add(new SqlParameter("@ALT", SqlDbType.NVarChar));
                SqlParCol["@TblN"].Value = Session["TblName"].ToString();
                //SqlParCol["@SampleID"].Value = Session["SampleID_Filter"].ToString();
                SqlParCol["@CHR"].Value = RG_SampleVariant.SelectedValues["chr"].ToString();
                SqlParCol["@START"].Value = RG_SampleVariant.SelectedValues["start_pos"].ToString();
                SqlParCol["@END"].Value = RG_SampleVariant.SelectedValues["stop_pos"].ToString();
                SqlParCol["@REF"].Value = RG_SampleVariant.SelectedValues["ref_all"].ToString();
                SqlParCol["@ALT"].Value = RG_SampleVariant.SelectedValues["alt_all"].ToString();

                SqlDataAdptrCmd.SelectCommand = Cmd;
                DataTable myDataTable = new DataTable();
                try
                {
                    Cmd.Connection.Open();
                    SqlDataAdptrCmd.Fill(myDataTable);
                    if (myDataTable.Rows.Count > 0)
                    {
                        GrdJSONTranscript.DataSource = myDataTable;
                        GrdJSONTranscript.DataBind();
                    }

                }
                catch (Exception ex)
                {
                    string dd = ex.Message;
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Something went wrong!</b>'); height=120,width=250", true);
                    return;
                    // "Unable to read. Reason: " + ex.Message;
                }

            }
        }

        protected void RG_SampleVariant_PreRender(object sender, EventArgs e)
        {
            var con = RG_SampleVariant.MasterTableView.Items.Count;
            if (RG_SampleVariant.MasterTableView.Items.Count > 0 && firstLoadRG)
            {
                RG_SampleVariant.MasterTableView.Items[0].Selected = true;
                RG_SampleVariant_Detail.DataBind();
                firstLoadRG = false;
            }
        }

        public class GnomAD
        {
            //public int AN_ASJ { get; set; }
            //public float AF_ASJ { get; set; }
            //public int AN_AFR { get; set; }
            //public float AF_AFR { get; set; }
            //public int AN_OTH { get; set; }
            //public float AF_OTH { get; set; }
            //public int AN_AMR { get; set; }
            //public float AF_AMR { get; set; }
            //public int AN_FIN { get; set; }
            //public float AF_FIN { get; set; }
            //public int AN_EAS { get; set; }
            //public float AF_EAS { get; set; }
            //public int AN_NFE { get; set; }
            //public float AF_NFE { get; set; }
            //public int AN { get; set; }
            //public float AF { get; set; }
            //public int AN_Female { get; set; }
            //public float AF_Female { get; set; }
            //public int AN_Male { get; set; }
            //public float AF_Male { get; set; }

            private string _AN_ASJ;
            public string AN_ASJ
            {
                get { return (this._AN_ASJ == null ? "NaN" : this._AN_ASJ); }
                set { this._AN_ASJ = (value == null ? "NaN" : value); }
            }
            private string _AF_ASJ;
            public string AF_ASJ
            {
                get { return (this._AF_ASJ == null ? "NaN" : this._AF_ASJ); }
                set { this._AF_ASJ = (value == null ? "NaN" : value); }
            }
            private string _AN_AFR;
            public string AN_AFR
            {
                get { return (this._AN_AFR == null ? "NaN" : this._AN_AFR); }
                set { this._AN_AFR = (value == null ? "NaN" : value); }
            }
            private string _AF_AFR;
            public string AF_AFR
            {
                get { return (this._AF_AFR == null ? "NaN" : this._AF_AFR); }
                set { this._AF_AFR = (value == null ? "NaN" : value); }
            }
            private string _AN_OTH;
            public string AN_OTH
            {
                get { return (this._AN_OTH == null ? "NaN" : this._AN_OTH); }
                set { this._AN_OTH = (value == null ? "NaN" : value); }
            }
            private string _AF_OTH;
            public string AF_OTH
            {
                get { return (this._AF_OTH == null ? "NaN" : this._AF_OTH); }
                set { this._AF_OTH = (value == null ? "NaN" : value); }
            }
            private string _AN_AMR;
            public string AN_AMR
            {
                get { return (this._AN_AMR == null ? "NaN" : this._AN_AMR); }
                set { this._AN_AMR = (value == null ? "NaN" : value); }
            }
            private string _AF_AMR;
            public string AF_AMR
            {
                get { return (this._AF_AMR == null ? "NaN" : this._AF_AMR); }
                set { this._AF_AMR = (value == null ? "NaN" : value); }
            }
            private string _AN_FIN;
            public string AN_FIN
            {
                get { return (this._AN_FIN == null ? "NaN" : this._AN_FIN); }
                set { this._AN_FIN = (value == null ? "NaN" : value); }
            }
            private string _AF_FIN;
            public string AF_FIN
            {
                get { return (this._AF_FIN == null ? "NaN" : this._AF_FIN); }
                set { this._AF_FIN = (value == null ? "NaN" : value); }
            }
            private string _AN_EAS;
            public string AN_EAS
            {
                get { return (this._AN_EAS == null ? "NaN" : this._AN_EAS); }
                set { this._AN_EAS = (value == null ? "NaN" : value); }
            }
            private string _AF_EAS;
            public string AF_EAS
            {
                get { return (this._AF_EAS == null ? "NaN" : this._AF_EAS); }
                set { this._AF_EAS = (value == null ? "NaN" : value); }
            }
            private string _AN_NFE;
            public string AN_NFE
            {
                get { return (this._AN_NFE == null ? "NaN" : this._AN_NFE); }
                set { this._AN_NFE = (value == null ? "NaN" : value); }
            }
            private string _AF_NFE;
            public string AF_NFE
            {
                get { return (this._AF_NFE == null ? "NaN" : this._AF_NFE); }
                set { this._AF_NFE = (value == null ? "NaN" : value); }
            }
            private string _AN;
            public string AN
            {
                get { return (this._AN == null ? "NaN" : this._AN); }
                set { this._AN = (value == null ? "NaN" : value); }
            }
            private string _AF;
            public string AF
            {
                get { return (this._AF == null ? "NaN" : this._AF); }
                set { this._AF = (value == null ? "NaN" : value); }
            }
            private string _AN_Female;
            public string AN_Female
            {
                get { return (this._AN_Female == null ? "NaN" : this._AN_Female); }
                set { this._AN_Female = (value == null ? "NaN" : value); }
            }
            private string _AF_Female;
            public string AF_Female
            {
                get { return (this._AF_Female == null ? "NaN" : this._AF_Female); }
                set { this._AF_Female = (value == null ? "NaN" : value); }
            }
            private string _AN_Male;
            public string AN_Male
            {
                get { return (this._AN_Male == null ? "NaN" : this._AN_Male); }
                set { this._AN_Male = (value == null ? "NaN" : value); }
            }
            private string _AF_Male;
            public string AF_Male
            {
                get { return (this._AF_Male == null ? "NaN" : this._AF_Male); }
                set { this._AF_Male = (value == null ? "NaN" : value); }
            }
            private string _FILTER;
            public string FILTER
            {
                get { return (this._FILTER == null ? "NaN" : this._FILTER); }
                set { this._FILTER = (value == null ? "NaN" : value); }
            }

            //public List<string> WorkoutInfo { get; set; }
        }

        protected void timerRefresh_Tick(object sender, EventArgs e)
        {
            GridBind();
        }

        private void GridBind()
        {
            SqlConnection conn = new SqlConnection(CnnStr);

            SqlCommand Cmd = new SqlCommand("Sp_Filter_Result_SingleSample_Batch_Tracking_Timer_Sel", new SqlConnection(CnnStr));
            Cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = Cmd.Parameters;
            SqlParCol.Add(new SqlParameter("@TblName", SqlDbType.NVarChar));
            SqlParCol["@TblName"].Value = Session["TblName"].ToString();

            SqlDataAdptrCmd.SelectCommand = Cmd;
            DataTable myDataTable = new DataTable();
            try
            {
                Cmd.Connection.Open();
                SqlDataAdptrCmd.Fill(myDataTable);
                if (myDataTable.Rows.Count > 0)
                {
                    RG_SampleVariant.Rebind();
                    timerRefresh.Enabled = false;
                    img_loading.Visible = false;
                    lbl_loading.Visible = false;
                    Panel_lbl_countDown.Visible = false;

                    RG_SampleVariant.MasterTableView.CommandItemSettings.ShowExportToExcelButton = true;
                    RG_SampleVariant.Rebind();
                }
                else
                {
                    if (Convert.ToInt32(Session["ZeroResult"].ToString()) == 1)
                    {
                        timerRefresh.Enabled = false;
                        img_loading.Visible = false;
                        lbl_loading.Visible = false;
                        Panel_lbl_countDown.Visible = false;
                        RG_SampleVariant.MasterTableView.CommandItemSettings.ShowExportToExcelButton = false;
                    }
                    else
                    {
                        RG_SampleVariant.MasterTableView.CommandItemSettings.ShowExportToExcelButton = false;
                        RG_SampleVariant.Rebind();
                    }

                }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Unable to read!</b>'); height=120,width=250", true);
                string msg = ex.Message;

                return;
                // "Unable to read. Reason: " + ex.Message;
            }

        }


        protected void RG_SampleVariant_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;

                Label lbl_alt_cnt = (Label)item.FindControl("lbl_alt_cnt");
                HiddenField hdngeno = (HiddenField)item.FindControl("hdn_geno");
                string geno = hdngeno.Value.ToString();
                Image img_geno = (Image)item.FindControl("img_geno");
                switch (geno)
                {
                    case "0":
                        img_geno.ImageUrl = "/img/zygosity/hom.png";
                        img_geno.ToolTip = "Homorozygous Reference";
                        lbl_alt_cnt.Text = "Homorozygous Reference";
                        break;
                    case "1":
                        img_geno.ImageUrl = "/img/zygosity/het.png";
                        img_geno.ToolTip = "Heterozygous";
                        lbl_alt_cnt.Text = "Heterozygous";
                        break;
                    case "2":
                        img_geno.ImageUrl = "/img/zygosity/hom.png";
                        img_geno.ToolTip = "Homozygous Alternate";
                        lbl_alt_cnt.Text = "Homozygous Alternate";
                        break;
                    default:
                        img_geno.ImageUrl = "/img/zygosity/multi.png";
                        img_geno.ToolTip = "Multi";
                        lbl_alt_cnt.Text = "Multi";
                        break;
                }

                HiddenField hdn_mutationtype = (HiddenField)item.FindControl("hdn_mutationtype");
                string mutation = hdn_mutationtype.Value.ToString();
                Image img_mutationtype = (Image)item.FindControl("img_mutationtype");
                switch (mutation)
                {
                    case "snv":
                        img_mutationtype.ImageUrl = "/img/icon/icon_SNP.png";
                        img_mutationtype.ToolTip = "Single nucleotide variant";
                        break;
                    case "del":
                        img_mutationtype.ImageUrl = "/img/icon/icon_deletion.png";
                        img_mutationtype.ToolTip = "Deletion";
                        break;
                    case "ins":
                        img_mutationtype.ImageUrl = "/img/icon/icon_insertion.png";
                        img_mutationtype.ToolTip = "Insertion";
                        break;
                    case "sub":
                        img_mutationtype.ImageUrl = "/img/icon/icon_others.png";
                        img_mutationtype.ToolTip = "Substitution";
                        break;
                    default:
                        img_mutationtype.ImageUrl = "/img/icon/icon_others.png";
                        img_mutationtype.ToolTip = "Non variant";
                        break;
                }
            }
        }

        #region [ EXCELML FORMAT ]
        protected void RG_SampleVariant_ExcelMLWorkBookCreated(object sender, Telerik.Web.UI.GridExcelBuilder.GridExcelMLWorkBookCreatedEventArgs e)
        {
            foreach (RowElement row in e.WorkBook.Worksheets[0].Table.Rows)
            {
                row.Cells[0].StyleValue = "Style1";
            }

            StyleElement style = new StyleElement("Style1");
            style.InteriorStyle.Pattern = InteriorPatternType.Solid;
            style.InteriorStyle.Color = System.Drawing.Color.LightGray;
            e.WorkBook.Styles.Add(style);
        }
        #endregion

        #region [ Built-in Export button configuration ]
        protected void RG_SampleVariant_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == RadGrid.ExportToExcelCommandName)
            {
                //RG_SampleVariant.Rebind();
                RG_SampleVariant.MasterTableView.CommandItemSettings.ShowExportToExcelButton = true;

                this.RG_SampleVariant.MasterTableView.GetColumn("v_type").Display = true;
                this.RG_SampleVariant.MasterTableView.GetColumn("alt_cnt").Display = true;

                RG_SampleVariant.ExportSettings.Excel.Format = GridExcelExportFormat.Biff;
                RG_SampleVariant.ExportSettings.IgnorePaging = true;
                RG_SampleVariant.ExportSettings.ExportOnlyData = true;
                RG_SampleVariant.ExportSettings.OpenInNewWindow = true;
                RG_SampleVariant.ExportSettings.FileName = Session["TblName"].ToString();
                RG_SampleVariant.MasterTableView.ExportToExcel();
            }
        }
        #endregion

        private double Factorial_Recursion(int number)
        {
            if (number == 1)
                return 1;
            else
                return number * Factorial_Recursion(number - 1);
        }

        protected void btnShowStats_Click(object sender, EventArgs e)
        {
            foreach (GridDataItem item in RG_SampleVariant_Detail.MasterTableView.Items)
            {
                RadPageView rpv = item.FindControl("RadPageView5") as RadPageView;

                Label lbl_VP = rpv.FindControl("lbl_VP") as Label;
                lbl_VP.Text = HF_VarPhen.Value;
                Label lbl_NVP = rpv.FindControl("lbl_NVP") as Label;
                lbl_NVP.Text = HF_NoVarPhen.Value;
                Label lbl_VNP = rpv.FindControl("lbl_VNP") as Label;
                lbl_VNP.Text = HF_VarNoPhen.Value;
                Label lbl_NVNP = rpv.FindControl("lbl_NVNP") as Label;
                lbl_NVNP.Text = HF_NoVarNoPhen.Value;

                Label lbl_StatTitle = rpv.FindControl("lbl_StatTitle") as Label;
                lbl_StatTitle.Text = Session["StatTitle"].ToString();

                AddNewAjaxSetting(btnShowStats.ID, btnShowStats.ID);
                AddNewAjaxSetting(btnShowStats.ID, RG_SampleVariant_Detail.ID);
                AddNewAjaxSetting(btnShowStats.ID, lbl_StatTitle.ID);

                RadMultiPage RadMultiPage_DataHolder = (RadMultiPage)item.FindControl("RadMultiPage_DataHolder");
                RadMultiPage_DataHolder.SelectedIndex = 3; // Statistic tab

                double pValue;
                var matrix = new ConfusionMatrix(new int[,]
                {
                                /*                                Variant                            No-variant  */
                                /* Phenotype    */  {   Convert.ToInt32(HF_VarPhen.Value), Convert.ToInt32(HF_NoVarPhen.Value) },
                                /* No-phenotype */  {   Convert.ToInt32(HF_VarNoPhen.Value), Convert.ToInt32(HF_NoVarNoPhen.Value) },
                });


                // totals match:
                int[] rowTotals = matrix.RowTotals;
                int[] colTotals = matrix.ColumnTotals;
                int total = matrix.NumberOfSamples;


                ////if (Convert.ToInt32(HF_VarPhen.Value) == 0 || Convert.ToInt32(HF_NoVarPhen.Value) == 0 ||
                ////    Convert.ToInt32(HF_VarNoPhen.Value) == 0 || Convert.ToInt32(HF_NoVarNoPhen.Value) == 0)
                ////{
                ////    pValue = 0;
                ////}
                ////else
                ////{
                //    //pValue =
                //    //    (Factorial_Recursion(rowTotals[0]) * Factorial_Recursion(rowTotals[1]) *
                //    //    Factorial_Recursion(colTotals[0]) * Factorial_Recursion(colTotals[1])) /
                //    //    (Factorial_Recursion(Convert.ToInt32(HF_VarPhen.Value)) * Factorial_Recursion(Convert.ToInt32(HF_NoVarPhen.Value)) *
                //    //    Factorial_Recursion(Convert.ToInt32(HF_VarNoPhen.Value)) * Factorial_Recursion(Convert.ToInt32(HF_NoVarNoPhen.Value)) * Factorial_Recursion(total));


                //    FisherTest FTest = new FisherTest(matrix);
                //    pValue = FTest.PValueToReturn;
                ////}


                Label lbl_TotalVar = rpv.FindControl("lbl_TotalVar") as Label;
                lbl_TotalVar.Text = colTotals[0].ToString();
                Label lbl_TotalNoVar = rpv.FindControl("lbl_TotalNoVar") as Label;
                lbl_TotalNoVar.Text = colTotals[1].ToString();
                Label lbl_TotalPhen = rpv.FindControl("lbl_TotalPhen") as Label;
                lbl_TotalPhen.Text = rowTotals[0].ToString();
                Label lbl_TotalNoPhen = rpv.FindControl("lbl_TotalNoPhen") as Label;
                lbl_TotalNoPhen.Text = rowTotals[1].ToString();
                Label lbl_Total = rpv.FindControl("lbl_Total") as Label;
                lbl_Total.Text = total.ToString() + " (Grand Total)";


                String connstring = CnnStr;
                SqlConnection conn = new SqlConnection(connstring);
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlCommand cmd = new SqlCommand("Sp_Filter_Result_Stats_FisherTest_PValue_Sel", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@VariantPhenotype", SqlDbType.Int);
                cmd.Parameters.Add("@NoVariantPhenotype", SqlDbType.Int);
                cmd.Parameters.Add("@VariantNoPhenotype", SqlDbType.Int);
                cmd.Parameters.Add("@NoVariantNoPhenotype", SqlDbType.Int);

               
                cmd.Parameters["@VariantPhenotype"].Value = Convert.ToInt32(HF_VarPhen.Value);
                cmd.Parameters["@NoVariantPhenotype"].Value = Convert.ToInt32(HF_NoVarPhen.Value);
                cmd.Parameters["@VariantNoPhenotype"].Value = Convert.ToInt32(HF_VarNoPhen.Value);
                cmd.Parameters["@NoVariantNoPhenotype"].Value = Convert.ToInt32(HF_NoVarNoPhen.Value);

                SqlDataAdptrCmd.SelectCommand = cmd;
                DataTable myDataTable = new DataTable();

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    SqlDataAdptrCmd.Fill(myDataTable);
                    pValue = Convert.ToDouble(myDataTable.Rows[0]["PValue"]);

                    Label lbl_FisherStats = rpv.FindControl("lbl_FisherStats") as Label;
                    lbl_FisherStats.Text = "Excact probability: " + pValue.ToString();
                }
                catch (SqlException ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Something went wrong! </b>'); height=120,width=250", true);

                }

            }
        }

        protected void AddNewAjaxSetting(string AjaxControlId, string AjaxUpdControlId)
        {
            AjaxSetting ajaxSetting = new AjaxSetting();
            ajaxSetting.AjaxControlID = AjaxControlId;

            AjaxUpdatedControl updatedControl = new AjaxUpdatedControl();
            updatedControl.ControlID = AjaxUpdControlId;
            updatedControl.LoadingPanelID = "RadAjaxLoadingPanel1";
            updatedControl.UpdatePanelHeight = Unit.Pixel(200);
            updatedControl.UpdatePanelRenderMode = UpdatePanelRenderMode.Inline;

            ajaxSetting.UpdatedControls.Add(updatedControl);

            RadAjaxManager1.AjaxSettings.Add(ajaxSetting);
        }

    }
}