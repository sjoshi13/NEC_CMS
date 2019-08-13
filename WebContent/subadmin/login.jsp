<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@page import="datacon.DatabaseCon"%>
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
	String sql = "select * from user where username=? and password=? and type=?";
	String name = request.getParameter("name");
	String password = request.getParameter("password");

	if((!(name.equals(null) || name.equals("")) && !(password.equals(null) || password.equals(""))) )
		{
			DatabaseCon details = new DatabaseCon();
			Connection con = details.getConn();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, password);
            ps.setString(3,"hubadmin");
			ResultSet rs = ps.executeQuery();

			if(rs.next())
			{ 
				userdbName = rs.getString("username");
				userdbPsw = rs.getString("password");
				if(name.equals(userdbName) && password.equals(userdbPsw))
				{
					session.setAttribute("name",rs.getString("name"));
					session.setAttribute("username",rs.getString("username"));
					System.out.println(rs.getString("username"));
					response.sendRedirect("admindashboard.jsp"); 
				} 

				else{
				%>
				<center><p style="color:red">Invalid username/password</p></center>
				<% 
				getServletContext().getRequestDispatcher("/subadmin/index.jsp").include(request, response);}
				rs.close();
				ps.close(); 
			}}

			else
				{
					%>
					<center><p style="color:red">Please Enter username/password</p></center><%
					getServletContext().getRequestDispatcher("/subadmin/index.jsp").include(request, response);
				}
				%>
			</body>
			</html>