<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="project.com.Ticket" %>
<%@ page import="java.util.List" %>

	<%
    session=request.getSession();
 	String id=(String)session.getAttribute("email");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ticket Status</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="css\ticketStatuscss.css">
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
            <a href="">
		    <form action="LogoutServletController" method="post">
		    <button class="stn"type="Submit" name="logout">Logout</button>
		    </form>
		    </a>
        <a href="About_Us.jsp">About Us</a>
        <a href="HomePage.jsp">Home</a>
</div>
	<div class="main">
        <img src="image\busimage4.jpg" alt="budget" width="100%" height="550px">
	</div>
<div class="bottom">
		
	    	<fieldset  style="width:158.5%; height:550px;border-radius:20px; border-color:skyblue; background-color:#87ceeba3 ;">
        	<legend>BLUE BIRD TRAVELS</legend>
       
	

	<% 
	 List<Ticket> ticketList =(List<Ticket>)request.getAttribute("ticketList");
	%>
	
	<div class="panel"><h2>Your booked ticket status</h2></div>
	<div class="row">
	<div class="col-12">
<table class="table">
  <thead class="thead-dark">
	<tr>
		<th>userId</th>
		<th>TicketId</th>
		<th>BusNo</th>
		<th>BusType</th>
		<th>BookedSeat</th>
		<th>Source</th>
		<th>Destination</th>
		<th>Departure Time</th>
		<th>Arrival Time</th>
		<th>Cancel Ticket</th>
	</tr>
	</thead>
	<tbody>
	<% for(Ticket ticket : ticketList) {
		String val = ticket.getBookedSeat();
		int v=val.length()/2;
		System.out.println(v);
		String s="";
			for(int i=0;i<val.length();i=i+2){
				s = val.substring(i,i+2);%>
	<tr>
		<td><%=id%></td>
	    <td><%=ticket.getTicketId() %></td>
		<td><%=ticket.getBusNo()%></td>
		<td><%=ticket.getBusType()%></td>
		<td><%=s %></td>
		<td><%=ticket.getSource()%></td>
		<td><%=ticket.getDes()%></td>
		<td><%=ticket.getDepartureTime()%></td>
		<td><%=ticket.getArrivalTime()%></td>
		<td>
		<form action="cancelticketcontroller" method="Post">
		<input type="text" hidden name="seatStr" value="<%=ticket.getBookedSeat() %>">
		<input type="text" hidden name="seatno" value="<%=s %>">
		<input type="text" hidden name="busno" value="<%=ticket.getBusNo() %>">
		<input type="text" hidden name="ticketid" value="<%=ticket.getTicketId() %>">
		<input type="text" hidden name="userId" value="<%=id %>">
		<Button type="Submit">Cancel</Button>
		</form>
		</td>
	</tr>
	<% }} %>
	</tbody>
	</table>
</div></div>
</body>
</html>