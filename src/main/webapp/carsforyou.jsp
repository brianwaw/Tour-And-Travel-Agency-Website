<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Booked Cars</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
    <link rel="stylesheet" href="./stylesheets/flights.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">     
	
	<style>
        .car-container {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr; /* Three columns with equal width */
    gap: 20px; /* Gap between grid items */
    
}

.car {
    /* Styling for each car item */
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.car img {
    width: 100%;
    height: auto;
    border-radius: 5px;
    margin-bottom: 10px;
}

.car-info {
    margin-bottom: 10px;
}

.car-info label {
    font-weight: bold;
}

.car-actions {
    text-align: center;
}

.checkout-button {
    padding: 8px 16px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.checkout-button:hover {
    background-color: #0056b3;
}
.footer{
	position:relative;
	bottom:0;
}
.split{
	height:30vh;
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
    <h1>Booked Cars</h1>
    <div class="car-container">
        <c:forEach items="${bookedCars}" var="booking">
            <div class="car">
                <img src="./images/${booking.image}" alt="Car Image">
                <div class="car-info">
                    <label>Start Date:</label> ${booking.startDate}<br>
                    <label>End Date:</label> ${booking.endDate}<br>
                    <label>Rented Date:</label> ${booking.rentalDate}<br>
                    <label>Location:</label> ${booking.location}<br>
                </div>
                <div class="car-actions">
                    <!-- Hidden form to collect carId -->
                    <form action="processBooking.jsp" method="post">
                        <input type="hidden" name="carId" value="${booking.carId}">
                        <input class="checkout-button" type="submit" value="Checkout">
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>
   <div class="split"></div>
    <div class="footer">
    <!-- Include footer -->
    <jsp:include page="footer.jsp" />
    </div>
</body>
</html>
