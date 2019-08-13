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
	.loanDetailsContainer{
    		font-family: Helvetica Neue, Arial, sans-serif; 
    	}
		
		..loanDetailsContainer h1, table { 
			text-align: center; 
    		margin:0;
		}
		
		.loanDetailsContainer table {
			border-collapse: collapse;  
			width: 80%; 
			margin: 0 auto 5rem;
		}
		
		.loanDetailsContainer th, td { 
			padding: 2.5%; 
		}
		
		.loanDetailsContainer tr {
			background: #fff; 
		}
		
		.loanDetailsContainer tr, td { 
			transition: .3s ease-in; 
		} 
		.loanDetailsContainer td{
			font-size:16px;
		}
		.loanDetailsContainer td:empty {
			background: #bfbfbf; 
		}
		.loanDetailsContainer tr:first-child {
			background: #262626; 
			color:#ffffff;
		}
		.loanDetailsContainer tr:hover:not(#firstrow){
			background: #e6e6e6;
			pointer-events: visible;
			color:#000;
		}
		
		.viewStatusContainer{
    		font-family: Helvetica Neue, Arial, sans-serif; 
    	}
		
		..viewStatusContainer h1, table { 
			text-align: center; 
    		margin:0;
		}
		
		.viewStatusContainer table {
			border-collapse: collapse;  
			width: 80%; 
			margin: 0 auto 5rem;
		}
		
		.viewStatusContainer th, td { 
			padding: 3.5%; 
		}
		
		.viewStatusContainer th{ 
			padding: 2.5% 0 2.5% 10%; 
		}
		.viewStatusContainer tr {
			background: #fff; 
		}
		
		.viewStatusContainer tr, td { 
			transition: .3s ease-in; 
		} 
		.viewStatusContainer td,th{
			font-size:18px;
		}
		.viewStatusContainer td:empty {
			background: #bfbfbf; 
		}
		.viewStatusContainer tr:first-child {
			background: #262626; 
			color:#ffffff;
		}
		.viewStatusContainer tr:hover:not(#firstrow1){
			background: #e6e6e6;
			pointer-events: visible;
			color:#000;
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
			margin-left:0;
		}
		#contact{
			margin-left:0;
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
		        
		                    <li class="tab fancyTab">
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
		                    <div class="tab-pane  fade " id="tabBody0" role="tabpanel" aria-labelledby="tab0" aria-hidden="false" tabindex="0">
		                        <div>
		                        	<div class="row">
		                                <div class="col-md-12">
		                                   	<div class="loanDetailsContainer">
												<h1 style="font-size:40px;font-weight:bold;text-align:center;">Loan Details</h1>
											
												<table id="">
													<tr id="firstrow">
														<th>Loan ID</th>
														<th>Type</th>
														<th>Period</th>
														<th>Rate of Interest</th>
														<th>Special Features</th>
													</tr>
													<%
														String lid,type,sp;
														int prd;
														double rate;
														if(conTrue){
															PreparedStatement ps=null;
															ResultSet rs4=null;
															PrintWriter pw1=response.getWriter();
															try{
																ps=con.prepareStatement("select * from loan_details");
																rs4=ps.executeQuery();
																while(rs4.next()) {
																	lid=rs4.getString(1);
																	type=rs4.getString(2);
																	prd=rs4.getInt(3);
																	rate=rs4.getDouble(4);
																	sp=rs4.getString(5);
																	%>
																	<tr>
																		<td><%=lid%></td>
																		<td><%=type%></td>
																		<td><%=prd%></td>
																		<td><%=rate%></td>
																		<td><%=sp%></td>
																	</tr>
																	<%
																}
															}catch(Exception e){
																e.printStackTrace();
															}
														}
													%>
												</table>
											</div>
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
		                        			<div class="viewStatusContainer">
												<h1 style="font-size:40px;font-weight:bold;text-align:center;">Your Loan Status</h1>
											
												<table id="">
													<%
														String uid;
														if(conTrue){
															PreparedStatement ps1=null;
															ResultSet rs5=null;
															String aid,amt,status;
															int minst;
															uid=(String)session.getAttribute("user");
															PrintWriter pw1=response.getWriter();
															try{
																ps1=con.prepareStatement("select * from loan_applications where user_id='"+uid+"'");
																rs5=ps1.executeQuery();
																rs5.next();
																aid=rs5.getString(1);
																lid=rs5.getString(2);
																amt=rs5.getString(4);
																minst=rs5.getInt(5);
																prd=rs5.getInt(6);
																status=rs5.getString(7);
																%>
																<tr id="firstrow1">
																	<th>Application ID</th>
																	<td><%=aid%></td>
																</tr>
																<tr>
																	<th>Loan ID</th>
																	<td><%=lid%></td>
																</tr>
																<tr>
																	<th>User ID</th>
																	<td><%=uid%></td>
																</tr>
																<tr>
																	<th>Amount</th>
																	<td><%=amt%></td>
																</tr>
																<tr>
																	<th>Monthly Installment</th>
																	<td><%=minst%></td>
																</tr>
																<tr>
																	<th>Period</th>
																	<td><%=prd%></td>
																</tr>
																<tr>
																	<th>Status</th>
																	<td><%=status%></td>
																</tr>
																<%
															}catch(Exception e){
																e.printStackTrace();
															}
														}
													%>
												</table>
											</div>
		                                </div>
		                                </div>
		                        </div>
		                    </div>
		            </section>
		        </div>
		
		</div>
		<div id="contact">
			<%@include file='contact.jsp'%>
    	</div>
	</div>

</body>
</html>
