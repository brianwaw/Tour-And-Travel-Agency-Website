package com.allservlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CarRentalServlet")
public class CarRentalServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 // Get the userId from the cookie
        Integer userId = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("user_id")) {
                    userId = Integer.parseInt(cookie.getValue());
                    break;
                }
            }
        }

        if (userId == null) {
            // User not logged in, redirect to login.jsp
            response.sendRedirect("login.jsp");
            return;
        }

        // Get form parameters
        String carId = request.getParameter("carID");
        String pickupLocation = request.getParameter("pickupLocation");
        String pickupDate = request.getParameter("pickupDate");
        String dropoffDate = request.getParameter("dropoffDate");

        // Update car_availability to 0 for the selected car
        updateCarAvailability(carId);

        // Database connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/katikuDB";
        String dbUsername = "prog";
        String dbPassword = "netsh";

        try (Connection conn = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword)) {
        	try {
    			Class.forName("com.mysql.cj.jdbc.Driver");
    		} catch (ClassNotFoundException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
            // Insert rental record into car_rentals table
            String sqlInsert = "INSERT INTO car_rentals (user_id, car_id, pickup_location, pickup_date, dropoff_date) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sqlInsert)) {
                stmt.setInt(1, userId);
                stmt.setString(2, carId);
                stmt.setString(3, pickupLocation);
                stmt.setString(4, pickupDate);
                stmt.setString(5, dropoffDate);

                stmt.executeUpdate();
                
                // Redirect to a confirmation page
                response.sendRedirect("rentalConfirmation.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database errors
            response.sendRedirect("error.jsp");
        }
    }

    private void updateCarAvailability(String carId) {
        // Database connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/katikuDB";
        String dbUsername = "prog";
        String dbPassword = "netsh";
        
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        try (Connection conn = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword)) {
            // Update car_availability to 0 for the selected car
            String sqlUpdate = "UPDATE Cars SET car_availability = 0 WHERE car_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sqlUpdate)) {
                stmt.setString(1, carId);
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database errors
        }
    }
}
