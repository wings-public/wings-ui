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
    public partial class uc_PI_PowerUser : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion} 

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["WiNGSUserType"].ToString().Equals("1") || Session["WiNGSUserType"].ToString().Equals("2"))
            {
                DDL_Centers.Attributes["style"] = "visibility: hidden;";
                DDL_Centers.Items.Insert(0, new ListItem(Session["WiNGSCenterID"].ToString()));
                DDL_Centers.SelectedIndex = 0;

            }
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {

            if (RG_PP_PI.SelectedIndexes.Count == 0)
                RG_PP_PI.SelectedIndexes.Add(0);
            if (RG_PP_PowerUser.SelectedIndexes.Count == 0)
            {
                RG_PP_PowerUser.Rebind();
                RG_PP_PowerUser.SelectedIndexes.Add(0);
            }
        }

        protected void RG_PP_PI_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                if (item.OwnerTableView.Name.Equals("Master"))
                {
                   
                    string PIID = item.GetDataKeyValue("PIID").ToString();
                    ImageButton img = (ImageButton)item.FindControl("newreq");
                    img.Attributes.Add("onclick", "openWin(" + PIID + ");return false;");

                }
            }
        }

        protected void RG_PP_PowerUser_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("DeletePoweruser"))
            {
                string Center = null;


                Center = RG_PP_PI.SelectedValue.ToString();


                if (Center == null)
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Please select a center first!</b><br />');", true);
                }


                if (Center != null)
                {
                    GridDataItem item = (GridDataItem)e.Item;
                  
                    SqlConnection conn = new SqlConnection(CnnStr);

                    SqlCommand cmd = new SqlCommand("Sp_PP_PI_PowerUser_Del", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = cmd.Parameters;

                    SqlParCol.Add(new SqlParameter("@PIID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@Type", SqlDbType.Int));

                    SqlParCol["@Type"].Value = 0;
                    SqlParCol["@UserID"].Value = item.GetDataKeyValue("UserID").ToString();
                    SqlParCol["@PIID"].Value = 0;

                    try
                    {
                        cmd.Connection.Open();
                        cmd.ExecuteNonQuery();
                        cmd.Connection.Close();
                        RG_PP_PI.Rebind();
                        RG_PP_PowerUser.Rebind();
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

        protected void RG_PP_PI_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("DeleteAllPowerusers"))
            {
                string Center = null;
                Center = RG_PP_PI.SelectedValue.ToString();


                if (Center == null)
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Please select a center first!</b><br />');", true);
                }


                if (Center != null)
                {
                    GridDataItem item = (GridDataItem)e.Item;
                   
                    SqlConnection conn = new SqlConnection(CnnStr);

                    SqlCommand cmd = new SqlCommand("Sp_PP_PI_PowerUser_Del", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = cmd.Parameters;

                    SqlParCol.Add(new SqlParameter("@PIID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@Type", SqlDbType.Int));

                    SqlParCol["@Type"].Value = 1;
                    SqlParCol["@UserID"].Value = 0;
                    SqlParCol["@PIID"].Value = item.GetDataKeyValue("PIID").ToString();

                    try
                    {
                        cmd.Connection.Open();
                        cmd.ExecuteNonQuery();
                        cmd.Connection.Close();
                        // RG_GI_Group.Rebind();
                        // RG_GI_Individualset.Rebind();
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
    }
}