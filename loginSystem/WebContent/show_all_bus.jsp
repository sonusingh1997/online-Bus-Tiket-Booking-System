<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="project.com.Bus" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Search Buses</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="css\showadminbuscss.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="jquery-1.12.4.min.js"></script>
</head>
<div class="logo">
			<img src="image\buslogo5.png" width="5%" height="5%" align=
                "left">
		</div>
	<%
    session=request.getSession();
	String name="";
	 name = (String)session.getAttribute("name");
	 %>
		<div class="headerlogo">
		<div class="logo1">
		    <img src="image\login.png" width="4%" height="10%" align=
                "right">
                <h2 align="right" style="position:relative; left:158px; top:5px;"><%=name %></h2>
		</div>
		    
		</div>
		<div class="title">
		
            <b><h2 id= "myHeader" >Online BusTicket Booking System</h2></b>
        </div>
		
    


<body>
<div class="topnav">
            <a href="logout">
		    <form action="LogoutServletController" method="post">
		    <button class="stn"type="Submit" name="logout">Logout</button>
		    </form>
		    </a>
	        
        <a href="About_Us.jsp">About Us</a>
        <a href="BusRegistration.jsp">Home</a>
</div>
	<div class="main">
        <img src="image\busimage4.jpg" alt="budget" width="100%" height="1000px">
	</div>
<div class="bottom">
		
	    	<fieldset  style="width:158.5%; height:590px;border-radius:20px; border-color:skyblue; background-color:#87ceeba3 ;">
        	<legend>BLUE BIRD TRAVELS</legend>
       

<%if(request.getParameter("register_msg")!=null){ %>
		<h1>is Record Registered:<%=request.getParameter("register_msg") %></h1>
	<%} %>
	<% 
	List<Bus> busList=(List<Bus>)request.getAttribute("buslist");
	%>
	<table>
	<table class="table">
  <thead class="thead-dark">
	<tr>
		<th>BusId</th>
		<th>BusNo</th>
		<th>BusType</th>
		<th>TotalSeats</th>
		<th>OwnerName</th>
		<th>Source</th>
		<th>Destination</th>
		<th>Departure Time</th>
		<th>Arrival Time</th>
	</tr>
	<%for(Bus bus : busList) {%>
	<tr>
		<td><%=bus.getBusId()%></td>
		<td><%=bus.getBusNo()%></td>
		<td><%=bus.getBusType()%></td>
		<td><%=bus.getTotalSeats()%></td>
		<td><%=bus.getOwnerName()%></td>
		<td><%=bus.getSourceStation()%></td>
		<td><%=bus.getDestinationStation()%></td>
		<td><%=bus.getDepartureTime()%></td>
		<td><%=bus.getArrivalTime()%></td>
		
	</tr>
	<% }%>
	</table>
</body>
</html>