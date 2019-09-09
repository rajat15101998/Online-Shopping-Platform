<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Student</title>
<link rel="stylesheet" href="signup2.css" type="text/css">
</head>
<body style="background-image:url(images/im11.jpg)">
     
      <header>
         <h3><font size="12px" face="verdana" align="center">SignUp</font></h3>
      </header>
      
      <article>
          
         
           <form method="POST">
           
            <fieldset>
          <legend><span class="number">1</span>Your basic info</legend>
          <label for="username">User Name:</label>
          <input type="text" id="name" name="username" required>
          
          <label for="password">Password:</label>
          <input type="password" id="name" name="password" required>
          
          <label for="dob">Date_Of_Birth :</label>
          <input type="text" id="name" name="dob" required>
          
          <label for="email">Email:</label>
          <input type="email" id="mail" name="email" required>
         
          <label for="gender">Gender :</label>
          <input type="text" id="mail" name="gender" required>
        
          <label for="add">Address :</label>
          <input type="text" id="mail" name="add" required>
         
          <label for="mob">Mobile no:</label>
          <input type="text" id="mail" name="mob" required>
        
          </fieldset>
       
       <button type="submit">Sign Up</button>
          
           
            <%  
    
		try {
			   String username;
			   String password;
			   String dob;
			   String email;
			   String gender;
			   String add;
			   String mob;
			
			   
			   username=request.getParameter("username").toString().toLowerCase();
			   password=request.getParameter("password").toString().toLowerCase();
			   dob=request.getParameter("dob").toString().toLowerCase();
			   email=request.getParameter("email").toString().toLowerCase();
			   gender=request.getParameter("gender").toString().toLowerCase();
			   add=request.getParameter("add").toString().toLowerCase();
			   mob=request.getParameter("mob").toString().toLowerCase();
			  			   

				Class.forName("com.mysql.jdbc.Driver");
				
				Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/e_commerce","root","1234");
				
				
				String sql="INSERT INTO temp_table(username,password,e_mail,data_of_birth,gender,address,mobile_no) VALUES(?,?,?,?,?,?,?)";
				
				PreparedStatement st=con.prepareStatement(sql);
				
			st.setString(1,username);
			st.setString(2,password);
			st.setString(3,email);
			st.setString(4,dob);
			st.setString(5,gender);
			st.setString(6,add);
			st.setString(7,mob);
		
			
			int row=st.executeUpdate();
			 st.clearParameters(); 
			if(row>0)
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
          
           
    </form>        
            
            <p>
             <a href="home.html">back to list</a>
            </p>
      </article> 
   

      
</body>
</html>
