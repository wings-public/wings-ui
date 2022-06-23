using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.GAP.uc
{
    public partial class uc_Variant_Discovery : System.Web.UI.UserControl
    {

        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}

        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_CenterPI.Text = Session["Current_Center"].ToString() + ", " + Session["Current_PI"].ToString();

        }

        //public struct ListCVhoosenChrPositions
        //{
        //    public string Chr;
        //    public string Spos;
        //    public string Epos;

        //    public ListCVhoosenChrPositions(string Chr, string Spos, string Epos)
        //    {
        //        this.Chr = Chr;
        //        this.Spos = Spos;
        //        this.Epos = Epos;
        //    }
        //}


        //public void Population_Coordinates_Add_Remove()
        //{
        //    List<ListCVhoosenChrPositions> myList = new List<ListCVhoosenChrPositions>();
        //    if (RLB_Population_Coordinates.Items.Count > 0)
        //    {
        //        foreach (RadListBoxItem item in RLB_Population_Coordinates.Items)
        //        {
        //            string[] si = item.Value.Split(':');
        //            string ichr = si[0];
        //            string ispos = si[1];
        //            string iepos = si[2];
        //            myList.Add(new ListCVhoosenChrPositions(ichr, ispos, iepos));
        //        }
        //    }
        //    RLB_Population_Coordinates.Items.Clear();
        //    if (myList.Count > 0)
        //    {
        //        for (int i = 0; i <= myList.Count - 1; i++)
        //        {
        //            RadListBoxItem test_old = new RadListBoxItem(myList[i].Chr, myList[i].Chr + ":" + myList[i].Spos + ":" + myList[i].Epos);
        //            Radlisbox_Sample_Population.ItemTemplate.InstantiateIn(test_old);
        //            Label lblchr = (Label)test_old.FindControl("lbl_Sel_population_Chr");
        //            Label lblspos = (Label)test_old.FindControl("lbl_Sel_population_SPos");
        //            Label lblepos = (Label)test_old.FindControl("lbl_Sel_population_EPos");
        //            lblchr.Text = myList[i].Chr;
        //            lblspos.Text = myList[i].Spos;
        //            lblepos.Text = myList[i].Epos;
        //            RLB_Population_Coordinates.Items.Add(test_old);
        //        }
        //    }
        //}

        //protected void Btn_Add_TrainingGene_ChrCoordinates_Click(object sender, EventArgs e)
        //{

        //    Boolean chk = false;

        //    List<ListCVhoosenChrPositions> ResList = new List<ListCVhoosenChrPositions>();


        //        if (  (Txt_Population_SPos.Text == "") || ( Int64.Parse(Txt_Population_SPos.Value.ToString()) > Int64.Parse(CB_Population_Chromosome.SelectedValue.ToString())) || (Txt_Population_EPos.Text == "") || (Int64.Parse(Txt_Population_EPos.Value.ToString()) > Int64.Parse(CB_Population_Chromosome.SelectedValue.ToString())))
        //        {
        //            chk = false;
        //            Response.Write("<script>alert('Enter Valid Start/End position');</script>");
        //        }
        //        else
        //        {
        //            chk = true;
        //            ResList.Add(new ListCVhoosenChrPositions(CB_Population_Chromosome.SelectedItem.Text, Txt_Population_SPos.Value.ToString(), Txt_Population_EPos.Value.ToString()));
        //        }


        //    if (chk)
        //    {
        //        Population_Coordinates_Add_Remove();
        //        if (ResList.Count > 0)
        //        {
        //            for (int i = 0; i <= ResList.Count - 1; i++)
        //            {
        //                RadListBoxItem test_old = new RadListBoxItem(ResList[i].Chr, ResList[i].Chr + ":" + ResList[i].Spos + ":" + ResList[i].Epos);
        //                Radlisbox_Sample_Population.ItemTemplate.InstantiateIn(test_old);
        //                Label lblchr = (Label)test_old.FindControl("lbl_Sel_population_Chr");
        //                Label lblspos = (Label)test_old.FindControl("lbl_Sel_population_SPos");
        //                Label lblepos = (Label)test_old.FindControl("lbl_Sel_population_EPos");

        //                lblchr.Text = ResList[i].Chr;
        //                lblspos.Text = ResList[i].Spos;
        //                lblepos.Text = ResList[i].Epos;

        //                RLB_Population_Coordinates.Items.Add(test_old);
        //            }
        //        }
        //        Population_Coordinates_Remove_Duplicates();
        //    }
        //}

        //public void Population_Coordinates_Remove_Duplicates()
        //{
        //    List<ListCVhoosenChrPositions> myList = new List<ListCVhoosenChrPositions>();
        //    List<ListCVhoosenChrPositions> wd_myList = new List<ListCVhoosenChrPositions>();
        //    if (RLB_Population_Coordinates.Items.Count > 0)
        //    {

        //        foreach (RadListBoxItem item in RLB_Population_Coordinates.Items)
        //        {
        //            string[] si = item.Value.Split(':');

        //            string ichr = si[0];
        //            string ispos = si[1];
        //            string iepos = si[2];
        //            myList.Add(new ListCVhoosenChrPositions(ichr, ispos, iepos));

        //        }
        //    }
        //    RLB_Population_Coordinates.Items.Clear();
        //    wd_myList = myList.Distinct().ToList();

        //    if (wd_myList.Count > 0)
        //    {
        //        for (int i = 0; i <= wd_myList.Count - 1; i++)
        //        {
        //            RadListBoxItem test_old = new RadListBoxItem(wd_myList[i].Chr, wd_myList[i].Chr + ":" + wd_myList[i].Spos + ":" + wd_myList[i].Epos );
        //            Radlisbox_Sample_Population.ItemTemplate.InstantiateIn(test_old);
        //            Label lblchr = (Label)test_old.FindControl("lbl_Sel_population_Chr");
        //            Label lblspos = (Label)test_old.FindControl("lbl_Sel_population_SPos");
        //            Label lblepos = (Label)test_old.FindControl("lbl_Sel_population_EPos");
        //            lblchr.Text = wd_myList[i].Chr;
        //            lblspos.Text = wd_myList[i].Spos;
        //            lblepos.Text = wd_myList[i].Epos;
        //            RLB_Population_Coordinates.Items.Add(test_old);
        //        }
        //    }
        //}


        //public struct ListQueryChrPositions
        //{

        //    public string Chr;
        //    public string Spos;
        //    public string Epos;

        //    public ListQueryChrPositions( string Chr, string Spos, string Epos)
        //    {

        //        this.Chr = Chr;
        //        this.Spos = Spos;
        //        this.Epos = Epos;
        //    }
        //}

        protected void Btn_submit_Click(object sender, EventArgs e)
        {
            //List<ListQueryChrPositions> myList = new List<ListQueryChrPositions>();
            //if (RLB_Population_Coordinates.Items.Count > 0)
            //{
            //    foreach (RadListBoxItem item in RLB_Population_Coordinates.Items)
            //    {
            //        string[] si = item.Value.Split(':');
            //        string ichr = si[0];
            //        string ispos = si[1];
            //        string iepos = si[2];
            //        myList.Add(new ListQueryChrPositions(ichr, ispos, iepos));
            //    }
            //}

            //string Query = Newtonsoft.Json.JsonConvert.SerializeObject(myList);

            //    SqlConnection conn = new SqlConnection(CnnStr);

            //    SqlCommand cmd = new SqlCommand("Sp_GAP_Requests_Ins", conn);
            //    cmd.CommandType = CommandType.StoredProcedure;
            //    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            //    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            //    SqlParCol = cmd.Parameters;

            //    SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
            //    SqlParCol.Add(new SqlParameter("@RequestTypeID", SqlDbType.Int));
            //    SqlParCol.Add(new SqlParameter("@ReferenceBuildID", SqlDbType.Int));
            //    SqlParCol.Add(new SqlParameter("@RequestDesc", SqlDbType.VarChar));
            //    SqlParCol.Add(new SqlParameter("@RequestParameter", SqlDbType.VarChar));

            //    SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
            //    SqlParCol["@RequestTypeID"].Value = 1;
            //    SqlParCol["@ReferenceBuildID"].Value = DDL_GenomeBuild.SelectedValue;
            //    SqlParCol["@RequestDesc"].Value = txt_RequestDesc.Text;
            //    SqlParCol["@RequestParameter"].Value = Query;

            //try
            //    {
            //        cmd.Connection.Open();
            //        cmd.ExecuteNonQuery();
            //        cmd.Connection.Close();
            //    }
            //    catch (Exception ex)
            //    {
            //        Label lblError = new Label();
            //        lblError.Text = "Unable to insert Rerquest. Reason: " + ex.Message;
            //        lblError.ForeColor = System.Drawing.Color.Red;

            //    }


            //Response.Redirect("Requests.aspx");


        }





    }
}