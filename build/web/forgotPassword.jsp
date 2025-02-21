<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password - Pinthu Company</title>
    <style>
        /* General Page Styling */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-image: url('https://t4.ftcdn.net/jpg/06/91/05/19/360_F_691051962_GFhQPOAXABmf7l706q89b2PFh6FnB1kI.jpg'); /* Add your image URL here */
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #fff;
        }

        /* Forgot Password Container */
        .forgot-password-container {
            background-color: rgba(0, 0, 0, 0.8); /* Semi-transparent black */
            padding: 60px;
            width: 100%;
            max-width: 600px;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        /* Logo Styling */
        .logo {
            margin-bottom: 30px;
        }

        .logo img {
            max-width: 180px; /* Increased logo size */
        }

        h1 {
            font-size: 50px; /* Increased font size */
            margin-bottom: 15px;
            color: #fff;
        }

        p {
            font-size: 24px; /* Reduced font size for paragraph */
            margin-bottom: 20px;
            color: #bbb;
        }

        /* Input Fields */
        input[type="email"] {
            width: 100%;
            padding: 15px;
            margin: 20px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 18px;
            background-color: #222;
            color: #fff;
        }

        /* Button Styling */
        .button {
            display: block;
            width: 100%;
            padding: 15px;
            font-size: 18px;
            font-weight: bold;
            color: #fff;
            background-color: #0077b6;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }

        .button:hover {
            background-color: #333;
            color: #fff;
        }

        /* Links */
        .link {
            display: block;
            margin-top: 30px;
            font-size: 16px;
            color: #fff;
            text-decoration: none;
        }

        .link:hover {
            text-decoration: underline;
        }

        /* Navbar Styling */
        nav {
            background-color: #0077b6;
            padding: 20px 40px;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        nav .company-name {
            font-size: 60px;
            color: #fff;
            font-weight: bold;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            padding: 10px;
            font-size: 40px;
            margin-left: 20px;
            font-weight: bold;
            transition: background-color 0.3s, color 0.3s;
        }

        nav a:hover {
            background-color: #fff;
            color: #000;
            border-radius: 5px;
        }

        nav ul li a {
            text-decoration: none;
            color: white;
            font-weight: bold;
            transition: color 0.3s;
            font-size: 40px;
        }

        /* Footer Styling */
        footer {
            background-color: #000;
            color: #fff;
            text-align: center;
            padding: 20px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>

    <nav>
        <div class="company-name">Pinthu Company</div>
        <div>
            <a href="home.jsp">Home</a>
            <a href="aboutUs.jsp">About</a>
            <a href="contact.jsp">Contact</a>
        </div>
    </nav>

    <div class="forgot-password-container">
        <!-- Logo -->
        <div class="logo">
            <img src="https://img.freepik.com/premium-vector/yellow-png-logo-with-black-background_853558-2519.jpg" alt="Pinthu Company Logo">
        </div>

        <!-- Title -->
        <h1>Forgot Your Password?</h1>
        <p>Enter your email address below to reset your password.</p>

        <!-- Forgot Password Form -->
        <form action="ForgotPasswordServlet.java" method="POST">
            <input type="email" name="email" placeholder="Email Address" required>
            <button type="submit" class="button">Reset Password</button>
        </form>

        <!-- Login Link -->
        <a href="login.jsp" class="link">Remembered your password? Login here</a>
    </div>

    <footer>
        <p>&copy; 2024 Pinthu Company. All Rights Reserved.</p>
    </footer>
</body>
</html>
