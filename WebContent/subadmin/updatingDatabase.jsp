<%@ page language = "java" contentType = 
"text/html; charset = ISO-8859-1"
import = "java.io.*"
import = "java.sql.*"
import = "java.util.*"
import = "javax.sql.*"
import = "java.sql.ResultSet"
import = "java.sql.Statement"
import = "java.sql.Connection"
import = "java.sql.DriverManager"
import = "java.sql.SQLException"
%>
<%@page import="datacon.DatabaseCon"%>
<%

PreparedStatement ps = null;
ResultSet rs = null;
Statement stmt = null;
String name = request.getParameter("name");
String idd = request.getParameter("id");
String stat = request.getParameter("statuss");
String date=request.getParameter("date");
Integer id = Integer.valueOf(idd);
String td=" "+date+" : "+stat+"  \n ";
System.out.print(stat);

%>
<html>
<head>
  <title>Updating Database</title>
</head>
<body>
  <%

  DatabaseCon details = new DatabaseCon();
  Connection con = details.getConn();
  ps = con.prepareStatement("update booking set sender_agent= ?, status=?, detail=CONCAT(?,track_details) where booking_id = ? ");
  ps.setInt(4, id);
  ps.setString(3,td);
  ps.setString(1, name);
  ps.setString(2,stat);
  ps.executeUpdate();
  response.sendRedirect(request.getHeader("referer"));
  
  
  %>
</body>
</html>