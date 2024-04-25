<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rental Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5; /* Light grey background */
            color: #333; /* Dark text color */
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #8a2be2; /* Dark violet background */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            color: #fff; /* White text color */
        }
        h1 {
            text-align: center;
        }
        p {
            margin-bottom: 20px;
            line-height: 1.6;
        }
        .button-container {
            text-align: center;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #6a1b9a; /* Purple background */
            color: #fff; /* White text color */
            border: none;
            border-radius: 4px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        .button:hover {
            background-color: #4a148c; /* Darker purple on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Rental Confirmation</h1>
        <p>Your car rental has been confirmed!</p>
        <p>Thank you for choosing our service.</p>
        <div class="button-container">
            <a href="stays.jsp" class="button">Back to Home</a>
        </div>
    </div>
</body>
</html>
