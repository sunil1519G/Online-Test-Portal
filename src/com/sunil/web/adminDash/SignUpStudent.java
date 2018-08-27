package com.sunil.web.adminDash;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignUpStudent
 */
@WebServlet("/SignUpStudent")
public class SignUpStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String database = request.getSession().getAttribute("db").toString();
		database = database.replaceAll("\\s+","").toLowerCase()+"_student";

		String name = request.getParameter("name");
		String examroll = request.getParameter("examroll");
		String classs = request.getParameter("class");
		int clas = Integer.parseInt(classs);
		String pass = request.getParameter("pass");
		
		String url = "jdbc:mysql://localhost:3306/testportal";
		String user = "root";
		String password = "";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			response.getWriter().println("Sql Driver pacages not found!!");
			e1.printStackTrace();
		}
		
		int f=0;
		Connection con;
		String query = "INSERT INTO "+database+"( `Student_Name`, `Exam_rollno`, `Class`, `Password`) "
				+ "VALUES ('"+name+"','"+examroll+"',"+clas+",'"+pass+"')";
		
		try {
			con = DriverManager.getConnection(url, user, password);
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from "+database);
			
			while(rs.next()){
				if(rs.getString("Exam_rollno").equals(examroll)){
					f=1;
					response.getWriter().println("Student Already Signed up!!");
					break;
				}
			}
			
			if(f==0)
				st.executeUpdate(query);
			
			st.close();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			response.getWriter().println("Database Server not found!");
			e.printStackTrace();
		}
		
		if(f==0){
			request.getSession().setAttribute("flag", "true");
			response.sendRedirect("signupStudents.jsp");
		}
	}

}
