<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
    <link rel="stylesheet" href="./stylesheets/flights.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">     

	<style>

	button:hover{
	cursor:pointer;
}
	@media only screen and (max-width: 1024px) {
  /* Tablet Styles */
  .form {
    flex-direction: column;
    gap: 10px;
  }

  .form span {
    width: 100%;
  }

  .airlines img {
    width: 100%;
    height: auto;
    border-radius: 0;
  }

  .airplane-img {
    border-radius: 0;
  }
}

/* Hide mobile menu by default */
.mobile-menu {
    display: none;
    flex-direction: column;
    align-items: center;
}

/* Style for menu toggle icon */
.menu-toggle {
    display: block;
    text-align: right;
    padding: 10px;
}

.menu-toggle i {
    font-size: 24px;
    cursor: pointer;
}

/* Media query for mobile devices */
@media only screen and (max-width: 600px) {
    /* Show mobile menu when toggle is clicked */
    .menu-toggle {
        display: block;
    }

    .input-container {
        text-align: center;
    }

    /* Center and set equal width for form inputs */
    .input-container .form {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .input-wrapper {
        width: 100%;
        margin-bottom: 10px;
    }

    .input-wrapper input {
        width: 100%;
        height: 40px;
        border: 1px solid black;
        border-radius: 5px;
        padding: 5px;
    }

    /* Show mobile menu items in a column layout */
    .mobile-menu a {
        display: block;
        padding: 10px;
        text-align: center;
    }
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
    <div class="trips">
        <ul>
            <li>
            	
               <a href="#" class="economy">Class<i class="fa-solid fa-caret-down fa-xl"></i></a>
			   <div class="dropdown-menu">
			        <form id="travelClassForm">
			            <input type="radio" id="Economy" name="travel-class" value="Economy">
			            <label for="Economy">Economy</label><br>
			            <input type="radio" id="First-class" name="travel-class" value="First">
			            <label for="First-class">First-class</label><br>
			            <input type="radio" id="Premium-economy" name="travel-class" value="Premium-economy">
			            <label for="Premium-economy">Premium-economy</label><br>
			            <input type="radio" id="Business-class" name="travel-class" value="Business">
			            <label for="Business-class">Business-class</label><br>
			        </form>
			    </div>

               
            </li>
        </ul>
        
        
       
    </div>
    <div class="input-container">
        <form id="travelDetailsForm" class="form">
            <span >
                <input type="text" placeholder="Leaving from" id="leavingFrom" class="location">
                <i class="fa-solid fa-location-dot fa-xl"></i>
            </span>
            <span >
                <input type="text" placeholder="Where to?" id="whereTo" class="location">
                <i class="fa-solid fa-location-dot fa-xl"></i>
            </span>
            <span >
                <input type="datetime-local" placeholder="Feb 20-Feb27" id="travelDate" class="calender">
                <i class="fa-regular fa-calendar-days fa-xl"></i>
            </span>
            <span>
                <input type="text" placeholder="1 Traveler" id="numTravelers" class="people">
                <i class="fa-solid fa-person-walking-luggage fa-xl"></i>
            </span>
             <input type="submit" value="Search" class="sign-in" id="submitButton"> 
            	<!--<button class="sign-in" id="submitButton">Search</button>-->
        </form>
       
    </div>

    <div class="airplane-img">
        <p class="airplane-text">Embark on a journey where every mile is a signature of comfort,<br>every cloud a canvas of luxury. Experience the art of flying with our listed airlines</p>
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
    <h2 class="popular-destination-text">Some of the registered airlines:</h2>
    <div class="airlines">
        <img src="./resources/Kenya_Airways_logo_PNG1.png" alt="">
        <img src="./resources/Etihad_Airways_logo_PNG5.png" alt="">
        <img src="./resources/AccessAir-Logo-PNG5.png" alt="">
        <img src="./resources/Ethiopian_Airlines_logo_PNG3.png" alt="">
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
    <!-- Include footer -->
    <jsp:include page="footer.jsp" />
</body>

<script>
    document.getElementById('submitButton').addEventListener('click', function(event) {
        event.preventDefault(); // Prevent default form submission

        // Gather data from the first form
        var selectedTravelClass = document.querySelector('#travelClassForm input[name="travel-class"]:checked').value;

        // Gather data from the second form
        var leavingFrom = document.getElementById('leavingFrom').value;
        var whereTo = document.getElementById('whereTo').value;
        var travelDate = document.getElementById('travelDate').value;
        var numTravelers = document.getElementById('numTravelers').value;

        // Prepare data to send to servlet
        var data = {
            'selectedTravelClass': selectedTravelClass,
            'leavingFrom': leavingFrom,
            'whereTo': whereTo,
            'travelDate': travelDate,
            'numTravelers': numTravelers
        };
        console

        // Send data to servlet via AJAX
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'availableflights', true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.onload = function() {
            var element = document.querySelector('html');
            element.innerHTML = xhr.responseText;
        };
        xhr.send(JSON.stringify(data));
    });
    
    document.addEventListener("DOMContentLoaded", function() {
        var radioButtons = document.querySelectorAll('input[type="radio"][name="travel-class"]');
        var labelClass = document.querySelector('.economy');

        radioButtons.forEach(function(radioButton) {
            radioButton.addEventListener('change', function() {
                if (this.checked) {
                    labelClass.textContent = this.value;
                    labelClass.innerHTML +=' '+ '<i class="fa-solid fa-caret-down fa-xl"></i>';// Update label text to selected value
                }
            });
        });
    });
</script>
</html>