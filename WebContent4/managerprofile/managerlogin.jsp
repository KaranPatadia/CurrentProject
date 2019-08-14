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
	<script src="managerloginscript.js"></script>
	<style>
	body{
	  background-color: #000000;
	}
		.container {
	  margin-top:30px;
	  margin-left:12%;
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
	  width:33.3%;
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
		background-color:#f9f9f9;
		box-shadow: 0 0 0 1px #ddd;
	}
	
	.nav-tabs > li.fancyTab.active:hover {
	  background-color:#fff;
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
	  background: #fff;
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
	
	
	@media only screen and (max-width: 1200px) {
	  
	  .fancyTab .fa {
	  	font-size: 36px;
	  }
	  
	  .fancyTab .hidden-xs {
	    font-size:22px;
		}
			
	}
		
		
	@media only screen and (max-width: 992px) {
	    
	  .fancyTab .fa {
	  	font-size: 33px;
	  }
	    
	  .fancyTab .hidden-xs {
	  	font-size:18px;
	    font-weight:normal;
	  }
			
	}
		
		
	@media only screen and (max-width: 768px) {
	    
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
	@media only screen and (max-width: 567px) {
	    
	  .fancyTab > a {
	    font-size:12px;
	  }
	    
	  .nav > li.fancyTab > a {
	    padding:12px 0;
	    margin-bottom:inherit;
	  }
	    
	  .fancyTab .fa {
	    font-size:25px;
	  }
	    
	  .nav-tabs > li.fancyTab > a {
	    border-right:1px solid transparent;
	    padding-bottom:0;
	  }
	    
	  .fancyTab.active .fa {
	    color: #333;
		}
			
	}
	.userLoanContainer{
    		font-family: Helvetica Neue, Arial, sans-serif; 
    	}
		
		..userLoanContainer h1, table { 
			text-align: center; 
    		margin:0;
		}
		
		.userLoanContainer table {
			border-collapse: collapse;  
			width: 80%; 
			margin: 0 auto 5rem;
		}
		.userLoanContainer th, td { 
			padding: 2.5% 0 2.5% 0; 
		}
		.userLoanContainer th{ 
			padding: 2.5% 0 2.5% 10%; 
		}
		
		.userLoanContainer tr {
			background: #fff; 
		}
		
		.userLoanContainer tr, td { 
			transition: .00001s ease-in; 
		} 
		.userLoanContainer td{
			font-size:16px;
		}
		.userLoanContainer tr:first-child {
			background: #666666; 
			color:#ffffff;
		}
		
		.userLoanContainer tr:hover{
			background: #595959;
			color:#008000; 
			pointer-events: visible;
			color:#fff;
			opacity:0.5;
		}.loanDetailsContainer{
    		font-family: Helvetica Neue, Arial, sans-serif; 
    	}
		
		..loanDetailsContainer h1, table { 
			text-align: center; 
    		margin:0;
		}
		
		.loanDetailsContainer table {
			border-collapse: collapse;  
			width: 80%; 
			margin: 0 auto 0;
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
		.userLoanForm input{
			padding: 12px 0;
			margin-bottom: 10px;
			border-radius: 3px;
			border: 2px solid transparent;
			text-align: center;
			width: 100%;
			font-size: 16px;
			transition: border .2s, background-color .2s;
			
		}
		form .field{
			background-color: #ECF0F1;
			transition: all 1s cubic-bezier(.64,.09,.08,1);
		}
		form .field:focus {
			border-bottom: 3px solid #000;
		}
		form .btn{
			background-color:#000000;
			color: #fff;
			line-height: 25px;
			cursor: pointer;
		}
		form .btn:hover,
		form .btn:active {
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
		.statusContainer{
	  overflow: hidden;
	  outline: none;
	}
	
	.sbtn{
		padding: 12px 0;
		margin-bottom: 10px;
		border-radius: 3px;
		border: 2px solid transparent;
		text-align: center;
		width: 100%;
		font-size: 16px;
		transition: border .2s, background-color .2s;
		background-color:#000000;
		color: #fff;
		line-height: 25px;
		cursor: pointer;
	}
	.snackbar {
		left: 50%;
		bottom: 0;
		z-index: 3;
		width: 60%;
		height: 0px;
		margin-left: -30%;
		line-height: 50px;
		position: absolute;
		background-color: white;
		transition: all .3s;
	  border-top: 0px;
		overflow: hidden;
	}
	
	.snackbar.active {
		height: 50px;
	  border-top: 2px solid #222222;
	}
	
	.snackbar > span {
		border: 0;
		float: left;
		color: #222222;
		cursor: pointer;
		font-size: 15px;
		margin-left: 3%;
	  font-weight: bold;
		font-family: 'Lato';
		background: transparent;
		text-transform: uppercase;
	}
	
	.snackbar > button {
		border: 0;
	  width:15%;
	  height:100%;
		float: right;
		color: #222222;
		display: block;
		cursor: pointer;
	  font: 16px 'Lato';
		position: relative;
		background: transparent;
	}
	#myDIV {
	  text-align: center;
 		transition: 1s ease-in;
	}
	.modal-container{
	  width: 560px;
	  position: fixed;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  z-index: 3;
	  background-color: #000;
	  color:#fff;
	  padding: 40px;
	  border-radius: 10%;
	  font-family: Arial, Helvetica, sans-serif !important;
	  border:solid 5px;
	  .fa{
	    color: #f1b434;
	    margin-right: 5px;
	    font-size: 25px;
	  }
	  .modal-title{
	    width: 50%;
	    text-align: center;
	    color: #000000;
	    font-size: 18px;
	    margin-left: 30%;
	    margin-bottom: 30%;
	    font-weight: 600;
	  }
	    .title-text{
	      line-height: 2;
	    }
	  .button-bar{
		margin-left: 18%;
	  	margin-right: 18%;
	  }
	}
	
	.modal-button{
	  font-size: 16px;
	  font-weight: bold;
	  margin-top: 10%;
	  min-width: 165px;
	  max-width: 165px;
	  text-align: center;
	  font-family: Arial;
	  border-radius: 2rem;
	  white-space: nowrap;
	  padding: 5px 10px 5px 10px;
	  cursor: pointer;
	  background-color: #ffffff;
	  border: 2px solid #000000;
	  &:hover{
	    background-color: #000000;
	    color: #ffffff;
	  }
	}
	
	.fl-r{
	  float: right;
	}
	
	.fl-l{
	  float: left;
	}

	.statusContainer input{
		padding: 12px 0;
		margin-bottom: 10px;
		border-radius: 3px;
		border: 2px solid transparent;
		text-align: center;
		width: 100%;
		font-size: 16px;
		transition: border .2s, background-color .2s;
	}
	form .field{
		background-color: #ECF0F1;
	}
	form .field:focus {
		border: 2px solid #000000;
	}
	form .btn{
		background-color:#000000;
		color: #fff;
		line-height: 25px;
		cursor: pointer;
	}
	form .btn:hover,
	form .btn:active {
		background-color: #ffffff;
      	color: #000000;
		border: 2px solid #000000;
    }
    .statusContainer h1, table { 
		text-align: center; 
    	margin:0;
	}
	.statusContainer table {
		border-collapse: collapse;  
		width: 80%; 
		margin: 0 auto 5rem;
	}
	.statusContainer th, td { 
		padding: 2.5% 0 2.5% 0; 
	}
	
	.statusContainer tr {
		background: #fff; 
	}
	
	.statusContainer tr, td { 
		transition: .00001s ease-in; 
	} 
	.statusContainer td{
		font-size:16px;
	}
	.statusContainer tr:first-child {
		background: #666666; 
		color:#ffffff;
	}
		
	.statusContainer tr:hover{
		background: #595959;
		color:#008000; 
		pointer-events: visible;
		color:#fff;
		opacity:0.5;
	}
</style>
</head>
<body>

	<%@include file='NavBar.jsp' %>
	<%@ include file="../connection.jsp" %>
	<div class="container"> 
	<div class="main">
	<section id="fancyTabWidget" class="tabs t-tabs">
        <ul class="nav nav-tabs fancyTabs" role="tablist">
        
                    <li class="tab fancyTab active">
                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>	
                        <a id="tab0" href="#tabBody0" role="tab" aria-controls="tabBody0" aria-selected="true" data-toggle="tab" tabindex="0"><span class="fa fa-user-circle-o"></span><span class="hidden-xs">View loan by user</span></a>
                    	<div class="whiteBlock"></div>
                    </li>
                    
                    <li class="tab fancyTab">
                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>
                        <a id="tab1" href="#tabBody1" role="tab" aria-controls="tabBody1" aria-selected="true" data-toggle="tab" tabindex="0"><span class="fa fa-info-circle"></span><span class="hidden-xs">View all loan details</span></a>
                        <div class="whiteBlock"></div>
                      
                        <li class="tab fancyTab">
                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>
                        <a id="tab2" href="#tabBody2" role="tab" aria-controls="tabBody2" aria-selected="true" data-toggle="tab" tabindex="0"><span class="fa fa-check-circle"></span><span class="hidden-xs">Change status</span></a>
                        <div class="whiteBlock"></div>
                  
        </ul>
        <div id="myTabContent" class="tab-content fancyTabContent" aria-live="polite">
                    <div class="tab-pane  fade active in" id="tabBody0" role="tabpanel" aria-labelledby="tab0" aria-hidden="false" tabindex="0">
                        <div>
                        	<div class="row">
                            	
                                <div class="col-md-12">
                        			<div class="userLoanContainer">
									<form method="get" action="" class="userLoanForm">
										<input type="text" name="user_id" class="field" placeholder="Enter User ID">
										<input type="submit" name="submit" value="View" class="btn">
									</form>
									<%
										if(("View").equals(request.getParameter("submit"))){
												if(conTrue){
													String lid="",type="",sp="",uid="",uid2="";
													String aid="",amt="",status="";
													int prd=0,minst=0;
													boolean flag=false;
													PreparedStatement ps1=null,ps=null;
													ResultSet rs1=null,rs=null;
													uid=request.getParameter("user_id");
													try{
														ps=con.prepareStatement("select * from customer");
														rs=ps.executeQuery();
														while(rs.next()){
															uid2=rs.getString(1);
															if(uid2.equals(uid)){
																flag=true;
																break;
															}
														}
														if(flag){
															ps1=con.prepareStatement("select * from loan_applications where user_id='"+uid+"'");
															rs1=ps1.executeQuery();
															rs1.next();
															aid=rs1.getString(1);
															lid=rs1.getString(2);
															uid=rs1.getString(3);
															amt=rs1.getString(4);
															minst=rs1.getInt(5);
															prd=rs1.getInt(6);
															status=rs1.getString(7);
															%>
															<h1 style="font-size:40px;font-weight:bold;text-align:center;">Loan Details</h1>
															<table id="">
															<tr>
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
															</table>
														<%
														}
														else{
															%>
															<script>
															alert("Invalid Username or Password!")
															</script>
															<%
														}
													}catch(Exception e){
														e.printStackTrace();
													}
												}
										}
									%>
								</div>
                                </div>
                                
                            </div>
                        </div>
                      </div>
                    <div class="tab-pane  fade" id="tabBody1" role="tabpanel" aria-labelledby="tab1" aria-hidden="true" tabindex="0">
                        <div class="row">
                            	
                                <div class="col-md-12">
                        			<div class="loanDetailsContainer container-fluid">
									<h1 style="font-size:40px;font-weight:bold;text-align:center;">Loan Details</h1>
																		
									<table id="">
										<tr id="firstrow">
											<th>Application ID</th>
											<th>Loan ID</th>
											<th>User ID</th>
											<th>Amount</th>
											<th>Monthly Installment</th>
											<th>Period</th>
											<th>Status</th>
										</tr>
										
										<%
											String lid="",type="",sp="",uid="",uid2="";
											String aid="",amt="",status="";
											int prd=0,minst=0;
											if(conTrue){
												PreparedStatement ps=null;
												ResultSet rs=null;
												PrintWriter pw1=response.getWriter();
												try{
													ps=con.prepareStatement("select * from loan_applications");
													rs=ps.executeQuery();
													while(rs.next()) {
														aid=rs.getString(1);
														lid=rs.getString(2);
														uid=rs.getString(3);
														amt=rs.getString(4);
														minst=rs.getInt(5);
														prd=rs.getInt(6);
														status=rs.getString(7);
														%>
														<tr>
															<td><%=aid%></td>
															<td><%=lid%></td>
															<td><%=uid%></td>
															<td><%=amt%></td>
															<td><%=minst%></td>
															<td><%=prd%></td>
															<td><%=status%></td>
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
           <div class="tab-pane  fade" id="tabBody2" role="tabpanel" aria-labelledby="tab2" aria-hidden="true" tabindex="0">
                        <div class="row">
                            	
                                <div class="col-md-12">
                        			<div class="statusContainer container-fluid">
										<form method="post" action="" class="userForm">
											<div id="section1">
												<input type="text" placeholder="username" class="field" name="user">
												<input type="submit" value="Confirm" class="btn" name="confirm">
											</div>
										</form>
										<%
											String mid="",mid2="",pass="";
											boolean flag=false,flag1=false;
											PreparedStatement ps3=null,ps2=null,ps1=null,ps=null;
											ResultSet rs3=null,rs2=null,rs1=null,rs=null;
											session.setAttribute("uid2",request.getParameter("user"));
											mid=(String)session.getAttribute("user");
											if(("Confirm").equals(request.getParameter("confirm"))){
													if(conTrue){
														uid=request.getParameter("user");
														try{
															ps=con.prepareStatement("select * from customer");
															rs=ps.executeQuery();
															while(rs.next()){
																if(rs.getString(1).equals(uid)){
																	flag=true;
																	break;
																}
															}
															if(flag){
																ps1=con.prepareStatement("select * from loan_applications where user_id='"+uid+"'");
																rs1=ps1.executeQuery();
																rs1.next();
																aid=rs1.getString(1);
																lid=rs1.getString(2);
																uid=rs1.getString(3);
																amt=rs1.getString(4);
																minst=rs1.getInt(5);
																prd=rs1.getInt(6);
																status=rs1.getString(7);
																%>
																<h1 style="font-size:40px;font-weight:bold;text-align:center;">Loan Details</h1>
																<table id="">
																<tr>
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
																</table>
															<%
															}
															else{
																%>
																<script>
																alert("Invalid Username or Password!")
																</script>
																<%
															}
														}catch(Exception e){
															e.printStackTrace();
														}
													}
											}
										%>
										<%
												if(("Yes, Confirm").equals(request.getParameter("y"))){
													uid2=request.getParameter("newID");
													mid2=request.getParameter("newMID");
													System.out.println("user id2 : "+uid2);
													if(conTrue){
														try{
															ps3=con.prepareStatement("select * from manager where user_id='"+mid+"'");
															rs3=ps3.executeQuery();
															rs3.next();
															pass=rs3.getString(8);
															System.out.println("Password : "+pass);
															System.out.println("Confirm Password : "+request.getParameter("password"));
															System.out.println("user id : "+uid2);
															System.out.println("manager id : "+mid);
															if(pass.equals(request.getParameter("password"))){
																flag1=true;
															}
															if(flag1){
																ps2=con.prepareStatement("update loan_applications set status='Sanctioned' where user_id=?");
																ps2.setString(1,uid2);
																rs2=ps2.executeQuery();
																
															}
															else{
																%>
																<script>
																alert("Invalid Password!")
																</script>
																<%
															}
														}catch(Exception e){
															e.printStackTrace();
														}
													}
											}
										%>
										<button class="sbtn" onclick="myFunction()" id="sanc">Sanctioned</button>
									
										<div class="modal-container" id="myDIV" style="display:none;">
											<span class="modal-title"><i class="fa fa-exclamation-triangle"></i><span class="title-text">Please Confirm Your Change</span></span>
											<div class="modal-content">
											</div>
											<form method="post" action="" class="tgForm">
												<div class="button-bar">
													<input type="hidden" name="newID" value="<%= uid %>"/>
													<input type="hidden" name="newMID" value="<%= mid %>"/>
													<input type="password" placeholder="password" class="field" name="password">
													<input type="submit" class="modal-button fl-l" value="Yes, Confirm" name="y" onclick="showSnackBar()" style="color:black;">
													<input type="submit" class="modal-button fl-r" value="NO" name="x" onclick="myFunction()" style="color:black;">
												</div>
											</form>
											
										</div>
									
									<div class="snackbar" >
										<span></span>
										<button onclick="hideSnackBar()">OK</button>
									</div>
									<script>
										function myFunction() {
										  var x = document.getElementById("myDIV");
										  if (x.style.display === "none") {
										    x.style.display = "block";
										  } else {
										    x.style.display = "none";
										  }
										}
										
										snackBarSetMessage("Loan Sanctioned");
										function hideSnackBar() {
										  document.querySelector(".snackbar").classList.remove("active");
										}
										
										function showSnackBar() {
										  document.querySelector(".snackbar").classList.add("active");
										}
										
										function snackBarSetMessage(message) {
										  document.querySelector(".snackbar > span").innerHTML = message;
										}
									</script>
									</div>
                                </div>
                            </div>
                    </div>
                    </div>
		    </section>
		
		<div id="contact">
			<%@include file='contact.jsp'%>
		</div>
    </div>
	</div>



</body>
</html>