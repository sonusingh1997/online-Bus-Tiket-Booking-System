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

import project.com.SisDbConnectionUtil;

/**
 * Servlet implementation class BookNowController
 */
public class BookNowController extends HttpServlet {
	private static final long serialVersionUID = 1L;

       
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
	}*/

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String busNo = request.getParameter("busno");
		String totalSeats =(request.getParameter("seats"));
		String busType = request.getParameter("bustype");
		Connection con=null;
		PreparedStatement pstmt =null;
		ResultSet rs= null;
		String seatStr="";
		try{
			con =SisDbConnectionUtil.getConnection();
			String sql=("select * from busSeatBooked where busNo=?");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,busNo);
			rs = pstmt.executeQuery();
		
			int i=0;
			while(rs.next()){
				i++;
				String bookedSeat=rs.getString("bookedseatno");
				
				seatStr += bookedSeat;
				
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
		
		
		
		if(busType.equals("ac")){
		HttpSession session = request.getSession();
		session.setAttribute("busNo",busNo);
		session.setAttribute("totalSeat",totalSeats );
		session.setAttribute("bustype", busType);
		session.setAttribute("bookedseat", seatStr);
		request.getRequestDispatcher("BusView.jsp").forward(request,response);
	
		}else{
			HttpSession session = request.getSession();
			session.setAttribute("busNo",busNo);
			session.setAttribute("totalSeat",totalSeats );
			session.setAttribute("bustype", busType);
			request.getRequestDispatcher("BusViewNonAc.jsp").forward(request,response);
		}
	}

}
