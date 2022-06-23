<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="Tutorial.aspx.cs" Inherits="WebGAP.Tutorial.Tutorial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .imageWrapper {
    font: 13px "Segoe UI", Arial,Helvetica, sans-serif;
    color: #666;
    float: left;
    width: 215px;
    height: 175px;
    padding: 10px;
    cursor: pointer;
}
 
.playIcon {
    background: url(images/hover_video_thumb.png) no-repeat;
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    display: none;
}
 
.imageWrapper:hover {
    background: white;
    color: #000;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
}
 
    .thumbnailHolder img,
    .imageWrapper:hover .playIcon {
        display: block;
    }
 
.thumbnailHolder {
    display: block;
    position: relative;
    margin-bottom: 5px;
}
 
.timeLabel {
    background-color: rgba(0,0,0,0.7);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#B3000000', endColorstr='#B3000000',GradientType=0 );
    font: bold 10px/14px "Segoe UI", Arial,Helvetica, sans-serif;
    color: white;
    bottom: 2px;
    right: 1px;
    width: 30px;
    text-align: center;
    position: absolute;
}
 
.RadMediaPlayer,
div.rltbDescriptionBox {
    margin-left: 50px;
    width: 600px;
  
}
 
.rltbItemTemplate {
    height: 550px;
}
 
.rmpFullscreen {
    margin-left: 0px;
}
 
div.RadLightBox .rltbWrapper {
    z-index: auto;
    width: 900px;
    height: 735px;
}
 
.RadLightBox .rltbToolbar {
    display: none;
}
 
.rltbOverlay {
    z-index: 350000 !important;
}
.RadLightBox {
    z-index: 360000 !important;
}
.size-custom {
    max-width: 642px;
}
    </style>
    <div class="content-header row pt-2">
    <table style="width: 100%; background-color: lightgray">

        <tr>
            <td rowspan="2" style="width: 400px">
                <h3 style="color: white; text-shadow: 2px 2px 4px #000000;">
                    <asp:Label runat="server" ID="Sample" CssClass="header" Text="Tutorial"> </asp:Label></h3>
            </td>

        </tr>

    </table>
</div>
<div class="content-body pt-1">
    <section id="basic-form-layouts">
        <div class="row match-height">
        
       <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="RadListView1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadLightBox1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
            <telerik:RadListView ID="RadListView1" runat="server" OnNeedDataSource="RadListView1_NeedDataSource">
                <ItemTemplate>
                    <div class="imageWrapper" onclick='<%# "showLightBox("+Container.DisplayIndex+");" %>'>
                        <span class="thumbnailHolder">
                            <asp:Image ID="Image2" runat="server" Height="109px" Width="194px" AlternateText="Video Thumbnail"
                                ImageUrl='<%# string.Format("../video/{0}.png" , Eval("VideoID")) %>' />
                            <asp:Label ID="Label3" runat="server" CssClass="timeLabel" Text='<%#  Eval("Length") %>'></asp:Label>
                            <span class="playIcon"></span>
                        </span>
                        <asp:Label ID="Label4" runat="server"
                            Text='<%#  Eval("Title") %>'></asp:Label>
                    </div>
                </ItemTemplate>
            
            </telerik:RadListView>
        <telerik:RadLightBox RenderMode="Lightweight" ID="RadLightBox1" runat="server" Modal="true"
            ItemsCounterFormatString="Video {0} of {1}" Width="880px" Height="575px">
            <ClientSettings>
                <ClientEvents OnLoad="lightBoxLoad" OnShowed="lightBoxShowed" />
            </ClientSettings>
        </telerik:RadLightBox>
</div>
        </section>
        </div>
    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <script type="text/javascript">
        var lightBox;
        function lightBoxLoad(sender, args) {
            lightBox = sender;
        }
        function showLightBox(index) {
            lightBox.set_currentItemIndex(index);
            lightBox.show();
        }
        function lightBoxShowed(sender, args) {
            var iframeEl = $telerik.$(sender.get_element()).find("IFRAME")[0];
            iframeEl.style.height = "100%";
            iframeEl.style.width = "100%";
        }
    </script>
    </telerik:RadScriptBlock>


      

</asp:Content>

