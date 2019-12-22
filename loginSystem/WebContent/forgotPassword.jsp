<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet "href="css\ForgetPasswordcss.css" type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot Password</title>
</head>
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
        <a href="HomePage.jsp">Home</a>
	    </div>
	
   <div class="main">
        <img src="image\busimage4.jpg" alt="budget" width="100%" height="500px">
	</div>
	<div class="bottom">
	    <center>
	    <fieldset  style="width:150%;border-radius:30px;height:400px; border-color: skyblue;background-color:skyblue" ;>
        <legend>BLUE BIRD TRAVELS</legend>
        
		<center>
		
		<%if(request.getAttribute("update_password_msg")!=null){%>
      			<h4 style="color:red; fon-size:30px;">
     				 <%=request.getAttribute("update_password_msg")%>
      			</h4>
  			<%} %>
	     <h3>Forget Password</h3>
		<form action="ForgotPasswordController" method="post">
		<p>Email Id</p>
			<input type="text" name="email" placeholder="enter email id">
			<p>New password</p>
			<input type="password" name="newpassword" placeholder="enter new password">
			<p>Confirm password</p>
			<input type="password" name="confirmpassword" placeholder="confirm password"><br><br>
			
			<input type="submit" value="submit">
		</div>
		</form>
	</fieldset>
</body>
</html>