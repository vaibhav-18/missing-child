
<%@ page language="java" %>
    <%@ page import="java.sql.*,java.io.*,java.util.*" %> 
	<%@ page import="java.sql.*,databaseconnection.*"%>
	<%@ page trimDirectiveWhitespaces="true" %>
	<%@page contentType="image/png" pageEncoding="UTF-8"%>
<%
	String cname =  request.getParameter("childname");
	String DBdriver="oracle.jdbc.driver.OracleDriver";
	String dburl="jdbc:oracle:thin:@localhost:1521:xe";

	try{      
		Class.forName(DBdriver);
		Connection con=DriverManager.getConnection(dburl,"system","vaibhav");
		response.setContentType("image/jpeg");
        //PrintWriter out = response.getWriter();
        Blob ePhoto = null;
        byte[] rawBytes = null;
        ServletOutputStream sout = response.getOutputStream();
        /*
         * TODO output your page here. You may use following sample code.
        */
        //String cname = request.getParameter();
        Statement stat = con.createStatement();
        //stat.setString(1, Integer.parseInt(id));
        ResultSet rs = stat.executeQuery("select photo from milappdata1 where childname='"+cname+"'");
        rs.next();
        rawBytes = rs.getBytes(1);
        sout.write(rawBytes);
        sout.flush();
        stat.close();
        con.close();
        sout.close();
		return;
	}catch (Exception e){
		e.printStackTrace();
	}
%>