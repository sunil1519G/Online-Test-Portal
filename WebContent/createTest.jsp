<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Creating Test</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="css/bootstrap-4.0.0-beta.1.css" type="text/css"> 
  
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
<%	
	if(session.getAttribute("flag")==null)
		response.sendRedirect("login.jsp");
	else if(session.getAttribute("flag").equals("true")){
		session.setAttribute("flag", "false");
%>
	<div class="alert alert-success alert-dismissable" style="text-align: center">
	  <a href="#" class="close" id="close1" data-dismiss="alert" aria-label="close">&times;</a>
	  <strong>Test Created Successfully!</strong>
	</div>
<%}%>
  <br>
  <div class="container">
    <div class="row">
      <div class="container navbar " style="padding:0px;">
        <div class="col-md-6 " style="text-align: center; padding:0px;"><button class="btn btn-secondary btn-block" id="btn1"><h4>Libraray Questions</h4></button></div>
        <div class="col-md-6 " style="text-align: center; padding:0px;"><button class="btn btn-secondary btn-block" id="btn2"><h4>Create Test</h4></button></div>
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
if(school==null)
	response.sendRedirect("login.jsp");
school = school.replaceAll("\\s+", "").toLowerCase()+"_ques";
//String subject = request.getParameter("subject");
//System.out.println(school);
Connection con;
try {
	con = DriverManager.getConnection(url, user, password);
	Statement st = con.createStatement();
	Statement st1= con.createStatement();
	ResultSet rs1 = st1.executeQuery("select distinct(subject) from "+school+";");
	
%>

      <div class="col-md-12  border border-danger" id="home1" >
<%
	while(rs1.next()) {
	
	ResultSet rs = st.executeQuery("select * from "+school+" where subject='"+rs1.getString("subject")+"';");
		
%>
      	<h6 style="padding-top: 10px; text-align: center;"><%=rs1.getString("subject")%> Questions </h6>
        <hr>
        <table class="table table-bordered">
          <thead>
            <tr>
              <th>Subject</th>
              <th>Question</th>
              <th>option1</th>
              <th>option2</th>
              <th>option3</th>
              <th>option4</th>
            </tr>
          </thead>
<%

while(rs.next()){
	request.setAttribute("Subject", rs.getString("Subject"));
	request.setAttribute("Question", rs.getString("Question"));
	request.setAttribute("option1", rs.getString("option1"));
	request.setAttribute("option2", rs.getString("option2"));
	request.setAttribute("option3", rs.getString("option3"));
	request.setAttribute("option4", rs.getString("option4"));
%>
          <tbody>
            <tr>
              <td>${Subject}</td>
              <td>${Question}</td>
              <td>${option1}</td>
              <td>${option2}</td>
              <td>${option3}</td>
              <td>${option4}</td>
            </tr>
<%}%>	
          </tbody>
        </table><br>
<%
}
st1.close();
st.close();
con.close(); 
%>
      </div>
      <div class="col-md-12  border border-danger" id="home2">
      	<h6 style="padding-top: 10px; text-align: center;">Test Details </h6>
        <hr>
      	<div class="row">
      		<div class="col-md-3"></div>
	      	<div class="col-md-6 border border-secondary">
		      	<form  action="CreateTest" method="post" style="margin: 20px">
				    <div class="form-group">
				      <label>Subject:</label>
				      <input type="text" class="form-control" name="subject" placeholder="subject" required>
				    </div>
				    <div class="form-group">
				      <label>Start Date:</label>
				      <input type="date" class="form-control" name="startDate" placeholder="Start time" required>
				    </div>
				    <div class="form-group">
				      <label>End Date:</label>
				      <input type="date" class="form-control" name="endDate" placeholder="End time" required>
				    </div>
				    <div class="form-group">
				      <label>Test Duration:</label>
				      <input type="time" class="form-control" name="testDur" placeholder="Test Duration" required>
				    </div>
				    <div class="form-group">
				      <label>Test Code:</label>
				      <input type="text" class="form-control" name="testCode" placeholder="Test code" required>
				    </div>
				    <div class="row">
		            <div class="col-md-6 btncss">
		              <br>
		              <button type="submit" class="btn btn-primary btn-block">Create</button>
		            </div>
		            <div class="col-md-6 btncss">
		              <br>
		              <a href="adminPage.jsp"><button type="button" class="btn btn-primary btn-block">back</button></a>
		            </div>
		          </div>
				</form>
	      	</div>
	      	<div class="col-md-3"></div>
      	</div><br>
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
          <p class="text-center text-white">© Copyright 2017 Pingendo - All rights reserved. </p>
        </div>
      </div>
    </div>
  </div>
  <script src="js/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="js/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
  <script src="js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
  <script src="js/jquery-3.2.1.js"></script>
  <script>
  	
  	$(document).ready(function(){
  		
  		//by default
  		$("#home2").hide();
  		$("#btn1").css("background-color", "white");
		$("#btn1").css("color","black");
		
		//when button 1 is clicked
  		$("#btn1").click(function() {
  			$("#home2").hide();
  			$("#home1").show();
  			$("#btn1").css("background-color", "white");
  			$("#btn1").css("color","black");
  			$("#btn2").css("background-color", "#004ea3");
  			$("#btn2").css("color","white");
  		});
  		
		//when button 2 is not clicked
  		$("#btn2").click(function() {
  			$("#home1").hide();
  			$("#home2").show();
  			$("#btn1").css("background-color", "#004ea3");
  			$("#btn1").css("color","white");
  			$("#btn2").css("background-color", "white");
  			$("#btn2").css("color","black");
  		});
  		
  	});
  
  </script>
</body>
</html>