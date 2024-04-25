package com.allservlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.business.Stays;

@WebServlet("/available")
public class AvailableRoomsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String location = request.getParameter("location");
        String entryDate = request.getParameter("entry_date");
        String exitDate = request.getParameter("exit_date");
        String travelers = request.getParameter("travellers");
        String rooms = request.getParameter("rooms");
        
        Stays stays = new Stays(location, entryDate, exitDate, travelers, rooms);
        // JDBC URL, username, and password of MySQL server
        String url = "jdbc:mysql://localhost:3306/katikuDB";
        String user = "prog";
        String password = "netsh";
        
      
        
        // SQL query to retrieve available rooms
        String query = "SELECT room_id, room_name, number_of_rooms,price, description,image1, image2, image3 FROM Rooms "
                + "WHERE available = 1 AND location_name = ?;";

        try {
            // Load and register JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Open a connection
            Connection conn = DriverManager.getConnection(url, user, password);
            // Create a prepared statement
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, stays.getLocation());
            // Execute the query
            ResultSet rs = pstmt.executeQuery();
            //set requested parameters to the request
            request.setAttribute("location", location);
            request.setAttribute("entryDate", entryDate);
            request.setAttribute("exitDate", exitDate);
            request.setAttribute("travelers", travelers);
            request.setAttribute("rooms", rooms);

            // Forward the result to the JSP page
            request.setAttribute("availableRooms", rs);
            request.getRequestDispatcher("/stays_results.jsp").forward(request, response);

            // Clean-up environment
            rs.close();
            pstmt.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
