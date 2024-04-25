package com.allservlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/katikuDB";
    private static final String DB_USER = "prog";
    private static final String DB_PASSWORD = "netsh";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usernameOrEmail = request.getParameter("usernameOrEmail");
        String password = request.getParameter("password");
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {

            // Check if user exists in the users table
            String queryUser = "SELECT user_id FROM users WHERE (username = ? OR email = ?) AND password = ?";
            try (PreparedStatement stmtUser = conn.prepareStatement(queryUser)) {
                stmtUser.setString(1, usernameOrEmail);
                stmtUser.setString(2, usernameOrEmail);
                stmtUser.setString(3, password);

                ResultSet rsUser = stmtUser.executeQuery();

                if (rsUser.next()) {
                    String userId = rsUser.getString("user_id");

                    // Check if the user is also an admin
                    String queryAdmin = "SELECT user_id FROM admins WHERE user_id = ?";
                    try (PreparedStatement stmtAdmin = conn.prepareStatement(queryAdmin)) {
                        stmtAdmin.setString(1, userId);

                        ResultSet rsAdmin = stmtAdmin.executeQuery();

                        if (rsAdmin.next()) {
                            // User is an admin, redirect to admin panel
                            HttpSession session = request.getSession();
                            session.setAttribute("user_id", userId);
                            
                            // Set a cookie to remember the user's login
                            Cookie loginCookie = new Cookie("user_id", userId);
                            loginCookie.setMaxAge(24 * 60 * 60); // Cookie expires in 1 day (24 hours * 60 minutes * 
                            response.addCookie(loginCookie);
                            
                            response.sendRedirect("adminpanel.jsp");
                        } else {
                            // User is not an admin, redirect to flights page
                            HttpSession session = request.getSession();
                            session.setAttribute("user_id", userId);
                            
                            // Set a cookie to remember the user's login
                            Cookie loginCookie = new Cookie("user_id", userId);
                            loginCookie.setMaxAge(24 * 60 * 60); // Cookie expires in 1 day (24 hours * 60 minutes * 
                            response.addCookie(loginCookie);
                            
                            response.sendRedirect("flights.jsp");
                            
                            
                        }
                    }
                } else {
                    // Authentication failed, redirect back to login page with error message
                    response.sendRedirect("login.jsp?error=true");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.html"); // Redirect to error page on database error
        }
    }
}
