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
<%

PreparedStatement ps = null;
ResultSet rs = null;
DatabaseCon details = new DatabaseCon();
Connection con = details.getConn();
String username = request.getParameter("username");
String password = request.getParameter("password");
String submit = request.getParameter("submit");
if(submit.equals("Login") && !username.equals("null") && !password.equals("null"))
{
	
		//String type=request.getParameter("type");
		
		String sql = "select * from user where username=? and password=?";
		
		ps = con.prepareStatement(sql);
		ps.setString(1, username);
		ps.setString(2, password);
		rs = ps.executeQuery();
		if(rs.next())
		{
			session.setAttribute("name",rs.getString("name"));
			session.setAttribute("username",username); 
			response.sendRedirect("userhome.jsp");  
		}
		else
		{
			%>
			<center><p style="color:red">invalid credentials</p></center>
			<% 
			getServletContext().getRequestDispatcher("/user/index.jsp").include(request, response);
		}	
		rs.close();
		
		ps.close(); 
	
}
else if(submit.equals("admin_login") && !username.equals("null") && !password.equals("null"))
{
	try
	{
		String name=request.getParameter("name");
		String cpassword=request.getParameter("cpassword");
		String email=request.getParameter("email");
		String phone=request.getParameter("mobno");
		long digit=0,n=Long.parseLong(phone);
		long phone1=n;
		while(n>0)
		{
			digit++;
			n/=10;
		}
		
		if(!name.equals("null") && !cpassword.equals("null") && !email.equals("null") && digit==10)
		{
			
			
			ps = con.prepareStatement("select * from user where username=?");
			ps.setString(1,username);
			rs=ps.executeQuery();
			if(rs.next())
			{
				%>
				<center><p style="color:red">UserName already exist</p></center>
				<% 
				getServletContext().getRequestDispatcher("/user/SignUp.jsp").include(request, response);   
	        }
			else
			{
				if(password.equals(cpassword))
				{	
					String sql = "insert into user (name,username,password,email,phone,type) values(?,?,?,?,?,?)";
					ps=con.prepareStatement(sql);
					ps.setString(1, name);
					ps.setString(2, username);	
					ps.setString(3,password);
					ps.setString(4,email);
					ps.setLong(5,phone1);
					ps.setString(6,"user");
				    ps.executeUpdate();
					response.sendRedirect("index.jsp");
					rs.close();
					ps.close();
				}
				else
				{
					%>
					<center><p style="color:red">Password and confirm password does not match</p></center>
					<% 
					getServletContext().getRequestDispatcher("/user/SignUp.jsp").include(request, response);
				}
			}
		}
		else if(digit!=10)
		{
			%>
			<center><p style="color:red">mobile number should of 10 digit</p></center>
			<% 
			getServletContext().getRequestDispatcher("/user/SignUp.jsp").include(request, response);
		}
		else
		{
			%>
			<center><p style="color:red">Fill all details</p></center>
			<% 
			getServletContext().getRequestDispatcher("/user/SignUp.jsp").include(request, response);
		}
	}
	catch(NumberFormatException e)
	{
		%>
		<center><p style="color:red">mobile number should be integer</p></center>
		<% 
		getServletContext().getRequestDispatcher("/user/SignUp.jsp").include(request, response);
	}
	catch(Exception e)
	{
		out.println(e);
	}
}
else
{
	%>
	<center><p style="color:red">Something wrong is happened</p></center>
	<% 
	getServletContext().getRequestDispatcher("/user/SignUp.jsp").include(request, response);
}
%>
</body>
</html>