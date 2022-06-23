using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.GAP.Trio.Popup
{
    public partial class uc_Analysis_AssignFamily : System.Web.UI.UserControl
    {

        #region "CnnStr"{
        string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RG_Family_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.Item is GridDataItem)
            {

                GridDataItem item = (GridDataItem)e.Item;
             

                if (e.CommandName.Equals("RowClick") || e.CommandName.Equals("insertTrio"))
                {
                    SqlCommand Cmd = new SqlCommand("Sp_GAP_Trio_Ins", new SqlConnection(CnnStr));
                    Cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                    SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                    SqlParCol = Cmd.Parameters;
                    SqlParCol.Add(new SqlParameter("@FamilyID", SqlDbType.BigInt));
                    SqlParCol.Add(new SqlParameter("@TrioLocalID", SqlDbType.NVarChar, -1));
                    SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@PIID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                    SqlParCol.Add(new SqlParameter("@feedbackOUT", SqlDbType.NVarChar, -1));
                    SqlParCol["@FamilyID"].Value = Session["FamilyID_trio_unregisterd"];
                    SqlParCol["@TrioLocalID"].Value = item["TrioLocalID"].Text; 
                    SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
                    SqlParCol["@PIID"].Value = Session["Current_PIID"];
                    SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
                    SqlParCol["@feedbackOUT"].Direction = ParameterDirection.Output;

                    try
                    {
                        Cmd.Connection.Open();
                        Cmd.ExecuteNonQuery();
                        if (!Cmd.Parameters["@feedbackOUT"].Value.Equals("Succeed"))
                        {
                            
                            lblError.Text = Cmd.Parameters["@feedbackOUT"].Value.ToString();
                            lblError.ForeColor = System.Drawing.Color.Red;
                        }
                        Cmd.Connection.Close();
                        lblError.Text = "The trio case is ready to analysis";
                        lblError.ForeColor = System.Drawing.Color.Green;
                    }
                    catch (Exception ex)
                    {
                        Label lblError = new Label();
                        lblError.Text =  ex.Message;
                        lblError.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }

        }

      
    }
}