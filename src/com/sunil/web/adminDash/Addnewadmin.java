package com.sunil.web.adminDash;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Addnewadmin
 */
@WebServlet("/Addnewadmin")
public class Addnewadmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String url = "jdbc:mysql://localhost:3306/testportal";
		String user = "root";
		String password = "";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			response.getWriter().println("jdbc Driver error!!");
			e.printStackTrace();
		}
		
		String collegeName = request.getSession().getAttribute("db").toString();
		String adminName = request.getParameter("name");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");

		int f=0;
		String query="insert into school_list values('"+adminName+"','"+collegeName+"','"+email+"','"+pass+"')";
		Connection con;
		try {
			con = DriverManager.getConnection(url, user, password);
			
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from school_list;");
			
			while(rs.next()){
				if(rs.getString("email").equalsIgnoreCase(email)){
					f=1;
					response.getWriter().println("Already exists!1");
					break;
				}
			}
			
			if(f==0)
				st.executeUpdate(query);
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			response.getWriter().println("Database Server error!!");
			e.printStackTrace();
		}
		
		if(f==0){
			request.getSession().setAttribute("flag", "true");
			response.sendRedirect("addAdmin.jsp");
		}
	}

}
