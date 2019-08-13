<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %> 
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page session="true"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Courier</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" type="text/css" href="css/jquery.autocomplete.css" />
<script src="js/jquery.autocomplete.js"></script>
<link href="css/main.css" rel="stylesheet">
		<script>
        function enableButton2() {
            document.getElementById("book").disabled = false;
        }
    </script>
<style>
	h1{
font-family: "Comic Sans MS", cursive, sans-serif;
font-size: "200%"
	}
	h4{
		font-family: "Comic Sans MS", cursive, sans-serif;
	}
 input[type=submit] {
  background-color: #555555;
  border: none;
  color: white;
  padding: 6px 2px;
  text-decoration: none;
  margin: 4px 2px;
  width: 50%;
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
  cursor: pointer;
  border-radius: 12px;
}
input[type=text] {
  width: 80%;
  padding: 1px 0px;
  margin: 0px 0;
  box-sizing: border-box;
}
 li{  
                padding:12px;  
} 
</style>
</head>
<body>
<%@ include file="userheader.jsp" %>
 <%
   if(session.getAttribute("username")==null)
   {
	 response.sendRedirect("index.jsp");
   }
   %>
</div>
  
       
        <br>
        <br>
        <br>
        <br>
      
      <h1 class="text-center" >Add Package Details</h1>
      
<div class="container" style="width:800px;  border-radius: 5px;
  padding: 20px;">
<div style="width:300px; float:left;">
<form method="post" action="fetchpricedetails.jsp" name="PriceCal" id="PriceCal">
            <input name="source" id="source" value="<%=request.getParameter("city1")%>" type="hidden" />
            <input name="destination" id="destination" value="<%=request.getParameter("city2")%>" type="hidden"/>
             <h4>Weight(Kgs)</h4>
            <input name="weight" id="weight" class="form-control" placeholder="Weight" type="text"/>
            <h4>Height(cms)</h4>
            <input name="height" id="height" class="form-control" placeholder="Height" type="text" />
                 <h4>Width(cms)</h4>
            <input name="width" id="width" class="form-control" placeholder="Weight" type="text" />
            <h4>Length(cms)</h4>
            <input name="length" id="length" class="form-control" placeholder="Weight" type="text" />
           <br>
            <div class="row">
           <div>
            <input type="submit" id="book" value="Book" class="btn btn-primary " >
           </div>
           </div>
</form>	
</div>
</div>
<%@ include file="userfooter.jsp" %>
</body>

</html>
