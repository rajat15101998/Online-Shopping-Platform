<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>add product</title>

<link rel="stylesheet" href="addproduct.css" type="text/css">

</head>

<body>



 <% 
    String category=request.getParameter("category").toString();
    String product_name=request.getParameter("pname").toString();
    String discription=request.getParameter("discription").toString();
    String price=request.getParameter("price").toString();
    String brand=request.getParameter("brand").toString();
 
 %>
 
   <%
     
	try {
			  			   
		 Class.forName("com.mysql.jdbc.Driver");
				
		 Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/e_commerce","root","1234");
				
				
		 String sql="INSERT INTO add_product(category,product_name,discription,price,brand) VALUES(?,?,?,?,?)";
				
		 PreparedStatement st=con.prepareStatement(sql);
				
			st.setString(1,category);
			st.setString(2,product_name);
			st.setString(3,discription);
			st.setString(4,price);
			st.setString(5,brand);
			
			int row=st.executeUpdate();
			out.println(row);
			 st.clearParameters(); 
			if(row>0)
			{ 
			   response.sendRedirect("welcomeadmin.jsp");
			}
			
			else
			{
				response.sendRedirect("home.html");
			}
			
			con.close();
			
		  }
		
		catch (Exception e) 
		
		{
			e.getStackTrace();
		}
  
 %>
 
</body>
</html>