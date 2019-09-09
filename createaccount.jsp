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
  <a href="#">Search Products</a>
  <a href="#">View Recommended Product</a>
  <a href="#">Purchase Cart Products</a>
  <a href="#">View Purchased Products</a>
  <a href="userlogin.jsp">Logout</a>
</div>

<div class="login">
<h2>User Bank Account Creation</h2>
<br><br><br><br>

<form  action="createaccount.jsp" method="post">

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
<td>E-mail:</td>
<td><input type="email" size=22 name="email" required style="font-size:14pt;"></td>
</tr>

<tr>
<td></td>
<td>Mobile No:</td>
<td><input type="text" size=22 name="mobile" required style="font-size:14pt;"></td>
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
<td><input type="submit" onclick="return check(this.form)" value="Create Account"></td>
</tr>

</table>


 <%

   
   
   try
   {
	   String str1=request.getParameter("username").toString();
	   String str2=request.getParameter("bankname").toString();
	   String str3=request.getParameter("pwd").toString();
	   String str4=request.getParameter("email").toString();
	   String str5=request.getParameter("mobile").toString();
	   String str6=request.getParameter("amount").toString();
	   
	   Class.forName("com.mysql.jdbc.Driver");
		
		Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/e_commerce","root","1234");
		
		
		String sql="INSERT INTO banking(username,bankname,password,e_mail,mobile_no,amount) VALUES (?,?,?,?,?,?)";
		
		PreparedStatement st=con.prepareStatement(sql);
		
	st.setString(1,str1);
	st.setString(2,str2);
	st.setString(3,str3);
	st.setString(4,str4);
	st.setString(5,str5);
	st.setString(6,str6);
	//st.setString(7,mob);

	
	int row=st.executeUpdate();
	 st.clearParameters(); 
	if(row>0)
	{ 
		 response.sendRedirect("managebankaccount.jsp");
	}
	else
	{
		response.sendRedirect("createaccount.jsp");
	}
	
	con.close(); 
   }
   
   catch (Exception e) 
   {
	 e.printStackTrace();
   }

 %>
 
</form>
</div>

</div>

</body>
</html>