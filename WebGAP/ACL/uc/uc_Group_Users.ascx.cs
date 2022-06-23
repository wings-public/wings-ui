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
    public partial class uc_Group_Users : System.Web.UI.UserControl
    {

        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Center_Datasource();
                Session["selectedItemRight_GUgroup"] = 0;
                Session["selectedItemLeft_GUgroup"] = 0;
            }

        }


        protected void Center_Datasource()
        {
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



        protected void RG_GU_Groups_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("RowClick"))
            {
                GridDataItem item = (GridDataItem)e.Item;
                Session["selectedItemLeft_GUgroup"] = item.ItemIndex;


            }
            if (e.CommandName.Equals("userslist"))
            {
                GridDataItem item = (GridDataItem)e.Item;
                string GroupID = item.GetDataKeyValue("GroupID").ToString();
                Session["GroupID_User"] = GroupID;
                Session["CenterID_GroupUser"] = DDL_Centers.SelectedValue;

                string message = "openWin();";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);

            }
            if (e.CommandName.Equals("deleteAllUser"))
            {
                               
                int Count_SelectedRow = RG_GU_Groups.SelectedItems.Count;
                               
                if (Count_SelectedRow  == 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Please select a group first!</b><br />');", true);
                }


                if (Count_SelectedRow != 0)
                {
                    GridDataItem item = (GridDataItem)e.Item;
                    string GroupID = item.GetDataKeyValue("GroupID").ToString();

                    SqlConnection conn = new SqlConnection(CnnStr);
                    SqlCommand cmd = new SqlCommand("Sp_GU_Remove_All_Users_From_Group", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = cmd.Parameters;

                    SqlParCol.Add(new SqlParameter("@GroupID", SqlDbType.Int));


                    SqlParCol["@GroupID"].Value = GroupID;


                    try
                    {
                        cmd.Connection.Open();
                        cmd.ExecuteNonQuery();
                        cmd.Connection.Close();
                        RG_UG_Groups.Rebind();
                        RG_GU_Users.Rebind();
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

  



        protected void RG_GU_Users_ItemCommand(object sender, GridCommandEventArgs e)
        {
          
            if (e.CommandName.Equals("DeleteSingleUser"))
            {
                GridDataItem item = (GridDataItem)e.Item;

                int Count_SelectedGroup = RG_GU_Groups.SelectedItems.Count;

                if (Count_SelectedGroup == 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Please select a group first!</b><br />');", true);
                }
              

                if (Count_SelectedGroup != 0 )
                {
                   string UserID = item.GetDataKeyValue("UserID").ToString();
                   string GroupID = RG_GU_Groups.SelectedValue.ToString();

                    SqlConnection conn = new SqlConnection(CnnStr);

                    SqlCommand cmd = new SqlCommand("Sp_GU_Remove_Single_Users_From_Group", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = cmd.Parameters;

                    SqlParCol.Add(new SqlParameter("@GroupID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));

                    SqlParCol["@GroupID"].Value = GroupID;
                    SqlParCol["@UserID"].Value = UserID;

                    try
                    {
                        cmd.Connection.Open();
                        cmd.ExecuteNonQuery();
                        cmd.Connection.Close();
                        RG_GU_Users.Rebind();
                        RG_UG_Groups.Rebind();
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

        protected void RG_UG_Groups_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if(e.CommandName.Equals("DeleteGroup"))
            {
                GridDataItem item = (GridDataItem)e.Item;

                int Count_SelectedUser = RG_UG_Users.SelectedItems.Count;

          
            if (Count_SelectedUser == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Please select a user first!</b><br />');", true);
            }

            if ( Count_SelectedUser != 0)
            {

                string GroupID = item.GetDataKeyValue("GroupID").ToString();
                string UserID = RG_UG_Users.SelectedValue.ToString();
                SqlConnection conn = new SqlConnection(CnnStr);

                SqlCommand cmd = new SqlCommand("Sp_GU_Remove_Single_Users_From_Group", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                SqlParCol = cmd.Parameters;

                SqlParCol.Add(new SqlParameter("@GroupID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));

                SqlParCol["@GroupID"].Value = GroupID;
                SqlParCol["@UserID"].Value = UserID;

                try
                {
                    cmd.Connection.Open();
                    cmd.ExecuteNonQuery();
                    cmd.Connection.Close();
                    RG_UG_Groups.Rebind();
                    RG_GU_Users.Rebind();
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

    


        protected void RG_UG_Groups_ItemDataBound(object sender, GridItemEventArgs e)
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

        protected void DDL_Centers_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            Session["selectedItemRight_GUgroup"] = 0;
            Session["selectedItemLeft_GUgroup"] = 0;
            RG_GU_Groups.Rebind();
            RG_GU_Users.Rebind();
            RG_UG_Users.Rebind();
            RG_UG_Groups.Rebind();
        }

        protected void RG_UG_Users_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("RowClick"))
            {
                GridDataItem item = (GridDataItem)e.Item;
                Session["selectedItemRight_GUgroup"] = item.ItemIndex;


            }
        }

        protected void RG_GU_Groups_PreRender(object sender, EventArgs e)
        {
            if (Session["selectedItemLeft_GUgroup"] != null && (RG_GU_Groups.MasterTableView.Items.Count > 0))
            {
                int index = Convert.ToInt32(Session["selectedItemLeft_GUgroup"].ToString());
                RG_GU_Groups.MasterTableView.Items[index].Selected = true;
                Session["selectedItemLeft_GUgroup"] = index;
                RG_GU_Users.Rebind();


            }

        }

        protected void RG_UG_Users_PreRender(object sender, EventArgs e)
        {
            if (Session["selectedItemRight_GUgroup"] != null && (RG_UG_Users.MasterTableView.Items.Count > 0))
            {
                int index = Convert.ToInt32(Session["selectedItemRight_GUgroup"].ToString());
                RG_UG_Users.MasterTableView.Items[index].Selected = true;
                Session["selectedItemRight_GUgroup"] = index;
                RG_UG_Groups.Rebind();


            }
        }
    }
    }
