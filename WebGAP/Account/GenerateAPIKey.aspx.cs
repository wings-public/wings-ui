using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
//using System.Windows.Forms;

namespace WebGAP.Account
{
    public partial class GenerateAPIKey : System.Web.UI.Page
    {

        #region "CnnStr"{
        static string CnnStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void confirm_Click(object sender, EventArgs e)
        {
            Console.WriteLine("Confirmed!");

            String connstring = CnnStr;
            SqlConnection conn = new SqlConnection(connstring);
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand("Sp_RESTAPI_Token", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CenterID", SqlDbType.Int);
            cmd.Parameters.Add("@userID", SqlDbType.Int);

            //cmd.Parameters["@VariantPhenotype"].Value = Convert.ToInt32(HF_VarPhen.Value);
            //cmd.Parameters["@NoVariantPhenotype"].Value = Convert.ToInt32(HF_NoVarPhen.Value);
            // Retrieve center id and user id from session
            int center_id = Convert.ToInt32(Session["Current_CenterID"]);
            int user_id = Convert.ToInt32(Session["WiNGSMasterID"]);

            Console.WriteLine(center_id);
            Console.WriteLine(user_id);

            cmd.Parameters["@CenterID"].Value = center_id;
            cmd.Parameters["@UserID"].Value = user_id;
            // tested with 3 and 1085
            //cmd.Parameters["@UserID"].Value = 1105;

            SqlDataAdptrCmd.SelectCommand = cmd;
            DataTable myDataTable = new DataTable();

            try
            {
                conn.Open();
                //    cmd.ExecuteNonQuery();
                SqlDataAdptrCmd.Fill(myDataTable);

                //if (myDataTable.Rows.Contains("feedback"))
                //if (!String.IsNullOrEmpty(myDataTable.Rows[0]["feedback"].ToString()))
                if ( myDataTable.Columns.Contains("feedback"))
                {
                    String txt1 = myDataTable.Rows[0]["feedback"].ToString();
                    Console.WriteLine(txt1);

                    FailureText.Text = myDataTable.Rows[0]["feedback"].ToString();
                    ErrorMessage.Visible = true;
                    return;
                }
                //} else if (myDataTable.Rows.Contains("token"))
                //else if (!String.IsNullOrEmpty(myDataTable.Rows[0]["token"].ToString()))
                else if ( myDataTable.Columns.Contains("Token"))
                {
                    String txt2 = myDataTable.Rows[0]["Token"].ToString();
                    Console.WriteLine(txt2);
                    String sp_resp = myDataTable.Rows[0]["Token"].ToString();
                    Console.WriteLine(sp_resp);
                    //pValue = Convert.ToDouble(myDataTable.Rows[0]["PValue"]);
                    TextBox_result.Text = sp_resp;

                    String tokenMsg = "Please store the token properly.WiNGS does not store the token";
                    FailureText.Text = tokenMsg;
                    ErrorMessage.Visible = true;
                    return;
                }
                

                //Label Lbl_resp = rpv.FindControl("TextBox_result") as Label;
                //Lbl_resp.Text = sp_resp;
                //Label lbl_FisherStats = rpv.FindControl("lbl_FisherStats") as Label;
                //lbl_FisherStats.Text = "Excact probability: " + pValue.ToString();
            }
            catch (SqlException ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Something went wrong! </b>'); height=120,width=250", true);

            }

            //string text = "This is some Text that I wanted to show";
            //System.Windows.Forms.MessageBox.Show(text);
        }

        protected void revoke_Click(object sender, EventArgs e)
        {
            Console.WriteLine("Revoke Clicked!");
            //String center_val = Session["Current_CenterID"].ToString();
            //String user_id = Session["WiNGSMasterID"].ToString();

            String connstring = CnnStr;
            SqlConnection conn = new SqlConnection(connstring);
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            String token_id = TextBox_revokeAPIKey.Text;
            Console.WriteLine(token_id);
            SqlCommand cmd = new SqlCommand("Sp_RESTAPI_Revoke_Token", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@token", SqlDbType.VarChar);
            cmd.Parameters["@token"].Value = token_id;

            if (String.IsNullOrEmpty(token_id))
            {
                String errMsg = "Token cannot be empty. Please enter a valid token";
                RevokeError.Text = errMsg;
                Revoke_ErrorMsg.Visible = true;
                return;
            }
            //cmd.Parameters["@CenterID"].Value = 3;
            SqlDataAdptrCmd.SelectCommand = cmd;
            DataTable myDataTable = new DataTable();

            try
            {
                conn.Open();
                //    cmd.ExecuteNonQuery();
                SqlDataAdptrCmd.Fill(myDataTable);
                if (myDataTable.Columns.Contains("feedback"))
                {
                    String txt1 = myDataTable.Rows[0]["feedback"].ToString();
                    Console.WriteLine(txt1);

                    if (String.IsNullOrEmpty(txt1))
                    {
                        Console.WriteLine("Invalid or revoked token");
                        txt1 = "Invalid or revoked token";
                    }

                    RevokeError.Text = txt1;
                    Revoke_ErrorMsg.Visible = true;
                    return;
                }
            }
            catch (SqlException ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br/><b>Something went wrong! </b>'); height=120,width=250", true);

            }

        }

        /*protected void copyText_click(object sender, EventArgs e)
        {
            Console.WriteLine("Copy clicked!");
            String text = TextBox_result.Text;
            Clipboard.SetText(text);
        }*/

        protected void createAPI_Click(object sender, EventArgs e)
        {
            // color change after button click
            btn_createAPIKey.ForeColor = Color.Black;
            btn_createAPIKey.BackColor = Color.White;

            // resetting non clicked button color
            btn_revokeAPIKey.ForeColor = default(Color);
            btn_revokeAPIKey.BackColor = default(Color);


            // hide Revoke API Key Panel
            if (textBoxPanel_revokeAPIKey.Visible == true)
                textBoxPanel_revokeAPIKey.Visible = false;

            // show Create API Key Panel
            if (textBoxPanel_createAPIKey.Visible == false)
                textBoxPanel_createAPIKey.Visible = true;

            // - - - - - - - - -  - - - - - - - - - - - -  
        }

        protected void revokeAPI_Click(object sender, EventArgs e)
        {
            // color change after button click
            btn_revokeAPIKey.ForeColor = Color.Black;
            btn_revokeAPIKey.BackColor = Color.White;
            
            // resetting nn clicked button color
            btn_createAPIKey.ForeColor = default(Color);
            btn_createAPIKey.BackColor = default(Color);


            // hide Create API Key Panel
            if (textBoxPanel_createAPIKey.Visible == true)
                textBoxPanel_createAPIKey.Visible = false;

            // show Revoke API Key Panel 
            if (textBoxPanel_revokeAPIKey.Visible == false)
                textBoxPanel_revokeAPIKey.Visible = true;

            // - - - - - - - - -  - - - - - - - - - - - -
        }

    }
}