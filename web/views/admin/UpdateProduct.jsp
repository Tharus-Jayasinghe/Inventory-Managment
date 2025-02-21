<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Record</title>
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 1rem 0;
        }

        table th, table td {
            padding: 0.75rem;
            text-align: left;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #003366;
            color: #fff;
        }

        table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        table tr:hover {
            background-color: #eaf4ff;
        }

        .form-group {
            margin-bottom: 0.5rem;
        }

        .form-group label {
            font-weight: bold;
            margin-bottom: 0.25rem;
        }

        .form-group input,
        .form-group textarea {
            width: 99%;
            padding: 0.25rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
        }

        .form-group textarea {
            height: 150px;
            resize: none;
        }

        .form-group button {
            background-color: #1abc9c;
            color: white;
            padding: 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            margin-right: 20px;
            display: inline-block;
        }

        .form-group button:hover {
            background-color: #16a085;
        }

        .form-group button.cancel-btn {
            background-color: #e74c3c; /* Red color */
            color: white;
        }

        .form-group button.cancel-btn:hover {
            background-color: #c0392b; /* Darker red for hover effect */
        }

        footer {
            background-color: #003366;
            color: white;
            text-align: center;
            padding: 3rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 4rem;
        }

        .footer-left, .footer-center, .footer-right {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 1rem;
        }

        .footer-links {
            text-align: left;
        }

        .footer-links a {
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }

        .footer-links a:hover {
            color: #f5a623;
        }

        .social-media {
            display: flex;
            gap: 1rem;
            justify-content: center;
        }

        .social-media a {
            color: white;
            font-size: 1.5rem;
            transition: color 0.3s;
        }

        .social-media a:hover {
            color: #f5a623;
        }

        .newsletter {
            text-align: center;
        }

        .newsletter input {
            padding: 0.5rem;
            font-size: 1rem;
            border: none;
            border-radius: 30px;
            width: 70%;
            margin-right: 10px;
        }

        .newsletter button {
            padding: 0.5rem 2rem;
            font-size: 1rem;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .newsletter button:hover {
            background-color: #0056b3;
        }

        @media (max-width: 768px) {
            footer {
                flex-direction: column;
                text-align: center;
            }

            .footer-left, .footer-center, .footer-right {
                align-items: center;
                margin-bottom: 1rem;
            }

            .footer-links {
                text-align: center;
            }

            .social-media {
                justify-content: center;
                margin-bottom: 1rem;
            }

            .newsletter {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 0.5rem;
                margin-top: 1rem;
            }
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

    <div class="container">
        <div class="table-container">

<!--            <div class="report-container">-->
                <h2>Update Product</h2>
                <form action="../../udateProductController" method="POST">
<!--                <button class="generate-report-button" onclick="window.print();">Generate PDF</button>-->
                
                <table class="product-table">
                    <thead>
                        <tr>
                            <th>Product ID</th>
                            <th>Name</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Stock</th>
                            <th>Description</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            // Fetch product data from database
                            try {
                                // Connect to the database
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory_management", "root", "");
                                
                                // Query to get all products
                                String sql = "SELECT * FROM products";
                                PreparedStatement pstmt = conn.prepareStatement(sql);
                                ResultSet rs = pstmt.executeQuery();
                                
                                while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getString("id") %></td>
                            <td><%= rs.getString("name") %></td>
                            <td><%= rs.getString("category") %></td>
                            <td><%= rs.getDouble("price") %></td>
                            <td><%= rs.getInt("stock") > 0 ? "In Stock" : "Out of Stock" %></td>
                            <td><%= rs.getInt("description") %></td>
                            
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
                </form>
            </div>
        </div>
    </div>
    

    <footer>
        <div class="footer-left">
            <div class="footer-links">
                <p>&copy; 2024 Winlion Company. All Rights Reserved.</p>
                <p><a href="#">Privacy Policy</a> | <a href="#">Terms & Conditions</a></p>
            </div>
        </div>
        <div class="footer-center">
            <div class="social-media">
                <a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a>
                <a href="#" target="_blank"><i class="fab fa-twitter"></i></a>
                <a href="#" target="_blank"><i class="fab fa-linkedin-in"></i></a>
                <a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
            </div>
        </div>
        <div class="footer-right">
            <div class="newsletter">
                <p>Subscribe to our Newsletter</p>
                <form action="#">
                    <input type="email" placeholder="Enter your email" required>
                    <button type="submit">Subscribe</button>
                </form>
            </div>
        </div>
    </footer>
</body>
</html>
