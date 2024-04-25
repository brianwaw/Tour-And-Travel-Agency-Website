<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Bookings</title>
    <link rel="stylesheet" href="styles.css"> 
    <style>
    	* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Poppins', sans-serif;
    background-color: #f0ecf6;
    margin: 0 auto;
    max-width: 1200px;
    
}
.whole{
	height:100vh;
}

header {
    background-color: #8a5ced;
    color: white;
    padding: 15px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo h1 {
    font-size: 18px;
    font-weight: bold;
}

nav {
    display: flex;
}

nav a {
    text-decoration: none;
    color: white;
    font-size: 14px;
    margin-right: 15px;
}

.user-bookings {
    margin: 50px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 10px;
    text-align: center;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.user-bookings h2 {
    margin-bottom: 20px;
}

button {
    padding: 10px 20px;
    margin: 10px;
    font-size: 16px;
    cursor: pointer;
    border: none;
    border-radius: 5px;
    background-color: #8a5ced;
    color: white;
}

button:hover {
    background-color: #6d3ebc;
}
    	
    </style>
</head>
<body>
<div class="whole">
    <header>
        <div class="logo">
            <h1>D.Destination <i class="fa-solid fa-plane"></i></h1>
        </div>
        <nav>
            <a href="stays.jsp">Stays</a>
            <a href="flights.jsp">Flights</a>
            <a href="cars.jsp">Cars</a>
            <a href="bookedrooms.jsp">Booked Rooms</a>
            
        </nav>
    </header>

    <div class="user-bookings">
        <h2>Welcome Admin</h2>
        <button onclick="window.location.href='AllBookedCarsServlet'">View Booked Cars</button>
        <button onclick="window.location.href='AllBookedFlightsServlet'">View Booked Flights</button>
        <button onclick="window.location.href='AllBookedRoomsServlet'">View Booked Rooms</button>
        <button onclick="window.location.href='addadmin.jsp'">Add User</button>
    </div>
    
   </div>

    <!-- Include footer -->
    <jsp:include page="footer.jsp" />
 
</body>
</html>
