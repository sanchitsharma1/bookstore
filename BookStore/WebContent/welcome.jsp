<%@ page language="java" contentType="text/html charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    %>
    
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/welcomeStyle.css">

<title>Welcome | BookStore</title>
</head>
<header>
	<h1 id="head">BOOKSTORE</h1>
	<nav>
	
		<ul>
		
			<li> <a href="#">HOME</a> </li>
			<li> <a href="about.html">ABOUT</a> </li>
			<li> <a href="#">CONTACT</a> </li>
		
		</ul>
	
	</nav>

</header>
<body>

	<div class='rows'>
	<%
		
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","sanchit");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM books");
		
		while(rs.next()) {

				out.println("<div class='cards'>");
	
					out.println("<div class='image'>");
						out.println("<img src='Images/"+ rs.getString("image_name") +"'>");
						
					int id = rs.getInt("book_id");
	
					out.println("</div>");
				
					out.println("<div class='title'>");
					
						out.println("<h1>"+ rs.getString("book_title") +"</h1>");
	
					out.println("</div>");
	
					out.println("<div class='desc'>");
						out.println("<p>"+ rs.getString("book_author") +"</p><br>");
						out.println("<p><font color='red'>&#x20b9;"+ rs.getFloat("book_price") +"</font></p>");
						
						out.println("<form action='BuyBook'>");
						
							
							out.println("<input type ='submit' id='bookId'  value ='Buy' name='"+ rs.getInt("book_id") +"' >");
						
						out.println("</form>");
					out.println("</div>");
	
				out.println("</div>");
		}
		
	%>
	
	</div>

</body>
</html>