<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="css/bootstrap-4.0.0-beta.1.css" type="text/css"> 
  <title>Admin Login Page..</title>  
  <script type="text/javascript">
  	
  	function validate(){
  		var uname = document.forms.email.value;
  		var pass = document.forms.pass.value;
  		
  		if(uname==""){
  			alert("Please enter your email address!");
  			document.forms.email.focus();
  			return false;
  		}
  		if(pass==""){
  			alert("Please enter your password!");
  			document.forms.pass.focus();
  			return false;
  		}
  	}
  	
  </script>
</head>

<body class="bg-light">
<%
	if(session.getAttribute("name")!=null)
		response.sendRedirect("adminPage.jsp");
%>
  <nav class="navbar navbar-expand-md bg-primary navbar-dark">
    <div class="container">
      <a class="navbar-brand" href="index.jsp"><i class="fa d-inline fa-lg fa-cloud"></i><b>Online Exam Portal</b></a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar2SupportedContent" aria-controls="navbar2SupportedContent" aria-expanded="false"
        aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
      <div class="collapse navbar-collapse text-center justify-content-end" id="navbar2SupportedContent">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="#"><i class="fa d-inline fa-lg fa-bookmark-o"></i> Bookmarks</a>
          </li>
        </ul>
        <a class="btn navbar-btn ml-2 text-white btn-secondary" href="login.jsp"><i class="fa d-inline fa-lg fa-user-circle-o"></i> Sign in</a>
      </div>
    </div>
  </nav>
  <div class="py-5">
    <div class="container">
      <h1 class="mb-4 w-50 h1-align border border-primary">Admin Login</h1>
      <div class="row">
        <div class="col-md-3"> </div>
        <div class="col-md-6">
          <div class="card text-white p-5 border border-primary" id="login-bg">
            <div class="card-body" style="color:black">
              <form name="forms" action="LoginValidation" method="post">
                <div class="form-group"> <label>Email address</label>
                  <input type="email" class="form-control border border-primary" name="email" placeholder="Enter email"> </div>
                <div class="form-group"> <label class="">Password</label>
                  <input type="password" class="form-control border border-primary" name="pass" placeholder="Password"> </div>
                <button type="submit" onClick="return validate();" class="btn btn-secondary">Login</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="bg-dark text-white">
    <div class="container" style=" bottom: 0px">
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
</body>
</html>