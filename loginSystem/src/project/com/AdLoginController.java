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
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class AdLoginController
 */
public class AdLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String loginId=request.getParameter("a_login");
		String password=request.getParameter("a_login_password");
		
		Admin admin=null;
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs  = null;
		  try {
				con  = SisDbConnectionUtil.getConnection();
				String sql="select * from admin_registration where email=? and password=?";
				pstmt  = con.prepareStatement(sql);
				pstmt.setString(1, loginId);
				pstmt.setString(2, password);
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					/*long id =rs.getLong("id");
					String name  = rs.getString("name");
					String role  = rs.getString("role");
					String mobile  = rs.getString("mobile");
					String email  = rs.getString("EMAIL_ID");
					*/
					String name=rs.getString("name");
					int age=rs.getInt("age");
					String city=rs.getString("city");
					String state =rs.getString("state");
					String email =rs.getString("email");
					String passwd =rs.getString("password");
					String mobile =rs.getString("mobile");
					
					admin = new Admin();
					/*user.setLoginId(loginId);
					user.setName(name);
					user.setRole(role);
					user.setMobile(mobile);
					user.setEmailId(email);*/
					admin.setName(name);
					admin.setAge(age);
					admin.setCity(city);
					admin.setState(state);
					admin.setEmailId(email);
					admin.setPassword(passwd);
					admin.setMobile(mobile);
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				 try {
					SisDbConnectionUtil.closeConnection(con);
				} catch (SQLException e) {
					 
					e.printStackTrace();
				}
			}
		  
		  if(admin!=null) {
			  
			  // success
			  HttpSession session = request.getSession();
			  session.setAttribute("admin", admin);
			  request.setAttribute("login_msg", "login successful");
			  RequestDispatcher rd 
				 = request.getRequestDispatcher("BusRegistration.jsp");
				 rd.forward(request, response);
			  //response.sendRedirect("CustomerLogin.jsp");
			  
		  }else {
			  request.setAttribute("enteredLoginId",loginId); 
			 request.setAttribute("login_error_msg", "invalid user or password"); 
			 RequestDispatcher rd 
			 = request.getRequestDispatcher("AdminLogin.jsp");
			 rd.forward(request, response);
		  }
	}

}
