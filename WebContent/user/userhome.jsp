<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
   if(session.getAttribute("username")==null)
   {
	 response.sendRedirect("index.jsp");
   }
   %>
<%@ include file="userheader.jsp" %>
   <section class="bannerbox">
      <div class="container-fluid">
        <div class="row">
          <!-------  Banner Image -------> 
          <img class='bannerImg bannerImgHomesearch' src="img/Courier.png" alt="Home Page" />
        </div>
      </div>
      <br>
    <br>
      <div class="banHeadLink">
        <h1 class="newsmallHead">Your vision,We delivered</h1>
        <h2 class="newsmallHead">Feel the speed</h2>
      </div>
      <br>
    <br>
    <br>
    </section>
    <div class="information-two-area bg-light fix">
      <div class="information-chart">
        <img class="img-responsive" src="img/delivery.jpg">
        <br>
    <br>
    <br>
    <br>
      </div>
      <div class="information-text">
        <h1><span>About Us</span></h1>
        <p>We operate India’s largest express parcel transportation network with fully integrated and self-owned pickup, mid-mile and delivery operations that successfully reach 11 households every second across India. Our in-house transport management platform enables our customers to schedule pickups, track orders in real-time, manage returns and replacements with ease. We offer flexibility to customers through delivery time choices and flexible payment options.</p>
        <a class="but" href="about.jsp">Read more</a>
        </div>
        </div>
<%@ include file="userfooter.jsp" %>
    </body>
</html>