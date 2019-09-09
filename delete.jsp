<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String id=request.getParameter("id");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/e_commerce", "root", "1234");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM add_product WHERE product_id="+id);
if(i>0)
	response.sendRedirect("viewallproducts.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>