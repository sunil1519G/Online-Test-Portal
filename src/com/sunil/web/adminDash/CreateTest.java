package com.sunil.web.adminDash;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CreateTest
 */
@WebServlet("/CreateTest")
public class CreateTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//String subject = request.getParameter("q");
		String school = request.getSession().getAttribute("db").toString();
		String url = "jdbc:mysql://localhost:3306/testportal";
		String user = "root";
		String password = "";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			response.getWriter().println("mysql jdbc Driver Error!!");
			e.printStackTrace();
		}
		
		int f=0;
		String testCode = request.getParameter("testCode");
		String subject = request.getParameter("subject");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String testDur = request.getParameter("testDur");
		String query = "INSERT INTO tests ( `Subject`, `Start_Date`, `End_Date`, `Duration`, `Test_Code`, `School`) "
				+ "VALUES ('"+subject+"','"+startDate+"','"+endDate+"','"+testDur+"','"+testCode+"','"+school+"')";
		
		Connection con;
		try {
			con = DriverManager.getConnection(url, user, password);
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from tests;");
			
			while(rs.next()){
				if(rs.getString("Test_Code").equalsIgnoreCase(testCode)){
					f=1;
					response.getWriter().println("The Test Already Exists!");
					break;
				}
			}
			
			if(f==0)
				st.executeUpdate(query);
			
			st.close();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			response.getWriter().println("Database server not connected/error!");
			e.printStackTrace();
		}
		
		if(f==0){
			request.getSession().setAttribute("flag", "true");
			response.sendRedirect("createTest.jsp");
		}
	}

}
