<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booked Rooms</title>
    <link rel="stylesheet" href="./stylesheets/bookedRooms.css">
</head>
<body>
    <div class="container">
    <h2>Booked Rooms</h2>
    
    <c:if test="${empty bookings}">
        <p>No rooms booked.</p>
    </c:if>
    
    <div class="bookings-container">
        <c:forEach var="booking" items="${bookings}">
            <div class="booking-item">
                <h3>${booking.roomName}</h3>
                <img src="${booking.image1}" alt="Room Image">
                <p><strong>Entry Date:</strong> ${booking.entryDate}</p>
                <p><strong>Exit Date:</strong> ${booking.exitDate}</p>
                <p><strong>Number of Rooms:</strong> ${booking.numberOfRooms}</p>
                <p><strong>Booking Date:</strong> ${booking.bookingDate}</p>

                <!-- Hidden form to collect review and room_id -->
                <form action="submitReview" method="post">
                    <!-- Hidden input for room_id -->
                    <input type="hidden" name="room_id" value="${booking.roomId}">
                    
                    <label for="review">Your Review:</label>
                    <textarea id="review" name="review" rows="4" cols="50" required></textarea>
                    
                    <button type="submit">Submit Review</button>
                </form>
            </div>
        </c:forEach>
    </div>
    
    <div style="margin-top: 20px; text-align: center;">
        <a href="home.jsp">Go back to Home</a>
    </div>
</div>

</body>
</html>
