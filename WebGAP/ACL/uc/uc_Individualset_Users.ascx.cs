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
    public partial class uc_Individualset_Users : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
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
                if (RG_IU_Individualset.SelectedIndexes.Count == 0)
                    RG_IU_Individualset.SelectedIndexes.Add(0);
                if (RG_IU_Users.SelectedIndexes.Count != 0)
                    RG_IU_Users.Rebind();
              
            }
        }

      

        protected void RG_IU_Individualset_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("listusers"))
            {
                GridDataItem item = (GridDataItem)e.Item;

                Session["IndividualsetID_User"] = item.GetDataKeyValue("IndividualsetID").ToString(); ;
                string message = "openWin();";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
            }

            if (e.CommandName.Equals("deleteAllUsers"))
            {
                GridDataItem item = (GridDataItem)e.Item;

                SqlConnection conn = new SqlConnection(CnnStr);
                     SqlCommand cmd = new SqlCommand("Sp_IU_Delete_User_From_Individualset", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = cmd.Parameters;

                    SqlParCol.Add(new SqlParameter("@Type", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@IndividualsetID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));

                    SqlParCol["@Type"].Value = 1;
                    SqlParCol["@IndividualsetID"].Value = item.GetDataKeyValue("IndividualsetID").ToString();
                    SqlParCol["@UserID"].Value = 0;

                    try
                    {
                        cmd.Connection.Open();
                        cmd.ExecuteNonQuery();
                        cmd.Connection.Close();
                        RG_IU_Users.Rebind();
                    }
                    catch (Exception ex)
                    {
                        Label lblError = new Label();
                        lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                        lblError.ForeColor = System.Drawing.Color.Red;

                    }

                }
        }

        protected void RG_IU_Users_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("deleteSingleUser"))
            {
                GridDataItem item = (GridDataItem)e.Item;
                string IndividualsetID = null;
                string UserID = null;
                IndividualsetID = RG_IU_Individualset.SelectedValue.ToString();
                UserID = item.GetDataKeyValue("UserID").ToString();
                
                if (IndividualsetID == null)
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Please select a individualset first!</b><br />');", true);
                }
                if (UserID == null)
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Please select a user first!</b><br />');", true);
                }

                if (IndividualsetID != null)
                {
                  
                    SqlConnection conn = new SqlConnection(CnnStr);

                    SqlCommand cmd = new SqlCommand("Sp_IU_Delete_User_From_Individualset", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = cmd.Parameters;

                    SqlParCol.Add(new SqlParameter("@Type", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@IndividualsetID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));

                    SqlParCol["@Type"].Value = 0;
                    SqlParCol["@IndividualsetID"].Value = IndividualsetID;
                    SqlParCol["@UserID"].Value = UserID;

                    try
                    {
                        cmd.Connection.Open();
                        cmd.ExecuteNonQuery();
                        cmd.Connection.Close();
                         RG_IU_Users.Rebind();
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