<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
        HttpSession session;
        String Price;
	 %>
	 
	 <%
	 	try{
	 		session=request.getSession();
	 		int price=Integer.parseInt(request.getParameter("price"));
			 Price = Integer.toString(price);
	 		
	 	}catch(Exception e){}
	 %>
<html>
<title>Card Payment</title>
        <head>
            <link rel="stylesheet "href="css\creditcardcss.css" type="text/css"/>
		
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
	<%
    session=request.getSession();
	String name="";
	 name = (String)session.getAttribute("name");
	 %>
		<div class="headerlogo">
		<div class="logo1">
		    <img src="image\login.png" width="4%" height="10%" align=
                "right">
                 <h2 align="right" style="position:relative; left:150px; top:-5px;"><%=name %></h2>
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
	        
	 
        <a href="About_Us.html">About Us</a>
        <a href="homePage.html">Home</a>
	    </div>
	
    
	<div class="main">
        <img src="image\busimage4.jpg" alt="budget" width="100%" height="700px">
	</div>
	<div class="bottom">
	    <center>
	    <fieldset  style="width:160%;border-radius:30px;height:460px; border-color: skyblue;background-color:#87ceeba3" ;>
        <legend>BLUE BIRD TRAVELS</legend>
        
		<center>
  <h3>Payment Here</h3>
        <form action="paymentcontroller" method="post">
		     <p class="spc">Card number</p><input  type="Number" name="cardno" placeholder="enter card number"required><br>
		<p class="spc">Card Holder name </p><input   type="text" name="name" placeholder="enter card holder name"required><br>
		<p class="spc">Card Valid Up_To </p><input   type="date" name="validupto" placeholder="enter expiry date of card"required><br>
		<p class="spc">cvv_number</p><input type="password" name="cvv" placeholder="cvv no"required><br>
	    <p class="spc">Amount To Paid</p><input  type="text" readonly name="price" value="<%=Price%>"><br></br>
		<input  type="submit" value="pay">
	
	</form>
	    </fieldset>
	</div>
	
	</body>
</html>