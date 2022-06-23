using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.PhenBook.PopUp
{
    public partial class uc_SampleForIndividual : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}


        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void RG_Samples_ItemCommand(object sender, GridCommandEventArgs e)
        {

            if (e.CommandName.Equals("AssignSample"))
            {
                if (Session["IndividualID"].ToString().Equals("-1"))
                {
                GridDataItem item = (GridDataItem)e.Item;
                string SampleID = item.GetDataKeyValue("SampleID").ToString();
                //  ImageButton img = (ImageButton)item.FindControl("AddIndividual");


                string message = "returnToParent(" + SampleID + ");";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
               }
                else
                { 
                GridDataItem item = (GridDataItem)e.Item;
                SqlConnection cn = new SqlConnection(CnnStr);
                SqlCommand cmd = new SqlCommand("Sp_Individual_Sample_Assign", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                SqlDataAdptrCmd.UpdateCommand = cmd;
                SqlParCol = cmd.Parameters;

                SqlParCol.Add(new SqlParameter("@SampleID", SqlDbType.BigInt));
                SqlParCol.Add(new SqlParameter("@IndividualID", SqlDbType.BigInt));
                SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@PIID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@HostID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@feedbackOUT", SqlDbType.NVarChar, -1));

                SqlParCol["@SampleID"].Value = Convert.ToInt64(item["SampleID"].Text);
                SqlParCol["@IndividualID"].Value = Session["IndividualID"];
                SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
                SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
                SqlParCol["@PIID"].Value = Session["Current_PIID"];
                SqlParCol["@HostID"].Value = Session["HostID"];
                SqlParCol["@feedbackOUT"].Direction = ParameterDirection.Output;

                try
                {
                    cmd.Connection.Open();
                    cmd.ExecuteNonQuery();
                    if (!cmd.Parameters["@feedbackOUT"].Value.Equals("Success"))
                    {
                        RL_feedback.Text = cmd.Parameters["@feedbackOUT"].Value.ToString();
                        e.Canceled = true;
                    }
                    else
                    { e.Canceled = false; }
                    cmd.Connection.Close();

                }
                catch (Exception ex)
                {
                    Label lblError = new Label();
                    lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                    lblError.ForeColor = System.Drawing.Color.Red;
                }
                }
                RG_SampleAssigned.Rebind();
                RG_Samples.Rebind();

            }
            if (e.CommandName.Equals("RowClick"))
            {
                RL_feedback.Text = "Please click on icon to select sample!";
          
            }

        }

        protected void RG_SampleAssigned_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("UnassignSample"))
            {

                GridDataItem item = (GridDataItem)e.Item;
                SqlConnection cn = new SqlConnection(CnnStr);
                SqlCommand cmd = new SqlCommand("Sp_Individual_Sample_Unassign", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                SqlDataAdptrCmd.DeleteCommand= cmd;
                SqlParCol = cmd.Parameters;

                SqlParCol.Add(new SqlParameter("@SampleID", SqlDbType.BigInt));
                SqlParCol.Add(new SqlParameter("@IndividualID", SqlDbType.BigInt));
                SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@PIID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@HostID", SqlDbType.Int));
                SqlParCol.Add(new SqlParameter("@feedbackOUT", SqlDbType.NVarChar, -1));

                SqlParCol["@SampleID"].Value = Convert.ToInt64(item["SampleID"].Text);
                SqlParCol["@IndividualID"].Value = Session["IndividualID"];
                SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
                SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
                SqlParCol["@PIID"].Value = Session["Current_PIID"];
                SqlParCol["@HostID"].Value = Session["HostID"];
                SqlParCol["@feedbackOUT"].Direction = ParameterDirection.Output;

                try
                {
                    cmd.Connection.Open();
                    cmd.ExecuteNonQuery();
                    if (!cmd.Parameters["@feedbackOUT"].Value.Equals("Success"))
                    {
                        RL_feedback.Text  = cmd.Parameters["@feedbackOUT"].Value.ToString();
                        e.Canceled = true;
                    }
                    else
                    { e.Canceled = false; }
                    cmd.Connection.Close();

                }
                catch (Exception ex)
                {
                    Label lblError = new Label();
                    lblError.Text = "Unable to insert User. Reason: " + ex.Message;
                    lblError.ForeColor = System.Drawing.Color.Red;
                }
                RG_Samples.Rebind();
                RG_SampleAssigned.Rebind();

            }
        }


        protected void RG_Samples_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem && !IsPostBack)
            {
                GridDataItem item = (GridDataItem)e.Item;
                if (item.OwnerTableView.Name.Equals("Master"))
                {
                    HiddenField MIndividual = (HiddenField)item.FindControl("hdn_MultiIndividual");
                    string MultiIndividual = MIndividual.Value.ToString();
                    if (MultiIndividual == "1")
                    { 
                    RL_feedback.Attributes.Add("style", "padding: 8px;    background-color: #c5e9ea; border-radius: 26px; ");
                    RL_feedback.Text = "Warning: Samples with different local ID are already assigned to the individual!";
                    }
                }
            }
        }
    }
}