<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String mail =   request.getParameter("mail");
String phone =   request.getParameter("phone");
String aname =  request.getParameter("aname");
String code =  request.getParameter("code");
String dep =  request.getParameter("dep");
String arr =  request.getParameter("arr");
String peeps =  request.getParameter("peeps");

String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "flight_mng";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Details</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Ubuntu&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=DM+Sans&display=swap" rel="stylesheet">
<style type="text/css">

	body{
    background: url(img/bg.jpg) no-repeat fixed center / cover; 
      height: 100%;
      min-height: 700px;
  }

	ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
  border-radius: 16px;
}

li a {
  float: left;
  font-family: 'DM Sans';
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #ef9761;
}

td, th {
  padding: 8px;
  font-family: 'DM Sans', sans-serif;
}

table {
  border-collapse: collapse;
  width: 100%;
}

tr:nth-child(odd){background-color: #f2f2f2}
tr:nth-child(even){background-color: #ffffff}

th{
	background-color: #ef9761;
  	color: white;
  	font-family: 'Ubuntu', sans-serif;
  	letter-spacing: 1.1px;
}

td {
  text-align: center;
}

</style>
</head>
<body>

	<ul>
  <li><a href="AdminDash.html">DashBoard</a></li>
  <li><a href="AddFlight.html">Add Flight</a></li>
  <li><a href="Bookings.jsp">Bookings</a></li>
</ul>
<br>

<div style="background-color: rgba(0, 0, 0, 0.3); border-radius: 20px 20px 20px 20px; color: white; padding: 20px;">

	<div style="text-align: center;">
    	<img src="img/FMS.png" style="height: 120px; width: 300px;"> 
  	</div>

	<h3 style="text-align: center; font-family: 'Ubuntu'; color: white;">Booking Details</h3>

	<table align="center" style="color: black;">
		<tr>
			<th>FirstName</th>
			<th>LastName</th>
			<th>Email</th>
			<th>Contact</th>
			<th>Airline</th>
			<th>Departure</th>
			<th>Arrival</th>
			<th>Passengers</th>
		</tr>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from bookings";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
		<tr>
			<td><%=resultSet.getString("FirstName") %></td>
			<td><%=resultSet.getString("Lastname") %></td>
			<td><%=resultSet.getString("Email") %></td>
			<td><%=resultSet.getString("Contact") %></td>
			<td><%=resultSet.getString("Airline") %></td>
			<td><%=resultSet.getString("Departure") %></td>
			<td><%=resultSet.getString("Arrival") %></td>
			<td><%=resultSet.getString("Passengers") %></td>
		</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
	</table>

</div>
</body>
</html>