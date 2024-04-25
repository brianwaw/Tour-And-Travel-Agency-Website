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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.business.AllBookedCars;

@WebServlet("/AllBookedCarsServlet")
public class AllBookedCarsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<AllBookedCars> bookings = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/katikuDB";
            String username = "prog";
            String password = "netsh";
            Connection conn = DriverManager.getConnection(url, username, password);

            String query = "SELECT user_id, car_id, pickup_location, pickup_date, dropoff_date, rental_date FROM car_rentals";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
            	AllBookedCars booking = new AllBookedCars();
                booking.setUserId(rs.getString("user_id"));
                booking.setCarId(rs.getString("car_id"));
                booking.setPickupLocation(rs.getString("pickup_location"));
                booking.setPickupDate(rs.getString("pickup_date"));
                booking.setDropoffDate(rs.getString("dropoff_date"));
                booking.setRentalDate(rs.getString("rental_date"));
                bookings.add(booking);
            }

            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle exceptions
        }

        // Set bookings as an attribute in request scope
        request.setAttribute("carBookings", bookings);

        // Forward to JSP to display data
        request.getRequestDispatcher("/allbookedcars.jsp").forward(request, response);
    }
}
