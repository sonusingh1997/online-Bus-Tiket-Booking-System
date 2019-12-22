<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet "href="css\ForgetPasswordcss.css" type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Login</title>
</head>
<div class="logo">
			<img src="image\buslogo5.png" width="5%" height="5%" align=
                "left">
		</div>
	
		<div class="headerlogo">
			<div class="logo1">
		    	<img src="image\login.png" width="4%" height="10%" align=
                "right">
			</div>
		    <a href="AdminRegister.jsp">SignUp</a>
		</div>
		<div class="title">
		
            <b><h2 id= "myHeader" >Online BusTicket Booking System</h2></b>
        </div>
		
    <body>
     <div class="topnav">
        <a href="About_Us.jsp">About Us</a>
        <a href="AdminLogin.jsp">Home</a>
	    </div>
	
    
	<div class="main">
        <img src="image\busimage4.jpg" alt="budget" width="100%" height="500px">
	</div>
	<div class="bottom">
	    <center>
	    <fieldset  style="width:150%;border-radius:30px;height:350px; border-color: skyblue;background-color:skyblue" ;>
        <legend>BLUE BIRD TRAVELS</legend>
        
		<center>
  <h3>Admin Login Here</h3>
	<% if(request.getAttribute("login_msg")!=null){%>
		<h3 style="color : green;">
		<%=request.getAttribute("login_msg")%>
		</h3>
	<% }%>
	<% if(request.getAttribute("login_error_msg")!=null){%>
		<h3 style="color : red;">
		<%=request.getAttribute("login_error_msg")%>
		</h3>
	<% }%>
	<%
		String oldId="";
		if(request.getAttribute("enteredLoginId")!=null){
			oldId=(String)request.getAttribute("enteredLoginId");
		}
	%>
	<form action="adlogin" method="post" >
	<p>Email Id</p>
		<input type="text" name="a_login" placeholder="Enter User Id" value value="<%=oldId%>">
		<p>Password</p>
		<input type="password" name="a_login_password"placeholder="Enter password">
		<br>
		</br>
		<input type="submit" value="alogin">
	</div>
	</form>
	</fieldset>
</body>
</html>