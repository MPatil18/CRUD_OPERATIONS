

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/update")
public class update extends HttpServlet {
		protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			System.out.println("hiiii harshal123");
			
			
			String email=req.getParameter("em");
			String p=req.getParameter("ps");
			int password=Integer.parseInt(p);
			
			String firstname=req.getParameter("fn");
			String lastname=req.getParameter("ln");
			String gender=req.getParameter("gender");
			String country=req.getParameter("country");
			
			
			System.out.println(email);
			System.out.println(password);
			System.out.println(firstname);
			System.out.println(lastname);
			System.out.println(gender);
			System.out.println(country);
			
			Connection con=null;
			PreparedStatement pstmt=null;
			String qry="update jspiders.registration set firstname=?,lastname=?,password=?,gender=?,country=?  where email=?";
			
			try 
			{
				
				
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306?user=j2ee&password=root");
				pstmt=con.prepareStatement(qry);
				
				pstmt.setString(1,firstname);
				pstmt.setString(2,lastname);
				pstmt.setInt(3,password);
				pstmt.setString(4,gender);
				pstmt.setString(5,country);
				pstmt.setString(6,email);
				
				pstmt.executeUpdate();
				
				
				
			}
			catch(ClassNotFoundException | SQLException e)
			{
				e.printStackTrace();	
			}
			finally

			{
				if(pstmt!=null)
				{

					try 
					{
						pstmt.close();
					}
					catch (SQLException e) 
					{

						e.printStackTrace();
					}
				}

				if(con!=null)
				{
					try 
					{

						con.close();

					} 
					catch (SQLException e) 
					{
						e.printStackTrace();
					}
				}
			}
			RequestDispatcher rd = req.getRequestDispatcher("fetchdata.jsp");
			rd.forward(req, res);
			
		}
	}

