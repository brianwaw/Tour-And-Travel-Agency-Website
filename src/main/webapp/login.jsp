<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="./stylesheets/login.css">
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>

        <!-- Check for registration success -->
        <% String registrationSuccess = request.getParameter("registration");
           if (registrationSuccess != null && registrationSuccess.equals("success")) { %>
            <p style="color: green;">Registration successful! Please login with your credentials.</p>
        <% } %>

        <!-- Check for existing email error -->
        <% String emailError = request.getParameter("error");
           if (emailError != null && emailError.equals("email")) { %>
            <p style="color: red;">An account with this email already exists. Please login instead.</p>
        <% } %>

        <!-- Login form -->
        <form action="login" method="post">
            <div class="input-group">
                <label for="usernameOrEmail">Username or Email</label>
                <input type="text" id="usernameOrEmail" name="usernameOrEmail" required>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit">Login</button>
        </form>
        
        <!-- Registration link for new users -->
        <div style="margin-top: 20px; text-align: center;">
            <p>Don't have an account? <a href="registration.jsp">Register here</a></p>
        </div>
    </div>
</body>
</html>
