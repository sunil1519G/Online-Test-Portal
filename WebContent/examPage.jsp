<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="css/bootstrap-4.0.0-beta.1.css" type="text/css"> 
  <title>Online test portal</title>
<%      
	String time= session.getAttribute("time").toString();
    int timee= Integer.parseInt(time);
	//out.print(timee);
%>
<script type="text/javascript">
// Set the date we're counting down to
//var time=document.getElementById("time").value;
var countDownDate = new Date().getTime()+<%=timee%>;

var x = setInterval(function() {

    var now = new Date().getTime();
    
    var distance = countDownDate - now;
    
    // Time calculations for days, hours, minutes and seconds
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    
    document.getElementById("timer").innerHTML = hours + " : " + minutes + " : " + seconds;
   
    if (distance < 0) {
        clearInterval(x);
        document.getElementById("timer").innerHTML = "00 : 00 : 00";
        alert("time's up");
    }
}, 1000);
</script>
  <style type="text/css">
  	 #timer{
  	 	border: 2px solid black;
  	 	border-radius: 16px;
  	 	color: white;
  	 	padding: 5px;
  	 	height: 40px;
  	 	width: 130px;
  	 	text-align: center;
  	 }
  </style>
</head>
<body style="background-image: url(images/bg1.jpg);">
<%
	int quesNo = 0;
	if(session.getAttribute("name")==null)
		response.sendRedirect("login.jsp");     
%>
  <nav class="navbar navbar-expand-md bg-primary navbar-dark">
    <div class="container">
      <a class="navbar-brand" href="#"><i class="fa d-inline fa-lg fa-cloud"></i><b>&nbsp;Online Exam Portal</b></a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar2SupportedContent" aria-controls="navbar2SupportedContent"
        aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
        <div class="bg-secondary" id="timer"></div>
      <div class="collapse navbar-collapse text-center justify-content-end" id="navbar2SupportedContent">
        <a class="btn navbar-btn ml-2 text-white btn-secondary disabled" ><i class="fa d-inline fa-lg fa-user-circle-o"></i>&nbsp;${name}<br> </a>
      	<a href="logout.jsp" class="btn navbar-btn ml-2 text-white btn-secondary disabled" >&nbsp;Logout<br> </a>
      </div>
    </div>
  </nav>
<%
String url = "jdbc:mysql://localhost:3306/testportal";
String user = "root";
String password = "";

if (request.getParameter("quesNo") != null) {
	quesNo = Integer.parseInt(request.getParameter("quesNo"));
}

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

String school = request.getSession().getAttribute("db").toString();
school = school.replaceAll("\\s+", "").toLowerCase()+"_ques";
//String subject = request.getParameter("subject");
//System.out.println(school);
Connection con;
try {
	con = DriverManager.getConnection(url, user, password);
	Statement st = con.createStatement();
	Statement st1 = con.createStatement();
	ResultSet rs = st.executeQuery("select * from "+school+" where Subject='"+request.getParameter("subject")+"';");	//result set of questions.
	ResultSet rs1 = st1.executeQuery("select count(*) from "+school+" where Subject='"+request.getParameter("subject")+"';");	//result set of count.
	rs1.next();
	int totalQuestion = rs1.getInt(1);
	if(quesNo==totalQuestion)
		quesNo=0;
	
%>

 <div class="py-5">
  <div class="container">
    <div class="row">
      <div class="col-sm-7 border border-secondary bg-light"><br>
      <form action="examPage.jsp" method="get">
<%
	for (int i = 0; i < quesNo; i++) {
		rs.next();
	}

	if (rs.next()) {
%>
        <div class="form-group">
		  <label for="comment">Question:</label>
		  <pre class="form-control" id="comment" style="height:100px"><%=rs.getString("Question")%></pre>
		</div>
		
        <div class="col-md-12">
			<!--Radio group-->
			<div class="form-group ">
			    <input name="group100" type="radio">
			    <label><%=rs.getString("option1")%></label>
			</div>
			
			<div class="form-group">
			    <input name="group100" type="radio">
			    <label><%=rs.getString("option2")%></label>
			</div>
			
			<div class="form-group">
			    <input name="group100" type="radio">
			    <label><%=rs.getString("option3")%></label>
			</div>
			<div class="form-group">
			    <input name="group100" type="radio">
			    <label><%=rs.getString("option4")%></label>
			</div>
			<!--Radio group-->    

		</div>
        <div class="row">
          <div class="col-sm-3 mx-auto" style="margin-top:20px;margin-bottom:10px; height:5%">
            <button type="button" class="btn btn-success btn-block">Previous</button>
          </div>
          <div class="col-sm-3 mx-auto" style="margin-top:20px;margin-bottom:10px; height:5%">
            <button type="button" class="btn btn-success btn-block">Mark as Review</button>
          </div>
          <div class="col-sm-3 mx-auto" style="margin-top:20px;margin-bottom:10px; height:5%">
            <button type="button" class="btn btn-success btn-block">Save</button>
          </div>
          <div class="col-sm-3 mx-auto" style="margin-top:20px;margin-bottom:10px; height:5%">
          	<input type="hidden" name="quesNo" value="<%=quesNo + 1%>">
          	<input type="hidden" name="subject" value="<%=request.getParameter("subject")%>">
            <button type="submit" class="btn btn-success btn-block">Next</button>
          </div>
        </div>
        </form>
      </div>
<%}%>
      <div class="col-sm-1"></div>
      <div class="col-sm-3 border border-secondary bg-light" style="text-align: center"><br>
<%
	int i=1;
	while(totalQuestion>0){
		request.setAttribute("i", i);
%>
        <div style="display:inline; margin: 10px;">
          <a href="#" type="button" class="btn btn-lg"> ${i} </a>
        </div>
<%
	if(i==3){
		out.println("<br><br>");
	}
	i++;
	totalQuestion--;
	}
%><br><br>
		<a href="submitTest.jsp" class="btn btn-success">submit</a>
      </div>
    </div>
  </div>
</div>
<%	
	st.close();
	st1.close();
	con.close();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

%>
  <script src="js/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="js/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
  <script src="js/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</body>
</html>