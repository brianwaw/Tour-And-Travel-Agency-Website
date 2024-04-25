<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <link rel="stylesheet" href="./stylesheets/registration.css">
    <style>
        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }
        .input-error {
            border: 2px solid red;
        }
    </style>
    <script>
    function validateForm() {
        var usernameInput = document.getElementById("username");
        var emailInput = document.getElementById("email");
        var passwordInput = document.getElementById("password");
        var confirmPasswordInput = document.getElementById("confirmpassword");
        var usernameError = document.getElementById("usernameError");
        var emailError = document.getElementById("emailError");
        var passwordError = document.getElementById("passwordError");

        // Remove previous error styles and messages
        usernameInput.classList.remove("input-error");
        emailInput.classList.remove("input-error");
        passwordInput.classList.remove("input-error");
        confirmPasswordInput.classList.remove("input-error");
        usernameError.textContent = "";
        emailError.textContent = "";
        passwordError.textContent = "";

        var isValid = true;
        
        // Check if username error message is present
        var urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has("usernameError")) {
            var usernameErrorMessage = decodeURIComponent(urlParams.get("usernameError"));
            usernameInput.classList.add("input-error");
            usernameError.textContent = usernameErrorMessage;
            isValid = false;
        }

        // Check if passwords match and meet requirements
        if (passwordInput.value !== confirmPasswordInput.value) {
            confirmPasswordInput.classList.add("input-error");
            passwordError.textContent = "Passwords do not match!";
            isValid = false;
        } else if (passwordInput.value.length < 8) {
            passwordInput.classList.add("input-error");
            passwordError.textContent = "Password must be at least 8 characters long.";
            isValid = false;
        }

        // Check if username is empty
        if (usernameInput.value.trim() === "") {
            usernameInput.classList.add("input-error");
            usernameError.textContent = "Username is required.";
            isValid = false;
        }

        // Check if email is empty or in valid format
        if (emailInput.value.trim() === "") {
            emailInput.classList.add("input-error");
            emailError.textContent = "Email is required.";
            isValid = false;
        } else {
            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(emailInput.value)) {
                emailInput.classList.add("input-error");
                emailError.textContent = "Invalid email format.";
                isValid = false;
            }
        }

        return isValid;
    }
</script>

</head>
<body>
    <div class="registration-container">
        <h2>User Registration</h2>
        <form id="registrationForm" onsubmit="return validateForm()" action="register" method="post">
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
                <div id="usernameError" class="error-message"></div>
            </div>
            <div class="input-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
                <div id="emailError" class="error-message"></div>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="input-group">
                <label for="confirmpassword">Confirm Password</label>
                <input type="password" id="confirmpassword" name="confirmpassword" required>
                <div id="passwordError" class="error-message"></div>
            </div>
            <button type="submit">Register</button>
        </form>
        <!-- Registration link for new users -->
        <div style="margin-top: 20px; text-align: center;">
            <p>Already have an account? <a href="login.jsp">Sign in here</a></p>
        </div>

    </div>
</body>
</html>
