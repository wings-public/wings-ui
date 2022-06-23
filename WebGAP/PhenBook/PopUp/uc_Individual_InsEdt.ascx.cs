using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.PhenBook.PopUp
{
    public partial class uc_Individual_InsEdt : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        private object _dataItem = null;


        public object DataItem
        {
            get { return this._dataItem; }
            set { this._dataItem = value; }
        }

       
       
    }
}