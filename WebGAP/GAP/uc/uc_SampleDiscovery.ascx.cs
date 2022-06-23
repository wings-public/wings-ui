using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.GAP.uc
{
    public partial class uc_SampleDiscovery : System.Web.UI.UserControl
    {

        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion} 


        protected Int64 filterSampleSearchmode
        {
            get
            {
                Int64 value = (Int64)ViewState["filterSampleSearchmode"];
                return -1 != value ? (Int64)value : -1;
            }
            set
            {
                ViewState["filterSampleSearchmode"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                filterSampleSearchmode = -1;
                hdn_searchIndividualID.Value = "-1"; // solution for ExpandCollapse
            }
            lbl_CenterPI.Text = Session["Current_Center"].ToString() + ", " + Session["Current_PI"].ToString();
        }


        protected void RG_IndividualSample_ItemCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem parentItem = e.Item.OwnerTableView.ParentItem;
            if (parentItem != null && e.Item.OwnerTableView.Name == "DetailTableView1")
            {
                 string IndvID = parentItem.OwnerTableView.DataKeyValues[parentItem.ItemIndex]["IndividualID"].ToString();
                 Session["IndvId_Filter"] = IndvID;
            }

            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                HiddenField hdn_HostId = (HiddenField)item.FindControl("hdn_HostId");
                Session["HostID"] = (hdn_HostId == null ? Session["HostID"] : hdn_HostId.Value);
                //Session["HostID"] =  hdn_HostId.Value;             

                if (e.Item.OwnerTableView.Name == "DetailTableView1")  
                {
                    GridDataItem detailItem = (GridDataItem)e.Item;
                    string SeqType = detailItem["SeqTypeName"].Text;
                    Session["SeqType"] = SeqType.Trim();
                }
                

                if (e.CommandName.Equals("ExpandCollapse"))
                {
                    hdn_searchIndividualID.Value = filterSampleSearchmode.ToString();
                }

                if (e.CommandName == "GoToHPO")
                {
                    string IndividualID = item.GetDataKeyValue("IndividualID").ToString();
                    Session["IndividualID_For_HPO_SampleDiscovery"] = IndividualID;

                    string message = "OpenWin_HPO();";
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
                }

                if (e.CommandName == "Navigate")
                {

                    String connstring = CnnStr;
                    SqlConnection conn = new SqlConnection(connstring);
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();

                    SqlCommand cmd = new SqlCommand("Sp_GAP_Filter_RefBuild_Sel", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@RefBuild", SqlDbType.VarChar, 50);
                    cmd.Parameters["@RefBuild"].Value = item.GetDataKeyValue("ReferenceBuildName").ToString();

                    SqlDataAdptrCmd.SelectCommand = cmd;
                    DataTable myDataTable = new DataTable();

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        SqlDataAdptrCmd.Fill(myDataTable);
                        Session["RefBuild"] = myDataTable.Rows[0]["Textcode"].ToString();
                    }
                    catch (SqlException ex)
                    {
                        ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Invalid Reference build! </b>'); height=120,width=250", true);

                    }

                    string SampleID = item.GetDataKeyValue("SampleID").ToString();

                    Session["SampleID_Filter"] = SampleID;
                    Session["CenterID_For_ClinicalReport"] = Session["Current_CenterID"].ToString();


                    string FileTID = item.GetDataKeyValue("SampleFileID").ToString();
                    Session["FileID_Filter"] = FileTID;

                    Response.Redirect(String.Format("/GAP/SampleQuery.aspx"));
                }


                if (e.CommandName == "ShowPedigree")
                {

                    string IndividualID = item.GetDataKeyValue("IndividualID").ToString();

                    Session["ID_drawPedigree"] = IndividualID; // probandID
                    string message = "openWinPedigree();";

                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
                }
            }
        }

        protected void RTB_DeleteSearch_Click(object sender, EventArgs e)
        {
            GridCommandItem commandItem = (GridCommandItem)RG_IndividualSample.MasterTableView.GetItems(GridItemType.CommandItem)[0];
            RadComboBox rcb = (RadComboBox)commandItem.FindControl("RCB_searchIndividual");
            rcb.ClearSelection();
            filterSampleSearchmode = -1;
            RG_IndividualSample.Rebind();
            
        }

        protected void RCB_searchIndividual_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            GridCommandItem commandItem = (GridCommandItem)RG_IndividualSample.MasterTableView.GetItems(GridItemType.CommandItem)[0];
            RadComboBox rcb = (RadComboBox)commandItem.FindControl("RCB_searchIndividual");
            filterSampleSearchmode = Convert.ToInt64(rcb.SelectedValue);
            hdn_searchIndividualID.Value = rcb.SelectedValue;
        }

        protected void RCB_searchIndividual_PreRender(object sender, EventArgs e)
        {
                RadComboBox rcb = sender as RadComboBox;
                rcb.SelectedValue = hdn_searchIndividualID.Value;
        }

        protected void RG_IndividualSample_PreRender(object sender, EventArgs e)
        {
            hdn_searchIndividualID.Value = filterSampleSearchmode.ToString();
        }

        protected void RG_IndividualSample_ItemDataBound(object sender, GridItemEventArgs e)
        {
            //RadGrid grid = (RadGrid)sender;
            //GridDataItem item = (GridDataItem)e.Item;

            //if (e.Item is GridDataItem)
            //{
            //    GridDataItem item = (GridDataItem)e.Item;


            //    //GridNestedViewItem item = (GridNestedViewItem)grid.NamingContainer;
            //    //GridDataItem data = (GridDataItem)item.ParentItem;
            //    string IndvID = item.GetDataKeyValue("IndividualID").ToString();
            //    Session["IndvId_Filter"] = IndvID;
            //}
        }


        //protected void RG_Samples_Variants_ItemDataBound(object sender, GridItemEventArgs e)
        //{
        //    if (e.Item is GridDataItem)
        //    {
        //        GridDataItem item = (GridDataItem)e.Item;

        //        HiddenField hdCount = (HiddenField)item.FindControl("hdn_CountImportFile");
        //        string AllowAnalysis = hdCount.Value.ToString();
        //        ImageButton imgBtn = (ImageButton)item.FindControl("GoSampleDiscovery");
        //        if (AllowAnalysis == "0")
        //        {
        //            imgBtn.Enabled = false;
        //            imgBtn.Style.Add("opacity", "0.5");
        //            imgBtn.Style.Add("cursor", "not-allowed");

        //        }
        //        else
        //        {
        //            imgBtn.Enabled = true;
        //            imgBtn.Style.Add("opacity", "1");
        //            imgBtn.Style.Add("cursor", "pointer");
        //        }
        //    }
        //}
    }
   
}