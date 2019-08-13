<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Contact Us</title>
	<meta http-equiv='X-UA-Compatible' content='IE=Edge'>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <link rel="shortcut icon" href='favicon.ico' />    
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>    <link rel="stylesheet" type="text/css" media="all"  href="http://www.jayeek.com/scripts/bxslider/jquery.bxslider.css" />  
    <link rel="stylesheet" type="text/css" media="all"  href="http://www.jayeek.com/styles/main.css" />  
    <script type="text/javascript"  src="http://www.jayeek.com/scripts/jquery.min.js"></script>
    <script type="text/javascript"  src="http://www.jayeek.com/scripts/bxslider/jquery.bxslider.js"></script>
    <script type="text/javascript"  src="http://www.jayeek.com/scripts/default.js"></script>
		<!-- Add mousewheel plugin (this is optional) -->
<script type="text/javascript" src="http://www.jayeek.com/fancybox/jquery.mousewheel.pack.js"></script>

<!-- Add fancyBox -->
<link rel="stylesheet" href="http://www.jayeek.com/fancybox/jquery.fancybox.css?v=2.1.7" type="text/css" media="screen" />
<script type="text/javascript" src="www.jayeek.com/fancybox/jquery.fancybox.pack.js?v=2.1.7"></script>

<!-- Optionally add helpers - button, thumbnail and/or media -->
<link rel="stylesheet" href=" " type="text/css" media="screen" />
<script type="text/javascript" src="http://www.jayeek.com/fancybox/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
<script type="text/javascript" src="http://www.jayeek.com/fancybox/helpers/jquery.fancybox-media.js?v=1.0.6"></script>

<link rel="stylesheet" href="http://www.jayeek.com/fancybox/helpers/jquery.fancybox-thumbs.css?v=1.0.7" type="text/css" media="screen" />
<script type="text/javascript" src="http://www.jayeek.com/fancybox/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>



<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, IE=EmulateIE7">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <link rel="SHORTCUT ICON" href="" />
    <script src="js/jquery.min.js" type="text/javascript"></script> 
    <meta name="author" content="">
    <meta name="keywords"
      content=''>
    <meta name="description"
      content=''>
    <title>Gofer</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" media="screen" />
    <link rel="stylesheet" type="text/css" href="">
    <link rel="stylesheet" type="text/css" href="css/slick.css">
    <link rel="stylesheet" type="text/css" href="css/slick-theme.css">
    <link href="css/AllStyle.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/financeformcss.css"rel="stylesheet">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/shortcode/shortcodes.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/responsive.css">

    <script src="js/header-click.js"></script> 
    <link href="css/header-min.css" rel="stylesheet">
</head>
<body>
<%@ include file="userheader.jsp" %>
<div class="innerBanner">
		<img alt="Jayeek" src="images/image1.jpg" />
		<div class="fixcontentarea" >
		<div class="bannerThumbnail" >
			<img alt="Jayeek" src="images/image2.jpg" />
		</div>
		</div>
</div>
<div class="clear10"></div>
<div class="social-share">
<div class="fixcontentarea" >
<ul>  <li><a ><img src="images/image5.png"/></a></li>
        <li><a ><img src="images/image6.png"/></a></li>
		<li><a ><img src="images/image7.png"/></a></li> 
        <li><a ><img src="images/image8.png"/></a></li>
        <li><a onclick="javascript:window.print();"><img src="images/image9.png"/></a></li>
        <li><a ><img src="images/image10.png"/></a></li>
         </ul>
</div>
</div>
<div class="clear10"></div>
<div class="innerPageContent">
<div class="fixcontentarea" >
            <div class="title_breadcrumb">Get to Know Us<br /><b>Contact Us</b></div>
            <div class="contactus">            
            	<ul>
                	<li>
					<p class="title1">Contact Detail</p>
                    Campus -1, 19th KM Stone, NH 24<br /> Ghaziabad, Uttar Pradesh 201009 <br />Telephone: +91  9899519079<br />Fax: +971 4 330 2553<br /><a href="mailto:tarun.16bcs2004@abes.ac.in">info@gofer.com</a>
                    </li>                	
                    <li>
					<p class="title1">Feeback Form</p>
                    <form  id="contactForm" action="SendEmail.php" method="POST" name="contactForm">
                    	<input id="fname"  name="fname" type="text" placeholder="First Name" class="inputfield" /><br />
                    	<input id="lname" name="lname" type="text" placeholder="Last Name" class="inputfield" /><br />
                    	<input id="contactEmail" name="contactEmail" type="text" placeholder="Your Email Address" class="inputfield" /><br />
                        <textarea id="contactMessage" name="contactMessage" cols="20" rows="5"  placeholder="Your Message" class="inputfield"></textarea><br />
                    </form>
                    	<button class="btn1" id="submit_contact" type="submit" onclick="javascript:SubmitContactForm()" >Submit</button>
						<div class="messages"></div>   
                </ul>            
            </div>
</div>
</div>
<div class="clear10"></div>
<%@ include file="userfooter.jsp" %>
</body>
</html>