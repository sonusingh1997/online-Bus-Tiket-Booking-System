<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="project.com.User"%>  
  <%-- if(request.getAttribute("email")!=null)
  {
	  RequestDispatcher rd 
		 = request.getRequestDispatcher("CustomerLogin.jsp");
		 rd.forward(request, response);
  } --%>
  
    <%
    session=request.getSession();
    User user =null;
	String name="";
	 name = (String)session.getAttribute("name");
	 System.out.println(name);
	if(name!=null){
		// user = (User)session.getAttribute("user");
		 name = (String)session.getAttribute("name");
		 System.out.println("Inside If");
		 System.out.println(name);
	}else{
		RequestDispatcher rd 
		 = request.getRequestDispatcher("CustomerLogin.jsp");
		 rd.forward(request, response);
	}
 	String id=(String)session.getAttribute("email");
 	
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>User Home</title>
        <head>
            <link rel="stylesheet "href="css\homecss.css" type="text/css"/>
		
        </head>
		<div class="logo">
			<img src="image\buslogo5.png" width="5%" height="5%" align=
                "left">
		</div>
		
		<div class="headerlogo">
			<div class="logo1"  >
			
				<img src="image\login.png" width="4%" height="10%" align=
					"right">
					<h2 align="right" style="position:relative; left:147px; top:-8px;"><%=name %></h2>
			</div>
			
		    <!-- <a href="BusSignupPage.jsp">SignUp</a>
		    <a href="BusloginPage.jsp">Login/</a> -->
		    
		</div>
		<div class="title">
			<!-- <img src="Image\logo.png" width="25%" height="5%"> -->
            <b><h2 id= "myHeader" >Online BusTicket Booking System</h2></b> 
        </div>
		
    <body>
	 <div class="topnav">
		    <a href="">
		    <form action="LogoutServletController" method="post">
		    <button class="stn"type="Submit" name="logout">Logout</button>
		    </form>
		    </a>
	        <a href="About_Us.jsp">About Us</a>
	        <a href="UserHome.jsp">Home</a>
	 </div>
	
    
	<div class="main">
        <img src="image\busimage4.jpg" alt="budget" width="100%" height="500px">
	</div>
	
	
	<div class="btn">
	<%if(request.getAttribute("booking_msg")!=null){%>
      			<h4 style="color:deepblue; font-size:30px;">
     				 <%=request.getAttribute("booking_msg")%>
      			</h4>
  			<%} %>
	<%if(request.getAttribute("cancel_ticket_msg")!=null){%>
      			<h4 style="color:deepblue; font-size:30px;">
     				 <%=request.getAttribute("cancel_ticket_msg")%>
      			</h4>
  			<%} %>
  			<%if(request.getAttribute("bus_not_found_msg")!=null){ %>
				<h4 style="color:deepblue"><%=request.getAttribute("bus_not_found_msg")%></h1>
			<%} %>
		<form action="TicketStatusController" method="post">
			<button class="btn1" type="submit">Ticket Status</button>
		</form>
	</div>
	<div class="bottom">
	    
	    <fieldset  style="width:100%;border-radius:20px; border-color: DeepBlue";>
        	<legend>BLUE BIRD TRAVELS</legend>
        	
  			
			<legend>_________________________________________________Onward Date____________________</legend>
 
	        <form  action="SearchBuses" method="post">
	            <table border='1' bgcolor='RoyalBlue' width="100%">
				    <tr>
					    <td><input type='text' name="source" placeholder="FROM" tabindex="1" required/></td>
					    <td> <input type='text' name="destination" placeholder="TO" tabindex="2" required/>
 <!--   <select name="destination" required>

  <option value="1">Agra</option>
  <option value="2">Gwaliour</option>
  <option value="3">Katni</option>
  <option value="4">Nagpur</option>
  <option value="5">Raipur</option>
</select> -->
					    </td>
					     
					    
					   <td><input type="date" placeholder="DATE Of Travel" tabindex="4" required/></td>
					    <td  colspan='2' align='right'>
					    <input type='submit' name="submit"  value='Search Buses'>  
			    	</tr>
		 		</table>
	        </form>
	    </fieldset>
	</div>
	
		<div class="top_center">
		    <marquee behaviour="alternate" id="mid1">
		        <right><font size="5"><b>Traveling Is Easier than You Think!!</b></font></right>
		    </marquee>
		</div>
	    
	
	</body>
	

</html>