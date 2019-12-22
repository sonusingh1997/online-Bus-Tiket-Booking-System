package project.com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ForgotPasswordController
 */
	public class ForgotPasswordController extends HttpServlet {
		private static final long serialVersionUID = 1L;
       
   
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			String emailId = request.getParameter("email");
			String newPassword= request.getParameter("newpassword");
			String confirmPassword= request.getParameter("confirmpassword");
			if(newPassword.equals(confirmPassword)){
			
				Connection con = null;
				PreparedStatement pstmt =null;
				PreparedStatement pstmt1 =null;
				ResultSet rs  = null;
				ResultSet rs1  = null;
				String password="";
			  
			  try {
				con  = SisDbConnectionUtil.getConnection();
				String sql1="Update user_registration set password=? where email=?";
				pstmt1=con.prepareStatement(sql1);
				pstmt1.setString(1, newPassword);
				pstmt1.setString(2, emailId);
				rs1=pstmt1.executeQuery();
				if(rs1.next()){
				
					String sql="select password from user_registration where email=?";
					pstmt  = con.prepareStatement(sql);
					pstmt.setString(1, emailId);
					rs = pstmt.executeQuery();
					if(rs.next()) {
						 password = rs.getString("password");
					}
					String msg="your user id : "+emailId+ " new password : "+password+" ";
					System.out.println(msg);
					
					Mail1.sendotp(emailId,msg);
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
	
			  		RequestDispatcher rd = request.getRequestDispatcher("CustomerLogin.jsp");
			  		rd.forward(request, response);
		}else{
				request.setAttribute("password_update_msg", "enter same password in both password field");
				RequestDispatcher rd=request.getRequestDispatcher("ForgotPassword.jsp");
				rd.forward(request, response);
			}
			  
	}

}
