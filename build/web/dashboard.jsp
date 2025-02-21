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
    <title>POS Billing & Inventory Management</title>
    <style>
        /* Global Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            background-color: #f7f7f7;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 280px;
            background-color: #2c3e50;
            color: white;
            height: 100vh;
            padding-top: 40px;
            position: fixed;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .sidebar .profile {
            text-align: center;
            margin-bottom: 30px;
        }

        .sidebar .profile img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
        }

        .sidebar .profile h3 {
            margin: 15px 0;
            font-size: 25px;
        }

        .sidebar .profile p {
            font-size: 18px;
        }

        .sidebar .menu {
            list-style: none;
            padding: 0;
            width: 100%;
        }

        .sidebar .menu li {
            padding: 15px 20px;
            background-color: #34495e;
            color: white;
            cursor: pointer;
            text-align: left;
            border-radius: 8px;
            margin-bottom: 10px;
            font-size: 18px;
            transition: all 0.3s ease;
        }

        .sidebar .menu li:hover {
            background-color: skyblue;
            color: white;
            transform: scale(1.05);
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        }

        .sidebar .menu li:active {
            background-color: #2980b9;
            transform: scale(1.03);
        }

        /* Main Content Area */
        .main-content {
            margin-left: 280px;
            padding: 20px;
            width: calc(100% - 280px);
            height: 100vh;
            background-color: #ecf0f1;
        }

        /* Navbar */
        .navbar {
            background-color: #2c3e50;
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar .logo {
            font-size: 24px;
            font-weight: bold;
        }

        .navbar .links a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
            font-size: 16px;
        }

        .navbar .links a:hover {
            text-decoration: underline;
        }

        /* Table Styles */
        .table-container {
            margin-top: 30px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #2c3e50;
            color: white;
        }

        /* Footer */
        footer {
            background-color: #2c3e50;
            color: white;
            padding: 15px;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="profile">
            <img src="https://photosbook.in/wp-content/uploads/real-girl-pic54.jpg" alt="Admin Image">
            <h3>Admin Name</h3>
            <p>admin@example.com</p>
        </div>
        <ul class="menu">
            <li onclick="window.location.href='dashboard.jsp'">Dashboard</li>
            <li onclick="window.location.href='views/admin/productManagement.jsp';">Go to Product Manager</li>
            <li onclick="window.location.href='inventory.jsp'">Inventory</li>
            <li onclick="window.location.href='reports.jsp'">Reports</li>
            <li onclick="window.location.href='customer-feedback.jsp'">Customer Feedback</li>
            <li onclick="window.location.href='task-management.jsp'">Task Management</li>
            <li onclick="window.location.href='integration-tools.jsp'">Integration Tools</li>
            <li onclick="window.location.href='performance-monitoring.jsp'">Performance Monitoring</li>
        </ul>
    </div>
we
    <!-- Main Content -->
    <div class="main-content">
        <!-- Navbar -->
        <div class="navbar">
            <div class="logo">POS System</div>
            <div class="links">
                <a href="profile.jsp">Profile</a>
                <a href="logout.jsp">Logout</a>
            </div>
        </div>

        <!-- Dashboard Overview -->
        <h1>Welcome to your Dashboard</h1>

        <!-- Sales Table -->
        <div class="table-container">
            <h3>Recent Sales</h3>
            <table>
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer</th>
                        <th>Total</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- Example dynamic rows fetched from the database --%>
                    <% 
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pos", "root", "password");
                            PreparedStatement ps = conn.prepareStatement("SELECT order_id, customer_name, total, order_date FROM sales ORDER BY order_date DESC LIMIT 10");
                            ResultSet rs = ps.executeQuery();
                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("order_id") %></td>
                        <td><%= rs.getString("customer_name") %></td>
                        <td><%= rs.getDouble("total") %></td>
                        <td><%= rs.getDate("order_date") %></td>
                    </tr>
                    <%
                            }
                            conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 POS System | All Rights Reserved</p>
    </footer>
</body>
</html>
