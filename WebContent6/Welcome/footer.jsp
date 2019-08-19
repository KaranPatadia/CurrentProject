<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
<title>Footers</title>
<style>
	@charset "ISO-8859-1";
	.context-dark, .bg-gray-dark, .bg-primary {
	    color: rgba(255, 255, 255, 0.8);
	}
	
	.footer-classic a, .footer-classic a:focus, .footer-classic a:active {
	    color: #ffffff;
	}
	
	.social-inner {
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    width: 100%;
	    padding: 13px;
	    font: 900 13px/1 "Lato", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
	    text-transform: uppercase;
	    color: rgba(255, 255, 255, 0.5);
	}
	.social-container .col {
	    border: 1px solid rgba(255, 255, 255, 0.1);
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
		.footerContainer{
			margin-left:-10%;
		}
		
	}
</style>
</head>
<body>
<footer class="section footer-classic context-dark bg-image" style="background: #000;">
        <div class="footerContainer">
          <div class="row row-30">
            <div class="col-md-4 col-xl-5 cols">
              <div class="pr-xl-4">
              	<dt><img class="brand-logo-light" src="./Pictures/rupeelogo1.JPG" alt="" style="width:40%;height:40%;border-radius:50%;"></dt>
                <dd><p>prestamo &copy; 2019</p>
                <!-- Rights-->
                <p class="rights"><span>©  </span><span class="copyright-year">2019</span><span> </span><span>Waves</span><span>. </span><span>All Rights Reserved.</span></p></dd>
              </div>
            </div>
            <div class="col-md-4 col-xl-5 cols">
            	<dl class="contact-list">
					<dt></dl><i class="fa fa-map-marker" style="font-size:25px;"></i><span>Nanakramguda</span> </dt>
					<dd>Hyderabad, India</dd>
				</dl>
              <dl class="contact-list">
                <dt><i class="fa fa-phone" style="font-size:25px;"></i>+91 000 123456</dt>
              </dl>
              <dl class="contact-list">
                <dt><i class="fa fa-envelope" style="font-size:25px;"></i><a href="mailto:#">dkstudioin@gmail.com</a></dt>
              </dl>
            </div>
            <div class="col-md-4 col-xl-3 cols">
				<dt><span>About the company</span></dt>
				<dd>prestamo is an easy and hassle free loan service for consumers.</dd>
            </div>
          </div>
        </div>
      </footer>
</body>
</html>