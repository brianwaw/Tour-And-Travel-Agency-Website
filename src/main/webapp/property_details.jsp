<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Property Details</title>
    <style>
    	/* Resetting default margin and padding for all elements */
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
		    max-width:800px;
		    margin:0px auto;
		    
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
    	 .main-container {
            font-family: Arial, sans-serif;
            background-color: #f0ecf6;
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            height: 100vh; /* Full viewport height */
            margin: 0;
            padding: 20px;
        }

        .property-container {
            max-width: 600px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            text-align: left; /* Align text to the left */
        }

        h2 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        p {
            font-size: 16px;
            margin-bottom: 8px;
        }

        img {
            margin-top: 10px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
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
        <a href="stays.jsp" class="active">Stays</a>
        <a href="flights.jsp">Flights</a>
        <a href="cars.jsp">Cars</a>
        <a href="bookedrooms.jsp">Packages</a>
        
    </nav>
    <div class="main-container">
    <div class="property-container">
    <h2>Property Details</h2>
    <p>Room Name: <%= request.getParameter("roomName") %></p>
    <p>Number of Rooms: <%= request.getParameter("numberOfRooms") %></p>
    <p>Location Name: <%= request.getParameter("locationName") %></p>
    <p>Price: <%= request.getParameter("price") %></p>
    <p>Description: <%= request.getParameter("description") %></p>
    <p>Images:</p>
    <img src="./images/<%= request.getParameter("image1FileName") %>" width="200" height="150"><br>
    <img src="./images/<%= request.getParameter("image2FileName") %>" width="200" height="150"><br>
    <img src="./images/<%= request.getParameter("image3FileName") %>" width="200" height="150"><br>
    </div>
    </div>
    
</body>
</html>
