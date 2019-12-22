package project.com;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.text.ParseException;
import java.text.SimpleDateFormat;


/**
 * Servlet implementation class PaymentController
 */


public class PaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cardNo=(request.getParameter("cardno"));
		String cardHolderName= request.getParameter("name");
		String validUpto=request.getParameter("validupto");
		int cvvNo =Integer.parseInt(request.getParameter("cvv"));
		int amt =Integer.parseInt(request.getParameter("price"));
		
		String pattern = "yyy-MM-dd";
		SimpleDateFormat sdf=null; 
			sdf=new SimpleDateFormat(pattern);
		
		Date d1 = null;
		try{
		d1 = sdf.parse(validUpto);
		}catch(Exception e){}
		long validUptoInMs = d1.getTime();
		
		java.sql.Date sqlDate = new java.sql.Date(validUptoInMs);
		
		System.out.println("sqlDate "+sqlDate);
		HttpSession session = request.getSession();
		String userId=(String)session.getAttribute("userId");
		String busNo1=(String)session.getAttribute("busNo");
		String seatNo=(String)session.getAttribute("seatNo");
		String Price =(String)session.getAttribute("Price");
		int Price1=Integer.parseInt(Price);
		System.out.println(userId);
		
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		PreparedStatement pstmt1 =null;
		PreparedStatement pstmt2 =null;
		java.sql.Statement  stmt=null;
		ResultSet rs1 = null;
		int r=0;
		int ticketId=0;
		String busNo="";
		String source="";
		String Des="";
		String bookedSeat="";

		
		try{
			con = SisDbConnectionUtil.getConnection();
			String sql ="insert into payment_details(paymentId,cardNo,cardHolder,validDate,cvvNo,amt,paymentDate)values(payment_seq.nextval,?,?,?,?,?,CURRENT_TIMESTAMP)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cardNo);
			pstmt.setString(2, cardHolderName);
			pstmt.setDate(3, sqlDate);
			pstmt.setInt(4, cvvNo);
			pstmt.setInt(5, amt);
			
			
			 r=pstmt.executeUpdate();
			 //updated
			 if(r==1){
				  
					try{
						System.out.println("inside try");
						String sql1 ="insert into busSeatBooked(ticketId,userId,busNo,bookedseatno,price,booking_date)values(busSeatBook_seq.nextval,?,?,?,?,?)";
						pstmt2 = con.prepareStatement(sql1);
						pstmt2.setString(1, userId);
						pstmt2.setString(2, busNo1);
						pstmt2.setString(3, seatNo);
						pstmt2.setInt(4, Price1);
						pstmt2.setDate(5, sqlDate);
						int r1=pstmt2.executeUpdate();
						System.out.println(r1);
					}catch(Exception e){
						e.printStackTrace();
					}
					System.out.println("Ticket Done");
				 
				 
						String sql1=" select busSeatBooked.ticketId,busSeatBooked.bookedseatNo, busSeatBooked.busNo, bus_registration.source, bus_registration.destination from busSeatBooked inner join bus_registration on busSeatBooked.busNo = bus_registration.busNo";
						//pstmt1=con.prepareStatement(sql1);
						stmt =con.createStatement();
						rs1=stmt.executeQuery(sql1);
					
						while(rs1.next()){
							System.out.println(rs1);
							System.out.println("Inside While");
							ticketId = rs1.getInt("ticketId");
							bookedSeat=rs1.getString("bookedseatNo");
							busNo=rs1.getString("busno");
							source=rs1.getString("source");
							Des=rs1.getString("destination");
							
							//System.out.println(ticketId);
						}
						String msg="Ticket id : "+ticketId+ " booked seat no. : " +bookedSeat+ " bus no : "+busNo+ " source : "+source+ " destination : "+Des+"";
						System.out.println(msg);
						
						Mail2.sendotp(userId,msg);
			 
			 
			 }
			 
			 
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				SisDbConnectionUtil.closeConnection(con);
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}
		request.setAttribute("boking_msg","successfully seat booked");
		RequestDispatcher rd = request.getRequestDispatcher("UserHome.jsp");
		rd.forward(request, response);
	}

}
