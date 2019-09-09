<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>search result</title>

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
<h2>Product Details</h2>
<br><br>

<table style="width:70%" id="t01">

 <%
     
     String id=request.getParameter("id");

   try
  {
    Class.forName("com.mysql.jdbc.Driver");
    String url="jdbc:mysql://localhost/e_commerce";
    String username="root";
    String password="1234";
    String query="select * from add_product where product_id="+id;
    
    Connection conn=DriverManager.getConnection(url,username,password);
    Statement stmt=conn.createStatement();
    ResultSet rs=stmt.executeQuery(query);
       while(rs.next())
    {
	
 %>
     <tr>
     <td>Brand</td><td><%=rs.getString("brand") %></td>
     </tr>
     <tr>
     <td>Product Name</td><td><%=rs.getString("product_name") %></td>
     <%
       session.setAttribute("pname", rs.getString("product_name"));
     %>
     </tr>
     <tr>
     <td>Price</td><td><%=rs.getString("price") %></td>
     <%
       session.setAttribute("price", rs.getString("price"));
     %>
     </tr>
     <tr>
     <td>Description</td><td><%=rs.getString("discreption") %></td>
     </tr>
  
     
 <%

 }
       
 %>
    
    
    </table>
    <br><br>
        
    <a href="cart.jsp">Add To Cart</a>
    <br><br>
    <a href="recommend.jsp">Recommend</a>
    <br><br>
    <a href="purchase.jsp">Purchase</a><br><br>
    
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
</div>

</div>
</body>
</html>