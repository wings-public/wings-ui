using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using WebGAP.GAP.Model;


namespace WebGAP.GAP.uc
{
    public partial class uc_VariantDiscovery : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}

        protected void Page_Load(object sender, EventArgs e)
        {
            //*************************
            //Write list of centers and host into centerList.txt file to get access on it from SampleResult page.
            List<CenterList> _centerList = new List<CenterList>();


            SqlCommand cmd = new SqlCommand("Sp_GAP_VariantDiscovery_Center_Hosts_Sel", new SqlConnection(CnnStr));
            cmd.CommandType = CommandType.StoredProcedure;
           
            SqlDataAdapter SqlDataAdptr = new SqlDataAdapter();
            SqlDataAdptr.SelectCommand = cmd;

                cmd.Connection.Open();
                DataTable myDataTable = new DataTable();
                SqlDataAdptr.Fill(myDataTable);

                if (myDataTable.Rows.Count > 0)
                {
                    Session["NumberOfCentersAndHosts"] = myDataTable.Rows.Count;

                    for (int i = 0; i < myDataTable.Rows.Count; i++)
                    {
                        _centerList.Add(new CenterList()
                        {
                            HostId = Convert.ToInt32(myDataTable.Rows[i]["HostID"]),
                            CenterId = Convert.ToInt32(myDataTable.Rows[i]["CenterID"]),
                            IpCenter = myDataTable.Rows[i]["IPCenter"].ToString()
                        });
                    }
                }

            string Path = @"~\Upload";
            using (System.IO.StreamWriter file = File.CreateText(Server.MapPath(Path) + @"\centerList.json"))
            {
                JsonSerializer serializer = new JsonSerializer();
                serializer.Serialize(file, _centerList);
            }
        }

        protected void btn_VariantDis_Region_GoToFilter_Click(object sender, EventArgs e)
        {
            
            Session["VariantDis_TotalCount"] = Hdn_TotalCount.Value.ToString(); //103890; 
            Session["VariantDis_KeyForQuery"] = "\"region\":";
            Session["VariantDis_ValueForQuery"] = "\"" + Hdn_Region.Value.ToString() + "\"";

            Session["VariantDis_RefBuild"] = DDL_RefBuild.SelectedValue;
            Session["VariantDis_SeqType"] = DDL_Assay.SelectedValue;
            Response.Redirect(String.Format("/GAP/VariantQuery.aspx"));
        }

        protected void btn_VariantDis_Gene_GoToFilter_Click1(object sender, EventArgs e)
        {
            Session["VariantDis_TotalCount"] = Hdn_TotalCount.Value.ToString();
            Session["VariantDis_KeyForQuery"] = "\"geneID\":";
            Session["VariantDis_ValueForQuery"] = "[\"" + Hdn_Gene.Value.ToString() + "\"]"; // ["84808"]

            Session["VariantDis_RefBuild"] = DDL_RefBuild.SelectedValue;
            Session["VariantDis_SeqType"] = DDL_Assay.SelectedValue;
            Response.Redirect(String.Format("/GAP/VariantQuery.aspx"));

        }
    }
}