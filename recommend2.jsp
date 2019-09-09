<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>


<%String str2=session.getAttribute("pname").toString(); %>

<%String str1=request.getParameter("user").toString(); %>

<% 

try
{
	
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/e_commerce", "root", "1234");

String query="INSERT INTO user_activity(username,recommended) VALUES (?,?)";

PreparedStatement st=con.prepareStatement(query);

st.setString(1,str1);
st.setString(2,str2);

int row=st.executeUpdate();
st.clearParameters(); 
if(row>0)
{ 
	 response.sendRedirect("search.jsp");
}

con.close();

}

catch (Exception e) 
{
 e.getStackTrace();
}


%>