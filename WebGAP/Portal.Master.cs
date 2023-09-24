using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP
{
    public partial class Portal : System.Web.UI.MasterPage
    {
       



        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}

        protected void Page_Init(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated)
            {

                lbl_userfname.Text = GetFullName();
                if (GetValidURL())
                CreateMenu();
                else
                Response.Redirect("~/Main.aspx");
            }
            else
            {
                // No valid login...
                Session.Clear();
                Response.Redirect("~/Account/Login.aspx");
            }


}

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                String connstring = CnnStr;
                SqlConnection conn = new SqlConnection(connstring);
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlCommand cmd = new SqlCommand("Sp_SingleUser_Sel", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Id", SqlDbType.NVarChar, 128);
                cmd.Parameters["@Id"].Value = Context.User.Identity.GetUserId();

                SqlDataAdptrCmd.SelectCommand = cmd;

                DataTable myDataTable = new DataTable();

                conn.Open();
                try
                {
                    SqlDataAdptrCmd.Fill(myDataTable);

                    if (!string.IsNullOrEmpty(myDataTable.Rows[0]["UserPhoto"].ToString()))
                    {
                        RBImg_userProfile.ImageUrl = "";
                        RBImg_userProfile.DataValue = (byte[])myDataTable.Rows[0]["UserPhoto"];
                    }
                    else
                        RBImg_userProfile.ImageUrl = "~/img/defaultAvatar.png";


                    // ---------------------Check the valid token
                    // ---------------------Check the valid token

                    if (hfield_loggingStat.Value != "loggingOut")

                    {

                        if ((Context.User.Identity.IsAuthenticated) && (Session["ValidT"] == null || Session["ValidT"].ToString() != "NoAPI"))

                        {

                            hfield_loggingStat.Value = "LoggedIn";




                            string uid = Session["WiNGSMasterId"].ToString();

                            string centid = Session["WiNGSCenterID"].ToString();

                            string currcentid = ((Session["Current_CenterID"] != null) ? Session["Current_CenterID"].ToString() : null);




                            var validTokens = new List<string>();

                            if (Session["WiNGSApplication"].Equals("01"))
                                Session["Current_Host"] = (Session["Current_Host"] != null) ? Session["Current_Host"].ToString() : "3";
                            else if (Session["WiNGSApplication"].Equals("10"))
                                Session["Current_Host"] = (Session["Current_Host"] != null) ? Session["Current_Host"].ToString() : "1";
                            else
                                Session["Current_Host"] = (Session["Current_Host"] != null) ? Session["Current_Host"].ToString() : "0";


                            validTokens = CheckToken.CheckValidity(2, Session["WiNGSMasterId"].ToString(),

                                                                            Session["WiNGSCenterID"].ToString(),

                                                                            (Session["Current_CenterID"] != null) ? Session["Current_CenterID"].ToString() : null,

                                                                            Session["Current_Host"].ToString());

                            Session["ValidT"] = validTokens[0];

                            foreach (var tkn in validTokens)

                            {

                                if (tkn == "revoked" || tkn == "Exp")

                                {

                                    Response.Redirect("~/Account/Login");

                                }

                                else if (tkn == "Err")

                                {

                                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"radalert('<br /><b>Something goes wrong!</b><br />');", true);

                                    Response.Redirect("~/Account/Login");




                                }

                            }




                        }
                    }

                }
                finally
                {
                    conn.Close();
                }
            }
        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            var validTokens = new List<string>();


            Session["Current_Host"] = (Session["Current_Host"] != null) ? Session["Current_Host"].ToString() : "1";
            
            if (Session["SelectedApp"] != null || !String.IsNullOrWhiteSpace(Session["SelectedApp"].ToString()))
                Session["SelectedApp"] = null;

            
            validTokens = CheckToken.CheckValidity(0, Session["WiNGSMasterId"].ToString(),

                                       Session["WiNGSCenterID"].ToString(),

                                       (Session["Current_CenterID"] != null) ? Session["Current_CenterID"].ToString() : null,

                                       Session["Current_Host"].ToString());

            Session["ValidT"] = null;
            Session["Current_CenterID"] = null;
            Session["Current_Host"] = null;
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            Session.Clear();
            Session.Clear();
            Response.Redirect("~/Account/Login.aspx");

        }

        public string GetFullName()
        {
            string query = "select UserFullName,UserID,PIID,UserType,CenterID,[Application] from AspNetUsers where username ='" + Context.User.Identity.GetUserName() + "'";
            SqlConnection conn = new SqlConnection(CnnStr);
            SqlCommand cmd = new SqlCommand(query, conn);

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            try
            {
                while (reader.Read())
                {
                    Session["WiNGSMasterId"] = reader["UserID"].ToString();
                    Session["WiNGSPIId"] = reader["PIID"].ToString();
                    Session["WiNGSUserType"] = reader["UserType"].ToString();
                    Session["WiNGSCenterID"] = reader["CenterID"].ToString();
                    Session["WiNGSUserfName"] = reader["UserFullName"].ToString();
                    Session["WiNGSApplication"] = reader["Application"].ToString();
                  
                    
                    return Session["WiNGSUserfName"].ToString();
                }

                
            }
            catch (Exception ex)
            {
                HttpContext.Current.Session["Error_Message_Session"] = ex;
                HttpContext.Current.Response.Redirect("Error.aspx", false);
            }
            finally
            {
                conn.Close();
            }

            return "-";
        }


        private HtmlGenericControl UList(string id, string cssClass) // For <ul> tag

        {
            HtmlGenericControl ul = new HtmlGenericControl("ul");
            ul.ID = id;
            ul.Attributes.Add("class", cssClass);
            ul.Attributes.Add("data-menu", "menu-navigation");

            return ul;

        }

        public Boolean GetValidURL()
        {
            string fullUrl = Request.Url.ToString();
            string lastPart = fullUrl.Split('/').Last();
            if (!lastPart.Equals("Main"))
            {
                List<int> lst_validUType = new List<int>();

                SqlConnection conn = new SqlConnection(CnnStr);


                SqlConnection cnn = new SqlConnection(CnnStr);
                SqlCommand cmd = new SqlCommand("Sp_ValidURL", cnn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
                SqlParameterCollection SqlParCol = default(SqlParameterCollection);
                SqlDataAdptrCmd.SelectCommand = cmd;
                SqlParCol = cmd.Parameters;

                SqlParCol.Add(new SqlParameter("@URL", SqlDbType.NVarChar, 50));
                SqlParCol["@URL"].Value = lastPart;

                DataTable myDataTable = new DataTable();
                conn.Open();
                try
                {
                    SqlDataAdptrCmd.Fill(myDataTable);

                    foreach (DataRow row in myDataTable.Rows)
                    {
                        lst_validUType.Add(Convert.ToInt32(row["UT_ID"].ToString()));
                    }

                    if (lst_validUType.Contains(Convert.ToInt32(Session["WiNGSUserType"].ToString())))
                        return true;
                    else
                        return false;
                }
                catch (Exception ex)
                {
                    //HttpContext.Current.Session["Error_Message_Session"] = ex;
                    //HttpContext.Current.Response.Redirect("Error.aspx", false);
                }
                finally
                {
                    conn.Close();
                }
                return false;
            }
            else
                return true;
        }

        public void CreateMenu()
        {
            string UserID = Session["WiNGSMasterId"].ToString();
            string App = (Session["SelectedApp"] != null) ? Session["SelectedApp"].ToString() : ((Session["WiNGSApplication"].ToString().Equals("11")) ? "10": Session["WiNGSApplication"].ToString());
            Session["PortalSelectedApp"] = App;

            SqlConnection conn = new SqlConnection(CnnStr);
            string query = "Sp_Sys_Web_Menu_Sel " + UserID + ", '"+App+"' ";

            SqlDataAdapter adapter1 = new SqlDataAdapter();
            adapter1.SelectCommand = new SqlCommand(query, conn);
            DataTable myDataTable = new DataTable();
            conn.Open();
            try
            {
                adapter1.Fill(myDataTable);
            }
            finally
            {
                conn.Close();
            }

            string sysmenu = "";

            foreach (DataRow row in myDataTable.Rows)
            {

                HtmlGenericControl newLi = new HtmlGenericControl("li");
                HtmlGenericControl newSp = new HtmlGenericControl("span");
                HtmlGenericControl newi = new HtmlGenericControl("i");
                HtmlGenericControl newa = new HtmlGenericControl("a");
                if (!row["SystemDesc"].ToString().Trim().Equals(sysmenu))
                {
                    newLi.Attributes.Add("class", "navigation-header");

                    newSp.Attributes.Add("data-i18n", "nav.category.layouts");
                    newSp.InnerText = row["SystemDesc"].ToString().Trim();

                    newi.Attributes.Add("data-toggle", "tooltip");
                    newi.Attributes.Add("class", "ft-more-horizontal ft-minus");
                    newi.Attributes.Add("data-placement", "right");


                    newi.Attributes.Add("data-original-title", "Layouts");
                    //newi.Attributes.Add("class", "icon-ellipsis icon-ellipsis");

                    newLi.Controls.Add(newSp);
                    newLi.Controls.Add(newi);


                    this.mainmenunavigation.Controls.Add(newLi);

                    sysmenu = row["SystemDesc"].ToString().Trim();
                    /////////////////////////

                    string MenuePID = row["MenuePID"].ToString();

                    switch (MenuePID)
                    {
                        case "":
                            {
                                int Rindex = myDataTable.Rows.IndexOf(row);
                                Prnt_menuItem(row["MenuLink"].ToString(), row["Icon"].ToString(), row["MenuDesc"].ToString());
                            }
                            break;
                        case "0":
                            {
                                int Rindex = myDataTable.Rows.IndexOf(row);
                                Chld_menuItem(row["MenuLink"].ToString(), row["Icon"].ToString(), row["MenuDesc"].ToString(), row["MenuID"].ToString(), myDataTable);
                            }
                            break;
                        default:

                            break;
                    }


                }
                else
                {


                    string MenuePID = row["MenuePID"].ToString();

                    switch (MenuePID)
                    {
                        case "":
                            {
                                int Rindex = myDataTable.Rows.IndexOf(row);
                                Prnt_menuItem(row["MenuLink"].ToString(), row["Icon"].ToString(), row["MenuDesc"].ToString());
                            }
                            break;
                        case "0":
                            {
                                int Rindex = myDataTable.Rows.IndexOf(row);
                                Chld_menuItem(row["MenuLink"].ToString(), row["Icon"].ToString(), row["MenuDesc"].ToString(), row["MenuID"].ToString(), myDataTable);
                            }
                            break;
                        default:

                            break;
                    }
                }

            }

        }

        public void Chld_menuItem(string link, string icon, string description, string menuID, DataTable data)
        {
            HtmlGenericControl __newLi = new HtmlGenericControl("li");
            HtmlGenericControl __newSp = new HtmlGenericControl("span");
            HtmlGenericControl __newi = new HtmlGenericControl("i");
            HtmlGenericControl __newa = new HtmlGenericControl("a");
            HtmlGenericControl newUl = new HtmlGenericControl("ul");


            //__newLi.Attributes.Add("class", "nav-item");


            //LinkButton lnk = new LinkButton();

            //lnk.Text = description;
            //lnk.ID = "lnkb_chld_" + description.Replace(" ", "").ToString().Trim();
            //lnk.Click += delegate (object sender, EventArgs e)
            //{
            //    this.OnSelect(this, e, link);
            //};

            //__newLi.Controls.Add(lnk);

            //this.mainmenunavigation.Controls.Add(__newLi);

            //RadAjaxManager1.AjaxSettings.AddAjaxSetting(lnk, ContentPlaceHolder1, RadAjaxLoadingPanel1);


            __newLi.Attributes.Add("class", "nav-item");
            __newa.Attributes.Add("href", link);
           

            __newi.Attributes.Add("class", icon);
            __newSp.Attributes.Add("data-i18n", "nav.add_on_block_ui.main");
            __newSp.Attributes.Add("class", "menu-title");
            __newSp.InnerText = description;
            __newa.Controls.Add(__newi);
            __newa.Controls.Add(__newSp);

            __newLi.Controls.Add(__newa);

            mainmenunavigation.Controls.Add(__newLi);


            string expression;
            expression = "MenuePID =" + menuID;
            DataRow[] foundRows;

            foundRows = data.Select(expression);

            for (int i = 0; i < foundRows.Length; i++)
            {
                HtmlGenericControl _newLi = new HtmlGenericControl("li");
                HtmlGenericControl _newSp = new HtmlGenericControl("span");
                HtmlGenericControl _newi = new HtmlGenericControl("i");
                HtmlGenericControl _newa = new HtmlGenericControl("a");
                //string _hrf = foundRows[i]["MenuLink"].ToString();
                //expression = foundRows[i]["MenuLink"].ToString();
                //_newLi.Attributes.Add("class", "nav-item");

                //LinkButton _lnk = new LinkButton();

                //_lnk.Text = foundRows[i]["MenuDesc"].ToString();

                //_lnk.ID = "lnkb_chld_sub_" + foundRows[i]["MenuDesc"].ToString().Replace(" ", "").Trim();

                //_lnk.Click += delegate (object sender, EventArgs e)
                //{
                //    OnSelect(this, e, _hrf);
                //};

                //_newLi.Controls.Add(_lnk);
                //newUl.Controls.Add(_newLi);
                //__newLi.Controls.Add(newUl);

                //this.mainmenunavigation.Controls.Add(__newLi);

                //RadAjaxManager1.AjaxSettings.AddAjaxSetting(_lnk, ContentPlaceHolder1, RadAjaxLoadingPanel1);



                _newLi.Attributes.Add("class", "nav-item");
                _newa.Attributes.Add("href", foundRows[i]["MenuLink"].ToString());
                _newa.Attributes.Add("class", "menu-item");
                _newi.Attributes.Add("class", foundRows[i]["Icon"].ToString());
                _newSp.Attributes.Add("data-i18n", "nav.add_on_block_ui.main");
                _newSp.Attributes.Add("data-i18n", "menu-title");
                _newSp.Attributes.Add("class", "menu-title");
                _newSp.InnerText = foundRows[i]["MenuDesc"].ToString();
                _newa.Controls.Add(_newi);
                _newa.Controls.Add(_newSp);
                _newLi.Controls.Add(_newa);
                newUl.Controls.Add(_newLi);
                __newLi.Controls.Add(newUl);
                mainmenunavigation.Controls.Add(__newLi);

            }

        }

        public void Prnt_menuItem(string link, string icon, string description)
        {
            HtmlGenericControl __newLi = new HtmlGenericControl("li");
            HtmlGenericControl __newSp = new HtmlGenericControl("span");
            HtmlGenericControl __newi = new HtmlGenericControl("i");
       
            HtmlGenericControl __newa = new HtmlGenericControl("a");

            //__newLi.Attributes.Add("class", "nav-item");


            //LinkButton lnk = new LinkButton();




            //lnk.Text = description;

            //lnk.ID = "lnkb_Prnt_" + description.Replace(" ", "").ToString().Trim();
            //lnk.Click += delegate (object sender, EventArgs e)
            //{
            //    this.OnSelect(this, e, link);
            //};

            //__newLi.Controls.Add(lnk);

            //this.mainmenunavigation.Controls.Add(__newLi);

            //RadAjaxManager1.AjaxSettings.AddAjaxSetting(lnk, ContentPlaceHolder1, RadAjaxLoadingPanel1);


            __newLi.Attributes.Add("class", "nav-item");
            // __newa.Attributes.Add("onclick", "OnSelect('" + link + "');");
            __newa.Attributes.Add("href", link);
            //__newa.Attributes.Add("OnClick", "linkButton_Handle");
            __newi.Attributes.Add("class", icon);
            __newSp.Attributes.Add("data-i18n", "nav.add_on_block_ui.main");
            __newSp.Attributes.Add("class", "menu-title");
            __newSp.InnerText = description;
            __newa.Controls.Add(__newi);
            //__newLbtn.InnerText = description;
            //__newLbtn.Controls.Add(__newi);
            __newa.Controls.Add(__newSp);
            //__newLi.Controls.Add(__newLbtn);
            __newLi.Controls.Add(__newa);
            mainmenunavigation.Controls.Add(__newLi);
        }

        protected void loggingOutBtn_Click(object sender, EventArgs e)
        {
            var validTokens = new List<string>();



            Session["Current_Host"] = (Session["Current_Host"] != null) ? Session["Current_Host"].ToString() : "1";

            validTokens = CheckToken.CheckValidity(0, Session["WiNGSMasterId"].ToString(),

                                       Session["WiNGSCenterID"].ToString(),

                                       (Session["Current_CenterID"] != null) ? Session["Current_CenterID"].ToString() : null,

                                       Session["Current_Host"].ToString());

            Session["ValidT"] = null;
            Session["Current_CenterID"] = null;
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            //SessionSession.Clear();
            Session.Clear();
            Response.Redirect("~/Account/Login.aspx");
        }
    }
}


