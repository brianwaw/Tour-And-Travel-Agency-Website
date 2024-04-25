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

@WebServlet("/availableSeats")
public class BookFlightServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve user_id from cookies
        Integer userId = getUserIdFromCookies(request);

        if (userId == null) {
            // Redirect to login.jsp if user_id is not found in cookies
            response.sendRedirect("login.jsp");
            return;
        }

        // Retrieve all parameters from the form submission
        String flightNumber = request.getParameter("flightNumber");
        String departureCity = request.getParameter("departureCity");
        String departureCountry = request.getParameter("departureCountry");
        String departureTime = request.getParameter("departureTime");
        String arrivalCity = request.getParameter("arrivalCity");
        String arrivalCountry = request.getParameter("arrivalCountry");
        String arrivalTime = request.getParameter("arrivalTime");
        String flightClass = request.getParameter("flightClass");
        String price = request.getParameter("price");
        String travelers = request.getParameter("travelers");

        // Set collected information in the request attributes
        request.setAttribute("userId", userId);
        request.setAttribute("flightNumber", flightNumber);
        request.setAttribute("departureCity", departureCity);
        request.setAttribute("departureCountry", departureCountry);
        request.setAttribute("departureTime", departureTime);
        request.setAttribute("arrivalCity", arrivalCity);
        request.setAttribute("arrivalCountry", arrivalCountry);
        request.setAttribute("arrivalTime", arrivalTime);
        request.setAttribute("flightClass", flightClass);
        request.setAttribute("price", price);
        request.setAttribute("travelers", travelers);

        // Set collected information in the request attributes
        request.setAttribute("flightNumber", flightNumber);
        request.setAttribute("userId", userId);

        // Get available seats for the specified flight number
        List<String> availableSeats = getAvailableSeatsForFlight(flightNumber);

        // Set available seats in the request attribute
        request.setAttribute("availableSeats", availableSeats);

        // Forward the request to a JSP for displaying available seats
        request.getRequestDispatcher("availableSeats.jsp").forward(request, response);
    }

    private Integer getUserIdFromCookies(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("user_id")) {
                    try {
                        return Integer.parseInt(cookie.getValue());
                    } catch (NumberFormatException e) {
                        // Handle invalid cookie value gracefully
                        return null;
                    }
                }
            }
        }
        return null;
    }

    private List<String> getAvailableSeatsForFlight(String flightNumber) {
        List<String> availableSeats = new ArrayList<>();
        String sql = "SELECT seat_number FROM seats WHERE FlightNumber = ? AND availability = 'Available'";
        
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, flightNumber);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                availableSeats.add(rs.getString("seat_number"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database access errors
        }
        
        return availableSeats;
    }

    private Connection getConnection() throws SQLException {
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        // Obtain database connection (implementation details depend on your setup)
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/katikuDB", "prog", "netsh");
    }
}

