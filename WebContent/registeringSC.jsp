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
  <title>Registering colleges....</title>  
  <script type="text/javascript">
  	
  	function validate(){
  		
  		var uname = document.forms.adminName.value;
  		var pass = document.forms.password.value;
  		var email = document.forms.email.value;
  		var scname = document.forms.scName.value;
  		var pass1 = document.forms.password1.value;
  		
  		if(uname==""){
  			alert("Please enter your name!");
  			document.forms.adminName.focus();
  			return false;
  		}
  		if(scname==""){
  			alert("Please enter your College name!");
  			document.forms.scName.focus();
  			return false;
  		}
  		if(email==""){
  			alert("Please enter your email address!");
  			document.forms.email.focus();
  			return false;
  		}
  		if(pass==""){
  			alert("Please enter your password!");
  			document.forms.password.focus();
  			return false;
  		}
  		if(pass1==""){
  			alert("Please enter your password!");
  			document.forms.password1.focus();
  			return false;
  		}
  		
  		if(pass!=pass1){
  			alert("Password not matched!!");
  			document.forms.password1.focus();
  			return false;
  		}
  		
  		alert("Registered Successfully!!");
  	}
  	
  </script>
</head>

<body>
  <nav class="navbar navbar-expand-md bg-primary navbar-dark">
    <div class="container">
      <a class="navbar-brand" href="index.jsp"><i class="fa d-inline fa-lg fa-cloud"></i><b> Online Exam Portal</b></a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar2SupportedContent" aria-controls="navbar2SupportedContent" aria-expanded="false"
        aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
      <div class="collapse navbar-collapse text-center justify-content-end" id="navbar2SupportedContent">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="#"><i class="fa d-inline fa-lg fa-bookmark-o"></i> Bookmarks</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#"><i class="fa d-inline fa-lg fa-envelope-o"></i> Contacts</a>
          </li>
        </ul>
        <a href="login.jsp" class="btn navbar-btn ml-2 text-white btn-secondary"><i class="fa d-inline fa-lg fa-user-circle-o"></i> Sign in</a>
      </div>
    </div>
  </nav>
  <div class="py-5">
    <div class="container">
      <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6 border border-primary" style="padding: 40px">
          <form name="forms" method="post" action="RegisterValidation">
            <h2 style="text-align: center">
              Register Your School/College.
            </h2>
            <br>
            <div class="form-group"> <label>Enter Your Name :</label>
              <input type="text" name="adminName" class="form-control" placeholder="Enter name"> </div>
            <div class="form-group"> <label>Enter Your School/College Name :</label>
              <input type="text" name="scName" class="form-control" placeholder="Enter School/College"> </div>
            <div class="form-group"> <label>Enter your E-mail :</label>
              <input type="email" name="email" class="form-control" placeholder="Enter email"> </div>
            <div class="form-group"> <label>Enter Password :</label>
              <input type="password" name="password" class="form-control" placeholder="Password"> </div>
            <div class="form-group"> <label>Re-enter Your Password :</label>
              <input type="password" name="password1" class="form-control" placeholder="Password"> </div>
            <button type="submit" onClick="return validate();" class="btn btn-primary">Submit</button>
          </form>
        </div>
        <div class="col-md-3"></div>
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