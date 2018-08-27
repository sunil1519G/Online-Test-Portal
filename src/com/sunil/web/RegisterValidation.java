package com.sunil.web;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterValidation
 */
@WebServlet("/RegisterValidation")
public class RegisterValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String adminName = request.getParameter("adminName");
		String collegeName = request.getParameter("scName");
		String email = request.getParameter("email");
		String pass = request.getParameter("password");

		int f=0;

		String url= "jdbc:mysql://localhost:3306/testportal";
		String user = "root";
		String password = "";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		// Create Question , Library and Student Tables
		String question = collegeName.replaceAll("\\s+","")+"_Ques";
		String library = collegeName.replaceAll("\\s+","")+"_lib";
		String student = collegeName.replaceAll("\\s+","")+"_student";
		String query="insert into school_list values('"+adminName+"','"+collegeName+"','"+email+"','"+pass+"')";
		String query1="CREATE TABLE "+question+" (ID int NOT NULL AUTO_INCREMENT,"
				+ "Subject varchar(255) NOT NULL,Question varchar(255) NOT NULL,"
				+ "option1 varchar(255) NOT NULL,option2 varchar(255) NOT NULL,"
				+ "option3 varchar(255) NOT NULL,option4 varchar(255) NOT NULL,PRIMARY KEY (ID));";
		String query2="CREATE TABLE "+library+" (ID int NOT NULL AUTO_INCREMENT,"
				+ "Subject varchar(255) NOT NULL,Question varchar(255) NOT NULL,"
				+ "option1 varchar(255) NOT NULL,option2 varchar(255) NOT NULL,"
				+ "option3 varchar(255) NOT NULL,option4 varchar(255) NOT NULL,PRIMARY KEY (ID));";
		String query3="CREATE TABLE "+student+" (Student_Name varchar(255) NOT NULL,"
				+ "Exam_rollno varchar(255) NOT NULL,Class int NOT NULL,"
				+ "Password varchar(255) NOT NULL,PRIMARY KEY (Exam_rollno));";
		
		//response.getWriter().println(query);
		try {
			Connection con;
			con = DriverManager.getConnection(url, user, password);
			Statement st = con.createStatement();
			
			ResultSet rs = st.executeQuery("select * from school_list;");
				
			while(rs.next()){
				if(rs.getString(3).equals(email)){
					response.getWriter().println("Already Registered!!");
					f=1;
					break;
				}
			}
				
			if(f==0){
				st.executeUpdate(query);
				st.executeUpdate(query1);
				st.executeUpdate(query2);
				st.executeUpdate(query3);
			}					
				
			st.close();
			con.close();
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			response.getWriter().print("Database server error!!");
			e.printStackTrace();
		}
	
		if(f==0){
			response.sendRedirect("index.jsp");
		}
	}

}
