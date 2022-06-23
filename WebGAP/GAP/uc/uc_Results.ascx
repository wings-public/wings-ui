<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Results.ascx.cs" Inherits="WebGAP.GAP.uc.uc_Results" %>


<div class="content-body pt-1">
    <section id="basic-form-layouts">
        <div class="row match-height">
            <div class="col-12">
                <telerik:RadTabStrip RenderMode="Lightweight" ID="RadTabStrip1" SelectedIndex="0"
                    runat="server" MultiPageID="RadMultiPage1" Skin="MetroTouch" Width="100%" Align="Left" BorderWidth="0px">
                </telerik:RadTabStrip>
                <telerik:RadMultiPage ID="RadMultiPage1" CssClass="RadMultiPage" runat="server" BorderWidth="0px" SelectedIndex="0" Width="100%" OnPageViewCreated="RadMultiPage1_PageViewCreated">
                </telerik:RadMultiPage>

            </div>
        </div>
    </section>
</div>
