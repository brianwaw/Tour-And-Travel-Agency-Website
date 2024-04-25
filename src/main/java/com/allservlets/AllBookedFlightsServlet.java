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

import com.business.BookedFlightBean;

@WebServlet("/AllBookedFlightsServlet")
public class AllBookedFlightsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<BookedFlightBean> bookedFlights = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/katikuDB";
            String username = "prog";
            String password = "netsh";
            Connection conn = DriverManager.getConnection(url, username, password);

            String query = "SELECT user_id, FlightNumber, seat_number, flight_class FROM flightsbooked";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                BookedFlightBean flight = new BookedFlightBean();
                flight.setUserId(rs.getString("user_id"));
                flight.setFlightNumber(rs.getString("FlightNumber"));
                flight.setSeatNumber(rs.getString("seat_number"));
                flight.setFlightClass(rs.getString("flight_class"));
                
                bookedFlights.add(flight);
            }

            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle exceptions (log or show error message)
        }

        // Set bookedFlights as an attribute in request scope
        request.setAttribute("bookedFlights", bookedFlights);

        // Forward to JSP to display data
        request.getRequestDispatcher("/allbookedflights.jsp").forward(request, response);
    }
}
