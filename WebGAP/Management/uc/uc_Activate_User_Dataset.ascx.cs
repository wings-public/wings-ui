using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.Management.uc
{
    public partial class uc_Activate_User_Dataset : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}

        protected void Page_Load(object sender, EventArgs e)
        {

        }

      
        protected void btn_Activate_Click(object sender, EventArgs e)
        {
            foreach (GridDataItem dataItem in RG_AA_Available_Dataset.SelectedItems)
            {
                dataItem.OwnerTableView.Name = "Master";
                var strDSID = dataItem.GetDataKeyValue("DatasetID").ToString();
                var strDST = dataItem.GetDataKeyValue("TypeDS").ToString();
                Activate_Deactive_Dataset(0, strDSID, strDST);

            }
            RG_AA_Active_Dataset.Rebind();
            RG_AA_Available_Dataset.Rebind();
        }


        public void Activate_Deactive_Dataset(int AcDe, String DatasetID, String DatasetType)
        {
            
            SqlConnection cnn = new SqlConnection(CnnStr);
            SqlCommand cmd = new SqlCommand("Sp_AA_Act_DeAct_DataSet", cnn);

            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = cmd.Parameters;

            SqlParCol.Add(new SqlParameter("@DatasetID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@DatasetType", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@QT", SqlDbType.Int));

            SqlParCol["@DatasetID"].Value = DatasetID;
            SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
            SqlParCol["@DatasetType"].Value = (DatasetType == "Normal") ? 0 : 1;
            SqlParCol["@QT"].Value = AcDe;

            try
            {
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                cnn.Close();
           
            }
            catch (SqlException ex)
            {
                //  MessageBox.Show(ex.Message);
            }
           
        }

        protected void btn_Deactivate_Click(object sender, EventArgs e)
        {
            foreach (GridDataItem dataItem in this.RG_AA_Active_Dataset.SelectedItems)
            {
                dataItem.OwnerTableView.Name = "Master";
                var strDSID = dataItem.GetDataKeyValue("DatasetID").ToString();
                var strDST = dataItem.GetDataKeyValue("TypeDS").ToString();
                Activate_Deactive_Dataset(1, strDSID, strDST);

            }
            RG_AA_Active_Dataset.Rebind();
            RG_AA_Available_Dataset.Rebind();
        }
    }
}