package com.sunil.web.loginvalid;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginValidation
 */
@WebServlet("/LoginValidation")
public class LoginValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		//request.getSession().setAttribute("password", pass);
		
		String url = "jdbc:mysql://localhost:3306/testportal";
		String user = "root";
		String password = "";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		HttpSession sessionValue = request.getSession();
		
		//System.out.println(sessionValue);
		
		try {
			Connection con;
			
			con = DriverManager.getConnection(url, user, password);
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from school_list;");
			
			while(rs.next()){
				//System.out.println(rs.getString(3)+" "+rs.getString(4));
				if(rs.getString(3).equals(email) && rs.getString(4).equals(pass)){
					sessionValue.setAttribute("name", rs.getString(1));
					sessionValue.setAttribute("db", rs.getString(2));
					
					response.sendRedirect("adminPage.jsp");
				}
			}
			
			rs.close();
			st.close();
			con.close();
			response.getWriter().println("Invalid Username/Password!!");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			response.getWriter().println("Database Server not connected!!!");
			e.printStackTrace();
		}
	}

}
