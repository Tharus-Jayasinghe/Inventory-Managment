<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <style>
        /* Reset styles */
        body, html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        /* Main container with two columns */
        .container {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar styling */
        .sidebar {
            width: 340px;
            background-color: #34495e;
            color: white;
            height: 100%;
            padding: 30px 20px;
            box-sizing: border-box;
            position: fixed;
        }

        .sidebar .profile img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 20px;
        }

        .sidebar .profile h3 {
            font-size: 35px;
            color: white;
            margin-top: 10px;
        }

        .sidebar .profile p {
            font-size: 30px;
            color: #bdc3c7;
        }

        .sidebar .menu {
            list-style: none;
            padding: 0;
            margin-top: 40px;
        }

        .sidebar .menu li {
            padding: 12px;
            margin: 10px 0;
            background-color: #2c3e50;
            cursor: pointer;
            transition: background-color 0.3s;
            border-radius: 5px;
             font-size: 30px;
        }

        .sidebar .menu li:hover {
            background-color: #1abc9c;
        }

        /* Main content area */
        .main-content {
            margin-left: 350px;
            padding: 20px;
            width: 100%;
            background-color: #ecf0f1;
            box-sizing: border-box;
        }

        /* Header Section */
        .header {
            background-color: #2c3e50;
            color: white;
            padding: 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header .logo {
            font-size: 40px;
            font-weight: bold;
        }

        .header .links a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-size: 30px;
        }

        .header .links a:hover {
            text-decoration: underline;
        }

        /* Dashboard Cards */
        .dashboard-cards {
            display: flex;
            flex-wrap: wrap;
            gap: 39px;
            margin-top: 20px;
        }

        .card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: calc(50% - 20px);
            padding: 190px;
            box-sizing: border-box;
            transition: transform 0.3s ease-in-out;
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card .title {
            font-size: 50px;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .card .value {
            font-size: 40px;
            color: #2c3e50;
        }

        .card .icon {
            font-size: 50px;
            color: #3498db;
            margin-bottom: 20px;
        }

        .card .icon i {
            font-size: 50px;
        }

        /* Footer */
        footer {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 30px 0;
            margin-top: 20px;
               font-size: 40px;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Profile section -->
            <div class="profile">
                <img src="https://photosbook.in/wp-content/uploads/real-girl-pic54.jpg" alt="Admin Image">
                <h3>Admin Name</h3>
                <p>admin@example.com</p>
            </div>

            <!-- Sidebar menu -->
            <ul class="menu">
                <li onclick="window.location.href='dashboard.jsp'">Dashboard</li>
                <li onclick="window.location.href='sales.jsp'">Sales</li>
                <li onclick="window.location.href='inventory.jsp'">Inventory</li>
                <li onclick="window.location.href='reports.jsp'">Reports</li>
                <li onclick="window.location.href='customer-feedback.jsp'">Customer Feedback</li>
                <li onclick="window.location.href='task-management.jsp'">Task Management</li>
                <li onclick="window.location.href='integration-tools.jsp'">Integration Tools</li>
                <li onclick="window.location.href='performance-monitoring.jsp'">Performance Monitoring</li>
            </ul>
        </div>

        <!-- Main content -->
        <div class="main-content">
            <!-- Header Section -->
            <div class="header">
                <div class="logo">POS System</div>
                <div class="links">
                    <a href="profile.jsp">Profile</a>
                    <a href="logout.jsp">Logout</a>
                </div>
            </div>

            <!-- Dashboard Cards -->
            <div class="dashboard-cards">
                
                 <div class="card">
                    <div class="icon">
                        <i class="fas fa-dollar-sign"></i>
                    </div>
                     <a href="ViewAllProduct.jsp">
                    <div class="title">View All Product Details</div>
                     </a>
                    <div class="value">Display a comprehensive list of all products in the inventory, showcasing details like name, price, stock, and category for quick access.</div>
                </div>
                <div class="card">
                    <div class="icon">
                        <i class="fas fa-box"></i>
                    </div>
                      <a href="AddNewProduct.jsp">
                    <div class="title">Add New Product</div>
                     </a>
                    <div class="value">Add new products to the inventory by entering key details such as name, price, description, and quantity for sales.</div>
                </div>
                
                <div class="card">
                    <div class="icon">
                        <i class="fas fa-dollar-sign"></i>
                    </div>
                      <a href="UpdateProduct.jsp">
                    <div class="title">Update of Product Details </div>
                     </a>
                    <div class="value">Modify existing product information, such as price, availability, or description, to reflect changes or updates in the catalog.</div>
                </div>
                
                <div class="card">
                    <div class="icon">
                        <i class="fas fa-users"></i>
                    </div>
                      <a href="DeleteProduct.jsp">
                    <div class="title">Delete the Product Details</div>
                     </a>
                    <div class="value">Remove discontinued or outdated products from the inventory system to keep the product catalog clean and relevant.</div>
                </div>
                <div class="card">
                    <div class="icon">
                        <i class="fas fa-truck"></i>
                    </div>  
                    <a href="ProductReport.jsp">
                    <div class="title">View The Product Report</div>
                     </a>
                    <div class="value">Generate detailed reports showing product performance, sales data, and inventory status to make informed decisions on restocking.</div>
                </div>
                
                
                </div>
            </div>
            
            
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 POS System | All Rights Reserved</p>
    </footer>

    <!-- FontAwesome for Icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</body>
</html>
