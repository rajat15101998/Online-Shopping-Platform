<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>welcomeadmin</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=70%, initial-scale=1">
<link rel="stylesheet" href="welcomeuser.css" type="text/css">

</head>

<body>

<div class="main">

<div class="slideshow-container">

<div class="mySlides fade">
  <img src="images/im1.jpg" style="width:100%;height:300px; ">
  
  <div class="text">Caption Text</div>
</div>

<div class="mySlides fade">
  <img src="images/im2.jpg" style="width:100%;height:300px; ">
  <div class="text">Caption Two</div>
</div>

<div class="mySlides fade">
  <img src="images/im3.jpg" style="width:100%;height:300px; " align="middle">
  <div class="text">Caption Two</div>
</div>

<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>
<br>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>

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

<div class="login">



<h1>WELCOME ADMIN</h1>

<img src="images/im2.jpg" style="width:70%;height:200px; " align="middle">



</div>

</div>


<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>

</body>
</html>

