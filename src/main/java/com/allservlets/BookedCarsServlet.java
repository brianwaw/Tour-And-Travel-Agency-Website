package com.allservlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.business.CarBooking;

@WebServlet("/BookedCarsServlet")
public class BookedCarsServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost/katikuDB";
    private static final String DB_USER = "prog";
    private static final String DB_PASSWORD = "netsh";
    
    

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve user_id from cookies
        String userId = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("user_id")) {
                    userId = cookie.getValue();
                    break;
                }
            }
        }

        if (userId != null) {
            List<CarBooking> bookedCars = new ArrayList<>();

            // Database connection and query
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            try {
                // Establish database connection
            	Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

                // SQL query to retrieve booked cars for the user
                String sql = "SELECT cr.car_id, cr.pickup_location, cr.pickup_date, cr.dropoff_date, cr.rental_date, c.car_image " +
                        "FROM car_rentals cr " +
                        "INNER JOIN Cars c ON cr.car_id = c.car_id " +
                        "WHERE cr.user_id = ?";

                stmt = conn.prepareStatement(sql);
                stmt.setString(1, userId);

                // Execute query
                rs = stmt.executeQuery();

                // Process result set
                while (rs.next()) {
                    CarBooking booking = new CarBooking(
                        rs.getString("c.car_image"),
                        rs.getString("cr.pickup_date"),
                        rs.getString("cr.dropoff_date"),
                        rs.getString("cr.rental_date"),
                        rs.getString("cr.pickup_location"),
                        rs.getString("cr.car_id")
                    );
                    bookedCars.add(booking);
                }

                // Forward to JSP with the list of booked cars
                request.setAttribute("bookedCars", bookedCars);
                request.getRequestDispatcher("carsforyou.jsp").forward(request, response);

            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp?message=Database Error");
            } finally {
                // Close resources
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } else {
            response.sendRedirect("error.jsp?message=User ID not found");
        }
    }

    // Define a simple POJO class to represent a car booking
    
}
