<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css" >
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" >

<meta charset="UTF-8">
<title>JSP Fetch DATA</title>

	<style>
		td{
		  padding:10px;
		}
	</style>
	
	<script>
		function checkforblank()
		{
			var em=document.register.em;
				if(em.value.length<=0)	
					{
						
						em.focus(); // move cursor to perticulor field
						return false;
					}
			var p=document.register.ps;
				if(p.value.length<=0)	
					{	
						
						p.focus(); // move cursor to perticulor field
						return false;
						if(Number.isInterger(p))
						{
							return true;
						}
						else
						{
							return false;
						}
						
					}
				
				
			var fn=document.register.fn;
				if(fn.value.length<=0)	
					{
					    
						fn.focus(); // move cursor to perticulor field
						return false;
					}
			var ln=document.register.ln;
				if(ln.value.length<=0)	
					{ 
						
						ln.focus(); // move cursor to perticulor field
						return false;
					}
			
			var country=document.register.country;
				if(country.value.length<=0)	
					{
						
						country.focus(); // move cursor to perticulor field
						return false;
					}
			
		}
	</script>
	
	
</head>
<body style="background-color:powderblue;">
<form action="save" name="register" method="post" onsubmit="return checkforblank()">

<div>
<center>
<br>
<table>
<tr>
<td>
	<table border=1 class="center">
		
		<tr>
		<td>
			<h1 style="text-align:center;color:blue;font-weight:bold;">ADD NEW USER</h1>
		</td>
		</tr>
		
		<tr>
		<td><br>
		<input type="text" class="form-control" name="em" placeholder="Email" id=input></td>
		</tr>
		
		<tr>
		<td><input type="text" class="form-control" name="ps" placeholder="Password" id=input></td>
		</tr>
		
		<tr>
		<td><input type="text" class="form-control" name="rps" placeholder="Re-type Password" id=input></td>
		</tr>
		
		<tr>
		<td><input type="text" class="form-control" name="fn" placeholder="First Name" id=inputt><br>
		<input type="text" class="form-control" name="ln" placeholder="Last Name" id=inputt></td>
		</tr>
		
		<tr>
		<td><input type="radio" name="gender" value="Male">Male
		<input type="radio"  name="gender" value="Female">Female</td>
		</tr>
		
		<tr>
		<td>
		<select id="country"  class="form-control" name="country">
		<option>Select a country</option>
		<option value="American">American</option>
		<option value="Australia">Australia</option>
		<option value="Canada">Canada</option>
		<option value="Indian">Indian</option>
		<option value="New Zealand">New Zealand</option>
		</select>
		</td>
		</tr>
		
		<tr>
		<td><input type="checkbox" >I agree with terms and conditions.</td>
		</tr>
		
		
		
		<tr><td>
				<br>
				<input type="submit" value="save" class="btn btn-info">
				<input type="reset" value="reset" class="btn btn-warning">
		</td></tr>
		
</table>
</form>
</div>
</td>
<td>

	<table border="1">
		<tr style="background-color: skyblue;color:blue;font-weight:bold;">
			<td>FIRST NAME</td>
			<td>LAST NAME</td>
			<td>EMAIL</td>
			<td>PASSWORD</td>
			<td>GENDER</td>
			<td>COUNTRY</td>
			<td>ACTIONS</td>
		</tr>
		<%
			Connection connection=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String qry="select * from jspiders.registration";
			
			try 
			{
				Class.forName("com.mysql.jdbc.Driver");
				connection= DriverManager.getConnection("jdbc:mysql://localhost:3306?user=j2ee&password=root");
				pstmt=connection.prepareStatement(qry);
				rs=pstmt.executeQuery();
				
				
				while(rs.next())
				{
					String em=rs.getString("email");
					
					%>
						<tr>
							<td><%= rs.getString(1) %></td>
							<td><%= rs.getString(2) %></td>
							<td><%= rs.getString(3) %></td>
							<td><%= rs.getString(4) %></td>
							<td><%= rs.getString(5) %></td>
							<td><%= rs.getString(6) %></td>
						
							<td>
								<a href="update.jsp?email=<%=em%>" class="btn btn-light">Edit</a>
								<a href="delete.jsp?email=<%=em%>" class="btn btn-light">Delete</a>
							</td>
						
						</tr>
					<%
				}
			}	
			catch(Exception e)
			{
				
			}
		%>
	</table>
</center>
</td>
</tr>
</table>
</body>
</html>