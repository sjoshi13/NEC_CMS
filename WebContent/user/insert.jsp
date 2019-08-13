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
<%!
    
   
    String getadmin(String city, Connection con)
    {
	String ans=" ";
	String sql = "select value from locations where city='"+city+"'";

	
	ResultSet rs = null;
	try{
		
		  Statement stmt=con.createStatement();
		rs=stmt.executeQuery(sql);
			
		while(rs.next()){
		if(rs.getInt(1)==1)
			ans="la1";
		if(rs.getInt(1)==2)
			ans="la2";
		if(rs.getInt(1)==3)
			ans="la3";
		
		}
	
	}
	catch(SQLException e){
		System.out.print(e);
	}
	return ans;
    }
    %>
<%
Connection con= null;
PreparedStatement ps = null;
ResultSet rs = null;
DatabaseCon details = new DatabaseCon();
con = details.getConn();
long sender_phone=0L;
long receiver_phone=0L;
String username=(String)session.getAttribute("username");
String sender_name=request.getParameter("name1");
String receiver_name=request.getParameter("name2");
String sender_address=request.getParameter("address1");
String receiver_address=request.getParameter("address2");
String sender_city=request.getParameter("city1");
String receiver_city=request.getParameter("city2");
String sender_email=request.getParameter("email1");
String receiver_email=request.getParameter("email2");
sender_phone=Long.parseLong(request.getParameter("mob1"));
receiver_phone=Long.parseLong(request.getParameter("mob2"));
	int digit1=0,digit2=0;
	long n1=sender_phone,n2=receiver_phone;
	while(n1>0)
	{
		digit1++;
		n1=n1/10;
	}
	while(n2>0)
	{
		digit2++;
		n2=n2/10;
	}
	if(digit1==10 && digit2==10)
	{
		
		String sql = "insert into booking(username,sender_name,sender_address,sender_city,sender_mail,sender_phone,receiver_name,receiver_address,receiver_city,receiver_mail,receiver_phone,sender_admin,receiver_admin) values(?,?,?,?,?,?,?,?,?,?,?,?,?)" ;
	
		ps = con.prepareStatement(sql);
		ps.setString(1,username);
		ps.setString(2,sender_name);
		ps.setString(3,sender_address);
		ps.setString(4,sender_city);
		ps.setString(5,sender_email);
		ps.setLong(6,sender_phone);
		ps.setString(7,receiver_name);
		ps.setString(8,receiver_address);
		ps.setString(9,receiver_city);
		ps.setString(10,receiver_email);
		ps.setLong(11,receiver_phone);
		String sender_admin = getadmin(sender_city,con);
		String receiver_admin = getadmin(receiver_city,con);
		ps.setString(12,sender_admin);
		ps.setString(13,receiver_admin);
		ps.executeUpdate();
		getServletContext().getRequestDispatcher("/user/courierdetails.jsp").include(request, response);
	}
	else
	{
		%>
		<center><p style="color:red">phone number should be 10 digit</p></center>
		<% 
		getServletContext().getRequestDispatcher("/user/booking.jsp").include(request, response);
	}
%>

</body>
</html>