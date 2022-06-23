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
    public partial class uc_DataSet : System.Web.UI.UserControl
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
        protected void RG_DataSet_ItemUpdated(object sender, Telerik.Web.UI.GridUpdatedEventArgs e)
        {

            if (e.Exception != null)
            {
            }
            else
            {
            }
        }

        protected void RG_DataSet_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Edit") || e.CommandName.Equals("InitInsert"))
            {

                if (DDL_Centers.SelectedValue.Equals("-1") || DDL_PIs.SelectedValue.Equals("-1"))
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Please select a center/PI first!</b><br />');", true);
                    e.Canceled = true;
                }
                
            }
        }

      

        protected void RG_DataSet_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is Telerik.Web.UI.GridDataItem)
            {
                Telerik.Web.UI.GridDataItem item = (Telerik.Web.UI.GridDataItem)e.Item;

                HiddenField hdnsp = (HiddenField)item.FindControl("hdn_Type");
                string sp = hdnsp.Value.ToString();
                ImageButton imgsp = (ImageButton)item.FindControl("Typebtn");
                switch (sp)
                {
                    case "0":
                        imgsp.ImageUrl = "/img/icon/icon_Public.png";
                        imgsp.ToolTip = "Public";
                        break;
                    case "1":
                        imgsp.ImageUrl = "/img/icon/icon_Private.png";
                        imgsp.ToolTip = "Private";
                        break;
                    case "2":
                        imgsp.ImageUrl = "/img/icon/icon_PrivatetoCenter.png";
                        imgsp.ToolTip = "Private to center";
                        break;
                    case "3":
                        imgsp.ImageUrl = "/img/icon/icon_Requested.png";
                        imgsp.ToolTip = "Requested by user";
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
                        break;
                    case "1":
                        imgStatus.ImageUrl = "/img/icon/icon_active.png";
                        imgStatus.ToolTip = "Active";
                        break;
                    default:

                        break;

                }
            }
        }

        protected void DDL_Centers_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            PI_Datasource();
        }
    }
}