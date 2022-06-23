using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;


namespace WebGAP.Admin.uc
{
    public partial class uc_SampleSheetScanLog : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}  
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbl_CenterPI.Text = Session["Current_Center"].ToString() + ", " + Session["Current_PI"].ToString();
            }
       }

   


        protected void RG_SampleSheetLOG_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "Detaillog")
            {

                if (e.Item is GridDataItem)
                {
                    GridDataItem item = (GridDataItem)e.Item;

                    string IndividualID = item.GetDataKeyValue("LogID").ToString();

                    Session["logID"] = IndividualID; 
                    string message = "OpenLog();";

                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
                }
            }

    
            
        }
    }
}