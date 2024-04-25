<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		.flight-list {
		margin: 0 auto;
	max-width: 1200px;
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    gap: 20px;
}

.flight-item {
    border: 1px solid #ccc;
    padding: 20px;
    border-radius: 5px;
}


.logo img {
    width: 50px; /* Set the width of the airline logo */
    height: auto; /* Maintain aspect ratio */
}

/* Style other elements as needed */
.flight-number, .airline, .departure-info, .arrival-info, .flight-class, .price {
    margin-bottom: 10px;
}

/* Optional: Style the form submit button */
#flightDetailsForm input[type="submit"] {
	
    padding: 10px 20px;
    background-color: #8A5CED;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-top: 20px;
    display:flex;
    margin: 0 auto;
    justify-content:center;
}

#flightDetailsForm input[type="submit"]:hover {
    background-color: #B693FF;
}
		.centered-text{
			display:flex;
			max-width: 1200px;
			margin: 0 auto;
			
		}
		.input-container{
			max-width: 1200px;
		}
		.seat{
			margin-bottom:10px;
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
        
        <a href="checkout.jsp" >Cruises</a>
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
    <div class="input-container">
        <form id="travelDetailsForm" class="form">
            <span >
                <input type="text" placeholder="Leaving from" id="leavingFrom" class="location" value="${leavingFrom}">
                <i class="fa-solid fa-location-dot fa-xl"></i>
            </span>
            <span >
                <input type="text" placeholder="Where to?" id="whereTo" class="location" value="${whereTo}">
                <i class="fa-solid fa-location-dot fa-xl"></i>
            </span>
            <span >
                <input type="datetime-local" placeholder="Feb 20-Feb27" id="travelDate" class="calender"value="${travelDate}">
                <i class="fa-regular fa-calendar-days fa-xl"></i>
            </span>
            <span>
                <input type="text" placeholder="1 Traveler" id="numTravelers" class="people" value="${numTravelers}">
                <i class="fa-solid fa-person-walking-luggage fa-xl"></i>
            </span>
             <input type="submit" value="Search" class="sign-in" id="submitButton"> 
            	<!--<button class="sign-in" id="submitButton">Search</button>-->
        </form>
       
    </div>
    <a href="https://i.pinimg.com/564x/6b/cf/99/6bcf99cc2c62fdc34ed3bef4b6cb0ac5.jpg" target="_blank">View Seat Map</a>
    <h3 class="centered-text">Available Flights</h3>
    
    <div class="flight-list">
        <c:forEach var="flight" items="${flightsResultSet}">
            <div class="flight-item">
                <div class="flight-number"><strong>Flight Number: </strong>${flight.getString("FlightNumber")}</div>
                <div class="airline">${flight.getString("Airline")}</div>
                <div class="logo">
                    <img src="./images/${flight.getString('Logo')}" width="100" height="75" alt="Airline Logo">
                </div>
                <div class="departure-info">
                    <div><strong>Leaving From: </strong>${flight.getString("DepartureCity")}, ${flight.getString("DepartureCountry")}</div>
                    <div><strong>Departure Time: </strong>${flight.getString("DepartureTime")}</div>
                </div>
                <div class="arrival-info">
                    <div><strong>Where To: </strong>${flight.getString("ArrivalCity")}, ${flight.getString("ArrivalCountry")}</div>
                    <div><Strong>Arrival Time: </Strong>${flight.getString("ArrivalTime")}</div>
                </div>
                <div class="flight-class"><strong>${flight.getString("FlightClass")}</strong> </div>
                <div class="price"><strong>Ksh. </strong>${flight.getString("Price")}</div>
                
                <!-- Hidden form to collect flight parameters -->
                <form id="flightDetailsForm" action="availableSeats" method="post">
                    <input type="hidden" name="flightNumber" value="${flight.getString('FlightNumber')}">
                    
                    <input type="hidden" name="departureCity" value="${flight.getString('DepartureCity')}">
                    <input type="hidden" name="departureCountry" value="${flight.getString('DepartureCountry')}">
                    <input type="hidden" name="departureTime" value="${flight.getString('DepartureTime')}">
                    <input type="hidden" name="arrivalCity" value="${flight.getString('ArrivalCity')}">
                    <input type="hidden" name="arrivalCountry" value="${flight.getString('ArrivalCountry')}">
                    <input type="hidden" name="arrivalTime" value="${flight.getString('ArrivalTime')}">
                    <input type="hidden" name="flightClass" value="${flight.getString('FlightClass')}">
                    <input type="hidden" name="price" value="${flight.getString('Price')}">
                    <input type="hidden" name="travelers" value="${numTravelers }">
                    
                    <!-- Add more hidden inputs as needed -->
                    <!-- Button to submit the form -->
                    <input type="submit" value="Book Now">
                </form>
                
                
                
            </div>
        </c:forEach>
    </div>

    
    
</body>

</body>
</html>