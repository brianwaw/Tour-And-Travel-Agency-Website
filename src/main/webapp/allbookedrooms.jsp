<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Booked Rooms</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>All Booked Rooms</h1>
    <table>
        <thead>
            <tr>
                <th>User ID</th>
                <th>Room ID</th>
                <th>Entry Date</th>
                <th>Exit Date</th>
                <th>Number of Rooms</th>
                <th>Booking Date</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="booking" items="${roomBookings}">
                <tr>
                    <td>${booking.userId}</td>
                    <td>${booking.roomId}</td>
                    <td>${booking.entryDate}</td>
                    <td>${booking.exitDate}</td>
                    <td>${booking.numberOfRooms}</td>
                    <td>${booking.bookingDate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
