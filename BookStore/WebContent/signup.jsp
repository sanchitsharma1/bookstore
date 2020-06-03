<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/signStyle.css" >
<meta charset="ISO-8859-1">
<title>Sign Up | BookStore</title>
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

<%

	if(session.getAttribute("username") != null) {
		response.sendRedirect("loginPage.jsp");
	}

%>

<div class = "signin" align="center">

		<form action="Signup" method="post">
			
			<h2 style="color: white">Sign Up</h2><br><br>
			<input type="text" name="fname" placeholder="First Name">
			
			<input type="text" name="lname" placeholder="Last Name">
			
			<input type="text" name="email" placeholder="Email">
			
			<input type="text" name="address" placeholder="Address">
			
			<input type="text" name="username" placeholder="Username">
			
			<input type="password" name="password" placeholder="Password"><br><br>
			
			<input type="submit" value="Sign Up"><br>
			
			<br><br>
			Already have an Account ?<a href="loginPage.jsp" id="sign">&nbsp;Log In</a>
				
		</form>
		
	</div>
</body>
</html>