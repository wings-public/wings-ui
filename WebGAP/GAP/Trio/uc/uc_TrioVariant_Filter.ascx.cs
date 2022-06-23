using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Windows.Threading;
using Telerik.Web.UI;
using WebGAP.GAP.Model;

namespace WebGAP.GAP.Trio.uc
{

    public partial class uc_TrioVariant_Filter : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        static string CnnStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}


        static Type csType;
        static Page csPage;

        /* ItemIds: the list of string contains all required info(ID, Table name/if a table is assigned to the element otherwise it can be NULL , 
        Text, OperationId, MongoDB field name, WhereClause/it can be NULL , Value, Mongo formula) of created item(it can be RadNumericTextBox, RadTextBox, RadAutoCompleteBox, RadComboBox, 
                                                                             RadComboBoxMultiSelected, RadCheckBoxList or RadComboBoxWithRadTextBox)
        */
        List<string> ItemIds;

        /* List of all added condition which contains its level(integer) and condition(string) */
        List<Tuple<int, string>> listOfCond = new List<Tuple<int, string>>();

        /* List of filter items, instance of the class "FilterItems" */
        List<FilterItems> filterItemList = new List<FilterItems>();

        /* By selecting each level the data related to the variable "SelectedConditionValue"(as the parent level) 
           and all childeren level will be deleted. e.q. assume 5 levels of condition exists, if the user want to delete the level 3, level 4 and 5 will be deleted as well.
        */
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

        protected void Page_Load(object sender, EventArgs e)
        {


            if (String.IsNullOrEmpty(Session["WiNGSMasterID"].ToString()))
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Session is expired!</b>'); height=120,width=250", true);
                Response.Redirect(String.Format("/Main.aspx"), false);
                return;
            }

            csType = this.GetType();
            csPage = this.Page;
            lbl_sampleID.Text = Session["TriolocalID"].ToString();// + " | " + Session["FileID_Filter"].ToString() + "(Local Id: " + getLocalID() + ")";

            ItemIds = new List<string>();

            Session["ChrIncluded"] = "null";

            if (!IsPostBack)
            {
                Session["baseCount"] = null;

                string InWhichOneExists = Session["InWhichOneExists"].ToString();
                string exists_Proband = InWhichOneExists.Substring(0, 1);
                string exists_Control1 = InWhichOneExists.Substring(1, 1);
                string exists_Control2 = InWhichOneExists.Substring(2, 1);

                string P = Session["Trio_ProbandGender"].ToString();
                string C1 = Session["Trio_Control1Gender"].ToString();
                string C2 = Session["Trio_Control2Gender"].ToString();

                if (exists_Proband == "2")
                {
                    img_Proband.Visible = true;
                    img_Proband.Src = ((P == "0") ? "/img/icon/cs_Yes_Female.png" : "/img/icon/cs_Yes_Male.png");
                    lbl_Proband.Text = Session["Trio_ProbandlocalID"].ToString();
                }
                if (exists_Control1 == "2")
                {
                    img_C1.Visible = true;
                    img_C1.Src = ((C1 == "0") ? "/img/icon/cs_Yes_Female.png" : "/img/icon/cs_Yes_Male.png");
                    lbl_C1.Text = Session["Trio_Control1localID"].ToString();
                }
                if (exists_Control2 == "2")
                {
                    img_C2.Visible = true;
                    img_C2.Src = ((C2 == "0") ? "/img/icon/cs_Yes_Female.png" : "/img/icon/cs_Yes_Male.png");
                    lbl_C2.Text = Session["Trio_Control2localID"].ToString();
                }

                if (exists_Proband != "2" && exists_Control1 != "2" && exists_Control2 != "2")
                {
                    switch (P)
                    {
                        case "0":
                            if (exists_Proband == "0") { img_Proband.Visible = true; img_Proband.Src = "/img/icon/cs_No_Female.png"; lbl_Proband.Text = Session["Trio_ProbandlocalID"].ToString(); }
                            if (exists_Proband == "1") { img_Proband.Visible = true; img_Proband.Src = "/img/icon/cs_Yes_Female.png"; lbl_Proband.Text = Session["Trio_ProbandlocalID"].ToString(); }
                            break;
                        case "1":
                            if (exists_Proband == "0") { img_Proband.Visible = true; img_Proband.Src = "/img/icon/cs_No_Male.png"; lbl_Proband.Text = Session["Trio_ProbandlocalID"].ToString(); }
                            if (exists_Proband == "1") { img_Proband.Visible = true; img_Proband.Src = "/img/icon/cs_Yes_Male.png"; lbl_Proband.Text = Session["Trio_ProbandlocalID"].ToString(); }
                            break;
                        case "2":
                            if (exists_Proband == "0") { img_Proband.Visible = true; img_Proband.Src = "/img/icon/cs_No_Male.png"; lbl_Proband.Text = Session["Trio_ProbandlocalID"].ToString(); }
                            if (exists_Proband == "1") { img_Proband.Visible = true; img_Proband.Src = "/img/icon/cs_Yes_Male.png"; lbl_Proband.Text = Session["Trio_ProbandlocalID"].ToString(); }


                            break;


                    }
                    switch (C1)
                    {
                        case "0":
                            if (exists_Control1 == "0") { img_C1.Visible = true; img_C1.Src = "/img/icon/cs_No_Female.png"; lbl_C1.Text = Session["Trio_Control1localID"].ToString(); }
                            if (exists_Control1 == "2" || exists_Control1 == "1") { img_C1.Visible = true; img_C1.Src = "/img/icon/cs_Yes_Female.png"; lbl_C1.Text = Session["Trio_Control1localID"].ToString(); }
                            break;
                        case "1":
                            if (exists_Control1 == "0") { img_C1.Visible = true; img_C1.Src = "/img/icon/cs_No_Male.png"; lbl_C1.Text = Session["Trio_Control1localID"].ToString(); }
                            if (exists_Control1 == "1") { img_C1.Visible = true; img_C1.Src = "/img/icon/cs_Yes_Male.png"; lbl_C1.Text = Session["Trio_Control1localID"].ToString(); }
                            break;
                        case "2":
                            if (exists_Control1 == "0") { img_C1.Visible = true; img_C1.Src = "/img/icon/cs_No_Male.png"; lbl_C1.Text = Session["Trio_Control1localID"].ToString(); }
                            if (exists_Control1 == "1") { img_C1.Visible = true; img_C1.Src = "/img/icon/cs_Yes_Male.png"; lbl_C1.Text = Session["Trio_Control1localID"].ToString(); }
                            break;

                    }
                    switch (C2)
                    {
                        case "0":
                            if (exists_Control2 == "0") { img_C2.Visible = true; img_C2.Src = "/img/icon/cs_No_Female.png"; lbl_C2.Text = Session["Trio_Control2localID"].ToString(); }
                            if (exists_Control2 == "2" || exists_Control2 == "1") { img_C2.Visible = true; img_C2.Src = "/img/icon/cs_Yes_Female.png"; lbl_C2.Text = Session["Trio_Control2localID"].ToString(); }
                            break;
                        case "1":
                            if (exists_Control2 == "0") { img_C2.Visible = true; img_C2.Src = "/img/icon/cs_No_Male.png"; lbl_C2.Text = Session["Trio_Control2localID"].ToString(); }
                            if (exists_Control2 == "2" || exists_Control2 == "1") { img_C2.Visible = true; img_C2.Src = "/img/icon/cs_Yes_Male.png"; lbl_C2.Text = Session["Trio_Control2localID"].ToString(); }
                            break;
                        case "2":
                            if (exists_Control2 == "0") { img_C2.Visible = true; img_C2.Src = "/img/icon/cs_No_Male.png"; lbl_C2.Text = Session["Trio_Control2localID"].ToString(); }
                            if (exists_Control2 == "2" || exists_Control2 == "1") { img_C2.Visible = true; img_C2.Src = "/img/icon/cs_Yes_Male.png"; lbl_C2.Text = Session["Trio_Control2localID"].ToString(); }
                            break;

                    }
                }
            }

            /* Total count will be saved in the session "baseCount" */
            if (Session["baseCount"] != null && !String.IsNullOrEmpty(Session["baseCount"].ToString()))
            {
                Session["baseCount"] = Session["Trio_TotalCount"];
                lbl_Root.Text = " (items: " + Session["baseCount"].ToString() + ")";


            }

            if (Session["baseCount"] != null && !String.IsNullOrEmpty(Session["FilterID_Filter"].ToString()))
                FirstItem_Insert();

            /* This part is there to solve an issue related to clicking on tab to show the content correctly*/
            RadTabStripEventArgs args = new RadTabStripEventArgs(RTS_FilterTab.SelectedTab);
            if (args.Tab != null)
            {
                String fcid = ViewState[args.Tab.Text].ToString();
                RadPageView rpvw = (RadPageView)RMP_FItems.FindPageViewByID(args.Tab.Text);
                ItemIds.Clear();
                AddPageView(args.Tab, fcid);
                Session["gotoTabClicked"] = "no";
            }
            else
            {
                BindToDataSet();
                Session["gotoTabClicked"] = "yes";
                RDDL_Parent.Items.Add(new DropDownListItem
                {
                    Value = "0",
                    Text = "0"
                });
                SelectedConditionValue = 0;
            }



        }

        /*Get LocalId related to selected sampleId and centerId*/

        /*Get list of operation (Mongo value and operation)
            $eq	  =
            $lt	  <
            $lte  =<
            $gt	  >
            $gte  >=
            $ne	  != 
         */
        protected Dictionary<string, string> GetOperationPairs()
        {
            String connstring = CnnStr;
            SqlConnection conn = new SqlConnection(connstring);
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand("Sp_Filter_Operation_MongodbNames_Sel", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdptrCmd.SelectCommand = cmd;
            DataTable myDataTable = new DataTable();
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                SqlDataAdptrCmd.Fill(myDataTable);

                List<string> listOprMongodbNames = new List<string>(); //[OperationValues]
                List<string> listOprNames = new List<string>(); //[OperationNames]

                for (int i = 0; i < myDataTable.Rows.Count; i++)
                {
                    listOprMongodbNames.Add(myDataTable.Rows[i]["MongoDBOprNames"].ToString());
                    listOprNames.Add(myDataTable.Rows[i]["OprName"].ToString());
                }

                var oprDict = listOprNames.Zip(listOprMongodbNames, (value, key) => new { value, key })
                                    .ToDictionary(x => x.key, x => x.value);

                return oprDict;
            }
            finally
            {
                conn.Close();
            }


        }

        /* User generates a new filter with param(name and desc). 
         * The data will be stored in table "Tbl_GAP_Filter"
         * Autogenerated filterId will be returned as an output param and stored in the session "FilterID_Filter" */
        protected void AddNewFilter_Click(object sender, EventArgs e)
        {
            RLB_Filter.Items.Clear();

            RPB_NewFilter.CollapseAllItems();

            String connstring = CnnStr;
            using (SqlConnection con = new SqlConnection(CnnStr))
            {
                using (SqlCommand myCMD = new SqlCommand("Sp_GAP_Add_New_Filter", con))
                {

                    myCMD.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    myCMD.Parameters.Add("@userID", SqlDbType.Int);
                    myCMD.Parameters.Add("@filterID", SqlDbType.Int).Direction = ParameterDirection.Output;
                    myCMD.Parameters.Add("@filterName", SqlDbType.VarChar, 50);
                    myCMD.Parameters.Add("@desc", SqlDbType.VarChar, 5000);
                    myCMD.Parameters.Add("@type", SqlDbType.Int);
                    myCMD.Parameters.Add("@AnalysisType", SqlDbType.VarChar, 50);
                    myCMD.Parameters.Add("@BasedOnIndividual", SqlDbType.BigInt);

                    myCMD.Parameters["@userID"].Value = Convert.ToInt32(Session["WiNGSMasterId"]);
                    myCMD.Parameters["@filterName"].Value = txtbox_FilterName.Text;
                    myCMD.Parameters["@desc"].Value = Txt_Desc.Text;
                    myCMD.Parameters["@type"].Value = 1;
                    myCMD.Parameters["@AnalysisType"].Value = 'B';
                    if (RCB_Individuals.SelectedValue.Length > 0)
                    {
                        myCMD.Parameters["@BasedOnIndividual"].Value = RCB_Individuals.SelectedItem.Index;
                        basedonIndividual.Text = "based on: " + RCB_Individuals.SelectedItem.Text;
                        Session["BasedOnIndividual"] = RCB_Individuals.SelectedValue.ToString();
                        basedonIndividual.CssClass = "lblSample";
                    }
                    else
                    {

                        string InWhichOneExists = Session["InWhichOneExists"].ToString();
                        switch (InWhichOneExists)
                        {
                            case "100":
                            case "101":
                            case "111":
                            case "110":
                            case "200":
                                myCMD.Parameters["@BasedOnIndividual"].Value = 0;
                                break;
                            case "010":
                            case "011":
                            case "020":
                                myCMD.Parameters["@BasedOnIndividual"].Value = 1;
                                break;
                            case "001":
                            case "002":
                                myCMD.Parameters["@BasedOnIndividual"].Value = 2;
                                break;


                        }




                    }

                    myCMD.ExecuteNonQuery();

                    Session["FilterID_Filter"] = myCMD.Parameters["@filterID"].Value.ToString();

                    //Task returnedTask = Fetch_Count_Of_DataAsync(lbl_Root);
                    //returnedTask.Wait();
                    if (Session["baseCount"] != null && !String.IsNullOrEmpty(Session["baseCount"].ToString()))
                        lbl_Root.Text = " (items: " + Session["baseCount"].ToString() + ")";
                    else
                    {
                        Fetch_Count_Of_Data();
                        lbl_Root.Text = " (items: " + Session["baseCount"].ToString() + ")";
                    }

                    lbl_added.Text = "Filter added! Now time to choose your items filter";
                    //AddNewFilter.Enabled = false;
                    RDD_FilterSet.SelectedIndex = RDD_FilterSet.Items.Count;
                    RDD_FilterSet.Text = txtbox_FilterName.Text;
                }

                RPB_NewFilter.Enabled = false;
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

            RadPanelItem item = RPB_NewFilter.FindItemByValue("clps");
            item.Expanded = false;
            //item.Enabled = false;

            RPB_NewFilter.Enabled = false;

            RLB_Filter.CssClass = RLB_Filter.CssClass.Replace("disabledDiv", "");
            RDDL_Parent.CssClass = RDDL_Parent.CssClass.Replace("disabledDiv", "");
            btnShow.CssClass = btnShow.CssClass.Replace("disabledDiv", "");
            RLB_Condition.CssClass = RLB_Condition.CssClass.Replace("disabledDiv", "");
            ShowResultCondition.CssClass = ShowResultCondition.CssClass.Replace("disabledDiv", "");
            PanelOrgChart.CssClass = PanelOrgChart.CssClass.Replace("disabledDiv", "");

            leftTabDiv.Attributes.Add("class", leftTabDiv.Attributes["class"].ToString().Replace("disabledDiv", ""));
            Del_RDD_FilterSet.Enabled = true;

        }

        /* A selected row of filter will be deleted on table "Tbl_GAP_Filter" related to selected filterId and current userId.
         * also will be deleted on table "Tbl_Filter_SelectedItems"  related to selected filterId.
         * the required table which is generated in WiNGS_Data_Db will be deleted as well.
         * */
        protected void Del_RDD_FilterSet_Click(object sender, EventArgs e)
        {
            String connstring = CnnStr;
            using (SqlConnection con = new SqlConnection(CnnStr))
            {
                using (SqlCommand myCMD = new SqlCommand("Sp_Filter_FilterSetAndItems_Del", con))
                {
                    myCMD.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    myCMD.Parameters.Add("@FilterID", SqlDbType.Int);
                    myCMD.Parameters.Add("@tblN", SqlDbType.NVarChar,300);


                    myCMD.Parameters["@FilterID"].Value = Convert.ToInt32(Session["FilterID_Filter"].ToString());
                    myCMD.Parameters["@tblN"].Value = Session["WiNGSMasterId"].ToString() + "_" + Session["FilterID_Filter"].ToString() + "_" + Session["TriolocalID"].ToString()+"_"+ Session[""].ToString();

                    myCMD.ExecuteNonQuery();

                    RDD_FilterSet.Items.Clear();
                    RDD_FilterSet.Text = "";
                    RDD_FilterSet.DataBind();
                    RDD_FilterSet.ClearSelection();
                    RLB_Filter.ClearSelection();

                    if (RDD_FilterSet.SelectedIndex > -1)
                    {
                        RDD_FilterSet.SelectedItem.Selected = false;
                    }

                    RLB_Filter.Items.Clear();
                    RLB_Condition.Items.Clear();
                    RDDL_Parent.Items.Clear();


                    RPB_NewFilter.Enabled = true;
                    RadPanelItem item = RPB_NewFilter.FindItemByValue("clps");
                    item.Expanded = true;
                    //item.Enabled = true;

                    RLB_Filter.CssClass = RLB_Filter.CssClass.Replace("disabledDiv", "");
                    RDDL_Parent.CssClass = RDDL_Parent.CssClass.Replace("disabledDiv", "");
                    btnShow.CssClass = btnShow.CssClass.Replace("disabledDiv", "");
                    RLB_Condition.CssClass = RLB_Condition.CssClass.Replace("disabledDiv", "");
                    ShowResultCondition.CssClass = ShowResultCondition.CssClass.Replace("disabledDiv", "");
                    PanelOrgChart.CssClass = PanelOrgChart.CssClass.Replace("disabledDiv", "");

                    TextBox txtbox_FilterName = (TextBox)item.FindControl("txtbox_FilterName");
                    txtbox_FilterName.Text = null;
                    TextBox Txt_Desc = (TextBox)item.FindControl("Txt_Desc");
                    Txt_Desc.Text = null;
                    Label lbl_added = (Label)item.FindControl("lbl_added");
                    lbl_added.Text = null;



                }

            }
        }


        /*By selecting the created filter, new data will be loaded
         Total count will be loaded via the "Fetch_Count_Of_Data" function or the value of the "baseCount" session.
         Conditions used in the filter will be loaded via the "RLB_FilterLoaded" function and displayed on the "List of condition" listbox.
         Related to the specified critera, hierarchy tree will be generated/created.
         A hierarchy tree contains a series of conditions (parent and children).
         Each condition (parent) includes two children (true or false)
         A series of elements is created to add each condition to the tree.
         To add children, a series of elements is created by calling the "AddChildItem" function.
         Every child can be a father when a condition is assigned to him.
         */
        protected void RDD_FilterSet_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            RLB_Filter.CssClass = RLB_Filter.CssClass.Replace("disabledDiv", "");
            PanelOrgChart.CssClass = PanelOrgChart.CssClass.Replace("disabledDiv", "");
            RLB_Condition.CssClass = "disabledDiv";
            RDDL_Parent.CssClass = "disabledDiv";
            btnShow.CssClass = "disabledDiv";
            ShowResultCondition.CssClass = "disabledDiv";
            leftTabDiv.Attributes.Remove("class");

            //leftTabDiv.Attributes.Add("class", leftTabDiv.Attributes["class"].ToString().Replace("disabledDiv", ""));
            Del_RDD_FilterSet.Enabled = true;
            Session["FilterID_Filter"] = RDD_FilterSet.SelectedValue.ToString();


            if (Session["baseCount"] != null && !String.IsNullOrEmpty(Session["baseCount"].ToString()))
                lbl_Root.Text = " (items: " + Session["baseCount"].ToString() + ")";
            else
            {
                Fetch_Count_Of_Data();
                lbl_Root.Text = " (items: " + Session["baseCount"].ToString() + ")";
            }

            RLB_Filter.Items.Clear();
            RLB_Filter.ClearSelection();
            //if (IsValid)
            //{
            RLB_FilterLoaded();


            String connstring = CnnStr;
            SqlConnection conn = new SqlConnection(connstring);
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand("Sp_Filter_SelectedFilterItems_Sel", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdptrCmd.SelectCommand = cmd;
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = cmd.Parameters;

            SqlParCol.Add(new SqlParameter("@FilterID_Filter", SqlDbType.NVarChar, 100));
           SqlParCol.Add(new SqlParameter("@Control_num", SqlDbType.Int));

            SqlParCol["@FilterID_Filter"].Value = Session["FilterID_Filter"];
          cmd.Parameters["@Control_num"].Direction = ParameterDirection.Output;

            DataTable myDataTable = new DataTable();
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                SqlDataAdptrCmd.Fill(myDataTable);

                //-----fetch result from #temp table and copy it in filterItemResultList
                //List<FilterItem> filterItemResultList = new List<FilterItem>();
                RDDL_Parent.Items.Clear();
                RLB_Condition.Items.Clear();

                  RCB_Individuals.Items[Convert.ToInt32(cmd.Parameters["@Control_num"].Value.ToString())].Selected = true;
                Session["basedonIndividual"] = RCB_Individuals.SelectedValue.ToString();
                basedonIndividual.Text = "based on: " + RCB_Individuals.SelectedItem.Text;
                basedonIndividual.CssClass = "lblSample";
                if (myDataTable.Rows.Count > 0)
                {
                    filterItemList.Clear();

                    for (int i = 0; i < myDataTable.Rows.Count; i++)
                    {
                        FilterItems FItem = new FilterItems();

                        FItem.setLevel(Convert.ToInt32(myDataTable.Rows[i]["Level"]));
                        FItem.setType(myDataTable.Rows[i]["Type"].ToString());
                        FItem.setParent(Convert.ToInt32(myDataTable.Rows[i]["Parent"]));
                        string dbCon = myDataTable.Rows[i]["Field"].ToString();
                        if (dbCon != "")
                        {
                            listOfCond.Add(new Tuple<int, string>(Convert.ToInt32(myDataTable.Rows[i]["Level"]), myDataTable.Rows[i]["Condition"].ToString()));
                            FItem.setCondition(myDataTable.Rows[i]["Condition"].ToString());
                            FItem.setField(myDataTable.Rows[i]["Field"].ToString());
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

                    List<FilterItems> ResultPassFailList = new List<FilterItems>();

                    RLB_Condition.Items.Clear();

                    FilterItems firstItem = (from f in filterItemList where f.getParent() == -1 select f).First();
                    var firstUl = new HtmlGenericControl("ul");
                    var firstLi = new HtmlGenericControl("li");
                    firstLi.Attributes.Add("class", "node");

                    var firstdiamondshape = new HtmlGenericControl("div");
                    var firstconditiondiv = new HtmlGenericControl("div");

                    firstLi.Style.Add("margin-left", "19px");

                    firstdiamondshape.Attributes.Add("class", "diamond-shape");
                    firstconditiondiv.Attributes.Add("class", "innernodecontent");
                    firstconditiondiv.Attributes.Add("runat", "server");
                    firstconditiondiv.InnerText = "C" + firstItem.getLevel().ToString();
                    firstconditiondiv.Attributes.Add("title", firstItem.getCondition());


                    if (!String.IsNullOrEmpty(firstItem.getCondition()))
                    {
                        RadListBoxItem RLBI_Condition = new RadListBoxItem(firstItem.getLevel() + " - " + firstItem.getCondition().ToString(), firstItem.getLevel().ToString());
                        RLBI_Condition.Checkable = false;

                        RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                        Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");

                        int strLength = firstItem.getCondition().Length;
                        if (strLength > 10)
                            lblcond.Text = "C" + firstItem.getLevel().ToString() + ": " + firstItem.getCondition().Substring(0, 10) + "...";
                        else
                            lblcond.Text = "C" + firstItem.getLevel().ToString() + ": " + firstItem.getCondition().Substring(0, 5) + "...";

                        lblcond.ToolTip = firstItem.getCondition().ToString();
                        lblcond.Style.Add("padding-left", "20px");

                        CheckBox chkboxResult = (CheckBox)RLB_Condition.FindControl("chkbox_Sel_condition_result");

                        RLB_Condition.Items.Add(RLBI_Condition);
                    }


                    firstdiamondshape.Controls.Add(firstconditiondiv);
                    firstLi.Controls.Add(firstdiamondshape);
                    firstUl.Controls.Add(firstLi);
                    rootLi.Controls.Add(firstUl);

                    List<FilterItems> parentItems = (from a in filterItemList where a.getParent() == 0 select a).ToList();

                    var ul = new HtmlGenericControl("ul");

                    firstLi.Controls.Add(ul);
                    foreach (var parentcat in parentItems)
                    {
                        var li = new HtmlGenericControl("li");
                        var div = new HtmlGenericControl("div");

                        div.Attributes.Add("class", "nodecontent");
                        div.InnerHtml = parentcat.getLevel().ToString();

                        if (parentcat.getType() == "fail")
                            div.Style.Add("background-color", "#fcbba1");
                        else if (parentcat.getType() == "pass")
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
                            conditiondiv.Attributes.Add("title", parentcat.getCondition().ToString());

                            RadListBoxItem RLBI_Condition = new RadListBoxItem(parentcat.getLevel() + " - " + parentcat.getCondition().ToString(), parentcat.getLevel().ToString());
                            RLBI_Condition.Checkable = false;

                            RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                            Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");

                            int strLength = parentcat.getCondition().Length;
                            if (strLength > 10)
                                lblcond.Text = "C" + parentcat.getLevel().ToString() + ": " + parentcat.getCondition().Substring(0, 10) + "...";
                            else
                                lblcond.Text = "C" + parentcat.getLevel().ToString() + ": " + parentcat.getCondition().Substring(0, 5) + "...";

                            lblcond.ToolTip = parentcat.getCondition().ToString();
                            lblcond.Style.Add("padding-left", "20px");

                            RLB_Condition.Items.Add(RLBI_Condition);

                            li.Controls.Add(div);
                            diamondshape.Controls.Add(conditiondiv);
                            li.Controls.Add(diamondshape);
                        }
                        else
                        {
                            li.Attributes.Add("class", "leaf");
                            //int selected = Convert.ToInt32(RDDL_Parent.SelectedText);
                            string cond = (from l in listOfCond where l.Item1 == parentcat.getParent() select l.Item2).FirstOrDefault();
                            if (!String.IsNullOrEmpty(cond))
                            {
                                if (parentcat.getType().Equals("fail"))
                                {
                                    RadListBoxItem RLBI_Condition = new RadListBoxItem(parentcat.getLevel() + " - Not " + cond + " ( items : in progress... )", parentcat.getLevel().ToString());
                                    RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                                    Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                                    lblcond.Text = "C" + parentcat.getLevel().ToString() + " - ( items : in progress... )";
                                    lblcond.ToolTip = "Not " + cond;

                                    RLB_Condition.Items.Add(RLBI_Condition);

                                    RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).Style.Add("color", "#fc9272"); //---red
                                    RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).FindControl("RB_Delete_Condition").Visible = false;

                                }
                                else if (parentcat.getType().Equals("pass"))
                                {
                                    RadListBoxItem RLBI_Condition = new RadListBoxItem(parentcat.getLevel() + " - " + cond + " ( items : in progress... )", parentcat.getLevel().ToString());
                                    RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                                    Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                                    lblcond.Text = "C" + parentcat.getLevel().ToString() + " - ( items : in progress... )";
                                    lblcond.ToolTip = cond;

                                    RLB_Condition.Items.Add(RLBI_Condition);

                                    RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).Style.Add("color", "#74c476"); //---green
                                    RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).FindControl("RB_Delete_Condition").Visible = false;

                                }
                            }

                            li.Controls.Add(div);
                        }

                        ul.Controls.Add(li);

                        List<FilterItems> childItems = (from a in filterItemList where a.getParent() == parentcat.getLevel() select a).ToList();
                        if (childItems.Count > 0)
                            li.Controls.Add(AddChildItem(parentcat, li, false));
                    }
                }
                else
                {
                    RDDL_Parent.Items.Clear();
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

                    RDDL_Parent.Items.Sort(x => Convert.ToInt32(x.Value));
                }

                if (RLB_Filter.Items.Count > 0)
                {
                    lbl_Status.Text = "Calculation in progress!";
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "getReqIdSavedFilter", "get_reqId_savedFilter(" + Session["FilterID_Filter"] + "," +Session["basedonIndividual"]+");", true);

                }
                else
                    lbl_Status.Text = "";

            }
            finally
            {
                conn.Close();
            }






        }

        /*
          Conditions used in the filter will be loaded via the "RLB_FilterLoaded" function and displayed on the "List of condition" listbox.
             */
        private void RLB_FilterLoaded()
        {

            String connstring = CnnStr;
            SqlConnection conn = new SqlConnection(connstring);
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand("Sp_Filter_SelectedFilterItems_Sel", conn);
            //string selectCommand = "SELECT * FROM Tbl_Filter_SelectedItems where FilterID= " + Session["FilterID_Filter"];

            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdptrCmd.SelectCommand = cmd;
            cmd.Parameters.Add("@FilterID_Filter", SqlDbType.NVarChar, 100);
           cmd.Parameters.Add("@Control_num", SqlDbType.Int);
            cmd.Parameters["@FilterID_Filter"].Value = Session["FilterID_Filter"];
           cmd.Parameters["@Control_num"].Direction = ParameterDirection.Output;

            DataTable myDataTable = new DataTable();


            //using (SqlConnection conn = new SqlConnection(connString))
            try
            {
                conn.Open();
                // using (SqlCommand cmdSelect = new SqlCommand(selectCommand, conn))
                // {
                //    SqlDataAdptrCmd.SelectCommand = cmdSelect;
                SqlDataAdptrCmd.Fill(myDataTable);

                if (myDataTable.Rows.Count > 0)
                {
                    for (int i = 0; i < myDataTable.Rows.Count; i++)
                    {
                        if (!String.IsNullOrEmpty(myDataTable.Rows[i]["Condition"].ToString()))
                        {

                            RadListBoxItem RLBI = new RadListBoxItem(myDataTable.Rows[i]["Condition"].ToString());
                            RLBI.Value = myDataTable.Rows[i]["Field"].ToString();


                            RLB_Filter.Items.Add(RLBI);
                        }
                    }
                }
                // }
            }
            finally
            {
                conn.Close();
            }
        }

        /*
         To create a tab on the left side of Filter, this function (a list of filters selected by Table "Tbl_Filter_Category" that is dynamically created by the admin) will be called.
             */
        private void BindToDataSet()
        {

            String connstring = CnnStr;
            SqlConnection conn = new SqlConnection(connstring);
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand("Sp_Filter_CategoryForAnalysis_Sel", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AnalysisType", SqlDbType.NVarChar, 50);
            cmd.Parameters["@AnalysisType"].Value = 'B';

            adapter.SelectCommand = cmd;


            DataTable links = new DataTable();

            adapter.Fill(links);
            RTS_FilterTab.DataTextField = "CategoryName";
            RTS_FilterTab.DataFieldID = "FCId";
            RTS_FilterTab.DataSource = links;
            RTS_FilterTab.DataBind();


            for (int i = 0; i < links.Rows.Count; i++)
            {
                ViewState[links.Rows[i].Field<string>("CategoryName")] = links.Rows[i].Field<int>("FCId").ToString();
            }

            AddPageView(RTS_FilterTab.Tabs[0], ViewState[links.Rows[0].Field<string>("CategoryName")].ToString());

        }

        /*
         * Each tab needs a pageView.
         * A separate page view will be created for each tab
         */
        private void AddPageView(RadTab tab, String fcid)
        {
            RadPageView pageView = new RadPageView();
            if ((RadPageView)RMP_FItems.FindPageViewByID(tab.Text) is null)
            {
                pageView.ID = tab.Text;
                RMP_FItems.PageViews.Add(pageView);
                tab.PageViewID = pageView.ID;
                AddItemToPageView(pageView, fcid);
            }
            else
            {
                var existedPageView = (RadPageView)RMP_FItems.FindPageViewByID(tab.Text);
               AddItemToPageView(existedPageView, fcid);
            }

        }
        /*
         Each page view(category) has some groups such as "Location" which will be added and modified by the admin 
         from admin page(https://wings.esat.kuleuven.be/Admin/FilterGroupCategory).
         Each group can contain one or more items. Session "HasDependency" determines the dependency of the items in the group. 
         e.g. "Location" group has more than one items(Chromosome, Start and End position). So, the value of session would be TRUE.
         A ViewState will be generated to keep the related item ID(if the group has no dependency)/IDs(if the group has dependency) to be usable for the "ButtonAdd_Click" function.
         Depending on the number and type, items will be created and data sources will be binded as well.( it will be needed for data binding)
             */
        private void AddItemToPageView(RadPageView RPViw, String fcid)
        {
            //SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM Tbl_Filter_Category_Group where GroupState=1 and FCId=" + Convert.ToInt32(fcid), CnnStr);
            //DataTable filters = new DataTable();


            String connstring = CnnStr;
            SqlConnection conn = new SqlConnection(connstring);
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand("Sp_Filter_CategoryGroup_ByID_Sel", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FCId", SqlDbType.VarChar, 50);
            cmd.Parameters["@FCId"].Value = fcid;

            adapter.SelectCommand = cmd;
            DataTable filters = new DataTable();
            adapter.Fill(filters);

            for (int i = 0; i < filters.Rows.Count; i++)
            {
                var mainDiv = new HtmlGenericControl("Fieldset");
                mainDiv.Attributes.Add("class", "tbl-filter-container");

                HtmlGenericControl legend = new HtmlGenericControl("Legend") { InnerText = filters.Rows[i].Field<string>("GroupDesc") };
                mainDiv.Controls.Add(legend);

                List<string> itmIDs = AddFilterItems(mainDiv, filters.Rows[i].Field<int>("GroupId").ToString(), filters.Rows[i].Field<int>("Dependency"));

                if (Session["HasDependency"].Equals("true"))
                    ViewState["List_" + RPViw.ID] = itmIDs;
                else
                    ViewState["List_" + RPViw.ID + "_" + filters.Rows[i].Field<int>("GroupId").ToString()] = itmIDs.ToList();

                RPViw.Controls.Add(mainDiv);

                if (itmIDs != null)
                {
                    //foreach (var item in itmIDs)
                    for (int j = 0; j < itmIDs.Count; j++)
                    {

                        List<string> listOfItm_Ids_Types = itmIDs[j].Split(',').ToList();

                        if (listOfItm_Ids_Types[1].Equals("RadTextBox"))
                        {
                            RadTextBox RTB = FindControl(RPViw.ID).FindControl(listOfItm_Ids_Types[0]) as RadTextBox;
                            RTB.ToolTip = listOfItm_Ids_Types[5].ToString();
                        }

                       

                        if (listOfItm_Ids_Types[1].Equals("RadNumericTextBox"))
                        {
                            RadNumericTextBox RNTB = FindControl(RPViw.ID).FindControl(listOfItm_Ids_Types[0]) as RadNumericTextBox;
                            RNTB.ToolTip = listOfItm_Ids_Types[5].ToString();
                        }

                        if (listOfItm_Ids_Types[1].Equals("RadComboBox") || listOfItm_Ids_Types[1].Equals("RadComboBoxWithRadTextBox"))
                        {
                            RadComboBox RCB = FindControl(RPViw.ID).FindControl(listOfItm_Ids_Types[0]) as RadComboBox;
                            RCB.ToolTip = listOfItm_Ids_Types[5].ToString();
                            RCB.MarkFirstMatch = true;
                            RCB.AllowCustomText = true;
                            //RCB.Filter = "Contains";
                            //RCB.EnableAutomaticLoadOnDemand = true;
                            RCB.DataSourceID = "DS_" + listOfItm_Ids_Types[2];
                            CreateSqlDataSource(listOfItm_Ids_Types[2], listOfItm_Ids_Types[0], listOfItm_Ids_Types[6]);
                            //CreateSqlDataSource(listOfItm_Ids_Types[2], listOfItm_Ids_Types[0], "");

                             RCB.DataBind();
                        }

                        if (listOfItm_Ids_Types[1].Equals("RadComboBoxMultiSelected"))
                        {
                            RadComboBox RCB = FindControl(RPViw.ID).FindControl(listOfItm_Ids_Types[0]) as RadComboBox;
                            RCB.ToolTip = listOfItm_Ids_Types[5].ToString();
                            RCB.CheckBoxes = true;
                            RCB.MarkFirstMatch = true;
                            RCB.AllowCustomText = true;
                            //RCB.Filter = "Contains";
                            //RCB.EnableAutomaticLoadOnDemand = true;
                            RCB.DataSourceID = "DS_" + listOfItm_Ids_Types[2];
                            CreateSqlDataSource(listOfItm_Ids_Types[2], listOfItm_Ids_Types[0], listOfItm_Ids_Types[6]);
                            RCB.DataBind();


                        }

                        if (listOfItm_Ids_Types[1].Equals("RadAutoCompleteBox"))
                        {
                            RadAutoCompleteBox RACB = FindControl(RPViw.ID).FindControl(listOfItm_Ids_Types[0]) as RadAutoCompleteBox;
                            RACB.ToolTip = listOfItm_Ids_Types[5].ToString();
                            RACB.DataSourceID = "DS_" + listOfItm_Ids_Types[2];
                            CreateSqlDataSource(listOfItm_Ids_Types[2], listOfItm_Ids_Types[0], listOfItm_Ids_Types[6]);
                            RACB.DataBind();
                        }

                        if (listOfItm_Ids_Types[1].Equals("RadCheckBoxList"))
                        {
                            RadCheckBoxList RChkBList = FindControl(RPViw.ID).FindControl(listOfItm_Ids_Types[0]) as RadCheckBoxList;
                            RChkBList.ToolTip = listOfItm_Ids_Types[5].ToString();
                            RChkBList.DataSourceID = "DS_" + listOfItm_Ids_Types[2];
                            // CreateSqlDataSource("DS_" + listOfItm_Ids_Types[2], hdn_ResTblName.ID);
                            CreateSqlDataSource(listOfItm_Ids_Types[2], listOfItm_Ids_Types[0], listOfItm_Ids_Types[6]);
                            RChkBList.DataBind();
                        }
                    }
                }

            }

            RPViw.Selected = true;
        }

        /*
         Some items need to be connected/binded to the data source. It will be handed by the "CreateSqlDataSource" function.
             */
        private void CreateSqlDataSource(string DSId, string CntrlId, string whereCond)
        {
            SqlDataSource SqlDataSource1 = new SqlDataSource();
            SqlDataSource1.ID = "DS_" + DSId;

            HiddenField hdn = new HiddenField();
            hdn.ID = "hdnf_" + CntrlId;
            hdn.Value = DSId;
            hdn.EnableViewState = false;
           /// Haleh /// div_Holder_hdns.Controls.Add(hdn);


            string OrderbyTxt, WhereClause, WhereClauseWithValue;
            if (hdn.Value.Equals("Tbl_Chromosome"))
                OrderbyTxt = " ORDER BY CASE WHEN ISNUMERIC(Chr) = 1 THEN CAST(Chr AS FLOAT) WHEN ISNUMERIC(LEFT(Chr, 1)) = 0 THEN ASCII(LEFT(LOWER(Chr), 1)) ELSE 99 END";
            else
                OrderbyTxt = " ";

            if (!String.IsNullOrEmpty(whereCond.Trim()))
            {
                WhereClauseWithValue = " Where ";
                WhereClause = whereCond.Replace("AND", ",");
                string[] WhereClauseItemList = WhereClause.Split(',');
                foreach (var itm in WhereClauseItemList)
                {
                    string[] WhereClauseSessionList = itm.Split('=');
                    string key = WhereClauseSessionList[0];
                    string val = WhereClauseSessionList[1].Replace("Session[\"", "").Replace("\"]", "");
                    val = Session[val.Trim()].ToString();
                    int myInt;
                    bool isNumerical = int.TryParse(val, out myInt);
                    switch (isNumerical)
                    {
                        case false:
                            // this is the last item
                            if (WhereClauseItemList.LastOrDefault().Equals(itm))
                                WhereClauseWithValue += key + "= '" + val + "'";
                            else
                                WhereClauseWithValue += key + "= '" + val + "' AND ";
                            break;
                        case true:
                            if (WhereClauseItemList.LastOrDefault().Equals(itm))
                                WhereClauseWithValue += key + "=" + val;
                            else
                                WhereClauseWithValue += key + "=" + val + " AND ";
                            break;
                        default:
                            break;
                    }

                }
            }
            else
                WhereClauseWithValue = " ";

            SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
            //SqlDataSource1.SelectCommand = "Sp_GAP_Filter_Resource_Table_Sel";
            //SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;

            if (hdn.Value.Equals("Tbl_GAP_Filter_UPanel"))
                SqlDataSource1.SelectCommand = "SELECT  * FROM dbo." + hdn.Value + WhereClauseWithValue + OrderbyTxt;
            else
                SqlDataSource1.SelectCommand = "SELECT  * FROM [WiNGS_BaseInfo_Db].dbo." + hdn.Value + WhereClauseWithValue + OrderbyTxt;

            /* if (SqlDataSource1.SelectParameters.Count < 1 || SqlDataSource1.SelectParameters[hdn.ID] == null)
             {
                 ControlParameter param = new ControlParameter();
                 param.ControlID = hdn.ID;
                 param.Name = "TblName";
                 param.PropertyName = "Value";
                 SqlDataSource1.SelectParameters.Add(param);
             }*/

            SqlDataSource1.DataBind();
            div_Holder_hdns.Controls.Add(SqlDataSource1);

        }

        /*
         All items will be added to the page with the corresponding data and will be added to the right control which is "mainDiv".
             */
        private List<string> AddFilterItems(HtmlGenericControl mainDiv, String groupid, int dep)
        {
            ItemIds.Clear();
            //SqlDataAdapter adapterItem = new SqlDataAdapter("SELECT * FROM Viw_FilterCategoryItems where ItemState=1 and GroupId=" + Convert.ToInt32(groupid), CnnStr);

            String connstring = CnnStr;
            SqlConnection conn = new SqlConnection(connstring);
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand("Sp_Filter_FilterCategoryItems_ByGroupID_Sel", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@GroupId", SqlDbType.Int);
            cmd.Parameters["@GroupId"].Value = Convert.ToInt32(groupid);

            adapter.SelectCommand = cmd;
            DataTable filterItems = new DataTable();
            adapter.Fill(filterItems);

            for (int i = 0; i < filterItems.Rows.Count; i++)
            {
                dynamic itemField = null;
                dynamic txtBox_for_itemField = null;

                string itemType = filterItems.Rows[i].Field<string>("ItemFieldType");
                string valueType = filterItems.Rows[i].Field<string>("ValueType");

                Session["itemType"] = itemType;


                switch (itemType)
                {
                    case "RadTextBox":
                        {

                            if (valueType.Equals("Integer"))
                            {
                                itemField = new RadNumericTextBox();
                                itemField.ID = filterItems.Rows[i].Field<string>("ItemFieldID");
                                itemField.NumberFormat.AllowRounding = true;
                                itemField.NumberFormat.DecimalDigits = 0;
                                itemField.EmptyMessage = filterItems.Rows[i].Field<string>("ItemFieldDefaultValue");
                            }

                            if (valueType.Equals("String"))
                            {
                                itemField = new RadTextBox();
                                itemField.ID = filterItems.Rows[i].Field<string>("ItemFieldID");
                                itemField.EmptyMessage = filterItems.Rows[i].Field<string>("ItemFieldDefaultValue");

                            }

                            if (valueType.Equals("Decimal"))
                            {
                                itemField = new RadTextBox();
                                itemField.ID = filterItems.Rows[i].Field<string>("ItemFieldID");
                                itemField.EmptyMessage = filterItems.Rows[i].Field<string>("ItemFieldDefaultValue");

                            }

                            Session["itemFieldId"] = itemField.ID;
                            itemField.ToolTip = filterItems.Rows[i].Field<string>("ItemFieldHint");
                            itemField.CssClass = filterItems.Rows[i].Field<string>("ItemStyle");
                            itemField.Width = 180;
                            Label lbl_ItemField = new Label();

                            lbl_ItemField.Text = filterItems.Rows[i].Field<string>("ItemFieldDesc");
                            if (itemType.Equals("RadCheckBoxList"))
                                lbl_ItemField.CssClass = "label-control title_h5";
                            else
                                lbl_ItemField.CssClass = "col-md-4 label-control";

                            lbl_ItemField.Attributes.Add("for", filterItems.Rows[i].ItemArray.GetValue(1).ToString());

                            mainDiv.Controls.Add(lbl_ItemField);

                            RadComboBox rcb_opr = new RadComboBox();
                            rcb_opr.ID = "rcb_opr_" + itemField.ID;
                            rcb_opr.Style.Add("width", "49px !important");
                            rcb_opr.Style.Add("margin-right", "5px !important");

                            string Oprkeys = filterItems.Rows[i].Field<string>("OperationIds");
                            string OprNames = filterItems.Rows[i].Field<string>("OperationNames");
                            AssignOpr(Oprkeys, OprNames, rcb_opr, mainDiv, itemField.ID);

                            mainDiv.Controls.Add(itemField);

                            string typ = "";

                            switch (valueType)
                            {
                                case "Integer":
                                    typ = "RadNumericTextBox";
                                    break;
                                case "String":
                                    typ = "RadTextBox";
                                    break;
                                case "Decimal":
                                    typ = "RadTextBox";
                                    break;
                                default:
                                    typ = "RadTextBox";
                                    break;
                            }

                            //string Opr_mongodbNames = filterItems.Rows[i].Field<string>("OperationMongoNames");
                            string ItemField_mongodbName = filterItems.Rows[i].Field<string>("ItemFieldMongoDB").TrimStart().TrimEnd();
                            string ItemField_valueType = filterItems.Rows[i].Field<string>("ValueType");
                            string ItemField_formula = filterItems.Rows[i].Field<string>("Formula");

                            ItemIds.Add(itemField.ID + "," + typ + "," + null + "," + lbl_ItemField.Text + "," +
                                        rcb_opr.ID + "," + ItemField_mongodbName.Trim() + "," + null + "," + ItemField_valueType + "," + ItemField_formula);
                            break;
                        }
                    case "RadAutoCompleteBox":
                        {
                            itemField = new RadAutoCompleteBox();
                            itemField.ID = filterItems.Rows[i].Field<string>("ItemFieldID");

                            if (!Session["itemType"].Equals("RadAutoCompleteBox"))
                                itemField.EmptyMessage = filterItems.Rows[i].Field<string>("ItemFieldDefaultValue");


                            Session["itemFieldId"] = itemField.ID;
                            itemField.ToolTip = filterItems.Rows[i].Field<string>("ItemFieldHint");
                            itemField.CssClass = filterItems.Rows[i].Field<string>("ItemStyle");
                            //itemField.EnableViewState = false;
                            itemField.Style.Add("height", "auto !important");

                            Label lbl_ItemField = new Label();

                            lbl_ItemField.Text = filterItems.Rows[i].Field<string>("ItemFieldDesc");
                            if (itemType.Equals("RadCheckBoxList"))
                                lbl_ItemField.CssClass = "label-control title_h5";
                            else
                                lbl_ItemField.CssClass = "col-md-4 label-control";

                            lbl_ItemField.Attributes.Add("for", filterItems.Rows[i].ItemArray.GetValue(1).ToString());

                            mainDiv.Controls.Add(lbl_ItemField);

                            RadComboBox rcb_opr = new RadComboBox();
                            rcb_opr.ID = "rcb_opr_" + itemField.ID;
                            rcb_opr.Style.Add("width", "49px !important");
                            rcb_opr.Style.Add("margin-right", "5px !important");

                            string Oprkeys = filterItems.Rows[i].Field<string>("OperationIds");
                            string OprNames = filterItems.Rows[i].Field<string>("OperationNames");
                            AssignOpr(Oprkeys, OprNames, rcb_opr, mainDiv, itemField.ID);


                            string ResTblName = filterItems.Rows[i].Field<string>("ResourceTableName");
                            itemField.DataValueField = filterItems.Rows[i].Field<string>("ResourceTableFieldValue");
                            itemField.DataTextField = filterItems.Rows[i].Field<string>("ResourceTableFieldName");
                            itemField.RenderMode = RenderMode.Lightweight;
                            itemField.AllowCustomEntry = true;
                            itemField.Height = 250;
                            itemField.Skin = "Silk";
                            itemField.Filter = RadAutoCompleteFilter.StartsWith;
                            itemField.MaxResultCount = 8;
                            itemField.Delimiter = "|";
                            itemField.Style.Add("width", "56%");
                            itemField.Attributes.Add("runat", "server");
                            mainDiv.Controls.Add(itemField);

                            //string Opr_mongodbNames = filterItems.Rows[i].Field<string>("OperationMongoNames");
                            string ItemField_mongodbName = filterItems.Rows[i].Field<string>("ItemFieldMongoDB");
                            string ItemField_valueType = filterItems.Rows[i].Field<string>("ValueType");
                            string ItemField_formula = filterItems.Rows[i].Field<string>("Formula");

                            ItemIds.Add(itemField.ID + "," + itemType + "," + ResTblName + "," + lbl_ItemField.Text + "," +
                                        rcb_opr.ID + "," + ItemField_mongodbName + "," + null + "," + ItemField_valueType + "," + ItemField_formula);



                            break;
                        }
                    case "RadComboBox":
                        {

                            itemField = new RadComboBox();
                            itemField.ID = filterItems.Rows[i].Field<string>("ItemFieldID");

                            if (!Session["itemType"].Equals("RadComboBox"))
                                itemField.EmptyMessage = filterItems.Rows[i].Field<string>("ItemFieldDefaultValue");

                            ////Session["ResTblName"] = filterItems.Rows[i].Field<string>("ResourceTableName");
                            Session["itemFieldId"] = itemField.ID;
                            itemField.ToolTip = filterItems.Rows[i].Field<string>("ItemFieldHint");
                            itemField.CssClass = filterItems.Rows[i].Field<string>("ItemStyle");
                            itemField.Width = 180;
                            itemField.Height = 250;
                            //itemField.EnableViewState = false;

                            Label lbl_ItemField = new Label();

                            lbl_ItemField.Text = filterItems.Rows[i].Field<string>("ItemFieldDesc");
                            if (itemType.Equals("RadCheckBoxList"))
                                lbl_ItemField.CssClass = "label-control title_h5";
                            else
                                lbl_ItemField.CssClass = "col-md-4 label-control";

                            lbl_ItemField.Attributes.Add("for", filterItems.Rows[i].ItemArray.GetValue(1).ToString());

                            mainDiv.Controls.Add(lbl_ItemField);

                            RadComboBox rcb_opr = new RadComboBox();
                            rcb_opr.ID = "rcb_opr_" + itemField.ID;
                            rcb_opr.Style.Add("width", "49px !important");
                            rcb_opr.Style.Add("margin-right", "5px !important");

                            string Oprkeys = filterItems.Rows[i].Field<string>("OperationIds");
                            string OprNames = filterItems.Rows[i].Field<string>("OperationNames");
                            AssignOpr(Oprkeys, OprNames, rcb_opr, mainDiv, itemField.ID);

                            string ResTblName = filterItems.Rows[i].Field<string>("ResourceTableName");
                            itemField.DataValueField = filterItems.Rows[i].Field<string>("ResourceTableFieldValue");
                            itemField.DataTextField = filterItems.Rows[i].Field<string>("ResourceTableFieldName");
                            //itemField.CheckBoxes = true;
                            //itemField.EnableCheckAllItemsCheckBox = true;
                            itemField.MarkFirstMatch = true;
                            itemField.AllowCustomText = true;
                            itemField.EnableVirtualScrolling = true;
                            itemField.HighlightTemplatedItems = true;
                            //itemField.Filter = "Contains";
                            //itemField.EnableLoadOnDemand = true;
                            //itemField.AutoPostBack = false;
                            //itemField.Style.Add("float", "right");
                            //itemField.Style.Add("width", "56%");
                            itemField.Attributes.Add("runat", "server");
                            itemField.Filter = RadComboBoxFilter.StartsWith;

                            mainDiv.Controls.Add(itemField);

                            //string  Opr_mongodbNames = filterItems.Rows[i].Field<string>("OperationMongoNames");
                            string ItemField_mongodbName = filterItems.Rows[i].Field<string>("ItemFieldMongoDB");
                            string ItemField_valueType = filterItems.Rows[i].Field<string>("ValueType");
                            string ItemField_formula = filterItems.Rows[i].Field<string>("Formula");

                            ItemIds.Add(itemField.ID + "," + itemType + "," + ResTblName + "," + lbl_ItemField.Text + "," +
                                        rcb_opr.ID + "," + ItemField_mongodbName + "," + null + "," + ItemField_valueType + "," + ItemField_formula);

                            break;

                        }
                    case "RadComboBoxMultiSelected":
                        {
                            //RadTabStripEventArgs args = new RadTabStripEventArgs(RTS_FilterTab.SelectedTab);
                            //RadPageView rpvw = (RadPageView)RMP_FItems.FindPageViewByID(args.Tab.Text);
                            //RadComboBox existed_rcb = (RadComboBox)rpvw.FindControl(filterItems.Rows[i].Field<string>("ItemFieldID"));
                            //if (existed_rcb == null)
                            //{
                            itemField = new RadComboBox();
                            itemField.ID = filterItems.Rows[i].Field<string>("ItemFieldID");

                            if (!Session["itemType"].Equals("RadComboBox"))
                                itemField.EmptyMessage = filterItems.Rows[i].Field<string>("ItemFieldDefaultValue");

                            ////Session["ResTblName"] = filterItems.Rows[i].Field<string>("ResourceTableName");
                            Session["itemFieldId"] = itemField.ID;
                            itemField.ToolTip = filterItems.Rows[i].Field<string>("ItemFieldHint");
                            itemField.CssClass = filterItems.Rows[i].Field<string>("ItemStyle");
                            //itemField.EnableViewState = false;
                            itemField.Height = 250;
                            Label lbl_ItemField = new Label();

                            lbl_ItemField.Text = filterItems.Rows[i].Field<string>("ItemFieldDesc");
                            if (itemType.Equals("RadCheckBoxList"))
                                lbl_ItemField.CssClass = "label-control title_h5";
                            else
                                lbl_ItemField.CssClass = "col-md-4 label-control";

                            lbl_ItemField.Attributes.Add("for", filterItems.Rows[i].ItemArray.GetValue(1).ToString());

                            mainDiv.Controls.Add(lbl_ItemField);

                            RadComboBox rcb_opr = new RadComboBox();
                            rcb_opr.ID = "rcb_opr_" + itemField.ID;
                            rcb_opr.Style.Add("width", "49px !important");
                            rcb_opr.Style.Add("margin-right", "5px !important");

                            string Oprkeys = filterItems.Rows[i].Field<string>("OperationIds");
                            string OprNames = filterItems.Rows[i].Field<string>("OperationNames");
                            AssignOpr(Oprkeys, OprNames, rcb_opr, mainDiv, itemField.ID);

                            string ResTblName = filterItems.Rows[i].Field<string>("ResourceTableName");
                            itemField.DataValueField = filterItems.Rows[i].Field<string>("ResourceTableFieldValue");
                            itemField.DataTextField = filterItems.Rows[i].Field<string>("ResourceTableFieldName");
                            itemField.CheckBoxes = true;
                            itemField.EnableCheckAllItemsCheckBox = true;
                            itemField.MarkFirstMatch = true;
                            itemField.AllowCustomText = true;
                            itemField.EnableVirtualScrolling = true;
                            //itemField.Filter = "Contains";
                            //itemField.EnableLoadOnDemand = true;
                            itemField.AutoPostBack = false;
                            itemField.Style.Add("float", "right");
                            itemField.Style.Add("width", "56%");
                            itemField.Attributes.Add("runat", "server");
                            itemField.Filter = RadComboBoxFilter.StartsWith;

                            mainDiv.Controls.Add(itemField);

                            //string  Opr_mongodbNames = filterItems.Rows[i].Field<string>("OperationMongoNames");
                            string ItemField_mongodbName = filterItems.Rows[i].Field<string>("ItemFieldMongoDB");
                            string ItemField_valueType = filterItems.Rows[i].Field<string>("ValueType");
                            string WhereClause = filterItems.Rows[i].Field<string>("WhereClause");
                            string ItemField_formula = filterItems.Rows[i].Field<string>("Formula");

                            ItemIds.Add(itemField.ID + "," + itemType + "," + ResTblName + "," + lbl_ItemField.Text + "," +
                                        rcb_opr.ID + "," + ItemField_mongodbName + "," + WhereClause + "," + ItemField_valueType + "," + ItemField_formula);

                            break;

                        }
                    case "RadCheckBoxList":
                        {
                            itemField = new RadCheckBoxList();
                            itemField.ID = filterItems.Rows[i].Field<string>("ItemFieldID");

                            string ResTblName = filterItems.Rows[i].Field<string>("ResourceTableName");
                            itemField.DataBindings.DataValueField = filterItems.Rows[i].Field<string>("ResourceTableFieldValue");
                            itemField.DataBindings.DataTextField = filterItems.Rows[i].Field<string>("ResourceTableFieldName");
                            itemField.Attributes.Add("runat", "server");
                            itemField.AutoPostBack = false;
                            //itemField.EnableViewState = false;

                            Session["itemFieldId"] = itemField.ID;
                            itemField.ToolTip = filterItems.Rows[i].Field<string>("ItemFieldHint");
                            itemField.CssClass = filterItems.Rows[i].Field<string>("ItemStyle");

                            Label lbl_ItemField = new Label();

                            lbl_ItemField.Text = filterItems.Rows[i].Field<string>("ItemFieldDesc");
                            if (itemType.Equals("RadCheckBoxList"))
                                lbl_ItemField.CssClass = "title_h5";
                            else
                                lbl_ItemField.CssClass = "col-md-4 label-control";

                            lbl_ItemField.Attributes.Add("for", filterItems.Rows[i].ItemArray.GetValue(1).ToString());

                            mainDiv.Controls.Add(lbl_ItemField);

                            RadComboBox rcb_opr = new RadComboBox();
                            rcb_opr.ID = "rcb_opr_" + itemField.ID;

                            rcb_opr.Style.Add("width", "49px !important");
                            rcb_opr.Style.Add("margin-right", "5px !important");

                            string Oprkeys = filterItems.Rows[i].Field<string>("OperationIds");
                            string OprNames = filterItems.Rows[i].Field<string>("OperationNames");
                            AssignOpr(Oprkeys, OprNames, rcb_opr, mainDiv, itemField.ID);

                            mainDiv.Controls.Add(itemField);

                            string ItemField_mongodbName = filterItems.Rows[i].Field<string>("ItemFieldMongoDB");
                            string ItemField_valueType = filterItems.Rows[i].Field<string>("ValueType");
                            string ItemField_formula = filterItems.Rows[i].Field<string>("Formula");

                            ItemIds.Add(itemField.ID + "," + itemType + "," + ResTblName + "," + lbl_ItemField.Text + "," +
                                        rcb_opr.ID + "," + ItemField_mongodbName + "," + null + "," + ItemField_valueType + "," + ItemField_formula);


                            break;
                        }
                    case "RadComboBoxWithRadTextBox":
                        {
                            txtBox_for_itemField = new RadNumericTextBox();
                            txtBox_for_itemField.ID = "RTxt_" + filterItems.Rows[i].Field<string>("ItemFieldID");
                            txtBox_for_itemField.EmptyMessage = "Enter your value";
                            txtBox_for_itemField.Attributes.Add("runat", "server");
                            txtBox_for_itemField.Width = 130;
                            txtBox_for_itemField.NumberFormat.AllowRounding = true;
                            txtBox_for_itemField.NumberFormat.DecimalDigits = 0;
                            txtBox_for_itemField.Style.Add("margin", "0 10px");
                            //txtBox_for_itemField.Style.Add("Width", "130px !important");
                            //txtBox_for_itemField.Attributes.Add("CssClass", "txtBox_for_itemField");

                            itemField = new RadComboBox();
                            itemField.ID = filterItems.Rows[i].Field<string>("ItemFieldID");

                            if (!Session["itemType"].Equals("RadComboBox"))
                                itemField.EmptyMessage = filterItems.Rows[i].Field<string>("ItemFieldDefaultValue");

                            Session["itemFieldId"] = itemField.ID;
                            itemField.ToolTip = filterItems.Rows[i].Field<string>("ItemFieldHint");
                            itemField.CssClass = filterItems.Rows[i].Field<string>("ItemStyle") + " itemField";
                            itemField.Height = 250;
                            //itemField.Width = "40%";

                            //itemField.Style.Add("margin-right", "20px");

                            Label lbl_ItemField = new Label();

                            lbl_ItemField.Text = filterItems.Rows[i].Field<string>("ItemFieldDesc");
                            //lbl_ItemField.CssClass = "col-md-4";
                            lbl_ItemField.Style.Add("display", "block");
                            lbl_ItemField.Style.Add("margin-bottom", "10px");


                            lbl_ItemField.Attributes.Add("for", filterItems.Rows[i].ItemArray.GetValue(1).ToString());

                            mainDiv.Controls.Add(lbl_ItemField);

                            RadComboBox rcb_opr = new RadComboBox();
                            rcb_opr.ID = "rcb_opr_" + itemField.ID;
                            rcb_opr.Style.Add("width", "49px !important");
                            rcb_opr.Style.Add("margin-right", "5px !important");

                            string Oprkeys = filterItems.Rows[i].Field<string>("OperationIds");
                            string OprNames = filterItems.Rows[i].Field<string>("OperationNames");
                            AssignOpr(Oprkeys, OprNames, rcb_opr, mainDiv, itemField.ID);

                            string ResTblName = filterItems.Rows[i].Field<string>("ResourceTableName");
                            itemField.DataValueField = filterItems.Rows[i].Field<string>("ResourceTableFieldValue");
                            itemField.DataTextField = filterItems.Rows[i].Field<string>("ResourceTableFieldName");
                            itemField.MarkFirstMatch = true;
                            itemField.AllowCustomText = true;
                            itemField.Style.Add("width", "58%");
                            itemField.Attributes.Add("runat", "server");
                            itemField.Filter = RadComboBoxFilter.StartsWith;
                            itemField.EnableVirtualScrolling = true;

                            mainDiv.Controls.Add(txtBox_for_itemField);
                            mainDiv.Controls.Add(itemField);

                            //string  Opr_mongodbNames = filterItems.Rows[i].Field<string>("OperationMongoNames");
                            string ItemField_mongodbName = filterItems.Rows[i].Field<string>("ItemFieldMongoDB");
                            string ItemField_formula = filterItems.Rows[i].Field<string>("Formula");

                            ItemIds.Add(itemField.ID + "," + itemType + "," + ResTblName + "," + lbl_ItemField.Text + "," +
                                        rcb_opr.ID + "," + ItemField_mongodbName + "," + null + "," + null + "," + ItemField_formula);

                            break;

                        }
                    default:
                        break;

                }

                if (!String.IsNullOrEmpty(filterItems.Rows[i].Field<string>("ItemFieldHint")))
                {
                    Label lbl_ItemFieldDesc = new Label();
                    lbl_ItemFieldDesc.Text = filterItems.Rows[i].Field<string>("ItemFieldHint");
                    lbl_ItemFieldDesc.CssClass = "custom-desc-label";
                    mainDiv.Controls.Add(lbl_ItemFieldDesc);
                }

                if (dep == 0)
                {
                    Session["HasDependency"] = "false";
                    mainDiv.Controls.Add(CreateDynamicAddButton("btn_" + itemField.ID, filterItems.Rows[i].Field<int>("GroupId")));
                }
                var hr = new HtmlGenericControl("hr");
                mainDiv.Controls.Add(hr);


                //---------------ADDED!
                if (Session["HasDependency"] != null)
                {
                    if (Session["itemType"].Equals("RadComboBox") && Session["HasDependency"].Equals("true"))
                    {
                        //RadComboBox itemField = new RadComboBox();
                        itemField.AutoPostBack = true;
                        itemField.SelectedIndexChanged += new RadComboBoxSelectedIndexChangedEventHandler(chrRCB_SelectedIndexChanged);
                    }
                }
            }


            if (dep == 1 && !String.IsNullOrEmpty(Session["itemFieldId"].ToString()))
            {
                mainDiv.Controls.Add(CreateDynamicAddButton("btn_" + Session["itemFieldId"], 0));
                Session["itemFieldId"] = null;
                Session["HasDependency"] = "true";

            }

            return ItemIds;
        }

        void chrRCB_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            String connstring = CnnStr;
            SqlConnection conn = new SqlConnection(connstring);
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand("Sp_Filter_EndPos_RelatedTo_Chr_Find", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Chr", SqlDbType.VarChar, 2);
            cmd.Parameters["@Chr"].Value = e.Value;
            SqlDataAdptrCmd.SelectCommand = cmd;
            DataTable myDataTable = new DataTable();
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                SqlDataAdptrCmd.Fill(myDataTable);

                if (myDataTable.Rows.Count > 0)
                {
                    RadNumericTextBox RTB_Spos = (RadNumericTextBox)FindControl("RTB_Spos");
                    RTB_Spos.Text = "1";
                    RadNumericTextBox RTB_Epos = (RadNumericTextBox)FindControl("RTB_Epos");
                    RTB_Epos.Text = myDataTable.Rows[0]["totallength"].ToString();
                }

            }
            finally
            {
                conn.Close();
            }

        }

        private void AssignOpr(string Oprkeys, string OprNames, RadComboBox rcb_opr, dynamic mainDiv, string itemFieldId)
        {
            HiddenField existedHdn = (HiddenField)FindControl("hdn_" + itemFieldId);
            if (existedHdn == null)
            {
                if (Oprkeys.Contains(','))
                {
                    List<string> listOprIds = Oprkeys.Split(',').ToList();
                    List<string> listOprNames = OprNames.Split(',').ToList(); //[OperationNames]

                    //Use Enumerable.Zip to zip the two sequences together, and then use Enumerable.ToDictionary
                    var oprDict = listOprNames.Zip(listOprNames, (value, key) => new { value, key })
                                        .ToDictionary(x => x.key, x => x.value);

                    foreach (var item in oprDict)
                    {
                        RadComboBoxItem rcbi_opr = new RadComboBoxItem(item.Key, item.Value);

                        rcbi_opr.Selected = true;
                        rcb_opr.Items.Add(rcbi_opr);
                    }

                    mainDiv.Controls.Add(rcb_opr);

                }
                else if (OprNames.Equals("="))
                {
                    HiddenField hdn_opr = new HiddenField();
                    hdn_opr.ID = "hdn_" + itemFieldId;
                    hdn_opr.Value = Oprkeys;
                    mainDiv.Controls.Add(hdn_opr);

                }
                else
                {
                    RadComboBoxItem rcbi_opr = new RadComboBoxItem(OprNames, Oprkeys);
                    rcbi_opr.Selected = true;
                    rcb_opr.Items.Add(rcbi_opr);
                }
            }
        }

        protected void RTS_FilterTab_TabClick(object sender, RadTabStripEventArgs e)
        {
            if (Session["gotoTabClicked"].ToString() != "no")
            {
                String fcid = ViewState[e.Tab.Text].ToString();
                ItemIds.Clear();
                AddPageView(e.Tab, fcid);
                Session["gotoTabClicked"] = "yes";
            }

        }

        private void ButtonAdd_Click(object sender, EventArgs e)
        {
            List<string> AllControls;

            List<string> rcbox_selectedListTxt = new List<string>();
            List<string> rcbox_selectedList = new List<string>();
            string btnId = ((RadButton)sender).ID;

            string RPViwId = RTS_FilterTab.SelectedTab.PageViewID;
            RadPageView RPViw = RMP_FItems.FindControl(RPViwId) as RadPageView;

            if (Session["HasDependency"].Equals("true")) //&& !Session["ChrIncluded"].Equals("null"))
                AllControls = (List<string>)ViewState["List_" + RPViw.ID];
            else
                AllControls = (List<string>)ViewState["List_" + RPViw.ID + "_" + ((RadButton)sender).GroupName];

            string val_with_dep = null;
            string text_with_dep = null;

            List<string> ControlItemForDep = AllControls[0].Split(',').ToList();
            //"RTB_Chr,RadComboBox,Tbl_Chromosome,Chromosome,rcb_opr_RTB_Chr,chr"

            if (Session["HasDependency"].Equals("true") && ControlItemForDep[0].Equals("RTB_Chr"))
            {
                foreach (var contrl in AllControls)
                {
                    List<string> ControlItem = contrl.Split(',').ToList();
                    HiddenField hdn_opr = (HiddenField)RPViw.FindControl("hdn_" + ControlItem[0]);


                    switch (ControlItem[1])
                    {

                        case "RadNumericTextBox":
                            RadNumericTextBox rntbox = (RadNumericTextBox)RPViw.FindControl(ControlItem[0]);

                            //RadComboBox rncombox = (RadComboBox)RPViw.FindControl(ControlItem[4]);
                            string rntbox_txt = rntbox.Text;

                            switch (Session["ChrIncluded"])
                            {
                                case "true":
                                    if (!String.IsNullOrEmpty(rntbox_txt))
                                    {
                                        if (ControlItem[5].Equals("start_pos"))
                                        {
                                            val_with_dep += @", ""add_rule_pos"" : {" + @"""stop_pos"" :" + rntbox.Text;
                                            text_with_dep += ", start pos:" + rntbox.Text;
                                            Session["HasSPos"] = rntbox.Text;
                                        }
                                        if (ControlItem[5].Equals("stop_pos"))
                                        {
                                            val_with_dep += @", ""start_pos"" :" + rntbox.Text + "}";
                                            text_with_dep += ", end pos:" + rntbox.Text;

                                        }


                                    }
                                    else
                                    {
                                        val_with_dep = null;
                                        text_with_dep = null;

                                        ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Please enter start and end position!</b>'); height=120,width=250;", true);
                                        return;

                                    }

                                    break;
                                case "false":
                                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Please select a chromosone!</b>'); height=120,width=250);", true);
                                    break;
                                default:
                                    break;
                            }

                            break;
                        case "RadComboBox":
                            RadComboBox rcbox = (RadComboBox)RPViw.FindControl(ControlItem[0]);
                            rcbox.AutoPostBack = true;
                            var selectedItem = rcbox.SelectedItem;
                            if (selectedItem != null)
                            {
                                if (hdn_opr.Value == "1" && !hdn_opr.Value.Contains(","))
                                {
                                    if (ControlItem[5].Equals("chr") || ControlItem[5].Equals("Chr"))
                                    {
                                        Session["ChrIncluded"] = "true";
                                        //Session["Chr"] = selectedItem.Text;
                                        val_with_dep = @" ""field"": " + @" """ + rcbox.ToolTip.Trim() + @" "" , ""rule"": {" + @"""$eq""" + " : " + selectedItem.Value + "}";
                                        text_with_dep += "Chrom = " + selectedItem.Text;

                                    }
                                }
                            }
                            else
                            {
                                if (ControlItem[5].Equals("chr") || ControlItem[5].Equals("Chr"))
                                {
                                    Session["ChrIncluded"] = "false";
                                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Please select a chromosone!</b>'); height=120,width=250", true);
                                    return;
                                }
                            }
                            break;

                        default:
                            break;
                    }



                }
                RLB_Filter.Items.Add(new RadListBoxItem
                {
                    Value = val_with_dep,
                    Text = text_with_dep
                });
            }

            else if (Session["HasDependency"].Equals("true") && !ControlItemForDep[0].Equals("RTB_Chr"))
            {
                foreach (var contrl in AllControls)
                {
                    List<string> ControlItem = contrl.Split(',').ToList();
                    HiddenField hdn_opr = (HiddenField)RPViw.FindControl("hdn_" + ControlItem[0]);
                    //RadButton RBtn = (RadButton)RPViw.FindControl("btn_" + ControlItem[0]);
                    string valType = ControlItem[7].Trim();

                    switch (ControlItem[1])
                    {
                        case "RadTextBox":
                            RadTextBox rtbox = (RadTextBox)RPViw.FindControl(ControlItem[0]);
                            RadComboBox rcombox = (RadComboBox)RPViw.FindControl(ControlItem[4]);
                            string rtbox_txt = rtbox.Text;

                            if (!String.IsNullOrEmpty(rtbox_txt))
                            {
                                string opr = "";
                                if (rcombox != null)
                                    opr = rcombox.SelectedItem.Text;
                                else
                                    opr = "=";
                                //string opr = rcombox.SelectedItem.Text;
                                var opr_getPairsData = GetOperationPairs();
                                string opt_mongoDbName = (from oprMDB in opr_getPairsData where oprMDB.Value.Equals(opr) select oprMDB.Key).FirstOrDefault();

                                string valTxtBox = @" ""field"": " + @"""" + rtbox.ToolTip.TrimEnd().TrimStart() + @""" , ""rule"": {" + @"""" + opt_mongoDbName + @"""" + " : " + rtbox.Text + "}";
                                RLB_Filter.Items.Add(new RadListBoxItem
                                {
                                    Value = valTxtBox,
                                    Text = ControlItem[3] + opr + rtbox_txt
                                });
                            }
                            else
                            {
                                RLB_Filter.Items.Clear();
                                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Please enter a required field!</b>'); height=120,width=250", true);
                                return;
                            }
                            break;
                        case "RadNumericTextBox":
                            RadNumericTextBox rntbox = (RadNumericTextBox)RPViw.FindControl(ControlItem[0]);
                            RadComboBox rncombox = (RadComboBox)RPViw.FindControl(ControlItem[4]);
                            string rntbox_txt = rntbox.Text;

                            if (!String.IsNullOrEmpty(rntbox_txt))
                            {
                                string opr = "";
                                if (rncombox != null)
                                    opr = rncombox.SelectedItem.Text;
                                else
                                    opr = "=";
                                //string opr = rncombox.SelectedItem.Text;
                                var opr_getPairsData = GetOperationPairs();
                                string opt_mongoDbName = (from oprMDB in opr_getPairsData where oprMDB.Value.Equals(opr) select oprMDB.Key).FirstOrDefault();

                                string valRNTxt = @" ""field"": " + @" """ + rntbox.ToolTip + @" "" , ""rule"": {" + @"""" + opt_mongoDbName + @"""" + " : " + rntbox.Text + "}";
                                RLB_Filter.Items.Add(new RadListBoxItem
                                {
                                    Value = valRNTxt,
                                    Text = ControlItem[3] + opr + rntbox_txt
                                });
                            }
                            else
                            {
                                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Please enter a required field!</b>'); height=120,width=250", true);
                                return;
                            }
                            break;

                        case "RadComboBox":
                            RadComboBox rcbox = (RadComboBox)RPViw.FindControl(ControlItem[0]);
                            var selectedItem = rcbox.SelectedItem;

                            if (selectedItem != null)
                            {
                                string valRCB = @" ""field"": " + @" """ + rcbox.ToolTip + @" "" , ""rule"": {" + @"""$eq""" + " : " + selectedItem + "}";
                                RLB_Filter.Items.Add(new RadListBoxItem
                                {
                                    Value = valRCB,
                                    Text = ControlItem[3] + "=" + selectedItem
                                });
                            }
                            else
                            {
                                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Please select a required field!</b>'); height=120,width=250", true);
                                return;
                            }


                            break;

                        case "RadComboBoxMultiSelected":
                            RadComboBox rcboxMS = (RadComboBox)RPViw.FindControl(ControlItem[0]);

                            var collection = rcboxMS.CheckedItems;
                            if (collection.Count > 0)
                            {
                                foreach (var item in collection)
                                {
                                    rcbox_selectedList.Add(item.Value);
                                    rcbox_selectedListTxt.Add(item.Text);
                                }

                                string selectedList_CommaDelimited = string.Join(",", rcbox_selectedList.ToArray());
                                string selectedList_CommaDelimited_With_DubbleQuote = string.Join(",", selectedList_CommaDelimited.Split(',').Select(x => string.Format(@"""{0}""", x)).ToList());
                                string valRCBMS = @" ""field"": " + @"""" + rcboxMS.ToolTip.Trim() + @""" , ""rule"": {" + @"""$in""" + " : [" + selectedList_CommaDelimited_With_DubbleQuote + "]}";

                                //if (hdn_opr.Value == "1" && !hdn_opr.Value.Contains(","))
                                if (hdn_opr.Value == "1")
                                {
                                    RLB_Filter.Items.Add(new RadListBoxItem
                                    {
                                        Value = valRCBMS,
                                        Text = ControlItem[3] + "=" + string.Join(",", rcbox_selectedListTxt.ToArray())
                                    });
                                }
                                //else if ((RadComboBox)RPViw.FindControl(ControlItem[4]) != null)
                                //{
                                //    RadComboBox rcombox_opr = (RadComboBox)RPViw.FindControl(ControlItem[4]);
                                //    string opr = rcombox_opr.SelectedItem.Text;
                                //    RLB_Filter.Items.Add(new RadListBoxItem
                                //    {
                                //        Value = string.Join(",", rcbox_selectedList.ToArray()),
                                //        Text = ControlItem[3] + opr + string.Join(",", rcbox_selectedList.ToArray())
                                //    });
                                //}

                            }
                            else
                            {
                                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Please select a required field!</b>'); height=120,width=250", true);
                                return;
                            }

                            break;

                        case "RadAutoCompleteBox":
                            RadAutoCompleteBox racbox = (RadAutoCompleteBox)RPViw.FindControl(ControlItem[0]);

                            string valRACB = "";

                            List<string> collectionn = new List<string>();
                            if (racbox.Text != null)
                            {
                                foreach (AutoCompleteBoxEntry entry in racbox.Entries)
                                {
                                    collectionn.Add(entry.Value);
                                }
                            }

                            if (collectionn.Count > 0)
                            {
                                string selectedList_Txt = racbox.Text.Remove(racbox.Text.Trim().Length - 1);
                                selectedList_Txt = string.Join(",", selectedList_Txt.Split('|').ToList());

                                if (valType.Equals("String"))
                                {
                                    //string selectedList_CommaDelimited_With_DubbleQuote = string.Join(",", DelLastLine_Collection.Split('|').Select(x => string.Format(@"""{0}""", x)).ToList());
                                    string selectedList_CommaDelimited_With_DubbleQuote = string.Join(",", collectionn.Select(x => string.Format(@"""{0}""", x)).ToList());
                                    valRACB = @" ""field"": " + @"""" + racbox.ToolTip.Trim() + @""" , ""rule"": {" + @"""$in""" + " : [" + selectedList_CommaDelimited_With_DubbleQuote + "]" + "," + @" ""formula"" :" + @"""" + ControlItem[8] + @"""" + "} ";
                                }
                                if (valType.Equals("Integer") || valType.Equals("Decimal"))
                                {
                                    //string selectedList_CommaDelimited = string.Join(",", DelLastLine_Collection.Split('|').ToList());
                                    string selectedList_CommaDelimited = string.Join(",", collectionn.ToList());
                                    valRACB = @" ""field"": " + @"""" + racbox.ToolTip.Trim() + @""" , ""rule"": {" + @"""$in""" + " : [" + selectedList_CommaDelimited + "]" + "," + @" ""formula"" :" + @"""" + ControlItem[8] + @"""" + "} ";
                                }
                                if (hdn_opr.Value == "1")
                                {
                                    //val = @" ""field"": " + @" """ + racbox.ToolTip + @" "" , ""rule"": {" + @"""" + opt_mongoDbName + @"""" + " : " + rntbox.Text + "}";

                                    RLB_Filter.Items.Add(new RadListBoxItem
                                    {
                                        Value = valRACB,
                                        //Text = ControlItem[3] + "=" + DelLastLine_Collection
                                        Text = ControlItem[3] + "=" + selectedList_Txt
                                    });
                                }


                                //List<string> collectionn = new List<string>();
                                //if (racbox != null)
                                //{
                                //    foreach (AutoCompleteBoxEntry entry in racbox.Entries)
                                //    {
                                //        if (entry.Text == racbox.Text)
                                //        {
                                //            collectionn.Add(entry.Value);
                                //        }
                                //    }
                                //}
                                ////var collectionn = racbox.Text;
                                //if (collectionn.Count > 0)
                                //{
                                //    //string DelLastLine_Collection = collectionn.Remove(collectionn.Trim().Length - 1);
                                //    //string selectedList_CommaDelimited_With_DubbleQuote = string.Join(",", DelLastLine_Collection.Split('|').Select(x => string.Format(@"""{0}""", x)).ToList());

                                //    string selectedList_CommaDelimited_With_DubbleQuote = string.Join(",", collectionn.Select(x => string.Format(@"""{0}""", x)).ToList());

                                //    if (hdn_opr.Value == "1")
                                //    {
                                //        string valRACB = @" ""field"": " + @"""" + racbox.ToolTip.Trim() + @""" , ""rule"": {" + @"""$in""" + " : [" + selectedList_CommaDelimited_With_DubbleQuote + "]}";

                                //        //val = @" ""field"": " + @" """ + racbox.ToolTip + @" "" , ""rule"": {" + @"""" + opt_mongoDbName + @"""" + " : " + rntbox.Text + "}";

                                //        RLB_Filter.Items.Add(new RadListBoxItem
                                //        {
                                //            Value = valRACB,
                                //            //Text = ControlItem[3] + "=" + DelLastLine_Collection
                                //            Text = ControlItem[3] + "=" + racbox.Text
                                //        });
                                //    }
                                //else if ((RadComboBox)RPViw.FindControl(ControlItem[4]) != null)
                                //{
                                //    RadComboBox rcombox_opr = (RadComboBox)RPViw.FindControl(ControlItem[4]);
                                //    string opr = rcombox_opr.SelectedItem.Text;
                                //    RLB_Filter.Items.Add(new RadListBoxItem
                                //    {
                                //        Value = collectionn,
                                //        Text = ControlItem[3] + opr + collectionn
                                //    });
                                //}
                            }
                            else
                            {
                                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Please select a required field!</b>'); height=120,width=250", true);
                                return;
                            }
                            break;
                        case "RadCheckBoxList":
                            RadCheckBoxList rchkbox = (RadCheckBoxList)RPViw.FindControl(ControlItem[0]);

                            var col = rchkbox.SelectedItems;
                            if (col.Count > 0)
                            {
                                foreach (var item in col)
                                {
                                    rcbox_selectedList.Add(item.Value);
                                    rcbox_selectedListTxt.Add(item.Text);

                                }

                                string selectedList_CommaDelimited = string.Join(",", rcbox_selectedList.ToArray());
                                string selectedList_CommaDelimited_With_DubbleQuote = string.Join(",", selectedList_CommaDelimited.Split(',').Select(x => string.Format(@"""{0}""", x)).ToList());
                                string valRCBL = null;

                                if (hdn_opr.Value == "1" && !hdn_opr.Value.Contains(","))
                                {
                                    valRCBL = @" ""field"": " + @"""" + rchkbox.ToolTip.Trim() + @""" , ""rule"": {" + @"""$in""" + " : [" + selectedList_CommaDelimited_With_DubbleQuote + "]}";
                                    RLB_Filter.Items.Add(new RadListBoxItem
                                    {
                                        Value = valRCBL,
                                        Text = ControlItem[3] + "=" + string.Join(",", rcbox_selectedListTxt.ToArray())
                                    });
                                }
                                else if ((RadComboBox)RPViw.FindControl(ControlItem[4]) != null)
                                {
                                    RadComboBox rcombox_opr = (RadComboBox)RPViw.FindControl(ControlItem[4]);
                                    string opr = rcombox_opr.SelectedItem.Text;
                                    var opr_getPairsData = GetOperationPairs();
                                    string opt_mongoDbName = (from oprMDB in opr_getPairsData where oprMDB.Value.Equals(opr) select oprMDB.Key).FirstOrDefault();

                                    valRCBL = @" ""field"": " + @"""" + rchkbox.ToolTip.Trim() + @""" , ""rule"": {" + @"""" + opt_mongoDbName + @"""" + " : [" + selectedList_CommaDelimited_With_DubbleQuote + "]}";
                                    RLB_Filter.Items.Add(new RadListBoxItem
                                    {
                                        Value = valRCBL,
                                        Text = ControlItem[3] + opr + selectedList_CommaDelimited
                                    });
                                }
                            }
                            else
                            {
                                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Please check at least one field!</b>'); height=120,width=250", true);
                                return;
                            }
                            break;

                        case "RadComboBoxWithRadTextBox":
                            RadComboBox rcboxWTxt = (RadComboBox)RPViw.FindControl(ControlItem[0]);
                            RadNumericTextBox rntxtbox = (RadNumericTextBox)RPViw.FindControl("RTxt_" + ControlItem[0]);
                            var selectedItemWTxt = rcboxWTxt.SelectedItem;
                            string valCBWRTxt = null;

                            if (selectedItemWTxt != null && rntxtbox.Text != null)
                            {
                                if (hdn_opr != null && (hdn_opr.Value == "1" && !hdn_opr.Value.Contains(",")))
                                {
                                    valCBWRTxt = @" ""field"": " + @" """ + rcboxWTxt.SelectedValue + @" "" , ""rule"": {" + @"""$eq""" + " : " + rntxtbox.Text + "}";
                                    RLB_Filter.Items.Add(new RadListBoxItem
                                    {
                                        Value = valCBWRTxt,
                                        Text = rcboxWTxt.SelectedItem.Text + "=" + rntxtbox.Text
                                    });
                                }
                                else if ((RadComboBox)RPViw.FindControl(ControlItem[4]) != null)
                                {
                                    RadComboBox rcombox_opr = (RadComboBox)RPViw.FindControl(ControlItem[4]);
                                    string opr = rcombox_opr.SelectedItem.Text;
                                    var opr_getPairsData = GetOperationPairs();
                                    string opt_mongoDbName = (from oprMDB in opr_getPairsData where oprMDB.Value.Equals(opr) select oprMDB.Key).FirstOrDefault();

                                    valCBWRTxt = @" ""field"": " + @"""" + rcboxWTxt.SelectedValue + @""" , ""rule"": {" + @"""" + opt_mongoDbName + @"""" + " : " + rntxtbox.Text + "}";
                                    RLB_Filter.Items.Add(new RadListBoxItem
                                    {
                                        Value = valCBWRTxt,
                                        Text = rcboxWTxt.SelectedItem.Text + opr + rntxtbox.Text
                                    });
                                }
                            }
                            else
                            {
                                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Please select a required field!</b>'); height=120,width=250", true);
                                return;
                            }

                            break;

                        default:
                            break;
                    }

                }
            }

            if (Session["HasDependency"].Equals("false"))
            {
                foreach (var contrl in AllControls)
                {
                    List<string> ControlItem = contrl.Split(',').ToList();
                    HiddenField hdn_opr = (HiddenField)RPViw.FindControl("hdn_" + ControlItem[0]);
                    RadButton RBtn = (RadButton)RPViw.FindControl("btn_" + ControlItem[0]);
                    string valType = ControlItem[7].Trim();

                    if (RBtn.ID.Equals(((RadButton)sender).ID))
                    {

                        switch (ControlItem[1])
                        {
                            case "RadTextBox":
                                RadTextBox rtbox = (RadTextBox)RPViw.FindControl(ControlItem[0]);
                                RadComboBox rcombox = (RadComboBox)RPViw.FindControl(ControlItem[4]);
                                string rtbox_txt = rtbox.Text;

                                if (!String.IsNullOrEmpty(rtbox_txt))
                                {
                                    string opr = "";
                                    if (rcombox != null)
                                        opr = rcombox.SelectedItem.Text;
                                    else
                                        opr = "=";
                                    //string opr = rcombox.SelectedItem.Text;
                                    var opr_getPairsData = GetOperationPairs();
                                    string opt_mongoDbName = (from oprMDB in opr_getPairsData where oprMDB.Value.Equals(opr) select oprMDB.Key).FirstOrDefault();
                                    string valTxtBox;

                                    if (valType.Equals("String"))
                                        valTxtBox = @" ""field"":" + @"""" + rtbox.ToolTip.TrimEnd().TrimStart() + @""" , ""rule"": {" + @"""" + opt_mongoDbName + @"""" + ": " + @"""" + rtbox.Text + @"""" + "," + @" ""formula"" :" + @"""" + ControlItem[8] + @"""" + "} ";
                                    else
                                        valTxtBox = @" ""field"":" + @"""" + rtbox.ToolTip.TrimEnd().TrimStart() + @""" , ""rule"": {" + @"""" + opt_mongoDbName + @"""" + ": " + rtbox.Text + "," + @" ""formula"" :" + @"""" + ControlItem[8] + @"""" + "} ";

                                    RLB_Filter.Items.Add(new RadListBoxItem
                                    {
                                        Value = valTxtBox,
                                        Text = ControlItem[3] + opr + rtbox_txt
                                    });
                                }
                                else
                                {
                                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Please enter a required field!</b>'); height=120,width=250", true);
                                    return;
                                }
                                break;
                            case "RadNumericTextBox":
                                RadNumericTextBox rntbox = (RadNumericTextBox)RPViw.FindControl(ControlItem[0]);
                                RadComboBox rncombox = (RadComboBox)RPViw.FindControl(ControlItem[4]);
                                string rntbox_txt = rntbox.Text;

                                if (!String.IsNullOrEmpty(rntbox_txt))
                                {
                                    string opr = "";
                                    if (rncombox != null)
                                        opr = rncombox.SelectedItem.Text;
                                    else
                                        opr = "=";
                                    //{
                                    //    HiddenField hdnId = (HiddenField)RPViw.FindControl("hdn_"+ControlItem[0]);
                                    //    opr = hdnId.Value;
                                    //}

                                    var opr_getPairsData = GetOperationPairs();
                                    string opt_mongoDbName = (from oprMDB in opr_getPairsData where oprMDB.Value.Equals(opr) select oprMDB.Key).FirstOrDefault();

                                    string valRNTxt = @" ""field"": " + @" """ + rntbox.ToolTip.TrimEnd().TrimStart() + @""" , ""rule"": {" + @"""" + opt_mongoDbName + @"""" + " : " + rntbox.Text + "," + @" ""formula"" :" + @"""" + ControlItem[8] + @"""" + "} ";
                                    RLB_Filter.Items.Add(new RadListBoxItem
                                    {
                                        Value = valRNTxt,
                                        Text = ControlItem[3] + opr + rntbox_txt
                                    });
                                }
                                else
                                {
                                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Please enter a required field!</b>'); height=120,width=250", true);
                                    return;
                                }
                                break;

                            case "RadComboBox":
                                RadComboBox rcbox = (RadComboBox)RPViw.FindControl(ControlItem[0]);
                                var selectedItem = rcbox.SelectedItem;

                                if (selectedItem != null && valType.Equals("Integer"))
                                {
                                    string valRCB = @" ""field"": " + @" """ + rcbox.ToolTip + @" "" , ""rule"": {" + @"""$eq""" + " : " + selectedItem.Value + "," + @" ""formula"" :" + @"""" + ControlItem[8] + @"""" + "} ";
                                    RLB_Filter.Items.Add(new RadListBoxItem
                                    {
                                        Value = valRCB,
                                        Text = ControlItem[3] + "=" + selectedItem.Text
                                    });
                                }
                                else if (selectedItem != null && valType.Equals("String"))
                                {
                                    string valRCB = @" ""field"": " + @" """ + rcbox.ToolTip + @" "" , ""rule"": {" + @"""$eq""" + " : " + @"""" + selectedItem.Value + @"""" + "," + @" ""formula"" :" + @"""" + ControlItem[8] + @"""" + "} ";

                                    RLB_Filter.Items.Add(new RadListBoxItem
                                    {
                                        Value = valRCB,
                                        Text = ControlItem[3] + "=" + selectedItem.Text
                                    });
                                }
                                else
                                {
                                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Please select a required field!</b>'); height=120,width=250", true);
                                    return;
                                }


                                break;

                            case "RadComboBoxMultiSelected":
                                RadComboBox rcboxMS = (RadComboBox)RPViw.FindControl(ControlItem[0]);

                                var collection = rcboxMS.CheckedItems;
                                if (collection.Count > 0)
                                {
                                    foreach (var item in collection)
                                    {
                                        rcbox_selectedList.Add(item.Value);
                                        rcbox_selectedListTxt.Add(item.Text);
                                    }

                                    string selectedList_CommaDelimited = string.Join(",", rcbox_selectedList.ToArray());
                                    string valRCBMS = "";

                                    if (valType.Equals("String"))
                                    {
                                        string selectedList_CommaDelimited_With_DubbleQuote = string.Join(",", selectedList_CommaDelimited.Split(',').Select(x => string.Format(@"""{0}""", x)).ToList());
                                        valRCBMS = @" ""field"": " + @"""" + rcboxMS.ToolTip.Trim() + @""" , ""rule"": {" + @"""$in""" + " : [" + selectedList_CommaDelimited_With_DubbleQuote + "]" + "," + @" ""formula"" :" + @"""" + ControlItem[8] + @"""" + "} ";
                                    }
                                    if (valType.Equals("Integer"))
                                    {
                                        valRCBMS = @" ""field"": " + @"""" + rcboxMS.ToolTip.Trim() + @""" , ""rule"": {" + @"""$in""" + " : [" + selectedList_CommaDelimited + "]" + "," + @" ""formula"" :" + @"""" + ControlItem[8] + @"""" + "} ";
                                    }
                                    //if (hdn_opr.Value == "1" && !hdn_opr.Value.Contains(","))
                                    if (hdn_opr.Value == "1")
                                    {
                                        RLB_Filter.Items.Add(new RadListBoxItem
                                        {
                                            Value = valRCBMS,
                                            Text = ControlItem[3] + "=" + string.Join(",", rcbox_selectedListTxt.ToArray())
                                        });
                                    }
                                    //else if ((RadComboBox)RPViw.FindControl(ControlItem[4]) != null)
                                    //{
                                    //    RadComboBox rcombox_opr = (RadComboBox)RPViw.FindControl(ControlItem[4]);
                                    //    string opr = rcombox_opr.SelectedItem.Text;
                                    //    RLB_Filter.Items.Add(new RadListBoxItem
                                    //    {
                                    //        Value = string.Join(",", rcbox_selectedList.ToArray()),
                                    //        Text = ControlItem[3] + opr + string.Join(",", rcbox_selectedList.ToArray())
                                    //    });
                                    //}

                                }
                                else
                                {
                                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Please select a required field!</b>'); height=120,width=250", true);
                                    return;
                                }

                                break;

                            case "RadAutoCompleteBox":
                                RadAutoCompleteBox racbox = (RadAutoCompleteBox)RPViw.FindControl(ControlItem[0]);
                                string valRACB = "";

                                List<string> collectionn = new List<string>();
                                if (racbox.Text != null)
                                {
                                    foreach (AutoCompleteBoxEntry entry in racbox.Entries)
                                    {
                                        collectionn.Add(entry.Value);
                                    }
                                }

                                // var collectionn = racbox.Text;
                                // if (!String.IsNullOrEmpty(collectionn))
                                if (collectionn.Count > 0)
                                {
                                    //string DelLastLine_Collection = collectionn.ToList().ToString();
                                    string selectedList_Txt = racbox.Text.Remove(racbox.Text.Trim().Length - 1);
                                    selectedList_Txt = string.Join(",", selectedList_Txt.Split('|').ToList());

                                    if (valType.Equals("String"))
                                    {
                                        //string selectedList_CommaDelimited_With_DubbleQuote = string.Join(",", DelLastLine_Collection.Split('|').Select(x => string.Format(@"""{0}""", x)).ToList());
                                        string selectedList_CommaDelimited_With_DubbleQuote = string.Join(",", collectionn.Select(x => string.Format(@"""{0}""", x)).ToList());
                                        valRACB = @" ""field"": " + @"""" + racbox.ToolTip.Trim() + @""" , ""rule"": {" + @"""$in""" + " : [" + selectedList_CommaDelimited_With_DubbleQuote + "]" + "," + @" ""formula"" :" + @"""" + ControlItem[8] + @"""" + "} ";
                                    }
                                    if (valType.Equals("Integer") || valType.Equals("Decimal"))
                                    {
                                        //string selectedList_CommaDelimited = string.Join(",", DelLastLine_Collection.Split('|').ToList());
                                        string selectedList_CommaDelimited = string.Join(",", collectionn.ToList());
                                        valRACB = @" ""field"": " + @"""" + racbox.ToolTip.Trim() + @""" , ""rule"": {" + @"""$in""" + " : [" + selectedList_CommaDelimited + "]" + "," + @" ""formula"" :" + @"""" + ControlItem[8] + @"""" + "} ";
                                    }
                                    if (hdn_opr.Value == "1")
                                    {
                                        //val = @" ""field"": " + @" """ + racbox.ToolTip + @" "" , ""rule"": {" + @"""" + opt_mongoDbName + @"""" + " : " + rntbox.Text + "}";

                                        RLB_Filter.Items.Add(new RadListBoxItem
                                        {
                                            Value = valRACB,
                                            //Text = ControlItem[3] + "=" + DelLastLine_Collection
                                            Text = ControlItem[3] + "=" + selectedList_Txt
                                        });
                                    }
                                    //else if ((RadComboBox)RPViw.FindControl(ControlItem[4]) != null)
                                    //{
                                    //    RadComboBox rcombox_opr = (RadComboBox)RPViw.FindControl(ControlItem[4]);
                                    //    string opr = rcombox_opr.SelectedItem.Text;
                                    //    RLB_Filter.Items.Add(new RadListBoxItem
                                    //    {
                                    //        Value = collectionn,
                                    //        Text = ControlItem[3] + opr + collectionn
                                    //    });
                                    //}
                                }
                                else
                                {
                                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Please select a required field!</b>'); height=120,width=250", true);
                                    return;
                                }
                                break;
                            case "RadCheckBoxList":
                                RadCheckBoxList rchkbox = (RadCheckBoxList)RPViw.FindControl(ControlItem[0]);

                                var col = rchkbox.SelectedItems;
                                if (col.Count > 0)
                                {
                                    foreach (var item in col)
                                    {
                                        rcbox_selectedList.Add(item.Value);
                                        rcbox_selectedListTxt.Add(item.Text);

                                    }

                                    string selectedList_CommaDelimited = string.Join(",", rcbox_selectedList.ToArray());
                                    string selectedList_CommaDelimited_With_DubbleQuote = string.Join(",", selectedList_CommaDelimited.Split(',').Select(x => string.Format(@"""{0}""", x)).ToList());
                                    string valRCBL = null;

                                    if (hdn_opr.Value == "1" && !hdn_opr.Value.Contains(","))
                                    {
                                        if (valType.Equals("String"))
                                            valRCBL = @" ""field"": " + @"""" + rchkbox.ToolTip.Trim() + @""" , ""rule"": {" + @"""$in""" + " : [" + selectedList_CommaDelimited_With_DubbleQuote + "]" + "," + @" ""formula"" :" + @"""" + ControlItem[8] + @"""" + "} ";
                                        if (valType.Equals("Integer"))
                                            valRCBL = @" ""field"": " + @"""" + rchkbox.ToolTip.Trim() + @""" , ""rule"": {" + @"""$in""" + " : [" + selectedList_CommaDelimited + "]" + "," + @" ""formula"" :" + @"""" + ControlItem[8] + @"""" + "} ";

                                        RLB_Filter.Items.Add(new RadListBoxItem
                                        {
                                            Value = valRCBL,
                                            Text = ControlItem[3] + "=" + string.Join(",", rcbox_selectedListTxt.ToArray())
                                        });
                                    }
                                    else if ((RadComboBox)RPViw.FindControl(ControlItem[4]) != null)
                                    {
                                        RadComboBox rcombox_opr = (RadComboBox)RPViw.FindControl(ControlItem[4]);
                                        string opr = rcombox_opr.SelectedItem.Text;
                                        var opr_getPairsData = GetOperationPairs();
                                        string opt_mongoDbName = (from oprMDB in opr_getPairsData where oprMDB.Value.Equals(opr) select oprMDB.Key).FirstOrDefault();

                                        valRCBL = @" ""field"": " + @"""" + rchkbox.ToolTip.Trim() + @""" , ""rule"": {" + @"""" + opt_mongoDbName + @"""" + " : [" + selectedList_CommaDelimited_With_DubbleQuote + "]" + "," + @" ""formula"" :" + @"""" + ControlItem[8] + @"""" + "} ";
                                        RLB_Filter.Items.Add(new RadListBoxItem
                                        {
                                            Value = valRCBL,
                                            Text = ControlItem[3] + opr + selectedList_CommaDelimited
                                        });
                                    }
                                }
                                else
                                {
                                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Please check at least one field!</b>'); height=120,width=250", true);
                                    return;
                                }
                                break;

                            case "RadComboBoxWithRadTextBox":
                                RadComboBox rcboxWTxt = (RadComboBox)RPViw.FindControl(ControlItem[0]);
                                RadNumericTextBox rntxtbox = (RadNumericTextBox)RPViw.FindControl("RTxt_" + ControlItem[0]);
                                var selectedItemWTxt = rcboxWTxt.SelectedItem;
                                string valCBWRTxt = null;

                                if (selectedItemWTxt != null && rntxtbox.Text != null)
                                {
                                    if (hdn_opr != null && (hdn_opr.Value == "1" && !hdn_opr.Value.Contains(",")))
                                    {
                                        valCBWRTxt = @" ""field"": " + @" """ + rcboxWTxt.SelectedValue + @" "" , ""rule"": {" + @"""$eq""" + " : " + rntxtbox.Text + "," + @" ""formula"" :" + @"""" + ControlItem[8] + @"""" + "} ";

                                        RLB_Filter.Items.Add(new RadListBoxItem
                                        {
                                            Value = valCBWRTxt,
                                            Text = rcboxWTxt.SelectedItem.Text + "=" + rntxtbox.Text
                                        });
                                    }
                                    else if ((RadComboBox)RPViw.FindControl(ControlItem[4]) != null)
                                    {
                                        RadComboBox rcombox_opr = (RadComboBox)RPViw.FindControl(ControlItem[4]);
                                        string opr = rcombox_opr.SelectedItem.Text;
                                        var opr_getPairsData = GetOperationPairs();
                                        string opt_mongoDbName = (from oprMDB in opr_getPairsData where oprMDB.Value.Equals(opr) select oprMDB.Key).FirstOrDefault();

                                        valCBWRTxt = @" ""field"": " + @"""" + rcboxWTxt.SelectedValue + @""" , ""rule"": {" + @"""" + opt_mongoDbName + @"""" + " : " + rntxtbox.Text + "," + @" ""formula"" :" + @"""" + ControlItem[8] + @"""" + "} ";

                                        RLB_Filter.Items.Add(new RadListBoxItem
                                        {
                                            Value = valCBWRTxt,
                                            Text = rcboxWTxt.SelectedItem.Text + opr + rntxtbox.Text
                                        });
                                    }
                                }
                                else
                                {
                                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Please select a required field!</b>'); height=120,width=250", true);
                                    return;
                                }
                                //RadComboBox rcboxWTxt = (RadComboBox)RPViw.FindControl(ControlItem[0]);
                                //var selectedItemWTxt = rcboxWTxt.SelectedItem;
                                //if (selectedItemWTxt != null)
                                //{
                                //    if (hdn_opr.Value == "1" && !hdn_opr.Value.Contains(","))
                                //    {
                                //        if (ControlItem[5].Equals("chr") || ControlItem[5].Equals("Chr"))
                                //        {
                                //            Session["ChrIncluded"] = "true";
                                //            Session["Chr"] = selectedItem.Text;
                                //            val_with_dep = @" ""field"": " + @" """ + rcbox.ToolTip + @" "" , ""rule"": {" + @"""$eq""" + " : " + selectedItem.Text + "}";
                                //            text_with_dep += "Chrom = " + selectedItem.Text;

                                //        }
                                //    }
                                //}
                                //else
                                //{
                                //    if (ControlItem[5].Equals("chr") || ControlItem[5].Equals("Chr"))
                                //    {
                                //        Session["ChrIncluded"] = "false";
                                //        ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Please select a chromosone!</b>'); height=120,width=250", true);
                                //        return;
                                //    }
                                //}
                                break;

                            default:
                                break;
                        }
                    }
                }
            }


            AddNewAjaxSetting(btnId, "RLB_Filter");
        }

        protected RadButton CreateDynamicAddButton(string id, int groupId)
        {
            RadButton btnAdd = new RadButton()
            {
                ID = id,
                Text = "Add to list",
                GroupName = groupId.ToString()
            };

            btnAdd.CssClass = "btn btn-info mr-1 ladda-button btn-sm";
            btnAdd.ForeColor = System.Drawing.Color.White;
            btnAdd.Text = "Add to list";
            btnAdd.Attributes.Add("runat", "server");
            AddNewAjaxSetting(btnAdd.ID, btnAdd.ID);
            btnAdd.Click += new EventHandler(ButtonAdd_Click);
            return btnAdd;
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

        private void Fetch_Count_Of_Data()
        {

            Session["baseCount"] = Session["Trio_TotalCount"];

        }

        private void FirstItem_Insert()
        {

            String connstring = CnnStr;
            SqlConnection conn = new SqlConnection(connstring);
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand("Sp_Filter_FirstItem_Ins", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FilterID", SqlDbType.Int);
            cmd.Parameters["@FilterID"].Value = Convert.ToInt32(Session["FilterID_Filter"].ToString());
            SqlDataAdptrCmd.SelectCommand = cmd;

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (SqlException se)
            {
                string msg = se.Message;
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Something went wrong while the first item inserted! Err: </b>" + msg + "'); height=120,width=250", true);
                return;
            }
            catch (Exception ex)
            {
                string msg = ex.Message;
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Something went wrong! Err: </b>" + msg + "'); height=120,width=250", true);
                return;
            }
            finally
            {
                cmd.Connection.Close();
            }

        }
        private void DisplayData(int selectedLevel)
        {
            RLB_Filter.CssClass = RLB_Filter.CssClass.Replace("disabledDiv", "");
            PanelOrgChart.CssClass = PanelOrgChart.CssClass.Replace("disabledDiv", "");
            RLB_Condition.CssClass = "disabledDiv";
            RDDL_Parent.CssClass = "disabledDiv";
            btnShow.CssClass = "disabledDiv";
            ShowResultCondition.CssClass = "disabledDiv";
            leftTabDiv.Attributes.Add("class", leftTabDiv.Attributes["class"].ToString().Replace("disabledDiv", ""));
            Del_RDD_FilterSet.Enabled = true;
            lbl_Status.Text = "Calculation in progress!";
            RLB_Condition.Items.Clear();


            String connstring = CnnStr;
            SqlConnection conn = new SqlConnection(connstring);
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();

            //sqlcommand for Update(U), Insert(I) and Select(S) from table
            //SqlCommand cmdUIS = new SqlCommand("Sp_GAP_Add_Items_To_FilterItems_And_Chart", conn);
            SqlCommand cmdUIS = new SqlCommand("Sp_Filter_SelectedItems_Ins", conn);
            cmdUIS.CommandType = CommandType.StoredProcedure;

            cmdUIS.Parameters.Add("@FilterID", SqlDbType.Int);
            cmdUIS.Parameters.Add("@Field", SqlDbType.NVarChar);
            cmdUIS.Parameters.Add("@Condition", SqlDbType.NVarChar);
            cmdUIS.Parameters.Add("@Parent", SqlDbType.Int);



            if (Session["FilterID_Filter"] == null)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Please select your filterset or make a new one! </b>'); height=120,width=250", true);
                return;
            }
            else
                cmdUIS.Parameters["@FilterID"].Value = Convert.ToInt32(Session["FilterID_Filter"]);


            cmdUIS.Parameters["@Field"].Value = RLB_Filter.SelectedItem.Value.Trim();
            cmdUIS.Parameters["@Condition"].Value = RLB_Filter.SelectedItem.Text;

            if (RDDL_Parent.SelectedItem.Text != null)
                cmdUIS.Parameters["@Parent"].Value = Convert.ToInt32(RDDL_Parent.SelectedItem.Text);

            SqlDataAdptrCmd.SelectCommand = cmdUIS;
            DataTable myDataTable = new DataTable();

            //-----fetch result from #temp table and copy it in filterItemResultList
            List<FilterItems> filterItemResultList = new List<FilterItems>();

            //try
            //{
            conn.Open();
            SqlDataAdptrCmd.Fill(myDataTable);
            conn.Close();

            Session["SelectedItem_Parent"] = selectedLevel.ToString();

            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "btnShow", "get_reqId(" + selectedLevel.ToString() + "," + Session["basedonIndividual"] + ");", true);
            //btnGetReqId_Click(null, EventArgs.Empty);


            if (myDataTable.Rows.Count > 0)
            {
                for (int i = 0; i < myDataTable.Rows.Count; i++)
                {
                    FilterItems FItem = new FilterItems();

                    FItem.setLevel(Convert.ToInt32(myDataTable.Rows[i]["Level"]));
                    FItem.setType(myDataTable.Rows[i]["Type"].ToString());
                    FItem.setParent(Convert.ToInt32(myDataTable.Rows[i]["Parent"]));
                    string dbCon = myDataTable.Rows[i]["Field"].ToString();
                    if (dbCon != "")
                    {
                        listOfCond.Add(new Tuple<int, string>(Convert.ToInt32(myDataTable.Rows[i]["Level"]), myDataTable.Rows[i]["Condition"].ToString()));
                        FItem.setCondition(myDataTable.Rows[i]["Condition"].ToString());
                        FItem.setField(myDataTable.Rows[i]["Field"].ToString());
                    }
                    //else
                    //{
                    //    FItem.setResult(-1);
                    //}


                    filterItemList.Add(FItem);
                }
            }



            FilterItems firstItem = (from f in filterItemList where f.getParent() == -1 select f).First();
            var firstUl = new HtmlGenericControl("ul");
            var firstLi = new HtmlGenericControl("li");
            firstLi.Attributes.Add("class", "node");

            var firstdiamondshape = new HtmlGenericControl("div");
            var firstconditiondiv = new HtmlGenericControl("div");

            //if (Convert.ToInt32(RDDL_Parent.SelectedValue) == 1)
            //    firstLi.Style.Add("margin-left", "19px");
            //else if (Convert.ToInt32(RDDL_Parent.SelectedValue) == 2)
            //    firstLi.Style.Add("margin-left", "1px");
            //else
            firstLi.Style.Add("margin-left", "2px");


            firstdiamondshape.Attributes.Add("class", "diamond-shape");
            firstconditiondiv.Attributes.Add("class", "innernodecontent");
            firstconditiondiv.Attributes.Add("runat", "server");
            firstconditiondiv.InnerText = "C" + firstItem.getLevel();
            firstconditiondiv.Attributes.Add("title", firstItem.getCondition());
            string gg = firstItem.getField();

            if (!String.IsNullOrEmpty(firstItem.getCondition()))
            {
                RadListBoxItem RLBI_Condition = new RadListBoxItem(firstItem.getLevel() + " - " + firstItem.getCondition().ToString(), firstItem.getLevel().ToString());
                RLBI_Condition.Checkable = false;

                RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");

                int strLength = firstItem.getCondition().Length;
                if (strLength > 10)
                    lblcond.Text = "C" + firstItem.getLevel().ToString() + ": " + firstItem.getCondition().Substring(0, 10) + "...";
                else
                    lblcond.Text = "C" + firstItem.getLevel().ToString() + ": " + firstItem.getCondition().Substring(0, 5) + "...";

                lblcond.ToolTip = firstItem.getCondition().ToString();
                lblcond.Style.Add("padding-left", "20px");

                CheckBox chkboxResult = (CheckBox)RLB_Condition.FindControl("chkbox_Sel_condition_result");

                RLB_Condition.Items.Add(RLBI_Condition);
            }


            firstdiamondshape.Controls.Add(firstconditiondiv);
            firstLi.Controls.Add(firstdiamondshape);
            firstUl.Controls.Add(firstLi);
            rootLi.Controls.Add(firstUl);

            List<FilterItems> parentItems = (from a in filterItemList where a.getParent() == 0 select a).ToList();

            var ul = new HtmlGenericControl("ul");

            firstLi.Controls.Add(ul);
            foreach (var parentcat in parentItems)
            {
                var li = new HtmlGenericControl("li");
                var div = new HtmlGenericControl("div");

                div.Attributes.Add("class", "nodecontent");
                div.InnerHtml = parentcat.getLevel().ToString();

                if (parentcat.getType() == "fail")
                    div.Style.Add("background-color", "#fcbba1");
                else if (parentcat.getType() == "pass")
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
                    conditiondiv.Attributes.Add("title", parentcat.getCondition().ToString());

                    RadListBoxItem RLBI_Condition = new RadListBoxItem(parentcat.getLevel() + " - " + parentcat.getCondition().ToString(), parentcat.getLevel().ToString());
                    RLBI_Condition.Checkable = false;

                    RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                    Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");

                    int strLength = parentcat.getCondition().Length;
                    if (strLength > 10)
                        lblcond.Text = "C" + parentcat.getLevel().ToString() + ": " + parentcat.getCondition().Substring(0, 10) + "...";
                    else
                        lblcond.Text = "C" + parentcat.getLevel().ToString() + ": " + parentcat.getCondition().Substring(0, 5) + "...";

                    lblcond.ToolTip = parentcat.getCondition().ToString();
                    lblcond.Style.Add("padding-left", "20px");

                    RLB_Condition.Items.Add(RLBI_Condition);

                    li.Controls.Add(div);
                    diamondshape.Controls.Add(conditiondiv);
                    li.Controls.Add(diamondshape);
                }
                else
                {
                    li.Attributes.Add("class", "leaf");
                    int selected = Convert.ToInt32(RDDL_Parent.SelectedText);
                    string cond = (from l in listOfCond where l.Item1 == parentcat.getParent() select l.Item2).FirstOrDefault();
                    if (!String.IsNullOrEmpty(cond))
                    {
                        if (parentcat.getType().Equals("fail"))
                        {
                            RadListBoxItem RLBI_Condition = new RadListBoxItem(parentcat.getLevel() + " - Not " + cond + " ( items : in progress... )", parentcat.getLevel().ToString());
                            RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                            Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                            lblcond.Text = "C" + parentcat.getLevel().ToString() + " - ( items : in progress... )";
                            lblcond.ToolTip = "Not " + cond;

                            RLB_Condition.Items.Add(RLBI_Condition);

                            RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).Style.Add("color", "#fc9272"); //---red
                            RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).FindControl("RB_Delete_Condition").Visible = false;

                        }
                        else if (parentcat.getType().Equals("pass"))
                        {
                            RadListBoxItem RLBI_Condition = new RadListBoxItem(parentcat.getLevel() + " - " + cond + " ( items : in progress... ) ", parentcat.getLevel().ToString());
                            RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                            Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                            lblcond.Text = "C" + parentcat.getLevel().ToString() + " - ( items : in progress... )";
                            lblcond.ToolTip = cond;

                            RLB_Condition.Items.Add(RLBI_Condition);

                            RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).Style.Add("color", "#74c476"); //---green
                            RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).FindControl("RB_Delete_Condition").Visible = false;

                        }
                    }

                    li.Controls.Add(div);
                }

                ul.Controls.Add(li);

                List<FilterItems> childItems = (from a in filterItemList where a.getParent() == parentcat.getLevel() select a).ToList();
                if (childItems.Count > 0)
                    li.Controls.Add(AddChildItem(parentcat, li, false));
            }

            //conn.Close();
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

            RDDL_Parent.Items.Sort(x => Convert.ToInt32(x.Value));

            //}
            //catch (SqlException ex)
            //{
            //    string msg = "Insert or Update Error:";
            //    msg += ex.Message;
            //}
            //catch (Exception ex)
            //{
            //    string msg = "Error:";
            //    msg += ex.Message;
            //}
            //finally
            //{
            //    conn.Close();
            //}
        }

        private HtmlGenericControl AddChildItem(FilterItems childItem, HtmlGenericControl pLi, Boolean withResult)
        {
            var ul = new HtmlGenericControl("ul");
            List<FilterItems> childItems = (from a in filterItemList where a.getParent() == childItem.getLevel() select a).ToList();
            var counter = 0;
            foreach (FilterItems cItem in childItems)
            {
                var li = new HtmlGenericControl("li");
                var div = new HtmlGenericControl("div");

                div.Attributes.Add("class", "nodecontent");
                div.InnerText = cItem.getLevel().ToString();

                if (cItem.getType().Equals("fail"))
                    div.Style.Add("background-color", "#fcbba1");
                else if (cItem.getType().Equals("pass"))
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
                    conditiondiv.Attributes.Add("title", cItem.getCondition());

                    RadListBoxItem RLBI_Condition = new RadListBoxItem(cItem.getLevel() + " - " + cItem.getCondition().ToString(), cItem.getLevel().ToString());
                    RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);
                    RLBI_Condition.Checkable = false;

                    Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");

                    int strLength = cItem.getCondition().Length;
                    if (strLength > 10)
                        lblcond.Text = GetSpaces(cItem.getParent()) + "C" + cItem.getLevel().ToString() + ": " + cItem.getCondition().Substring(0, 10) + "...";
                    else
                        lblcond.Text = GetSpaces(cItem.getParent()) + "C" + cItem.getLevel().ToString() + ": " + cItem.getCondition().Substring(0, 5) + "...";


                    lblcond.ToolTip = cItem.getCondition().ToString();
                    lblcond.Style.Add("padding-left", "20px");

                    RLB_Condition.Items.Add(RLBI_Condition);

                    li.Controls.Add(div);
                    diamondshape.Controls.Add(conditiondiv);
                    li.Controls.Add(diamondshape);
                    counter++;
                }
                else
                {
                    li.Attributes.Add("class", "leaf");

                    string cond = (from l in listOfCond where l.Item1 == cItem.getParent() select l.Item2).FirstOrDefault();
                    if (!String.IsNullOrEmpty(cond))
                    {
                        if (cItem.getType().Equals("fail"))
                        {
                            RadListBoxItem RLBI_Condition;

                            if (withResult)
                                RLBI_Condition = new RadListBoxItem(cItem.getLevel() + " - Not " + cond + " ( items : " + cItem.getResult().ToString() + " )", cItem.getLevel().ToString());
                            else
                                RLBI_Condition = new RadListBoxItem(cItem.getLevel() + " - Not " + cond + " ( items : in progress... )", cItem.getLevel().ToString());

                            RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);
                            Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                            if (withResult)
                                lblcond.Text = GetSpaces(cItem.getParent()) + "C" + cItem.getLevel().ToString() + " - ( items : " + cItem.getResult().ToString() + " )";
                            else
                                lblcond.Text = GetSpaces(cItem.getParent()) + "C" + cItem.getLevel().ToString() + " - ( items : in progress... )";

                            lblcond.ToolTip = "Not " + cond;

                            RLB_Condition.Items.Add(RLBI_Condition);
                            RLB_Condition.FindItemByValue(cItem.getLevel().ToString()).Style.Add("color", "#fc9272"); //---red
                            RLB_Condition.FindItemByValue(cItem.getLevel().ToString()).FindControl("RB_Delete_Condition").Visible = false;

                        }
                        else if (cItem.getType().Equals("pass"))
                        {
                            RadListBoxItem RLBI_Condition;
                            if (withResult)
                                RLBI_Condition = new RadListBoxItem(cItem.getLevel() + " - " + cond + " ( items : " + cItem.getResult().ToString() + " )", cItem.getLevel().ToString());
                            else
                                RLBI_Condition = new RadListBoxItem(cItem.getLevel() + " - " + cond + " ( items : in progress... )", cItem.getLevel().ToString());

                            RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                            Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                            if (withResult)
                                lblcond.Text = GetSpaces(cItem.getParent()) + "C" + cItem.getLevel().ToString() + " - ( items : " + cItem.getResult().ToString() + " )";
                            else
                                lblcond.Text = GetSpaces(cItem.getParent()) + "C" + cItem.getLevel().ToString() + " - ( items : in progress... )";

                            lblcond.ToolTip = cond;

                            RLB_Condition.Items.Add(RLBI_Condition);
                            RLB_Condition.FindItemByValue(cItem.getLevel().ToString()).Style.Add("color", "#74c476"); //---green
                            RLB_Condition.FindItemByValue(cItem.getLevel().ToString()).FindControl("RB_Delete_Condition").Visible = false;

                        }
                    }

                    div.InnerText = cItem.getLevel().ToString();
                    li.Controls.Add(div);
                }

                List<FilterItems> subChilds = (from a in filterItemList where a.getParent() == cItem.getLevel() select a).ToList();
                if (subChilds.Count > 0)
                {
                    AddChildItem(cItem, li, withResult);
                }
                ul.Controls.Add(li);
            }

            pLi.Controls.Add(ul);
            return ul;
        }

        private int GetReqId_GetResult(int selectedLevel)
        {
            //Sp_Filter_Result_Count_Sel
            String connstring = CnnStr;
            SqlConnection conn = new SqlConnection(connstring);
            SqlDataAdapter SqlDataAdpt = new SqlDataAdapter();
            SqlCommand cmdRslt = new SqlCommand("Sp_GAP_Trio_Filter_Count_ReqId_Sel", conn);
            cmdRslt.CommandType = CommandType.StoredProcedure;



            cmdRslt.Parameters.Add("@TrioLocalID", SqlDbType.NVarChar, 500);
            cmdRslt.Parameters["@TrioLocalID"].Value = Session["TriolocalID"].ToString();
            cmdRslt.Parameters.Add("@TrioCode", SqlDbType.NVarChar, 3);
            cmdRslt.Parameters["@TrioCode"].Value = Session["InWhichOneExists"].ToString();
            cmdRslt.Parameters.Add("@FilterID", SqlDbType.Int);
            cmdRslt.Parameters["@FilterID"].Value = Convert.ToInt32(Session["FilterID_Filter"].ToString());
            cmdRslt.Parameters.Add("@UserID", SqlDbType.Int);
            cmdRslt.Parameters["@UserID"].Value = Convert.ToInt32(Session["WiNGSMasterId"].ToString());
            cmdRslt.Parameters.Add("@CenterID", SqlDbType.Int);
            cmdRslt.Parameters["@CenterID"].Value = Convert.ToInt32(Session["Current_CenterID"].ToString());
            cmdRslt.Parameters.Add("@RefBuild", SqlDbType.VarChar, 20);
            cmdRslt.Parameters["@RefBuild"].Value = Session["Trio_Refbuild_ID"].ToString();
            cmdRslt.Parameters.Add("@SelectedLevel", SqlDbType.Int);
            cmdRslt.Parameters["@SelectedLevel"].Value = selectedLevel;
            cmdRslt.Parameters.Add("@IndividualID", SqlDbType.BigInt);
            cmdRslt.Parameters["@IndividualID"].Value = RCB_Individuals.SelectedValue;
            cmdRslt.Parameters.Add("@ReqId", SqlDbType.Int, 20);
            cmdRslt.Parameters["@ReqId"].Direction = ParameterDirection.Output;

            SqlDataAdpt.SelectCommand = cmdRslt;

            try
            {
                conn.Open();
                cmdRslt.ExecuteNonQuery();
                return Convert.ToInt32(cmdRslt.Parameters["@ReqId"].Value.ToString());

            }
            catch (SqlException ex)
            {
                string msg = "Get Result Error:";
                msg += ex.Message;
                return -1;
            }
            finally
            {
                conn.Close();
            }

        }
        private List<FilterItems> GetResult(int selectedLevel)
        {
            int reqId = GetReqId_GetResult(selectedLevel);



            List<FilterItems> filterItemResultList = new List<FilterItems>();
            String connstring = CnnStr;
            SqlConnection conn = new SqlConnection(connstring);
            SqlDataAdapter SqlDataAdpt = new SqlDataAdapter();
            SqlCommand cmdRslt = new SqlCommand("Sp_GAP_Trio_Filter_Count_Result_Sel", conn);
            cmdRslt.CommandType = CommandType.StoredProcedure;



            cmdRslt.Parameters.Add("@FilterID", SqlDbType.Int);
            cmdRslt.Parameters["@FilterID"].Value = Convert.ToInt32(Session["FilterID_Filter"].ToString());

            cmdRslt.Parameters.Add("@UserID", SqlDbType.Int);
            cmdRslt.Parameters["@UserID"].Value = Convert.ToInt32(Session["WiNGSMasterId"].ToString());

            cmdRslt.Parameters.Add("@CenterID", SqlDbType.Int);
            cmdRslt.Parameters["@CenterID"].Value = Convert.ToInt32(Session["Current_CenterID"].ToString());

            cmdRslt.Parameters.Add("@TrioLocalID", SqlDbType.NVarChar, 500);
            cmdRslt.Parameters["@TrioLocalID"].Value = Session["TrioLocalID"];

            cmdRslt.Parameters.Add("@ReqId", SqlDbType.Int);
            cmdRslt.Parameters["@ReqId"].Value = reqId;

            SqlDataAdpt.SelectCommand = cmdRslt;
            DataTable myDataTableRslt = new DataTable();

            try
            {
                conn.Open();
                //cmdRslt.ExecuteNonQuery();
                SqlDataAdpt.Fill(myDataTableRslt);

                if (myDataTableRslt.Rows.Count > 0)
                {
                    for (int i = 0; i < myDataTableRslt.Rows.Count; i++)
                    {
                        FilterItems RItem = new FilterItems();
                        if (!String.IsNullOrEmpty(myDataTableRslt.Rows[i]["Result"].ToString()))
                        {
                            RItem.setResult(Convert.ToInt32(myDataTableRslt.Rows[i]["Result"]));
                            RItem.setLevel(Convert.ToInt32(myDataTableRslt.Rows[i]["Level"]));
                        }

                        //RItem.setFailResult(Convert.ToInt32(myDataTableRslt.Rows[i]["failResult"]));
                        //RItem.setFailLevel(Convert.ToInt32(myDataTableRslt.Rows[i]["failLevel"]));
                        //RItem.setPassResult(Convert.ToInt32(myDataTableRslt.Rows[i]["passResult"]));
                        //RItem.setPassLevel(Convert.ToInt32(myDataTableRslt.Rows[i]["passLevel"]));

                        filterItemResultList.Add(RItem);
                    }
                }
            }
            catch (SqlException ex)
            {
                string msg = "Get Result Error:";
                msg += ex.Message;
            }
            finally
            {
                conn.Close();
            }


            return filterItemResultList;
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

        protected void btnShow_Click(object sender, EventArgs e)
        {
            if (RDD_FilterSet.SelectedIndex >= 0)
            {
                ShowResultCondition.CssClass = ShowResultCondition.CssClass.Replace("disabledDiv", "");
                PanelOrgChart.CssClass = PanelOrgChart.CssClass.Replace("disabledDiv", "");
                Session["parentSelectedValue"] = RDDL_Parent.SelectedValue;
                DisplayData(Convert.ToInt32(RDDL_Parent.SelectedValue));

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Please first select your filter or make a new one! </b>'); height=120,width=250", true);
                return;
            }
        }

        protected void RB_Delete_Condition_Click(object sender, EventArgs e)
        {
            List<FilterItems> fltrItmResltLst = new List<FilterItems>();
            //-----fetch result from #temp table and copy it in filterItemResultList
            List<FilterItems> filterItemResultList = new List<FilterItems>();
            RDDL_Parent.Items.Clear();

            ShowResultCondition.CssClass = ShowResultCondition.CssClass.Replace("disabledDiv", "");
            PanelOrgChart.CssClass = PanelOrgChart.CssClass.Replace("disabledDiv", "");

            String connString = CnnStr;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            string deleteCommand;

            SelectedConditionValue = Convert.ToInt32(RLB_Condition.SelectedValue);

            string updateCommand = "UPDATE Tbl_Filter_SelectedItems SET Condition=NULL, Field=NULL WHERE [Level] = @baseLvl AND FilterID = " + Session["FilterID_Filter"];
            string selectCommand = "SELECT * FROM Tbl_Filter_SelectedItems WHERE FilterID = " + Session["FilterID_Filter"];
            string lvlMP = null;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                fltrItmResltLst = GetMaterializedPath(conn);

                foreach (FilterItems item in fltrItmResltLst)
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
                    deleteCommand = "DELETE FROM Tbl_Filter_SelectedItems where (Parent = 0 OR [Level] >= 0) AND FilterID = " + Session["FilterID_Filter"];
                }
                else
                {
                    deleteCommand = "DELETE FROM Tbl_Filter_SelectedItems where [Level] IN (" + lvlMP + " ) AND FilterID = " + Session["FilterID_Filter"];
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
                            FilterItems FItem = new FilterItems();
                            FItem.setLevel(Convert.ToInt32(myDataTable.Rows[i]["Level"]));
                            FItem.setType(myDataTable.Rows[i]["Type"].ToString());
                            FItem.setParent(Convert.ToInt32(myDataTable.Rows[i]["Parent"]));
                            string dbCon = myDataTable.Rows[i]["Condition"].ToString();
                            if (dbCon != "")
                            {
                                listOfCond.Add(new Tuple<int, string>(Convert.ToInt32(myDataTable.Rows[i]["Level"]), myDataTable.Rows[i]["Condition"].ToString()));
                                FItem.setCondition(myDataTable.Rows[i]["Condition"].ToString());
                                FItem.setField(myDataTable.Rows[i]["Condition"].ToString());

                            }

                            if (!String.IsNullOrEmpty(myDataTable.Rows[i]["Result"].ToString()))
                                FItem.setResult(Convert.ToInt32(myDataTable.Rows[i]["Result"]));


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



                        FilterItems firstItem = (from f in filterItemList where f.getParent() == -1 select f).First();
                        var firstUl = new HtmlGenericControl("ul");
                        var firstLi = new HtmlGenericControl("li");
                        firstLi.Attributes.Add("class", "node");

                        var firstdiamondshape = new HtmlGenericControl("div");
                        var firstconditiondiv = new HtmlGenericControl("div");

                        //if (Convert.ToInt32(RDDL_Parent.SelectedValue) == 1)
                        //    firstLi.Style.Add("margin-left", "19px");
                        //else if (Convert.ToInt32(RDDL_Parent.SelectedValue) == 2)
                        //    firstLi.Style.Add("margin-left", "1px");
                        //else
                        firstLi.Style.Add("margin-left", "2px");

                        //string selectedValueCondition = RLB_Condition.SelectedValue;
                        //RLB_Condition.Items.Clear();

                        firstdiamondshape.Attributes.Add("class", "diamond-shape");
                        firstconditiondiv.Attributes.Add("class", "innernodecontent");
                        firstconditiondiv.Attributes.Add("runat", "server");
                        firstconditiondiv.InnerText = "C" + firstItem.getLevel().ToString();

                        RLB_Condition.Items.Clear();


                        if (!String.IsNullOrEmpty(firstItem.getCondition()))
                        {

                            RadListBoxItem RLBI_Condition = new RadListBoxItem(firstItem.getLevel() + " - " + firstItem.getCondition(), firstItem.getLevel().ToString());
                            RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);


                            Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");

                            int strLength = firstItem.getCondition().Length;
                            if (strLength > 10)
                                lblcond.Text = "C" + firstItem.getLevel().ToString() + ": " + firstItem.getCondition().Substring(0, 10) + "...";
                            else
                                lblcond.Text = "C" + firstItem.getLevel().ToString() + ": " + firstItem.getCondition().Substring(0, 5) + "...";

                            lblcond.ToolTip = firstItem.getCondition();

                            RLB_Condition.Items.Add(RLBI_Condition);

                        }

                        firstdiamondshape.Controls.Add(firstconditiondiv);
                        firstLi.Controls.Add(firstdiamondshape);
                        firstUl.Controls.Add(firstLi);
                        rootLi.Controls.Add(firstUl);

                        List<FilterItems> parentItems = (from a in filterItemList where a.getParent() == 0 select a).ToList();

                        var ul = new HtmlGenericControl("ul");

                        firstLi.Controls.Add(ul);
                        foreach (var parentcat in parentItems)
                        {
                            var li = new HtmlGenericControl("li");
                            var div = new HtmlGenericControl("div");

                            div.Attributes.Add("class", "nodecontent");
                            div.InnerHtml = parentcat.getLevel().ToString();

                            if (parentcat.getType().Equals("fail"))
                                div.Style.Add("background-color", "#fcbba1");
                            else if (parentcat.getType().Equals("pass"))
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

                                RadListBoxItem RLBI_Condition = new RadListBoxItem(parentcat.getLevel() + " - " + parentcat.getCondition(), parentcat.getLevel().ToString());
                                RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                                Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");

                                int strLength = parentcat.getCondition().Length;
                                if (strLength > 10)
                                    lblcond.Text = "C" + parentcat.getLevel().ToString() + ": " + parentcat.getCondition().Substring(0, 10) + "...";
                                else
                                    lblcond.Text = "C" + parentcat.getLevel().ToString() + ": " + parentcat.getCondition().Substring(0, 5) + "...";

                                lblcond.ToolTip = parentcat.getCondition();

                                RLB_Condition.Items.Add(RLBI_Condition);

                                li.Controls.Add(div);
                                diamondshape.Controls.Add(conditiondiv);
                                li.Controls.Add(diamondshape);
                            }
                            else
                            {
                                li.Attributes.Add("class", "leaf");
                                string cond = (from l in listOfCond where l.Item1 == parentcat.getParent() select l.Item2).FirstOrDefault();

                                if (!String.IsNullOrEmpty(cond))
                                {
                                    if (parentcat.getType().Equals("fail"))
                                    {
                                        RadListBoxItem RLBI_Condition = new RadListBoxItem(parentcat.getLevel() + " - Not " + cond + " ( items : " + parentcat.getResult().ToString() + " )", parentcat.getLevel().ToString());
                                        RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                                        Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                                        lblcond.Text = "C" + parentcat.getLevel().ToString() + " - ( items : " + parentcat.getResult().ToString() + " )";
                                        lblcond.ToolTip = "Not " + cond;

                                        RLB_Condition.Items.Add(RLBI_Condition);
                                        RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).Style.Add("color", "#fc9272"); //---red
                                        RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).FindControl("RB_Delete_Condition").Visible = false;

                                    }
                                    else if (parentcat.getType().Equals("pass"))
                                    {
                                        RadListBoxItem RLBI_Condition = new RadListBoxItem(parentcat.getLevel() + " - " + cond + " ( items : " + parentcat.getResult().ToString() + " )", parentcat.getLevel().ToString());
                                        RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                                        Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                                        lblcond.Text = "C" + parentcat.getLevel().ToString() + " - ( items : " + parentcat.getResult().ToString() + " )";
                                        lblcond.ToolTip = cond;

                                        //RadButton btnRemove = (RadButton)RLBI_Condition.FindControl("RBRemoveCond");
                                        //btnRemove.Enabled = false;

                                        RLB_Condition.Items.Add(RLBI_Condition);
                                        RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).Style.Add("color", "#74c476"); //---green
                                        RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).FindControl("RB_Delete_Condition").Visible = false;

                                    }
                                }

                                li.Controls.Add(div);
                            }

                            ul.Controls.Add(li);

                            List<FilterItems> childItems = (from a in filterItemList where a.getParent() == parentcat.getLevel() select a).ToList();
                            if (childItems.Count > 0)
                                li.Controls.Add(AddChildItem(parentcat, li, true));
                        }
                        conn.Close();

                    }
                    else
                    {
                        conn.Close();

                        RDDL_Parent.Items.Clear();
                        // RLB_Condition.Items.Clear();
                        int count = RLB_Condition.Items.Count;

                        for (int c = RLB_Condition.Items.Count - 1; c >= 0; --c)
                        {
                            RLB_Condition.Items.Remove(RLB_Condition.Items[c]);
                        }

                        //Task returnedTask = Fetch_Count_Of_DataAsync(lbl_Root);
                        //returnedTask.Wait();
                        if (Session["baseCount"] != null && !String.IsNullOrEmpty(Session["baseCount"].ToString()))
                            lbl_Root.Text = " (items: " + Session["baseCount"].ToString() + ")";
                        else
                        {
                            Fetch_Count_Of_Data();
                            lbl_Root.Text = " (items: " + Session["baseCount"].ToString() + ")";
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

        private List<FilterItems> GetMaterializedPath(SqlConnection conn)
        {
            List<FilterItems> filterItemResultList = new List<FilterItems>();

            try
            {
                SqlDataAdapter SqlDataAdpt = new SqlDataAdapter();
                SqlCommand cmdRslt = new SqlCommand("Sp_Filter_Get_MP_SelectedCondition", conn);

                cmdRslt.CommandType = CommandType.StoredProcedure;

                //cmdRslt.Parameters.Add(new SqlParameter("@SampleID", Session["SampleID_Filter"].ToString()));
                cmdRslt.Parameters.Add(new SqlParameter("@FilterID", Session["FilterID_Filter"].ToString()));

                SqlDataAdpt.SelectCommand = cmdRslt;

                DataTable myDataTableRslt = new DataTable();

                SqlDataAdpt.Fill(myDataTableRslt);
                if (myDataTableRslt.Rows.Count > 0)
                {
                    for (int i = 0; i < myDataTableRslt.Rows.Count; i++)
                    {
                        FilterItems FItem = new FilterItems();
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

        protected void ShowResultCondition_Click(object sender, EventArgs e)
        {

            //*************************
            //Write list of centers and host into centerList.txt file to get access on it from SampleResult page.
            List<CenterList> _centerList = new List<CenterList>();

            //string selectedItemCommand = "select * from  Tbl_Center_Host Where (CenterID != 2 OR HostID != 3)";

            SqlDataAdapter SqlDataAdptr = new SqlDataAdapter();


            using (SqlConnection conn = new SqlConnection(CnnStr))
            {
                conn.Open();
                SqlCommand cmdSelect = new SqlCommand("Sp_Filter_TblCenterHost_Sel", conn);
                SqlDataAdptr.SelectCommand = cmdSelect;
                DataTable myDataTable = new DataTable();
                SqlDataAdptr.Fill(myDataTable);

                if (myDataTable.Rows.Count > 0)
                {
                    Session["NumberOfCentersAndHosts"] = myDataTable.Rows.Count;

                    for (int i = 0; i < myDataTable.Rows.Count; i++)
                    {
                        _centerList.Add(new CenterList()
                        {
                            HostId = Convert.ToInt32(myDataTable.Rows[i]["HostID"]),
                            CenterId = Convert.ToInt32(myDataTable.Rows[i]["CenterID"]),
                            IpCenter = myDataTable.Rows[i]["IPCenter"].ToString()
                        });
                    }
                }
            }

            string Path = @"~\Upload";
            using (StreamWriter file = File.CreateText(Server.MapPath(Path) + @"\centerList.json"))
            {
                JsonSerializer serializer = new JsonSerializer();
                serializer.Serialize(file, _centerList);
            }


            Session["Selected_FiterItemIDs_AsString"] = GetLevelOfCheckedItems(RLB_Condition);
            SqlCommand cmd = new SqlCommand("Sp_GAP_Trio_Result_Variant_Sel", new SqlConnection(CnnStr));
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = cmd.Parameters;

            cmd.Parameters.Add("@TrioLocalID", SqlDbType.NVarChar, 500);
            cmd.Parameters.Add("@TrioCode", SqlDbType.NVarChar, 3);
            cmd.Parameters.Add("@IndividualID", SqlDbType.BigInt);
            cmd.Parameters.Add("@FilterID", SqlDbType.Int);
            cmd.Parameters.Add("@Selected_FiterItemLevels_CommaSep", SqlDbType.NVarChar, 200);
            cmd.Parameters.Add("@UserID", SqlDbType.Int);
            cmd.Parameters.Add("@CenterID", SqlDbType.Int);
            cmd.Parameters.Add("@Output", SqlDbType.Int);
            cmd.Parameters["@Output"].Direction = ParameterDirection.Output;



            cmd.Parameters["@TrioLocalID"].Value = Session["TriolocalID"].ToString();
            cmd.Parameters["@TrioCode"].Value = Session["InWhichOneExists"].ToString();
            cmd.Parameters["@IndividualID"].Value = Convert.ToInt64(RCB_Individuals.SelectedValue);
            cmd.Parameters["@FilterID"].Value = Convert.ToInt32(Session["FilterID_Filter"].ToString());
            if (Session["Selected_FiterItemIDs_AsString"] != null)
                cmd.Parameters["@Selected_FiterItemLevels_CommaSep"].Value = Session["Selected_FiterItemIDs_AsString"].ToString();
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Please select at least one item! Err: </b>'); height=120,width=250", true);
                return;
            }
            cmd.Parameters["@UserID"].Value = Convert.ToInt32(Session["WiNGSMasterId"].ToString());
            cmd.Parameters["@CenterID"].Value = Convert.ToInt32(Session["Current_CenterID"].ToString());




            try
            {
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();

                Session["newQueryIsPassed"] = "true";
                Session["ZeroResult"] = cmd.Parameters["@Output"].Value.ToString();
                Response.Redirect(String.Format("/GAP/Trio/TrioVariant.aspx"), false);
            }
            catch (SqlException se)
            {
                string msg = se.Message;
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Something went wrong when loading your selected data! Err: </b>" + msg + "'); height=120,width=250", true);
                return;
            }
            catch (Exception ex)
            {
                string msg = ex.Message;
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Something went wrong! Err: </b>" + msg + "'); height=120,width=250", true);
                return;
            }
            finally
            {
                cmd.Connection.Close();
            }


        }

        private static string GetLevelOfCheckedItems(RadListBox listBox)
        {
            StringBuilder sb = new StringBuilder();
            IList<RadListBoxItem> collection = listBox.CheckedItems;
            if (collection.Count > 0)
            {
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
            else
            {
                ScriptManager.RegisterClientScriptBlock(csPage, csType, "Myscript1", @"radalert('<br/><b>Please select at least one item! </b>'); height=120,width=250", true);
                return null;
            }

        }

        protected void btnFetchCount_Click(object sender, EventArgs e)
        {
            GetCountForSelectedSavedFilter();
        }

        protected void btnFetchCountPerItem_Click(object sender, EventArgs e)
        {
            GetCountForSelectedItemFilter();

        }

        public void GetCountForSelectedSavedFilter()
        {
            //lbl_waiting.Text = "";

            RLB_Filter.CssClass = RLB_Filter.CssClass.Replace("disabledDiv", "");
            RDDL_Parent.CssClass = RDDL_Parent.CssClass.Replace("disabledDiv", "");
            btnShow.CssClass = btnShow.CssClass.Replace("disabledDiv", "");
            RLB_Condition.CssClass = RLB_Condition.CssClass.Replace("disabledDiv", "");
            ShowResultCondition.CssClass = ShowResultCondition.CssClass.Replace("disabledDiv", "");
            PanelOrgChart.CssClass = PanelOrgChart.CssClass.Replace("disabledDiv", "");

            //leftTabDiv.Attributes.Add("class", leftTabDiv.Attributes["class"].ToString().Replace("disabledDiv", ""));
            leftTabDiv.Attributes.Remove("class");
            Del_RDD_FilterSet.Enabled = true;

            Session["FilterID_Filter"] = RDD_FilterSet.SelectedValue.ToString();

            if (Session["baseCount"] != null && !String.IsNullOrEmpty(Session["baseCount"].ToString()))
                lbl_Root.Text = " (items: " + Session["baseCount"].ToString() + ")";
            else
            {
                Fetch_Count_Of_Data();
                lbl_Root.Text = " (items: " + Session["baseCount"].ToString() + ")";
            }

            RLB_Filter.Items.Clear();
            RLB_Filter.ClearSelection();

            RLB_FilterLoaded();

            //string selectedItemCommand = "SELECT * FROM Tbl_Filter_SelectedItems where FilterID= " + Session["FilterID_Filter"];

            using (SqlConnection conn = new SqlConnection(CnnStr))
            {
                conn.Open();
                //SqlCommand cmdSelect = new SqlCommand(selectedItemCommand, conn);
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlCommand cmdSelect = new SqlCommand("Sp_Filter_SelectedFilterItems_Sel", conn);
                cmdSelect.CommandType = CommandType.StoredProcedure;
                SqlDataAdptrCmd.SelectCommand = cmdSelect;

                cmdSelect.Parameters.Add("@FilterID_Filter", SqlDbType.NVarChar, 100);
               cmdSelect.Parameters.Add("@Control_num", SqlDbType.Int);
                cmdSelect.Parameters["@FilterID_Filter"].Value = Session["FilterID_Filter"];
               cmdSelect.Parameters["@Control_num"].Direction = ParameterDirection.Output;

                DataTable myDataTable = new DataTable();
                SqlDataAdptrCmd.Fill(myDataTable);

                conn.Close();
                //-----fetch result from #temp table and copy it in filterItemResultList
                //List<FilterItem> filterItemResultList = new List<FilterItem>();
                RDDL_Parent.Items.Clear();
                RLB_Condition.Items.Clear();
                //RLB_Sample_Condition.Items.Clear();
                filterItemList.Clear();

                if (myDataTable.Rows.Count > 0)
                {
                    for (int i = 0; i < myDataTable.Rows.Count; i++)
                    {
                        FilterItems FItem = new FilterItems();

                        FItem.setLevel(Convert.ToInt32(myDataTable.Rows[i]["Level"]));
                        FItem.setType(myDataTable.Rows[i]["Type"].ToString());
                        FItem.setParent(Convert.ToInt32(myDataTable.Rows[i]["Parent"]));
                        string dbCon = myDataTable.Rows[i]["Field"].ToString();
                        if (dbCon != "")
                        {
                            listOfCond.Add(new Tuple<int, string>(Convert.ToInt32(myDataTable.Rows[i]["Level"]), myDataTable.Rows[i]["Condition"].ToString()));
                            FItem.setCondition(myDataTable.Rows[i]["Condition"].ToString());
                            FItem.setField(myDataTable.Rows[i]["Field"].ToString());
                        }
                        if (!String.IsNullOrEmpty(myDataTable.Rows[i]["Result"].ToString()))
                        {
                            FItem.setResult(Convert.ToInt32(myDataTable.Rows[i]["Result"]));
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


                    FilterItems firstItem = (from f in filterItemList where f.getParent() == -1 select f).First();
                    var firstUl = new HtmlGenericControl("ul");
                    var firstLi = new HtmlGenericControl("li");
                    firstLi.Attributes.Add("class", "node");

                    var firstdiamondshape = new HtmlGenericControl("div");
                    var firstconditiondiv = new HtmlGenericControl("div");

                    firstLi.Style.Add("margin-left", "19px");

                    firstdiamondshape.Attributes.Add("class", "diamond-shape");
                    firstconditiondiv.Attributes.Add("class", "innernodecontent");
                    firstconditiondiv.Attributes.Add("runat", "server");
                    firstconditiondiv.InnerText = "C" + firstItem.getLevel().ToString();
                    firstconditiondiv.Attributes.Add("title", firstItem.getCondition());

                    if (!String.IsNullOrEmpty(firstItem.getCondition()))
                    {
                        RadListBoxItem RLBI_Condition = new RadListBoxItem(firstItem.getLevel() + " - " + firstItem.getCondition().ToString(), firstItem.getLevel().ToString());
                        RLBI_Condition.Checkable = false;

                        RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                        Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");

                        int strLength = firstItem.getCondition().Length;
                        if (strLength > 10)
                            lblcond.Text = "C" + firstItem.getLevel().ToString() + ": " + firstItem.getCondition().Substring(0, 10) + "...";
                        else
                            lblcond.Text = "C" + firstItem.getLevel().ToString() + ": " + firstItem.getCondition().Substring(0, 5) + "...";

                        lblcond.ToolTip = firstItem.getCondition().ToString();
                        lblcond.Style.Add("padding-left", "20px");

                        CheckBox chkboxResult = (CheckBox)RLB_Condition.FindControl("chkbox_Sel_condition_result");

                        RLB_Condition.Items.Add(RLBI_Condition);
                    }

                    if (myDataTable.Rows.Count != 3)
                    {
                        firstdiamondshape.Controls.Add(firstconditiondiv);
                        firstLi.Controls.Add(firstdiamondshape);
                        firstUl.Controls.Add(firstLi);
                        rootLi.Controls.Add(firstUl);
                    }


                    List<FilterItems> parentItems = (from a in filterItemList where a.getParent() == 0 select a).ToList();

                    var ul = new HtmlGenericControl("ul");

                    firstLi.Controls.Add(ul);
                    foreach (var parentcat in parentItems)
                    {
                        var li = new HtmlGenericControl("li");
                        var div = new HtmlGenericControl("div");

                        div.Attributes.Add("class", "nodecontent");
                        div.InnerHtml = parentcat.getLevel().ToString();

                        if (parentcat.getType() == "fail")
                            div.Style.Add("background-color", "#fcbba1");
                        else if (parentcat.getType() == "pass")
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
                            conditiondiv.Attributes.Add("title", parentcat.getCondition().ToString());

                            RadListBoxItem RLBI_Condition = new RadListBoxItem(parentcat.getLevel() + " - " + parentcat.getCondition().ToString(), parentcat.getLevel().ToString());
                            RLBI_Condition.Checkable = false;

                            RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                            Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");

                            int strLength = parentcat.getCondition().Length;
                            if (strLength > 10)
                                lblcond.Text = "C" + parentcat.getLevel().ToString() + ": " + parentcat.getCondition().Substring(0, 10) + "...";
                            else
                                lblcond.Text = "C" + parentcat.getLevel().ToString() + ": " + parentcat.getCondition().Substring(0, 5) + "...";

                            lblcond.ToolTip = parentcat.getCondition().ToString();
                            lblcond.Style.Add("padding-left", "20px");

                            RLB_Condition.Items.Add(RLBI_Condition);

                            li.Controls.Add(div);
                            diamondshape.Controls.Add(conditiondiv);
                            li.Controls.Add(diamondshape);
                        }
                        else
                        {
                            li.Attributes.Add("class", "leaf");
                            ////int selected = Convert.ToInt32(RDDL_Parent.SelectedText);
                            string cond = (from l in listOfCond where l.Item1 == parentcat.getParent() select l.Item2).FirstOrDefault();
                            if (!String.IsNullOrEmpty(cond))
                            {
                                if (parentcat.getType().Equals("fail"))
                                {
                                    RadListBoxItem RLBI_Condition = new RadListBoxItem(parentcat.getLevel() + " - Not " + cond + " ( items : " + parentcat.getResult().ToString() + " )", parentcat.getLevel().ToString());
                                    RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                                    Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                                    lblcond.Text = "C" + parentcat.getLevel().ToString() + " - ( items : " + parentcat.getResult().ToString() + " )";
                                    lblcond.ToolTip = "Not " + cond;

                                    RLB_Condition.Items.Add(RLBI_Condition);

                                    RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).Style.Add("color", "#fc9272"); //---red
                                    RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).FindControl("RB_Delete_Condition").Visible = false;

                                }
                                else if (parentcat.getType().Equals("pass"))
                                {
                                    RadListBoxItem RLBI_Condition = new RadListBoxItem(parentcat.getLevel() + " - " + cond + " ( items : " + parentcat.getResult().ToString() + " )", parentcat.getLevel().ToString());
                                    RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                                    Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                                    lblcond.Text = "C" + parentcat.getLevel().ToString() + " - ( items : " + parentcat.getResult().ToString() + " )";
                                    lblcond.ToolTip = cond;

                                    RLB_Condition.Items.Add(RLBI_Condition);

                                    RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).Style.Add("color", "#74c476"); //---green
                                    RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).FindControl("RB_Delete_Condition").Visible = false;

                                }
                            }

                            li.Controls.Add(div);
                        }

                        ul.Controls.Add(li);

                        List<FilterItems> childItems = (from a in filterItemList where a.getParent() == parentcat.getLevel() select a).ToList();
                        if (childItems.Count > 0)
                            li.Controls.Add(AddChildItem(parentcat, li, true));

                        lbl_Status.Text = " ";
                        RDDL_Parent.CssClass = RDDL_Parent.CssClass.Replace("disabledDiv", "");
                        btnShow.CssClass = btnShow.CssClass.Replace("disabledDiv", " ");
                        RLB_Condition.CssClass = RLB_Condition.CssClass.Replace("disabledDiv", " ");
                        ShowResultCondition.CssClass = ShowResultCondition.CssClass.Replace("disabledDiv", " ");

                        ////lbl_Status.CssClass = lbl_Status.CssClass.Replace("lbl-status", "");
                        //div_loading.Attributes.Add("class", " displyNon");
                        //div_loading.Attributes.Add("class", div_loading.Attributes["class"].ToString().Replace("displyNon", ""));


                    }

                }
                else
                {
                    RDDL_Parent.Items.Clear();
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

                    RDDL_Parent.Items.Sort(x => Convert.ToInt32(x.Value));
                }

                //RLB_Condition.DataBind();
            }

        }

        public void GetCountForSelectedItemFilter()
        {
            RLB_Filter.CssClass = RLB_Filter.CssClass.Replace("disabledDiv", "");
            RDDL_Parent.CssClass = RDDL_Parent.CssClass.Replace("disabledDiv", "");
            btnShow.CssClass = btnShow.CssClass.Replace("disabledDiv", "");
            RLB_Condition.CssClass = RLB_Condition.CssClass.Replace("disabledDiv", "");
            ShowResultCondition.CssClass = ShowResultCondition.CssClass.Replace("disabledDiv", "");
            PanelOrgChart.CssClass = PanelOrgChart.CssClass.Replace("disabledDiv", "");

            if (Session["baseCount"] != null && !String.IsNullOrEmpty(Session["baseCount"].ToString()))
                lbl_Root.Text = " (items: " + Session["baseCount"].ToString() + ")";
            else
            {
                Fetch_Count_Of_Data();
                lbl_Root.Text = " (items: " + Session["baseCount"].ToString() + ")";
            }

            //RLB_Filter.Items.Clear();
            //RLB_Filter.ClearSelection();

            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            //string selectedItemCommand = "SELECT * FROM Tbl_Filter_SelectedItems where FilterID= " + Session["FilterID_Filter"];

            using (SqlConnection conn = new SqlConnection(CnnStr))
            {
                conn.Open();
                //SqlCommand cmdSelect = new SqlCommand(selectedItemCommand, conn);
                SqlCommand cmdSelect = new SqlCommand("Sp_Filter_SelectedFilterItems_Sel", conn);
                cmdSelect.CommandType = CommandType.StoredProcedure;
                SqlDataAdptrCmd.SelectCommand = cmdSelect;

                cmdSelect.Parameters.Add("@FilterID_Filter", SqlDbType.NVarChar, 100);
              cmdSelect.Parameters.Add("@Control_num", SqlDbType.Int);
                cmdSelect.Parameters["@FilterID_Filter"].Value = Session["FilterID_Filter"];
               cmdSelect.Parameters["@Control_num"].Direction = ParameterDirection.Output;

                DataTable myDataTable = new DataTable();
                SqlDataAdptrCmd.Fill(myDataTable);

                //RDDL_Parent.Items.Clear();
                RLB_Condition.Items.Clear();

                if (myDataTable.Rows.Count > 0)
                {
                    for (int i = 0; i < myDataTable.Rows.Count; i++)
                    {
                        FilterItems FItem = new FilterItems();

                        FItem.setLevel(Convert.ToInt32(myDataTable.Rows[i]["Level"]));
                        FItem.setType(myDataTable.Rows[i]["Type"].ToString());
                        FItem.setParent(Convert.ToInt32(myDataTable.Rows[i]["Parent"]));
                        string dbCon = myDataTable.Rows[i]["Field"].ToString();
                        if (dbCon != "")
                        {
                            listOfCond.Add(new Tuple<int, string>(Convert.ToInt32(myDataTable.Rows[i]["Level"]), myDataTable.Rows[i]["Condition"].ToString()));
                            FItem.setCondition(myDataTable.Rows[i]["Condition"].ToString());
                            FItem.setField(myDataTable.Rows[i]["Field"].ToString());
                        }

                        if (!String.IsNullOrEmpty(myDataTable.Rows[i]["Result"].ToString()))
                        {
                            FItem.setResult(Convert.ToInt32(myDataTable.Rows[i]["Result"]));
                        }

                        filterItemList.Add(FItem);
                    }

                }
            }

            FilterItems firstItem = (from f in filterItemList where f.getParent() == -1 select f).First();
            var firstUl = new HtmlGenericControl("ul");
            var firstLi = new HtmlGenericControl("li");
            firstLi.Attributes.Add("class", "node");

            var firstdiamondshape = new HtmlGenericControl("div");
            var firstconditiondiv = new HtmlGenericControl("div");

            //if (Convert.ToInt32(RDDL_Parent.SelectedValue) >= 1 || Convert.ToInt32(RDDL_Parent.SelectedValue) >= 2)
            //if (Convert.ToInt32(RDDL_Parent.SelectedValue) == 1)
            //    firstLi.Style.Add("margin-left", "19px");
            //else if (Convert.ToInt32(RDDL_Parent.SelectedValue) == 2)
            //    firstLi.Style.Add("margin-left", "1px");
            //else
            firstLi.Style.Add("margin-left", "2px");

            firstdiamondshape.Attributes.Add("class", "diamond-shape");
            firstconditiondiv.Attributes.Add("class", "innernodecontent");
            firstconditiondiv.Attributes.Add("runat", "server");
            firstconditiondiv.InnerText = "C" + firstItem.getLevel();
            firstconditiondiv.Attributes.Add("title", firstItem.getCondition());
            string gg = firstItem.getField();

            if (!String.IsNullOrEmpty(firstItem.getCondition()))
            {
                RadListBoxItem RLBI_Condition = new RadListBoxItem(firstItem.getLevel() + " - " + firstItem.getCondition().ToString(), firstItem.getLevel().ToString());
                RLBI_Condition.Checkable = false;

                RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");

                int strLength = firstItem.getCondition().Length;
                if (strLength > 10)
                    lblcond.Text = "C" + firstItem.getLevel().ToString() + ": " + firstItem.getCondition().Substring(0, 10) + "...";
                else
                    lblcond.Text = "C" + firstItem.getLevel().ToString() + ": " + firstItem.getCondition().Substring(0, 5) + "...";

                lblcond.ToolTip = firstItem.getCondition().ToString();
                lblcond.Style.Add("padding-left", "20px");

                CheckBox chkboxResult = (CheckBox)RLB_Condition.FindControl("chkbox_Sel_condition_result");

                RLB_Condition.Items.Add(RLBI_Condition);
            }


            firstdiamondshape.Controls.Add(firstconditiondiv);
            firstLi.Controls.Add(firstdiamondshape);
            firstUl.Controls.Add(firstLi);
            rootLi.Controls.Add(firstUl);

            List<FilterItems> parentItems = (from a in filterItemList where a.getParent() == 0 select a).ToList();

            var ul = new HtmlGenericControl("ul");

            firstLi.Controls.Add(ul);
            foreach (var parentcat in parentItems)
            {
                var li = new HtmlGenericControl("li");
                var div = new HtmlGenericControl("div");

                div.Attributes.Add("class", "nodecontent");
                div.InnerHtml = parentcat.getLevel().ToString();

                if (parentcat.getType() == "fail")
                    div.Style.Add("background-color", "#fcbba1");
                else if (parentcat.getType() == "pass")
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
                    conditiondiv.Attributes.Add("title", parentcat.getCondition().ToString());

                    RadListBoxItem RLBI_Condition = new RadListBoxItem(parentcat.getLevel() + " - " + parentcat.getCondition().ToString(), parentcat.getLevel().ToString());
                    RLBI_Condition.Checkable = false;

                    RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                    Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");

                    int strLength = parentcat.getCondition().Length;
                    if (strLength > 10)
                        lblcond.Text = "C" + parentcat.getLevel().ToString() + ": " + parentcat.getCondition().Substring(0, 10) + "...";
                    else
                        lblcond.Text = "C" + parentcat.getLevel().ToString() + ": " + parentcat.getCondition().Substring(0, 5) + "...";

                    lblcond.ToolTip = parentcat.getCondition().ToString();
                    lblcond.Style.Add("padding-left", "20px");

                    RLB_Condition.Items.Add(RLBI_Condition);

                    li.Controls.Add(div);
                    diamondshape.Controls.Add(conditiondiv);
                    li.Controls.Add(diamondshape);
                }
                else
                {
                    li.Attributes.Add("class", "leaf");
                    int selected = Convert.ToInt32(Session["SelectedItem_Parent"].ToString());
                    string cond = (from l in listOfCond where l.Item1 == parentcat.getParent() select l.Item2).FirstOrDefault();
                    if (!String.IsNullOrEmpty(cond))
                    {
                        if (parentcat.getType().Equals("fail"))
                        {
                            RadListBoxItem RLBI_Condition = new RadListBoxItem(parentcat.getLevel() + " - Not " + cond + " ( items : " + parentcat.getResult().ToString() + " )", parentcat.getLevel().ToString());
                            RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                            Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                            lblcond.Text = "C" + parentcat.getLevel().ToString() + " - ( items : " + parentcat.getResult().ToString() + " )";
                            lblcond.ToolTip = "Not " + cond;

                            RLB_Condition.Items.Add(RLBI_Condition);

                            RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).Style.Add("color", "#fc9272"); //---red
                            RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).FindControl("RB_Delete_Condition").Visible = false;

                        }
                        else if (parentcat.getType().Equals("pass"))
                        {
                            RadListBoxItem RLBI_Condition = new RadListBoxItem(parentcat.getLevel() + " - " + cond + " ( items : " + parentcat.getResult().ToString() + " )", parentcat.getLevel().ToString());
                            RLB_Sample_Condition.ItemTemplate.InstantiateIn(RLBI_Condition);

                            Label lblcond = (Label)RLBI_Condition.FindControl("lbl_Sel_condition_selectedCondition");
                            lblcond.Text = "C" + parentcat.getLevel().ToString() + " - ( items : " + parentcat.getResult().ToString() + " )";
                            lblcond.ToolTip = cond;

                            RLB_Condition.Items.Add(RLBI_Condition);

                            RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).Style.Add("color", "#74c476"); //---green
                            RLB_Condition.FindItemByValue(parentcat.getLevel().ToString()).FindControl("RB_Delete_Condition").Visible = false;

                        }
                    }

                    li.Controls.Add(div);
                }

                ul.Controls.Add(li);

                List<FilterItems> childItems = (from a in filterItemList where a.getParent() == parentcat.getLevel() select a).ToList();
                if (childItems.Count > 0)
                    li.Controls.Add(AddChildItem(parentcat, li, true));
            }

            lbl_Status.Text = " ";
            RDDL_Parent.CssClass = RDDL_Parent.CssClass.Replace("disabledDiv", "");
            btnShow.CssClass = btnShow.CssClass.Replace("disabledDiv", " ");
            RLB_Condition.CssClass = RLB_Condition.CssClass.Replace("disabledDiv", " ");
            ShowResultCondition.CssClass = ShowResultCondition.CssClass.Replace("disabledDiv", " ");

            int selectedLvl = Convert.ToInt32(Session["SelectedItem_Parent"].ToString());

            //RDDL_Parent.SelectedItem.Remove();

            RDDL_Parent.ClearSelection();

            //RDDL_Parent.Items.Add(new DropDownListItem
            //{
            //    Value = (filterItemList.Count - 2).ToString(),
            //    Text = (filterItemList.Count - 2).ToString()
            //});
            //RDDL_Parent.Items.Add(new DropDownListItem
            //{
            //    Value = (filterItemList.Count - 1).ToString(),
            //    Text = (filterItemList.Count - 1).ToString()
            //});

            //RDDL_Parent.Items.Sort(x => Convert.ToInt32(x.Value));


        }

        protected void RDDL_Parent_PreRender(object sender, EventArgs e)
        {
            if (Session["SelectedItem_Parent"] == null || Session["SelectedItem_Parent"].ToString() == "" || RDDL_Parent.SelectedValue.ToString() == "")
                Session["SelectedItem_Parent"] = RDDL_Parent.SelectedItem.Text;

        }


        protected void RCB_Individuals_PreRender(object sender, EventArgs e)
        {
            string TrioCode = Session["InWhichOneExists"].ToString();
            string exists_Proband = TrioCode.Substring(0, 1);
            string exists_Control1 = TrioCode.Substring(1, 1);
            string exists_Control2 = TrioCode.Substring(2, 1);
            RCB_Individuals.Items[0].Enabled = (exists_Proband == "0" ? false : true);
            RCB_Individuals.Items[1].Enabled = (exists_Control1 == "0" ? false : true);
            RCB_Individuals.Items[2].Enabled = (exists_Control2 == "0" ? false : true);
        }

        protected void RDD_FilterSet_PreRender(object sender, EventArgs e)
        {
            var rcb = (RadComboBox)sender;
            var notProband = new List<string> { "011","001","010", "002","020"};
            var notFather = new List<string> { "101","001","100","200","002"};
            var notMother = new List<string> { "110", "010", "100", "200", "020" };
            foreach (RadComboBoxItem item in rcb.Items)
            {
                HiddenField basedOnIndividual = (HiddenField)item.FindControl("hdn_basedonIndividual");

                string InWhichOneExists = Session["InWhichOneExists"].ToString();
                if (basedOnIndividual.Value == "0")
                    if (notProband.Contains(InWhichOneExists))
                        item.Enabled = false;

                if (basedOnIndividual.Value == "1")
                    if (notFather.Contains(InWhichOneExists))
                        item.Enabled = false;

                if (basedOnIndividual.Value == "2")
                    if (notMother.Contains(InWhichOneExists))
                        item.Enabled = false;



            }
        }
    }

    class ResultItems
    {
        private int failLevel;
        private int passLevel;
        private int failResult;
        private int passResult;

        public int getFailLevel() { return failLevel; }
        public void setFailLevel(int value) { failLevel = value; }

        public int getPassLevel() { return passLevel; }
        public void setPassLevel(int value) { passLevel = value; }

        public int getFailResult() { return failResult; }
        public void setFailResult(int value) { failResult = value; }

        public int getPassResult() { return passResult; }
        public void setPassResult(int value) { passResult = value; }
    }

    class FilterItems
    {
        private int level;
        private int parent;
        private string type;
        private string condition;
        private string field;
        private int result;
        private string mp;

        public int getLevel() { return level; }
        public void setLevel(int value) { level = value; }

        public int getParent() { return parent; }
        public void setParent(int value) { parent = value; }

        public string getType() { return type; }
        public void setType(string value) { type = value; }

        public string getCondition() { return condition; }
        public void setCondition(string value) { condition = value; }

        public string getField() { return field; }
        public void setField(string value) { field = value; }

        public int getResult() { return result; }
        public void setResult(int value) { result = value; }

        public string getMP() { return mp; }
        public void setMP(string value) { mp = value; }
    }

}