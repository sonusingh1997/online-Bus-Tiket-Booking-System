<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%!
	HttpSession session;
	String busNo;
	String to;
	String seat;
	String s;
	String name;
	String id;
	int seatLength;
	int seatCount;
	int noOfSeat;
	int remainingSeat;
	String sp2="disabled";
	String seatNo="";
 %> 
 <%
 	try{
 	session=request.getSession();
 	busNo=(String)session.getAttribute("busNo");
 	to=(String)session.getAttribute("totalSeat");
 	name=(String)session.getAttribute("name");
 	seat=(String)session.getAttribute("bookedseat");
 	seatNo=(String)session.getAttribute("seatNo");
 	id=(String)session.getAttribute("email");
    name=(String)session.getAttribute("name");
 	System.out.println(seat);
 	seatLength=seat.length();
 	noOfSeat = seatLength/2;
 	System.out.println(seat);

 	}catch(Exception e){}
 %>
 	
 	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Bus View</title>
	<link rel="stylesheet" type="text/css" href="css\mycss.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="jquery-1.12.4.min.js"></script>
</head>
<style>
	.mainn1{
	
		display: flex;
		width:100%;
		background-color:#;
	}
	.n2{
		padding: 10px;

	}
	.disp{
		display: flex;
	}
	.seatcolor{
		background: black;
		color:white;
		font-size: 16px;
		padding: 5px;
		margin: 2px;
	}
	#btn{
		width:120px;
		height:30px;
border-radius:50px;
		display: none;
		
		
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
                <h2 align="right" style="position:relative; left:150px; top:-8px;"><%=name %></h2>
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
        <img src="image\busimage4.jpg" alt="budget" width="100%" height="900px">
	</div>
	<div class="bottom">
		<div class="row-12">
			<div class="col-4"><h2>Bus Number :</span> <%=busNo%> </h2></div>
			<div class="col-5"><h2>Total Seats : <%=to%> </h2></div>
			<div class="col-6"><h2 id="remain"></h2></div>
			<div class="col-7"><h2>Price : 80/per </h2></div>
		</div>
	
	    	<fieldset  style="width:158.5%; height:700px;border-radius:20px; border-color:skyblue; background-color:#87ceeba3 ;">
        	<legend>BLUE BIRD TRAVELS</legend>
       
		<input type="text" id="st1" value="<%=seat %>" hidden name="st" />
		<div class="row">
			<center><h2>Select Desired Seats.<%=name %></h2></center>
		</div>
	
	<div class="mainn1">
          <div class="plane">
  				<div class="exit exit--front fuselage"></div>
				  <ol class="cabin fuselage">
				    <li class="row row--1">
				      <ol class="seats" type="1A">
				        <li class="seat">
				          <input type="checkbox"  name="seat" value="1A"  id="1A" 
				        <%  if(seat.contains("1A")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="1A">1A</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="1B" id="1B" 
				          <%  if(seat.contains("1B")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="1B">1B</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="1C" id="1C" 
				          <%  if(seat.contains("1C")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="1C">1C</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" disabled value="1D" id="1D" 
				          <%  if(seat.contains("1D")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="1D">1D</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" Value="1E" id="1E"
				          <%  if(seat.contains("1E")){%>
				          <%=sp2 %>
				          <% } %>
				           />
				          <label for="1E">1E</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="1F" id="1F" 
				          	<%  if(seat.contains("1F")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="1F">1F</label>
				        </li>
				      </ol>
				    </li>
				    <li class="row row--2">
				      <ol class="seats" type="A">
				        <li class="seat">
				          <input type="checkbox" name="seat" value="2A" id="2A"
				          <%  if(seat.contains("2A")){%>
				          <%=sp2 %>
				          <% } %>
				           />
				          <label for="2A">2A</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="2B" id="2B"
				          <%  if(seat.contains("2B")){%>
				          <%=sp2 %>
				          <% } %>
				           />
				          <label for="2B">2B</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="2C" id="2C" 
				          	<%  if(seat.contains("2C")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="2C">2C</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="2D" id="2D" 
				          	<%  if(seat.contains("2D")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="2D">2D</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="2E" id="2E" 
				          <%  if(seat.contains("2E")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="2E">2E</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="2F" id="2F" 
				          <%  if(seat.contains("2F")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="2F">2F</label>
				        </li>
				      </ol>
				    </li>
				    <li class="row row--3">
				      <ol class="seats" type="A">
				        <li class="seat">
				          <input type="checkbox" name="seat" value="3A" id="3A" 
				          <%  if(seat.contains("3A")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="3A">3A</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox"name="seat" value="3B" id="3B" 
				          <%  if(seat.contains("3B")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="3B">3B</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox"name="seat" value="3C" id="3C" 
				         <%  if(seat.contains("3C")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="3C">3C</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox"name="seat" value="3D" id="3D"
				          	<%  if(seat.contains("3D")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="3D">3D</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="3E"id="3E" 
				          <%  if(seat.contains("3E")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="3E">3E</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox"name="seat" value="3" id="3F" 
				          <%  if(seat.contains("3F")){%>
				          <%=sp2 %>
				          <% } %>
				          
				          />
				          <label for="3F">3F</label>
				        </li>
				      </ol>
				    </li>
				    <li class="row row--4">
				      <ol class="seats" type="A">
				        <li class="seat">
				          <input type="checkbox"name="seat" value="4A" id="4A" 
				          <%  if(seat.contains("4A")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="4A">4A</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox"name="seat" value="4B" id="4B" 
				          <%  if(seat.contains("4B")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="4B">4B</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox"name="seat" value="4C" id="4C" 
				          <%  if(seat.contains("4C")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="4C">4C</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox"name="seat" value="4D" id="4D" 
				          <%  if(seat.contains("4D")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="4D">4D</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox"name="seat" value="4E" id="4E" 
				          <%  if(seat.contains("4E")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="4E">4E</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox"name="seat" value="4F" id="4F" 
				          <%  if(seat.contains("4F")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="4F">4F</label>
				        </li>
				      </ol>
				    </li>
				    <li class="row row--5">
				      <ol class="seats" type="A">
				        <li class="seat">
				          <input type="checkbox" name="seat" id="5A" 
				          <%  if(seat.contains("5A")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="5A">5A</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" id="5B" 
				          <%  if(seat.contains("5B")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="5B">5B</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" id="5C" 
				          <%  if(seat.contains("5C")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="5C">5C</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" id="5D" 
				          <%  if(seat.contains("5D")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="5D">5D</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" id="5E" 
				          <%  if(seat.contains("5E")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="5E">5E</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" id="5F" 
				          <%  if(seat.contains("5F")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="5F">5F</label>
				        </li>
				      </ol>
				    </li>
				    <li class="row row--6">
				      <ol class="seats" type="A">
				        <li class="seat">
				          <input type="checkbox" name="seat" value="6A" id="6A" 
				          <%  if(seat.contains("6A")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="6A">6A</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox"name="seat" value="6B"  id="6B" 
				          <%  if(seat.contains("6B")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="6B">6B</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="6C" id="6C" 
				          <%  if(seat.contains("6C")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="6C">6C</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox"name="seat" value="6D"  id="6D" 
				          	<%  if(seat.contains("6D")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="6D">6D</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="6E" id="6E" 
				          <%  if(seat.contains("6E")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="6E">6E</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="6F" id="6F" 
				          <%  if(seat.contains("6F")){%>
				          <%=sp2 %>
				          <% } %>
				          
				          />
				          <label for="6F">6F</label>
				        </li>
				      </ol>
				    </li>
				    <li class="row row--7">
				      <ol class="seats" type="A">
				        <li class="seat">
				          <input type="checkbox" name="seat" value="7A" id="7A" 
				          <%  if(seat.contains("7A")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="7A">7A</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="7B" id="7B" 
				          <%  if(seat.contains("7B")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="7B">7B</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="7C" id="7C" 
				          <%  if(seat.contains("7C")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="7C">7C</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="7D" id="7D" 
				          <%  if(seat.contains("7D")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="7D">7D</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="7E" id="7E" 
				          <%  if(seat.contains("7E")){%>
				          <%=sp2 %>
				          <% } %>
				          />
				          <label for="7E">7E</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="7F" id="7F" />
				          <label for="7F">7F</label>
				        </li>
				      </ol>
				    </li>
				    <li class="row row--8">
				      <ol class="seats" type="A">
				        <li class="seat">
				          <input type="checkbox" name="seat" value="8A" id="8A" />
				          <label for="8A">8A</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="8B" id="8B" />
				          <label for="8B">8B</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="8C" id="8C" />
				          <label for="8C">8C</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="8D" id="8D" />
				          <label for="8D">8D</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="8E" id="8E" />
				          <label for="8E">8E</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="8F" id="8F" />
				          <label for="8F">8F</label>
				        </li>
				      </ol>
				    </li>
				    <li class="row row--9">
				      <ol class="seats" type="A">
				        <li class="seat">
				          <input type="checkbox" name="seat" value="9A" id="9A" />
				          <label for="9A">9A</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="9B" id="9B" />
				          <label for="9B">9B</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="9C" id="9C" />
				          <label for="9C">9C</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="9D" id="9D" />
				          <label for="9D">9D</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="9E" id="9E" />
				          <label for="9E">9E</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="9F" id="9F" />
				          <label for="9F">9F</label>
				        </li>
				      </ol>
				    </li>
				    <li class="row row--10">
				      <ol class="seats" type="A">
				        <li class="seat">
				          <input type="checkbox" name="seat" value="10A" id="10A" />
				          <label for="10A">10A</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="10B" id="10B" />
				          <label for="10B">10B</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="10C" id="10C" />
				          <label for="10C">10C</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="10D" id="10D" />
				          <label for="10D">10D</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="10E" id="10E" />
				          <label for="10E">10E</label>
				        </li>
				        <li class="seat">
				          <input type="checkbox" name="seat" value="10F" id="10F" />
				          <label for="10F">10F</label>
				        </li>
				      </ol>
				    </li>
				  </ol>
  				<div class="exit exit--back fuselage"></div>
          </div>
  		<div  style="border-style:2px solid black ; width:400px; height:400;">
  				<div class="n2">
  			<fieldset  style="width:80%; height:340px; border-radius:20px; border-color: skyblue;background-color:#87ceeba3" ;>
  				<div class="a">
					<button class="a1" type="button">Get Total</button>
				</div>
				<br>
				
					<form action="booknownextcontroller" method="post">
						Selected Seats :- 
					<div id="display1" class="disp"></div>
				
					<div id="display2">Total :-</div>
					<div id="display3">Price:-</div>
	            	<input type="text"  hidden value="<%=busNo%>" name="busno" id="busno" >
					<input type="text" hidden  value="0" name="seats" id="seats1">
					<input type="text" hidden value="0" name="seatcount" id="totalseat">
					<input type="text" hidden value="<%=id %>" name="id" >
					<input type="text" hidden value="0" name="price" id="price"><br><br> 
					<input class="a2" type="date" name="bookon" placeholder="enter booking date" required><br><br> 
					<button  id="btn" type="submit"> Book Now</button>
					</form>
				
		
		</div>
	
	</fieldset>
	</div>

</body>
<script>


    $(document).ready(function() {
        $("button").click(function(){
            var selectedseats = [];
            var html1='';
            var num=0;
            var seatnumber='';
            $.each($("input[name='seat']:checked"), function(){
                selectedseats.push($(this).val());
                   html1 += '<p class="seatcolor">'+$(this).val()+'</p>';
                   seatnumber += $(this).val();
                   num +=1;

            });

            var total= selectedseats.length;
             document.getElementById("seats1").value = seatnumber;
             document.getElementById("price").value = total*80;
             document.getElementById("totalseat").value = total;
              document.getElementById("display1").innerHTML = html1;
              document.getElementById("display2").innerHTML = 'Total Seats:- '+total;
              document.getElementById("display3").innerHTML = 'Price = '+total*80;
               if(num>0){
                          document.getElementById("btn").style.display = "block";
                         }  
              

            //alert("total = "+ total + "selected: " + selectedseats.join(", "));
        });
       
    });
    
    var n1 = document.getElementById("st1").value;
    var selectedseat =(n1.length)/2;
    var available= 60-selectedseat;
    document.getElementById("remain").innerHTML = 'Available Seats = '+available ;
    
    
</script>

</html>