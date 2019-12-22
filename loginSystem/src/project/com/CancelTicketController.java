package project.com;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 * Servlet implementation class CancelTicketController
 */
public class CancelTicketController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelTicketController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		String userId=(String)session.getAttribute("userId");
		String busNo = request.getParameter("busno");
		int ticketId = Integer.parseInt(request.getParameter("ticketid"));
		String seatNo = request.getParameter("seatno");
		String seatStr = request.getParameter("seatStr");
		int v=seatStr.length()/2;
		System.out.println(v);
		Connection con=null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		PreparedStatement pstmt1 =null;
		ResultSet rs1 = null;
		String seat="";
		int totalSeat=0;
		try{
			con=SisDbConnectionUtil.getConnection();
			if(v==1){
				String sql="Delete from busSeatBooked where ticketId=? and userId=? and busNo=? and bookedseatno=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ticketId);
				pstmt.setString(2, userId);
				pstmt.setString(3, busNo);
				pstmt.setString(4, seatStr);
				rs = pstmt.executeQuery();
				if(!rs.next()){ 
					/*System.out.println("delete successful");
					 request.setAttribute("cancel_ticket", "cancelled successfully"); 
					 RequestDispatcher rd 
					 = request.getRequestDispatcher("UserHome.jsp");
					 rd.forward(request, response);*/
				System.out.println("delete successfully");	
					
				}
			}else{
				String s="";
					for(int i=0;i<seatStr.length();i=i+2){
					String t= seatStr.substring(i,i+2);
					System.out.println(t);
					if(!(t.equals(seatNo)))
						{s+=t;
						System.out.println(s);
						}
					}
				String sql="Update busSeatBooked set bookedseatno=? where ticketId=? and userId=? and busNo=?";	
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(2, ticketId);
				pstmt.setString(3, userId);
				pstmt.setString(4, busNo);
				pstmt.setString(1, s);
				rs = pstmt.executeQuery();
				if(rs.next()){
					System.out.println("update successful");
					/*request.setAttribute("cancel_ticket", "cancelled successfully"); 
					 RequestDispatcher rd 
					 = request.getRequestDispatcher("UserHome.jsp");
					 rd.forward(request, response);*/
		
				}
			}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try {
					SisDbConnectionUtil.closeConnection(con);
				} catch (SQLException e) { 
					e.printStackTrace();
				}
				
				request.setAttribute("cancel_ticket_msg", " successfully cancel ticket");
				RequestDispatcher rd 
				 = request.getRequestDispatcher("UserHome.jsp");
				 rd.forward(request, response);
				 
			}
		
		    
		
		
	}

}
