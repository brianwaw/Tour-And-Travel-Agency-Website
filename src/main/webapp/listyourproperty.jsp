<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    /* CSS styles */
    
    }
    div {
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: #fff;
        max-width: 400px;
        margin: 0 auto;
    }
    form {
        margin-top: 15px;
    }
    
    
    input[type="text"], textarea {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        box-sizing: border-box;
        
    }
    input[type="file"] {
        margin-bottom: 10px;
    }
    input[type="submit"] {
        padding: 10px 20px;
        background-color: #8A5CED;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #B693FF;
    }
    
    .form-container {
            margin: 0;
            /*height: 100vh; /* Full viewport height */
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            background-color: #f0ecf6;
        }
    form{
    	
    	width: 400px;
        height: 100%;
        background-color: #F5F3FA;
        border-radius: 10px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        padding: 20px;
        text-align: center;
    }
    .center-text{
    	display:flex;
    	justify-content:center;
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
        <a href="packages.jsp">Packages</a>
        <a href="thingstodo.jsp">Things to do</a>
        <a href="cruises.jsp" >Cruises</a>
    </nav>
    <div>
        <h3 class="center-text">List your Property</h3>
        <div class="form-container">
        <form action="Listproperty" method="post" enctype="multipart/form-data" >
            Room name: <input type="text" name="roomName">
            Number of rooms: <input type="text" name="numberOfRooms">
            Location name: <input type="text" name="locationName">
            Price: <input type="text" name="price"><br><br>
            Description: <textarea rows="10" cols="50" name="description"></textarea>
            
            Image 1: <input type="file" name="image1"><br>
            Image 2: <input type="file" name="image2"><br>
            Image 3: <input type="file" name="image3"><br>
            
            <input type="submit" value="Submit"> 
        </form>
        </div>
    </div>
</body>
</html>
