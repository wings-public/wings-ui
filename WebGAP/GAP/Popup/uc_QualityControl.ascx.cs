using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebGAP.GAP.Popup
{
    public partial class uc_QualityControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            header.Text = "Sample " + Session["SampleIDQuality_FASTQC"].ToString();
        }
    }
}