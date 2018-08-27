<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New Admins</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="css/bootstrap-4.0.0-beta.1.css" type="text/css">
</head>

<body class="">
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
	if(session.getAttribute("flag").equals("true")){
		session.setAttribute("flag", "false");
	%>
	<div class="alert alert-success alert-dismissable" style="text-align: center">
	  <a href="#" class="close" id="close1" data-dismiss="alert" aria-label="close">&times;</a>
	  <strong>New Admin Added Successfully!</strong>
	</div>
	<%
}%>
  <div class="py-5">
    <div class="container">
      <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4 h2c text-danger border border-dark">
          <h2 class="h2">Add New Admin</h2>
        </div>
        <div class="col-md-4"></div>
      </div>
    </div>
    <br>
    <div class="container">
      <div class="row">
      	<div class="col-md-3"></div>
        <div class="col-md-6">
          <form action="Addnewadmin" method="post" style="padding: 50px;" class="border border-primary"> <label>Admin Name:</label>
            <input type="text" id="InputName" placeholder="name" name="name" class="form-control" required> <label>E-mail:</label>
            <input type="email" id="InputName" placeholder="email" name="email" class="form-control" required> <label>Password:</label>
            <input type="password" id="InputName" placeholder="password" class="form-control" name="pass" required> 
            <hr>
            <div class="container">
	          <div class="row">
	            <div class="col-md-6 btncss">
	              <br>
	              <button type="submit" class="btn btn-secondary btn-block">Add</button>
	            </div>
	            <div class="col-md-6 btncss">
	              <br>
	              <a href="adminPage.jsp"><button type="button" class="btn btn-secondary btn-block">back</button></a>
	            </div>
	          </div>
        	</div>
          </form>
        </div>
        <div class="col-md-3"></div>
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
  <script src="js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
  <script src="js/jquery-3.2.1.js"></script>
</body>

</html>