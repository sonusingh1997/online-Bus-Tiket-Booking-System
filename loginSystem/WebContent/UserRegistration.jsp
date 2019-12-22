<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet "href="css\userRegistercss.css" type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Registration</title>
</head>
<style>
.spc{
margin-top: 0px;
margin-bottom: 4px;
}
</style>
<div class="logo">
			<img src="image\buslogo5.png" width="5%" height="5%" align=
                "left">
		</div>
	
		<div class="headerlogo">
			<div class="logo1">

			</div>
		    
		</div>
		<div class="title">
		
            <b><h2 id= "myHeader" >Online BusTicket Booking System</h2></b>
        </div>
        
		<body>
<div class="topnav">
        <a href="About_Us.jsp">About Us</a>
        <a href="UserHome.jsp">Home</a>
	    </div>
	    <div class="main">
        <img src="image\busimage4.jpg" alt="budget" width="100%" height="650px">
	</div>
	<div class="bottom">
	    <center>
	    <fieldset  style="width:180%;border-radius:30px;height:570px; border-color: skyblue;background-color:#87ceeba3" ;>
        <legend>BLUE BIRD TRAVELS</legend>
        
		<center>
	<h4>Register here<h4>
	<form action="register" method="post">
		<p class="spc">Name</p><input type="text" name="user_name" placeholder="Enter Name" required><br>
		<p class="spc">Age</p><input type="text" name="user_age" placeholder="Enter Age" required><br>
		<p class="spc">city</p><input type="text" name="user_city" placeholder="Enter City" required><br>
		<p class="spc">State</p><input type="text" name="user_state" placeholder="Enter State" required><br>
		<p class="spc">Email id</p><input type="text" name="user_email_id" placeholder="Enter EmailId"  required><br>
		<p class="spc">Password</p><input type="password" name="user_password" placeholder="Enter Password"  required><br>
		<p class="spc">Mobile</p><input type="text" name="mobile" placeholder="Enter Mobile" required>
		<br>
		</br>
		<input type="submit" value="register"required>
	</div>
	</form>
</fieldset>
</body>
</html>