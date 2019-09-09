<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>


<% 
   
  try
 {    
	  String str1=session.getAttribute("pname").toString();
	  //out.println(str1);
	  String str2=session.getAttribute("price").toString();
	  //out.println(str2);
	  String str3=session.getAttribute("total_amount").toString();
	  //out.println(str3);
	  String str4=session.getAttribute("bnkname").toString();
	  String str5=session.getAttribute("username").toString();
	  String str6=session.getAttribute("pswd").toString();
	  
	  Class.forName("com.mysql.jdbc.Driver");
	  String url="jdbc:mysql://localhost/e_commerce";
	  String username="root";
	  String password="1234";
	  Connection conn=DriverManager.getConnection(url,username,password);
	  
	  int price=Integer.parseInt(str2);
	  int account_balance=Integer.parseInt(str3);
	  PreparedStatement stmt1=null;
	  PreparedStatement stmt2=null;
	  
	  if(price <= account_balance)
	  {
		  //deduct account balance
		  int new_account_balance=(account_balance - price);
		  String str7=Integer.toString(new_account_balance);
		  
		  String query1="update banking set amount=? where username=? and bankname=?";
		  stmt1=conn.prepareStatement(query1);
		  stmt1.setInt(1, new_account_balance);
		  stmt1.setString(2, str5);
		  stmt1.setString(3, str4);
		  int x1=stmt1.executeUpdate();
		  
		//add product name in purchased column of user activity
		  if(x1 > 0)
		  {
			  String query2="INSERT INTO user_activity(username,password,purchased) VALUES (?,?,?)";

			  stmt2=conn.prepareStatement(query2);

			  stmt2.setString(1,str5);
			  stmt2.setString(2,str6);
			  stmt2.setString(3,str1);

			  int row=stmt2.executeUpdate();
			  //stmt2.clearParameters(); 
			  if(row>0)
			  { 
				  response.sendRedirect("search.jsp");
			  }
			  
		  }
	  }
	  
	  else
	  {
		  %>
		     <script type="text/javascript">
              alert('insufficient account balance');
              window.location.href = "search.jsp";
             </script>
		   
		  <%
	  }
	  
      conn.close();
 }
  
  catch(Exception e)
 {
	 e.printStackTrace(); 
 } 


%>