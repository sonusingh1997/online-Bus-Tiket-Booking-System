<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="project.com.Bus1" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Search Buses</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="css\showSearchBusescss1.css">
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
        <a href="HomePage.jsp">Home</a>
</div>
	<div class="main">
        <img src="image\busimage4.jpg" alt="budget" width="100%" height="600px">
	</div>
<div class="bottom">
		
	    	<fieldset  style="width:128.5%; height:590px;border-radius:20px; border-color:skyblue; background-color:#87ceeba3 ;">
        	<legend>BLUE BIRD TRAVELS</legend>
       
	
<%if(request.getAttribute("bus_found_msg")!=null){ %>
		<h1 style="color:green"><%=request.getAttribute("bus_found_msg") %></h1>
	<%} %>

	<% 
	 List<Bus1> buslist =(List<Bus1>)request.getAttribute("buslist");
	%>
	
	<div class="panel"><h2>Available Bus List</h2></div>
	<div class="row">
	<div class="col-12">
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
		<th>Click</th>
	</tr>
	</thead>
	<tbody>
	<% for(Bus1 bus1 : buslist) {
	%>
	<tr>
	    <td><%=bus1.getBusId()%></td>
		<td><%=bus1.getBusNo()%></td>
		<td><%=bus1.getBusType()%></td>
		<td><%=bus1.getTotalSeats()%></td>
		<td><%=bus1.getOwnerName()%></td>
		<td><%=bus1.getSource()%></td>
		<td><%=bus1.getDestination()%></td>
		<td><%=bus1.getDepartureTime()%></td>
		<td><%=bus1.getArrivalTime()%></td>
	
		<td>
			<form action="booknowcontroller" method="post">
			<input type="text" hidden name="busno" value="<%=bus1.getBusNo()%>">
			<input type="text" hidden name="seats" value="<%=bus1.getTotalSeats()%>">
			<input type="text" hidden name="bustype" value="<%=bus1.getBusType()%>">
			<button type="submit" class="btn btn-primary">Select Bus</button>
			</form>
		
		</td>
	</tr>
	<% }%>
	</tbody>
	</table>
</div></div>
</body>
</html>