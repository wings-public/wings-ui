using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebGAP.PhenBook.PopUp
{
    public partial class uc_AddFamilyMembers : System.Web.UI.UserControl
    {
        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion} 

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btn_AddFamilyMember_Click(object sender, EventArgs e)
        {

          
        }
    }
}