package project.com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class RegisterController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("user_name");
		int age = Integer.parseInt(request.getParameter("user_age"));
		String city = request.getParameter("user_city");
		String state = request.getParameter("user_state");
		String email = request.getParameter("user_email_id");
		String password = request.getParameter("user_password");
		String mobileNo = request.getParameter("mobile");
		boolean isRegistered=false;
		Connection con = null;
		PreparedStatement pstmt =null;
		try{
			con = SisDbConnectionUtil.getConnection();
			String sql ="insert into user_registration(userSeqId,name,age,city,state,email,password,mobile)values(user_registration_seq.nextval,?,?,?,?,?,?,?)";
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
		  
	response.sendRedirect("CustomerLogin.jsp");

	}

}
