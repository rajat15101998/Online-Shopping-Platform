<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>view all products</title>

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
  <a href="#" class="active">Admin Menu</a>
  <a href="home.html">Home</a>
  <a href="view_all_users.jsp">View All Users</a>
  <a href="AddPro.jsp">Add Products</a>
  <a href="viewallproducts.jsp">View All Products</a>
  <a href="admin_viewrecommended.jsp">View Recommended Products</a>
  <a href="admin_viewpurchased.jsp">View Purchased Products</a>
  <a href="adminlogin.jsp">Logout</a>
</div>

<div class="middle">
<h2>Products Database</h2>
<hr>
<br><br>

<table style="width:70%" id="t01">
<tr>
<th>CATEGORY</th>
<th>PRODUCT NAME</th>
<th>PRICE</th>
<th>BRAND</th>
<th>DELETE</th>

</tr>

 <%
     

   try
  {
    Class.forName("com.mysql.jdbc.Driver");
    String url="jdbc:mysql://localhost/e_commerce";
    String username="root";
    String password="1234";
    String query="select * from add_product";
    
    Connection conn=DriverManager.getConnection(url,username,password);
    Statement stmt=conn.createStatement();
    ResultSet rs=stmt.executeQuery(query);
       while(rs.next())
    {
	
 %>
     <tr>
     <td><%=rs.getString("category") %></td>
     <td><%=rs.getString("product_name") %></td>
     <td><%=rs.getString("price") %></td>
     <td><%=rs.getString("brand") %></td>
     <td><a href="delete.jsp?id=<%=rs.getString("product_id") %>"><button type="button" class="delete">Delete</button></a></td>
     </tr>
 <%

 }
       
 %>

    </table>
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