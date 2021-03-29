<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>
<%
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
<title>Flight Add</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Ubuntu&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=DM+Sans&display=swap" rel="stylesheet">
<style type="text/css">

	input{
		border-radius: 5px;
		border-width:0px;
	}

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

</style>
</head>
<body>
<br>
<br>
<div style="background-color: rgba(0, 0, 0, 0.7); margin-left: 30%; margin-right: 30%; padding-bottom: 50px; border-radius: 20px 20px 20px 20px; color: white; margin-top: 20px;">

	<div style="text-align: center;">
		<img src="img/FMS.png" style="height: 120px; width: 300px; padding-top: 30px;">	
	</div>
	
	<h3 style="text-align: center; padding-bottom: 10px; font-family: 'Ubuntu', sans-serif; letter-spacing: 1.5px;font-size: 20px;">Book Tickets</h3>


	<form name="addflight" method="post" action="/Flight-Management-System/UserFlight" style="text-align: center; font-family: 'DM Sans', sans-serif; letter-spacing: 1.13px;">

		<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select DISTINCT Airlines,Departure,Arrival from flightdata";
resultSet = statement.executeQuery(sql);
%>

<table align="center">


		<tr>
			<td align="right" height="30px">First Name :</td>
		 	<td><input type="text" name="fname"/></td>
		</tr>
		<tr>
			<td align="right" height="30px">Last Name :</td> 
			<td><input type="text" name="lname"/></td> 
		</tr>
		<tr>
			<td align="right" height="30px">Email :</td> 
			<td><input type="email" name="mail"/></td> 
		</tr>
		<tr>
			<td align="right" height="30px">Contact :</td> 
			<td><input type="number" name="numb"/></td> 
		</tr>
		<tr>
			<td align="right" height="30px">Airline :</td> 
			<td>
				<select name="aname">
					<% while(resultSet.next()){ %>
					<option><%= resultSet.getString("Airlines")%></option>
					<%
					}%>
				</select>
			</td> 
		</tr>
		<tr>
			<td align="right" height="30px">Departure :</td> 
			<td>
				<select name="dep">
					<%
					resultSet.beforeFirst();
					while(resultSet.next()){ %>
					<option><%= resultSet.getString("Departure")%></option>
					<% } %>
				</select>
			</td> 
		</tr>
		<tr>
			<td align="right" height="30px">Arrival :</td> 
			<td><select name="arr">
					<% resultSet.beforeFirst();
					while(resultSet.next()){ %>
					<option><%= resultSet.getString("Arrival")%></option>
					<% } %>
				</select></td> 
		</tr>
		<tr>
			<td align="right" height="30px">Passengers :</td> 
			<td><input type="number" name="peeps"/></td> 
		</tr>
		<tr align="center" height="50px">
			<td></td>
			<td align="left"><input type="submit" value="Book" style="font-family: 'DM Sans', sans-serif; background-color: #ef9761; color: black; padding: 8px; border-radius: 0px 8px 0px 8px; border-bottom: 3px solid white; letter-spacing: 1.1px;" /></td>
		</tr>
</table>
</form>

<%
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</div>

</body>
</html>