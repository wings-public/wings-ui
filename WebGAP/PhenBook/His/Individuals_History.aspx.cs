using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.PhenBook.His
{
    public partial class Individuals_History : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        #region "CnnStr"{
        string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["WiNGS_Phenotype_DbConnectionString"].ConnectionString;
        #endregion}

     

        protected void RG_Individual_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {

            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;

                HiddenField hdnsp = (HiddenField)item.FindControl("hdn_Gender");
                string sp = hdnsp.Value.ToString();
                ImageButton imgsp = (ImageButton)item.FindControl("Genderbtn");
                switch (sp)
                {


                    case "0":
                        imgsp.ImageUrl = "/img/icon/icon_female.png";
                        imgsp.ToolTip = "female";
                        break;
                    case "1":
                        imgsp.ImageUrl = "/img/icon/icon_male.png";
                        imgsp.ToolTip = "male";
                        break;
                    default:
                        imgsp.ImageUrl = "/img/icon/icon_unknownGender.png";
                        imgsp.ToolTip = "unKnown";
                        break;
                }



                HiddenField hdnsp_Status = (HiddenField)item.FindControl("hdn_Status");
                string sp_Status = hdnsp_Status.Value.ToString();
                TextBox text_Status = (TextBox)item.FindControl("Statusbtn");
                switch (sp_Status)
                {
                    case "0":
                        text_Status.Text = "Dead";
                        text_Status.ToolTip = "dead";
                        break;
                    case "1":
                        text_Status.Text = "Alive";
                        text_Status.ToolTip = "alive";
                        break;

                }
            }
        }

        protected void RG_IndividualHistory_DetailTableDataBind(object source, Telerik.Web.UI.GridDetailTableDataBindEventArgs e)
        {
            GridDataItem dataItem = e.DetailTableView.ParentItem;

            string PhenotypeSID = dataItem.GetDataKeyValue("PhenotypeSID").ToString();
            e.DetailTableView.DataSource = GetDataTable("exec Sp_Individual_History_Sel_ID " + PhenotypeSID);


        }


        public DataTable GetDataTable(string query)
        {
            SqlConnection connection1 = new SqlConnection(CnnStr);
            SqlDataAdapter adapter1 = new SqlDataAdapter();
            adapter1.SelectCommand = new SqlCommand(query, connection1);
            DataTable table1 = new DataTable();
            connection1.Open();
            try
            {
                adapter1.Fill(table1);
            }
            finally
            {
                connection1.Close();
            }
            return table1;
        }
    }
}