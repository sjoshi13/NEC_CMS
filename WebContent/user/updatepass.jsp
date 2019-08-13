<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="datacon.DatabaseCon" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

PreparedStatement ps = null;
ResultSet rs = null;
DatabaseCon details = new DatabaseCon();
Connection con = details.getConn();
String oldpassword = request.getParameter("oldpassword");
String password=request.getParameter("password");
String cpassword=request.getParameter("cpassword");
String username=(String)session.getAttribute("username");
String sql = "select * from user where username=?";
ps = con.prepareStatement(sql);
ps.setString(1,username);
rs=ps.executeQuery();
if(rs.next())
{
	if(password.equals(cpassword)){
		try
		{
			if(rs.getString(3).equals(oldpassword))
			{
				String sql1 = "update user set password=? where username=?";
				ps = con.prepareStatement(sql1);
				ps.setString(1,password);
				ps.setString(2,username);
				ps.executeUpdate();
				%>
				<center><p style="color:green">Password change successfully</p></center>
				<% 
				getServletContext().getRequestDispatcher("/user/change_pass.jsp").include(request, response);
				rs.close();
				ps.close(); 
			}
		}
		catch(SQLException sqe)
		{
			out.println(sqe);
		} 
	}
	else
	{
		%>
		<center><p style="color:red">Both password does not match</p></center>
		<%
		getServletContext().getRequestDispatcher("/user/index.jsp").include(request, response);
	}
}
else
{
	%>
	<center><p style="color:red">old password does not match</p></center>
	<%
	getServletContext().getRequestDispatcher("/user/change_pass.jsp").include(request, response);
}
%>
</body>
</html>