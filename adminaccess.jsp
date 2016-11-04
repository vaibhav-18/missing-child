<%@ page import="java.sql.*" %>
<%
String DBdriver="oracle.jdbc.driver.OracleDriver";
String DBurl="jdbc:oracle:thin:@localhost:1521:xe";
String DBusername="system";
String DBpassword="vaibhav";

try{
			Class.forName(DBdriver);
			Connection con=DriverManager.getConnection(DBurl,DBusername,DBpassword);
			Statement st=con.createStatement();
			int records=0;
			String childName=request.getParameter("childname");
			ResultSet rs=st.executeQuery("select count(*) from milappdata1");
			if(rs.next())
			{
				records=Integer.parseInt(rs.getString(1));
				out.print("<br>"+records+" records found<br>");
			}
			else
			{
				out.print("no records/table found matching "+childName);
				con.close();
				return;
			}
		//	out.print("<body background=\"child4.jpg\" style=\"background-repeat:no-repeat; background-size:1366px 766px;\">");
			String tData[][]=new String[records][3];
			rs=st.executeQuery("select * from milappdata1");
			if(rs.next())
			{
				out.print("<table border=5>");
			    int i=0;
			    do
			    {
				out.print("<tr>");
				for(int column=1;column<9;column++)
				{
					out.print("<td>"+rs.getString(column)+"</td>");
				}
				out.print("<td><a href=\"img.jsp?childname="+childName+"\">view</a></td>");
				out.print("</tr>");
				i++;
			    }while(rs.next());
				out.print("</table></body>");
			}
			else
			{
				out.print("no record matched");
			}
			con.close();
		}
		catch(Exception e)
		{
			out.print("something went wrong: "+e.toString());
		}
%>