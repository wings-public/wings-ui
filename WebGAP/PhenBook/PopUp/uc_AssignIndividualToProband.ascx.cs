using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.PhenBook.PopUp
{
    public partial class uc_AssignIndividualToProband : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridFilterMenu menu = RG_Individuals.FilterMenu;
            int i = 0;
            while (i < menu.Items.Count)
            {
                if (menu.Items[i].Text == "NoFilter" || menu.Items[i].Text == "Contains" )
                {
                    i++;
                }
                else
                {
                    menu.Items.RemoveAt(i);
                }
            }
        }

        protected void RG_Individuals_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem && !IsPostBack)
            {
                GridDataItem item = (GridDataItem)e.Item;
                if (item.OwnerTableView.Name.Equals("Master"))
                {

                    string IndividualID = item.GetDataKeyValue("IndividualID").ToString();
              
                    string individual = Session["FamilyMember_OR_Proband"].ToString();
                    string Gender = item.GetDataKeyValue("IndividualSex").ToString();
                    string IndividualFName = item.GetDataKeyValue("IndividualFName").ToString();
                    string IndividualLName = item.GetDataKeyValue("IndividualLName").ToString();
                    string IndividualBirthDate = item.GetDataKeyValue("IndividualBirthDate").ToString();
                    string IndividualStatus = item.GetDataKeyValue("IndividualStatus").ToString();
                    string[] BD_Date = IndividualBirthDate.Split(new char[0]);
                    ImageButton img = (ImageButton)item.FindControl("AddIndividual");

                    if (Gender.Length == 0)
                        Gender = "2";
                    if (IndividualStatus.Length == 0)
                        IndividualStatus = "2";

                    img.Attributes.Add("onclick", "returnToParent(" + IndividualID + "," + Gender + "," + individual + ",'" + IndividualFName + "','" + IndividualLName + "','" + BD_Date[0] + "'," + IndividualStatus + "); return false;");


                }
            }
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;

                HiddenField hdnsp = (HiddenField)item.FindControl("hdn_Gender");
                string sp = hdnsp.Value.ToString();
                ImageButton imgsp = (ImageButton)item.FindControl("Genderbtn");
                switch (sp)
                {
                    case "0":
                        imgsp.ImageUrl = "/img/icon/icon_female.png";
                        imgsp.ToolTip = "Female";


                        break;
                    case "1":
                        imgsp.ImageUrl = "/img/icon/icon_male.png";
                        imgsp.ToolTip = "Male";
                        break;
                    default:
                        imgsp.ImageUrl = "/img/icon/icon_unknown.png";
                        imgsp.ToolTip = "UnKnown";
                        break;
                }

                HiddenField hdnsp_Status = (HiddenField)item.FindControl("hdn_Status");
                string sp_Status = hdnsp_Status.Value.ToString();
                ImageButton imgStatus = (ImageButton)item.FindControl("Statusbtn");
                switch (sp_Status)
                {
                    case "0":
                        imgStatus.ImageUrl = "/img/icon/icon_dead.png";
                        imgStatus.ToolTip = "Dead";
                        break;
                    case "1":
                        imgStatus.ImageUrl = "/img/icon/icon_alive.png";
                        imgStatus.ToolTip = "Alive";
                        break;
                    default:
                        imgStatus.ImageUrl = "/img/icon/icon_unknown.png";
                        imgStatus.ToolTip = "UnKnown";
                        break;

                }

            }

        }

        protected void RG_Individuals_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("RowClick"))
            {
                GridDataItem item = (GridDataItem)e.Item;
                string IndividualID = item.GetDataKeyValue("IndividualID").ToString();
        
                string individual = Session["FamilyMember_OR_Proband"].ToString();
                string Gender = item.GetDataKeyValue("IndividualSex").ToString();
                string IndividualFName = item.GetDataKeyValue("IndividualFName").ToString();
                string IndividualLName = item.GetDataKeyValue("IndividualLName").ToString();
                string IndividualBirthDate = item.GetDataKeyValue("IndividualBirthDate").ToString();
                string IndividualStatus = item.GetDataKeyValue("IndividualStatus").ToString();
                // string[] BD_Date = IndividualBirthDate.Split(new char[0]);
                //  ImageButton img = (ImageButton)item.FindControl("AddIndividual");
                if (Gender.Length == 0)
                    Gender = "2";
                if (IndividualStatus.Length == 0)
                    IndividualStatus = "2";
                string message = "returnToParent(" + IndividualID + "," + Gender + "," + individual + ",'" + IndividualFName + "','" + IndividualLName + "','" + IndividualBirthDate + "'," + IndividualStatus + "); ";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", message, true);
               
            }
        }
    }
}