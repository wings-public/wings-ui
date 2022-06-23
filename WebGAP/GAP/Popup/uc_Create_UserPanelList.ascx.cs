using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.GAP.uc
{
    public partial class uc_Create_UserPanelList : System.Web.UI.UserControl
    {
        private const int ItemsPerRequest = 10;

        #region "CnnStr"{
        static string CnnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        #endregion}

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Opt_TrG_Chr_BChr.Checked)
                RC_TraG_ChrBand.Enabled = true;
            else
            {
                RC_TraG_ChrBand.Enabled = false;
                RC_TraG_ChrBand.Text = "";
                RC_TraG_ChrBand.ClearSelection();
            }

        }

        protected void Btn_Add_TrainingGene_ChrCoordinates_Click(object sender, EventArgs e)
        {
            TrainingGeneColectedItem_Add_Remove();

            List<ListCVhoosenGene> myList = new List<ListCVhoosenGene>();
            List<ListCVhoosenGene> ResList = new List<ListCVhoosenGene>();

            ResList = GetTrainingGene_FromChromosomalCoItems();

            if (ResList.Count > 0)
            {
                for (int i = 0; i < ResList.Count; i++)
                {
                    RadListBoxItem test_old = new RadListBoxItem(ResList[i].RefID + "," + ResList[i].Alia, ResList[i].RefID + "," + ResList[i].Alia);
                    Radlisbox_Sample_TrainingGene.ItemTemplate.InstantiateIn(test_old);
                    Label lblref = (Label)test_old.FindControl("lbl_Sel_TrainingGene_RefID");
                    Label lblalias = (Label)test_old.FindControl("lbl_Sel_TrainingGene_Alias");
                    Label lbldesc = (Label)test_old.FindControl("lbl_Sel_TrainingGene_Desc");

                    lblref.Text = ResList[i].RefID.ToString();
                    lblalias.Text = ResList[i].Alia.ToString();
                    lbldesc.Text = ResList[i].desc.ToString();
                    RLB_TrainingGenes.Items.Add(test_old);
                }
            }

            TrainingGeneColectedItem_Remove_Duplicates();
        }

        public void TrainingGeneColectedItem_Remove_Duplicates()
        {
            List<ListCVhoosenGene> myList = new List<ListCVhoosenGene>();
            List<ListCVhoosenGene> wd_myList = new List<ListCVhoosenGene>();
            if (RLB_TrainingGenes.Items.Count > 0)
            {
                foreach (RadListBoxItem item in RLB_TrainingGenes.Items)
                {
                    string aliasNref_old = item.Value;
                    string[] splitVal = aliasNref_old.Split(',');
                    string ref_old = "";
                    if (splitVal.Length > 0)
                    {
                        ref_old = splitVal[0].ToString();
                    }
                    //string lblref_old = item.Value;
                    List<ListCVhoosenGene> ResList = new List<ListCVhoosenGene>();
                    ResList = GetTrainingGeneItems(ref_old);
                    if(ResList.Count > 0)
                        myList.Add(new ListCVhoosenGene(ResList[0].RefID, ResList[0].Alia, ResList[0].desc));
                }
            }
            RLB_TrainingGenes.Items.Clear();
            wd_myList = myList.Distinct().ToList();

            if (wd_myList.Count > 0)
            {
                for (int i = 0; i <= wd_myList.Count - 1; i++)
                {
                    RadListBoxItem test_old = new RadListBoxItem(wd_myList[i].RefID, wd_myList[i].RefID + "," + wd_myList[i].Alia);
                    Radlisbox_Sample_TrainingGene.ItemTemplate.InstantiateIn(test_old);
                    Label lblref = (Label)test_old.FindControl("lbl_Sel_TrainingGene_RefID");
                    Label lblalias = (Label)test_old.FindControl("lbl_Sel_TrainingGene_Alias");
                    Label lbldesc = (Label)test_old.FindControl("lbl_Sel_TrainingGene_Desc");
                    lblref.Text = wd_myList[i].RefID;
                    lblalias.Text = wd_myList[i].Alia;
                    lbldesc.Text = wd_myList[i].desc;
                    RLB_TrainingGenes.Items.Add(test_old);
                }
            }

            lbl_Sel_TrainingGene.Text = RLB_TrainingGenes.Items.Count.ToString();
        }

        public List<ListCVhoosenGene> GetTrainingGeneItems(string RefID)
        {
            List<ListCVhoosenGene> ResList = new List<ListCVhoosenGene>();

            DataTable data = GetDataTable("exec Sp_GAP_Filter_UPanel_TargetGene_Item_TrainingGenes_Sel " + Convert.ToInt32(RefID) + "");

            foreach (DataRow row in data.Rows)
            {
                DataColumn column_Ref;
                DataColumn column_Alias;
                DataColumn column_Desc;
                column_Ref = data.Columns[0];
                column_Alias = data.Columns[1];
                column_Desc = data.Columns[2];

                ResList.Add(new ListCVhoosenGene(row[column_Ref].ToString(), row[column_Alias].ToString(), row[column_Desc].ToString()));
            }
            return ResList;
        }


        private void TrainingGeneColectedItem_Add_Remove()
        {

            List<ListCVhoosenGene> myList = new List<ListCVhoosenGene>();
            if (RLB_TrainingGenes.Items.Count > 0)
            {
                foreach (RadListBoxItem item in RLB_TrainingGenes.Items)
                {
                    string aliasNref_old = item.Value;
                    string[] splitVal = aliasNref_old.Split(',');
                    string ref_old = "";
                    if (splitVal.Length > 0)
                    {
                        ref_old = splitVal[0].ToString();
                        //alias_old = splitVal[1].ToString();
                    }

                    //string lblref_old = item.Value;
                    List<ListCVhoosenGene> ResList = new List<ListCVhoosenGene>();
                    ResList = GetTrainingGeneItems(ref_old);
                    myList.Add(new ListCVhoosenGene(ResList[0].RefID, ResList[0].Alia, ResList[0].desc));
                }
            }
            RLB_TrainingGenes.Items.Clear();
            if (myList.Count > 0)
            {
                for (int i = 0; i < myList.Count; i++)
                {
                    RadListBoxItem test_old = new RadListBoxItem(myList[i].RefID, myList[i].RefID + "," + myList[i].Alia);
                    Radlisbox_Sample_TrainingGene.ItemTemplate.InstantiateIn(test_old);
                    Label lblref = (Label)test_old.FindControl("lbl_Sel_TrainingGene_RefID");
                    Label lblalias = (Label)test_old.FindControl("lbl_Sel_TrainingGene_Alias");
                    Label lbldesc = (Label)test_old.FindControl("lbl_Sel_TrainingGene_Desc");
                    lblref.Text = myList[i].RefID;
                    lblalias.Text = myList[i].Alia;
                    lbldesc.Text = myList[i].desc;
                    RLB_TrainingGenes.Items.Add(test_old);
                }
            }
        }

        public List<ListCVhoosenGene> GetTrainingGene_FromChromosomalCoItems()
        {
            List<ListCVhoosenGene> ResList = new List<ListCVhoosenGene>();

            string type = "";
            string Chr = "";
            string Start = "";
            string Endp = "";
            string band = "";

            if (Opt_TrG_Chr_FChr.Checked)
                type = Opt_TrG_Chr_FChr.Value;

            if (Opt_TrG_Chr_CChr.Checked)
                type = Opt_TrG_Chr_CChr.Value;

            if (Opt_TrG_Chr_BChr.Checked)
            {
                type = Opt_TrG_Chr_BChr.Value;
                band = RC_TraG_ChrBand.SelectedValue;
            }

            Chr = CB_Chromosome.Text;
            Start = Txt_TraG_StartPos.Text;
            Endp = Txt_TraG_EndPos.Text;

            DataTable data = GetDataTable("exec Sp_GAP_Filter_UPanel_ChromosomalCoordinates_Sel '" + type + "','" + Chr + "','" + Start + "','" + Endp + "','" + band + "','" + Session["RefBuild"] + "'");


            foreach (DataRow row in data.Rows)
            {
                DataColumn column_Ref;
                DataColumn column_Alias;
                DataColumn column_Desc;
                column_Ref = data.Columns[0];
                column_Alias = data.Columns[1];
                column_Desc = data.Columns[2];

                ResList.Add(new ListCVhoosenGene(row[column_Ref].ToString(), row[column_Alias].ToString(), row[column_Desc].ToString()));
            }
            return ResList;
        }

        public DataTable GetDataTable(string query)
        {
            SqlConnection connection1 = new SqlConnection(CnnStr);
            SqlDataAdapter adapter1 = new SqlDataAdapter();
            adapter1.SelectCommand = new SqlCommand(query, connection1);
            DataTable table1 = new DataTable();
            connection1.Open();
            try
            {
                adapter1.Fill(table1);
            }
            finally
            {
                connection1.Close();
            }
            return table1;
        }

        public struct ListCVhoosenGene
        {
            public string RefID;
            public string Alia;
            public string desc;

            public ListCVhoosenGene(string RefID, string Alia, string desc)
            {
                this.RefID = RefID;
                this.Alia = Alia;
                this.desc = desc;
            }
        }

        protected void RC_TraG_ChrBand_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            string chr = "";

            chr = CB_Chromosome.SelectedItem.Text;

            DataTable data = GetDataTable("exec Sp_GAP_Filter_UPanel_TargetGene_Item_ChrBands_Sel '" + chr + "','" + e.Text + "'");

            int itemOffset = e.NumberOfItems;
            int endOffset = Math.Min(itemOffset + ItemsPerRequest, data.Rows.Count);
            e.EndOfItems = endOffset == data.Rows.Count;

            for (int i = itemOffset; i <= endOffset - 1; i++)
                RC_TraG_ChrBand.Items.Add(new RadComboBoxItem(data.Rows[i]["Bands"].ToString(), data.Rows[i]["Bands"].ToString()));

            e.Message = GetStatusMessage(endOffset, data.Rows.Count);
        }

        private string GetStatusMessage(int offset, int total)
        {
            if (total <= 0)
                return "No matches";
            return String.Format("Items <b>1</b>-<b>{0}</b> out of <b>{1}</b>", offset, total);
        }

        protected void RC_TrainingGene_Gens_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {

            DataTable data = GetDataTable("exec Sp_GAP_Filter_UPanel_Gene_TrainingGenes_Sel '" + e.Text + "'");

            int itemOffset = e.NumberOfItems;
            int endOffset = Math.Min(itemOffset + ItemsPerRequest, data.Rows.Count);
            e.EndOfItems = endOffset == data.Rows.Count;

            for (int i = itemOffset; i <= endOffset - 1; i++)
                RC_TrainingGene_Gens.Items.Add(new RadComboBoxItem(data.Rows[i]["entrez_id"].ToString() , data.Rows[i]["GDesc"].ToString() ));
            e.Message = GetStatusMessage(endOffset, data.Rows.Count);
        }

        protected void Btn_Add_TrainingGene_Gens_Click(object sender, EventArgs e)
        {
            if (RC_TrainingGene_Gens.SelectedValue.Length >= 1)
            {
                TrainingGeneColectedItem_Add_Remove();
                List<ListCVhoosenGene> ResList = new List<ListCVhoosenGene>();

                ResList = GetTrainingGeneItems(RC_TrainingGene_Gens.SelectedValue.ToString());
                if (ResList.Count > 0)
                {
                    for (int i = 0; i < ResList.Count; i++)
                    {
                        RadListBoxItem test_old = new RadListBoxItem(ResList[i].RefID, ResList[i].RefID + "," + ResList[i].Alia);
                        Radlisbox_Sample_TrainingGene.ItemTemplate.InstantiateIn(test_old);
                        Label lblref = (Label)test_old.FindControl("lbl_Sel_TrainingGene_RefID");
                        Label lblalias = (Label)test_old.FindControl("lbl_Sel_TrainingGene_Alias");
                        Label lbldesc = (Label)test_old.FindControl("lbl_Sel_TrainingGene_Desc");
                        lblref.Text = ResList[i].RefID;
                        lblalias.Text = ResList[i].Alia;
                        lbldesc.Text = ResList[i].desc;
                        RLB_TrainingGenes.Items.Add(test_old);
                    }
                }

                TrainingGeneColectedItem_Remove_Duplicates();
            }

        }

        protected void RC_TrainingGen_GOTerms_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            DataTable data = GetDataTable("exec Sp_GAP_Filter_UPanel_TargetGene_Item_GOTerms_Sel '" + e.Text + "'");

            int itemOffset = e.NumberOfItems;
            int endOffset = Math.Min(itemOffset + ItemsPerRequest, data.Rows.Count);
            e.EndOfItems = endOffset == data.Rows.Count;

            for (int i = itemOffset; i <= endOffset - 1; i++)
                RC_TrainingGen_GOTerms.Items.Add(new RadComboBoxItem(data.Rows[i]["godesc"].ToString(), data.Rows[i]["GO_ID"].ToString()));

            e.Message = GetStatusMessage(endOffset, data.Rows.Count);
        }

        protected void Btn_Add_TrainingGene_GOTerm_Click(object sender, EventArgs e)
        {
            if (RC_TrainingGen_GOTerms.SelectedValue.Length > 3)
            {
                TrainingGeneColectedItem_Add_Remove();
                List<ListCVhoosenGene> ResList = new List<ListCVhoosenGene>();

                ResList = GetTrainingGene_FromGOTerms();

                if (ResList.Count > 0)
                {
                    for (int i = 0; i < ResList.Count; i++)
                    {
                        RadListBoxItem test_old = new RadListBoxItem(ResList[i].RefID, ResList[i].RefID + "," + ResList[i].Alia);
                        Radlisbox_Sample_TrainingGene.ItemTemplate.InstantiateIn(test_old);
                        Label lblref = (Label)test_old.FindControl("lbl_Sel_TrainingGene_RefID");
                        Label lblalias = (Label)test_old.FindControl("lbl_Sel_TrainingGene_Alias");
                        Label lbldesc = (Label)test_old.FindControl("lbl_Sel_TrainingGene_Desc");
                        lblref.Text = ResList[i].RefID;
                        lblalias.Text = ResList[i].Alia;
                        lbldesc.Text = ResList[i].desc;
                        RLB_TrainingGenes.Items.Add(test_old);
                    }
                }
                TrainingGeneColectedItem_Remove_Duplicates();
            }

        }

        public List<ListCVhoosenGene> GetTrainingGene_FromGOTerms()
        {
            List<ListCVhoosenGene> ResList = new List<ListCVhoosenGene>();

            string GOt = "";

            GOt = RC_TrainingGen_GOTerms.SelectedValue;

            DataTable data = GetDataTable("exec Sp_GAP_Filter_UPanel_TargetGene_GOTerms_Genes_Sel '" + GOt + "'");

            foreach (DataRow row in data.Rows)
            {
                DataColumn column_Ref;
                DataColumn column_Alias;
                DataColumn column_Desc;
                column_Ref = data.Columns[0];
                column_Alias = data.Columns[1];
                column_Desc = data.Columns[2];

                ResList.Add(new ListCVhoosenGene(row[column_Ref].ToString(), row[column_Alias].ToString(), row[column_Desc].ToString()));
            }
            return ResList;
        }

        protected void RC_TrainingGen_OMIMTerms_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {

            DataTable data = GetDataTable("exec Sp_GAP_Filter_UPanel_TargetGene_Item_OMIMTerms_Sel '" + e.Text + "'");

            int itemOffset = e.NumberOfItems;
            int endOffset = Math.Min(itemOffset + ItemsPerRequest, data.Rows.Count);
            e.EndOfItems = endOffset == data.Rows.Count;

            for (int i = itemOffset; i <= endOffset - 1; i++)
                RC_TrainingGen_OMIMTerms.Items.Add(new RadComboBoxItem(data.Rows[i]["term"].ToString(), data.Rows[i]["omimId"].ToString()));

            e.Message = GetStatusMessage(endOffset, data.Rows.Count);
        }

        protected void Btn_Add_TrainingGen_OMIMTerms_Click(object sender, EventArgs e)
        {
            TrainingGeneColectedItem_Add_Remove();
            List<ListCVhoosenGene> ResList = new List<ListCVhoosenGene>();

            ResList = GetTrainingGene_FromOMIMTerms();

            if (ResList.Count > 0)
            {
                for (int i = 0; i < ResList.Count; i++)
                {
                    RadListBoxItem test_old = new RadListBoxItem(ResList[i].RefID, ResList[i].RefID + "," + ResList[i].Alia);
                    Radlisbox_Sample_TrainingGene.ItemTemplate.InstantiateIn(test_old);
                    Label lblref = (Label)test_old.FindControl("lbl_Sel_TrainingGene_RefID");
                    Label lblalias = (Label)test_old.FindControl("lbl_Sel_TrainingGene_Alias");
                    Label lbldesc = (Label)test_old.FindControl("lbl_Sel_TrainingGene_Desc");
                    lblref.Text = ResList[i].RefID;
                    lblalias.Text = ResList[i].Alia;
                    lbldesc.Text = ResList[i].desc;
                    RLB_TrainingGenes.Items.Add(test_old);
                }
            }
            TrainingGeneColectedItem_Remove_Duplicates();
        }

        public List<ListCVhoosenGene> GetTrainingGene_FromOMIMTerms()
        {
            List<ListCVhoosenGene> ResList = new List<ListCVhoosenGene>();

            string OMIMt = "";

            OMIMt = RC_TrainingGen_OMIMTerms.SelectedValue;

            DataTable data = GetDataTable("exec Sp_GAP_Filter_UPanel_TargetGene_OMIMTerms_Genes_Sel '" + OMIMt + "'");

            foreach (DataRow row in data.Rows)
            {
                DataColumn column_Ref;
                DataColumn column_Alias;
                DataColumn column_Desc;
                column_Ref = data.Columns[0];
                column_Alias = data.Columns[1];
                column_Desc = data.Columns[2];

                ResList.Add(new ListCVhoosenGene(row[column_Ref].ToString(), row[column_Alias].ToString(), row[column_Desc].ToString()));
            }
            return ResList;
        }

        protected void Btn_Add_TrainingGen_File_Click(object sender, EventArgs e)
        {
            if (RADUPT1.UploadedFiles.Count > 0)
            {
                lblFileEmpty.Visible = false;
                string FileId;
                FileId = InsertFile(0);
                if (FileId.Length > 0)
                    TransferFiles(FileId, 0);
            }
            else
            {
                lblFileEmpty.Visible = true;
                lblFileEmpty.Text = "You must choose at least one file for each type!";
            }
        }

        public string InsertFile(int FT)
        {
            string FileId = "";
            string ErrMsg;

            SqlConnection conn = new SqlConnection(CnnStr);

            SqlCommand Cmd = new SqlCommand("Sp_GAP_Filter_UPanel_File_Ins", conn);
            Cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlParameterCollection SqlParCol = default(SqlParameterCollection);
            SqlParCol = Cmd.Parameters;

            SqlParCol.Add(new SqlParameter("@filetype", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@FileID", SqlDbType.Int));

            SqlParCol["@FileID"].Direction = ParameterDirection.Output;
            SqlParCol["@filetype"].Value = FT;

            try
            {
                Cmd.Connection.Open();
                Cmd.ExecuteNonQuery();
                FileId = Cmd.Parameters["@FileID"].Value.ToString();
                Cmd.Connection.Close();
            }
            catch (Exception ex)
            {
                ErrMsg = ex.Message.ToString();
                string script = "alert('" + ErrMsg + "')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertscript", script, true);
            }
            return FileId;
        }

        public void TransferFiles(string FileID, int FT)
        {
            string Path = @"~\Upload\UPanel";
            string PathUserLJ = Server.MapPath(Path) + @"\" + FileID;

            if (!Directory.Exists(PathUserLJ))
                Directory.CreateDirectory(PathUserLJ);
            int FileRecord = 0;

            if (FT == 0)
            {
                foreach (UploadedFile f1 in RADUPT1.UploadedFiles)
                {
                    f1.SaveAs(PathUserLJ + @"\" + f1.GetName(), true);
                    DataTable dt = new DataTable();
                    dt.Columns.Add("FileID", typeof(int));
                    dt.Columns.Add("Symbol", typeof(string));

                    //dt.Columns.Add(new DataColumn());
                    //dt.Columns.Add(new DataColumn());
                    //dt.Columns.Add(new DataColumn());
                    string line = null;
                    //int i = 0;
                    // ' File.OpenText("c:\temp\table1.csv")
                    using (StreamReader sr = new StreamReader(PathUserLJ + @"\" + f1.GetName()))
                    {
                        line = sr.ReadLine();
                        while (line != null)
                        {
                            string data = line;
                            if (data.Length > 0)
                            {
                                DataRow row = dt.NewRow();
                                //row[0] = data;
                                //dt.Rows.Add(row);
                                row[0] = FileID;
                                row[1] = data;
                                //row[0] = data;
                                dt.Rows.Add(row);
                            }
                            line = sr.ReadLine();
                        }
                    }

                    using (SqlConnection cn = new SqlConnection(CnnStr))
                    {
                        cn.Open();
                        using (SqlBulkCopy copy = new SqlBulkCopy(cn))
                        {
                            copy.ColumnMappings.Add("FileId", "FileId");
                            copy.ColumnMappings.Add("Symbol", "Symbol");
                            copy.DestinationTableName = "Tbl_GAP_Filter_UPanel_FileValues";
                            copy.WriteToServer(dt);
                            copy.Close();
                        }
                    }
                    FileRecord = dt.Rows.Count;
                }
                DataTable ListofGenes = GetDataTable("exec Sp_GAP_Filter_UPanel_Gene_FromUserFile_Sel '" + FileID + "'");
                //DataTable ListofGenes = GetDataTable("exec Sp_GAP_Filter_UPanel_Gene_FromUserFile_Sel '" + FileID + "'," + "'" + Session["UPanel_Id"].ToString() + "'");

                lblFileRecord.Visible = true;
                lblFileRecord.Text = "Total File Items = " + FileRecord.ToString() + " , Valid Items = " + ListofGenes.Rows.Count.ToString();

                if (ListofGenes.Rows.Count > 0)
                {
                    TrainingGeneColectedItem_Add_Remove();
                    List<ListCVhoosenGene> ResList = new List<ListCVhoosenGene>();
                    foreach (DataRow row in ListofGenes.Rows)
                    {
                        DataColumn column_Ref;
                        DataColumn column_Alias;
                        DataColumn column_Desc;
                        column_Ref = ListofGenes.Columns[0];
                        column_Alias = ListofGenes.Columns[1];
                        column_Desc = ListofGenes.Columns[2];
                        ResList.Add(new ListCVhoosenGene(row[column_Ref].ToString(), row[column_Alias].ToString(), row[column_Desc].ToString()));
                    }
                    if (ResList.Count > 0)
                    {
                        for (int i = 0; i <= ResList.Count - 1; i++)
                        {
                            RadListBoxItem test_old = new RadListBoxItem(ResList[i].RefID, ResList[i].RefID + "," + ResList[i].Alia);
                            Radlisbox_Sample_TrainingGene.ItemTemplate.InstantiateIn(test_old);
                            Label lblref = (Label)test_old.FindControl("lbl_Sel_TrainingGene_RefID");
                            Label lblalias = (Label)test_old.FindControl("lbl_Sel_TrainingGene_Alias");
                            Label lbldesc = (Label)test_old.FindControl("lbl_Sel_TrainingGene_Desc");
                            lblref.Text = ResList[i].RefID;
                            lblalias.Text = ResList[i].Alia;
                            lbldesc.Text = ResList[i].desc;
                            RLB_TrainingGenes.Items.Add(test_old);
                        }
                    }
                    TrainingGeneColectedItem_Remove_Duplicates();
                }

                Directory.Delete(PathUserLJ, true);
                SqlConnection conn = new SqlConnection(CnnStr);
                conn.Open();

                SqlCommand comm = new SqlCommand("Delete FROM Tbl_GAP_Filter_UPanel_FileValues Where Fileid = " + FileID.ToString(), conn);
                comm.ExecuteNonQuery();
            }

        }

        protected void RB_Submit_Click(object sender, EventArgs e)
        {
            if (RLB_TrainingGenes.Items.Count > 0)
            {
                string RPanelId;
                RPanelId = InsertJob();

                string PID = RPanelId;

                if (PID.Length > 0)
                {
                    if (TransferGens(PID))
                    {
                        switch (CheckingApi(PID))
                        {
                            case 0:
                                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"alert('Done! Your panel is on progress!');", true);
                                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", "CloseWindow();", true);
                                break;
                            case 1:
                                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"alert('Done! Your panel is created!');", true);
                                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", "CloseWindow();", true);
                                break;
                            case -1:
                                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"alert('Something went wrong!');", true);
                                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", "CloseWindow();", true);
                                break;
                            default:
                                break;
                        }
                        
                    }
                    else
                        ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"alert('Error! 'There is an issue during the data transferring!');", true);

                }
                else
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"alert('Error! 'There is no valid Panel ID!');", true);
            }
            else
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Myscript1", @"alert('Add at least one data in the list!');", true);


        }

        private int CheckingApi(string pID)
        {
            string ErrMsg;

            SqlConnection conn = new SqlConnection(CnnStr);
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlCommand Cmd = new SqlCommand("Sp_GAP_Filter_UPanel_Ins_Api", conn);
            Cmd.CommandType = CommandType.StoredProcedure;
            SqlParameterCollection SqlParCol;
            SqlParCol = Cmd.Parameters;
            SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@PID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@HostID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@Output", SqlDbType.Int));
            Cmd.Parameters["@Output"].Direction = ParameterDirection.Output;

            SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
            SqlParCol["@PID"].Value = pID;
            SqlParCol["@CenterID"].Value = Session["Current_CenterID"];
            SqlParCol["@HostID"].Value = Session["Current_Host"];

            try
            {
                Cmd.Connection.Open();
                Cmd.ExecuteNonQuery();
                Cmd.Connection.Close();

                return Convert.ToInt32(Cmd.Parameters["@Output"].Value);

            }
            catch (Exception ex)
            {
                ErrMsg = ex.Message.ToString();
                string script = "alert('" + ErrMsg + "')";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyscriptErr", script, true);
                return -1;
            }
            
        }

        public string InsertJob()
        {
            string PId = "";
            string ErrMsg;

            SqlConnection conn = new SqlConnection(CnnStr);
            SqlDataAdapter SqlDataAdptrCmd = new SqlDataAdapter();
            SqlCommand Cmd = new SqlCommand("Sp_GAP_Filter_UPanel_Ins", conn);
            Cmd.CommandType = CommandType.StoredProcedure;
            SqlParameterCollection SqlParCol;
            SqlParCol = Cmd.Parameters;
            SqlParCol.Add(new SqlParameter("@UserID", SqlDbType.Int));
            SqlParCol.Add(new SqlParameter("@UPanelName", SqlDbType.NVarChar));
            SqlParCol.Add(new SqlParameter("@RefBuild", SqlDbType.VarChar));
            //SqlParCol.Add(new SqlParameter("@CenterID", SqlDbType.Int));

            SqlParCol.Add(new SqlParameter("@PID", SqlDbType.Int));

            Cmd.Parameters["@PID"].Direction = ParameterDirection.Output;

            SqlParCol["@UserID"].Value = Session["WiNGSMasterId"];
            SqlParCol["@UPanelName"].Value = RTB_UPanelName.Text;
            SqlParCol["@RefBuild"].Value = Session["RefBuild"].ToString();
            //SqlParCol["@CenterID"].Value = Session["Current_CenterID"];

            try
            {
                Cmd.Connection.Open();
                Cmd.ExecuteNonQuery();
                PId = Cmd.Parameters["@PID"].Value.ToString();
                Cmd.Connection.Close();
            }
            catch (Exception ex)
            {
                ErrMsg = ex.Message.ToString();
                string script = "alert('" + ErrMsg + "')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertscript", script, true);
            }
            return PId;
        }


        public bool TransferGens(string pid)
        {
            List<GeneObject> TGList = new List<GeneObject>();
            foreach (RadListBoxItem item in RLB_TrainingGenes.Items)
            {
                string aliasNref_old = item.Value;
                string[] splitVal = aliasNref_old.Split(',');
                string aliasNref_olddd = item.Text;

                string ref_old = "", alias_old = "";
                if (splitVal.Length > 0)
                {
                    ref_old = splitVal[0].ToString();
                    alias_old = splitVal[1].ToString();
                }

                TGList.Add(new GeneObject(Convert.ToInt32(pid), ref_old, alias_old));
            }

            ThreadAddTrainingGenes tTG = new ThreadAddTrainingGenes(TGList);
            Thread tTGrunner = new Thread(new ThreadStart(tTG.ThreadProc));
            tTGrunner.Start();
            tTGrunner.Join();

            //bool go = checkinsert(pid);
            bool go = true;

            return go;
        }

        public struct GeneObject
        {
            public int PID;
            public string GeneID;
            public string GeneName;

            public GeneObject(int PID, string GeneID, string GeneName)
            {
                this.PID = PID;
                this.GeneID = GeneID;
                this.GeneName = GeneName;

            }
        }

        public class ThreadAddTrainingGenes
        {
            private List<GeneObject> T_TGList = new List<GeneObject>();
            public ThreadAddTrainingGenes(List<GeneObject> TGList)
            {
                for (int i = 0; i <= TGList.Count - 1; i++)
                    T_TGList.Add(new GeneObject(TGList[i].PID, TGList[i].GeneID, TGList[i].GeneName));
            }
            public void ThreadProc()
            {
                DataTable TG_table = new DataTable();
                TG_table.Columns.Add("UPanelID", typeof(int));
                TG_table.Columns.Add("GeneID", typeof(string));
                TG_table.Columns.Add("GeneName", typeof(string));

                for (int i = 0; i <= T_TGList.Count - 1; i++)
                    TG_table.Rows.Add(T_TGList[i].PID, T_TGList[i].GeneID, T_TGList[i].GeneName);
                using (SqlConnection Conn = new SqlConnection(CnnStr))
                {
                    Conn.Open();
                    using (SqlBulkCopy s = new SqlBulkCopy(Conn))
                    {
                        s.DestinationTableName = "Tbl_GAP_Filter_UPanel_Genes";
                        s.WriteToServer(TG_table);
                        s.Close();
                    }
                    Conn.Close();
                }
            }
        }

        //public bool checkinsert(string pid)
        //{
        //    bool res = false;
        //    string ErrMsg = "";
        //    SqlCommand Cmd = new SqlCommand("ChangeJobStat_CheckEnteredGeneCount", new SqlConnection(CnnStr));
        //    Cmd.CommandType = CommandType.StoredProcedure;
        //    SqlParameterCollection SqlParCol;
        //    SqlParCol = Cmd.Parameters;


        //    SqlParCol.Add(new SqlParameter("@Job_ID", SqlDbType.Int));
        //    SqlParCol.Add(new SqlParameter("@res", SqlDbType.Int));


        //    Cmd.Parameters["@res"].Direction = ParameterDirection.Output;

        //    SqlParCol["@Job_ID"].Value = pid;


        //    try
        //    {
        //        Cmd.Connection.Open();
        //        Cmd.ExecuteNonQuery();
        //        if (Cmd.Parameters["@res"].Value.Equals(1))
        //            res = true;
        //        else
        //            res = false;

        //        Cmd.Connection.Close();
        //    }
        //    catch (Exception ex)
        //    {
        //        ErrMsg = ex.Message.ToString();
        //        string script = "alert('" + ErrMsg + "')";
        //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertscript", script, true);
        //    }

        //    return res;
        //}

    }

}