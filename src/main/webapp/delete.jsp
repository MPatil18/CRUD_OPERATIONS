<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
		String em=request.getParameter("email");
		Connection con=null;
		PreparedStatement pstmt=null;

		String qry = "delete from jspiders.registration where email=?";
		try  
		{
				Class.forName("com.mysql.jdbc.Driver");
				con= DriverManager.getConnection("jdbc:mysql://localhost:3306?user=j2ee&password=root");
				pstmt=con.prepareStatement(qry);
				pstmt.setString(1,em);
				pstmt.executeUpdate();
				
				
				
				
		}	
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		%>
		<script>
			alert("record deleted");
		</script>
		<%
		String redirect="fetchdata.jsp";
		response.sendRedirect(redirect);
		
		%>
		

</body>
</html>