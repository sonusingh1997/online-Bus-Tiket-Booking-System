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
 * Servlet implementation class OwnerRegistrationController
 */
public class OwnerRegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("bus_owner_name");
		int age = Integer.parseInt(request.getParameter("bus_owner_age"));
		String city = request.getParameter("bus_owner_city");
		String state = request.getParameter("bus_owner_state");
		String busNo=request.getParameter("bus_number");
		String email = request.getParameter("bus_owner_email");
		String password = request.getParameter("bus_owner_password");
		String mobileNo = request.getParameter("bus_owner_mobile");
		boolean isRegistered=false;
		Connection con = null;
		PreparedStatement pstmt =null;
		try{
			con = SisDbConnectionUtil.getConnection();
			String sql ="insert into bus_owner_registration(name,age,city,state,email,password,mobile)values(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setInt(2,age);
			pstmt.setString(3,city);
			pstmt.setString(4,state);
			pstmt.setString(5,email);
			pstmt.setString(6,password);
			pstmt.setString(7,mobileNo);
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
		  
	response.sendRedirect("showregisterbusowner?register_msg="+isRegistered);

	}

}
