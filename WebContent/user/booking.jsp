<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<body style="background-color:  #FFFFFF;font-size: 180%;"><br>
<%@ include file="userheader.jsp" %>
<head>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" type="text/css" href="css/jquery.autocomplete.css" />
<script src="js/jquery.autocomplete.js"></script>

</head>
<body style="background-color:  #FFFFFF;font-size: 180%;">
<%
   response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
   if(session.getAttribute("name")==null)
      {
        response.sendRedirect("index.jsp");
     }
     
     
     %>
<br>
	<strong><br>
		<h1 class="text-center"style="margin-top:2%;margin-bottom: 2%; font-size: 2vw;padding: 10px;font-family: 'Bitter', serif;">Create Shipment</h1>
	</strong>
	<%
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
   if(session.getAttribute("name")==null)
   {
	 response.sendRedirect("index.jsp");
   }
   %>
	<style>
		.container
		{
			position: relative;
		}
		.next
		{
			position: absolute;
			top: 790px;
			left: 970px;
			
		}
		section .container p
		{
			font-family: 'Sanchez', serif;
			font-weight: 100px;
			font-size: 20px;
			

		}
		input
		{
			opacity: 0.7
			padding: 12px 20px;
			margin: 8px 0;
			box-sizing: border-box;
			border: none;
			border-bottom: 1px solid black;
			background-color: #FFFFFF;
		}

	</style>
	<section>
	<div class="container">	
		<form action="insert.jsp" method="POST">
		<div class="col-md-6">
			<div style="margin-left: 7%;">
				<p  class="text-center" style="font-size: 25px;"> Source </p>
				<p> Name*<br><input type="text" class="form-control" name="name1"  size="40" id="name" placeholder="Mark Henry" required></p>
				<p> Address*<br>
				<input type="text" name="address1" class="form-control" size="40" id="Address" placeholder="Nh-24 Crossing Republic" required></p>
				<p> City* <br>
				<div class="autocomplete">
				<input type="text" size="40" class="form-control" name="city1" id="myInput" placeholder="Ghaziabad" required></p></div>
				<p> State* <br>
				<input type="text" size="40"  class="form-control" name="state1" id="State" placeholder="State" required></p>
				<p> Pin Code* <br>
				<input type="text" name="pincode1" class="form-control" id="pin" size="40" placeholder="Pin Code" required></p>
				<p> Mobile No* <br>
				<input type="text" name="mob1" class="form-control" id="mob" size="40" placeholder="7623235xxxx" required></p>
				<p> Email* <br>
				<input type="email" name="email1" class="form-control" id="email" size="40" placeholder="ex@gofer.com" required></p>
				<p> Address type* <br>
				<input type="checkbox" name="Addresstype" value="home"> Home 
				<input type="checkbox" name="Addresstype" value="work"> Work</p><br>
			</div>
		</div>
		<!--<div class="verticalline">
		</div>-->
		<div class="col-md-6 " >
			<div style="margin-left: 7%;">
				<p class="text-center"style="font-size: 25px;"> Destination </p>
				<p> Name*<br><input type="text" class="form-control" name="name2" size="40" id="name" placeholder="Mark Henry" required></p>
				<p> Address* <br>
				<input type="text" name="address2" class="form-control" size="40" id="Address" placeholder="Nh-24 Crossing Republic" required></p>
				<p> City* <br>
				<div class="autocomplete">
				<input type="text" size="40" class="form-control" name="city2" id="myInput1" placeholder="Ghaziabad" required></p></div>
				<p> State* <br>
				<input type="text" size="40" class="form-control" name="state2" id="State" placeholder="State" required></p>
				<p> Pin Code* <br>
				<input type="text" name="pincode2" class="form-control" id="pin" size="40" placeholder="Pin Code" required></p>
				<p> Mobile No* <br>
				<input type="text" name="mob2" class="form-control" id="mob" size="40" placeholder="762323xxx" required></p>
				<p> Email* <br>
				<input type="email" name="email2" id="email" class="form-control" size="40" placeholder="ex@gofer.com" required></p><p> Address type* <br>
				<input type="checkbox" name="Addresstype" value="home" id="home"> Home 
				<input type="checkbox" name="Addresstype" value="work" id="work"> Work </p>
				<p><input type="submit" class="btn btn-info" value="Next" style="opacity:1; left: 70%;float: right; margin-right: 15%;margin-bottom: 5%;"name="Next">
				</p><br>
			</div>
		</div>
			</form>
	</div>
</div>
<script>
function autocomplete(inp, arr) {
  /*the autocomplete function takes two arguments,
  the text field element and an array of possible autocompleted values:*/
  var currentFocus;
  /*execute a function when someone writes in the text field:*/
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      /*close any already open lists of autocompleted values*/
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      /*create a DIV element that will contain the items (values):*/
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      /*append the DIV element as a child of the autocomplete container:*/
      this.parentNode.appendChild(a);
      /*for each item in the array...*/
      for (i = 0; i < arr.length; i++) {
        /*check if the item starts with the same letters as the text field value:*/
        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
          /*create a DIV element for each matching element:*/
          b = document.createElement("DIV");
          /*make the matching letters bold:*/
          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);
          /*insert a input field that will hold the current array item's value:*/
          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
          /*execute a function when someone clicks on the item value (DIV element):*/
          b.addEventListener("click", function(e) {
              /*insert the value for the autocomplete text field:*/
              inp.value = this.getElementsByTagName("input")[0].value;
              /*close the list of autocompleted values,
              (or any other open lists of autocompleted values:*/
              closeAllLists();
          });
          a.appendChild(b);
        }
      }
  });
  /*execute a function presses a key on the keyboard:*/
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        /*If the arrow DOWN key is pressed,
        increase the currentFocus variable:*/
        currentFocus++;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 38) { //up
        /*If the arrow UP key is pressed,
        decrease the currentFocus variable:*/
        currentFocus--;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 13) {
        /*If the ENTER key is pressed, prevent the form from being submitted,*/
        e.preventDefault();
        if (currentFocus > -1) {
          /*and simulate a click on the "active" item:*/
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    /*a function to classify an item as "active":*/
    if (!x) return false;
    /*start by removing the "active" class on all items:*/
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    /*add class "autocomplete-active":*/
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    /*a function to remove the "active" class from all autocomplete items:*/
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    /*close all autocomplete lists in the document,
    except the one passed as an argument:*/
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
  /*execute a function when someone clicks in the document:*/
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });
}
/*An array containing all the country names in the world:*/
var cities = ['Bhilai', 'Tiruchchiruppalli', 'Mysore', 'Delhi', 'Ghaziabad', 'Chandigarh', 'Vadodara', 'Chennai', 'Jodhpur', 'Lucknow', 'Warangal', 'Pune', 'Madurai', 'Ranchi', 'Patna', 'Indore', 'Thiruvananthapuram', 'Amritsar', 'Jabalpur', 'Bhopal', 'Ahmadabad', 'Mumbai', 'Varanasi','Gwalior', 'Coimbatore', 'Jamshedpur', 'Kolkata', 'Hubli', 'Bengaluru']

/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
autocomplete(document.getElementById("myInput"), cities);
autocomplete(document.getElementById("myInput1"), cities);
</script>

<style>
 h1{
font-family: "Comic Sans MS", cursive, sans-serif;
 }
 h4{
  font-family: "Comic Sans MS", cursive, sans-serif;
 }
 .autocomplete{
  position: relative;
 }
 .autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  /*position the autocomplete items to be the same width as the container:*/
  top: 100%;
  left: 0;
  right: 0;
}
.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff; 
  border-bottom: 1px solid #d4d4d4; 
}
/*when hovering an item:*/
.autocomplete-items div:hover {
  background-color: #e9e9e9; 
}
</style>
</div><%@ include file="userfooter.jsp" %>
