using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebGAP.Tutorial
{
    public partial class Tutorial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }


       
            public class VideoClip
            {
                string title;
                string videoID;
                string length;
                string description;

                public string Title
                { get { return this.title; } }
                public string VideoID
                { get { return this.videoID; } }
                public string Length
                { get { return this.length; } }
                public string Description
                { get { return this.description; } }

                public VideoClip(string title, string videoID, string length, string description)
                {
                    this.title = title;
                    this.videoID = videoID;
                    this.length = length;
                    this.description = description;
                }
            }
            protected void Page_Init(object sender, EventArgs e)
            {
                

                foreach (VideoClip video in GetVideoCollection())
                {
                   
                        RadLightBoxItem item = new RadLightBoxItem();
                        item.Title = video.Title;
                        item.Description = video.Description;
                        item.ItemTemplate = new LightBoxMediaTemplate(video);
                        RadLightBox1.Items.Add(item);
                  }
                
            }
            protected void RadListView1_NeedDataSource(object sender, RadListViewNeedDataSourceEventArgs e)
            {
                RadListView1.DataSource = GetVideoCollection();
            }
            private VideoClip[] GetVideoCollection()
            {
            VideoClip[] clipsCollection;
            if (System.Web.HttpContext.Current.Session["WiNGSUserType"].Equals("3") || System.Web.HttpContext.Current.Session["WiNGSUserType"].Equals("6"))
            {
                clipsCollection = new VideoClip[4]{
                    new VideoClip("Register sample and Individual", "V1", "3:03",
                      @"In this video, the registeration of sample and individual is shown as well as relate them to each other."),
                    new VideoClip("Create Family", "V2",  "1:58",
                      @"In this video, creating family and assign the Individuals to family is shown as well as drawing pedigree and indicating the disease."),
                    new VideoClip("Add HPO terms to Individual profile", "V3", "2:25",
                      @"This video has been shown how to search HPO terms with OMIMs and Genes and add to the individual profile. "),
                    new VideoClip("Simple sample query", "V4", "4:40",
                      @"In this video, filtering and creating gene panel is shown. ")};
            }
            else
            {
                clipsCollection = new VideoClip[6]{
                    new VideoClip("Register sample and Individual", "V1", "3:03",
                      @"In this video, the registeration of sample and individual is shown as well as relate them to each other."),
                    new VideoClip("Create Family", "V2",  "1:58",
                      @"In this video, creating family and assign the Individuals to family is shown as well as drawing pedigree and indicating the disease."),
                    new VideoClip("Add HPO terms to Individual profile", "V3", "2:25",
                      @"This video has been shown how to search HPO terms with OMIMs and Genes and add to the individual profile. "),
                    new VideoClip("Simple sample query", "V4", "4:40",
                      @"In this video, filtering and creating gene panel is shown. "),
                    new VideoClip("ACL part 1", "V5", "2:53",
                      @"In this video, How to activate user, register center, group samples into the datasets are shown."),
                    new VideoClip("ACL part 2", "V6", "3:25",
                      @"In this video, How to make group of people to give the access to Dataset is shown as well as list of PI with their own samples, Individual and users.")};
            }
            return clipsCollection;
            }
            private class LightBoxMediaTemplate : ITemplate
            {
                protected RadMediaPlayer player;
                private VideoClip video;
                public LightBoxMediaTemplate(VideoClip video)
                {
                    this.video = video;
                }


                public void InstantiateIn(Control container)
                 {
               
                        
                            player = new RadMediaPlayer();
                            player.ID = "RadMediaPlayer1";
                            player.RenderMode = RenderMode.Lightweight;
                          //  player.ToolBar.FullScreenButton.Style["display"] = "none";
                            player.Title = video.Title;
                            player.Source = "../video/" + video.VideoID + ".mp4";
                            player.Height = Unit.Pixel(600);
                            player.Width = Unit.Pixel(800);
 

                            container.Controls.Add(player);
                      
                }
            }
        
    }
}