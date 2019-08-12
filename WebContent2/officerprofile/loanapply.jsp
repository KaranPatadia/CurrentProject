<!DOCTYPE html>
<html>
<head>
<style>
*{
			box-sizing: border-box;
		}
		body{
			background-color: #000000;
			font-family: "Arial", sans-serif;
			padding: 50px;
		}
		.container{
			margin: 20px auto;
			padding: 10px;
			width: 300px;
			height: 400px;
			background-color: #fff;
			border-radius: 5px;
		}
		 h1{
		 	width: 70%;
			color: #000000;
			font-size: 32px;
			margin: 28px auto;
			margin-bottom: 20px;
			text-align: center;
			/*padding-top: 40px;*/
		}
		form{
			/*padding: 15px;*/
			text-align: center;
		}
		input{
			padding: 12px 0;
			margin-bottom: 10px;
			border-radius: 3px;
			border: 2px solid transparent;
			text-align: center;
			width: 90%;
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
		.pass-link{
			text-align: center;
		}
		.pass-link a:link,
		.pass-link a:visited{
			font-size: 12px;
			color: #777;
		}

</style>
</head>


<body>
<div class="container">
			<h1>Apply for loan</h1>
		<form action="#" method="POST">
			<input type="text" placeholder="loan id" class="field">
			<input type="text" placeholder="user id" class="field">
      <input type="text" placeholder="amount needed" class="field">
			<input type="submit" value="apply" class="btn">
		</form>
	</div>
</html>