<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet "href="css\busregistercss.css" type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>busregistration</title>
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
        <a href="BusRegistration.jsp">Home</a>
	    </div>
	    <div class="main">
        <img src="image\busimage4.jpg" alt="budget" width="100%" height="730px">
	</div>
	<div class="bottom">
	    <center>
	    <fieldset  style="width:200%;border-radius:30px;height:650px; border-color: skyblue;background-color:skyblue" ;>
        <legend>BLUE BIRD TRAVELS</legend>
        
		<center>
<h4>Admin Add Bus<h4>
<form action="busregistration" method="post">
	<p class="spc">BusNo<p><input type="text" name="bus_number" placeholder="Enter Bus Number." required>
	<br>
	<p class="spc">BusType</p><input type="radio"  name="bus_type" value="ac">ac
	<input type="radio" name="bus_type" value="non-ac">non-ac<br>
	<p class="spc">TotalSeats</p><input type="text" name="bus_total_seats"placeholder="Enter Total Seat." required><br>
	<p class="spc">OwnerName</p><input type="text" name="bus_owner"placeholder="Enter Owner Name." required><br>
	<p class="spc">Source</p><input type="text" name="source"placeholder="Enter Source." required><br>
	<p class="spc">Destination</p><input type="text" name="destination"placeholder="Enter Destination." required><br>
	<p class="spc">Departature_Time</p><input type="text" name="departure_time"placeholder="Enter Departature time." required><br>
	<p class="spc">Arrival_Time</p><input type="text" name="arrival_time"placeholder="Enter Arrival time." required>
	<br>
	<input type="submit" value="register">
	
	</form>
</body>
</html>