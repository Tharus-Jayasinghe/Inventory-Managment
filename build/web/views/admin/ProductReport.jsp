<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%--<%@ page import="controller.DatabaseConnection" %>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Record</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            color: #333;
        }

        .navbar {
            background-color: #003366;
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
            gap: 1rem;
        }

        .navbar .nav-links a {
            color: #fff;
            text-decoration: none;
            font-size: 1rem;
            padding: 0.75rem 1rem;
        }

        .navbar .nav-links a:hover {
            background-color: #00509e;
            color: #fff;
        }

        .container {
            max-width: 800px;
            margin: 2rem auto;
            padding: 1rem;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .container h2 {
            text-align: center;
            color: #003366;
            margin-bottom: 1.5rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            font-size: 1rem;
            font-weight: bold;
            color: #003366;
        }

        .form-group input {
            width: 100%;
            padding: 0.75rem;
            margin-top: 0.5rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
        }

        .form-group input:focus {
            border-color: #00509e;
            outline: none;
        }

        .form-group input[type="submit"] {
            background-color: #ff4b5c;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .form-group input[type="submit"]:hover {
            background-color: #cc3e4d;
        }

        footer {
            background-color: #003366;
            color: white;
            text-align: center;
            padding: 2rem 1rem;
            margin-top: 3rem;
        }

        .footer-links {
            text-align: center;
        }

        .footer-links a {
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }

        .footer-links a:hover {
            color: #f5a623;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h1>Admin Dashboard</h1>
        <div class="nav-links">
            <a href="adminDashboard.jsp"><i class="fas fa-home"></i> Home</a>
            <a href="../../aboutUs.jsp"><i class="fas fa-info-circle"></i> About Us</a>
            <a href="../../contact.jsp"><i class="fas fa-file-alt"></i> Content</a>
            <a href="products"><i class="fas fa-box-open"></i> Products</a>
            <a href="search"><i class="fas fa-search"></i> Search</a>
            <a href="filter"><i class="fas fa-filter"></i> Filter</a>
            <a href="../../home.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>

    <div class="form-container">
                <div class="container">
                    <h2>Delete Sales Record</h2>
             <form action="deleteRecord" method="get" onsubmit="return confirm('Are you sure you want to delete this record?');">
                    <div class="form-group">
                        <label for="recordId">Enter Product ID to Delete:</label>
                        <input type="text" id="recordId" name="recordId" required>
                    </div>

                <div class="form-group">
                <input type="submit" value="Delete Record">
                </div>
            </form>
    </div>

    <footer>
        <div class="footer-links">
            <p>&copy; 2024 Winlion Company. All Rights Reserved.</p>
            <p><a href="#">Privacy Policy</a> | <a href="#">Terms & Conditions</a></p>
        </div>
    </footer>
</body>
</html>
