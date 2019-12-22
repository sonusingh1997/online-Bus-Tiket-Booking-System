package project.com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BusRegistrationController
 */
public class BusRegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String busNo=request.getParameter("bus_number");
		String type = request.getParameter("bus_type");
		int totalSeats = Integer.parseInt(request.getParameter("bus_total_seats"));
		String ownerName = request.getParameter("bus_owner");
		String source=request.getParameter("source");
		String destination = request.getParameter("destination");
		String departure_time=request.getParameter("departure_time");
		String arrival_time = request.getParameter("arrival_time");
		
		boolean isRegistered=false;
		Connection con = null;
		PreparedStatement pstmt =null;
		try{
			con = SisDbConnectionUtil.getConnection();
			String sql ="insert into bus_registration(busId,busNo,busType,totalSeats,ownerName,source,destination,depart_time,arriv_time)values(busRegistration_seq.nextval,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,busNo);
			pstmt.setString(2,type);
			pstmt.setInt(3,totalSeats);
			pstmt.setString(4,ownerName);
			pstmt.setString(5, source);
			pstmt.setString(6, destination);
			pstmt.setString(7, departure_time);
			pstmt.setString(8, arrival_time);
			
			if(pstmt.executeUpdate()==1){
				isRegistered=true;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			 try {
				SisDbConnectionUtil.closeConnection(con);
			} catch (SQLException e) {
				 
				e.printStackTrace();
			}
		}
		  
	response.sendRedirect("showregisterbus?register_msg="+isRegistered);


	}

}
