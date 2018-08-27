<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Take the test</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="css/bootstrap-4.0.0-beta.1.css" type="text/css"> 
  <style type="text/css">
  		#home{
  			height: 450px;
  		}
  
  </style>
</head>

<body>
<%
	if(session.getAttribute("name")==null)
		response.sendRedirect("login.jsp");
%>
  <nav class="navbar navbar-expand-md bg-primary navbar-dark">
    <div class="container">
      <a class="navbar-brand" href="adminPage.jsp"><i class="fa d-inline fa-lg fa-cloud"></i><b>&nbsp;Online Exam Portal</b></a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar2SupportedContent" aria-controls="navbar2SupportedContent"
        aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
      <div class="collapse navbar-collapse text-center justify-content-end" id="navbar2SupportedContent">
        <a class="btn navbar-btn ml-2 text-white btn-secondary"><i class="fa d-inline fa-lg fa-user-circle-o"></i>&nbsp;${name}<br> </a>
      	<a href="logout.jsp" class="btn navbar-btn ml-2 text-white btn-secondary">&nbsp;Logout<br> </a>
      </div>
    </div>
  </nav>
  <br>
  <div class="container">
    <div class="row">
      <div class="container navbar border border-secondary">
        <div class="col-md-12" style="text-align: center; color:red"><h3>Take the test</h3></div>
      </div>
<%
String url = "jdbc:mysql://localhost:3306/testportal";
String user = "root";
String password = "";

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

String school = request.getSession().getAttribute("db").toString();
//String subject = request.getParameter("subject");
//System.out.println(school);
Connection con;
try {
	con = DriverManager.getConnection(url, user, password);
	Statement st = con.createStatement();
	Statement st1 = con.createStatement();
	ResultSet rs = st.executeQuery("select * from tests where School='"+school+"';");
	
	String flag=session.getAttribute("flag").toString();
	//out.print(flag);
	if(flag=="true"){
		st1.executeUpdate("delete from tests where Subject='"+request.getParameter("subject")+"';");
	}
%>

      <div class="col-md-12" id="home">
      	<label><b>Test List : </b></label>
        <hr>
        <table class="table table-bordered">
        <thead>
            <tr>
              <th>Subject</th>
              <th>Start Date</th>
              <th>End Date</th>
              <th>Duration</th>
              <th>Test Code</th>
              <th>Choose</th>
            </tr>
          </thead>
          
<%

while(rs.next()){
	request.setAttribute("Subject", rs.getString("Subject"));
	request.setAttribute("Start_Date", rs.getString("Start_Date"));
	request.setAttribute("End_Date", rs.getString("End_Date"));
	request.setAttribute("Duration", rs.getString("Duration"));
	request.setAttribute("Test_Code", rs.getString("Test_Code"));

String time =rs.getString("Duration");
int timee = Integer.parseInt(time.substring(0, 2))*60*60*1000  +  Integer.parseInt(time.substring(3,5))*60*1000;
request.getSession().setAttribute("time", timee);
//out.print(request.getSession().getAttribute("time"));
%>
          <tbody>
          
            <tr>
              <td>${Subject}</td>
              <td>${Start_Date}</td>
              <td>${End_Date}</td>
              <td>${Duration}</td>
              <td>${Test_Code}</td>
              <td><a href="examPage.jsp?subject=<%= request.getAttribute("Subject") %>" class="btn btn-success">Start</a>
              <a href="takeTest.jsp?subject=<%= request.getAttribute("Subject") %>" class="btn btn-danger">Delete</a>
              <% session.setAttribute("flag", "true"); %></td>
            </tr>
<%}
	st.close();
	con.close();
%>
	
          </tbody>
        </table>
      </div>
    </div>
  </div>
  <br>
  
<%	
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

%>
  <div class="bg-dark text-white">
    <div class="container">
      <div class="row">
        <div class="col-md-12 mt-3">
          <p class="text-center text-white">© Copyright 2017 Sunil - All rights reserved. </p>
        </div>
      </div>
    </div>
  </div>
  <script src="js/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="js/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
  <script src="js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
  <script src="js/jquery-3.2.1.js"></script>
</body>
</html>