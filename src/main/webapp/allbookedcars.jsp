<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Booked Cars</title>
</head>
<body>
    <h1>All Booked Cars</h1>
    <table border="1">
        <tr>
            <th>User ID</th>
            <th>Car ID</th>
            <th>Pickup Location</th>
            <th>Pickup Date</th>
            <th>Dropoff Date</th>
            <th>Rental Date</th>
        </tr>
        <c:forEach var="booking" items="${carBookings}">
            <tr>
                <td>${booking.userId}</td>
                <td>${booking.carId}</td>
                <td>${booking.pickupLocation}</td>
                <td>${booking.pickupDate}</td>
                <td>${booking.dropoffDate}</td>
                <td>${booking.rentalDate}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
