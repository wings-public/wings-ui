﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebGAP
{
    public partial class Simple : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Context.User.Identity.IsAuthenticated)
            //{
            //    Session.Clear();
            //    Response.Redirect("~/Account/Login.aspx");
            //}
        }
    }
}