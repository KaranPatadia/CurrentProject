<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
	.contactHeader{
		padding-top:64px;
		padding-bottom:64px;
	}
	h2{
		color:#f1f1f1;
	}
	.opacity{
		opacity:0.60;
	}
	.section{
		margin-top:16px;
		margin-bottom:16px;
	}
	.section i{
		font-size:36px;
		margin-right:16px;
		color:#fff
	}
	.contactHeader p{
		color: #ffffff;
	}
	.contactHeader input[type=text]{
		padding:8px;
		display:block;
		border:none;
		border-bottom:1px solid #ccc;
		width:100%;
		padding-top:16px;
		padding-bottom:16px;
	}
	.send{
		box-shadow:0 20px 24px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
		color:#000;
		background-color:#f1f1f1;
		padding:12px 24px;
	}
	.send:hover{
		opacity: 0.60;
	}
	@media screen and (max-width: 600px) {
		.contactHeader{
			margin-left:-10%;
		}
	}
</style>
</head>
<body>
	<div class="contactHeader">
	    <h2 style="color:#fff">Contact Us</h2>
	    <hr style="width:200px" class="opacity">
	
	    <div class="section">
	      <p><i class="fa fa-map-marker fa-fw"></i> Hyderabad, India</p>
	      <p><i class="fa fa-phone fa-fw"></i> Phone: +00 151515</p>
	      <p><i class="fa fa-envelope fa-fw"> </i> Email: mail@mail.com</p>
	    </div><br>
	    <p>Lets get in touch. Send me a message:</p>
	
	    <form action="/action_page.php" target="_blank">
	      <p><input type="text" placeholder="Name" required name="Name"></p>
	      <p><input type="text" placeholder="Email" required name="Email"></p>
	      <p><input type="text" placeholder="Subject" required name="Subject"></p>
	      <p><input type="text" placeholder="Message" required name="Message"></p>
	      <p>
	        <button class="send" type="submit">
	          <i class="fa fa-paper-plane"></i> SEND MESSAGE
	        </button>
	      </p>
	    </form>
    </div>
</body>
</html>