<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>create account</title>

<style type="text/css">

.vertical-menu {
    width: 15%; /* Set a width if you like */
    margin: 20px;
    padding: 20px;
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
  margin: 10px;
  padding: 4px;
}

td{
  font-size:23px;
}

table {
    border-radius:8px;
    -moz-border-radius:10px;
    border:2px solid black;
}

input
{
   -moz-border-radius: 10px;
    border-radius: 8px;
    padding:2px;
    margin:3px;
}

select, option {
    width: 250px;
    border-radius: 8px;
    padding:3px;
    margin:3px;
}

</style>

</head>

<body>

<img src="images/im2.jpg" style="width:100%;height:300px">

<div class="main">

<div class="vertical-menu">
  <a href="#" class="active">User Menu</a>
  <a href="home.html">Home</a>
  <a href="managebankaccount.jsp">Manage Bank Accounts</a>
  <a href="search.jsp">Search Products</a>
  <a href="#">View Recommended Product</a>
  <a href="#">Purchase Cart Products</a>
  <a href="#">View Purchased Products</a>
  <a href="userlogin.jsp">Logout</a>
</div>

<div class="login">
<h2>Add Amount in your Account</h2>
<br><br><br><br>

<form  action="addmoney.jsp" method="post">

<table id="table" width="50%" height="130px" align="center">
<tr></tr>
<tr>
<td></td>
<td>User Name:</td>
<td><input type="text" size=22 name="username" required style="font-size:14pt;"></td>
</tr>

<tr>
<td></td>
<td>Bank Name:</td>
<td><input type="text" size=22 name="bankname" required style="font-size:14pt;"></td>
</tr>

<tr>
<td></td>
<td>Password:</td>
<td><input type="Password" size=22 name="pwd" required style="font-size:14pt;"></td>
</tr>

<tr>
<td></td>

<td>Amount:</td>
<td><input type="text" size=22 name="amount" required style="font-size:14pt;"></td>
</tr>

<tr></tr><tr></tr><tr></tr>

<tr>
<td></td>
<td ><input type="Reset"></td>
<td><input type="submit" onclick="return check(this.form)" value="Add"></td>
</tr>

</table>

 <%
    try
   {
      
       String str1=request.getParameter("username").toString();
 	   String str2=request.getParameter("bankname").toString();
 	   String str3=request.getParameter("pwd").toString();
 	   String str4=request.getParameter("amount").toString();
       
 	  Class.forName("com.mysql.jdbc.Driver");
		
	  Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/e_commerce","root","1234");
	  
	  int amount_to_add=Integer.parseInt(str4);
	  
	  
	  String query1="select amount from banking where username=? and bankname=? and password=?";
	  
		 PreparedStatement stmt1=con.prepareStatement(query1);
		 stmt1.setString(1, str1);
		 stmt1.setString(2, str2);
		 stmt1.setString(3, str3);
		 ResultSet rs=stmt1.executeQuery();
		 int initial_amount=0;
		 while(rs.next())
		 {
			 initial_amount=rs.getInt(1);	
		 }
		 
		 int amount=initial_amount+amount_to_add;
		 
		 //now update the amount column
		 String query2="update banking set amount=? WHERE username=? and bankname=? and password=?";
		 PreparedStatement stmt2=con.prepareStatement(query2);
		 stmt2.setInt(1, amount);
		 stmt2.setString(2, str1);
		 stmt2.setString(3, str2);
		 stmt2.setString(4, str3);
		 stmt2.executeUpdate();
	  
    	
   }
    
    catch(Exception e)
   {
     e.printStackTrace();	
   }

 %>
 
</form>
</div>

</div>


</body>
</html>