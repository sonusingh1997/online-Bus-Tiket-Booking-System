package project.com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;

import project.com.SisDbConnectionUtil;

/**
 * Servlet implementation class SearchBusesController
 */
public class SearchBusesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
	/*	int source = Integer.parseInt(request.getParameter("source"));
		int destination =Integer.parseInt(request.getParameter("destination"));
		
		
	String s1="";
	String s2="";
    //String [] arr= new String[6]; 
    String [] arr={"raipur","nagpur","katni","gwaliour","agra","delhi"};
      s1=arr[source];
      s2=arr[destination];
      
      */
		Bus1 bus1=null;
		Connection con=null;
		PreparedStatement pstmt =null;
		ResultSet rs= null;
		List<Bus1> buslist = new ArrayList<Bus1>();
		try{
			con =SisDbConnectionUtil.getConnection();
			String sql=("select * from bus_registration where source=? and destination=?");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,source);
			pstmt.setString(2, destination);
			rs = pstmt.executeQuery();
		
			
			while(rs.next()){
				
				int busId = rs.getInt("BUSID");
				String busNo = rs.getString("BUSNO");
				String busType = rs.getString("BUSTYPE");
				int totalSeats = rs.getInt("TOTALSEATS");
				String ownerName = rs.getString("OWNERNAME");
				String source1 = rs.getString("SOURCE");
				
				String destination1 = rs.getString("DESTINATION");
				String departureTime = rs.getString("DEPART_TIME");
				String arrivalTime = rs.getString("ARRIV_TIME");
				
				bus1=new Bus1();
				bus1.setBusId(busId);
				bus1.setBusNo(busNo);
				bus1.setBusType(busType);
				bus1.setTotalSeats(totalSeats);
				bus1.setOwnerName(ownerName);
				bus1.setSource(source1);
				bus1.setDestination(destination1);
				bus1.setDepartureTime(departureTime);
				bus1.setArrivalTime(arrivalTime);
				
				buslist.add(bus1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			 try {
				SisDbConnectionUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(bus1!=null){
			//HttpSession session = request.getSession();
			request.setAttribute("buslist", buslist);
			request.setAttribute("bus_found_msg","bus found");
			RequestDispatcher rd =request.getRequestDispatcher("showSearchBuses.jsp");
			rd.forward(request, response);
		}else{
			request.setAttribute("bus_not_found_msg", "bus not found");
			RequestDispatcher rd=request.getRequestDispatcher("UserHome.jsp");
			rd.forward(request, response);
		}
	}
}
