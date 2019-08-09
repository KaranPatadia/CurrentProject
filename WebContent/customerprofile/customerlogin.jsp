<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	 
	<title>Featured Tabs</title>
 	<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
	<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
	<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,200,300,700'>
	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'></script>
	<script src="../customerprofile/cuslogin.js"></script>
	<style>

	body{
	  background-color: #000000;
	}
		.container {
	  margin-top:30px;
	  margin-left: 12%;
	}
	
	h1, h2, h3, h4, h5, h6 {
	  font-family: 'Source Sans Pro';
	  font-weight:700;
	}
	
	.fancyTab {
		text-align: center;
	  padding:15px 0;
	  background-color: #ffffff;
		box-shadow: 0 0 0 1px #ddd;
		top:15px;	
	  transition: top .2s;
	}
	
	.fancyTab.active {
	  top:0;
	  transition:top .2s;
	}
	
	.whiteBlock {
	  display:none;
	}
	
	.fancyTab.active .whiteBlock {
	  display:block;
	  height:2px;
	  bottom:-2px;
	  background-color:#fff;
	  width:99%;
	  position:absolute;
	  z-index:1;
	}
	
	.fancyTab a {
		font-family: 'Source Sans Pro';
		font-size:1.65em;
		font-weight:300;
	  transition:.2s;
	  color:#333;
	}
	
	/*.fancyTab .hidden-xs {
	  white-space:nowrap;
	}*/
	
	.fancyTabs {
		border-bottom:2px solid #ddd;
	  margin: 15px 0 0;
	}
	
	li.fancyTab a {
	  padding-top: 15px;
	  top:-15px;
	  padding-bottom:0;
	}
	
	li.fancyTab.active a {
	  padding-top: inherit;
	}
	
	.fancyTab .fa {
	  font-size: 40px;
		width:100%;
		padding: 15px 0 5px;
	  color:#000000;
	}
	
	.fancyTab.active .fa {
	  color: #000000;
	}
	
	.fancyTab a:focus {
		outline:none;
	}
	
	.fancyTabContent {
	  border-color: transparent;
	  box-shadow: 0 -2px 0 -1px #fff, 0 0 0 1px #ddd;
	  padding: 30px 15px 15px;
	  position:relative;
	  background-color:#fff;
	}
	
	.nav-tabs > li.fancyTab.active > a, 
	.nav-tabs > li.fancyTab.active > a:focus,
	.nav-tabs > li.fancyTab.active > a:hover {
		border-width:0;
	}
	
	.nav-tabs > li.fancyTab:hover {
		background-color:#f2f2f2;
		box-shadow: 0 0 0 1px #ddd;
	}
	
	.nav-tabs > li.fancyTab.active:hover {
	  background-color:#f2f2f2;
	  box-shadow: 1px 1px 0 1px #fff, 0 0px 0 1px #ddd, -1px 1px 0 0px #ddd inset;
	}
	
	.nav-tabs > li.fancyTab:hover a {
		border-color:transparent;
	}
	
	.nav.nav-tabs .fancyTab a[data-toggle="tab"] {
	  background-color:transparent;
	  border-bottom:0;
	}
	
	.nav-tabs > li.fancyTab:hover a {
	  border-right: 1px solid transparent;
	}
	
	.nav-tabs > li.fancyTab > a {
		margin-right:0;
		border-top:0;
	  padding-bottom: 30px;
	  margin-bottom: -30px;
	}
	
	.nav-tabs > li.fancyTab {
		margin-right:0;
		margin-bottom:0;
	}
	
	.nav-tabs > li.fancyTab:last-child a {
	  border-right: 1px solid transparent;
	}
	
	.nav-tabs > li.fancyTab.active:last-child {
	  border-right: 0px solid #ddd;
		box-shadow: 0px 2px 0 0px #fff, 0px 0px 0 1px #ddd;
	}
	
	.fancyTab:last-child {
	  box-shadow: 0 0 0 1px #ddd;
	}
	
	.tabs .nav-tabs li.fancyTab.active a {
		box-shadow:none;
	  top:0;
	}
	
	
	.fancyTab.active {
	  background: #f2f2f2;
		box-shadow: 1px 1px 0 1px #fff, 0 0px 0 1px #ddd, -1px 1px 0 0px #ddd inset;
	  padding-bottom:30px;
	}
	
	.arrow-down {
		display:none;
	  width: 0;
	  height: 0;
	  border-left: 20px solid transparent;
	  border-right: 20px solid transparent;
	  border-top: 22px solid #ddd;
	  position: absolute;
	  top: -1px;
	  left: calc(50% - 20px);
	}
	
	
	@media (max-width: 1200px) {
	  
	  .fancyTab .fa {
	  	font-size: 36px;
	  }
	  
	  .fancyTab .hidden-xs {
	    font-size:22px;
		}
			
	}
		
		
	@media (max-width: 992px) {
	    
	  .fancyTab .fa {
	  	font-size: 33px;
	  }
	    
	  .fancyTab .hidden-xs {
	  	font-size:18px;
	    font-weight:normal;
	  }
			
	}
		
		
	@media (max-width: 768px) {
	    
	  .fancyTab > a {
	    font-size:18px;
	  }
	    
	  .nav > li.fancyTab > a {
	    padding:15px 0;
	    margin-bottom:inherit;
	  }
	    
	  .fancyTab .fa {
	    font-size:30px;
	  }
	    
	  .nav-tabs > li.fancyTab > a {
	    border-right:1px solid transparent;
	    padding-bottom:0;
	  }
	    
	  .fancyTab.active .fa {
	    color: #333;
		}
			
	}
	
	.applyContainer{
			box-sizing: border-box;
			background-color: #000000;
			font-family: "Arial", sans-serif;
			padding: 50px;
			margin: 0% 0% 0% 1%;
			padding: 10px;
			width: 40%;
			height: 400px;
			background-color: #fff;
			border-radius: 5px;
			float:left;
		}
		.displayContainer{
			background-color:#87C18A;
			opacity:0.5;
			width:44%;
			float: right;
			margin: 0% 4% 0% 1%;
			padding-top: 5px;
			height: 345px;
		}
		.displayContainer h3{
		 	width: 100%;
			color: #000000;
			font-size: 28px;
			margin: 28px auto;
			margin-bottom: 20px;
			text-align: center;
		}
		.applyContainer h1{
		 	width: 70%;
			color: #000000;
			font-size: 32px;
			margin: 28px auto;
			margin-bottom: 20px;
			text-align: center;
			/*padding-top: 40px;*/
		}
		.applyContainer form{
			/*padding: 15px;*/
			text-align: center;
		}
		.applyContainer input{
			padding: 12px 0;
			margin-bottom: 10px;
			border-radius: 3px;
			border: 2px solid transparent;
			text-align: center;
			width: 100%;
			font-size: 16px;
			transition: border .2s, background-color .2s;
		}
		.applyContainer p{
			padding: 12px 0;
			margin-bottom: 10px;
			border-radius: 3px;
			border: 2px solid transparent;
			text-align: center;
			width: 100%;
			font-size: 16px;
			transition: border .2s, background-color .2s;
		}
		.applyContainer form .field{
			background-color: #ECF0F1;
		}
		.applyContainer form .field:focus {
			border: 2px solid #000000;
		}
		.applyContainer form .btn{
			background-color:#000000;
			color: #fff;
			line-height: 25px;
			cursor: pointer;
		}
		.applyContainer form .btn:hover,
		.applyContainer form .btn:active {
			background-color: #ffffff;
      color: #000000;
			border: 2px solid #000000;
      
		}
		.pass-link{
			text-align: center;
		}
		.pass-link a:link,
		.pass-link a:visited{
			font-size: 12px;
			color: #777;
		}
		.container{
			width: 88%;
			background-color:#000000;
		}
		#home{
			margin-left:10%;
		}
		#about{
			margin-left:5%;
			background-color:#000000;
			border:0;
		}
		#contact{
			margin-left:10%;
		}
</style>
</head>
<body>
<%@ include file="../connection.jsp" %>
<%	
	ResultSet rs1=null,rs2=null,rs3=null,rs=null;
	PreparedStatement pst1=null,pst2=null,pst3=null,pst=null;
	boolean flag1=false;
	PrintWriter pw=response.getWriter();
	if("Apply".equals(request.getParameter("apply"))){
		if(conTrue){
			try{
				String lid=request.getParameter("loan_id");
				String uid=(String)session.getAttribute("user");
				Double amt=Double.valueOf(request.getParameter("amount"));
				String appId="";
				int installments=0;
				pst1=con.prepareStatement("select * from customer where user_id='"+uid+"'");
				//pst2=con.prepareStatement("select * from loan_details where loan_id='"+lid+"'");
				pst2=con.prepareStatement("select * from loan_details");
				pst3=con.prepareStatement("insert into loan_applications values(?,?,?,?,?,?,?)");
				rs1=pst1.executeQuery();
				rs2=pst2.executeQuery();
				while(rs2.next()) {
					if(lid.equals(rs2.getString(1))){
						flag1=true;
						session.setAttribute("lid",lid);
						session.setAttribute("amt",amt);
					}
				}
				if(flag1==true){
					pst=con.prepareStatement("select * from loan_details where loan_id='"+lid+"'");
					rs=pst.executeQuery();

					rs.next();
					double rate=rs.getDouble("rate");
					int period=rs.getInt("period");
					double total=amt+(amt*rate/100);
					
					installments=(int)total/period;
					appId=uid.substring(0, 4)+lid;
					
					session.setAttribute("rate",rate);
					session.setAttribute("period",period);
					session.setAttribute("minst",installments);
					session.setAttribute("aid",appId);
					
					
					pst3.setString(1,appId);
					pst3.setString(2,lid);
					pst3.setString(3,uid);
					pst3.setDouble(4,amt);
					pst3.setDouble(5,installments);
					pst3.setInt(6,period);
					pst3.setString(7, "Not Sanctioned");

					pst3.executeQuery();			
					out.println("Added Successfully");
					
				}
				
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
	}
%>
	<%@include file='NavBar.jsp' %>
	<div class="container"> 
	<div class="main">
		<div id="home">
			<br><br>
			<section id="fancyTabWidget" class="tabs t-tabs">
		        <ul class="nav nav-tabs fancyTabs" role="tablist">
		        
		                    <li class="tab fancyTab active">
		                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>	
		                        <a id="tab0" href="#tabBody0" role="tab" aria-controls="tabBody0" aria-selected="true" data-toggle="tab" tabindex="0"><span class="fa fa-inr"></span><span class="hidden-xs">View loan details</span></a>
		                    	<div class="whiteBlock"></div>
		                    </li>
		                    
		                    <li class="tab fancyTab">
		                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>
		                        <a id="tab1" href="#tabBody1" role="tab" aria-controls="tabBody1" aria-selected="true" data-toggle="tab" tabindex="0"><span class="fa fa-info-circle"></span><span class="hidden-xs">Apply for loan</span></a>
		                        <div class="whiteBlock"></div>
		                    </li>
		                    
		                    <li class="tab fancyTab">
		                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>
		                        <a id="tab2" href="#tabBody2" role="tab" aria-controls="tabBody2" aria-selected="true" data-toggle="tab" tabindex="0"><span class="fa fa-check-square"></span><span class="hidden-xs">Know your loan status</span></a>
		                        <div class="whiteBlock"></div>
		                   
		                    </li>
		        </ul>
		        <div id="myTabContent" class="tab-content fancyTabContent" aria-live="polite">
		                    <div class="tab-pane  fade active in" id="tabBody0" role="tabpanel" aria-labelledby="tab0" aria-hidden="false" tabindex="0">
		                        <div>
		                        	<div class="row">
		                                <div class="col-md-12">
		                        			<h2>This is the content of tab one.</h2>
		                                    <p>This field is a rich HTML field with a content editor like others used in Sitefinity. It accepts images, video, tables, text, etc. Street art polaroid microdosing la croix taxidermy. Jean shorts kinfolk distillery lumbersexual pinterest XOXO semiotics. Tilde meggings asymmetrical literally pork belly, heirloom food truck YOLO. Meh echo park lyft typewriter. </p>
		                                   
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="tab-pane  fade" id="tabBody1" role="tabpanel" aria-labelledby="tab1" aria-hidden="true" tabindex="0">
		                        <div class="row">
		                            	<div class="col-md-12">
		                        			 <div class="applyContainer">
												<h1>Apply for loan</h1>
												<form method="post" action="" class="loanForm">
													<p>User ID:<br><%= session.getAttribute("user")%></p>
													<input type="text" placeholder="Enter Loan Id" class="field" name="loan_id">
										      		<input type="text" placeholder="Enter Amount Needed" class="field" name="amount">
													<input type="submit" value="Apply" class="btn" name="apply">
												</form>
											</div>
											<% if("Apply".equals(request.getParameter("apply"))){%>
											<div class="displayContainer">
												<h3>Loan Successfully Applied!</h3>
												<p><b>User ID : </b><%= session.getAttribute("user")== null?"":session.getAttribute("user")%></p>
												<p><b>Loan ID : </b><%= session.getAttribute("lid")== null?"":session.getAttribute("lid")%></p>
												<p><b>Application ID : </b><%= session.getAttribute("aid")== null?"":session.getAttribute("aid")%></p>
												<p><b>Amount : </b><%= session.getAttribute("amt")== null?"":session.getAttribute("amt")%></p>
												<p><b>Rate : </b><%= session.getAttribute("rate")== null?"":session.getAttribute("rate")%></p>
												<p><b>Installments : </b><%= session.getAttribute("minst")== null?"":session.getAttribute("minst")%></p>
											</div>
											<%} %>
		                                </div>
		                            </div>
		                    </div>
		                    <div class="tab-pane  fade" id="tabBody2" role="tabpanel" aria-labelledby="tab2" aria-hidden="true" tabindex="0">
		                        <div class="row">
		                                <div class="col-md-12">
		                        			<h2>This is the content of tab three.</h2>
		                                    <p>This field is a rich HTML field with a content editor like others used in Sitefinity. It accepts images, video, tables, text, etc. Street art polaroid microdosing la croix taxidermy. Jean shorts kinfolk distillery lumbersexual pinterest XOXO semiotics. Tilde meggings asymmetrical literally pork belly, heirloom food truck YOLO. Meh echo park lyft typewriter. </p>
		                                  
		                                </div>
		                            </div>
		                    </div>
		        </div>
		
		    </section>
		</div>
		
		<div id="about">
			<%@include file='aboutus.jsp'%>
		</div>
		<div id="contact">
			<%@include file='contact.jsp'%>
    	</div>
	</div>
	</div>

</body>
</html>

