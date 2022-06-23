using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.GAP.Trio.uc
{
    public partial class uc_Trio_Analysises_list : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion} 

        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_CenterPI.Text = Session["Current_Center"].ToString() + ", " + Session["Current_PI"].ToString();
        }

        protected void RG_Trio_ItemCommand(object sender, GridCommandEventArgs e)
        {

            if (e.CommandName.Equals("DoTrio"))
            {

                if (e.Item is GridDataItem)
                {
                    //bool Ceneter_Not_Selected = DDL_Centers.SelectedValue.Equals("-1");
                    //bool PI__Not_Selected = DDL_PIs.SelectedValue.Equals("-1");
                    //if (Ceneter_Not_Selected)
                    //{
                    //    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Please select a center first!</b><br />');", true);
                    //    e.Canceled = true;
                    //}
                    //if (PI__Not_Selected)
                    //{
                    //    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Please select a PI first!</b><br />');", true);
                    //    e.Canceled = true;
                    //}
                    //if (!PI__Not_Selected && !Ceneter_Not_Selected)
                    //{
                     GridDataItem item = (GridDataItem)e.Item;
                     Session["TrioLocalID"] = item.GetDataKeyValue("TrioLocalID").ToString();
                    HiddenField probandID = (HiddenField)item.FindControl("hdn_probandID");
                    HiddenField fatherID = (HiddenField)item.FindControl("hdn_fatherID");
                    HiddenField motherID = (HiddenField)item.FindControl("hdn_motherID");
                    HiddenField RefBuildID = (HiddenField)item.FindControl("hdn_RefBuildID");
                    HiddenField seqType = (HiddenField)item.FindControl("hdn_SeqType");


                    Session["Trio_ProbandID"] = probandID.Value;
                    Session["Trio_Control1_ID"] = fatherID.Value;
                    Session["Trio_Control2_ID"] = motherID.Value;
                    Session["Trio_Refbuild_ID"] = RefBuildID.Value;
                    Session["Trio_SeqType"] = seqType.Value;
                    Session["ID_drawPedigree"] = probandID.Value;

                    Response.Redirect("/GAP/Trio/Trio_Analysis.aspx");
                }
            }
            if (e.CommandName.Equals("Family_Unregistered"))
            {

                if (e.Item is GridDataItem)
                {

                    GridDataItem item = (GridDataItem)e.Item;
                    Session["FamilyID_trio_unregisterd"] = item["FamilyID"].Text;

                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", "ShowInsertForm()", true);
                }
            }
            
        }

        protected void RG_Trio_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem && e.Item.OwnerTableView.Name == "ChildGrid")
            {
               GridDataItem item = (GridDataItem)e.Item;

                HiddenField hdCount = (HiddenField)item.FindControl("hdn_status");
                ImageButton imgBtn = (ImageButton)item.FindControl("Trio_Count");
                Label status = (Label)item.FindControl("lbl_status");
                string AllowAnalysis = hdCount.Value.ToString();
                if(AllowAnalysis == "ongoing" || AllowAnalysis == "disabled")
                {
                    imgBtn.Enabled = false;
                    imgBtn.Style.Add("opacity", "0.5");
                    imgBtn.Style.Add("cursor", "not-allowed");
                }
                if(status.Text == "ongoing")
                {
                    status.Attributes.Add("style", "color: blue;font-weight: bold; ");

                }
                else if (status.Text == "disabled")
                { status.Attributes.Add("style", "color: red;font-weight: bold; "); }
                else
                { status.Attributes.Add("style", "color: green;font-weight: bold "); }

            }
        }
    }
}