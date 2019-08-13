<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<%! String userdbName;
String userdbPsw;

%>
<%
Connection con= null;
PreparedStatement ps = null;
ResultSet rs = null;
String driverName = "com.mysql.jdbc.Driver" ;
String url = "jdbc:mysql://localhost:3306/sys";
String user = "root";
String dbpsw = "1234";

String sql = "select * from userdetail where name=? and password=? ";

String name = request.getParameter("name");
String password = request.getParameter("password");
System.out.println(name+password);
if((!(name.equals(null) || name.equals("")) && !(password.equals(null) || password.equals(""))) )
{

try{
Class.forName(driverName);
con = DriverManager.getConnection(url, user, dbpsw);
ps = con.prepareStatement(sql);
ps.setString(1, name);
ps.setString(2, password);

rs = ps.executeQuery();
if(rs.next())
{ 
userdbName = rs.getString("name");
userdbPsw = rs.getString("password");
System.out.println(userdbName+userdbPsw);
if(name.equals(userdbName) && password.equals(userdbPsw))
{
session.setAttribute("name",userdbName);
response.sendRedirect("CourierBoyDashboard.jsp"); 
} 
}
else{
	%>
	<center><p style="color:red">Invalid username/password</p></center>
	<% 
	getServletContext().getRequestDispatcher("/CourierBoy/index.jsp").include(request, response);}
rs.close();
ps.close(); 
}
catch(SQLException sqe)
{
out.println(sqe);
} 
}
else
{
%>
<center><p style="color:red">Invalid username/password</p></center>
<% 
getServletContext().getRequestDispatcher("/CourierBoy/index.jsp").include(request, response);
}
%>
</body>
</html>