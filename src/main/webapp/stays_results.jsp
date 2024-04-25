<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
   
    
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">  
    <style>
    	@import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');

		*{
		    padding: 0px;
		    margin: 0px;
		    box-sizing: border-box;
		}
		body{
		    background-color:#f0ecf6 ;
		    font-family: poppins;
		    margin: 0 auto;
		    max-width: 1200px;
		}
		header{
		    width: 100%;
		    height: 75px;
		    background-color:#f0ecf6 ;
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    z-index: 100%;
		}
		.logo{
		    font-size:13px;
		    color:black;
		    font-weight: 700;
		}
		div>span{
		    padding-left: 30px;
		    background-color:#f0ecf6 ;
		
		}
		.sign-in,.list-property{
		    border: none;
		    padding:13px 10px ;
		    background-color: #8a5ced;
		    border-radius: 20px;
		}
		nav{
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    padding-bottom:9px;
		    
		}
		nav a{
		    text-decoration: none;
		    color: black;
		    font-size: 12px;
		    position:relative;
		   
		}
		nav a:hover{
		    color: #8a5ced;
		}
		nav a::before{
		    content:'';
		    position: absolute;
		    background-color: #8a5ced;
		    top: 0;
		    left: 0;
		    width:0;
		    height:2px;
		    transition: .3s;
		}
		nav a:hover::before{
		    width:100%;
		}
		.active{
		    color: #8a5ced;
		}
		nav .active::before{
		    content:'';
		    position: absolute;
		    background-color: #8a5ced;
		    top: 0;
		    left: 0;
		    width:100%;
		    height:2px;
		
		}
		
		
		.text{
		    font-size: 14px;
		    margin-top: 10px;
		    
		    padding-bottom: 10px;
		    font-family:roboto;
		}
		.input-container{
		    padding-top: 10px;
		    width: 100%;
		}
		.form{
		    display: flex;
		    justify-content: space-between;
		    
		    
		    gap: 5px;
		}
		.form span{
		    position:relative;
		}
		span>input{
		    height: 45px;
		    display: flex;
		   /* max-width:290px;*/
		    border: 1.3px solid #ccc;
		    border-radius: 5px;
		    background-color: #F5F3FA;
		}
		
		.form>span>i{
		    position: absolute;
		    top: 45%;
		    right: 100%;
		    left:1.6%; 
		}
		.location, .calender, .people{
		    padding-left: 35px;
		}
		
		
		
		body {
		    font-family: Arial, sans-serif;
		    padding: 20px;
		}
		
		.grid-container {
		    display: grid;
		    grid-template-columns: 1fr 1fr 1fr;
		    gap: 20px;
		}
		
		.room-item {
		    border: 1px solid #ccc;
		    padding: 20px;
		    border-radius:8px;
		    background-color: #F5F3FA;
		}
		.room-item:hover{
			outline: 2px solid #8A5CED;
			
		}
		
		.image-carousel {
		    position: relative;
		    width: 100%;
		    max-width: 350px; /* Adjust carousel width as needed */
		    margin-bottom: 20px;
		}
		
		.image-container {
		    display: grid;
		    width: 100%;
		    grid-template-columns: 1fr;
		    grid-auto-rows: auto;
		    overflow: hidden;
		}
		
		.image-container img {
		    width: 100%;
		    height: 190px;
		    object-fit: cover;
		    margin-bottom: 10px;
		    border-radius: 8px;
		}
		
		.prev-button,
		.next-button {
		    position: absolute;
		    top: 50%;
		    transform: translateY(-50%);
		    color: #fff;
		    font-size: 20px;
		    padding: 8px;
		    background-color: rgba(0, 0, 0, 0.3);
		    cursor: pointer;
		    border-radius:40%;
		}
		
		.prev-button {
		    left: 10px;
		}
		
		.next-button {
		    right: 10px;
		}
		.Rent-button {
		    width: 100%;
		    padding: 10px;
		    background-color: #8A5CED;
		    color: #fff;
		    border: none;
		    border-radius: 4px;
		    cursor: pointer;
		    transition: background-color 0.3s ease;	    
		}
		
		.Rent-button:hover {
		    background-color: #B693FF;

		
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
        <a href="../html/stays.jsp" class="active">Stays</a>
        <a href="flights.jsp">Flights</a>
        <a href="../html/cars.jsp">Cars</a>
        <a href="../html/packages.jsp">Packages</a>
        <a href="../html/thingstodo.jsp">Things to do</a>
        <a href="../html/cruises.jsp" >Cruises</a>
    </nav>
    <div class="input-container">
        <form action="available" class="form" method="post">
            <span >
                <input type="text" placeholder="Where to?" class="location" name="location" value="${location}">
                <i class="fa-solid fa-location-dot fa-xl"></i>
            </span>
            <span >
                <input type="date" placeholder="Mon,Feb19 - Mon,Feb26" class="calender" name="entry_date" value="${entryDate}">
                <i class="fa-regular fa-calendar-days fa-xl"></i>
            </span>
            <span >
                <input type="date" placeholder="Mon,Feb19 - Mon,Feb26" class="calender" name="exit_date" value="${exitDate}">
                <i class="fa-regular fa-calendar-days fa-xl"></i>
            </span>
            <span>
                <input type="text" placeholder="1 Traveller" class="people" name="travellers" value="${travelers}">
                <i class="fa-solid fa-person-walking-luggage fa-xl"></i>
            </span>
            <span>
                <input type="text" placeholder="1 Room" class="people" name="rooms" value="${rooms}">
                <i class="fa-solid fa-person-walking-luggage fa-xl"></i>
            </span>
            <input type="submit" value="Search" class="sign-in">
            
        </form>
       
    </div>
    <h2>Available Rooms</h2>
    

    <div class="grid-container">
        <c:forEach var="room" items="${availableRooms}">
            <div class="room-item">
                <!-- Image Carousel -->
                <div class="image-carousel">
                    <div class="image-container">
                        <img src="./images/${room.getString('image1')}" alt="Image 1">
                        <img src="./images/${room.getString('image2')}" alt="Image 2">
                        <img src="./images/${room.getString('image3')}" alt="Image 3">
                    </div>
                    <div class="prev-button">&lt;</div>
                    <div class="next-button">&gt;</div>
                </div>

                <!-- Room details -->
                <p><strong>Ksh </strong> ${room.getString("price")}.</p>
                <p><strong>Room Name:</strong> ${room.getString("room_name")}</p>
                <p><strong>Number of Rooms:</strong> ${room.getInt("number_of_rooms")}</p>
                <p>${room.getString("description")}</p>

                <!-- Hidden form to capture room details -->
                <form method="post" action="bookRoomServlet" >
                    <input type="hidden" name="roomid" value="${room.getString('room_id')}">
                    <input type="hidden" name="entryDate" value="${entryDate}">
                    <input type="hidden" name="exitDate" value="${exitDate}">
                    <input type="hidden" name="numberOfRooms" value="${room.getInt('number_of_rooms')}">
                    <input type="hidden" name="travelers" value="${travelers}">
                    <input type="hidden" name="price" value="${room.getString('price')}">
                    <input type="hidden" name="roomName" value="${room.getString('room_name')}">
                    
                    <!-- Additional hidden fields can be added here -->

                    <input type="submit" value="Book Now" class="Rent-button">
                </form>
            </div>
        </c:forEach>
    </div>

    



</body>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var swiper = new Swiper('.swiper-container', {
            // Optional parameters
            slidesPerView: 1, // Number of slides per view (1 image visible at a time)
            spaceBetween: 10, // Space between slides
            loop: true, // Infinite loop
            autoplay: {
                delay: 5000, // Autoplay delay in milliseconds (5 seconds)
                disableOnInteraction: false, // Disable autoplay on user interaction
            },
            pagination: {
                el: '.swiper-pagination', // Pagination container
                clickable: true, // Enable clickable pagination bullets
            },
        });
    });
    
    
    //image carousel
   document.addEventListener('DOMContentLoaded', function() {
    const carousels = document.querySelectorAll('.image-carousel');

    carousels.forEach(carousel => {
        const images = carousel.querySelectorAll('.image-container img');
        let currentIndex = 0;

        function showImage(index) {
            images.forEach((image, idx) => {
                if (idx === index) {
                    image.style.display = 'block';
                } else {
                    image.style.display = 'none';
                }
            });
        }

        function nextImage() {
            currentIndex = (currentIndex + 1) % images.length;
            showImage(currentIndex);
        }

        function prevImage() {
            currentIndex = (currentIndex - 1 + images.length) % images.length;
            showImage(currentIndex);
        }

        carousel.querySelector('.next-button').addEventListener('click', nextImage);
        carousel.querySelector('.prev-button').addEventListener('click', prevImage);

        // Show the first image initially
        showImage(currentIndex);
    });
});


</script>

</html>
