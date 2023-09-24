namespace WebGAP.GAP.Rep
{
    using System;
    using System.Data;
    using System.Data.SqlClient;
    using Telerik.Reporting;
  

    public partial class ClinicalReport_Print_Telerik : System.Web.UI.Page
    {

        #region "CnnStr"{
        string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                reportViewer1.ReportSource.Parameters[0].Value = Session["Curr_ReportID"].ToString();
                reportViewer1.ReportSource.Parameters[1].Value = Session["Curr_Report_Version"].ToString();

            }
        }

    }
}