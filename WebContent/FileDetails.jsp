<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String aname = request.getParameter("aname");
String acode = request.getParameter("acode");
String dep = request.getParameter("dep");
String arr = request.getParameter("arr");
String seat = request.getParameter("seat");
String chrg = request.getParameter("chrg");
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
<title>Flight Details</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Ubuntu&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=DM+Sans&display=swap" rel="stylesheet">
<style type="text/css">

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
<body style="text-align: center;">

	<h3 style="text-align: center; font-family: 'Ubuntu'; color: white;">Flight Details</h3>

	<table align="center">
		<tr>
			<th>ID</th>
			<th>Airline</th>
			<th>Code</th>
			<th>Departure</th>
			<th>Arrival</th>
			<th>Seats</th>
			<th>Price(INR)</th>
		</tr>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from flightdata";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
		<tr>
			<td><%=resultSet.getInt("ID") %></td>
			<td><%=resultSet.getString("Airlines") %></td>
			<td><%=resultSet.getString("Code") %></td>
			<td><%=resultSet.getString("Departure") %></td>
			<td><%=resultSet.getString("Arrival") %></td>
			<td><%=resultSet.getString("Seats") %></td>
			<td><%=resultSet.getString("Charges") %></td>
		</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
	</table>

	<form name="addflight" method="post" action="/Flight-Management-System/DelFlight" style="text-align: center; font-family: 'DM Sans', sans-serif; letter-spacing: 1.13px; color: white; margin-top: 10px;">
		Enter ID to Delete : <input type="text" name="id" style="border-width:0px; border-radius: 4px;" />
		<input type="submit" value="Delete" style="font-family: 'DM Sans', sans-serif; background-color: #ef9761; color: black; padding: 8px; border-radius: 8px; border-bottom: 4px solid white; letter-spacing: 1.1px;border-width:0px; margin-top: 5px; text-align: center;">
	</form>

</body>
</html>