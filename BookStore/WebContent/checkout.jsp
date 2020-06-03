<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="com.bookstore.dao.Dao"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/checkoutStyle.css" >
<title>Insert title here</title>
</head>
<header>
	<h1 id="head">BOOKSTORE</h1>
	<nav>

		<ul>

			<li><a href="welcome.jsp">HOME</a></li>
			<li><a href="about.html">ABOUT</a></li>
			<li><a href="contact.html">CONTACT</a></li>

		</ul>

	</nav>

</header>
<body>

	<%
		if(session.getAttribute("username") == null) {
			
			response.sendRedirect("loginPage.jsp");
			
		}
	
		Dao dao = new Dao();

    	String entry = (String) session.getAttribute("book_id");
    	String user = (String) session.getAttribute("username");
		
    	int i = Integer.parseInt(entry);
    	
		Connection con = dao.getConnect();
		PreparedStatement st = con.prepareStatement("SELECT * FROM books WHERE book_id =?");
		st.setInt(1, i);
		ResultSet rs = st.executeQuery();
		rs.next();
		
		String bt = rs.getString(2);
		String ba = rs.getString(3);
		Float bp = rs.getFloat(4);
		String bi = rs.getString(5);
		
		
		Connection conn = dao.getConnect();
		PreparedStatement pst = con.prepareStatement("SELECT * FROM user WHERE uname =?");
		pst.setString(1, user);
		ResultSet res = pst.executeQuery();
		res.next();
		
		String fname = res.getString("fname");
		String lname = res.getString("lname");
		String email = res.getString("email");	
		String address = res.getString("address");
		
		con.close();
		conn.close();
		
		
	%>

	<p align="center">Confirm Order for<br><b>Name: </b> <%=fname + " " + lname%><br><b>Email: </b> <%=email %><br><b>Address: </b> <%=address %> </p>

	<div class='cards'>

		<div class='image'>
			<img src='Images/<%=bi%>'>

		</div>

		<div class='title'>

			<h1> <%=bt %> </h1>

		</div>

		<div class='desc'>
			<p>Amount = Rs.<%=bp %> </p>

			<a href="orderPlaced.html" id='btn'><button>Place Order</button></a>
		</div>

	</div>


</body>
</html>