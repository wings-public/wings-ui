using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.ACL.uc
{
    public partial class uc_IndividualSet_Individuals : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["WiNGSUserType"].ToString().Equals("0"))
            {
                ListItem li = new ListItem();
                li.Text = "All Centers";
                li.Value = "-1";
                DDL_Centers.Items.Add(li);
                DDL_Centers.SelectedIndex = 0;
            }

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (RG_IsetI_Individualset.SelectedIndexes.Count == 0)
                    RG_IsetI_Individualset.SelectedIndexes.Add(0);
                if (RG_IsetI_Individuals.SelectedIndexes.Count != 0)
                    RG_IsetI_Individuals.Rebind();

                if (RG_IIset_Individuals.SelectedIndexes.Count == 0)
                    RG_IIset_Individuals.SelectedIndexes.Add(0);
                if (RG_IIset_Individualset.SelectedIndexes.Count != 0)
                    RG_IIset_Individualset.Rebind();
            }


        }

        protected void RG_IsetI_Individualset_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

            if (e.CommandName.Equals("deleteAllIndividuals"))
            {

                int Count_SelectedRow = RG_IsetI_Individualset.SelectedItems.Count;

                if (Count_SelectedRow == 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Please select a individulset first!</b><br />');", true);
                }

                GridDataItem item = (GridDataItem)e.Item;
                SqlConnection conn = new SqlConnection(CnnStr);

                SqlCommand cmd = new SqlCommand("Sp_II_Individual_From_Individualset_Del", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                SqlParCol = cmd.Parameters;

                SqlParCol.Add(new SqlParameter("@Type", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@IndividualsetID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@IndividualID", SqlDbType.BigInt));

                SqlParCol["@Type"].Value = 1;
                SqlParCol["@IndividualsetID"].Value = item.GetDataKeyValue("IndividualsetID").ToString();
                SqlParCol["@IndividualID"].Value = 0;

                try
                {
                    cmd.Connection.Open();
                    cmd.ExecuteNonQuery();
                    cmd.Connection.Close();
                    RG_IsetI_Individualset.Rebind();
                    RG_IsetI_Individuals.Rebind();
                    RG_IIset_Individuals.Rebind();
                    RG_IIset_Individualset.Rebind();
                }
                catch (Exception ex)
                {
                    Label lblError = new Label();
                    lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                    lblError.ForeColor = System.Drawing.Color.Red;

                }

            }

        }

        protected void RG_IsetI_Individuals_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

            if (e.CommandName.Equals("deleteSingleIndividual"))
            {
                int Count_SelectedIndividualset = RG_IsetI_Individualset.SelectedItems.Count;

                if (Count_SelectedIndividualset == 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Please select a individulset first!</b><br />');", true);
                }



                GridDataItem item = (GridDataItem)e.Item;

                string IndividualID = item.GetDataKeyValue("IndividualID").ToString();
                string Individualset = RG_IsetI_Individualset.SelectedValue.ToString();
                SqlConnection conn = new SqlConnection(CnnStr);

                SqlCommand cmd = new SqlCommand("Sp_II_Individual_From_Individualset_Del", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                SqlParCol = cmd.Parameters;

                SqlParCol.Add(new SqlParameter("@Type", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@IndividualsetID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@IndividualID", SqlDbType.BigInt));

                SqlParCol["@Type"].Value = 0;
                SqlParCol["@IndividualsetID"].Value = Individualset;
                SqlParCol["@IndividualID"].Value = IndividualID;

                try
                {
                    cmd.Connection.Open();
                    cmd.ExecuteNonQuery();
                    cmd.Connection.Close();
                    RG_IsetI_Individualset.Rebind();
                    RG_IsetI_Individuals.Rebind();
                    RG_IIset_Individualset.Rebind();
                    RG_IIset_Individuals.Rebind();
                }
                catch (Exception ex)
                {
                    Label lblError = new Label();
                    lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                    lblError.ForeColor = System.Drawing.Color.Red;

                }

            }


            if (e.CommandName.Equals("AddIndividual"))
            {
                string CenterID = DDL_Centers.SelectedValue.ToString();
                string PIID = DDL_PIs.SelectedValue.ToString();
                GridDataItem item = (GridDataItem)e.Item;
                string IndividualsetID = item.GetDataKeyValue("IndividualsetID").ToString();
                Session["Individualset_Individuals_SetID"] = IndividualsetID;
                Session["Individualset_Individuals_PI"] = PIID;
                Session["Individualset_Individuals_Center"] = CenterID;
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", "openWin()", true);

            }

        }


        protected void RG_IIset_Individualset_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

            if (e.CommandName.Equals("DeleteSingleIndividual"))
            {
                int Count_SelectedIndividuals = RG_IIset_Individuals.SelectedItems.Count;



                if (Count_SelectedIndividuals == 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Please select a individuls first!</b><br />');", true);
                }

                GridDataItem item = (GridDataItem)e.Item;
                SqlConnection conn = new SqlConnection(CnnStr);

                SqlCommand cmd = new SqlCommand("Sp_II_Individual_From_Individualset_Del", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                SqlParCol = cmd.Parameters;

                SqlParCol.Add(new SqlParameter("@Type", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@IndividualsetID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@IndividualID", SqlDbType.BigInt));

                SqlParCol["@Type"].Value = 0;
                SqlParCol["@IndividualsetID"].Value = item.GetDataKeyValue("IndividualsetID");
                SqlParCol["@IndividualID"].Value = RG_IIset_Individuals.SelectedValue.ToString();

                try
                {
                    cmd.Connection.Open();
                    cmd.ExecuteNonQuery();
                    cmd.Connection.Close();
                    RG_IIset_Individualset.Rebind();
                    RG_IIset_Individuals.Rebind();
                    RG_IsetI_Individualset.Rebind();
                    RG_IsetI_Individuals.Rebind();
                }
                catch (Exception ex)
                {
                    Label lblError = new Label();
                    lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                    lblError.ForeColor = System.Drawing.Color.Red;

                }

            }

        }

        protected void RG_IsetI_Individualset_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                if (item.OwnerTableView.Name.Equals("Master"))
                {
                    string IndividualsetID = item.GetDataKeyValue("IndividualsetID").ToString();
                    string PIID = item.GetDataKeyValue("PIID").ToString();
                    string CenterID = item.GetDataKeyValue("CenterID").ToString();
                    ImageButton img = (ImageButton)item.FindControl("newreq");
                    img.Attributes.Add("onclick", "openWin(" + IndividualsetID + "," + PIID + "," + CenterID + "," + ");return false;");

                }



                HiddenField hdnsp = (HiddenField)item.FindControl("hdn_Type");
                string sp = hdnsp.Value.ToString();
                ImageButton imgsp = (ImageButton)item.FindControl("Typebtn");
                switch (sp)
                {
                    case "0":
                        imgsp.ImageUrl = "/img/icon/icon_public.png";
                        imgsp.ToolTip = "Public";
                        imgsp.Width = 25;
                        break;
                    case "1":
                        imgsp.ImageUrl = "/img/icon/icon_private.png";
                        imgsp.ToolTip = "Private";
                        imgsp.Width = 25;
                        break;
                    default:

                        break;
                }

            }
        }

        protected void DDL_PIs_SelectedIndexChanged(object sender, EventArgs e)
        {
            RG_IsetI_Individuals.SelectedIndexes.Clear();
            RG_IIset_Individualset.SelectedIndexes.Clear();
        }

        protected void DDL_Centers_SelectedIndexChanged(object sender, EventArgs e)
        {
            RG_IsetI_Individuals.SelectedIndexes.Clear();
            RG_IIset_Individualset.SelectedIndexes.Clear();
        }

        protected void RG_IIset_Individualset_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                Telerik.Web.UI.GridDataItem item = (GridDataItem)e.Item;

                HiddenField hdnsp = (HiddenField)item.FindControl("hdn_Type");
                string sp = hdnsp.Value.ToString();
                ImageButton imgsp = (ImageButton)item.FindControl("Typebtn");
                switch (sp)
                {
                    case "0":
                        imgsp.ImageUrl = "/img/icon/icon_public.png";
                        imgsp.ToolTip = "Public";
                        imgsp.Width = 25;
                        break;
                    case "1":
                        imgsp.ImageUrl = "/img/icon/icon_private.png";
                        imgsp.ToolTip = "Private";
                        imgsp.Width = 25;
                        break;
                    default:

                        break;
                }

                HiddenField hdnsp_Status = (HiddenField)item.FindControl("hdn_Status");
                string sp_Status = hdnsp_Status.Value.ToString();
                ImageButton imgStatus = (ImageButton)item.FindControl("Statusbtn");
                switch (sp_Status)
                {
                    case "0":
                        imgStatus.ImageUrl = "/img/icon/icon_inactive.png";
                        imgStatus.ToolTip = "Inactive";
                        imgStatus.Width = 25;
                        break;
                    case "1":
                        imgStatus.ImageUrl = "/img/icon/icon_active.png";
                        imgStatus.ToolTip = "Active";
                        imgStatus.Width = 25;
                        break;
                    default:

                        break;

                }
            }
        }
    }
}