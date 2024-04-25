<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
    <link rel="stylesheet" href="./stylesheets/flights.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">     

	<style>
       .body {
            font-family: Arial, sans-serif;
            background-color: #f0ecf6;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding: 0;
        }

        .body>.container {
            max-width: 600px;
            width: 100%;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: left;
        }

        h2 {
            color: #333333;
            text-align: center; /* Center align the heading */
        }

        .flight-details {
            margin-bottom: 20px;
        }

        .flight-details p {
            margin: 5px 0;
            text-align: center; /* Center align the flight details */
        }

        p {
            text-align: center; /* Center align other paragraphs */
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
    <div class="trips">
        <ul>
            <li>
            	
               <a href="#" class="economy">Class<i class="fa-solid fa-caret-down fa-xl"></i></a>
			   <div class="dropdown-menu">
			        <form id="travelClassForm">
			            <input type="radio" id="Economy" name="travel-class" value="Economy">
			            <label for="Economy">Economy</label><br>
			            <input type="radio" id="First-class" name="travel-class" value="First">
			            <label for="First-class">First-class</label><br>
			            <input type="radio" id="Premium-economy" name="travel-class" value="Premium-economy">
			            <label for="Premium-economy">Premium-economy</label><br>
			            <input type="radio" id="Business-class" name="travel-class" value="Business">
			            <label for="Business-class">Business-class</label><br>
			        </form>
			    </div>

               
            </li>
        </ul>
   	</div>
	<div class="body">
    <div class="container">
        <h2>Booking Confirmation</h2>
        <div class="flight-details">
            <p><strong>Flight Number:</strong> ${flightNumber}</p>
            <p><strong>Departure:</strong> ${departureCity}, ${departureCountry} - ${departureTime}</p>
            <p><strong>Arrival:</strong> ${arrivalCity}, ${arrivalCountry} - ${arrivalTime}</p>
            <p><strong>Class:</strong> ${flightClass}</p>
            <p><strong>Price per seat:</strong> ${price}</p>
            <p><strong>Selected Seat:</strong> ${selectedSeat}</p>
        </div>
        <p>Thank you for booking your flight with us!</p>
    </div>
    </div>
</body>
</html>
