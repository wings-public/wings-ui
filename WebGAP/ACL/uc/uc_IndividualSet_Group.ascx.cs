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
    public partial class uc_IndividualSet_Group : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}  

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["PIIDForCurrIndividualset"] = DDL_PIs.SelectedValue.ToString();

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
                if (RG_GI_Group.SelectedIndexes.Count == 0)
                    RG_GI_Group.SelectedIndexes.Add(0);
                if (RG_GI_Individualset.SelectedIndexes.Count != 0)
                    RG_GI_Individualset.Rebind();

                if (RG_IG_Individualset.SelectedIndexes.Count == 0)
                    RG_IG_Individualset.SelectedIndexes.Add(0);
                if (RG_IG_Group.SelectedIndexes.Count != 0)
                    RG_IG_Group.Rebind();
            }

        }
   

        protected void RG_GI_Group_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("listindividualset"))
            {
                GridDataItem item = (GridDataItem)e.Item;
                string GroupID = item.GetDataKeyValue("GroupID").ToString();
                Session["GroupID_Individualset"] = GroupID;
                Session["CenterID_GroupIndset"] = DDL_Centers.SelectedValue.ToString();

                string message = "openWin();";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
            }

            if (e.CommandName.Equals("deleteAllIndividualsets"))
            {

                    GridDataItem item = (GridDataItem)e.Item;
                    SqlConnection conn = new SqlConnection(CnnStr);

                    SqlCommand cmd = new SqlCommand("Sp_IG_Delete_Individualset_From_Group", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = cmd.Parameters;

                    SqlParCol.Add(new SqlParameter("@Type", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@IndividualsetID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@GroupID", SqlDbType.Int));

                    SqlParCol["@Type"].Value = 1;
                    SqlParCol["@IndividualsetID"].Value = 0;
                    SqlParCol["@GroupID"].Value =  item.GetDataKeyValue("GroupID").ToString();
                    ;

                    try
                    {
                        cmd.Connection.Open();
                        cmd.ExecuteNonQuery();
                        cmd.Connection.Close();
                        RG_IG_Group.Rebind();
                        RG_GI_Group.Rebind();
                        RG_GI_Individualset.Rebind();
                    }
                    catch (Exception ex)
                    {
                        Label lblError = new Label();
                        lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                        lblError.ForeColor = System.Drawing.Color.Red;

                    }

            }
        }

        protected void RG_GI_Individualset_ItemCommand(object sender, GridCommandEventArgs e)
        {
            

        
                if (e.CommandName.Equals("DeleteIndividualset"))
            {
                GridDataItem item = (GridDataItem)e.Item;

                int SelectedGroupcount = RG_GI_Group.SelectedItems.Count;

                if (SelectedGroupcount == 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Please select a group first!</b><br />');", true);
                }
               
                if ( SelectedGroupcount != 0)
                {
                   
                    SqlConnection conn = new SqlConnection(CnnStr);

                    SqlCommand cmd = new SqlCommand("Sp_IG_Delete_Individualset_From_Group", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = cmd.Parameters;

                    SqlParCol.Add(new SqlParameter("@Type", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@IndividualsetID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@GroupID", SqlDbType.Int));

                    SqlParCol["@Type"].Value = 0;
                    SqlParCol["@IndividualsetID"].Value = item.GetDataKeyValue("IndividualsetID").ToString();
                    SqlParCol["@GroupID"].Value = RG_GI_Group.SelectedValue;

                    try
                    {
                        cmd.Connection.Open();
                        cmd.ExecuteNonQuery();
                        cmd.Connection.Close();
                        RG_GI_Group.Rebind();
                        RG_GI_Individualset.Rebind();
                    }
                    catch (Exception ex)
                    {
                        Label lblError = new Label();
                        lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                        lblError.ForeColor = System.Drawing.Color.Red;

                    }
                }

            }
           
        }

        protected void RG_IG_Group_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("DeleteGroup"))
            {
                GridDataItem item = (GridDataItem)e.Item;

               int selectedIndividualset_count = RG_IG_Individualset.SelectedItems.Count;

                if (selectedIndividualset_count == 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Please select a individualset first!</b><br />');", true);
                }

                if (selectedIndividualset_count != 0 )
                {
                   
                    SqlConnection conn = new SqlConnection(CnnStr);

                    SqlCommand cmd = new SqlCommand("Sp_IG_Delete_Individualset_From_Group", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = cmd.Parameters;

                    SqlParCol.Add(new SqlParameter("@Type", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@IndividualsetID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@GroupID", SqlDbType.Int));

                    SqlParCol["@Type"].Value = 0;
                    SqlParCol["@IndividualsetID"].Value = RG_IG_Individualset.SelectedValue;
                    SqlParCol["@GroupID"].Value = item.GetDataKeyValue("GroupID").ToString();

                    try
                    {
                        cmd.Connection.Open();
                        cmd.ExecuteNonQuery();
                        cmd.Connection.Close();
                        RG_IG_Group.Rebind();
                        RG_IG_Individualset.Rebind();
                    }
                    catch (Exception ex)
                    {
                        Label lblError = new Label();
                        lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                        lblError.ForeColor = System.Drawing.Color.Red;

                    }
                }
            }
        }

        protected void DDL_Centers_SelectedIndexChanged(object sender, EventArgs e)
        {
            RG_GI_Individualset.SelectedIndexes.Clear();
            RG_IG_Group.SelectedIndexes.Clear();

        }

        protected void DDL_PIs_SelectedIndexChanged(object sender, EventArgs e)
        {
            RG_GI_Individualset.SelectedIndexes.Clear();
            RG_IG_Group.SelectedIndexes.Clear();

        }


        protected void RG_GI_Individualset_ItemDataBound(object sender, GridItemEventArgs e)
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

        protected void RG_IG_Group_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                Telerik.Web.UI.GridDataItem item = (GridDataItem)e.Item;
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