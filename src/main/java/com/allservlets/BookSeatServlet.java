package com.allservlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BookSeatServlet")
public class BookSeatServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        int userId = Integer.parseInt(request.getParameter("userId"));
        String flightNumber = request.getParameter("flightNumber");
        String departureCity = request.getParameter("departureCity");
        String departureCountry = request.getParameter("departureCountry");
        String departureTime = request.getParameter("departureTime");
        String arrivalCity = request.getParameter("arrivalCity");
        String arrivalCountry = request.getParameter("arrivalCountry");
        String arrivalTime = request.getParameter("arrivalTime");
        String flightClass = request.getParameter("flightClass");
        double price = Double.parseDouble(request.getParameter("price"));
        String selectedSeat = request.getParameter("seat");

        // Set attributes in request object
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
        request.setAttribute("selectedSeat", selectedSeat);

        // JDBC connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/katikuDB";
        String dbUsername = "prog";
        String dbPassword = "netsh";

        Connection conn = null;
        PreparedStatement insertStatement = null;
        PreparedStatement updateStatement = null;

        try {
            // Establish database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

            // SQL query to insert booking details into bookedflights table
            String insertSql = "INSERT INTO flightsbooked (user_id, FlightNumber, departure_city, departure_country, "
                    + "departure_time, arrival_city, arrival_country, arrival_time, flight_class, price, seat_number) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            // Create prepared statement for insertion
            insertStatement = conn.prepareStatement(insertSql);
            insertStatement.setInt(1, userId);
            insertStatement.setString(2, flightNumber);
            insertStatement.setString(3, departureCity);
            insertStatement.setString(4, departureCountry);
            insertStatement.setString(5, departureTime);
            insertStatement.setString(6, arrivalCity);
            insertStatement.setString(7, arrivalCountry);
            insertStatement.setString(8, arrivalTime);
            insertStatement.setString(9, flightClass);
            insertStatement.setDouble(10, price);
            insertStatement.setString(11, selectedSeat);

            // Execute the insertion query
            insertStatement.executeUpdate();

            // SQL query to update seat availability to "Booked"
            String updateSql = "UPDATE seats SET availability = 'Booked' WHERE FlightNumber = ? AND seat_number = ?";

            // Create prepared statement for update
            updateStatement = conn.prepareStatement(updateSql);
            updateStatement.setString(1, flightNumber);
            updateStatement.setString(2, selectedSeat);

            // Execute the update query
            updateStatement.executeUpdate();

            // Redirect to a JSP to display the booked flight details
            request.getRequestDispatcher("FlightBookingConfirmation.jsp").forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle exceptions
            response.getWriter().append("Error occurred while booking the seat: " + e.getMessage());

        } finally {
            // Close resources in finally block to ensure they are always closed
            try {
                if (insertStatement != null) {
                    insertStatement.close();
                }
                if (updateStatement != null) {
                    updateStatement.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
