package project.com;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 */
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		String sessionMsg  ="Logout Success";
		if(session==null) {
			 sessionMsg  ="Session Already expired";
		}else {
			session.invalidate();
			sessionMsg  ="Logout successfuly done";
		}
		
		response.sendRedirect("logout.jsp?session_msg="+sessionMsg);
		
		
	}

}
