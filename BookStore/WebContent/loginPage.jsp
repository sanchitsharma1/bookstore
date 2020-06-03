<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/loginStyle.css" >
<title>Login | BookStore</title>
</head>
<header>
	<h1 id="head">BOOKSTORE</h1>
	<nav>
	
		<ul>
		
			<li> <a href="welcome.jsp">HOME</a> </li>
			<li> <a href="about.html">ABOUT</a> </li>
			<li> <a href="contact.html">CONTACT</a> </li>
		
		</ul>
	
	</nav>

</header>
<body>

	<div class = "signin" align="center">

		<form action="Login" method="post">
			
			<h2 style="color: white">Log In</h2><br><br>
			
			<input type="text" name="username" placeholder="Username">
			
			<input type="password" name="password" placeholder="Password"><br><br>
			
			<input type="submit" value="Log In"><br><br>
			
			<br><br><br><br><br><br>
			Don't have an account ?<a href="signup.jsp" id="sign">&nbsp;Sign Up</a>


		</form>
		
	</div>

</body>
</html>