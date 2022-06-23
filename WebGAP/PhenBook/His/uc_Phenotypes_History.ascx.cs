using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;


namespace WebGAP.PhenBook.His
{
    public partial class uc_Phenotypes_History : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void RG_Phenotypes_History_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {

                GridDataItem dataItem = e.Item as GridDataItem;

                GridDataItem item = (GridDataItem)e.Item;

                HiddenField hdnsp = (HiddenField)item.FindControl("hdn_Status");
                string sp = hdnsp.Value.ToString();
                ImageButton imgsp = (ImageButton)item.FindControl("Statusbtn");
                switch (sp)
                {
                    case "0":
                        imgsp.ImageUrl = "/img/icon/icon_test_NO_selected.png";
                        imgsp.ToolTip = "Yes";
                        break;
                    case "1":
                        imgsp.ImageUrl = "/img/icon/icon_test_YES_selected.png";
                        imgsp.ToolTip = "No";
                        break;
                    default:
                        imgsp.ImageUrl = "/img/icon/icon_test_NA_selected.png";
                        imgsp.ToolTip = "Not applicable";
                        break;
                }

                HiddenField hdn_Severity = (HiddenField)item.FindControl("hdn_Severity");
                string Severity = hdn_Severity.Value.ToString();
                Label lbl_Severity = (Label)item.FindControl("lbl_severity");
                switch (sp)
                {
                    case "0":
                        lbl_Severity.Text = "Mild";
                        break;
                    case "1":
                        lbl_Severity.Text = "Moderate";
                        break;
                    case "2":
                        lbl_Severity.Text = "Severe";
                        break;

                }

                if (item["Operation"].Text.Equals("Delete"))
                {

                    string hex_bg = "#ffe9e9";
                    string hex_fg = "#ff8c8c";
                    //   Color _color = System.Drawing.ColorTranslator.FromHtml(hex);

                     item.BackColor = ColorTranslator.FromHtml(hex_bg);
                 //   item.ForeColor = ColorTranslator.FromHtml(hex_fg);

                }
                else
                {
                    string hex_bg = "#f0fff0";
                    string hex_fg = "#51bf51";
                  //  item.ForeColor = ColorTranslator.FromHtml(hex_fg);
                    item.BackColor = ColorTranslator.FromHtml(hex_bg);


                }



            }
        }

      

        
    }
}