package project.com;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
/**
 * Servlet implementation class TicketStatusController
 */
public class TicketStatusController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int ticketId=0;
		String bookedSeat="";
		String busNo="";
		String source="";
		String des="";
		String busType="";
		String departTime="";
		String arrivTime="";
		System.out.println("Hello");
		
		Ticket ticket=null;
		Connection con=null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		List<Ticket> ticketList = new ArrayList<Ticket>();
		
		try{
		con = SisDbConnectionUtil.getConnection();
		String sql=" select busSeatBooked.ticketId, busSeatBooked.bookedseatNo, busSeatBooked.busNo, bus_registration.source, bus_registration.destination, bus_registration.busType,bus_registration.arriv_time, bus_registration.depart_time from busSeatBooked inner join bus_registration on busSeatBooked.busNo = bus_registration.busNo";
		pstmt=con.prepareStatement(sql);

		rs=pstmt.executeQuery(sql);
		System.out.println(rs);
		while(rs.next()){
			
			ticketId = rs.getInt("ticketId");
			bookedSeat=rs.getString("bookedseatNo");
			busNo=rs.getString("busno");
			source=rs.getString("source");
			des=rs.getString("destination");
			busType = rs.getString("busType");
			departTime=rs.getString("depart_time");
			arrivTime=rs.getString("arriv_time");
			
			
			//System.out.println(ticketId);
			ticket= new Ticket();
			ticket.setTicketId(ticketId);
			ticket.setBookedSeat(bookedSeat);
			ticket.setBusNo(busNo);
			ticket.setBusType(busType);
			ticket.setDes(des);
			ticket.setSource(source);
			ticket.setArrivalTime(arrivTime);
			ticket.setDepartureTime(departTime);
		
			ticketList.add(ticket);
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
		if(ticket!=null){
			System.out.println("Redired set");
			//HttpSession session = request.getSession();
			request.setAttribute("ticketList", ticketList);
			//session.setAttribute("ticketList", ticketList);
			RequestDispatcher rd = request.getRequestDispatcher("ticketStatus.jsp");
			rd.forward(request, response);
		}
	}

}
