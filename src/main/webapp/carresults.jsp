<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Cars</title>
    <style>
    	@import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');

		*{
		    padding: 0px;
		    margin: 0px;
		    box-sizing: border-box;
		}
		body{
		    background-color:#f0ecf6 ;
		    font-family: poppins;
		    margin: 0 auto;
		    max-width: 1200px;
		}
		header{
		    width: 100%;
		    height: 75px;
		    background-color:#f0ecf6 ;
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    z-index: 100%;
		}
		.logo{
		    font-size:13px;
		    color:black;
		    font-weight: 700;
		}
		div>span{
		    padding-left: 30px;
		    background-color:#f0ecf6 ;
		
		}
		.sign-in,.list-property{
		    border: none;
		    padding:13px 10px ;
		    background-color: #8a5ced;
		    border-radius: 20px;
		}
		nav{
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    padding-bottom:9px;
		    border-bottom: 1px solid black;
		}
		nav a{
		    text-decoration: none;
		    color: black;
		    font-size: 12px;
		    position:relative;
		   
		}
		nav a:hover{
		    color: #8a5ced;
		}
		nav a::before{
		    content:'';
		    position: absolute;
		    background-color: #8a5ced;
		    top: 0;
		    left: 0;
		    width:0;
		    height:2px;
		    transition: .3s;
		}
		nav a:hover::before{
		    width:100%;
		}
		.active{
		    color: #8a5ced;
		}
		nav .active::before{
		    content:'';
		    position: absolute;
		    background-color: #8a5ced;
		    top: 0;
		    left: 0;
		    width:100%;
		    height:2px;
		
		}
		
		
		.text{
		    font-size: 14px;
		    margin-top: 10px;
		    
		    padding-bottom: 10px;
		    font-family:roboto;
		}
		.input-container{
		    padding-top: 10px;
		    width: 100%;
		}
		.form{
		    display: flex;
		    justify-content: space-between;
		    
		    
		    gap: 5px;
		}
		.form span{
		    position:relative;
		}
		span>input{
		    height: 40px;
		    display: flex;
		    
		    border: 1.3px solid black;
		    border-radius: 5px;
		}
		
		.form>span>i{
		    position: absolute;
		    top: 45%;
		    right: 100%;
		    left:1.6%; 
		}
		.location, .calender, .people{
		    padding-left: 35px;
		}
    	body {
		   
		    margin: 0 auto; /* Center align the content */
		    padding: 20px;
		    max-width: 1200px; /* Set maximum width for the content */
		}
		
		.grid-container {
		    display: grid;
		    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); /* Three containers per row */
		    grid-gap: 20px;
		}
		
		.container {
		    background-color: #F5F3FA;
		    border-radius: 8px;
		    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		    overflow: hidden; /* Ensure content doesn't overflow */
		   
		}
		
		.car-details {
		    padding: 20px;
		    
		}
		
		.car-details img.car-image{
		    width: 100%;
		    height: auto;
		    border-radius: 8px;
		    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		}
		
		.company-logo {
		    width: 80px; /* Adjust size of company logo */
		    height: auto;
		}
		
		.car-details p {
		    margin: 10px 0;
		}
		
		.Rent-button {
		    width: 100%;
		    padding: 10px;
		    background-color: #8A5CED;
		    color: #fff;
		    border: none;
		    border-radius: 4px;
		    cursor: pointer;
		    transition: background-color 0.3s ease;	    
		}
		
		.Rent-button:hover {
		    background-color: #B693FF;
		}
		.container:hover{
			outline: 2px solid #8A5CED;
		}
    	
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <h1>D.Destination <i class="fa-solid fa-plane"></i></h1>
        </div>
        <div class="container">
            <span><button class="list-property" onclick="window.location.href='listyourproperty.jsp'">List your property</button></span>
            <span><button class="sign-in" onclick="window.location.href='registration.jsp'">Register</button></span>
            <span><button class="sign-in" onclick="window.location.href='login.jsp'">Sign in</button></span>
        </div>   
    </header>
    <nav>
        <a href="stays.jsp">Stays</a>
        <a href="flights.jsp" class="active">Flights</a>
        <a href="cars.jsp">Cars</a>
        <a href="bookedrooms.jsp">Bookings</a>
        
    </nav>
    <div class="input-container">
	<form action="availablecars" class="form" method="post">
            <span >
                <input type="text"class="location" name="pickupLocation" id="location" value="${pickupLocation}" placeholder="${pickupLocation}">
                <i class="fa-solid fa-location-dot fa-xl"></i>
            </span>
            <span >
                <input type="datetime-local" class="location pickup-date" name="pickupDate" id="pickupdate" value="${pickupDate}">
                <i class="fa-regular fa-calendar-days fa-xl"></i>
            </span>
            
            <span >
                <input type="datetime-local" class="calender" name="dropoffDate" id="dropoffdate" value="${dropoffDate}">
                <i class="fa-regular fa-calendar-days fa-xl"></i>
            </span>
            
            <input type="submit" value="Search" class="sign-in">
            
        </form>
    <h2>Available Cars</h2>
    
    <div class="grid-container">
	    <c:forEach var="car" items="${cars}"  >
	    <div class="container">
	        <div class="car-details">
	            <p><strong>Make:</strong> ${car.getString('car_make')}</p>
	            <p><strong>Model: </strong>${car.getString('car_model')}</p>
	            <p><strong>Gearbox:</strong> ${car.getString('car_gearbox')}</p>
	            <p><strong>Year:</strong> ${car.getString('car_year')}</p>
	            <p><strong>Color:</strong> ${car.getString('car_color')}</p>
	            <p><strong>Type:</strong> ${car.getString('car_type')}</p>
	            <p><strong>Price Per Day:</strong> ${car.getString('car_price_per_day')}</p>
	            <img src="./images/${car.getString('car_image')}" width="200" height="150" class="car-image">
	            <img src="./images/${car.getString('company_logo')}" alt="Company Logo" width="100" class="company-logo">
	            <p><strong>Car Seaters:</strong> ${car.getString('car_seaters')}</p>
	            <p><strong>Street Name:</strong> ${car.getString('street_name')}</p>
	            
	            <!-- Form for submitting individual car details -->
	            <form method="post" action="CarRentalServlet">
	                <!-- Hidden input fields with car details -->
	                <input type="hidden" name="carID" value="${car.getString('car_id')}">
	                <input type="hidden" name="pickupLocation" value="${pickupLocation}">
	                <input type="hidden" name="pickupDate" value="${pickupDate}">
	                <input type="hidden" name="dropoffDate" value="${dropoffDate}">
	                
	                <!-- Submit button for this specific car -->
	               <input type="submit" value="Rent" class="Rent-button">
	            </form>
	    	</div>
	      </div>
	     </c:forEach>
    </div>
</body>
</html>

