<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.PrintWriter"%>
    <%@ page import="datacon.DatabaseCon" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Payment</title>

</head>
<body>
<br>
<%
String s=request.getParameter("source");
String d=request.getParameter("destination");
System.out.print(s+d);
int w=Integer.parseInt(request.getParameter("weight"));
int h=Integer.parseInt(request.getParameter("height"));
int l=Integer.parseInt(request.getParameter("length"));
int wid=Integer.parseInt(request.getParameter("width"));

DatabaseCon details = new DatabaseCon();
Connection con = details.getConn();
    String sql="select latitude,longitude from Locations where city=? or city=?";
   	PreparedStatement ps=con.prepareStatement(sql);
   	ps.setString(1,s);
   	ps.setString(2,d);
	ResultSet rs=ps.executeQuery( );  
    double[] lat_long=new double[4];
    int i=0;
	while(rs.next()) 
	{
		lat_long[i]=rs.getDouble(1);
		i+=1;

		lat_long[i]=rs.getDouble(2);
		i+=1;
		
    }
	int R = 6371; // Radious of the earth
	double lat1 = lat_long[0];
	double lon1 = lat_long[1];
	double lat2 = lat_long[2];
	double lon2 = lat_long[3];
	double latDistance = (lat2-lat1)* Math.PI / 180;;
	double lonDistance = (lon2-lon1)* Math.PI / 180;;
	double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2) + 
	           Math.cos((lat1)* Math.PI / 180) * Math.cos((lat2)* Math.PI / 180) * 
	           Math.sin(lonDistance / 2) * Math.sin(lonDistance / 2);
	double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
	double distance = R * c;
	double dist = distance;
	double p= (0.5*(distance) + w*2 + 0.0033*(h*l*wid));
	int ret =(int)p;
	sql="update booking set Amount=? where username=? and sender_city=? and receiver_city=?";
	ps=con.prepareStatement(sql);
	ps.setString(1,String.valueOf(ret));
	ps.setString(2,(String)session.getAttribute("username"));
	ps.setString(3,s);
	ps.setString(4,d);
	ps.executeUpdate();
	con.close();
%>
<div class="container text-center">
<h1>Total Price:</h1>
<p style="font-size:200%;"><% out.println(ret);%></p>
<br>
<a href="payment.jsp" class="btn btn-info" role="button">Pay</a>
</div> 
</body>
</html>