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
    public partial class uc_Phenotypes : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion} 


        protected void Page_Init(object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                lbl_Individualid.Text = "Individual: "  + Session["IndividualLocalID"].ToString() + " - "+  Session["IndividualID"].ToString(); 

            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Rebind()
        {
            RG_SelectedHPO.Rebind();
            RG_OMIM_Association.Rebind();
            RG_Gene_Association.Rebind();

        }



        protected void RG_OMIM_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                if (e.CommandName == "ADD_HPO")
                {
                    string SearchOMIM = RCB_SearchOMIM.SelectedValue.ToString();

                    SqlConnection conn = new SqlConnection(CnnStr);
                    conn.Open();

                    string HpoID = item.GetDataKeyValue("HPOID").ToString();
                    SqlCommand Cmd = new SqlCommand("Sp_PhenBook_Individual_HPO_OMIM_Ins", new SqlConnection(CnnStr));
                    Cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = Cmd.Parameters;
                    SqlParCol.Add(new SqlParameter("@IndividualID", SqlDbType.BigInt));
                    SqlParCol.Add(new SqlParameter("@HPOID", SqlDbType.NVarChar, 10));
                    SqlParCol.Add(new SqlParameter("@HPO_Status", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@OMIMID", SqlDbType.NVarChar, 11));
                    SqlParCol.Add(new SqlParameter("@HostID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@Success", SqlDbType.NVarChar, -1));
                    SqlParCol["@IndividualID"].Value = Session["IndividualID"].ToString();
                    SqlParCol["@HPOID"].Value = HpoID;
                    SqlParCol["@HPO_Status"].Value = 1;
                    SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
                    SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
                    SqlParCol["@OMIMID"].Value = SearchOMIM; // by OMIM
                    SqlParCol["@HostID"].Value = Session["HostID"];
                    Cmd.Parameters["@Success"].Direction = ParameterDirection.Output;

                    try
                    {
                        Cmd.Connection.Open();
                        Cmd.ExecuteNonQuery();
                        if (!Cmd.Parameters["@Success"].Value.Equals("Success"))
                        {
                            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>"+ Cmd.Parameters["@Success"].Value.ToString() + "</b><br />');", true);
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b> HPO is added!!</b><br />');", true);
                            ImageButton imgsp = (ImageButton)item.FindControl("ADD_HPO");
                            imgsp.ImageUrl = "/img/icon/icon_Add_min_Selected.png";
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
            Rebind();

        }

        protected void RG_Gene_ItemCommand(object sender, GridCommandEventArgs e)
        {
          

                if (e.Item is GridDataItem)
            {
                if (e.CommandName == "ADD_HPO")
                {
                    string SearchGene = RCB_SearchGene.Text;

                    SqlConnection conn = new SqlConnection(CnnStr);
                    conn.Open();

                    GridDataItem item = (GridDataItem)e.Item;

                    string HpoID = item.GetDataKeyValue("HPOID").ToString();
                    SqlCommand Cmd = new SqlCommand("Sp_PhenBook_Individual_HPO_Gene_Ins", new SqlConnection(CnnStr));
                    Cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = Cmd.Parameters;
                    SqlParCol.Add(new SqlParameter("@IndividualID", SqlDbType.BigInt));
                    SqlParCol.Add(new SqlParameter("@HPOID", SqlDbType.NVarChar, 10));
                    SqlParCol.Add(new SqlParameter("@HPO_Status", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@GENE_Symbole", SqlDbType.NVarChar, -1));
                    SqlParCol.Add(new SqlParameter("@HostID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@Success", SqlDbType.NVarChar, -1));
                    SqlParCol["@IndividualID"].Value = Session["IndividualID"].ToString();
                    SqlParCol["@HPOID"].Value = HpoID;
                    SqlParCol["@HPO_Status"].Value = 1;
                    SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
                    SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
                    SqlParCol["@GENE_Symbole"].Value = SearchGene;
                    SqlParCol["@HostID"].Value = Session["HostID"];
                    Cmd.Parameters["@Success"].Direction = ParameterDirection.Output;

                    try
                    {
                        Cmd.Connection.Open();
                        Cmd.ExecuteNonQuery();
                        if (!Cmd.Parameters["@Success"].Value.Equals("Success"))
                        {
                            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>"+ Cmd.Parameters["@Success"].Value.ToString() + "!!</b><br />');", true);

                        }
                        else if(Cmd.Parameters["@Success"].Value.Equals("Success"))
                        {
                            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b> HPOID is added!!</b><br />');", true);
                            ImageButton imgsp = (ImageButton)item.FindControl("ADD_HPO");
                            imgsp.ImageUrl = "/img/icon/icon_Add_min_Selected.png";

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



            Rebind();
        }

        protected void RG_SelectedHPO_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;

                GridDataItem dataItem = e.Item as GridDataItem;

                RadSlider SeverityVal = (RadSlider)item.FindControl("RS_Severity");
                HiddenField hdnseverityval = (HiddenField)item.FindControl("hdn_severityvaforshow");
                SeverityVal.SelectedValue = hdnseverityval.Value;

                LinkButton HPOID_LB = (LinkButton)item.FindControl("lbn_HPOID");
                string Txt_HPO = HPOID_LB.Text.ToString();


                string URL = "https://hpo.jax.org/app/browse/term/" + Txt_HPO;
                HPOID_LB.Attributes.Add("href", URL);
                HPOID_LB.Attributes.Add("target", "_blank");


                Label HpoId = (Label)item.FindControl("txt_HPOID");
                Label HpoName = (Label)item.FindControl("txt_HPO_Name");
                Label HpoStatus = (Label)item.FindControl("txt_HPO_Status");
                HiddenField hdnsp = (HiddenField)item.FindControl("hdn_HPO_Status");
                string sp = hdnsp.Value.ToString();
                ImageButton imgsp_yes = (ImageButton)item.FindControl("AA_yes");
                ImageButton imgsp_no = (ImageButton)item.FindControl("AA_no");
                ImageButton imgsp_na = (ImageButton)item.FindControl("AA_na");

                //ImageButton imgsp = (ImageButton)item.FindControl("imgbtn_HPO_Status");
                switch (sp)
                {
                    case "1":
                        HpoStatus.Attributes.CssStyle.Add("background-color", "#0CA29C !important");
                        HpoStatus.Attributes.CssStyle.Add("border-bottom-left-radius", " 10px !important");
                        HpoStatus.Attributes.CssStyle.Add("border-top-left-radius", " 10px !important");
                        HpoStatus.Attributes.CssStyle.Add("border-top-right-radius", " 10px !important");
                        HpoStatus.Attributes.CssStyle.Add("border-bottom-right-radius", " 10px !important");
                        HpoStatus.Attributes.CssStyle.Add("padding", " 5px !important");
                        HpoStatus.Attributes.CssStyle.Add("cursor", "pointer");
                        HpoStatus.ToolTip = "Seen";
                        imgsp_yes.ImageUrl = "/img/icon/icon_test_yes_selected_15.png";

                        break;
                    case "0":

                        HpoStatus.Attributes.CssStyle.Add("background-color", "#f78f8f !important");
                        HpoStatus.Attributes.CssStyle.Add("border-bottom-left-radius", " 10px !important");
                        HpoStatus.Attributes.CssStyle.Add("border-top-left-radius", " 10px !important");
                        HpoStatus.Attributes.CssStyle.Add("border-top-right-radius", " 10px !important");
                        HpoStatus.Attributes.CssStyle.Add("border-bottom-right-radius", " 10px !important");
                        HpoStatus.Attributes.CssStyle.Add("padding", " 5px !important");
                        HpoStatus.Attributes.CssStyle.Add("cursor", "pointer");
                        HpoStatus.ToolTip = "Not Seen";
                        imgsp_no.ImageUrl = "/img/icon/icon_test_no_selected.png";
                        break;
                    case "2":
                        //imgsp.ImageUrl = "/img/icon/icon_NA.png";
                        //imgsp.ToolTip = "Not Applicable";
                        HpoStatus.Attributes.CssStyle.Add("background-color", "#6EB4E3 !important");
                        HpoStatus.Attributes.CssStyle.Add("border-bottom-left-radius", " 10px !important");
                        HpoStatus.Attributes.CssStyle.Add("border-top-left-radius", " 10px !important");
                        HpoStatus.Attributes.CssStyle.Add("border-top-right-radius", " 10px !important");
                        HpoStatus.Attributes.CssStyle.Add("border-bottom-right-radius", " 10px !important");
                        HpoStatus.Attributes.CssStyle.Add("padding", " 5px !important");
                        HpoStatus.Attributes.CssStyle.Add("cursor", "pointer");
                        HpoStatus.ToolTip = "Not Applicable";
                        imgsp_na.ImageUrl = "/img/icon/icon_test_NA_selected.png";
                        break;
                }

                Label gene_count = (Label)item.FindControl("Gene_count");
                Label omim_count = (Label)item.FindControl("OMIM_count");

                if(gene_count.Text.Length == 0)
                {
                    gene_count.Visible = false;
                }
                if (omim_count.Text.Length == 0)
                {
                    omim_count.Visible = false;
                }


                //var Range_Y = Enumerable.Range(0, 100);
                //RadComboBox DDL_Onset_Y = (RadComboBox)item.FindControl("tttt");
                ////  DDL_Onset_Y.DataTextField = "Onset_Month";
                //DDL_Onset_Y.DataSource = Range_Y;
                //DDL_Onset_Y.DataBind();

                //  var Range_M = Enumerable.Range(0, 12);
                //  RadComboBox DDL_Onset_M = (RadComboBox)item.FindControl("DDL_Onset_month");
                ////  DDL_Onset_Y.DataValueField = "Onset_Month";
                ////  DDL_Onset_Y.DataTextField = "Onset_Month";
                //  DDL_Onset_M.DataSource = Range_M.ToString();
                // DDL_Onset_M.DataBind();

            }

        }

        protected void RG_SelectedHPO_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                if (e.CommandName == "SelYes" || e.CommandName == "SelNo" || e.CommandName == "SelUnkonwn")
                {
                    SqlConnection conn = new SqlConnection(CnnStr);
                    conn.Open();
                    int HpoStatus = 0;

                    GridDataItem item = (GridDataItem)e.Item;


                    if (e.CommandName == "SelYes")
                    {
                        HpoStatus = 1;
                    }
                    if (e.CommandName == "SelNo")
                    {
                        HpoStatus = 0;
                    }
                    if (e.CommandName == "SelUnkonwn")
                    {
                        HpoStatus = 2;
                    }

                    ImageButton imgspNA = (ImageButton)item.FindControl("AA_na");
                    ImageButton imgsp = (ImageButton)item.FindControl("AA_yes");
                    ImageButton imgspNO = (ImageButton)item.FindControl("AA_no");

                    string HpoID = item.GetDataKeyValue("HPOID").ToString();

                    RadSlider hdnseverityval = (RadSlider)item.FindControl("RS_Severity");

                    SqlCommand Cmd = new SqlCommand("Sp_PhenBook_Individual_HPOs_Upd", new SqlConnection(CnnStr));
                    Cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = Cmd.Parameters;
                    SqlParCol.Add(new SqlParameter("@IndividualID", SqlDbType.BigInt));
                    SqlParCol.Add(new SqlParameter("@HPOID", SqlDbType.NVarChar, 10));
                    SqlParCol.Add(new SqlParameter("@HPO_Status", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@Onset_Year", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@Onset_Month", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@HPO_Severity", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@UpdateType", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@HostID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@Success", SqlDbType.NVarChar, -1));
                    SqlParCol["@IndividualID"].Value = Session["IndividualID"].ToString();
                    SqlParCol["@HPOID"].Value = HpoID;
                    SqlParCol["@HPO_Status"].Value = HpoStatus;
                    SqlParCol["@Onset_Year"].Value = DBNull.Value;
                    SqlParCol["@Onset_Month"].Value = DBNull.Value;
                    SqlParCol["@HPO_Severity"].Value = hdnseverityval.Value;
                    SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
                    SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
                    SqlParCol["@UpdateType"].Value = 0;
                    SqlParCol["@HostID"].Value = Session["HostID"];
                    Cmd.Parameters["@Success"].Direction = ParameterDirection.Output;


                    try
                    {
                        Cmd.Connection.Open();
                        Cmd.ExecuteNonQuery();
                        if (!Cmd.Parameters["@Success"].Value.Equals("Success"))
                        {
                            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>" + Cmd.Parameters["@Success"].Value.ToString() + "</b><br />');", true);
                        }
                        Cmd.Connection.Close();
                    }
                    catch (Exception ex)
                    {
                        Label lblError = new Label();
                        lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                        lblError.ForeColor = System.Drawing.Color.Red;
                    }
                    Rebind();

                }

                if (e.CommandName == "Delete")
                {
                    GridDataItem item = (GridDataItem)e.Item;
                    string HpoID = item.GetDataKeyValue("HPOID").ToString().Trim();
                    string HpoStatus = item.GetDataKeyValue("HPO_Status").ToString().Trim();

                    SqlCommand Cmd = new SqlCommand("Sp_PhenBook_Individual_HPOs_Del", new SqlConnection(CnnStr));
                    Cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = Cmd.Parameters;
                    SqlParCol.Add(new SqlParameter("@IndividualID", SqlDbType.BigInt));
                    SqlParCol.Add(new SqlParameter("@HPOID", SqlDbType.NVarChar, 10));
                    SqlParCol.Add(new SqlParameter("@HPO_Status", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@HostID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@Success", SqlDbType.NVarChar, -1));
                    SqlParCol["@IndividualID"].Value = Session["IndividualID"].ToString();
                    SqlParCol["@HPOID"].Value = HpoID;
                    SqlParCol["@HPO_Status"].Value = HpoStatus;
                    SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
                    SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
                    SqlParCol["@HostID"].Value = Session["HostID"];
                    Cmd.Parameters["@Success"].Direction = ParameterDirection.Output;

                    try
                    {
                        Cmd.Connection.Open();
                        Cmd.ExecuteNonQuery();
                        if (!Cmd.Parameters["@Success"].Value.Equals("Success"))
                        {
                            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>" + Cmd.Parameters["@Success"].Value.ToString() + "</b><br />');", true);
                        }
                        Cmd.Connection.Close();
                    }
                    catch (Exception ex)
                    {
                        Label lblError = new Label();
                        lblError.Text = "Unable to update User. Reason: " + ex.Message;
                        lblError.ForeColor = System.Drawing.Color.Red;
                        e.Canceled = true;
                    }

                    Rebind();

                }

                if (e.CommandName == "GoToHPO_OMIM")
                {
                    GridDataItem item = (GridDataItem)e.Item;

                    string HPOID = item.GetDataKeyValue("HPOID").ToString();

                    Session["PhenBook_popUp_HPO"] = HPOID;

                    string message = "OpenWin_HPO_OMIM();";
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);

                }

                if (e.CommandName == "GoToHPO_Gene")
                {
                    GridDataItem item = (GridDataItem)e.Item;

                    string HPOID = item.GetDataKeyValue("HPOID").ToString();

                    Session["PhenBook_popUp_HPO"] = HPOID;

                    string message = "OpenWin_HPO_Gene();";
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);

                }

                if (e.CommandName == "ChangeSeverity")
                {
                    int HpoSeverity = Int32.Parse(hdn_severityval.Value.ToString());
                    int HpoStatus = Int32.Parse(hdn_HpoStatus.Value.ToString());

                    SqlCommand Cmd = new SqlCommand("Sp_PhenBook_Individual_HPOs_Upd", new SqlConnection(CnnStr));
                    Cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = Cmd.Parameters;
                    SqlParCol.Add(new SqlParameter("@IndividualID", SqlDbType.BigInt));
                    SqlParCol.Add(new SqlParameter("@HPOID", SqlDbType.VarChar, 10));
                    SqlParCol.Add(new SqlParameter("@HPO_Status", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@Onset_Year", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@Onset_Month", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@HPO_Severity", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@UpdateType", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@HostID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@Success", SqlDbType.NVarChar, -1));
                    SqlParCol["@IndividualID"].Value = Session["IndividualID"].ToString();
                    SqlParCol["@HPOID"].Value = hdn_Hpoid.Value;
                    SqlParCol["@HPO_Status"].Value = HpoStatus;
                    SqlParCol["@Onset_Year"].Value = DBNull.Value;
                    SqlParCol["@Onset_Month"].Value = DBNull.Value;
                    SqlParCol["@HPO_Severity"].Value = HpoSeverity;
                    SqlParCol["@UserID"].Value = Session["WiNGSMasterID"].ToString();
                    SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
                    SqlParCol["@UpdateType"].Value = 1; // update Severity
                    SqlParCol["@HostID"].Value = Session["HostID"];
                    Cmd.Parameters["@Success"].Direction = ParameterDirection.Output;

                    try
                    {
                        Cmd.Connection.Open();
                        Cmd.ExecuteNonQuery();
                        if (!Cmd.Parameters["@Success"].Value.Equals("Success"))
                        {
                            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", "alert('uuuuu')", true); // @"radalert(' < br /><b>" + Cmd.Parameters["@Success"].Value.ToString() + "</b><br />');"
                        }
                        Cmd.Connection.Close();

                    }
                    catch (Exception ex)
                    {
                        Label lblError = new Label();
                        lblError.Text = "Unable to Update. Reason: " + ex.Message;
                        lblError.ForeColor = System.Drawing.Color.Red;
                    }


                    RG_SelectedHPO.Rebind();

                }


                if (e.CommandName == "ChangeOnsetYear")
                {
                    int Onset_Year = Int32.Parse(hdn_Onset_Year.Value.ToString());

                    SqlCommand Cmd = new SqlCommand("Sp_PhenBook_Individual_HPOs_Upd", new SqlConnection(CnnStr));
                    Cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = Cmd.Parameters;
                    SqlParCol.Add(new SqlParameter("@IndividualID", SqlDbType.BigInt));
                    SqlParCol.Add(new SqlParameter("@HPOID", SqlDbType.VarChar, 10));
                    SqlParCol.Add(new SqlParameter("@HPO_Status", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@Onset_Year", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@Onset_Month", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@HPO_Severity", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@UpdateType", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@HostID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@Success", SqlDbType.NVarChar, -1));

                    SqlParCol["@IndividualID"].Value = Session["IndividualID"].ToString();
                    SqlParCol["@HPOID"].Value = hdn_Hpoid.Value;
                    SqlParCol["@Onset_Year"].Value = Onset_Year;
                    SqlParCol["@Onset_Month"].Value = DBNull.Value;
                    SqlParCol["@HPO_Status"].Value = DBNull.Value;
                    SqlParCol["@HPO_Severity"].Value = DBNull.Value;
                    SqlParCol["@UserID"].Value = Session["WiNGSMasterID"].ToString();
                    SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
                    SqlParCol["@UpdateType"].Value = 2; // Update OnsetYear
                    SqlParCol["@HostID"].Value = Session["HostID"];
                    Cmd.Parameters["@Success"].Direction = ParameterDirection.Output;

                    try
                    {
                        Cmd.Connection.Open();
                        Cmd.ExecuteNonQuery();
                        if (!Cmd.Parameters["@Success"].Value.Equals("Success"))
                        {
                            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>" + Cmd.Parameters["@Success"].Value.ToString() + "</b><br />');", true);
                        }
                        Cmd.Connection.Close();

                    }
                    catch (Exception ex)
                    {
                        Label lblError = new Label();
                        lblError.Text = "Unable to Update. Reason: " + ex.Message;
                        lblError.ForeColor = System.Drawing.Color.Red;
                    }
                    RG_SelectedHPO.Rebind();

                }



                if (e.CommandName == "ChangeOnsetMonth")
                {
                    int Onset_month = Int32.Parse(hdn_Onset_Month.Value.ToString());

                    SqlCommand Cmd = new SqlCommand("Sp_PhenBook_Individual_HPOs_Upd", new SqlConnection(CnnStr));
                    Cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = Cmd.Parameters;
                    SqlParCol.Add(new SqlParameter("@IndividualID", SqlDbType.BigInt));
                    SqlParCol.Add(new SqlParameter("@HPOID", SqlDbType.VarChar, 10));
                    SqlParCol.Add(new SqlParameter("@HPO_Status", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@Onset_Year", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@Onset_Month", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@HPO_Severity", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@UpdateType", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@HostID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@Success", SqlDbType.NVarChar, -1));

                    SqlParCol["@IndividualID"].Value = Session["IndividualID"].ToString();
                    SqlParCol["@HPOID"].Value = hdn_Hpoid.Value;
                    SqlParCol["@Onset_Year"].Value = DBNull.Value;
                    SqlParCol["@Onset_Month"].Value = Onset_month;
                    SqlParCol["@HPO_Status"].Value = DBNull.Value;
                    SqlParCol["@HPO_Severity"].Value = DBNull.Value;
                    SqlParCol["@UserID"].Value = Session["WiNGSMasterID"].ToString();
                    SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
                    SqlParCol["@UpdateType"].Value = 3; // Update Onsetmonth
                    SqlParCol["@HostID"].Value = Session["HostID"];
                    Cmd.Parameters["@Success"].Direction = ParameterDirection.Output;


                    try
                    {
                        Cmd.Connection.Open();
                        Cmd.ExecuteNonQuery();
                        if (!Cmd.Parameters["@Success"].Value.Equals("Success"))
                        {
                            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>" + Cmd.Parameters["@Success"].Value.ToString() + "</b><br />');", true);
                        }
                        Cmd.Connection.Close();

                    }
                    catch (Exception ex)
                    {
                        Label lblError = new Label();
                        lblError.Text = "Unable to Update. Reason: " + ex.Message;
                        lblError.ForeColor = System.Drawing.Color.Red;
                    }
                    RG_SelectedHPO.Rebind();

                }

                if (e.CommandName == "end")
                {
                    HiddenField row = (HiddenField)FindControl("hdn_RowID_In_EditMODE");
                    int r = Convert.ToInt16(row.Value.ToString());
                    RG_SelectedHPO.MasterTableView.Items[r].Edit = false; // Set in EditMode 
                }
                if (e.CommandName == "Onset_EditMode")
                {
                    (RG_SelectedHPO.MasterTableView.GetColumn("Onset") as GridTemplateColumn).ReadOnly = false;
                    HiddenField row = (HiddenField)FindControl("hdn_RowID_In_EditMODE");
                    int r = Convert.ToInt16(row.Value.ToString());
                    RG_SelectedHPO.MasterTableView.Items[r].Edit = true; // Set in EditMode 

                }


            }
        }


        protected void btn_addhpofromgraph_Click(object sender, EventArgs e)
        {
            if (!hd_SelectedHPOfromGraph.Value.Equals(""))
            {

                SqlCommand Cmd = new SqlCommand("Sp_PhenBook_Individual_HPOs_Ins", new SqlConnection(CnnStr));
                Cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlParameterCollection SqlParCol = default(SqlParameterCollection);

                SqlParCol = Cmd.Parameters;
                SqlParCol.Add(new SqlParameter("@IndividualID", SqlDbType.BigInt));
                SqlParCol.Add(new SqlParameter("@HPOID", SqlDbType.NVarChar, 10));
                SqlParCol.Add(new SqlParameter("@HPO_Status", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@HostID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@Success", SqlDbType.NVarChar, -1));
                SqlParCol["@IndividualID"].Value = Session["IndividualID"].ToString();
                SqlParCol["@HPOID"].Value = hd_SelectedHPOfromGraph.Value.ToString();
                SqlParCol["@HPO_Status"].Value = 1;
                SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
                SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
                SqlParCol["@HostID"].Value = Session["HostID"];
                Cmd.Parameters["@Success"].Direction = ParameterDirection.Output;


                try
                {
                    Cmd.Connection.Open();
                    Cmd.ExecuteNonQuery();
                    if (!Cmd.Parameters["@Success"].Value.Equals("Success"))
                    {
                        ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>" + Cmd.Parameters["@Success"].Value.ToString() + "</b><br />');", true);
                    }
                    else
                    if (Cmd.Parameters["@Success"].Value.Equals("Success"))
                    {
                        ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b> HPOID is added!!</b><br />');", true);
                    }
                    Cmd.Connection.Close();
                }
                catch (Exception ex)
                {
                    Label lblError = new Label();
                    lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                    lblError.ForeColor = System.Drawing.Color.Red;
                }
                Rebind();
            }
            else
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Please select a HPO term!!</b><br />');", true);

        }



        protected void RG_OMIM_Association_ItemCommand(object sender, GridCommandEventArgs e)
        {

            

            if (e.CommandName == "GoToIndiHPO_OMIM_Outof_AllHPOs")
            {
                GridDataItem item = (GridDataItem)e.Item;

                string OMIMID = item.GetDataKeyValue("OMIMID").ToString();

                Session["PhenBook_popUp_OMIM"] = OMIMID;

                string message = "OpenWin_IndivHpo_OMIM_outof_AllHPO();";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);

            }

            if (e.CommandName == "GoToOMIM_HPO")
            {
                GridDataItem item = (GridDataItem)e.Item;

                string OMIMID = item.GetDataKeyValue("OMIMID").ToString();

                Session["PhenBook_popUp_OMIM"] = OMIMID;

                string message = "OpenWin_OMIM_HPO();";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);

            }

            if (e.CommandName == "GoToOMIM_Gene")
            {
                GridDataItem item = (GridDataItem)e.Item;

                string OMIMID = item.GetDataKeyValue("OMIMID").ToString();

                Session["PhenBook_popUp_OMIM"] = OMIMID;

                string message = "OpenWin_OMIM_Gene();";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);

            }
        }

        protected void RG_OMIM_Association_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                LinkButton OMIM_LB = (LinkButton)item.FindControl("lbn_OMIMID");
                string Txt_Omim = OMIM_LB.Text.ToString();
                 
                int startIndex = 5;
                int length = 6;
                String substring = Txt_Omim.Substring(startIndex, length);
                string URL = "https://omim.org/entry/" + substring;
                OMIM_LB.Attributes.Add("href", URL);
                OMIM_LB.Attributes.Add("target", "_blank");

                Label gene_count = (Label)item.FindControl("Gene_count");
                Label hpo_count = (Label)item.FindControl("Hpo_count");

                if (gene_count.Text.Length == 0)
                {
                    gene_count.Visible = false;
                }
                if (hpo_count.Text.Length == 0)
                {
                    hpo_count.Visible = false;
                }
            }
        }

        protected void RG_Gene_Association_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "GoToIndiHPO_Gene_Outof_AllHPOs")
            {
                GridDataItem item = (GridDataItem)e.Item;

                string Gene_Symbol = item.GetDataKeyValue("Gene_Symbol").ToString();

                Session["PhenBook_popUp_Gene"] = Gene_Symbol;

                string message = "OpenWin_IndivHpo_Gene_outof_AllHPO();";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);

            }
            if (e.CommandName == "GoToGene_HPO")
            {
                GridDataItem item = (GridDataItem)e.Item;

                string Gene_Symbol = item.GetDataKeyValue("Gene_Symbol").ToString();

                Session["PhenBook_popUp_Gene"] = Gene_Symbol;

                string message = "OpenWin_Gene_HPO();";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);

            }
          

            if (e.CommandName == "GoToGene_OMIM")
            {
                GridDataItem item = (GridDataItem)e.Item;

                string Gene_Symbol = item.GetDataKeyValue("Gene_Symbol").ToString();

                Session["PhenBook_popUp_Gene"] = Gene_Symbol;

                string message = "OpenWin_Gene_OMIM();";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);

            }
        }

        protected void RG_Gene_Association_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                LinkButton Gene_LB = (LinkButton)item.FindControl("lbn_Gene_Symbol");
                string Txt_Gene = Gene_LB.Text.ToString();

                string URL = "https://www.genecards.org/cgi-bin/carddisp.pl?gene=" + Txt_Gene;
                Gene_LB.Attributes.Add("href", URL);
                Gene_LB.Attributes.Add("target", "_blank");

                Label omim_count = (Label)item.FindControl("OMIM_count");
                Label hpo_count = (Label)item.FindControl("Hpo_count");

                if (omim_count.Text.Length == 0)
                {
                    omim_count.Visible = false;
                }
                if (hpo_count.Text.Length == 0)
                {
                    hpo_count.Visible = false;
                }
            }

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
           


                 if (!RCB_SearchHPO.SelectedValue.Equals(""))
            {

                SqlCommand Cmd = new SqlCommand("Sp_PhenBook_Individual_HPOs_Ins", new SqlConnection(CnnStr));
                Cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlParameterCollection SqlParCol = default(SqlParameterCollection);

                SqlParCol = Cmd.Parameters;
                SqlParCol.Add(new SqlParameter("@IndividualID", SqlDbType.BigInt));
                SqlParCol.Add(new SqlParameter("@HPOID", SqlDbType.NVarChar, 10));
                SqlParCol.Add(new SqlParameter("@HPO_Status", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@HostID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@Success", SqlDbType.NVarChar, -1));
                SqlParCol["@IndividualID"].Value = Session["IndividualID"].ToString();
                SqlParCol["@HPOID"].Value = RCB_SearchHPO.SelectedValue.ToString();
                SqlParCol["@HPO_Status"].Value = 1;
                SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
                SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
                SqlParCol["@HostID"].Value = Session["HostID"];
                Cmd.Parameters["@Success"].Direction = ParameterDirection.Output;


                try
                {
                    Cmd.Connection.Open();
                    Cmd.ExecuteNonQuery();
                    if (!Cmd.Parameters["@Success"].Value.Equals("Success"))
                    {
                        ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>" + Cmd.Parameters["@Success"].Value.ToString() + "</b><br />');", true);
                    }
                    else
                    if (Cmd.Parameters["@Success"].Value.Equals("Success"))
                    {
                        ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b> HPOID is added!!</b><br />');", true);
                    }
                    Cmd.Connection.Close();
                }
                catch (Exception ex)
                {
                    Label lblError = new Label();
                    lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                    lblError.ForeColor = System.Drawing.Color.Red;
                }
                Rebind();
            }
            else
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Please select a HPO term!!</b><br />');", true);

        }

    }
}