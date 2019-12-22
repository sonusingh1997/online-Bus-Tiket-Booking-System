package project.com;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
/**
 * Servlet implementation class BookNowNextController
 */


public class BookNowNextController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId=request.getParameter("id");
		String busNo=request.getParameter("busno");
		String seatNo=request.getParameter("seats");
		int seatCount=Integer.parseInt(request.getParameter("seatcount"));
		int price=Integer.parseInt(request.getParameter("price"));
		String Price = Integer.toString(price);
		
		String mydate =request.getParameter("bookon");
		String pattern = "yyy-MM-dd";
		SimpleDateFormat sdf=null; 
		sdf=new SimpleDateFormat(pattern);
		Date d1 = null;
		try{
		d1 = sdf.parse(mydate);
		}catch(Exception e){}
		long mydateInMs = d1.getTime();
		java.sql.Date sqlDate = new java.sql.Date(mydateInMs);
		
		HttpSession session = request.getSession();
		session.setAttribute("userId", userId);
		session.setAttribute("busNo", busNo);
		session.setAttribute("seatNo", seatNo);
		session.setAttribute("seatCount", seatCount);
		session.setAttribute("Price", Price);
		  System.out.println(userId);
		request.getRequestDispatcher("creditcard.jsp").forward(request, response);;
	}
	  
//response.sendRedirect("showregisterbus?register_msg="+isRegistered);
	

		

		
		
}


