<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>purchased products</title>

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
  width: 65%;
  text-align:center;
  float: left;
  margin: 10px;
  padding: 4px;
}

table, th, td {
    border: 2px solid black;
    border-collapse: collapse;
    padding : 4px;
}
th{
    color: red;
    padding:8px;
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
<h2>Following are the Purchased Products</h2>
<br><br>

<table style="width:70%" id="t01">
 
   <tr>
   <th>Product Name</th><th>Frequency</th>
   </tr>
   
 <% 
 
try
  {
	
    Class.forName("com.mysql.jdbc.Driver");
    String url="jdbc:mysql://localhost/e_commerce";
    String username="root";
    String password="1234";
    String query="select * from user_activity";
    
    Connection conn=DriverManager.getConnection(url,username,password);
    Statement stmt=conn.createStatement();
    ResultSet rs=stmt.executeQuery(query);
    String name="";
    HashMap<String,Integer> hmap=new HashMap<>();
    
       while(rs.next())
     {
         name=rs.getString("purchased"); 
         
            if(name!=null)
           {
            	if(hmap.containsKey(name))
            		hmap.put(name, hmap.get(name)+1);
            	else
            		hmap.put(name, 1);
           }
     }
        
        for(String obj:hmap.keySet())
        {
        	%>
        	  <tr>
       	      <td><%out.println(obj); %></td><td><%out.println(hmap.get(obj)); %></td>
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