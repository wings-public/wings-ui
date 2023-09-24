using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.GAP.CS.uc
{
    public partial class uc_CSVariant_Filter : System.Web.UI.UserControl
    {
       

            #region "CnnStr"{
            static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
            #endregion}

            bool _firstChild;
            public bool getFirstChild()
            { return this._firstChild; }
            public void setFirstChild(bool value)
            { this._firstChild = value; }

            List<Tuple<int, string>> listOfCond = new List<Tuple<int, string>>();

            List<FilterItem> filterItemList = new List<FilterItem>();
            List<string> paramACMGList = new List<string>(new string[] { "PRIOR_TRANSCRIPT", "IS_CANONICAL", "PHENOTYPE", "MEDGEN_CUI", "FINAL_CLASSIFICATION", "SCORE_OF_PATHOGENICITY", "FLAG", "NOTE", "PVS1", "PS1",
      "PS2" ,"PS3" ,"PS4" ,"PM1" ,"PM2" ,"PM3" ,"PM4" ,"PM5" ,"PM6" ,"PP1" ,"PP2" ,"PP3" ,"PP4" ,"PP5" ,"BA1" ,"BS1" ,"BS2" ,"BS3" ,"BS4" ,"BP1" ,"BP2" ,"BP3" ,"BP4" ,"BP5" ,"BP6" ,"BP7" ,"BP8" });

            protected int SelectedConditionValue
            {
                get
                {
                    var value = ViewState["selectedConditionValue"];
                    return null != value ? (int)value : 0;
                }
                set
                {
                    ViewState["selectedConditionValue"] = value;
                }
            }
            protected string PathogenScoreValue
            {
                get
                {
                    var value = ViewState["PathogenScoreValue"];
                    return null != value ? (string)value : null;
                }
                set
                { ViewState["PathogenScoreValue"] = value; }
            }

            protected override void OnInit(EventArgs e)
            {
                base.OnInit(e);
            RLB_Condition.DataBind();
            RLB_Sample_Condition.DataBind();
            }

            protected void Page_Load(object sender, EventArgs e)
            {

            if (!IsPostBack)
            {
                //Session["FilterID_Filter"] = "23";
                RDDL_Parent.Items.Add(new DropDownListItem
                {
                    Value = "0",
                    Text = "0"
                });

                SelectedConditionValue = 0;

                RS_Ticks_Pathogen_Score.DataSource = GetScorePathogen();
                RS_Ticks_Pathogen_Score.DataBind();

                DirectoryInfo imgDirPathogen = new DirectoryInfo(Server.MapPath("/img/clinvar/"));
                foreach (FileInfo file in imgDirPathogen.GetFiles("*.png"))
                {
                    RadComboBoxItem item = new RadComboBoxItem(file.Name.Replace(".png", ""));
                    item.ImageUrl = "/img/clinvar/" + file.Name;
                    RCB_Pathogen.Items.Add(item);
                }

                DirectoryInfo imgDirZygosity = new DirectoryInfo(Server.MapPath("/img/zygosity/"));
                foreach (FileInfo file in imgDirZygosity.GetFiles("*.png"))
                {
                    RadComboBoxItem item = new RadComboBoxItem(file.Name.Replace(".png", ""));
                    item.ImageUrl = "/img/zygosity/" + file.Name;
                    RCB_Zygosity.Items.Add(item);
                }

               leftTabDiv.Visible = false;
                rightTabDiv.Visible = false;

                if (Session["FilterID_Filter"] != null)
                {
                    RDD_FilterSet.DataBind();
                    RDD_FilterSet.SelectedValue = Session["FilterID_Filter"].ToString();
                    RDD_FilterSet_SelectedIndexChanged(sender, e);
                }

                if (Session["InWhichOneExists"].Equals(0))
                {
                    lbl_FemaleID.Visible = false;
                    img_Female.Visible = false;
                }
                else
                    lbl_FemaleID.Text = Session["CS_FemaleID"].ToString();

                if (Session["InWhichOneExists"].Equals(1))
                {
                    lbl_MaleID.Visible = false;
                    img_Male.Visible = false;
                }
                else
                    lbl_MaleID.Text = Session["CS_MaleID"].ToString();

                lbl_AnalysisID.Text = Session["CarrierScreeningID_Filter"].ToString();

            }


            //if (Session["PreCondition_Filter"].ToString().Equals("0"))
            //    {
            //        lbl_PreCondition.Visible = false;
            //        img_Precondition.Visible = false;
            //    }
            //    else
            //    {
            //        lbl_PreCondition.Text = Session["PreCondition_Filter"].ToString();
            //        img_Precondition.Src = "../../../img/icon/icon_" + lbl_PreCondition.Text + ".png";
            //    }



            RLB_Filter.Style.Add("font-size", "12px");
            RLB_Filter.Header.Style.Add("font-size", "14px");

        }


        private void Fetch_Count_Of_Data(string session, Label lbl)
        {
            if (!getFirstChild() && (Session["FilterID_Filter"].ToString() != ""))
            {
                setFirstChild(true);
                String connstring = CnnStr;
                SqlConnection conn = new SqlConnection(connstring);
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();

                SqlCommand cmd = new SqlCommand("Sp_GAP_CS_Add_First_Item_To_FilterItems", conn);
                cmd.CommandType = CommandType.StoredProcedure;


                cmd.Parameters.Add("@InputType", SqlDbType.Int);
                cmd.Parameters.Add("@SampleID", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@FilterID", SqlDbType.Int);
                cmd.Parameters.Add("@Counte", SqlDbType.Int);

                cmd.Parameters["@InputType"].Value = Session["InWhichOneExists"];  
                cmd.Parameters["@SampleID"].Value = Session["SampleID_Filter"];
                cmd.Parameters["@FilterID"].Value = Convert.ToInt32(Session["FilterID_Filter"]);
                cmd.Parameters["@Counte"].Direction = ParameterDirection.Output;

                SqlDataAdptrCmd.SelectCommand = cmd;

                DataTable myDataTable = new DataTable();

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    SqlDataAdptrCmd.Fill(myDataTable);
                    lbl.Text = " (items: " + cmd.Parameters["@Counte"].Value.ToString() + ")";
                    hdf_rootCount.Value = " (items: " + cmd.Parameters["@Counte"].Value.ToString() + ")";

                }
                finally
                {
                    conn.Close();
                }
            }
        }

        protected void RBAdd_Click(object sender, EventArgs e)
        {

            if (RLB_Filter.Items.Count.Equals(1) && RLB_Filter.Items[0].Value == "00")
            {
                RLB_Filter.Items.Remove(RLB_Filter.Items[0]);
                RLB_Filter.Items.Clear();
            }

            RBAddSelectedItem.Enabled = true;

            string btn_value = ((RadButton)sender).Value;

            switch (btn_value)
            {
                case "acmg":
                    string checkedCheckBoxes_acmg = Request.Form[btn_value];
                    //  string checked_box_acmg = hdnSelectedacmg.Value;
                    if (string.IsNullOrEmpty(RCB_Acmg.Text) || string.IsNullOrEmpty(checkedCheckBoxes_acmg))
                    {
                        RCB_Acmg.Focus();
                        //      RCB_Acmg.Style.Add("border", "1px solid #999 !important");
                        //      RCB_Acmg.Style.Add("border-radius", "4px");

                        lbl_err.Text = "* Select the criteria";
                    }
                    else
                    {
                        string ssss = RCB_Acmg.SelectedValue + "='" + checkedCheckBoxes_acmg + "'";
                        RLB_Filter.Items.Add(new RadListBoxItem
                        {
                            Value = RCB_Acmg.SelectedValue.ToString() + "='" + checkedCheckBoxes_acmg + "'",
                            Text = RCB_Acmg.SelectedItem.Text + " = " + checkedCheckBoxes_acmg
                        });
                    }

                    break;
                case "alleleFreq":
                    if (!string.IsNullOrEmpty(fromAFreq.Text) && !string.IsNullOrEmpty(toAFreq.Text))
                    {
                        RLB_Filter.Items.Add(new RadListBoxItem
                        {
                            Value = fromAFreq.Text + "<= " + RCB_Freq.SelectedValue + " =>" + toAFreq.Text,
                            Text = fromAFreq.Text + "<= " + RCB_Freq.SelectedItem.Text + " =>" + toAFreq.Text
                        });
                        lbl_err_freq.Text = null;
                    }
                    else if (!String.IsNullOrEmpty(fromAFreq.Text) && String.IsNullOrEmpty(toAFreq.Text))
                    {
                        RLB_Filter.Items.Add(new RadListBoxItem
                        {
                            Value = fromAFreq.Text + "<= " + RCB_Freq.SelectedValue,
                            Text = fromAFreq.Text + "<= " + RCB_Freq.SelectedItem.Text
                        });
                        lbl_err_freq.Text = null;
                    }
                    else if (String.IsNullOrEmpty(fromAFreq.Text) && !String.IsNullOrEmpty(toAFreq.Text))
                    {
                        RLB_Filter.Items.Add(new RadListBoxItem
                        {
                            Value = RCB_Freq.SelectedValue + " =>" + toAFreq.Text,
                            Text = RCB_Freq.SelectedItem.Text + " =>" + toAFreq.Text
                        });
                        lbl_err_freq.Text = null;
                    }
                    else
                    {
                        fromAFreq.Focus();
                        toAFreq.Focus();
                        lbl_err_freq.Text = "* Insert the criteria";
                    }
                    break;
                case "scores":
                    if (!string.IsNullOrEmpty(RCB_Scores.SelectedValue))
                    {
                        double SF, ST;

                        if (!String.IsNullOrEmpty(siftSFrom.Text))
                            SF = Convert.ToDouble(siftSFrom.Text);
                        else
                            SF = -1;
                        if (!String.IsNullOrEmpty(siftSTo.Text))
                            ST = Convert.ToDouble(siftSTo.Text);
                        else
                            ST = -1;

                        if (!String.IsNullOrEmpty(siftSFrom.Text) && !String.IsNullOrEmpty(siftSTo.Text) && (SF > ST))
                        {
                            siftSFrom.Focus();
                            lbl_err_score.Text = "* The first score should be smaller than second score.";
                            lbl_err_papi.Text = null;
                        }
                        else
                        {
                            if (!String.IsNullOrEmpty(siftSFrom.Text) && !String.IsNullOrEmpty(siftSTo.Text))
                            {
                                lbl_err_papi.Text = null;
                                lbl_err_score.Text = null;

                                RLB_Filter.Items.Add(new RadListBoxItem
                                {
                                    Value = siftSFrom.Text + "<= " + RCB_Scores.SelectedValue + " =>" + siftSTo.Text,
                                    Text = siftSFrom.Text + "<= " + RCB_Scores.SelectedItem.Text + " =>" + siftSTo.Text
                                });
                            }
                            else if (!String.IsNullOrEmpty(siftSFrom.Text) && String.IsNullOrEmpty(siftSTo.Text))
                            {
                                lbl_err_papi.Text = null;
                                lbl_err_score.Text = null;
                                RLB_Filter.Items.Add(new RadListBoxItem
                                {
                                    Value = siftSFrom.Text + "<= " + RCB_Scores.SelectedValue,
                                    Text = siftSFrom.Text + "<= " + RCB_Scores.SelectedItem.Text
                                });
                            }
                            else if (String.IsNullOrEmpty(siftSFrom.Text) && !String.IsNullOrEmpty(siftSTo.Text))
                            {
                                lbl_err_papi.Text = null;
                                lbl_err_score.Text = null;
                                RLB_Filter.Items.Add(new RadListBoxItem
                                {
                                    Value = RCB_Scores.SelectedValue + " =>" + siftSTo.Text,
                                    Text = RCB_Scores.SelectedItem.Text + " =>" + siftSTo.Text
                                });
                            }
                            else
                            {
                                siftSFrom.Focus();
                                siftSTo.Focus();
                                lbl_err_score.Text = "* Insert the criteria";
                                lbl_err_papi.Text = null;
                            }
                        }
                    }
                    else
                    {
                        lbl_err_score.Text = "* Select the criteria";
                        lbl_err_papi.Text = null;
                    }
                    break;

                case "Papipred":
                    string checkedCheckBoxes_papipred = Request.Form[btn_value];
                    string checked_box_papipred = hdnSelectedPapipred.Value;
                    if (!string.IsNullOrEmpty(checked_box_papipred))
                    {
                        lbl_err_score.Text = null;
                        lbl_err_papi.Text = null;

                        RLB_Filter.Items.Add(new RadListBoxItem
                        {
                            Value = "PaPI_pred='" + checked_box_papipred + "'",
                            Text = "PaPI_pred = " + checked_box_papipred
                        });
                    }
                    else
                    {
                        lbl_err_score.Text = null;
                        lbl_err_papi.Text = "* Select the criteria";
                    }
                    break;
                case "OtherPred":
                    string checkedCheckBoxes_otherPred = Request.Form[btn_value];
                    //  string checked_box_otherPred = hdnSelectedOtherPred.Value;
                    if (!string.IsNullOrEmpty(checkedCheckBoxes_otherPred))
                    {
                        lbl_err_score.Text = null;
                        lbl_err_papi.Text = null;
                        lbl_err_otherpapi.Text = null;
                        RLB_Filter.Items.Add(new RadListBoxItem
                        {
                            Value = RCB_otherPred.SelectedValue + "='" + checkedCheckBoxes_otherPred + "'",
                            Text = RCB_otherPred.SelectedItem.Text + " = " + checkedCheckBoxes_otherPred
                        });
                    }
                    else
                    {
                        lbl_err_score.Text = null;
                        lbl_err_papi.Text = null;
                        lbl_err_otherpapi.Text = "* Select the criteria";
                    }
                    break;
                case "clinvar":

                    if (!string.IsNullOrEmpty(RCB_Clinvar.SelectedValue))
                    {
                        lbl_err_clinvar.Text = null;
                        RLB_Filter.Items.Add(new RadListBoxItem
                        {
                            Value = "ClinVar_clinical_significance LIKE '%" + RCB_Clinvar.SelectedValue + "%'",
                            Text = "Clinvar=" + RCB_Clinvar.SelectedItem.Text
                        });
                    }
                    else
                    {
                        RCB_Clinvar.Focus();
                        lbl_err_clinvar.Text = "* Select the criteria";
                    }
                    break;


                case "ChrPos":
                    if (string.IsNullOrEmpty(chrom.Text))
                    {
                        chrom.Focus();
                        lbl_err_chr.Text = "* Insert the criteria";
                    }
                    else
                    {
                        lbl_err_chr.Text = null;
                        string values = "";

                        if (!string.IsNullOrEmpty(chrom.Text) && (!string.IsNullOrEmpty(Epos.Text) || !string.IsNullOrEmpty(Spos.Text)))
                            values += "CHR = '" + chrom.Text + "' and ";
                        else if (!string.IsNullOrEmpty(chrom.Text) && string.IsNullOrEmpty(Epos.Text) && string.IsNullOrEmpty(Spos.Text))
                            values += "CHR = '" + chrom.Text + "'";

                        if ((!string.IsNullOrEmpty(Spos.Text)) && (string.IsNullOrEmpty(Epos.Text)))
                            values += " [START] <= " + Spos.Text + " and [END] >= " + Spos.Text;
                        else if ((!string.IsNullOrEmpty(Epos.Text)) && (!string.IsNullOrEmpty(Spos.Text)))
                            values += " [START] <= " + Spos.Text + " and [END] >= " + Epos.Text;
                        else if ((!string.IsNullOrEmpty(Epos.Text)) && (string.IsNullOrEmpty(Spos.Text)))
                            values += " [START] <= " + Epos.Text + " and [END] >= " + Epos.Text;

                        RLB_Filter.Items.Add(new RadListBoxItem
                        {
                            Value = values,
                            Text = values.Replace("\'", string.Empty).Trim()
                        });
                    }
                    break;

                case "pathogenClass":

                    if (RCB_Pathogen.SelectedIndex > -1)
                    {
                        lbl_err_phatogen.Text = null;
                        RLB_Filter.Items.Add(new RadListBoxItem
                        {
                            Value = "FINAL_CLASSIFICATION='" + RCB_Pathogen.SelectedItem.Text + "'",
                            Text = "Phatogenic=" + RCB_Pathogen.SelectedItem.Text
                        });
                    }
                    else
                    {
                        RCB_Pathogen.Focus();
                        lbl_err_phatogen.Text = "* Select the criteria";
                    }

                    break;

                case "pathogen":
                    if (!string.IsNullOrEmpty(PathogenScoreValue))
                    {
                        lbl_err_phatogen_score.Text = null;

                        RLB_Filter.Items.Add(new RadListBoxItem
                        {
                            Value = "SCORE_OF_PATHOGENICITY='" + RS_Ticks_Pathogen_Score.SelectedItem.Value + "'",
                            Text = "Phatogenic score = " + RS_Ticks_Pathogen_Score.SelectedItem.Value
                        });
                        PathogenScoreValue = null;
                    }

                    else
                    {
                        PathogenScoreValue = null;
                        lbl_err_phatogen_score.Text = "* Select the criteria";
                    }

                    break;
                case "zygosity":

                    if (RCB_Zygosity.SelectedIndex > -1)
                    {
                        lbl_err_zygo.Text = null;
                        RLB_Filter.Items.Add(new RadListBoxItem
                        {
                            Value = "GENO='" + RCB_Zygosity.SelectedItem.Text + "'",
                            Text = "Zygosity=" + RCB_Zygosity.SelectedItem.Text
                        });
                    }
                    else
                    {
                        RCB_Zygosity.Focus();
                        lbl_err_zygo.Text = "* Select the criteria";
                    }

                    break;
                case "func":

                    if (!string.IsNullOrEmpty(RCB_Effect.Text))
                    {
                        lbl_err_effect.Text = null;

                        string effect_values = "";
                        for (int i = 0; i < RCB_Effect.CheckedItems.Count; i++)
                        {
                            if (RCB_Effect.CheckedItems.Count == 1)
                                effect_values = "'" + RCB_Effect.CheckedItems[i].Value + "'";
                            else if (RCB_Effect.CheckedItems.Count == (i + 1))
                                effect_values += "'" + RCB_Effect.CheckedItems[i].Value + "'";
                            else
                                effect_values += "'" + RCB_Effect.CheckedItems[i].Value + "'" + ",";
                        }

                        RLB_Filter.Items.Add(new RadListBoxItem
                        {
                            Value = "Effect IN (" + effect_values + ")",
                            Text = "Effect = " + effect_values.Replace("\'", string.Empty).Trim()
                        });

                    }
                    else
                    {
                        RCB_Effect.Focus();
                        lbl_err_effect.Text = "* Select the effect";
                    }
                break;
                case "geneList":
                    if (!string.IsNullOrEmpty(RACB_Gene.Text))
                    {
                        lbl_err_gene.Text = null;
                        string geneList_values = "";
                        bool valid_data = false;
                        for (int i = 0; i < RACB_Gene.Entries.Count; i++)
                        {
                            if (!string.IsNullOrEmpty(RACB_Gene.Entries[i].Value))
                            {
                                valid_data = true;
                                if (RACB_Gene.Entries.Count == 1)
                                    geneList_values = "'" + RACB_Gene.Entries[i].Value + "'";
                                else if (RACB_Gene.Entries.Count == (i + 1))
                                    geneList_values += "'" + RACB_Gene.Entries[i].Value + "'";
                                else
                                    geneList_values += "'" + RACB_Gene.Entries[i].Value + "'" + ",";
                            }
                            else
                            {
                                valid_data = false;
                                RACB_Gene.Focus();
                                lbl_err_gene.Text = "* Select the correct data";
                            }
                        }

                        if (valid_data)
                        {
                            RLB_Filter.Items.Add(new RadListBoxItem
                            {
                                Value = "Gene IN (" + geneList_values + ")",
                                Text = "Gene = " + geneList_values.Replace("\'", string.Empty).Trim()
                            });
                        }

                    }
                    else
                    {
                        RACB_Gene.Focus();
                        lbl_err_gene.Text = "* Select the criteria";
                    }
                break;

                case "uPanelList":
                    if (!string.IsNullOrEmpty(RCB_UPanel.SelectedItem.Value))
                    {
                        string uPanel_genes_values = "";
                        try
                        {
                            String connstring = CnnStr;
                            SqlConnection conn = new SqlConnection(connstring);
                            SqlDataAdapter SqlDataAdpt = new SqlDataAdapter();
                            SqlCommand cmdRslt = new SqlCommand("Sp_GAP_Filter_UPanel_Gene_List", conn);
                            cmdRslt.CommandType = CommandType.StoredProcedure;
                            cmdRslt.Parameters.Add(new SqlParameter("@UPID", RCB_UPanel.SelectedItem.Value.ToString()));
                            SqlDataAdpt.SelectCommand = cmdRslt;
                            DataTable myDataTableRslt = new DataTable();

                            SqlDataAdpt.Fill(myDataTableRslt);
                            if (myDataTableRslt.Rows.Count > 0)
                            {
                                for (int i = 0; i < myDataTableRslt.Rows.Count; i++)
                                {
                                    if (myDataTableRslt.Rows.Count == 1)
                                        uPanel_genes_values = "'" + myDataTableRslt.Rows[i]["GeneName"] + "'";
                                    else if (myDataTableRslt.Rows.Count == (i + 1))
                                        uPanel_genes_values += "'" + myDataTableRslt.Rows[i]["GeneName"] + "'";
                                    else
                                        uPanel_genes_values += "'" + myDataTableRslt.Rows[i]["GeneName"] + "'" + ",";
                                }

                                RLB_Filter.Items.Add(new RadListBoxItem
                                {
                                    Value = "Gene IN (" + uPanel_genes_values + ")",
                                    //Text = "Gene = " + uPanel_genes_values.Replace("\'", string.Empty).Trim()
                                    Text = "User panel = " + RCB_UPanel.SelectedItem.Text

                                });

                            }
                        }
                        catch (SqlException ex)
                        {
                            string msg = "Get Result Error:";
                            msg += ex.Message;
                        }
                    }
                    else
                    {
                        RCB_UPanel.Focus();
                        //lbl_err_gene.Text = "* Select the criteria";
                    }
                    break;
                case "filterStats":
                    string checkedCheckBoxes_filterStat = Request.Form[btn_value];
                    string checked_box_filterStat = hdnSelectedfilterStat.Value;
                    if (!string.IsNullOrEmpty(checked_box_filterStat))
                    {
                        RLB_Filter.Items.Add(new RadListBoxItem
                        {
                            Value = "Filter ='" + checked_box_filterStat + "'",
                            Text = "Filter = " + checked_box_filterStat.Replace("\'", string.Empty).Trim()
                        });
                    }
                    break;
                case "mutationType":
                    string checkedCheckBoxes_mutationType = Request.Form[btn_value];
                    string checked_box_mutationType = hdnSelectedMutationType.Value;
                    if (!string.IsNullOrEmpty(checked_box_mutationType))
                    {
                        if (checked_box_mutationType == "snp")
                        {
                            RLB_Filter.Items.Add(new RadListBoxItem
                            {
                                Value = " len(Ref) = 1 and len(alt) = 1 ",
                                Text = "Mutation Type = " + checked_box_mutationType.Replace("\'", string.Empty).Trim()
                            });
                        }
                        if (checked_box_mutationType == "deletion")
                        {
                            RLB_Filter.Items.Add(new RadListBoxItem
                            {
                                Value = " len(ref) <> 1 and alt = " + "'-'",
                                Text = "Mutation Type = " + checked_box_mutationType.Replace("\'", string.Empty).Trim()
                            });
                        }
                        if (checked_box_mutationType == "insertion")
                        {
                            RLB_Filter.Items.Add(new RadListBoxItem
                            {
                                Value = " len(alt) <> 1 and ref = " + "'-'",
                                Text = "Mutation Type = " + checked_box_mutationType.Replace("\'", string.Empty).Trim()
                            });
                        }
                    }
                    break;

                case "filterAllele":
                    if (!String.IsNullOrEmpty(filterAFrom.Text) && !String.IsNullOrEmpty(filterATo.Text))
                    {
                        lbl_err_allele.Text = null;
                        RLB_Filter.Items.Add(new RadListBoxItem
                        {
                            Value = filterAFrom.Text + "<= " + RCB_filterAllele.SelectedValue + " =>" + filterATo.Text,
                            Text = filterAFrom.Text + "<= " + RCB_filterAllele.SelectedItem.Text + " =>" + filterATo.Text
                        });
                    }
                    else if (!String.IsNullOrEmpty(filterAFrom.Text) && String.IsNullOrEmpty(filterATo.Text))
                    {
                        lbl_err_allele.Text = null;
                        RLB_Filter.Items.Add(new RadListBoxItem
                        {
                            Value = filterAFrom.Text + "<= " + RCB_filterAllele.SelectedValue,
                            Text = filterAFrom.Text + "<= " + RCB_filterAllele.SelectedItem.Text
                        });
                    }
                    else if (String.IsNullOrEmpty(filterAFrom.Text) && !String.IsNullOrEmpty(filterATo.Text))
                    {
                        lbl_err_allele.Text = null;
                        RLB_Filter.Items.Add(new RadListBoxItem
                        {
                            Value = RCB_filterAllele.SelectedValue + " =>" + filterATo.Text,
                            Text = RCB_filterAllele.SelectedItem.Text + " =>" + filterATo.Text
                        });
                    }
                    else
                    {
                        filterAFrom.Focus();
                        filterATo.Focus();
                        lbl_err_allele.Text = "* Insert the criteria";
                    }
                    break;

                case "inheritance":
                    if (!string.IsNullOrEmpty(RCB_Inheritance.SelectedValue))
                    {
                        lbl_err_inhrt.Text = null;
                        RLB_Filter.Items.Add(new RadListBoxItem
                        {
                            Value = "Inheritance LIKE '%" + RCB_Inheritance.SelectedValue + "%'  COLLATE SQL_Latin1_General_Cp1_CS_AS",
                            Text = "Inheritance=" + RCB_Inheritance.SelectedItem.Text
                        });
                    }
                    else
                    {
                        RCB_Inheritance.Focus();
                        lbl_err_inhrt.Text = "* Select the criteria";
                    }
                    break;
                case "phenotype":
                    if (!string.IsNullOrEmpty(RACB_Phenotype.Text))
                    {
                        lbl_err_hpo.Text = null;
                        lbl_err_phen.Text = null;
                        string phenotypeList_values = "";
                        for (int i = 0; i < RACB_Phenotype.Entries.Count; i++)
                        {
                            if (RACB_Phenotype.Entries.Count == 1)
                                phenotypeList_values = "'" + RACB_Phenotype.Entries[i].Value + "'";
                            else if (RACB_Phenotype.Entries.Count == (i + 1))
                                phenotypeList_values += "'" + RACB_Phenotype.Entries[i].Value + "'";
                            else
                                phenotypeList_values += "'" + RACB_Phenotype.Entries[i].Value + "'" + ",";
                        }

                        RLB_Filter.Items.Add(new RadListBoxItem
                        {
                            Value = "PHENOTYPE IN (" + phenotypeList_values + ")",
                            Text = "Phenotype = " + phenotypeList_values.Replace("\'", string.Empty).Trim().ToString()
                        });
                    }
                    else
                    {
                        RACB_Phenotype.Focus();
                        lbl_err_hpo.Text = null;
                        lbl_err_phen.Text = "* Select the criteria";
                    }
                    break;
                //case "geneCount":
                //    foreach (RadDataFormItem item in RAF_PhenotypeCount.Items)
                //    {
                //        CheckBox chkbox = (CheckBox)item.FindControl("selectGeneCount");
                //        Label lbl_GeneCount = (Label)item.FindControl("lbl_GeneCount");

                //        if (chkbox.Checked)
                //        {
                //            RLB_Filter.Items.Add(new RadListBoxItem
                //            {
                //                Value = "selectGeneCount",
                //                Text = lbl_GeneCount.Text + " genes from patient phenotype"
                //            });

                //        }
                //    }

                //    break;
                case "hpo":
                    if (RLB_SelectedHPO.Items.Count > 0)
                    {
                        lbl_err_hpo.Text = null;
                        lbl_err_phen.Text = null;
                        string HPOIdList_values = "";
                        for (int i = 0; i < RLB_SelectedHPO.Items.Count; i++)
                        {
                            if (RLB_SelectedHPO.Items.Count == 1)
                                HPOIdList_values = "'" + RLB_SelectedHPO.Items[i].Value + "'";
                            else if (RLB_SelectedHPO.Items.Count == (i + 1))
                                HPOIdList_values += "'" + RLB_SelectedHPO.Items[i].Value + "'";
                            else
                                HPOIdList_values += "'" + RLB_SelectedHPO.Items[i].Value + "'" + ",";
                        }

                        RLB_Filter.Items.Add(new RadListBoxItem
                        {
                            Value = "HPOID IN (" + HPOIdList_values + ")",
                            Text = "HPOID = " + HPOIdList_values.Replace("\'", string.Empty).Trim().ToString()
                        });
                    }
                    else
                    {
                        RLB_SelectedHPO.Focus();
                        lbl_err_phen.Text = null;
                        lbl_err_hpo.Text = "* Select the criteria";
                    }
                    break;
                //case "HPOCount":
                //    foreach (RadDataFormItem item in RAF_HPOPhenotypeCount.Items)
                //    {
                //        CheckBox chkbox = (CheckBox)item.FindControl("selectHPOCount");
                //        Label lbl_HPOCount = (Label)item.FindControl("lbl_HPOCount");

                //        if (chkbox.Checked)
                //        {
                //            RLB_Filter.Items.Add(new RadListBoxItem
                //            {
                //                Value = "selectHPOCount",
                //                Text = lbl_HPOCount.Text + " HPOs from patient phenotype"
                //            });

                //        }
                //    }

                //    break;
                case "genePanelList":
                    if (RLB_SelectedPanelList.Items.Count > 0)
                    {
                        string PanelID_values = "";
                        string PanelName_values = "";
                        lbl_err_panel.Text = null;

                        for (int i = 0; i < RLB_SelectedPanelList.Items.Count; i++)
                        {
                            if (RLB_SelectedPanelList.Items.Count == 1)
                            {
                                PanelID_values = "'" + RLB_SelectedPanelList.Items[i].Value + "'";
                                PanelName_values = "'" + RLB_SelectedPanelList.Items[i].Text + "'";
                            }
                            else if (RLB_SelectedPanelList.Items.Count == (i + 1))
                            {
                                PanelID_values += "'" + RLB_SelectedPanelList.Items[i].Value + "'";
                                PanelName_values += "'" + RLB_SelectedPanelList.Items[i].Text + "'";
                            }
                            else
                            {
                                PanelID_values += "'" + RLB_SelectedPanelList.Items[i].Value + "'" + ",";
                                PanelName_values += "'" + RLB_SelectedPanelList.Items[i].Text + "'" + ",";

                            }
                        }

                        RLB_Filter.Items.Add(new RadListBoxItem
                        {
                            Value = "panelID IN (" + PanelID_values + ")",
                            Text = "PanelList = " + PanelName_values.Replace("\'", string.Empty).Trim().ToString()
                        });
                    }
                    else
                    {
                        RLB_SelectedPanelList.Focus();
                        lbl_err_panel.Text = "* Select the criteria";
                    }
                    break;

                case "CS_genePanelList":
                    string checkedCheckBoxes_CSgenePanelList = Request.Form[btn_value];
                  //  string checked_box_CSgenePanelList_Y_N = hdn_CS_GenePanel.Value;
                    if (!string.IsNullOrEmpty(checkedCheckBoxes_CSgenePanelList))
                    {
                        lbl_err_score.Text = null;
                        lbl_err_papi.Text = null;
                       
                        RLB_Filter.Items.Add(new RadListBoxItem
                           {
                               Value = "CS_GenePanel " + "='" + checkedCheckBoxes_CSgenePanelList + "'",
                               Text = "CS_GenePanel = " + checkedCheckBoxes_CSgenePanelList
                           });
                      
                    }
                    else
                    {
                        lbl_err_score.Text = null;
                        lbl_err_papi.Text = "* Select the criteria";
                    }
                    break;
                case "omim":
                    if (RLB_SelectedOMIM.Items.Count > 0)
                    {
                        string OMIMIdList_values = "";
                        string OMIMNameList_values = "";
                        lbl_err_omim.Text = null;

                        for (int i = 0; i < RLB_SelectedOMIM.Items.Count; i++)
                        {
                            if (RLB_SelectedOMIM.Items.Count == 1)
                            {
                                OMIMIdList_values = "'" + RLB_SelectedOMIM.Items[i].Value + "'";
                                OMIMNameList_values = RLB_SelectedOMIM.Items[i].Text;
                            }
                            else if (RLB_SelectedOMIM.Items.Count == (i + 1))
                            {
                                OMIMIdList_values += "'" + RLB_SelectedOMIM.Items[i].Value + "'";
                                OMIMNameList_values += RLB_SelectedOMIM.Items[i].Text;
                            }
                            else
                            {
                                OMIMIdList_values += "'" + RLB_SelectedOMIM.Items[i].Value + "'" + ",";
                                OMIMNameList_values += RLB_SelectedOMIM.Items[i].Text + ",";

                            }
                        }

                        RLB_Filter.Items.Add(new RadListBoxItem
                        {
                            Value = "DiseaseID IN (" + OMIMIdList_values + ")",
                            Text = "OMIMID = " + OMIMNameList_values.Replace("\'", string.Empty).Trim().ToString()
                        });
                    }
                    else
                    {
                        RLB_SelectedOMIM.Focus();
                        lbl_err_omim.Text = "* Select the criteria";
                    }
                    break;

                //case "OmimCount":
                //    foreach (RadDataFormItem item in RAF_OMIMPhenotypeCount.Items)
                //    {
                //        CheckBox chkbox = (CheckBox)item.FindControl("selectOmimCount");
                //        Label lbl_OmimCount = (Label)item.FindControl("lbl_OmimCount");

                //        if (chkbox.Checked)
                //        {
                //            RLB_Filter.Items.Add(new RadListBoxItem
                //            {
                //                Value = "selectOmimCount",
                //                Text = lbl_OmimCount.Text + " OMIMs from patient phenotype"
                //            });

                //        }
                //    }

                ////    break;
                default:
                    break;
            }
        }

        protected void btnShow_Click(object sender, EventArgs e)
        {

            DisplayData();
        }

        private void DisplayData()
        {

            lbl_Root.Text = hdf_rootCount.Value;

            String connstring = CnnStr;
            SqlConnection conn = new SqlConnection(connstring);
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();

           // sqlcommand for Update(U), Insert(I) and Select(S) from table
            SqlCommand cmdUIS = new SqlCommand("Sp_GAP_CS_Add_Items_To_FilterItems_And_Chart", conn);
            cmdUIS.CommandType = CommandType.StoredProcedure;

            cmdUIS.Parameters.Add("@FilterID", SqlDbType.Int);
            cmdUIS.Parameters.Add("@Condition", SqlDbType.VarChar, 3000);
            cmdUIS.Parameters.Add("@Parent", SqlDbType.Int);
            cmdUIS.Parameters.Add("@Tbl", SqlDbType.VarChar, 100);

            if (Session["FilterID_Filter"].ToString() != null)
            cmdUIS.Parameters["@FilterID"].Value = Convert.ToInt32(Session["FilterID_Filter"]);
            cmdUIS.Parameters["@Condition"].Value = RLB_Filter.SelectedItem.Value + "+" + RLB_Filter.SelectedItem.Text;
            if (RDDL_Parent.SelectedItem.Text != null)
                cmdUIS.Parameters["@Parent"].Value = Convert.ToInt32(RDDL_Parent.SelectedItem.Text);

            bool existsInACMG = false;
            foreach (string stringToCheck in paramACMGList)
            {
                if (RLB_Filter.SelectedItem.Value.Contains(stringToCheck))
                {
                    existsInACMG = true;
                    break;
                }
                else
                    existsInACMG = false;
            }
            if (existsInACMG)
                cmdUIS.Parameters["@Tbl"].Value = Session["SampleID_Filter"] + "_ACMG";
            else
                cmdUIS.Parameters["@Tbl"].Value = Session["SampleID_Filter"].ToString();

            SqlDataAdptrCmd.SelectCommand = cmdUIS;
            DataTable myDataTable = new DataTable();

            ///-----fetch result from #temp table and copy it in filterItemResultList
            List<FilterItem> filterItemResultList = new List<FilterItem>();

            try
            {
                conn.Open();
                SqlDataAdptrCmd.Fill(myDataTable);

                if (myDataTable.Rows.Count > 0)
                {
                    for (int i = 0; i < myDataTable.Rows.Count; i++)
                    {
                        FilterItem FItem = new FilterItem();

                        FItem.setLevel(Convert.ToInt32(myDataTable.Rows[i]["Level"]));
                        FItem.setState(Convert.ToInt32(myDataTable.Rows[i]["State"]));
                        FItem.setParent(Convert.ToInt32(myDataTable.Rows[i]["Parent"]));
                        string dbCon = myDataTable.Rows[i]["Condition"].ToString();
                        if (dbCon != "")
                        {
                            listOfCond.Add(new Tuple<int, string>(Convert.ToInt32(myDataTable.Rows[i]["Level"]), myDataTable.Rows[i]["Condition"].ToString()));
                            FItem.setCondition(myDataTable.Rows[i]["Condition"].ToString());
                        }
                        filterItemList.Add(FItem);
                    }

                    filterItemResultList = GetResult(conn);

                    for (int i = 0; i < myDataTable.Rows.Count; i++)
                    {
                        int rslt = (from a in filterItemResultList where a.getLevel() == filterItemList[i].getLevel() select a.getResult()).FirstOrDefault();
                        if (rslt != 0)
                            filterItemList[i].setResult(rslt);
                    }

                }

            }
            catch (SqlException ex)
            {
                string msg = "Insert or Update Error:";
                msg += ex.Message;
            }
            catch (Exception ex)
            {
                string msg = "Error:";
                msg += ex.Message;
            }
            finally
            {
                RLB_Condition.Items.Clear();

                FilterItem firstItem = (from f in filterItemList where f.getParent() == -1 select f).First();
                var firstUl = new HtmlGenericControl("ul");
                var firstLi = new HtmlGenericControl("li");
                firstLi.Attributes.Add("class", "node");

                var firstdiamondshape = new HtmlGenericControl("div");
                var firstconditiondiv = new HtmlGenericControl("div");

                if (Convert.ToInt32(RDDL_Parent.SelectedValue) >= 1 || Convert.ToInt32(RDDL_Parent.SelectedValue) >= 2)
                {
                    firstLi.Style.Add("margin-left", "2px");
                }
                else
                {
                    firstLi.Style.Add("margin-left", "17px");
                }

                firstdiamondshape.Attributes.Add("class", "diamond-shape");
                firstconditiondiv.Attributes.Add("class", "innernodecontent");
                firstconditiondiv.Attributes.Add("runat", "server");
                firstconditiondiv.InnerText = "C" + firstItem.getLevel();
                firstconditiondiv.Attributes.Add("title", firstItem.getCondition().Split('+')[1]);


                if (!String.IsNullOrEmpty(firstItem.getCondition()))
                {
                    RadListBoxItem RLBI_Condition = new RadListBoxItem(firstItem.getLevel() + " - " + firstItem.getCondition().Split('+')[1], firstItem.getLevel().ToString());
                //    RadListViewItem RLBI_Condition = new RadListViewItem()

                    RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                    Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                    lblcond.Text = "C" + firstItem.getLevel().ToString();
                    lblcond.ToolTip = firstItem.getCondition().Split('+')[1];

                    //ImageButton btndel = (ImageButton)RLBI_Condition.FindControl("BtnRmCond");
                    //btndel.Click += BtnRmCond_Click;

                    //btndel.Value = "0";

                    CheckBox chkboxResult = (CheckBox)RLB_Condition.FindControl("chkbox_Sel_condition_result");
                  //  chkboxResult.Enabled = false;

                    RLB_Condition.Items.Add(RLBI_Condition);
                }


                firstdiamondshape.Controls.Add(firstconditiondiv);
                firstLi.Controls.Add(firstdiamondshape);
                firstUl.Controls.Add(firstLi);
                rootLi.Controls.Add(firstUl);

                List<FilterItem> parentItems = (from a in filterItemList where a.getParent() == 0 select a).ToList();

                var ul = new HtmlGenericControl("ul");

                firstLi.Controls.Add(ul);
                foreach (var parentcat in parentItems)
                {
                    var li = new HtmlGenericControl("li");
                    var div = new HtmlGenericControl("div");

                    div.Attributes.Add("class", "nodecontent");
                    div.InnerHtml = parentcat.getLevel().ToString();

                    if (parentcat.getState() == 0)
                        div.Style.Add("background-color", "#fcbba1");
                    else if (parentcat.getState() == 1)
                        div.Style.Add("background-color", "#c7e9c0");

                    if (!String.IsNullOrEmpty(parentcat.getCondition()))
                    {
                        li.Attributes.Add("class", "node");
                        var diamondshape = new HtmlGenericControl("div");
                        var conditiondiv = new HtmlGenericControl("div");
                        diamondshape.Attributes.Add("class", "diamond-shape");
                        conditiondiv.Attributes.Add("class", "innernodecontent");
                        conditiondiv.Attributes.Add("runat", "server");

                        conditiondiv.InnerHtml = "C" + parentcat.getLevel().ToString();
                        conditiondiv.Attributes.Add("title", parentcat.getCondition().Split('+')[1]);


                        RadListBoxItem RLBI_Condition = new RadListBoxItem(parentcat.getLevel() + " - " + parentcat.getCondition().Split('+')[1], parentcat.getLevel().ToString());
                        RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                        Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                        lblcond.Text = "C" + parentcat.getLevel().ToString();
                        lblcond.ToolTip = parentcat.getCondition().Split('+')[1];

                        //ImageButton btndel = (ImageButton)RLBI_Condition.FindControl("BtnRmCond");
                        //btndel.Click += BtnRmCond_Click;

                      //  CheckBox chkboxResult = (CheckBox)RLBI_Condition.FindControl("chkbox_Sel_condition_result");
                       // chkboxResult.Enabled = false;

                        RLB_Condition.Items.Add(RLBI_Condition);


                        //RLB_Condition.Items.Add(new RadListBoxItem
                        //{
                        //    Value = parentcat.getLevel().ToString(),
                        //    Text = parentcat.getLevel() + " - " + parentcat.getCondition().Split('+')[1]
                        //});

                        li.Controls.Add(div);
                        diamondshape.Controls.Add(conditiondiv);
                        li.Controls.Add(diamondshape);
                    }
                    else
                    {
                        li.Attributes.Add("class", "leaf");
                        int selected = Convert.ToInt32(RDDL_Parent.SelectedText);
                        string cond = (from l in listOfCond where l.Item1 == parentcat.getParent() select l.Item2.Split('+')[1]).FirstOrDefault();
                        if (!String.IsNullOrEmpty(cond))
                        {
                            if (parentcat.getState() == 0)
                            {

                                RadListBoxItem RLBI_Condition = new RadListBoxItem(parentcat.getLevel() + " - Not " + cond + " ( items : " + parentcat.getResult() + " )", parentcat.getLevel().ToString());
                                RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                                Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                                lblcond.Text = "C" + parentcat.getLevel().ToString() + " - ( items : " + parentcat.getResult() + " )";
                                lblcond.ToolTip = "Not " + cond;

                                //ImageButton btnRemove = (ImageButton)RLBI_Condition.FindControl("BtnRmCond");
                                //btnRemove.Enabled = false;

                                RLB_Condition.Items.Add(RLBI_Condition);

                                RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).Style.Add("color", "#fc9272"); //---red
                                RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).FindControl("RB_Delete_Condition").Visible = false;

                                //RLB_Condition.Items.Add(new RadListBoxItem
                                //{
                                //    Value = parentcat.getLevel().ToString(),
                                //    Text = parentcat.getLevel() + " - Not " + cond + " ( items : " + parentcat.getResult() + " )"
                                //});
                                //RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).Checkable = false;
                            }
                            else if (parentcat.getState() == 1)
                            {
                                RadListBoxItem RLBI_Condition = new RadListBoxItem(parentcat.getLevel() + " - " + cond + " ( items : " + parentcat.getResult() + " )", parentcat.getLevel().ToString());
                                RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                                Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                                lblcond.Text = "C" + parentcat.getLevel().ToString() + " - ( items : " + parentcat.getResult() + " )";
                                lblcond.ToolTip = cond;

                                //ImageButton btnRemove = (ImageButton)RLBI_Condition.FindControl("BtnRmCond");
                                //btnRemove.Enabled = false;

                                RLB_Condition.Items.Add(RLBI_Condition);

                                RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).Style.Add("color", "#74c476"); //---green
                                RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).FindControl("RB_Delete_Condition").Visible = false;

                                //RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).Checkable = false;
                            }
                        }

                        li.Controls.Add(div);
                    }

                    ul.Controls.Add(li);

                    List<FilterItem> childItems = (from a in filterItemList where a.getParent() == parentcat.getLevel() select a).ToList();
                    if (childItems.Count > 0)
                        li.Controls.Add(AddChildItem(parentcat, li));
                }

                conn.Close();
                int selectedLvl = Convert.ToInt32(RDDL_Parent.SelectedText);

                RDDL_Parent.SelectedItem.Remove();

                RDDL_Parent.ClearSelection();

                RDDL_Parent.Items.Add(new DropDownListItem
                {
                    Value = (filterItemList.Count - 2).ToString(),
                    Text = (filterItemList.Count - 2).ToString()
                });
                RDDL_Parent.Items.Add(new DropDownListItem
                {
                    Value = (filterItemList.Count - 1).ToString(),
                    Text = (filterItemList.Count - 1).ToString()
                });


                RLB_Condition.Sort = RadListBoxSort.Ascending;
                RLB_Condition.Items.Sort(x => Convert.ToInt32(x.Value));

                RDDL_Parent.Items.Sort(x => Convert.ToInt32(x.Value));
            }
        }

        private HtmlGenericControl AddChildItem(FilterItem childItem, HtmlGenericControl pLi)
        {
            var ul = new HtmlGenericControl("ul");
            List<FilterItem> childItems = (from a in filterItemList where a.getParent() == childItem.getLevel() select a).ToList();
            var counter = 0;
            foreach (FilterItem cItem in childItems)
            {
                var li = new HtmlGenericControl("li");
                var div = new HtmlGenericControl("div");

                div.Attributes.Add("class", "nodecontent");
                div.InnerText = cItem.getLevel().ToString();

                if (cItem.getState() == 0)
                    div.Style.Add("background-color", "#fcbba1");
                else if (cItem.getState() == 1)
                    div.Style.Add("background-color", "#c7e9c0");

                if (!String.IsNullOrEmpty(cItem.getCondition()))
                {
                    li.Attributes.Add("class", "node");

                    var diamondshape = new HtmlGenericControl("div");
                    var conditiondiv = new HtmlGenericControl("div");
                    diamondshape.Attributes.Add("class", "diamond-shape");
                    conditiondiv.Attributes.Add("class", "innernodecontent");
                    conditiondiv.Attributes.Add("runat", "server");
                    conditiondiv.InnerText = "C" + cItem.getLevel().ToString();
                    conditiondiv.Attributes.Add("title", cItem.getCondition().Split('+')[1]);

                    RadListBoxItem RLBI_Condition = new RadListBoxItem(cItem.getLevel() + " - " + cItem.getCondition().Split('+')[1], cItem.getLevel().ToString());
                    RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                    Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                    lblcond.Text = GetSpaces(cItem.getParent()) + "C" + cItem.getLevel().ToString();
                    lblcond.ToolTip = cItem.getCondition().Split('+')[1]; ;

                    //CheckBox chkboxResult = (CheckBox)RLBI_Condition.FindControl("chkbox_Sel_condition_result");
                    //chkboxResult.Enabled = false;

                    RLB_Condition.Items.Add(RLBI_Condition);



                    li.Controls.Add(div);
                    diamondshape.Controls.Add(conditiondiv);
                    li.Controls.Add(diamondshape);
                    counter++;
                }
                else
                {
                    li.Attributes.Add("class", "leaf");

                    string cond = (from l in listOfCond where l.Item1 == cItem.getParent() select l.Item2.Split('+')[1]).FirstOrDefault();
                    if (!String.IsNullOrEmpty(cond))
                    {
                        if (cItem.getState() == 0)
                        {
                            RadListBoxItem RLBI_Condition = new RadListBoxItem(cItem.getLevel() + " - Not " + cond + " ( items : " + cItem.getResult() + " )", cItem.getLevel().ToString());
                            RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                            Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                            lblcond.Text = GetSpaces(cItem.getParent()) + "C" + cItem.getLevel().ToString() + " - ( items : " + cItem.getResult() + " )";
                            lblcond.ToolTip = "Not " + cond;




                            RLB_Condition.Items.Add(RLBI_Condition);
                            RLB_Condition.FindItemByValue(cItem.getLevel().ToString()).Style.Add("color", "#fc9272"); //---red
                            RLB_Condition.FindItemByValue(cItem.getLevel().ToString()).FindControl("RB_Delete_Condition").Visible = false;

                         //   RLB_Condition.FindItemByValue(cItem.getLevel().ToString()).Checkable = false;

                        }
                        else if (cItem.getState() == 1)
                        {


                            RadListBoxItem RLBI_Condition = new RadListBoxItem(cItem.getLevel() + " - " + cond + " ( items : " + cItem.getResult() + " )", cItem.getLevel().ToString());
                            RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                            Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                            lblcond.Text = GetSpaces(cItem.getParent()) + "C" + cItem.getLevel().ToString() + " - ( items : " + cItem.getResult() + " )";
                            lblcond.ToolTip = cond;


                            RLB_Condition.Items.Add(RLBI_Condition);
                            RLB_Condition.FindItemByValue(cItem.getLevel().ToString()).Style.Add("color", "#74c476"); //---green
                            RLB_Condition.FindItemByValue(cItem.getLevel().ToString()).FindControl("RB_Delete_Condition").Visible = false;

                        }
                    }

                    div.InnerText = cItem.getLevel().ToString();
                    li.Controls.Add(div);
                }

                List<FilterItem> subChilds = (from a in filterItemList where a.getParent() == cItem.getLevel() select a).ToList();
                if (subChilds.Count > 0)
                {
                    AddChildItem(cItem, li);
                }
                ul.Controls.Add(li);
            }

            pLi.Controls.Add(ul);
            return ul;
        }

        private List<FilterItem> GetResult(SqlConnection conn)
        {
            List<FilterItem> filterItemResultList = new List<FilterItem>();

            try
            {
                SqlDataAdapter SqlDataAdpt = new SqlDataAdapter();
                SqlCommand cmdRslt = new SqlCommand("Sp_GAP_CS_Result_FilterItems", conn);

                cmdRslt.CommandType = CommandType.StoredProcedure;

                cmdRslt.Parameters.Add(new SqlParameter("@SampleID", Session["SampleID_Filter"].ToString()));
                cmdRslt.Parameters.Add(new SqlParameter("@FilterID", Session["FilterID_Filter"].ToString()));

                SqlDataAdpt.SelectCommand = cmdRslt;

                DataTable myDataTableRslt = new DataTable();

                SqlDataAdpt.Fill(myDataTableRslt);
                if (myDataTableRslt.Rows.Count > 0)
                {
                    for (int i = 0; i < myDataTableRslt.Rows.Count; i++)
                    {
                        FilterItem FItem = new FilterItem();
                        FItem.setResult(Convert.ToInt32(myDataTableRslt.Rows[i]["result"]));
                        FItem.setLevel(Convert.ToInt32(myDataTableRslt.Rows[i]["lvl"]));


                        filterItemResultList.Add(FItem);
                    }
                }
            }
            catch (SqlException ex)
            {
                string msg = "Get Result Error:";
                msg += ex.Message;
            }

            return filterItemResultList;
        }

        private List<FilterItem> GetMaterializedPath(SqlConnection conn)
        {
            List<FilterItem> filterItemResultList = new List<FilterItem>();

            try
            {
                SqlDataAdapter SqlDataAdpt = new SqlDataAdapter();
                SqlCommand cmdRslt = new SqlCommand("Sp_GAP_CS_Result_Del_FilterItems", conn);

                cmdRslt.CommandType = CommandType.StoredProcedure;

                cmdRslt.Parameters.Add(new SqlParameter("@SampleID", Session["SampleID_Filter"].ToString()));
                cmdRslt.Parameters.Add(new SqlParameter("@FilterID", Session["FilterID_Filter"].ToString()));

                SqlDataAdpt.SelectCommand = cmdRslt;

                DataTable myDataTableRslt = new DataTable();

                SqlDataAdpt.Fill(myDataTableRslt);
                if (myDataTableRslt.Rows.Count > 0)
                {
                    for (int i = 0; i < myDataTableRslt.Rows.Count; i++)
                    {
                        FilterItem FItem = new FilterItem();
                        FItem.setLevel(Convert.ToInt32(myDataTableRslt.Rows[i]["Level"]));
                        FItem.setParent(Convert.ToInt32(myDataTableRslt.Rows[i]["Parent"]));
                        FItem.setMP(myDataTableRslt.Rows[i]["MaterializedPath"].ToString());

                        filterItemResultList.Add(FItem);
                    }
                }
            }
            catch (SqlException ex)
            {
                string msg = "Get Result Error:";
                msg += ex.Message;
            }

            return filterItemResultList;
        }

        protected void AddNewFilter_Click(object sender, EventArgs e)
        {
            RLB_Filter.Items.Clear();
            RPB_NewFilter.CollapseAllItems();

            String connstring = CnnStr;
            using (SqlConnection con = new SqlConnection(CnnStr))
            {
                using (SqlCommand myCMD = new SqlCommand("Sp_GAP_CS_Add_New_Filter", con))
                {
                    myCMD.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    myCMD.Parameters.Add("@userID", SqlDbType.Int);
                    myCMD.Parameters.Add("@filterID", SqlDbType.Int).Direction = ParameterDirection.Output;
                    myCMD.Parameters.Add("@filterName", SqlDbType.VarChar, 50);
                    myCMD.Parameters.Add("@desc", SqlDbType.VarChar, 5000);
                    myCMD.Parameters.Add("@type", SqlDbType.Int);

                    myCMD.Parameters["@userID"].Value = Convert.ToInt32(Session["WiNGSMasterId"]);
                    myCMD.Parameters["@filterName"].Value = txtbox_FilterName.Text;
                    myCMD.Parameters["@desc"].Value = Txt_Desc.Text;
                    myCMD.Parameters["@type"].Value = 1;

                    //if (rdio_private.Checked)
                    //    myCMD.Parameters["@type"].Value = rdio_private.Value;
                    //else if (rdio_public.Checked)
                    //    myCMD.Parameters["@type"].Value = rdio_public.Value;

                    myCMD.ExecuteNonQuery();

                    Session["FilterID_Filter"] = myCMD.Parameters["@filterID"].Value.ToString();
                    ////string ddd = Session["FilterID_Filter"].ToString();
                    Fetch_Count_Of_Data(Session["SampleID_Filter"].ToString(), lbl_Root);

                    lbl_added.Text = "Filter added! Now time to choose your items filter";
                    AddNewFilter.Enabled = false;

                }
            }

            filterItemList.Clear();
            RLB_Condition.Items.Clear();
            RDDL_Parent.Items.Clear();

            RDDL_Parent.Items.Add(new DropDownListItem
            {
                Value = "0",
                Text = "0"
            });


            RDD_FilterSet.Items.Clear();
            RDD_FilterSet.DataBind();

            RDD_FilterSet.ClearSelection();

            if (RDD_FilterSet.SelectedIndex > -1)
            {
                RDD_FilterSet.SelectedItem.Selected = false;
            }

            int indexOfLastItem = RDD_FilterSet.Items.Count - 1;
            RDD_FilterSet.Items[indexOfLastItem].Selected = true;


            leftTabDiv.Visible = true;
            rightTabDiv.Visible = true;

        }

        protected void RS_Ticks_Pathogen_Score_ValueChanged(object sender, EventArgs e)
        {
            PathogenScoreValue = RS_Ticks_Pathogen_Score.Value.ToString();
            //hdnPathogenScoreValueChanged.Value = RS_Ticks_Pathogen_Score.Value.ToString();
        }

        protected void RCB_Effect_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
            RadComboBoxItem item = e.Item;

            if (string.Equals("UTR", item.Text))
            {
                item.IsSeparator = true;
                item.Enabled = false;
            }
            if (string.Equals("Coding", item.Text))
            {
                item.IsSeparator = true;
                item.Enabled = false;
            }
            if (string.Equals("Splicing", item.Text))
            {
                item.IsSeparator = true;
                item.Enabled = false;
            }
            if (string.Equals("Non Coding", item.Text))
            {
                item.IsSeparator = true;
                item.Enabled = false;
            }

        }

        private IEnumerable GetScorePathogen()
        {
            List<object> dataSource = new List<object>();

            dataSource.Add(new { ScoreTxt = "Set the minimum 0.5", Score = "0.5" });
            dataSource.Add(new { ScoreTxt = "Set the minimum 1", Score = "1" });
            dataSource.Add(new { ScoreTxt = "Set the minimum 1.5", Score = "1.5" });
            dataSource.Add(new { ScoreTxt = "Set the minimum 2", Score = "2" });
            dataSource.Add(new { ScoreTxt = "Set the minimum 2.5", Score = "2.5" });
            dataSource.Add(new { ScoreTxt = "Set the minimum 3", Score = "3" });
            dataSource.Add(new { ScoreTxt = "Set the minimum 3.5", Score = "3.5" });
            dataSource.Add(new { ScoreTxt = "Set the minimum 4", Score = "4" });
            dataSource.Add(new { ScoreTxt = "Set the minimum 4.5", Score = "4.5" });
            dataSource.Add(new { ScoreTxt = "Set the minimum 5", Score = "5" });
            dataSource.Add(new { ScoreTxt = "Set the minimum 5.5", Score = "5.5" });
            dataSource.Add(new { ScoreTxt = "Set the minimum 6", Score = "6" });
            dataSource.Add(new { ScoreTxt = "Set the minimum 6.5", Score = "6.5" });
            dataSource.Add(new { ScoreTxt = "Set the minimum 7", Score = "7" });
            dataSource.Add(new { ScoreTxt = "Set the minimum 7.5", Score = "7.5" });
            dataSource.Add(new { ScoreTxt = "Set the minimum 8", Score = "8" });

            return dataSource;
        }

        protected void RG_SelectedHPO_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;

                LinkButton HPOID_LB = (LinkButton)item.FindControl("lbn_HPOID");
                string Txt_HPO = HPOID_LB.Text.ToString();

                string URL = "https://hpo.jax.org/app/browse/term/" + Txt_HPO;
                HPOID_LB.Attributes.Add("href", URL);
                HPOID_LB.Attributes.Add("target", "_blank");

                Label HpoId = (Label)item.FindControl("txt_HPOID");
                Label HpoName = (Label)item.FindControl("txt_HPO_Name");

            }
        }

        protected void RBAddHPO_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(RCB_SearchHPO.SelectedValue))
            {
                RLB_SelectedHPO.Items.Add(new RadListBoxItem
                {
                    Value = RCB_SearchHPO.SelectedValue.ToString(),
                    Text = RCB_SearchHPO.Text
                });
            }
        }

        protected void RBAddPanelList_Click(object sender, EventArgs e)
        {

            if (!String.IsNullOrEmpty(RCB_PanelList.SelectedValue))
            {
                RLB_SelectedPanelList.Items.Add(new RadListBoxItem
                {
                    Value = RCB_PanelList.SelectedValue.ToString(),
                    Text = RCB_PanelList.Text
                });
            }
        }

        private static string ShowCheckedItems(RadListBox listBox)
        {
            StringBuilder sb = new StringBuilder();
            IList<RadListBoxItem> collection = listBox.CheckedItems;
            RadListBoxItem last = collection.Last();

            foreach (RadListBoxItem item in collection)
            {
                if (item.Equals(last))
                    sb.Append(item.Value);
                else
                    sb.Append(item.Value + ",");
            }

            return sb.ToString();

        }

        protected void ShowResultCondition_Click(object sender, EventArgs e)
        {
            string s = Session["SampleID_Filter"].ToString();
            Fetch_Count_Of_Data(s, lbl_Root);
            Session["Selected_FiterItemIDs_AsString"] = ShowCheckedItems(RLB_Condition);

            Response.Redirect(String.Format("/GAP/CS/CSVariant.aspx"));
        }

        //protected void RLB_Condition_Deleting(object sender, RadListBoxDeletingEventArgs e)
        //{

        //    List<FilterItem> fltrItmResltLst = new List<FilterItem>();
        //    //-----fetch result from #temp table and copy it in filterItemResultList
        //    List<FilterItem> filterItemResultList = new List<FilterItem>();
        //    RDDL_Parent.Items.Clear();

        //    Page.Validate("RequiresSelection");
        //    if (Page.IsValid)
        //    {

        //        String connString = CnnStr;
        //        SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
        //        string deleteCommand;

        //        SelectedConditionValue = Convert.ToInt32(RLB_Condition.SelectedValue);

        //        string updateCommand = "UPDATE Tbl_GAP_Filter_Items SET Condition=NULL WHERE [Level] = @baseLvl AND FilterID = " + Session["FilterID_Filter"];
        //        string selectCommand = "SELECT * FROM Tbl_GAP_Filter_Items WHERE FilterID = " + Session["FilterID_Filter"];
        //        string lvlMP = null;

        //        using (SqlConnection conn = new SqlConnection(connString))
        //        {
        //            conn.Open();
        //            fltrItmResltLst = GetMaterializedPath(conn);

        //            foreach (FilterItem item in fltrItmResltLst)
        //            {
        //                string[] mpList = item.getMP().Split('.');
        //                int exists = Array.IndexOf(mpList, SelectedConditionValue.ToString());
        //                if (exists > -1)
        //                {
        //                    if (lvlMP == null)
        //                        lvlMP = "-1";

        //                    else
        //                        lvlMP = lvlMP + "," + item.getLevel().ToString();
        //                }
        //            }

        //            if (SelectedConditionValue == 0)
        //            {
        //                deleteCommand = "DELETE FROM Tbl_GAP_Filter_Items where (Parent = @baseLvl OR [Level] >= @baseLvl) AND FilterID = " + Session["FilterID_Filter"];
        //            }
        //            else
        //            {
        //                deleteCommand = "DELETE FROM Tbl_GAP_Filter_Items where [Level] IN ( " + lvlMP + " ) AND FilterID = " + Session["FilterID_Filter"];
        //            }

        //            using (SqlCommand cmd = new SqlCommand(deleteCommand, conn))
        //            {
        //                cmd.Parameters.AddWithValue("@baseLvl", Convert.ToInt32(RLB_Condition.SelectedValue));
        //                cmd.ExecuteNonQuery();
        //            }
        //            using (SqlCommand cmd = new SqlCommand(updateCommand, conn))
        //            {
        //                cmd.Parameters.AddWithValue("@baseLvl", Convert.ToInt32(RLB_Condition.SelectedValue));
        //                cmd.ExecuteNonQuery();
        //            }

        //            using (SqlCommand cmdSelect = new SqlCommand(selectCommand, conn))
        //            {
        //                SqlDataAdptrCmd.SelectCommand = cmdSelect;
        //                DataTable myDataTable = new DataTable();
        //                SqlDataAdptrCmd.Fill(myDataTable);

        //                if (myDataTable.Rows.Count > 0)
        //                {
        //                    for (int i = 0; i < myDataTable.Rows.Count; i++)
        //                    {
        //                        FilterItem FItem = new FilterItem();
        //                        FItem.setLevel(Convert.ToInt32(myDataTable.Rows[i]["Level"]));
        //                        FItem.setState(Convert.ToInt32(myDataTable.Rows[i]["State"]));
        //                        FItem.setParent(Convert.ToInt32(myDataTable.Rows[i]["Parent"]));
        //                        string dbCon = myDataTable.Rows[i]["Condition"].ToString();
        //                        if (dbCon != "")
        //                        {
        //                            listOfCond.Add(new Tuple<int, string>(Convert.ToInt32(myDataTable.Rows[i]["Level"]), myDataTable.Rows[i]["Condition"].ToString()));
        //                            FItem.setCondition(myDataTable.Rows[i]["Condition"].ToString());
        //                        }

        //                        filterItemList.Add(FItem);

        //                        if (String.IsNullOrEmpty(dbCon))
        //                        {
        //                            RDDL_Parent.Items.Add(new DropDownListItem
        //                            {
        //                                Value = myDataTable.Rows[i]["Level"].ToString(),
        //                                Text = myDataTable.Rows[i]["Level"].ToString()
        //                            });
        //                        }

        //                    }

        //                    filterItemResultList = GetResult(conn);

        //                    for (int i = 0; i < myDataTable.Rows.Count; i++)
        //                    {
        //                        int rslt = (from a in filterItemResultList where a.getLevel() == filterItemList[i].getLevel() select a.getResult()).FirstOrDefault();
        //                        if (rslt != 0)
        //                            filterItemList[i].setResult(rslt);
        //                    }


        //                    FilterItem firstItem = (from f in filterItemList where f.getParent() == -1 select f).First();
        //                    var firstUl = new HtmlGenericControl("ul");
        //                    var firstLi = new HtmlGenericControl("li");
        //                    firstLi.Attributes.Add("class", "node");

        //                    var firstdiamondshape = new HtmlGenericControl("div");
        //                    var firstconditiondiv = new HtmlGenericControl("div");

        //                    if (Convert.ToInt32(RLB_Condition.SelectedValue) >= 1 || Convert.ToInt32(RLB_Condition.SelectedValue) >= 2)
        //                        firstLi.Style.Add("margin-left", "2px");

        //                    else
        //                        firstLi.Style.Add("margin-left", "17px");


        //                    string selectedValueCondition = RLB_Condition.SelectedValue;


        //                    firstdiamondshape.Attributes.Add("class", "diamond-shape");
        //                    firstconditiondiv.Attributes.Add("class", "innernodecontent");
        //                    firstconditiondiv.Attributes.Add("runat", "server");
        //                    firstconditiondiv.InnerText = "C" + firstItem.getLevel();

        //                    RLB_Condition.Items.Clear();
        //                    foreach (RadListBoxItem item in RLB_Condition.Items)
        //                    {
        //                        RLB_Condition.Items.Remove(item);
        //                    }

        //                    if (!String.IsNullOrEmpty(firstItem.getCondition()))
        //                    {
        //                        RadListBoxItem RLBI_Condition = new RadListBoxItem(firstItem.getLevel() + " - " + firstItem.getCondition().Split('+')[1], firstItem.getLevel().ToString());
        //                        RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

        //                        Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
        //                        lblcond.Text = "C" + firstItem.getLevel().ToString() + " - ( items : " + firstItem.getResult() + " )";
        //                        lblcond.ToolTip = firstItem.getCondition();

        //                        RLB_Condition.Items.Add(RLBI_Condition);
        //                    }


        //                    firstdiamondshape.Controls.Add(firstconditiondiv);
        //                    firstLi.Controls.Add(firstdiamondshape);
        //                    firstUl.Controls.Add(firstLi);
        //                    rootLi.Controls.Add(firstUl);

        //                    List<FilterItem> parentItems = (from a in filterItemList where a.getParent() == 0 select a).ToList();

        //                    var ul = new HtmlGenericControl("ul");

        //                    firstLi.Controls.Add(ul);
        //                    foreach (var parentcat in parentItems)
        //                    {
        //                        var li = new HtmlGenericControl("li");
        //                        var div = new HtmlGenericControl("div");

        //                        div.Attributes.Add("class", "nodecontent");
        //                        div.InnerHtml = parentcat.getLevel().ToString();

        //                        if (parentcat.getState() == 0)
        //                            div.Style.Add("background-color", "#fcbba1");
        //                        else if (parentcat.getState() == 1)
        //                            div.Style.Add("background-color", "#c7e9c0");

        //                        if (!String.IsNullOrEmpty(parentcat.getCondition()))
        //                        {
        //                            li.Attributes.Add("class", "node");
        //                            var diamondshape = new HtmlGenericControl("div");
        //                            var conditiondiv = new HtmlGenericControl("div");
        //                            diamondshape.Attributes.Add("class", "diamond-shape");
        //                            conditiondiv.Attributes.Add("class", "innernodecontent");
        //                            conditiondiv.Attributes.Add("runat", "server");

        //                            conditiondiv.InnerHtml = "C" + parentcat.getLevel().ToString();

        //                            RadListBoxItem RLBI_Condition = new RadListBoxItem(parentcat.getLevel() + " - " + parentcat.getCondition().Split('+')[1], parentcat.getLevel().ToString());
        //                            RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

        //                            Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
        //                            lblcond.Text = "C" + parentcat.getLevel().ToString() + " - ( items : " + parentcat.getResult() + " )";
        //                            lblcond.ToolTip = parentcat.getCondition();

        //                            RLB_Condition.Items.Add(RLBI_Condition);

        //                            li.Controls.Add(div);
        //                            diamondshape.Controls.Add(conditiondiv);
        //                            li.Controls.Add(diamondshape);
        //                        }
        //                        else
        //                        {
        //                            li.Attributes.Add("class", "leaf");
        //                            string cond = (from l in listOfCond where l.Item1 == parentcat.getParent() select l.Item2.Split('+')[1]).FirstOrDefault();

        //                            if (!String.IsNullOrEmpty(cond))
        //                            {

        //                                RadListBoxItem RLBI_Condition = new RadListBoxItem(parentcat.getLevel() + " - Not " + cond + " ( items : " + parentcat.getResult() + " )", parentcat.getLevel().ToString());
        //                                RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

        //                                Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
        //                                lblcond.Text = "C" + parentcat.getLevel().ToString() + " - ( items : " + parentcat.getResult() + " )";
        //                                lblcond.ToolTip = "Not " + cond;



        //                                RLB_Condition.Items.Add(RLBI_Condition);
        //                                RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).Style.Add("color", "#fc9272"); //---red

        //                            }
        //                            else if (parentcat.getState() == 1)
        //                            {
        //                                RadListBoxItem RLBI_Condition = new RadListBoxItem(parentcat.getLevel() + " - " + cond + " ( items : " + parentcat.getResult() + " )", parentcat.getLevel().ToString());
        //                                RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

        //                                Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
        //                                lblcond.Text = "C" + parentcat.getLevel().ToString() + " - ( items : " + parentcat.getResult() + " )";
        //                                lblcond.ToolTip = cond;


        //                                RLB_Condition.Items.Add(RLBI_Condition);
        //                                RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).Style.Add("color", "#74c476"); //---green

        //                            }

        //                            li.Controls.Add(div);
        //                        }

        //                        ul.Controls.Add(li);

        //                        List<FilterItem> childItems = (from a in filterItemList where a.getParent() == parentcat.getLevel() select a).ToList();
        //                        if (childItems.Count > 0)
        //                            li.Controls.Add(AddChildItem(parentcat, li));
        //                    }
        //                    conn.Close();

        //                }
        //                else
        //                {
        //                    conn.Close();

        //                    RDDL_Parent.Items.Clear();
        //                    RLB_Condition.Items.Clear();
        //                    int count = RLB_Condition.Items.Count;

        //                    for (int c = RLB_Condition.Items.Count - 1; c > 0; --c)
        //                    {
        //                        RLB_Condition.Items.Remove(RLB_Condition.Items[c]);
        //                    }


        //                    RDDL_Parent.Items.Add(new DropDownListItem
        //                    {
        //                        Value = "0",
        //                        Text = "0"
        //                    });

        //                    SelectedConditionValue = 0;
        //                }

        //                SelectedConditionValue = 0;

        //                RLB_Condition.Sort = RadListBoxSort.Ascending;
        //                RLB_Condition.Items.Sort(x => Convert.ToInt32(x.Value));

        //                RDDL_Parent.Items.Sort(x => Convert.ToInt32(x.Value));

        //            }

        //        }

        //    }
        //}

        protected void RDD_FilterSet_SelectedIndexChanged(object sender, EventArgs e)
        {
            leftTabDiv.Visible = true;
            rightTabDiv.Visible = true;

            RLB_Filter.Items.Clear();

            Session["FilterID_Filter"] = RDD_FilterSet.SelectedValue.ToString();
            string s = Session["SampleID_Filter"].ToString();
            Fetch_Count_Of_Data(s, lbl_Root);

            RLB_FilterLoaded();

            List<FilterItem> fltrItmResltLst = new List<FilterItem>();
          ///  -----fetch result from #temp table and copy it in filterItemResultList
            List<FilterItem> filterItemResultList = new List<FilterItem>();
            RDDL_Parent.Items.Clear();
            RLB_Condition.Items.Clear();

            String connString = CnnStr;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            string selectCommand = "SELECT * FROM Tbl_GAP_CS_Filter_Items where FilterID= " + Session["FilterID_Filter"] + " order by [Level]";
            string selectedItemCommand = "SELECT * FROM Tbl_GAP_CS_Filter_SelectedItems where FilterID= " + Session["FilterID_Filter"];

            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                using (SqlCommand cmdSelect = new SqlCommand(selectedItemCommand, conn))
                {
                    SqlDataAdptrCmd.SelectCommand = cmdSelect;
                    DataTable myDataTable = new DataTable();
                    SqlDataAdptrCmd.Fill(myDataTable);

                    if (myDataTable.Rows.Count > 0)
                    {
                        for (int i = 0; i < myDataTable.Rows.Count; i++)
                        {
                            String items = myDataTable.Rows[i]["Item"].ToString();
                            RLB_Filter.Items.Add(new RadListBoxItem
                            {
                                Value = items.Split('+')[0].ToString(),
                                Text = items.Split('+')[1].ToString()
                            });
                        }
                    }
                }

                using (SqlCommand cmdSelect = new SqlCommand(selectCommand, conn))
                {
                    SqlDataAdptrCmd.SelectCommand = cmdSelect;
                    DataTable myDataTable = new DataTable();
                    SqlDataAdptrCmd.Fill(myDataTable);

                    if (myDataTable.Rows.Count > 0)
                    {
                        for (int i = 0; i < myDataTable.Rows.Count; i++)
                        {
                            FilterItem FItem = new FilterItem();
                            FItem.setLevel(Convert.ToInt32(myDataTable.Rows[i]["Level"]));
                            FItem.setState(Convert.ToInt32(myDataTable.Rows[i]["State"]));
                            FItem.setParent(Convert.ToInt32(myDataTable.Rows[i]["Parent"]));
                            string dbCon = myDataTable.Rows[i]["Condition"].ToString();
                            if (dbCon != "")
                            {
                                listOfCond.Add(new Tuple<int, string>(Convert.ToInt32(myDataTable.Rows[i]["Level"]), myDataTable.Rows[i]["Condition"].ToString()));
                                FItem.setCondition(myDataTable.Rows[i]["Condition"].ToString());
                            }

                            filterItemList.Add(FItem);

                            if (String.IsNullOrEmpty(dbCon))
                            {
                                RDDL_Parent.Items.Add(new DropDownListItem
                                {
                                    Value = myDataTable.Rows[i]["Level"].ToString(),
                                    Text = myDataTable.Rows[i]["Level"].ToString()
                                });
                            }
                        }

                        filterItemResultList = GetResult(conn);

                        for (int i = 0; i < myDataTable.Rows.Count; i++)
                        {
                            int rslt = (from a in filterItemResultList where a.getLevel() == filterItemList[i].getLevel() select a.getResult()).FirstOrDefault();
                            if (rslt != 0)
                                filterItemList[i].setResult(rslt);
                        }

                        FilterItem firstItem = (from f in filterItemList where f.getParent() == -1 select f).First();
                        var firstUl = new HtmlGenericControl("ul");
                        var firstLi = new HtmlGenericControl("li");
                        firstLi.Attributes.Add("class", "node");

                        var firstdiamondshape = new HtmlGenericControl("div");
                        var firstconditiondiv = new HtmlGenericControl("div");

                        //if (Convert.ToInt32(RLB_Condition.SelectedValue) >= 1 || Convert.ToInt32(RLB_Condition.SelectedValue) >= 2)
                        //    firstLi.Style.Add("margin-left", "2px");

                        //else
                        firstLi.Style.Add("margin-left", "17px");


                        //string selectedValueCondition = RLB_Condition.SelectedValue;
                        //RLB_Condition.Items.Clear();

                        firstdiamondshape.Attributes.Add("class", "diamond-shape");
                        firstconditiondiv.Attributes.Add("class", "innernodecontent");
                        firstconditiondiv.Attributes.Add("runat", "server");
                        firstconditiondiv.InnerText = "C" + firstItem.getLevel();

                        RLB_Condition.Items.Clear();

                        if (!String.IsNullOrEmpty(firstItem.getCondition()))
                        {

                            RadListBoxItem RLBI_Condition = new RadListBoxItem(firstItem.getLevel() + " - " + firstItem.getCondition().Split('+')[1], firstItem.getLevel().ToString());
                            RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                            Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                            lblcond.Text = "C" + firstItem.getLevel().ToString();
                            lblcond.ToolTip = firstItem.getCondition().Split('+')[1];

                            RLB_Condition.Items.Add(RLBI_Condition);

                        }



                        firstdiamondshape.Controls.Add(firstconditiondiv);
                        firstLi.Controls.Add(firstdiamondshape);
                        firstUl.Controls.Add(firstLi);
                        rootLi.Controls.Add(firstUl);

                        List<FilterItem> parentItems = (from a in filterItemList where a.getParent() == 0 select a).ToList();

                        var ul = new HtmlGenericControl("ul");

                        firstLi.Controls.Add(ul);
                        foreach (var parentcat in parentItems)
                        {
                            var li = new HtmlGenericControl("li");
                            var div = new HtmlGenericControl("div");

                            div.Attributes.Add("class", "nodecontent");
                            div.InnerHtml = parentcat.getLevel().ToString();

                            if (parentcat.getState() == 0)
                                div.Style.Add("background-color", "#fcbba1");
                            else if (parentcat.getState() == 1)
                                div.Style.Add("background-color", "#c7e9c0");

                            if (!String.IsNullOrEmpty(parentcat.getCondition()))
                            {
                                li.Attributes.Add("class", "node");
                                var diamondshape = new HtmlGenericControl("div");
                                var conditiondiv = new HtmlGenericControl("div");
                                diamondshape.Attributes.Add("class", "diamond-shape");
                                conditiondiv.Attributes.Add("class", "innernodecontent");
                                conditiondiv.Attributes.Add("runat", "server");

                                conditiondiv.InnerHtml = "C" + parentcat.getLevel().ToString();

                                RadListBoxItem RLBI_Condition = new RadListBoxItem(parentcat.getLevel() + " - " + parentcat.getCondition().Split('+')[1], parentcat.getLevel().ToString());
                                RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                                Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                                lblcond.Text = GetSpaces(parentcat.getParent()) + "C" + parentcat.getLevel().ToString();
                                lblcond.ToolTip = parentcat.getCondition().Split('+')[1];

                                RLB_Condition.Items.Add(RLBI_Condition);

                                li.Controls.Add(div);
                                diamondshape.Controls.Add(conditiondiv);
                                li.Controls.Add(diamondshape);
                            }
                            else
                            {
                                li.Attributes.Add("class", "leaf");
                                string cond = (from l in listOfCond where l.Item1 == parentcat.getParent() select l.Item2.Split('+')[1]).FirstOrDefault();

                                if (!String.IsNullOrEmpty(cond) && parentcat.getState() != 1)
                                {

                                    RadListBoxItem RLBI_Condition = new RadListBoxItem(parentcat.getLevel() + " - Not " + cond + " ( items : " + parentcat.getResult() + " )", parentcat.getLevel().ToString());
                                    RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                                    Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                                    lblcond.Text = GetSpaces(parentcat.getParent()) + "C" + parentcat.getLevel().ToString() + " - ( items : " + parentcat.getResult() + " )";
                                    lblcond.ToolTip = "Not " + cond;

                                    RLB_Condition.Items.Add(RLBI_Condition);
                                    RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).Style.Add("color", "#fc9272"); //---red
                                    RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).FindControl("RB_Delete_Condition").Visible = false;
                                }
                                if (parentcat.getState() == 1)
                                {
                                    RadListBoxItem RLBI_Condition = new RadListBoxItem(parentcat.getLevel() + " - " + cond + " ( items : " + parentcat.getResult() + " )", parentcat.getLevel().ToString());
                                    RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                                    Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                                    lblcond.Text = GetSpaces(parentcat.getParent()) + "C" + parentcat.getLevel().ToString() + " - ( items : " + parentcat.getResult() + " )";
                                    lblcond.ToolTip = cond;

                                    RLB_Condition.Items.Add(RLBI_Condition);
                                    RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).Style.Add("color", "#74c476"); //---green
                                    RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).FindControl("RB_Delete_Condition").Visible = false;

                                }

                                li.Controls.Add(div);
                            }

                            ul.Controls.Add(li);

                            List<FilterItem> childItems = (from a in filterItemList where a.getParent() == parentcat.getLevel() select a).ToList();
                            if (childItems.Count > 0)
                                li.Controls.Add(AddChildItem(parentcat, li));
                        }

                        conn.Close();

                    }
                    else
                    {
                        conn.Close();

                        RDDL_Parent.Items.Clear();
                        // RLB_Condition.Items.Clear();
                        int count = RLB_Condition.Items.Count;

                        for (int c = RLB_Condition.Items.Count - 1; c > 0; --c)
                        {
                            RLB_Condition.Items.Remove(RLB_Condition.Items[c]);
                        }



                        RDDL_Parent.Items.Add(new DropDownListItem
                        {
                            Value = "0",
                            Text = "0"
                        });

                        SelectedConditionValue = 0;
                    }

                    SelectedConditionValue = 0;

                    RLB_Condition.Sort = RadListBoxSort.Ascending;
                    RLB_Condition.Items.Sort(x => Convert.ToInt32(x.Value));

                    RDDL_Parent.Items.Sort(x => Convert.ToInt32(x.Value));

                }
            }
        }

        protected void Del_RDD_FilterSet_Click(object sender, EventArgs e)
        {
            String connstring = CnnStr;
            using (SqlConnection con = new SqlConnection(CnnStr))
            {
                using (SqlCommand myCMD = new SqlCommand("Sp_GAP_CS_Filter_Del_FilterSet", con))
                {
                    myCMD.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    myCMD.Parameters.Add("@UserID", SqlDbType.Int);
                    myCMD.Parameters.Add("@FilterID", SqlDbType.Int);


                    myCMD.Parameters["@userID"].Value = Convert.ToInt32(Session["WiNGSMasterId"]);
                    myCMD.Parameters["@FilterID"].Value = Convert.ToInt32(Session["FilterID_Filter"]);

                    myCMD.ExecuteNonQuery();

                }

                if (leftTabDiv.Visible)
                    leftTabDiv.Visible = false;

                if (rightTabDiv.Visible)
                    rightTabDiv.Visible = false;
            }

            RDD_FilterSet.Items.Clear();
            RDD_FilterSet.DataBind();

            RDD_FilterSet.ClearSelection();

            if (RDD_FilterSet.SelectedIndex > -1)
            {
                RDD_FilterSet.SelectedItem.Selected = false;
            }


        }

        protected void RB_Delete_Condition_Click(object sender, EventArgs e)
        {
            List<FilterItem> fltrItmResltLst = new List<FilterItem>();
           /// -----fetch result from #temp table and copy it in filterItemResultList
            List<FilterItem> filterItemResultList = new List<FilterItem>();
            RDDL_Parent.Items.Clear();

            String connString = CnnStr;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            string deleteCommand;

          //  SelectedConditionValue = Convert.ToInt32(RLB_Condition.CheckedItems.First().Value.ToString());
            SelectedConditionValue = Convert.ToInt32(RLB_Condition.SelectedValue.ToString());

            string updateCommand = "UPDATE Tbl_GAP_CS_Filter_Items SET Condition=NULL WHERE [Level] = @baseLvl AND FilterID = " + Session["FilterID_Filter"];
            string selectCommand = "SELECT * FROM Tbl_GAP_CS_Filter_Items WHERE FilterID = " + Session["FilterID_Filter"];
            string lvlMP = null;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                fltrItmResltLst = GetMaterializedPath(conn);

                foreach (FilterItem item in fltrItmResltLst)
                {
                    string[] mpList = item.getMP().Split('.');
                    int exists = Array.IndexOf(mpList, SelectedConditionValue.ToString());
                    if (exists > -1)
                    {
                        if (lvlMP == null)
                            lvlMP = "-1";

                        else
                            lvlMP = lvlMP + "," + item.getLevel().ToString();
                    }
                }

                if (SelectedConditionValue == 0)
                {
                    deleteCommand = "DELETE FROM Tbl_GAP_CS_Filter_Items where (Parent = @baseLvl OR [Level] >= @baseLvl) AND FilterID = " + Session["FilterID_Filter"];
                 //   RLB_Condition.Items.Clear();
                }
                else
                {
                    deleteCommand = "DELETE FROM Tbl_GAP_CS_Filter_Items where [Level] IN (" + lvlMP + " ) AND FilterID = " + Session["FilterID_Filter"];
                }

                using (SqlCommand cmd = new SqlCommand(deleteCommand, conn))
                {
                    cmd.Parameters.AddWithValue("@baseLvl", Convert.ToInt32(RLB_Condition.SelectedValue));
                    cmd.ExecuteNonQuery();

                }
                using (SqlCommand cmd = new SqlCommand(updateCommand, conn))
                {
                    cmd.Parameters.AddWithValue("@baseLvl", Convert.ToInt32(RLB_Condition.SelectedValue));
                    cmd.ExecuteNonQuery();
                }

                using (SqlCommand cmdSelect = new SqlCommand(selectCommand, conn))
                {
                    SqlDataAdptrCmd.SelectCommand = cmdSelect;
                    DataTable myDataTable = new DataTable();
                    SqlDataAdptrCmd.Fill(myDataTable);

                    if (myDataTable.Rows.Count > 0)
                    {
                        for (int i = 0; i < myDataTable.Rows.Count; i++)
                        {
                            FilterItem FItem = new FilterItem();
                            FItem.setLevel(Convert.ToInt32(myDataTable.Rows[i]["Level"]));
                            FItem.setState(Convert.ToInt32(myDataTable.Rows[i]["State"]));
                            FItem.setParent(Convert.ToInt32(myDataTable.Rows[i]["Parent"]));
                            string dbCon = myDataTable.Rows[i]["Condition"].ToString();
                            if (dbCon != "")
                            {
                                listOfCond.Add(new Tuple<int, string>(Convert.ToInt32(myDataTable.Rows[i]["Level"]), myDataTable.Rows[i]["Condition"].ToString()));
                                FItem.setCondition(myDataTable.Rows[i]["Condition"].ToString());
                            }

                            filterItemList.Add(FItem);

                            if (String.IsNullOrEmpty(dbCon))
                            {
                                RDDL_Parent.Items.Add(new DropDownListItem
                                {
                                    Value = myDataTable.Rows[i]["Level"].ToString(),
                                    Text = myDataTable.Rows[i]["Level"].ToString()
                                });
                            }

                        }

                        filterItemResultList = GetResult(conn);

                        for (int i = 0; i < myDataTable.Rows.Count; i++)
                        {
                            int rslt = (from a in filterItemResultList where a.getLevel() == filterItemList[i].getLevel() select a.getResult()).FirstOrDefault();
                            if (rslt != 0)
                                filterItemList[i].setResult(rslt);
                        }


                        FilterItem firstItem = (from f in filterItemList where f.getParent() == -1 select f).First();
                        var firstUl = new HtmlGenericControl("ul");
                        var firstLi = new HtmlGenericControl("li");
                        firstLi.Attributes.Add("class", "node");

                        var firstdiamondshape = new HtmlGenericControl("div");
                        var firstconditiondiv = new HtmlGenericControl("div");

                        if (Convert.ToInt32(RLB_Condition.SelectedValue) >= 1 || Convert.ToInt32(RLB_Condition.SelectedValue) >= 2)
                            firstLi.Style.Add("margin-left", "2px");

                        else
                            firstLi.Style.Add("margin-left", "17px");

                     //   string selectedValueCondition = RLB_Condition.SelectedValue;
                     //   RLB_Condition.Items.Clear();

                        firstdiamondshape.Attributes.Add("class", "diamond-shape");
                        firstconditiondiv.Attributes.Add("class", "innernodecontent");
                        firstconditiondiv.Attributes.Add("runat", "server");
                        firstconditiondiv.InnerText = "C" + firstItem.getLevel();

                        RLB_Condition.Items.Clear();


                        if (!String.IsNullOrEmpty(firstItem.getCondition()))
                        {

                            RadListBoxItem RLBI_Condition = new RadListBoxItem(firstItem.getLevel() + " - " + firstItem.getCondition().Split('+')[1], firstItem.getLevel().ToString());
                            RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);


                            Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                            lblcond.Text = "C" + firstItem.getLevel().ToString();
                            lblcond.ToolTip = firstItem.getCondition().Split('+')[1];

                            RLB_Condition.Items.Add(RLBI_Condition);

                        }

                        firstdiamondshape.Controls.Add(firstconditiondiv);
                        firstLi.Controls.Add(firstdiamondshape);
                        firstUl.Controls.Add(firstLi);
                        rootLi.Controls.Add(firstUl);

                        List<FilterItem> parentItems = (from a in filterItemList where a.getParent() == 0 select a).ToList();

                        var ul = new HtmlGenericControl("ul");

                        firstLi.Controls.Add(ul);
                        foreach (var parentcat in parentItems)
                        {
                            var li = new HtmlGenericControl("li");
                            var div = new HtmlGenericControl("div");

                            div.Attributes.Add("class", "nodecontent");
                            div.InnerHtml = parentcat.getLevel().ToString();

                            if (parentcat.getState() == 0)
                                div.Style.Add("background-color", "#fcbba1");
                            else if (parentcat.getState() == 1)
                                div.Style.Add("background-color", "#c7e9c0");

                            if (!String.IsNullOrEmpty(parentcat.getCondition()))
                            {
                                li.Attributes.Add("class", "node");
                                var diamondshape = new HtmlGenericControl("div");
                                var conditiondiv = new HtmlGenericControl("div");
                                diamondshape.Attributes.Add("class", "diamond-shape");
                                conditiondiv.Attributes.Add("class", "innernodecontent");
                                conditiondiv.Attributes.Add("runat", "server");

                                conditiondiv.InnerHtml = "C" + parentcat.getLevel().ToString();

                                RadListBoxItem RLBI_Condition = new RadListBoxItem(parentcat.getLevel() + " - " + parentcat.getCondition().Split('+')[1], parentcat.getLevel().ToString());
                                RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                                Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                                lblcond.Text = "C" + parentcat.getLevel().ToString();
                                lblcond.ToolTip = parentcat.getCondition().Split('+')[1];

                                RLB_Condition.Items.Add(RLBI_Condition);

                                li.Controls.Add(div);
                                diamondshape.Controls.Add(conditiondiv);
                                li.Controls.Add(diamondshape);
                            }
                            else
                            {
                                li.Attributes.Add("class", "leaf");
                                string cond = (from l in listOfCond where l.Item1 == parentcat.getParent() select l.Item2.Split('+')[1]).FirstOrDefault();

                                if (!String.IsNullOrEmpty(cond))
                                {
                                    if (parentcat.getState() == 0)
                                    {
                                        RadListBoxItem RLBI_Condition = new RadListBoxItem(parentcat.getLevel() + " - Not " + cond + " ( items : " + parentcat.getResult() + " )", parentcat.getLevel().ToString());
                                        RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                                        Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                                        lblcond.Text = "C" + parentcat.getLevel().ToString() + " - ( items : " + parentcat.getResult() + " )";
                                        lblcond.ToolTip = "Not " + cond;

                                        RLB_Condition.Items.Add(RLBI_Condition);
                                        RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).Style.Add("color", "#fc9272"); //---red
                                        RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).FindControl("RB_Delete_Condition").Visible = false;

                                    }
                                    else if (parentcat.getState() == 1)
                                    {
                                        RadListBoxItem RLBI_Condition = new RadListBoxItem(parentcat.getLevel() + " - " + cond + " ( items : " + parentcat.getResult() + " )", parentcat.getLevel().ToString());
                                        RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                                        Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                                        lblcond.Text = "C" + parentcat.getLevel().ToString() + " - ( items : " + parentcat.getResult() + " )";
                                        lblcond.ToolTip = cond;

                                    

                                        RLB_Condition.Items.Add(RLBI_Condition);
                                        RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).Style.Add("color", "#74c476"); //---green
                                        RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).FindControl("RB_Delete_Condition").Visible = false;

                                    }
                                }

                                li.Controls.Add(div);
                            }

                            ul.Controls.Add(li);

                            List<FilterItem> childItems = (from a in filterItemList where a.getParent() == parentcat.getLevel() select a).ToList();
                            if (childItems.Count > 0)
                                li.Controls.Add(AddChildItem(parentcat, li));
                        }
                        conn.Close();

                    }
                    else
                    {
                        conn.Close();

                        RDDL_Parent.Items.Clear();
                        RLB_Condition.Items.Clear();
                        int count = RLB_Condition.Items.Count;

                        for (int c = RLB_Condition.Items.Count - 1; c > 0; --c)
                        {
                            RLB_Condition.Items.Remove(RLB_Condition.Items[c]);
                        }

                        Fetch_Count_Of_Data(Session["SampleID_Filter"].ToString(), lbl_Root);

                        RDDL_Parent.Items.Add(new DropDownListItem
                        {
                            Value = "0",
                            Text = "0"
                        });

                        SelectedConditionValue = 0;
                    }

                    SelectedConditionValue = 0;

                    RLB_Condition.Sort = RadListBoxSort.Ascending;
                    RLB_Condition.Items.Sort(x => Convert.ToInt32(x.Value));

                    RDDL_Parent.Items.Sort(x => Convert.ToInt32(x.Value));

                }

            }

        }

        protected void RBAddSelectedItem_Click(object sender, EventArgs e)
        {
            if (RLB_Filter.Items.Count.Equals(0))
            {
                RLB_Filter.Items.Add(new RadListBoxItem
                {
                    Value = "00",
                    Text = "First add some filter item from the panel left!"
                });

                RBAddSelectedItem.Enabled = false;
            }
            else
            {
                if (RLB_Filter.Items[0].Value == "00")
                {
                    RLB_Filter.Items.Remove(RLB_Filter.Items[0]);
                    RBAddSelectedItem.Enabled = false;
                }
                else
                {
                    RBAddSelectedItem.Enabled = true;

                    String connstring = CnnStr;
                    SqlConnection conn = new SqlConnection(connstring);
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();

                    SqlCommand cmdUIS = new SqlCommand("Sp_GAP_CS_Filter_SelectedItems_Sel", conn);
                    cmdUIS.CommandType = CommandType.StoredProcedure;

                    cmdUIS.Parameters.Add("@FilterID", SqlDbType.Int);
                    cmdUIS.Parameters["@FilterID"].Value = Convert.ToInt32(Session["FilterID_Filter"]);

                    SqlDataAdptrCmd.SelectCommand = cmdUIS;
                    DataTable myDataTable = new DataTable();

                    List<Tuple<int, string>> listOfExistedItem = new List<Tuple<int, string>>();

                    using (SqlConnection Conn = new SqlConnection(CnnStr))
                    {
                        conn.Open();
                        SqlDataAdptrCmd.Fill(myDataTable);

                        if (myDataTable.Rows.Count > 0)
                        {
                            for (int i = 0; i < myDataTable.Rows.Count; i++)
                            {
                                listOfExistedItem.Add(new Tuple<int, string>(Convert.ToInt32(Session["FilterID_Filter"]), myDataTable.Rows[i]["Item"].ToString()));
                            }
                        }
                        conn.Close();
                    }


                    List<FSObject> TGList = new List<FSObject>();
                    int counter = 0;
                    foreach (RadListBoxItem item in RLB_Filter.Items)
                    {
                        string itemValue = item.Value.ToString();
                        string itemTxt = item.Text.ToString();

                        Tuple<int, string> itm = new Tuple<int, string>(Convert.ToInt32(Session["FilterID_Filter"]), item.Value + "+" + item.Text);

                        if (!listOfExistedItem.Contains(itm))
                        {
                            TGList.Add(new FSObject(Convert.ToInt32(Session["FilterID_Filter"]), itemValue + "+" + itemTxt));
                        }
                    }
                    ThreadAddFs tTG = new ThreadAddFs(TGList);
                    Thread tTGrunner = new Thread(new ThreadStart(tTG.ThreadProc));
                    tTGrunner.Start();
                    tTGrunner.Join();

                    RLB_Filter.Items.Clear();
                    RLB_Filter.Items.Add(new RadListBoxItem
                    {
                        Value = "00",
                        Text = "All selected items is saved!"
                    });

                    RBAddSelectedItem.Enabled = false;
                }
            }

           // RL_feedback.Text = "Inserted";
            ScriptManager.RegisterStartupScript(this, GetType(), "close", "CloseModal();", true);
        }
        private string GetSpaces(int totalLength)
        {
            string result = string.Empty;
            for (int i = 0; i < totalLength; i++)
            {
                result += "&nbsp;&nbsp;";
            }
            return result;
        }
        public struct FSObject
        {
            public int FilterID;
            public string Item;

            public FSObject(int FilterID, string Item)
            {
                this.FilterID = FilterID;
                this.Item = Item;
            }

        }

        public class ThreadAddFs
        {
            uc_CSVariant_Filter mainClass = new uc_CSVariant_Filter();

            private List<FSObject> T_TGList = new List<FSObject>();
            public ThreadAddFs(List<FSObject> TGList)
            {
                for (int i = 0; i <= TGList.Count - 1; i++)
                {
                    T_TGList.Add(new FSObject(TGList[i].FilterID, TGList[i].Item));
                }
            }

            public void ThreadProc()
            {

                DataTable TG_table = new DataTable();

                TG_table.Columns.Add("FilterID", typeof(Int32));
                TG_table.Columns.Add("Item", typeof(string));

                for (int i = 0; i <= T_TGList.Count - 1; i++)
                {
                    TG_table.Rows.Add(T_TGList[i].FilterID, T_TGList[i].Item);
                }

                using (SqlConnection Conn = new SqlConnection(CnnStr))
                {
                    Conn.Open();
                    using (SqlBulkCopy s = new SqlBulkCopy(Conn))
                    {
                        s.DestinationTableName = "Tbl_GAP_CS_Filter_SelectedItems";
                        s.WriteToServer(TG_table);
                        s.Close();
                    }
                    Conn.Close();
                }
            }
        }

        ////protected void ShowResultGenePhenotype_Click(object sender, EventArgs e)
        ////{
        ////    Session["IndividualID_For_HPO_SampleDiscovery"] = Session["IndividualID_Filter"];
        ////    Session["Tab_Selected"] = "GenePhenotype_Selected";
        ////    string message = "OpenWin_Gene();";
        ////    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
        ////}

        ////protected void ShowResultHPOPhenotype_Click(object sender, EventArgs e)
        ////{
        ////    Session["IndividualID_For_HPO_SampleDiscovery"] = Session["IndividualID_Filter"];
        ////    Session["Tab_Selected"] = "HPOPhenotype_Selected";
        ////    string message = "OpenWin_Gene();";
        ////    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
        ////}

        ////protected void ShowResultOmim_Click(object sender, EventArgs e)
        ////{
        ////    Session["IndividualID_For_HPO_SampleDiscovery"] = Session["IndividualID_Filter"];
        ////    Session["Tab_Selected"] = "OMIMPhenotype_Selected";
        ////    string message = "OpenWin_Gene();";
        ////    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
        ////}

        protected void RLB_SelectedPanelList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["PanelID_Filter"] = RLB_SelectedPanelList.SelectedValue.ToString();
            Session["PanelID_Name_Filter"] = RLB_SelectedPanelList.SelectedItem.Text.ToString();

            string message = "OpenWin_Show_GenePanel();";
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
        }

        protected void RLB_SelectedHPO_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["HPOId_Filter"] = RLB_SelectedHPO.SelectedValue.ToString();
            string message = "OpenWin_Show_GeneRelatedToHPO();";
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
        }

        protected void RBADDOMIM_Click(object sender, EventArgs e)
        {

            if (!String.IsNullOrEmpty(RCB_OMIM.SelectedValue))
            {
                RLB_SelectedOMIM.Items.Add(new RadListBoxItem
                {
                    Value = RCB_OMIM.SelectedValue.ToString(),
                    Text = RCB_OMIM.Text
                });
            }
        }

        protected void RLB_SelectedOMIM_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["OMIMID_Filter"] = RLB_SelectedOMIM.SelectedValue.ToString();
            Session["OMIMID_Name_Filter"] = RLB_SelectedOMIM.SelectedItem.Text.ToString();

            string message = "OpenWin_Show_GeneRelatedToOMIM();";
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
        }

        protected void RadTabStrip_TabClick(object sender, RadTabStripEventArgs e)
            {
                lbl_err.Text = null;
                lbl_err_allele.Text = null;
                lbl_err_chr.Text = null;
                lbl_err_clinvar.Text = null;
                lbl_err_effect.Text = null;
                lbl_err_freq.Text = null;
                lbl_err_gene.Text = null;
                lbl_err_hpo.Text = null;
                lbl_err_inhrt.Text = null;
                lbl_err_omim.Text = null;
                lbl_err_otherpapi.Text = null;
                lbl_err_panel.Text = null;
                lbl_err_papi.Text = null;
                lbl_err_phatogen.Text = null;
                lbl_err_phen.Text = null;
                lbl_err_score.Text = null;
                lbl_err_zygo.Text = null;
            }

        protected void RB_Preview_SavedFilterItem_Click(object sender, EventArgs e)
        {
            RLB_SavedFilterItem.Items.Clear();

            String connstring = CnnStr;
            SqlConnection conn = new SqlConnection(connstring);
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();

            SqlCommand cmdUIS = new SqlCommand("Sp_GAP_CS_Filter_SelectedItems_Sel", conn);
            cmdUIS.CommandType = CommandType.StoredProcedure;

            cmdUIS.Parameters.Add("@FilterID", SqlDbType.Int);
            cmdUIS.Parameters["@FilterID"].Value = Convert.ToInt32(Session["FilterID_Filter"]);

            SqlDataAdptrCmd.SelectCommand = cmdUIS;
            SqlConnection Conn = new SqlConnection(CnnStr);

            DataTable myDataTable = new DataTable();
            string[] itemStr;

            try
            {
                conn.Open();
                SqlDataAdptrCmd.Fill(myDataTable);

                if (myDataTable.Rows.Count > 0)
                {
                    for (int i = 0; i < myDataTable.Rows.Count; i++)
                    {
                        itemStr = myDataTable.Rows[i]["Item"].ToString().Split('+');
                        string val = itemStr[0];
                        string txt = itemStr[1];
                        if (!String.IsNullOrEmpty(val) && !String.IsNullOrEmpty(txt))
                        {
                            //RadListBoxItem RLBI_SavedFilterItem = new RadListBoxItem(txt, val);
                            //RLB_Sample_SavedFilterItem.ItemTemplate.InstantiateIn(RLBI_SavedFilterItem);
                            //Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                            //lblcond.Text = "C" + firstItem.getLevel().ToString();
                            //lblcond.ToolTip = firstItem.getCondition().Split('+')[1];
                            //RLB_SavedFilterItem.Items.Add(RLBI_SavedFilterItem);
                            RLB_SavedFilterItem.Items.Add(new RadListBoxItem
                            {
                                Value = itemStr[0],
                                Text = itemStr[1]
                            });
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Unable to do SELECT query. Reason: " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }

        protected void RLB_SavedFilterItem_Deleting(object sender, RadListBoxDeletingEventArgs e)
        {
            if (!String.IsNullOrEmpty(RLB_SavedFilterItem.SelectedValue.ToString()))
            {
                String connstring = CnnStr;
                SqlConnection conn = new SqlConnection(connstring);
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();

                SqlCommand cmdUIS = new SqlCommand("Sp_GAP_CS_Filter_SelectedItems_Saved_Del", conn);
                cmdUIS.CommandType = CommandType.StoredProcedure;

                cmdUIS.Parameters.Add("@FilterID", SqlDbType.Int);
                cmdUIS.Parameters.Add("@Item", SqlDbType.NVarChar);

                cmdUIS.Parameters["@FilterID"].Value = Convert.ToInt32(Session["FilterID_Filter"]);
                cmdUIS.Parameters["@Item"].Value = RLB_SavedFilterItem.SelectedValue.ToString() + '+' + RLB_SavedFilterItem.SelectedItem.Text;

                SqlDataAdptrCmd.SelectCommand = cmdUIS;
                SqlConnection Conn = new SqlConnection(CnnStr);

                try
                {
                    conn.Open();
                    cmdUIS.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Unable to do SELECT query. Reason: " + ex.Message);
                }
                finally
                {
                    conn.Close();
                }
            }
        }

        private void RLB_FilterLoaded()
        {
            String connString = CnnStr;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            string selectCommand = "SELECT * FROM Tbl_GAP_CS_Filter_Items where FilterID= " + Session["FilterID_Filter"];

            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                using (SqlCommand cmdSelect = new SqlCommand(selectCommand, conn))
                {
                    SqlDataAdptrCmd.SelectCommand = cmdSelect;
                    DataTable myDataTable = new DataTable();
                    SqlDataAdptrCmd.Fill(myDataTable);

                    if (myDataTable.Rows.Count > 0)
                    {
                        for (int i = 0; i < myDataTable.Rows.Count; i++)
                        {
                            if (!String.IsNullOrEmpty(myDataTable.Rows[i]["Condition"].ToString()))
                            {
                                string condtn = myDataTable.Rows[i]["Condition"].ToString().Split('+')[0];

                                var IsACMG = paramACMGList.Any(w => condtn.Contains(w));

                                RadListBoxItem RLBI = new RadListBoxItem(myDataTable.Rows[i]["Condition"].ToString().Split('+')[1]);
                                RLBI.Value = myDataTable.Rows[i]["Condition"].ToString().Split('+')[0];

                                if (IsACMG)
                                {
                                    RLBI.Style.Add("background-color", "lavender !important");
                                }
                                RLB_Filter.Items.Add(RLBI);
                            }
                        }
                    }
                }
            }
        }

        protected void RBCreatePanelList_Click(object sender, EventArgs e)
        {
            string message = "OpenWin_CreatePanelList();";
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
        }

        protected void RBEditPanelList_Click(object sender, EventArgs e)
        {
            Session["UPanel_Id"] = RCB_UPanel.SelectedValue.ToString();
            // Session["UPanel_Name"] = RCB_UPanel.SelectedItem.Text;

            string message = "OpenWin_EditPanelList();";
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
        }
    }


    class FilterItem
        {
            private int level;
            private int parent;
            private int state;
            private string condition;
            private int result;
            private string mp;

            public int getLevel() { return level; }
            public void setLevel(int value) { level = value; }

            public int getParent() { return parent; }
            public void setParent(int value) { parent = value; }

            public int getState() { return state; }
            public void setState(int value) { state = value; }

            public string getCondition() { return condition; }
            public void setCondition(string value) { condition = value; }

            public int getResult() { return result; }
            public void setResult(int value) { result = value; }

            public string getMP() { return mp; }
            public void setMP(string value) { mp = value; }
        }
    }
