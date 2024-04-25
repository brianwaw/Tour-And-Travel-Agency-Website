package com.allservlets;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.business.AllRoomsBookedBean;

@WebServlet("/AllBookedRoomsServlet")
public class AllBookedRoomsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<AllRoomsBookedBean> bookings = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/katikuDB";
            String username = "prog";
            String password = "netsh";
            Connection conn = DriverManager.getConnection(url, username, password);

            String query = "SELECT user_id, room_id, entry_date, exit_date, number_of_rooms, booking_date FROM stays_rentals;";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
            	AllRoomsBookedBean booking = new AllRoomsBookedBean();
                booking.setUserId(rs.getString("user_id"));
                booking.setRoomId(rs.getString("room_id"));
                booking.setEntryDate(rs.getString("entry_date"));
                booking.setExitDate(rs.getString("exit_date"));
                booking.setNumberOfRooms(rs.getString("number_of_rooms"));
                booking.setBookingDate(rs.getString("booking_date")); 
                bookings.add(booking);
            }

            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle exceptions
        }

        // Set bookings as an attribute in request scope
        request.setAttribute("roomBookings", bookings);

        // Forward to JSP to display data
        request.getRequestDispatcher("/allbookedrooms.jsp").forward(request, response);
    }
}

