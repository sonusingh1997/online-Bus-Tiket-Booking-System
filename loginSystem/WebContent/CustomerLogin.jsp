<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
  String oldId  = "";
   if(request.getAttribute("enteredLoginId")!=null){ 
  	oldId  = (String)request.getAttribute("enteredLoginId");
   }
  %>
<html>

        <head>
            <link rel="stylesheet "href="css\BusLoginPage.css" type="text/css"/>
		
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
		    <a href="UserRegistration.jsp">SignUp</a>
		</div>
		<div class="title">
		
            <b><h2 id= "myHeader" >Online BusTicket Booking System</h2></b>
        </div>
		
    <body>
	 <div class="topnav">
        <a href="About_Us.jsp">About Us</a>
        <a href="CustomerLogin.jsp">Home</a>
	    </div>
	
    
	<div class="main">
        <img src="image\busimage4.jpg" alt="budget" width="100%" height="500px">
	</div>
	<div class="bottom">
	    <center>
	    <fieldset  style="width:150%;border-radius:30px;height:400px; border-color: skyblue;background-color:#87ceeba3" ;>
        <legend>BLUE BIRD TRAVELS</legend>
        
		<center>
<h3>Login Here</h3>
  			<%if(request.getAttribute("login_error_msg")!=null){%>
      			<h4 style="color:red; fon-size:30px;">
     				 <%=request.getAttribute("login_error_msg")%>
      			</h4>
  			<%} %>
            <%if(request.getAttribute("session_msg")!=null){%>
      			<h4 style="color:red; fon-size:30px;">
     				 <%=request.getAttribute("session_msg")%>
      			</h4>	
  			<%} %>
  			<%if(request.getAttribute("update_password_msg")!=null){%>
      			<h4 style="color:red; fon-size:30px;">
     				 <%=request.getAttribute("update_password_msg")%>
      			</h4>
  			<%} %>
        <form  action="CustomerLogin" method="post">
        	
            <p>Email Id</p>
			  <input type="Email"  name="c_login"  placeholder="Enter User Id" value="<%=oldId %>" required/>
			  <p>Password</p>
			  <input type="password" name="c_login_password" placeholder="Enter Password" required/>
			  </br>
			  
			  
			<br><input type="submit" value="login">
			<br>
			<br>
			</br>
	        <a href="forgotPassword.jsp">Forget password?</a>
			  </form>
        </form>
	    </fieldset>
	</div>
	
	</body>
</html>