using System;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.GAP.Popup
{
    public partial class uc_Sanger : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AnalysisType"].Equals("1"))
            {
                Index.Attributes.Add("Class", "col-md-6");
                control1.Attributes.Add("Class", "col-md-6");
                control2.Style.Add("display", "none");
                peakCanvas3.Style.Add("display", "none");
            }
            else
            { 
               Index.Attributes.Add("Class", "col-md-4");
               control1.Attributes.Add("Class", "col-md-4");
               control2.Attributes.Add("Class", "col-md-4");
            }
        }
        protected void save_sanger_Click(object sender, EventArgs e)
        {
            

            string Path = "\\Upload\\Sanger";
            string filepath = Server.MapPath(Path) + "\\" + Session["SampleID_Filter"].ToString() + "_chr" + Session["CHR_MutationDetail"].ToString() +
                    "_" + Session["START_MutationDetail"].ToString() + "_" + Session["END_MutationDetail"].ToString() + "_Indexa.png";

            HiddenField Pedigree_base64 = (HiddenField)FindControl("sanger_base64");
            string base64 = Pedigree_base64.Value;
            String substring = base64.Substring(22, base64.Length - 22);

            var bytess = Convert.FromBase64String(substring);
            using (var imageFile = new FileStream(filepath, FileMode.Create))
            {
                string vritual_Path = Server.MapPath("/Upload/Sanger/" + Session["SampleID_Filter"].ToString() +"_chr"+ Session["CHR_MutationDetail"].ToString() +
                    "_" + Session["START_MutationDetail"].ToString() + "_" + Session["END_MutationDetail"].ToString() + "_Indexa.png");
                //   if (File.Exists(vritual_Path))
                //        File.Delete(vritual_Path);
                imageFile.Write(bytess, 0, bytess.Length);
                imageFile.Flush();
            }
        }

  
    }
}