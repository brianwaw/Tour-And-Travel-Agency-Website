package com.allservlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/BookedRoomsServlet")
public class BookedRoomsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/katikuDB";
    private static final String DB_USER = "prog";
    private static final String DB_PASSWORD = "netsh";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve user_id from the cookie
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
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {

                    String query = "SELECT s.room_id, r.room_name, r.image1, s.entry_date, s.exit_date, s.number_of_rooms, s.booking_date " +
                                   "FROM stays_rentals s " +
                                   "INNER JOIN Rooms r ON s.room_id = r.room_id " +
                                   "WHERE s.user_id = ?";
                    try (PreparedStatement stmt = conn.prepareStatement(query)) {
                        stmt.setString(1, userId);

                        ResultSet rs = stmt.executeQuery();
                        List<BookingInfo> bookings = new ArrayList<>();

                        while (rs.next()) {
                            int roomId = rs.getInt("room_id");
                            String roomName = rs.getString("room_name");
                            String image1 = rs.getString("image1");
                            String entryDate = rs.getString("entry_date");
                            String exitDate = rs.getString("exit_date");
                            int numberOfRooms = rs.getInt("number_of_rooms");
                            String bookingDate = rs.getString("booking_date");

                            BookingInfo booking = new BookingInfo(roomId, roomName, image1, entryDate, exitDate, numberOfRooms, bookingDate);
                            bookings.add(booking);
                        }

                        // Set the booking list as a request attribute
                        request.setAttribute("bookings", bookings);
                    }
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                response.sendRedirect("error.html"); // Redirect to error page on database error
            }
        }

        // Forward to the JSP for rendering
        request.getRequestDispatcher("bookedRooms.jsp").forward(request, response);
    }

    public static class BookingInfo {
        private int roomId;
        private String roomName;
        private String image1;
        private String entryDate;
        private String exitDate;
        private int numberOfRooms;
        private String bookingDate;

        public BookingInfo(int roomId, String roomName, String image1, String entryDate, String exitDate, int numberOfRooms, String bookingDate) {
            this.roomId = roomId;
            this.roomName = roomName;
            this.image1 = image1;
            this.entryDate = entryDate;
            this.exitDate = exitDate;
            this.numberOfRooms = numberOfRooms;
            this.bookingDate = bookingDate;
        }

        // Getters for properties
        public int getRoomId() {
            return roomId;
        }

        public String getRoomName() {
            return roomName;
        }

        public String getImage1() {
            return image1;
        }

        public String getEntryDate() {
            return entryDate;
        }

        public String getExitDate() {
            return exitDate;
        }

        public int getNumberOfRooms() {
            return numberOfRooms;
        }

        public String getBookingDate() {
            return bookingDate;
        }
    }
}
