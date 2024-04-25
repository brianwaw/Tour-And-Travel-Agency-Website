package com.allservlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/AddAdminUser")
public class AddAdminUser extends HttpServlet {

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
            response.sendRedirect("error.html"); // Redirect to error page on driver load error
            return;
        }

        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {

            // Query to find user_id based on username/email and password
            String query = "SELECT user_id FROM users WHERE (username = ? OR email = ?) AND password = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, usernameOrEmail);
                stmt.setString(2, usernameOrEmail);
                stmt.setString(3, password);

                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    // User found, retrieve user_id
                    String userId = rs.getString("user_id");

                    // Insert user_id into admins table
                    String insertQuery = "INSERT INTO admins (user_id) VALUES (?)";
                    try (PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) {
                        insertStmt.setString(1, userId);
                        insertStmt.executeUpdate();

                        // Redirect to success page (admin panel)
                        response.sendRedirect("adminpanel.jsp");
                    }
                } else {
                    // User not found, redirect to registration page
                    response.sendRedirect("registration.jsp");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.html"); // Redirect to error page on database error
        }
    }
}
