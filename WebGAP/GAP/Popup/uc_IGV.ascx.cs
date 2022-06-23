using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebGAP.GAP.Popup
{
    public partial class uc_IGV : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["AnalysisType"].Equals("0"))
            {

                Sample1.Value = Session["SampleID_Filter"].ToString();
                Sample2.Value = "0";
            }
            if (Session["AnalysisType"].Equals("1"))
            {
                Sample1.Value = Session["CS_MaleID"].ToString();
                Sample2.Value = Session["CS_FemaleID"].ToString();
            }
        }

    }
}