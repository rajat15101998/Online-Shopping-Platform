<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>purchase </title>

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

.middle {
  width: 70%;
  text-align:center;
  align: center;
  margin: 10px;
  padding: 4px;
}

h2{
 text-align:center;
 color:red;
 font-size:30px;
}

table, th, td {
    border: 2px solid black;
    border-collapse: collapse;
    padding : 4px;
}

table#t01 {
    width: 100%;    
    background-color: #f1f1c1;
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

<div class="middle">

<br><br><br><br><br>

<table style="width:70%" id="t01">

 <%
     
     
     
   try
  {
	   String str1=session.getAttribute("username").toString();
	   //out.println(str1);
	   String str2=session.getAttribute("price").toString();
	     
    Class.forName("com.mysql.jdbc.Driver");
    String url="jdbc:mysql://localhost/e_commerce";
    String username="root";
    String password="1234";
    Connection conn=DriverManager.getConnection(url,username,password);
    
    String query="select *from banking where username=?";
	PreparedStatement stmt=conn.prepareStatement(query);
	stmt.setString(1, str1);
	   
	   ResultSet rs=stmt.executeQuery();
   
       while(rs.next())
    {
	
 %>
     <tr>
     <td>Bank Name</td><td><%=rs.getString("bankname") %></td>
     <%
       session.setAttribute("bnkname", rs.getString("bankname"));
     %>
     </tr>
     <tr>
     <td>Account Balance</td><td><%=rs.getString("amount") %></td>
     <%
       session.setAttribute("total_amount", rs.getString("amount"));
     %>
     </tr>
     <tr>
     <td>Product Price</td><td><% out.println(str2); %></td>
     </tr>
 <%

 }
       
 %>
    
    </table>
    <br><br>
    
    <%
      rs.close();
      stmt.close();
      conn.close();
    }
 
  catch(Exception e)
    {
      e.printStackTrace();
    }

%>

<br><br>
<a href="confirmpurchase.jsp">Confirm Purchase</a><br><br>

</div>

</div>
</body>
</html>