<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Seats</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
    <link rel="stylesheet" href="./stylesheets/flights.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">     

	<style>
        .body {
            font-family: Arial, sans-serif;
             background-color:#f0ecf6 ;
            display: flex;
            justify-content: center;
            align-items: center;
            
            margin: 0;
            padding: 0;
        }

        .body>.container {
            max-width: 800px;
            width: 100%;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .content {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 20px;
        }

        .details {
            flex: 1;
            padding: 20px;
            text-align: left;
        }

        h2 {
            color: #333333;
            margin-bottom: 10px;
        }

        form {
            flex: 1;
            padding: 20px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #cccccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
            margin-bottom: 20px;
        }

        input[type="submit"] {
            background-color: #8A5CED;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #B693FF;
        }

        img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .image-container {
            max-width: 300px;
            margin-right: 20px;
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
    
	<div class="body"></div>
    <div class="container">
        <h2>Available Seats for Flight ${flightNumber}</h2>
        <div class="content">
            <div class="details">
                <p>Departure: ${departureCity}, ${departureCountry} - ${departureTime}</p>
                <p>Arrival: ${arrivalCity}, ${arrivalCountry} - ${arrivalTime}</p>
                <p>Class: ${flightClass}</p>
                <p>Price per seat: ${price}</p>
            </div>
            <div class="image-container">
                <img alt="Seat Map" src="https://i.pinimg.com/564x/6b/cf/99/6bcf99cc2c62fdc34ed3bef4b6cb0ac5.jpg">
            </div>
        </div>
        <form action="BookSeatServlet" method="post">
            <label for="seat">Select a Seat:</label>
            <select id="seat" name="seat">
                <c:forEach var="seat" items="${availableSeats}">
                    <option value="${seat}">${seat}</option>
                </c:forEach>
            </select>
            <input type="hidden" name="userId" value="${userId}">
            <input type="hidden" name="flightNumber" value="${flightNumber}">
            <input type="hidden" name="departureCity" value="${departureCity}">
            <input type="hidden" name="departureCountry" value="${departureCountry}">
            <input type="hidden" name="departureTime" value="${departureTime}">
            <input type="hidden" name="arrivalCity" value="${arrivalCity}">
            <input type="hidden" name="arrivalCountry" value="${arrivalCountry}">
            <input type="hidden" name="arrivalTime" value="${arrivalTime}">
            <input type="hidden" name="flightClass" value="${flightClass}">
            <input type="hidden" name="price" value="${price}">
            <input type="submit" value="Book Selected Seat">
        </form>
    </div>
</body>
</html>
