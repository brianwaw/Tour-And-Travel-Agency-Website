package com.allservlets;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.business.Car;

@WebServlet("/availablecars")
public class AvailableCarsServlet extends HttpServlet {

    // JDBC URL, username, and password of MySQL server
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/katikuDB";
    private static final String JDBC_USER = "prog";
    private static final String JDBC_PASSWORD = "netsh";

    // SQL query to retrieve cars based on pickup location
    private static final String SQL_QUERY = "SELECT c.car_id, c.car_make, c.car_model, c.car_gearbox, "
            + "c.car_year, c.car_color, c.car_type, c.car_price_per_day, c.car_image, rc.company_logo, c.car_seaters, rc.street_name "
            + "FROM Cars c "
            + "JOIN RentalCompany rc ON c.company_id = rc.company_id "
            + "WHERE rc.company_location = ? "
            + "AND c.car_availability = 1;"; // Adding the condition for car_availability



    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get pickup location from request parameter
    
        String pickupLocation = request.getParameter("pickupLocation");
        String pickupDate = request.getParameter("pickupDate");
        String dropoffDate = request.getParameter("dropoffDate");
        
        
        request.setAttribute("pickupLocation", pickupLocation);
        request.setAttribute("pickupDate", pickupDate);
        request.setAttribute("dropoffDate", dropoffDate);

        // List to store cars retrieved from the database
        List<Car> cars = new ArrayList<>();
        
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        // JDBC variables
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Connect to the database
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // Prepare the SQL statement
            stmt = conn.prepareStatement(SQL_QUERY);
            stmt.setString(1, pickupLocation);

            // Execute the query
            rs = stmt.executeQuery();


            // Set cars list as request attribute
            request.setAttribute("cars", rs);

            // Forward the request to cars.jsp for display
            request.getRequestDispatcher("carresults.jsp").forward(request, response);
        } catch (SQLException ex) {
            ex.printStackTrace();
            // Handle any errors
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        } finally {
            // Close JDBC objects
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
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
