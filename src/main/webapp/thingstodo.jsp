<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
    <link rel="stylesheet" href="../stylesheets/thingstodo.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">     
</head>
<body>
    <header>
        <div class="logo">
            <h1>D.Destination</h1>
        </div>
        <div class="container">
            <span><button class="list-property">List your property</button></span>
            <span><i class="fa-solid fa-bell fa-xl"></i></span>
            <span><button class="sign-in">Sign in</button></span>
        </div>   
    </header>
    <nav>
        <a href="../html/stays.jsp">Stays</a>
        <a href="../html/flights.jsp">Flights</a>
        <a href="../html/cars.jsp">Cars</a>
        <a href="../html/packages.jsp">Packages</a>
        <a href="../html/thingstodo.jsp" class="active">Things to do</a>
        <a href="../html/cruises.jsp" >Cruises</a>
    </nav>
    <p class="text">Find lucrative deals on hotels, homes and more..</p>
    <div class="input-container">
        <form action="" class="form">
            <span >
                <input type="text" placeholder="Where to?" class="location">
                <i class="fa-solid fa-location-dot fa-xl"></i>
            </span>
            <span >
                <input type="text" placeholder="Mon,Feb19 - Mon,Feb26" class="calender">
                <i class="fa-regular fa-calendar-days fa-xl"></i>
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
                enjoy extra savings on a spring vacation.         <button class="sign-in">See packages</button>
            </p>
        </div>
    </div>
    <h2 class="popular-destination-text">Popular Destinations</h2>
    <div class="popular-destination">
        <span>
            <p>Nairobi</p>
            <img src="../resources/nairobi.jpg" alt="Nairobi-image" class="destination-suggestion-img">
        </span>
        <span>
            <p>Dubai</p>
            <img src="../resources/dubai2.jpg" alt="Nairobi-image" class="destination-suggestion-img">
        </span>
        <span>
            <p>Rome</p>
            <img src="../resources/rome.jpg" alt="Nairobi-image" class="destination-suggestion-img">
        </span>
    </div>
</body>
</html>