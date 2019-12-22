package project.com;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServletController
 */
public class LogoutServletController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		String sessionMsg  ="Logout Success";
		if(session==null) {
			 sessionMsg  ="Session Already expired";
		}else {
			session.invalidate();
			sessionMsg  ="Logout successfuly";
		}
		System.out.println(sessionMsg);
		//response.sendRedirect("CustomerLogin.jsp?session_msg="+sessionMsg);
		  //request.setAttribute("enteredLoginId",loginId); 
			 request.setAttribute("session_msg",sessionMsg); 
			 RequestDispatcher rd 
			 = request.getRequestDispatcher("CustomerLogin.jsp");
			 rd.forward(request, response);
		
		
		
		
		
	}

}
