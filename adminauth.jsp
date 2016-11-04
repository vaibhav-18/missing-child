<%@ page import="java.sql.*,databaseconnection.*"%>

<%


	
   
	String a=request.getParameter("username");
String b=request.getParameter("password");
	

	if(a.equals("Vaibhav")&&b.equals("msdhoni"))
		{		
		response.sendRedirect("adminaccess.jsp");
		}
		else
		{
		out.println("enter correct user name and password");
		}
%>
