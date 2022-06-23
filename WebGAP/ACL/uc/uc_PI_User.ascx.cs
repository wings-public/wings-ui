using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.ACL.uc
{
    public partial class uc_PI_User : System.Web.UI.UserControl
    {

        #region "CnnStr"{
        string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}

        int CenterIsChanged = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CenterIsChanged = 1;
                SqlCommand Cmd = new SqlCommand("Sp_Center_Sel", new SqlConnection(CnnStr));
                Cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                SqlParCol = Cmd.Parameters;
                SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));

                SqlParCol["@UserID"].Value = Session["WiNGSMasterId"].ToString();


                SqlConnection conn = new SqlConnection(CnnStr);
                SqlDataAdapter adapter = new SqlDataAdapter();
                SqlDataAdptrCmd.SelectCommand = Cmd;


                DataTable Data = new DataTable();

                Cmd.Connection.Open();
                try
                {
                    SqlDataAdptrCmd.Fill(Data);
                }
                finally
                {
                    Cmd.Connection.Close();
                }

                DDL_Centers.Items.Clear();
                // Clear the default Item that has been re-created from ViewState at this point.
                if (Session["WiNGSUserType"].ToString() == "0")
                {
                    RadComboBoxItem item = new RadComboBoxItem();
                    item.Text = "All Centers";
                    item.Value = "-1";
                    item.Attributes.Add("CenterID", item.Text);
                    DDL_Centers.Items.Add(item);
                    item.DataBind();
                }


                foreach (DataRow row in Data.Rows)
                {
                    RadComboBoxItem item = new RadComboBoxItem();
                    item.Text = row["CenterDesc"].ToString();
                    item.Value = row["CenterID"].ToString();
                    item.Attributes.Add("CenterID", row["CenterDesc"].ToString());
                    DDL_Centers.Items.Add(item);
                    item.DataBind();
                }


                if (DDL_Centers.Items.Count.Equals(1))
                {
                    DDL_Centers.Enabled = false;
                }

                DDL_Centers.SelectedIndex = 0;

            }
        }


        protected void RG_PU_User_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("deleteUser"))
            {
                GridDataItem item = (GridDataItem)e.Item;

                string UserID = item.GetDataKeyValue("UserID").ToString();

                SqlConnection conn = new SqlConnection(CnnStr);

                SqlCommand cmd = new SqlCommand("Sp_PU_PI_User_Del", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                SqlParCol = cmd.Parameters;

                SqlParCol.Add(new SqlParameter("@PIID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));

                SqlParCol["@PIID"].Value = RG_PU_PI.SelectedValue.ToString();
                SqlParCol["@UserID"].Value = UserID;

                try
                {
                    cmd.Connection.Open();
                    cmd.ExecuteNonQuery();
                    cmd.Connection.Close();
                   // RG_PU_PI.Rebind();
                    RG_PU_User.Rebind();
                }
                catch (Exception ex)
                {
                    Label lblError = new Label();
                    lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                    lblError.ForeColor = System.Drawing.Color.Red;

                }

            }
        }

      

        protected void RG_PU_User_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                HiddenField hdnDSdefault = (HiddenField)item.FindControl("hdn_WhichTbl");
                string ds = hdnDSdefault.Value.ToString();
                if (ds == "1")
                {
                    ImageButton btn_delete = (ImageButton)item.FindControl("delete");
                    btn_delete.Visible = false;


                }
            }
        }

        protected void RG_PU_PI_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if(e.CommandName.Equals("AddnewUser"))
            {
                GridDataItem item = (GridDataItem)e.Item;
                string PIID = item.GetDataKeyValue("PIID").ToString();

                string CenterID = DDL_Centers.SelectedValue.ToString();
                Session["PU_PI"] = PIID;
                Session["PU_Center"] = CenterID;
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", "openWin()", true);
            }
        }

        protected void DDL_Centers_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            CenterIsChanged = 1;
            RG_PU_PI.Rebind();
            RG_PU_User.Rebind();
        }

        protected void RG_PU_PI_PreRender(object sender, EventArgs e)
        {
            if (CenterIsChanged == 1 && (RG_PU_PI.MasterTableView.Items.Count > 0))
            {
                RG_PU_PI.MasterTableView.Items[0].Selected = true;
                RG_PU_User.Rebind();
                CenterIsChanged = 0;
            }
        }
    }
}