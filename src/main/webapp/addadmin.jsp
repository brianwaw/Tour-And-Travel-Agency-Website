<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Admin</title>
    <link rel="stylesheet" href="./stylesheets/login.css">
</head>
<body>
    <div class="login-container">
        <h2>Add Admin User</h2>

        
        <form action="AddAdminUser" method="post">
            <div class="input-group">
                <label for="usernameOrEmail">Username or Email</label>
                <input type="text" id="usernameOrEmail" name="usernameOrEmail" required>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit">Add User</button>
        </form>
        
        <!-- Registration link for new users -->
        <div style="margin-top: 20px; text-align: center;">
            <p>User Doesn't have an account? <a href="registration.jsp">Register here</a></p>
        </div>
    </div>
</body>
</html>
