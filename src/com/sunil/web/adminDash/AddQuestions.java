package com.sunil.web.adminDash;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 * Servlet implementation class AddQuestions
 */
@WebServlet("/AddQuestions")
public class AddQuestions extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String database = request.getSession().getAttribute("db").toString();
		String QuestionTable = database.replaceAll("\\s+","").toLowerCase()+"_ques";
		String LibraryTable = database.replaceAll("\\s+","").toLowerCase()+"_lib";

		String url = "jdbc:mysql://localhost:3306/testportal";
		String user = "root";
		String password = "";
		//System.out.println(database);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String subject = request.getParameter("subject");
		String Ques = request.getParameter("ques");
		String Opt1 = request.getParameter("A");
		String Opt2 = request.getParameter("B");
		String Opt3 = request.getParameter("C");
		String Opt4 = request.getParameter("D");
		
		String query = "INSERT INTO "+QuestionTable+"( `Subject`, `Question`, `option1`, `option2`, `option3`, `option4`) "
						+ "VALUES ('"+subject+"','"+Ques+"','"+Opt1+"','"+Opt2+"','"+Opt3+"','"+Opt4+"')";
		String query1 = "INSERT INTO "+LibraryTable+"( `Subject`, `Question`, `option1`, `option2`, `option3`, `option4`) "
				+ "VALUES ('"+subject+"','"+Ques+"','"+Opt1+"','"+Opt2+"','"+Opt3+"','"+Opt4+"')";
		
		int f=0;
		
		try {

			Connection con;
			con = DriverManager.getConnection(url, user, password);
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from "+LibraryTable);
			
			while(rs.next()){
				if(rs.getString("Question").equals(Ques)){
					f=1;
					response.getWriter().println("Question already exists!!");
					break;
				}
			}
			
			if(f==0){
				st.executeUpdate(query);
				st.executeUpdate(query1);
			}
			
			st.close();
			con.close();
			
		} catch (SQLException e) {
			response.getWriter().println("Database Server Error!!!");
			e.printStackTrace();
		}
		
		if(f==0){
			request.getSession().setAttribute("flag", "true");
			response.sendRedirect("addQuestion.jsp");
		}
	}

}
