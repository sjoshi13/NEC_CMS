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
String otp = request.getParameter("OTP");
String idd=request.getParameter("id");
Integer id = Integer.valueOf(idd);

%>
<html>
<head>
  <title>Updating Database</title>
</head>
<body>
  <%

  DatabaseCon details = new DatabaseCon();
  Connection con = details.getConn();
  ps = con.prepareStatement("update booking set OTP=? where bookingID = ? ");
  
  ps.setInt(2, id);
  ps.setString(1,otp);
  ps.executeUpdate();
  response.sendRedirect(request.getHeader("referer"));
  
  
  %>
</body>
</html>