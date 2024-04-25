<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            color: #333;
            padding: 20px;
            text-align: center;
        }
        .confirmation-container {
            background-color: #8a2be2; /* Purple color */
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 0 auto;
        }
        h1 {
            color: #fff; /* White color for heading */
        }
        p {
            color: #fff; /* White color for text */
            font-size: 18px;
            margin-bottom: 20px;
        }
        .button-container {
            margin-top: 30px;
        }
        .button {
            background-color: #fff;
            color: #8a2be2; /* Purple color for button text */
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        .button:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <div class="confirmation-container">
        <h1>Booking Confirmed!</h1>
        <p>Thank you for your reservation.</p>
        <p>Your booking details:</p>
        <p><strong>Room Name:</strong> <%= request.getParameter("roomName") %></p>
        <p><strong>Entry Date:</strong> <%= request.getParameter("entryDate") %></p>
        <p><strong>Exit Date:</strong> <%= request.getParameter("exitDate") %></p>
        <p><strong>Number of Rooms:</strong> <%= request.getParameter("numberOfRooms") %></p>
        <p><strong>Travelers:</strong> <%= request.getParameter("travelers") %></p>
        <p><strong>Price:</strong> <%= request.getParameter("price") %></p>
        
        <div class="button-container">
            <a href="stays.jsp" class="button">Back to Home</a>
        </div>
    </div>
</body>
</html>
