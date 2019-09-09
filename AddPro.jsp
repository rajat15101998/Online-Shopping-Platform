<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>add product</title>
<link rel="stylesheet" href="signup2.css" type="text/css">
</head>
<body style="background-image:url(images/im11.jpg)">
     
      <header>
         <h3><font size="12px" face="verdana" align="center">Add Product</font></h3>
      </header>
      
      <article>
          
         
        
           <form method="POST">
           
            <fieldset>
          <legend><span class="number">1</span>basic info</legend>
          <label for="username">Category :</label>
          <input type="text" id="name" name="uname" required>
          
          <label for="password">Product Name:</label>
          <input type="text" id="name" name="pname" required>
          
          <label for="dob">Discreption :</label>
          <input type="text" id="name" name="dis" required>
          
          <label for="email">Price :</label>
          <input type="text" id="mail" name="price" required>
         
          <label for="gender">Brand :</label>
          <input type="text" id="mail" name="brand" required>
        
         
        
          </fieldset>
       
       <button type="submit">Add</button>
          
          
           
            <%  
    
		try {
			   String cname;
			   String pname;
			   String dis;
			   String price;
			   String brand;
			  
			   
			   cname=request.getParameter("uname").toString().toLowerCase();
			   pname=request.getParameter("pname").toString().toLowerCase();
			   dis=request.getParameter("dis").toString().toLowerCase();
			   price=request.getParameter("price").toString().toLowerCase();
			   brand=request.getParameter("brand").toString().toLowerCase();
			  		   

				Class.forName("com.mysql.jdbc.Driver");
				
				Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/e_commerce","root","1234");
				
				
				String sql="INSERT INTO add_product(category,product_name,discreption,price,brand) VALUES (?,?,?,?,?)";
				
				PreparedStatement st=con.prepareStatement(sql);
				
			st.setString(1,cname);
			st.setString(2,pname);
			st.setString(3,dis);
			st.setString(4,price);
			st.setString(5,brand);
			//st.setString(6,add);
			//st.setString(7,mob);
		
			
			int row=st.executeUpdate();
			 st.clearParameters(); 
			if(row>0)
			{ 
				 response.sendRedirect("welcomeadmin.jsp");
			}
			else
			{
				response.sendRedirect("addpro.jsp");
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
             <a href="welcomeadmin.jsp">back to list</a>
            </p>
      </article> 
   

      
</body>
</html>
