<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Signing up students</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="css/bootstrap-4.0.0-beta.1.css" type="text/css"> </head>

<body>
  <nav class="navbar navbar-expand-md bg-primary navbar-dark">
    <div class="container">
      <a class="navbar-brand" href="#"><i class="fa d-inline fa-lg fa-cloud"></i><b> Online Exam Portal</b></a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar2SupportedContent" aria-controls="navbar2SupportedContent" aria-expanded="false"
        aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
      <div class="collapse navbar-collapse text-center justify-content-end" id="navbar2SupportedContent">
      <%
	      if(session.getAttribute("name")==null)
				response.sendRedirect("login.jsp");
      
      %>
        <a href="#" class="btn navbar-btn ml-2 text-white btn-secondary"><i class="fa d-inline fa-lg fa-user-circle-o"></i>&nbsp;${name}<br> </a>
        <a href="logout.jsp" class="btn navbar-btn ml-2 text-white btn-secondary">&nbsp;Logout<br> </a>
      </div>
    </div>
  </nav>
  <%
	String flag = session.getAttribute("flag").toString();
	if(flag.equals("true")){
		session.setAttribute("flag", "false");
	%>
	<div class="alert alert-success alert-dismissable" style="text-align: center">
	  <a href="#" class="close" id="close1" data-dismiss="alert" aria-label="close">&times;</a>
	  <strong>Signed up Successfully!</strong>
	</div>
	<%
}%>
  <div class="py-5">
    <div class="container">
      <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6 h2c text-danger border border-dark">
          <h2 class="h2">SignUp Students</h2>
        </div>
        <div class="col-md-3"></div>
      </div>
    </div>
    <br>
    <div class="container">
      <div class="row">
        <div class="col-md-12" style="padding: 0px 250px;">
          <form action="SignUpStudent" style="padding: 50px;" class="border border-primary" method="post"> <label>Student Name:</label>
            <input type="text" id="InputName" placeholder="name" class="form-control" name="name" required> <label>Exam Roll No:</label>
            <input type="text" id="InputName" placeholder="exam roll no" name="examroll" class="form-control" required> <label>Class:</label>
            <input type="number" id="InputName" placeholder="class" class="form-control" name="class" required> <label>Password:</label>
            <input type="password" id="InputName" placeholder="password" name="pass" class="form-control" required> 
          	<hr>
          	<div class="container">
	          <div class="row">
	            <div class="col-md-6 btncss">
	              <br>
	              <button type="submit" class="btn btn-secondary btn-block">Add</button>
	            </div>
	            <div class="col-md-6 btncss">
	              <br>
	              <a href="adminPage.jsp"><button type="button" class="btn btn-secondary btn-block">Back</button></a>
	            </div>
	          </div>
        	</div>
          </form>
        </div>
      </div>
    </div>
  </div>
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
  <script src="/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</body>

</html>