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
    public partial class uc_PI : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion} 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
        }

       
    }
}