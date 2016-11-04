<%@ page import="java.sql.*" %>
<html>
<head>
<title>PROGENY MILAPP</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="menu.css" rel="stylesheet" type="text/css" />

</head>
<body>
<div id="container">
  <div id="top">
  
    <h1 align="center">CHILD MISSING WEBSITE</h1>
  </div>
  <div id="menuh-container">
    <div id="menuh">
      <ul>
        <li><a href="index.html" class="top_parent">&nbsp; Homepage</a>
         
        </li>
      </ul>
      <ul>
        <li><a href="form.html" class="top_parent">&nbsp; Enter child details</a>
         
        </li>
      </ul>
      <ul>
        <li><a href="datareading.html" class="top_parent">&nbsp; get child details</a>
        
        </li>
      </ul>
      <ul>
        <li><a href="first.html" class="top_parent">&nbsp; About</a> </li>
      </ul>
	  </ul>
      <ul>
        <li><a href="admin.html" class="top_parent">&nbsp; Admin</a> </li>
      </ul>
     
     
    
    </div>
  </div>
  <div class="clear:both;"></div>
  <div id="leftnav">
    <h2></h2>
    <div id="nav">
      <ul id="navlist">
      
      
      </ul>
    </div>
    <p>  </p>
   
  </div>
  <div id="content">
 

<p align="5%">
<blockquote>
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
			String childName;
			if(!(request.getParameter("childname")==null))
				childName=request.getParameter("childname");
			else
				childName="unknown";
			ResultSet rs=st.executeQuery("select count(*) from milappdata1 where childname='"+childName+"'");
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
			//out.print("<body background=\"child4.jpg\" style=\"background-repeat:no-repeat; background-size:1366px 766px;\">");
			String tData[][]=new String[records][3];
			rs=st.executeQuery("select * from milappdata1 where childname='"+childName+"'");
			if(rs.next())
			{
				out.print("<table border=5 align=\"center\">");
			    int i=0;
			    do
			    {
				out.print("<tr align=\"center\">");
				for(int column=1;column<9;column++)
				{
					out.print("<td align=\"center\">"+rs.getString(column)+"</td align=\"center\">");
				}
				out.print("<td align=\"center\"><a href=\"img.jsp?childname="+childName+"\">view</a></td align=\"center\">");
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
</blockquote>
