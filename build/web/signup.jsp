<%-- 
    Document   : signup
    Created on : Nov 12, 2024, 9:40:59 AM
    Author     : Kasun Jayasinghe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to bottom right, #74ebd5, #ACB6E5);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }

        .back-button {
            display: flex;
            align-items: center;
            font-size: 1rem;
            text-decoration: none;
            color: #003366;
            padding: 10px 15px;
            border: 1px solid #003366;
            border-radius: 5px;
            background-color: #f0f8ff;
            transition: background-color 0.3s, color 0.3s;
            position: absolute;
            top: 20px;
            left: 20px;
        }

        .back-button i {
            margin-right: 5px;
            font-size: 1.2rem;
        }

        .back-button:hover {
            background-color: #003366;
            color: #fff;
        }

        .container {
            width: 100%;
            max-width: 400px;
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        h1 {
            font-size: 28px;
            color: #4CAF50;
            margin-bottom: 20px;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
            align-items: center;
        }

        label {
            font-weight: bold;
            color: #555;
            width: 40%;
            text-align: right;
            margin-right: 10px;
        }

        input {
            width: 60%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .button-row {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            color: #fff;
            transition: transform 0.3s, background-color 0.3s;
        }

        button:hover {
            transform: scale(1.05);
        }

        .signup-button {
            background-color: #4CAF50;
        }

        .signup-button:hover {
            background-color: #45a049;
        }

        .clear-button {
            background-color: #f44336;
        }

        .clear-button:hover {
            background-color: #d32f2f;
        }

        h3 {
            color: #d32f2f;
            font-size: 16px;
        }
    </style>
    <script>
        function clearForm() {
            document.getElementById('signupForm').reset();
        }
    </script>
</head>
<body>
    <a href="signin.jsp" class="back-button">
        <i class="fas fa-arrow-left"></i> Back
    </a>

    <div class="container">
        <% 
            String message = (String) request.getAttribute("message");
            if (message != null) { 
                if (message.equalsIgnoreCase("success")) { 
        %>
                    <h3>Sign up successful!</h3>
        <% 
                } else { 
        %>
                    <h3><%= message %></h3>
        <% 
                }
            } 
        %>

        <h1>Create Your Account</h1>
        <form id="signupForm" action="SingUpController" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" 
                       required minlength="5" maxlength="20" 
                       pattern="^[a-zA-Z0-9_]{5,20}$" 
                       title="Username must be 5-20 characters long and can only contain letters, numbers, and underscores.">
            </div>
            <br>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required maxlength="50">
            </div>
            <br>
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="tel" id="phone" name="phone" 
                       pattern="^\+?\d{10,15}$" 
                       title="Phone number must be 10-15 digits and can include an optional '+' at the beginning.">
            </div>
            <br>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" 
                       required minlength="8" 
                       pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$" 
                       title="Password must be at least 8 characters long and contain at least one letter and one number.">
            </div>
            <br>
            <div class="form-group">
                <label for="confirm_Password">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirm_Password" required minlength="8">
            </div>
            <div class="form-group">
                <label for="role">Role</label>
                <select id="role" name="role" class="form-control" required>
                    <option value="" disabled selected>Select Role</option>
                    <option value="user">User</option>
                    <option value="admin">Admin</option>
                </select>
            </div>

            <div class="button-row">
                <button type="button" class="clear-button" onclick="clearForm()">Clear</button>
                <button type="submit" class="signup-button">Sign Up</button>
            </div>
        </form>
    </div>
</body>
</html>
