<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>

	.partone h1, h2, h3, h4, h5, h6 {
	    color: #F3E0BE;
	}
	.partone a, a:hover, a:focus, a:active {
	    text-decoration: none;
	    outline: none;
	}
	.partone ul {
	    margin: 0;
	    padding: 0;
	    list-style: none;
	}
	.section_all {
	    position: relative;
	    margin-top: 900px;
	    margin-bottom: 0;
	}
	.section-title {
	    font-weight: 700;
	    text-transform: capitalize;
	    letter-spacing: 1px;
	}
	
	.section-subtitle {
	    letter-spacing: 0.4px;
	    line-height: 28px;
	    max-width: 550px;
	}
	
	.section-title-border {
	    background-color: #000;
	    height: 1 3px;
	    width: 44px;
	}
	
	.section-title-border-white {
	    background-color: #fff;
	    height: 2px;
	    width: 100px;
	}
	.text_custom {
	    color: #00bd2a;
	}
	
	.about_icon i {
	    font-size: 22px;
	    height: 65px;
	    width: 65px;
	    line-height: 65px;
	    display: inline-block;
	    background: #ffffff;
	    border-radius: 35px;
	    color: #000000;
	    box-shadow: 0 8px 20px -2px rgba(158, 152, 153, 0.5);
	}
	
	.about_header_main .about_heading {
	    max-width: 450px;
	    font-size: 24px;
	}
	
	.about_icon span {
	    position: relative;
	    top: -10px;
	}
	
	.about_content_box_all {
	    padding: 28px;
	}
	.font-weight-bold{
	color:white!important;}
	.text-muted{
	color:#b8bec3!important;
	}
	#font{
	color:#F5D6C6!important;
	}
	@media (min-width: 1200px) {
		.cols{
			margin-right:-5%;
		}
		.contact-list i{
				font-size:40px;
		}
	}
	@media screen and (max-width: 600px) {
		.section_all{
	    	margin-top: 1200px;
			margin-left:-10%;
		}
	}
</style>
</head>
<body style="background-color: #000000 ;font-weight:bold;">
	<!-- image with content -->
	<section class="section_all" id="about" >
            <div class="partone" style="background-color: #000000;color:#ffffff;">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section_title_all text-center">
                            <h3 style="color:#ffffff;"><b>Welcome To <span class="text-custom">Prestemo</span></b></h3>
                            <p style="font-weight:bold;color:#ffffff;">Easy loan , No hassle</p>
                            <div class="">
                                <i class=""></i>
                            </div>
                        </div>
                    </div>
                </div>
 
                <div class="row vertical_content_manage mt-5">
                    <div class="col-lg-6">
                        <div class="about_header_main mt-3" style="color:#ffffff; font-weight:bold;">
                            <div class="about_icon_box">
                                <p class="text_custom font-weight-bold" style="color:#ffffff;font-weight:bold;"> </p>
                            </div>
                            <h4 class="about_heading text-capitalize font-weight-bold mt-4 font" id="font">About Prestamo</h4>
                            <p class="text-muted mt-3"  style="color:#ffffff;font-weight:bold;" >At Prestamo , we are here to provide you with financial solutions for all your lending needs . Regardless of whether you are looking for an advance , contract , or line of credit , our knowledgeable and experienced loaning team will disclose our lending options to you in a straight forward manner. </p>

                            <p class="text-muted mt-3" style="color:#ffffff;font-weight:bold;">The main thing we share for all intents and purpose with enormous banks is overall reach .Be that as it may , big banks,at Prestamo we Are proud to make all loaning decisions locally. Since our leaders work in the bank each day , they all review your loan application and respond with few days. Our goal is to make getting a credit an easy and stress free process! </p>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="img_about mt-3">
                            <img src="./Pictures/rupeelogo1.JPG" alt="" class="img-fluid mx-auto d-block" style="width:250px;height:250px;border-radius:50%;background-color:#ffffff;">  
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-lg-4">
                        <div class="about_content_box_all mt-3">
                            <div class="about_detail text-center">
                                <div class="about_icon">
                                    <i class="fa fa-eye"></i>
                                </div>
                                <h5 class="text-capitalize mt-3 font-weight-bold">Our Vision</h5>
                                <p class="edu_desc mt-3 mb-0 text-muted">The vision of Prestamo is to create an emphatically critical and deeply sincere impression on all we serve . Our high caliber contract experts are dedicated. </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="about_content_box_all mt-3">
                            <div class="about_detail text-center">
                                <div class="about_icon">
										<i class="fa fa-handshake-o"></i>
                                </div>
                                <h5 class="text-dark text-capitalize mt-3 font-weight-bold">Our Value</h5>
                                <p class="edu_desc mb-0 mt-3 text-muted">We value, support and help our employees grow and are committed to a culture of active inclusion and diversity. We believe our success is measured by the success of our customers </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="about_content_box_all mt-3">
                            <div class="about_detail text-center">
                                <div class="about_icon">
                                    <i class=" fa fa-eye"></i>
                                </div>
                                <h5 class="text-dark text-capitalize mt-3 font-weight-bold">Our Goals</h5>
                                <p class="edu_desc mb-0 mt-3 text-muted">Our goal is to provide a high level of sound and meaningful services to the people we serve. Our customers receive a matchless experience that far expectation. </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </section>
</body>
</html>