<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Rental Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
    <link rel="stylesheet" href="./stylesheets/stays.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">     
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
        <a href="stays.jsp" class="active">Stays</a>
        <a href="flights.jsp">Flights</a>
        <a href="cars.jsp">Cars</a>
        <a href="bookedrooms.jsp">Booked</a>
        
    </nav>
    <p class="text">Find lucrative deals on hotels, homes and more..</p>
    <div class="input-container">
        <form action="available" class="form" method="post" onsubmit="return validateForm()">
            <span>
                <input type="text" placeholder="Where to?" class="location" name="location">
                <i class="fa-solid fa-location-dot fa-xl"></i>
            </span>
            <span>
                <input type="date" placeholder="Mon,Feb19 - Mon,Feb26" class="calendar" name="entry_date" id="entryDate" required>
                
            </span>
            <span>
                <input type="date" placeholder="Mon,Feb19 - Mon,Feb26" class="calendar" name="exit_date" id="exitDate" required>
                
            </span>
            <span>
                <input type="text" placeholder="1 Traveler" class="people" name="travellers">
                <i class="fa-solid fa-person-walking-luggage fa-xl"></i>
            </span>
            <span>
                <input type="text" placeholder="1 Room" class="people" name="rooms">
                <i class="fa-solid fa-house fa-xl"></i>
            </span>
            <input type="submit" value="Search" class="sign-in">
        </form>
    </div>
    <div class="middle">
        <div class="middle-container">
            <h1>Save more on a <br>
                spring escape
            </h1>
            <p>Gather your family and go. With Member Prices,<br>
                enjoy extra savings on a spring vacation.         
            </p>
        </div>
    </div>
    <h2 class="popular-destination-text">Popular Destinations</h2>
    <div class="popular-destination">
        <span>
            <p>Nairobi</p>
            <img src="./resources/nairobi.jpg" alt="Nairobi-image" class="destination-suggestion-img">
        </span>
        <span>
            <p>Dubai</p>
            <img src="./resources/dubai2.jpg" alt="Nairobi-image" class="destination-suggestion-img">
        </span>
        <span>
            <p>Rome</p>
            <img src="./resources/rome.jpg" alt="Nairobi-image" class="destination-suggestion-img">
        </span>
    </div>

    <script>
        function validateForm() {
            var entryDate = new Date(document.getElementById('entryDate').value);
            var exitDate = new Date(document.getElementById('exitDate').value);

            // Check if exit date is greater than entry date
            if (exitDate <= entryDate) {
                alert('Please ensure the exit date is greater than the entry date.');
                return false; // Prevent form submission
            }

            return true; // Proceed with form submission
        }
    </script>
</body>
</html>
