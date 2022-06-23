<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebGAP._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
   .intro-text {
    color: #B4C0FD !important;
}
.bg-highlight-purple {
    background-color: #F0F3FF;
}
.bg-light-purple, footer {
    background-color: #DFE5FF;
}
.navbar-custom .nav li a {
    color: #B4C0FD !important;
}
.RadComboBox_Bootstrap .rcbReadOnly.rcbFocused, .RadComboBox_Bootstrap .rcbReadOnly {
    background-color: #B4C0FD;
}
    .RadComboBox_Bootstrap .rcbReadOnly.rcbHovered {
        background-color: #F0F3FF
    }
    </style>

    <!-- Header -->
    <header>
        <div class="container">
            <div class="intro-text">
                <div class="intro-lead-in">Widely Integrated NGS platform</div>
                <div class="intro-heading">WiNGS</div>
                <a href="#about" class="page-scroll btn btn-xl">Learn More</a>
            </div>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Services Section -->
    <section id="about" class="bg-highlight-purple">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="section-header">
                        <h2 class="section-title">About <span>WiNGS</span></h2>
                        <div class="lines">
                            <div class="linecircle">
                            </div>
                        </div>

                        <img src="img/SLogo.png" class="img-responsive img-centered" style="margin-top: 20px !important" alt="WiNGS" />
                    </div>
                </div>
                <div class="col-md-6">
                    <p class="p-about">WiNGS is federated and web-based platform tackling the complexity of analyzing genome sequencing data. 
                                       By storing sensitive information, inlcuding extensive phenotypic data and variant information, in client-hosted hubs, WiNGS optimizes ICT requirements of Whole Genome Sequencing (WGS) interpretation. 
                                       Finally, it allows anonymized analyses of pan-client data, while fully preserving the privacy of patient information. </p>
                    <p class="span-about"></p>
                </div>
            </div>
        </div>
    </section>

    <!-- Portfolio Grid Section -->
    <section id="portfolio" class="bg-light-purple">
        <div class="container">
            <div class="row">
                <div class="section-header">
                    <h2 class="section-title">Our <span>Services</span></h2>
                    <div class="lines">
                        <div class="linecircle">
                        </div>
                    </div>
                    <p class="section-subtitle">
                        This project focuses on the software and ICT infrastructure needed to support
                        <br />
                        the increased clinical use of Whole human Genome Sequencing (WGS).
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-sm-6">
                    <div class="item-boxes">
                        <div class="icon">
                            <img src="img/portfolio/04.png" class="img-centered" style="height: 40px !important; margin-top: 10px !important" />
                        </div>
                        <h4>WGS Data Analysis</h4>
                        <p>WiNGS provides the analysis strategies for different use cases. For example : rare disease diagnosis, cohort analysis, trio analysis, carrier screening. </p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="item-boxes">
                        <div class="icon">
                            <img src="img/portfolio/03.png" class="img-centered" style="height: 40px !important; margin-top: 10px !important" />
                        </div>
                        <h4>Rare Disease Diagnosis</h4>
                        <p>Clinical implementation of WGS for the purpose of rare disease screening. WiNGS supports anonymized access to genomic and phenotypic data from similar patients over multiple genomic centres. </p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="item-boxes">
                        <div class="icon">
                            <img src="img/portfolio/05.png" class="img-centered" style="height: 40px !important; margin-top: 10px !important" />
                        </div>
                        <h4>Quality Control</h4>
                        <p>All data handling is traceable, to meet the requirements of the client and customer. WiNGS also offers QC modules to visualize data quality. </p>
                    </div>
                </div>

            </div>
           <div class="row">
                
                <div class="col-md-4 col-sm-6">
                    <div class="item-boxes">
                        <div class="icon">
                            <img src="img/portfolio/08.png" class="img-centered" style="height: 40px !important; margin-top: 10px !important" />
                        </div>
                        <h4>Federated Data Analytics</h4>
                        <p>Federated Data Analytics are the core of WiNGS, making it possible to leverage anonymized data in rare variant analysis, while complying to current privacy standards. </p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="item-boxes">
                        <div class="icon">
                            <img src="img/portfolio/15.png" class="img-centered" style="height: 40px !important; margin-top: 10px !important" />
                        </div>
                        <h4>Privacy Preserving</h4>
                        <p>All sensitive data, being phenotypes or genotypes, is stored at the clients infrastucture. All communication is encrypted and access to data is restricted using a stringent access controle module. </p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="item-boxes">
                        <div class="icon">
                            <img src="img/portfolio/samplecatalogue.png" class="img-centered" style="height: 40px !important; margin-top: 10px !important" />
                        </div>
                        <h4>Sample Catalogue</h4>
                        <p>Besides WGS data analytics, WiNGS also offers a bio-sample catalogue. 
                            Based on the same privacy modules, this catalogue allows researchers to expose which biological samples, and clinical or molecular characteristics, are available for collaboration. </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <!--
    <section id="services" class="bg-highlight-purple">
        <div class="container">
            <div class="row">
                <div class="section-header">
                    <h2 class="section-title">Amazing <span>Features</span></h2>
                    <div class="lines">
                        <div class="linecircle">
                        </div>
                    </div>
                    <p class="section-subtitle">
                        The GAP project seeks to optimize the ICT infrastructure required to support and enable Whole Genome Sequencing.
                        <br />
                        Its aim is to bridge the gap between the low cost of sequencing and the high cost of analysis to enable widespread clinical use of WGS.
                    </p>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <img src="img/portfolio/10.png" class="img-responsive img-centered" style="height: 180px !important" />

                </div>
                <div class="col-md-6">
                    <h2 class="section-heading-small">Genomic Analytics Platform</h2>
                    <h3 class="section-subheading-small text-muted bottom-margin-sm">The last 15 years has seen a drop in the cost of lab technology for Whole Genome Sequencing (WGS) from $300,000,000 to $1,000. The GAP project seeks to optimize the ICT infrastructure required to support and enable WGS, bridging the gap between the low cost of sequencing and high cost of analysis to enable widespread clinical use of WGS.</h3>

                </div>
                <p class="bottom-margin-sm">&nbsp;&nbsp;&nbsp;&nbsp; </p>
            </div>
            <div class="row hidden-sm hidden-xs">
                <div class="col-md-6">
                    <h2 class="section-heading-small">Two demonstrated proofs-of-concept</h2>
                    <h3 class="section-subheading-small text-muted bottom-margin-sm">With these challenges in mind, the GAP consortium intends to develop:
                        <ul>
                            <li>The GAP platform – a proof-of-concept ICT platform that supports the end-to-end clinical analysis of whole genome sequences.</li>
                            <li>The Federated Analytics Platform – which will be used in the context of phenotype analysis for rare diseases to optimize speed and accuracy.</li>
                        </ul>
                        Furthermore, the project seeks to embed the software artefacts it develops into the product offerings of partner companies.
                    </h3>
                </div>
                <div class="col-md-6">
                    <img src="img/portfolio/13.png" class="img-responsive img-centered" style="height: 180px !important" />
                </div>
                <p class="bottom-margin-sm">&nbsp;&nbsp;&nbsp;&nbsp; </p>
            </div>
              <div class="row">
                <div class="col-md-6">
                    <img src="img/portfolio/12.png" class="img-responsive img-centered" style="height: 180px !important" />
                </div>
                <div class="col-md-6">
                    <h2 class="section-heading-small">Obstacles to large-scale genome analysis</h2>
                    <h3 class="section-subheading-small text-muted bottom-margin-sm">Today’s clinical sequencing technologies cover only a tiny portion of the entire genome or target specific genes. The reason: storage and computing requirements for full-scale analysis are nearly impossible to meet. Another obstacle to widespread and cohesive use of WGS is the fact that current genome analysis software is chunky and diffuse, and petabytes of data need to be stored and quickly accessed. Meanwhile, multiple companies with niche specializations need to align to form a collaborative ecosystem for large-scale genome analysis to become a reality.</h3>
                </div>
                <p class="bottom-margin-sm">&nbsp;&nbsp;&nbsp;&nbsp; </p>
            </div>
            <div class="row hidden-sm hidden-xs">
                <div class="col-md-6">
                    <h2 class="section-heading-small">Genome analysis meets the cloud</h2>
                    <h3 class="section-subheading-small text-muted bottom-margin-sm">The consortium’s team of expertise covers clinical genetic assessment, genetic diseases, data analytics, cloud-based genomics services, cloud platforms and high-performance computing for life sciences applications. All GAP partners are located in close proximity to facilitate cross-functional collaboration.</h3>
                </div>
                <div class="col-md-6">
                    <img src="img/portfolio/14.png" class="img-responsive img-centered" style="height: 180px !important" />
                </div>
                <p class="bottom-margin-sm">&nbsp;&nbsp;&nbsp;&nbsp; </p>
            </div>
        </div>
    </section>
    -->
    <!-- Team Section -->
    <section id="clients" class="bg-light-purple">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Partners</h2>
             
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <img src="img/logos/KULeuven.jpg" class="img-responsive img-centered" alt="">
                </div>
                <div class="col-md-3 col-sm-6">
                    <img src="img/logos/Stadius.png" width="220" class="img-responsive img-centered" alt="">
                </div>
               <div class="col-md-3 col-sm-6">
                    <img src="img/logos/Antwerpen.png" width="220" class="img-responsive img-centered" alt="">
                </div>
                <div class="col-md-3 col-sm-6">
                    <img src="img/logos/Elixir.png" width="115" class="img-responsive img-centered" alt="">
            </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact"  class="bg-highlight-purple">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Contact Us</h2>
                    <h3 class="section-subheading text-muted bottom-margin-sm">Leave a question here, and we'll get back to you.</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <div class="block">
                            <div class="form-group-1">
                                <input type="text" class="form-control-1" placeholder="Your Name">
                            </div>
                            <div class="form-group-1">
                                <input type="text" class="form-control-1" placeholder="Email Address">
                            </div>
                            <div class="form-group-1">
                                <input type="text" class="form-control-1" placeholder="Subject">
                            </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12">
                    <div class="block">
                      
                            <div class="form-group-2">
                                <textarea class="form-control" rows="3" placeholder="Your Message"></textarea>
                            </div>
                            <button class="btn btn-default" type="submit">Send Message</button>
                     
                    </div>
                </div>
            </div>

        </div>
    </section>


</asp:Content>
