<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@ page import="java.sql.*,databaseconnection.*"%>


<html>
<head>
</head>
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
    
   
  </div>
  <div id="content">

<body>
<blockquote>
<%

ArrayList list = new ArrayList();
		ServletContext context = getServletContext();

		String dirName =context.getRealPath("\\Gallery");
		String paramname=null;
		String file=null;
		String pname=null,mobileno=null,state=null,city=null,email=null,cname=null,gen=null,age=null,image=null,unknown=null;
		String bin = "";
		String DBdriver="oracle.jdbc.driver.OracleDriver";
		String dburl="jdbc:oracle:thin:@localhost:1521:xe";
 
		File file1 = null;
		File file2 = null;
		FileInputStream fs1=null;
		FileInputStream fs=null;
	
		try {
			
			MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB

			Enumeration params = multi.getParameterNames();
			while (params.hasMoreElements()) 
			{
				paramname = (String) params.nextElement();
				if(paramname.equalsIgnoreCase("pname"))
				{
					pname=multi.getParameter(paramname);
				}
				else if(paramname.equalsIgnoreCase("mobileno"))
				{
					mobileno=multi.getParameter(paramname);
				}
				else if(paramname.equalsIgnoreCase("state"))
				{
					state=multi.getParameter(paramname);
				}
				else if(paramname.equalsIgnoreCase("city"))
				{
					city=multi.getParameter(paramname);
				}
				else if(paramname.equalsIgnoreCase("email"))
				{
					email=multi.getParameter(paramname);
				}
				else if(paramname.equalsIgnoreCase("cname")||paramname.equalsIgnoreCase("unknown"))
				{
					cname=multi.getParameter(paramname);
				}
				else if(paramname.equalsIgnoreCase("age"))
				{
					age=multi.getParameter(paramname);
				}
				else if(paramname.equalsIgnoreCase("gen"))
				{
					gen=multi.getParameter(paramname);
				}
				else if(paramname.equalsIgnoreCase("category"))
				{
					//category=multi.getParameter(paramname);
				}
				
			}
					
			int ff = 0;
			Enumeration files = multi.getFileNames();
			while (files.hasMoreElements()) {
				paramname = (String) files.nextElement();
				if(paramname.equals("d1"))
				{
					paramname = null;
				}
		
				if(paramname != null)
				{
					ff = 1;
					image = multi.getFilesystemName(paramname);
					String fPath = context.getRealPath("\\Gallery\\"+image);
					File f = new File("images/default"); 
					System.out.println(f.getAbsolutePath());
					file1 = new File(fPath);
					fs = new FileInputStream(file1);
					list.add(fs);
				}		
			}
	
            //name=dirName+"\\Gallery\\"+image;
			int lyke=0;
			//String as="0";
			String uid=(String)session.getAttribute("id");
			Class.forName(DBdriver);
			Connection con=DriverManager.getConnection(dburl,"system","vaibhav");
			PreparedStatement ps=con.prepareStatement("insert into milappdata1(custname,mobileno,state,city,email,childname,age,gender,photo) values(?,?,?,?,?,?,?,?,?)");
			
			ps.setString(1,cname);
            ps.setString(2,mobileno);
			ps.setString(3,state);
			ps.setString(4,city);
			ps.setString(5,email);
			if(!cname.equals("null")){
				ps.setString(6,cname);
			}
			else{
				ps.setString(6,"unknown");
			}
			ps.setString(7,age);
			ps.setString(8,gen);
			ps.setBinaryStream(9, (InputStream)fs, (int)(file1.length()));
			ps.executeUpdate();
	
			out.println("<html><body>Details updated succesfully</body></html>");
		}catch (Exception e) {
			out.println(e.getMessage()+"Exception caught");
		}

 %>
 </blockquote>
</body>
</html>