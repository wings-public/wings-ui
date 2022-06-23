using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.GAP.uc
{
    public partial class uc_Results : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Page_Init(object sender, System.EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                string reqtype = Session["ReqType"].ToString();
                RadTab tab = new RadTab();

                switch (reqtype)
                {
                    case "1":
                        tab.Text = Session["GapReqId"].ToString();
                        break;
                }

                RadTabStrip1.Tabs.Add(tab);
                AddPageView(RadTabStrip1.Tabs[0]);

            }

        }


        protected void RadMultiPage1_PageViewCreated(object sender, RadMultiPageEventArgs e)
        {
            string reqtype = Session["ReqType"].ToString();

            string userControlName = "uc/uc_Res_Req_"+reqtype + ".ascx"   ;

            Control userControl = Page.LoadControl(userControlName);
            userControl.ID = e.PageView.ID + "_userControl";

            e.PageView.Controls.Add(userControl);
        }

        private void AddPageView(RadTab tab)
        {
            RadPageView pageView = new RadPageView();
            pageView.ID = tab.Text;
            pageView.CssClass = "contentWrapper0";
            RadMultiPage1.PageViews.Add(pageView);
            tab.PageViewID = pageView.ID;

        }


    }
}