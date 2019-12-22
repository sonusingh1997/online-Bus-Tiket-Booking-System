package project.com;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import project.com.SisDbConnectionUtil;
/**
 * Servlet implementation class CustomerLogin
 */
public class CustomerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 String loginId = request.getParameter("c_login");
		  String loginPassword = request.getParameter("c_login_password");
		  
		  
		  User user  = null;
		  
		  Connection con = null;
		  PreparedStatement pstmt =null;
		  ResultSet rs  = null;
		  
		  try {
			con  = SisDbConnectionUtil.getConnection();
			String sql="select * from user_registration where email=? and password=?";
			pstmt  = con.prepareStatement(sql);
			pstmt.setString(1, loginId);
			pstmt.setString(2, loginPassword);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int userSeqId = rs.getInt("userSeqId");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String city = rs.getString("city");
				String state = rs.getString("state");
				String email = rs.getString("email");
				String password = rs.getString("password");
				String mobile = rs.getString("mobile");
				
				user=new User();
				user.setUserSeqId(userSeqId);
				 user.setName(name);
				 user.setState(state);
				user.setAge(age);
				user.setCity(city);
				user.setEmailId(email);
				user.setPassword(password);
				user.setMobile(mobile);
				
				
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
		  
		 
		  //_____________________________________________________
		  if(user!=null) {
			  
				  String name=user.getName();
			  // success
			  HttpSession session = request.getSession();
			  session.setAttribute("name", name);
			  session.setAttribute("email", loginId);
			  System.out.println(loginId);
			  request.setAttribute("login_msg", "login successful");
			  response.sendRedirect("UserHome.jsp");
				 //rd.forward(request, response);
				 			 
			  
		  }else {
			  request.setAttribute("enteredLoginId",loginId); 
			 request.setAttribute("login_error_msg", "invalid user or password"); 
			 RequestDispatcher rd 
			 = request.getRequestDispatcher("CustomerLogin.jsp");
			 rd.forward(request, response);
		  }
		   
		
	}

}
