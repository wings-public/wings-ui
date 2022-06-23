using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebGAP.Admin.uc
{
    public partial class uc_FilterOperation : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RG_FilterOpr_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Delete"))
            {
                string deleteCommand = "Sp_Filter_Opr_Del";
                DS_FilterOpr.DeleteCommand = deleteCommand;
            }
        }
    }
}