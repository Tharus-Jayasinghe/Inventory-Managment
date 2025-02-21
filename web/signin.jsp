<!DOCTYPE html>
<html>
<head>
    <title>Sign In</title>
    <style>
        body {
            background: linear-gradient(to bottom right, #74ebd5, #ACB6E5);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            text-align: center;
            color: #333;
            margin: 0;
        }
        .navbar {
            background-color: #003366; /* Dark navy */
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0.5rem 1rem;
        }

        .navbar h1 {
            margin: 0;
            padding: 0.5rem;
            color: #fff;
            font-size: 1.5rem;
        }

        .navbar .nav-links {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .navbar .nav-links a {
            color: #fff;
            text-decoration: none;
            font-size: 1rem;
            padding: 0.5rem 1rem;
            display: flex;
            align-items: center;
        }

        .navbar .nav-links a i {
            font-size: 1.2rem;
            margin-right: 0.5rem;
        }

        .navbar .nav-links a:hover {
            background-color: #00509e; /* Slightly brighter blue */
            color: #fff;
        }

        .container {
            max-width: 400px;
            margin: 60px auto 0;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #4CAF50;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        }

        .error {
            color: red;
            font-size: 14px;
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: bold;
            margin: 10px 0 5px;
            color: #555;
        }

        input[type="text"], input[type="password"] {
            width: 80%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .button-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.2s;
            color: white;
        }

        button:hover {
            transform: scale(1.05);
        }

        .sign-in-button {
            background-color: #4CAF50;
        }

        .sign-in-button:hover {
            background-color: #45a049;
        }

        .signup-button {
            background-color: #2196F3;
        }

        .signup-button:hover {
            background-color: #1976D2;
        }
    </style>
    <!-- Font Awesome for icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="navbar">
        <h1></h1>
        <div class="nav-links">
            <a href="home.jsp" class="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>

    

    <div class="container">
        <h1>Sign In</h1>
        <% 
            String message = (String) request.getAttribute("message");
            if (message != null) { 
        %>
            <div class="error"><%= message %></div>
        <% 
            } 
        %>
        <!-- Sign In Form -->
        <form action="SignInController" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" placeholder="Enter your username" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>
            <br>
            <a href="forgotPassword.jsp" class="link">Forgot Password?</a>
            <div class="button-row">
                <button type="button" class="signup-button" onclick="location.href='signup.jsp'">Sign Up</button>
                <button type="submit" class="sign-in-button">Sign In</button>
                
            </div>
        </form>
    </div>
        <p style="color: red;">
        <% 
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
                out.println(errorMessage);
            }
        %>
    </p>
</body>
</html>
