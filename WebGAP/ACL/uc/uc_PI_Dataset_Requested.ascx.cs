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
    public partial class uc_PI_Dataset_Requested : System.Web.UI.UserControl
    {

        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion} 

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Center_Datasource();
                PI_Datasource();

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

        protected void PI_Datasource()
        {


            SqlCommand Cmd = new SqlCommand("Sp_PI_Sel", new SqlConnection(CnnStr));
            Cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = Cmd.Parameters;
            SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@InputType", SqlDbType.Int));

            SqlParCol["@CenterID"].Value = DDL_Centers.SelectedValue;
            SqlParCol["@UserID"].Value = Session["WiNGSMasterId"].ToString();
            SqlParCol["@InputType"].Value = -1;

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

            DDL_PIs.Items.Clear();
            // Clear the default Item that has been re-created from ViewState at this point.
            if (Session["WiNGSUserType"].ToString() == "0" || Session["WiNGSUserType"].ToString() == "1")
            {
                RadComboBoxItem item = new RadComboBoxItem();
                item.Text = "All PIs";
                item.Value = "-1";
                item.Attributes.Add("PIID", item.Text);
                DDL_PIs.Items.Add(item);
                item.DataBind();
            }


            foreach (DataRow row in Data.Rows)
            {
                RadComboBoxItem item = new RadComboBoxItem();
                item.Text = row["PIName"].ToString();
                item.Value = row["PIID"].ToString();
                item.Attributes.Add("PIID", row["PIName"].ToString());
                DDL_PIs.Items.Add(item);
                item.DataBind();
            }


            if (DDL_PIs.Items.Count.Equals(1))
            {
                DDL_PIs.Enabled = false;
            }

            if (!IsPostBack)
            {
                DDL_PIs.SelectedIndex = 0;
            }

        }


        protected void DDL_Centers_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            PI_Datasource();
        }

        protected void RG_DataSet_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if(e.Item is GridDataItem)
            {

                if (e.CommandName == "SelYes" || e.CommandName == "SelNo")
                {
                   // ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Are you sure!!</b><br />');", true);

                    SqlConnection conn = new SqlConnection(CnnStr);
                    conn.Open();

                    GridDataItem item = (GridDataItem)e.Item;


                    ImageButton imgsp = (ImageButton)item.FindControl("AA_yes");
                    ImageButton imgspNO = (ImageButton)item.FindControl("AA_no");

                    string ReqID = item.GetDataKeyValue("ReqID").ToString();


                    SqlCommand Cmd = new SqlCommand("Sp_PI_Dataset_IsAsked_Permission_Upd", new SqlConnection(CnnStr));
                    Cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = Cmd.Parameters;
                    SqlParCol.Add(new SqlParameter("@ReqID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@Answer", SqlDbType.Int));
                    SqlParCol["@ReqID"].Value = ReqID;
                    SqlParCol["@Answer"].Value = (e.CommandName == "SelYes") ? 1 : 0 ;

                    try
                    {
                        Cmd.Connection.Open();
                        Cmd.ExecuteNonQuery();
                      
                        Cmd.Connection.Close();
                    }
                    catch (Exception ex)
                    {
                        Label lblError = new Label();
                        lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                        lblError.ForeColor = System.Drawing.Color.Red;
                    }
                    RG_DataSet.Rebind();

                }

            }
        }
    }
}