<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>recommend products</title>

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
  width: 60%;
  text-align:center;
  float: left;
  margin: 4px;
  padding: 2px;
}

.middle p {
  font-size: 20px;
}

.middle input[type=text] {
  float: center;
  padding: 6px;
  margin-top: 8px;
  margin-right: 16px;
  border: 2px solid gray;
  font-size: 17px;
 
}

.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 15px;
  margin: 0px;
  cursor: pointer;
  width: 100px;
}

.button2 {border-radius: 4px;}

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
<h2>Recommend Products</h2>
<br><br>

<form name="frm" method="post" action="recommend2.jsp">
<br><br>
<input type="text" name="user" placeholder="recommend to.." >
<br><br>
<input type="submit" class="button button2" onclick="return check(this.form)" value="Recommend  "/> 
</form>

</div>

</div>

<script type="text/javascript">
   function check(form)
  {

    if(form.product_name.value == "" || form.recommend.value == "")
     {
       alert("Fill the choices first")
 	   return false;
     }
    else
     {
	   return true;
     }
  }
</script>

</body>
</html>