<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Booked Flights</title>
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
    <h1>All Booked Flights</h1>
    <table>
        <thead>
            <tr>
                <th>User ID</th>
                <th>Flight Number</th>
                <th>Seat Number</th>
                <th>Flight Class</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="flight" items="${bookedFlights}">
                <tr>
                    <td>${flight.userId}</td>
                    <td>${flight.flightNumber}</td>
                    <td>${flight.seatNumber}</td>
                    <td>${flight.flightClass}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
