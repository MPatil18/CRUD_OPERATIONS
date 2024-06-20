<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css" >
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" >

<meta charset="UTF-8">
<title>Insert title here</title>

<style>

		td{
		  padding:10px;
		}
	</style>

</head>
<body style="background-color:powderblue;">
<form action="update" method="post">
<center>

<br><br>
<table border="1" class="center">




		<%
			String em=request.getParameter("email");
		
			Connection connection=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String qry="select * from jspiders.registration where email=?";
			
			try 
			{
				Class.forName("com.mysql.jdbc.Driver");
				connection= DriverManager.getConnection("jdbc:mysql://localhost:3306?user=j2ee&password=root");
				pstmt=connection.prepareStatement(qry);
				pstmt.setString(1,em);
				
				rs=pstmt.executeQuery();
				while(rs.next())
				{
					System.out.println(rs.getString(5));
				
		%>		
	
					<tr>
						<td>
							<h1 style="text-align:center;color:blue;font-weight:bold;">UPDATE USER</h1>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="text" class="form-control" name="em" placeholder="Email" id=input value=<%= rs.getString(3) %>>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="text" class="form-control" name="ps" placeholder="Password" id=input value=<%= rs.getString(4) %>>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="text" class="form-control" name="rps" placeholder="Re-type Password" id=input value=<%= rs.getString(4) %>>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="text" class="form-control" name="fn" placeholder="First Name" id=inputt value=<%= rs.getString(1) %>>
							<br><input type="text" class="form-control" name="ln" placeholder="Last Name" id=inputt value=<%= rs.getString(2) %>>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="radio" name="gender" value="Male">Male
							<input type="radio" name="gender" value="Female">Female
						</td>
					</tr>
					
					<tr>
					<td>
						<select id="country" class="form-control" name="country" value=<%=rs.getString(6)%>>
						<option>Select a country</option>
						<option value="American">American</option>
						<option value="Australia">Australia</option>
						<option value="Canada">Canada</option>
						<option value="Indian">Indian</option>
						<option value="New Zealand">New Zealand</option>
						</select>
					</td>
					</tr>
					
					<%
				}
			}	
			catch(Exception e)
			{
				e.printStackTrace();	
			}
					
					%>
					
					<tr>
						<td><input type="checkbox">I agree with terms and conditions.</td>
					</tr>
					
					<tr>
					<td>
						
							<input type="submit" value="update" class="btn btn-info">
						
					</td> 
					</tr>
				
</table>
</center>
</form>	
</body>
</html>