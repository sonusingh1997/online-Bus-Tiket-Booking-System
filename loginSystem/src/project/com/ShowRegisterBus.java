package project.com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ShowRegisterBus
 */
public class ShowRegisterBus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 Connection con  = null;
		 PreparedStatement pstmt  = null;
		 ResultSet rs  = null;
		 
		List<Bus> busList = new ArrayList<Bus>();
		try{
			con = SisDbConnectionUtil.getConnection();
			String sql ="select * from bus_registration";
			pstmt = con.prepareStatement(sql);
			rs =pstmt.executeQuery();
			while(rs.next()){
				int busId = rs.getInt("busId");
				String busNumber=rs.getString("busNo");
				String busType=rs.getString("busType");
				int totalSeats=rs.getInt("totalSeats");
				String ownerName =rs.getString("ownerName");
				String sourceStation=rs.getString("source");
				String destinationStation=rs.getString("destination");
				String departureTime=rs.getString("depart_time");
				String arrivalTime=rs.getString("arriv_time");
				
				Bus bus=new Bus();
				bus.setBusId(busId);
				bus.setBusNo(busNumber);
				bus.setBusType(busType);
				bus.setTotalSeats(totalSeats);
				bus.setOwnerName(ownerName);
				bus.setSource(sourceStation);
				bus.setDestination(destinationStation);
				bus.setDepartureTime(departureTime);
				bus.setArrivalTime(arrivalTime);
				
				busList.add(bus);
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{

			try{
				SisDbConnectionUtil.closeConnection(con);
			}catch(Exception e){
				e.printStackTrace();
			}	
	 }
	 
	 request.setAttribute("buslist", busList);
	 request.getRequestDispatcher("show_all_bus.jsp").forward(request, response);
		
	}

}
