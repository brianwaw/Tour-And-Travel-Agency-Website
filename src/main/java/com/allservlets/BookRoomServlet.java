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

@WebServlet("/bookRoomServlet")
public class BookRoomServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/katikuDB";
    private static final String DB_USER = "prog";
    private static final String DB_PASSWORD = "netsh";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve user_id from the cookie
        int userId = getUserIdFromCookie(request);
        if (userId == -1) {
            // User not logged in, redirect to login.jsp
            response.sendRedirect("login.jsp");
            return;
        }

        // Get form parameters
        int roomId = Integer.parseInt(request.getParameter("roomid"));
        String entryDate = request.getParameter("entryDate");
        String exitDate = request.getParameter("exitDate");
        int numberOfRooms = Integer.parseInt(request.getParameter("numberOfRooms"));
        String travelers = request.getParameter("travelers");
        int price = Integer.parseInt(request.getParameter("price")); // Assuming price is in integer format
        String roomName = request.getParameter("roomName");
        
        
        // Update Rooms table to set available to 0 for the specified room_id
        updateRoomAvailability(roomId);

        // Insert into stays_rentals table
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
            String sqlInsert = "INSERT INTO stays_rentals (user_id, room_id, entry_date, exit_date, number_of_rooms, travelers, price) VALUES (?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sqlInsert)) {
                stmt.setInt(1, userId);
                stmt.setInt(2, roomId);
                stmt.setString(3, entryDate);
                stmt.setString(4, exitDate);
                stmt.setInt(5, numberOfRooms);
                stmt.setString(6, travelers);
                stmt.setInt(7, price);

                stmt.executeUpdate();
                
                // Set attributes in request object to pass to JSP
                request.setAttribute("userId", userId);
                request.setAttribute("roomId", roomId);
                request.setAttribute("entryDate", entryDate);
                request.setAttribute("exitDate", exitDate);
                request.setAttribute("numberOfRooms", numberOfRooms);
                request.setAttribute("travelers", travelers);
                request.setAttribute("price", price);
                request.setAttribute("roomName", roomName);

                // Forward the request to bookingConfirmation.jsp
                request.getRequestDispatcher("housebookingconfirmation.jsp").forward(request, response);

                // Redirect to a confirmation page
                response.sendRedirect("housebookingconfirmation.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database errors
            response.sendRedirect("error.jsp");
        }
    }

    private void updateRoomAvailability(int roomId) {
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
            String sqlUpdate = "UPDATE Rooms SET available = 0 WHERE room_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sqlUpdate)) {
                stmt.setInt(1, roomId);
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database errors
        }
    }

    private int getUserIdFromCookie(HttpServletRequest request) {
        int userId = -1;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("user_id")) {
                    userId = Integer.parseInt(cookie.getValue());
                    break;
                }
            }
        }
        return userId;
    }
}
