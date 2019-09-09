<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>student</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=70%, initial-scale=1">

<style>

body{
    font-family: Arial;
    margin: 0;
    background-color: #E5CCFF;
}

.main{
    width:100%;
    display:table;
	margin: 0 auto;
}

* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
.mySlides {display: none}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 100%;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

.vertical-menu {
    width: 15%; /* Set a width if you like */
    margin: 10px;
    float: left;
    
}

.vertical-menu a {
    background-color: #eee; /* Grey background color */
    color: black; /* Black text color */
    display: block; /* Make the links appear below each other */
    padding: 12px; /* Add some padding */
    text-decoration: none; /* Remove underline from links */
    border-radius: 4px;
    
}

.vertical-menu a:hover {
    background-color: #ccc; /* Dark grey background on mouse-over */
}

.vertical-menu a.active {
    background-color: #4CAF50; /* Add a green color to the "active/current" link */
    color: white;
    font-size: 20px;
}

.login {
  width: 65%;
  text-align:center;
  float: left;
  margin: 4px;
  padding: 2px;
}

table {
    border-color:#A9A9A9;
    border-radius:8px;
    -moz-border-radius:10px;
}

td{
  font-size:23px;
}

input
{
   -moz-border-radius: 10px;
    border-radius: 8px;
    border-color:#A9A9A9;
    padding:3px;
    margin:3px;
}

</style>

</head>

<body>

<div class="main">

<div class="slideshow-container">

<div class="mySlides fade">
  <img src="images/im1.jpg" style="width:100%;height:300px; ">
  <div class="text">Caption Text</div>
</div>

<div class="mySlides fade">
  <img src="images/im2.jpg" style="width:100%;height:300px; ">
  <div class="text">Caption Two</div>
</div>

<div class="mySlides fade">
  <img src="images/im15.jpg" style="width:100%;height:300px; " align="middle">
  <div class="text">Caption Two</div>
</div>

<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>
<br>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>

<div class="vertical-menu">
  <a href="#" class="active">Sidebar Menu</a>
  <a href="home.html">Home</a>
  <a href="adminlogin.jsp">Admin</a>
  <a href="userlogin.jsp">User</a>
  <a href="#">Analyst</a>
  <a href="signup2.jsp">Register</a>
</div>

<div class="login">
<h2>User Login</h2>

<form name="alogin" method="post" action="userlogin.jsp">

<table id="table" width="35%" height="130px" bgcolor="9999FF" align="center">
<tr></tr>
<tr>
<td></td>
<td>Username:</td>
<td><input type="text" size=18 name="username" required style="font-size:14pt;"></td>
</tr>

<tr>
<td></td>
<td>Password:</td>
<td><input type="Password" size=18 name="pwd" required style="font-size:14pt;"></td>
</tr>

<tr>
<td></td>
<td ><input type="Reset" value="Reset"></td>
<td><input type="submit" onclick="return check(this.form)" value="Login"></td>
</tr>

</table>

</form>

<%

    String str1=request.getParameter("username");
    request.setAttribute("username", str1);
    session.setAttribute("username", str1);
    
    String str2=request.getParameter("pwd");
    request.setAttribute("password", str2);
    
    
try
{   
	   Class.forName("com.mysql.jdbc.Driver");
		
	   Connection con = DriverManager.getConnection
	   ("jdbc:mysql://127.0.0.1:3306/e_commerce", "root", "1234");
	   
	   String query="select *from temp_table where username=? and password=?";
	   PreparedStatement stmt=con.prepareStatement(query);
	   stmt.setString(1, str1);
	   stmt.setString(2, str2);
	   
	   ResultSet rs=stmt.executeQuery();
	   String input1="";
		 while(rs.next())
		 {
			 input1=rs.getString(1);
			 String input2=rs.getString(2);
			 session.setAttribute("uname", rs.getString("username"));
			 session.setAttribute("pswd", rs.getString("password"));
		 }
		  
		 if(input1.equals(""))
		 {
			 %>
			 <script type="text/javascript">
			 	alert("Incorrect Username or Password")
			 	return false;
			 </script>
			 <% 
		 }
		 else
		 {
			 %>
			   <script type="text/javascript">
               alert("login successfull");
               <jsp:forward page="welcomeuser.jsp"/>
               
               </script>
              
              <% 
              
		 }
		 
}

catch( SQLException e)
{
	  out.println(e.getLocalizedMessage());
}

%>

</div>

</div>

<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>

</body>
</html>