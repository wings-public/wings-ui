using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.GAP.CS.uc
{
    public partial class uc_CarrierScreenings : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion} 


        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_CenterPI.Text = Session["Current_Center"].ToString() + ", " + Session["Current_PI"].ToString();
        }

        //protected void DDL_PIs_DataBound(object sender, EventArgs e)
        //{
        //    if (!Session["WiNGSUserType"].ToString().Equals("2") && !Session["WiNGSUserType"].ToString().Equals("6"))
        //    {
        //        DDL_PIs.Items.Insert(0, new ListItem("All PIs", "-1"));
        //    }
        //}

        protected void RG_CarrierScreening_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            //if (e.CommandName.Equals("InitInsert"))
            //{
            //    if (DDL_Centers.SelectedValue.Equals("-1"))
            //    {
            //        ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Please select a center first!</b><br />');", true);
            //        e.Canceled = true;
            //    }
            //    if (DDL_PIs.SelectedValue.Equals("-1"))
            //    {
            //        ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Please select a PI first!</b><br />');", true);
            //        e.Canceled = true;
            //    }
            //}

            if (e.CommandName.Equals("DoCarrierScreening"))
            {

                //bool Ceneter_Not_Selected = DDL_Centers.SelectedValue.Equals("-1");
                //bool PI__Not_Selected = DDL_PIs.SelectedValue.Equals("-1");
                //if (Ceneter_Not_Selected)
                //{
                //    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Please select a center first!</b><br />');", true);
                //    e.Canceled = true;
                //}
                //if (PI__Not_Selected)
                //{
                //    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Please select a PI first!</b><br />');", true);
                //    e.Canceled = true;
                //}
                //if (!PI__Not_Selected && !Ceneter_Not_Selected)
                //{
                    GridDataItem item = (GridDataItem)e.Item;
                    Session["CarrierScreeningID"] = item["CarrierScreeningID"].Text;
                    Session["CS_FemaleID"] =  item["FemaleID"].Text;
                    Session["CS_MaleID"] = item["MaleID"].Text;

                    Response.Redirect("/GAP/CS/CarrierScreening.aspx");
              //  }
            }
        }

        protected void RG_CarrierScreening_ItemInserted(object sender, GridInsertedEventArgs e)
        {
            if (e.Exception == null)
            {
                e.ExceptionHandled = true;
            }

        }



        protected void RG_CarrierScreening_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;

                HiddenField hdUpD = (HiddenField)item.FindControl("hdn_Updatable");
                string spUpD = hdUpD.Value;

                if (spUpD.Equals("0"))
                {
                    ImageButton Edit = (ImageButton)item["EditCommandColumn"].Controls[0];
                    Edit.Visible = false;
                }

            }

        }

        protected void RG_CarrierScreening_ItemUpdated(object sender, GridUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;

            }
        }

        protected void RG_CarrierScreening_InsertCommand(object sender, GridCommandEventArgs e)
        {
            SqlConnection conn = new SqlConnection(CnnStr);
            SqlCommand Cmd = new SqlCommand("Sp_GAP_CarrierScreening_Ins", new SqlConnection(CnnStr));
            Cmd.CommandType = CommandType.StoredProcedure;
            Cmd.CommandTimeout = 150;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlDataAdptrCmd.SelectCommand = Cmd;

            SqlParCol = Cmd.Parameters;
            SqlParCol.Add(new SqlParameter("@FemaleID", SqlDbType.BigInt));
            SqlParCol.Add(new SqlParameter("@MaleID", SqlDbType.BigInt));
            SqlParCol.Add(new SqlParameter("@CarrierScreening_Description", SqlDbType.VarChar, -1));
            SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));


            GridEditableItem editedItem = e.Item as GridEditableItem;

            RadTextBox FemaleID = (RadTextBox)editedItem.FindControl("txt_FemaleID");
            RadTextBox MaleID = (RadTextBox)editedItem.FindControl("txt_MaleID");
            TextBox Desc = (TextBox)editedItem.FindControl("txt_carrierScreening_Desc");

            SqlParCol["@FemaleID"].Value = FemaleID.Text;
            SqlParCol["@MaleID"].Value = MaleID.Text;
            SqlParCol["@CarrierScreening_Description"].Value = Desc.Text;
            SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];

            try
            {
                Cmd.Connection.Open();
                Cmd.ExecuteNonQuery();
                Cmd.Connection.Close();


            }
            catch (Exception ex)
            {
                Label lblError = new Label();
                lblError.Text = "Unable to insert. Reason: " + ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}