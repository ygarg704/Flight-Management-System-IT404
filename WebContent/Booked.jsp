<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bookings</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Ubuntu&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=DM+Sans&display=swap" rel="stylesheet">
<style type="text/css">
	body{
    background: url(img/bg.jpg) no-repeat fixed center / cover; 
      height: 100%;
      min-height: 700px;
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

<% 
Object fname = 	session.getAttribute("fname");
Object lname = 	session.getAttribute("lname");
Object mail = 	session.getAttribute("mail");
Object numb = 	session.getAttribute("numb");
Object aname = 	session.getAttribute("aname");
Object dep = 	session.getAttribute("dep");
Object arr = 	session.getAttribute("arr");
Object peeps = 	session.getAttribute("peeps");
%> 

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
		<tr>
			<td><%= fname %></td>
			<td><%= lname %></td>
			<td><%= mail %></td>
			<td><%= numb %></td>
			<td><%= aname %></td>
			<td><%= dep %></td>
			<td><%= arr %></td>
			<td><%= peeps %></td>			
		</tr>
	</table>

	<div style="text-align: center; margin-top: 20px;">
    	
    	<img src="img/tics.png" style="height: 100px; width: 350px;">

  	</div>



</div>

</body>
</html>