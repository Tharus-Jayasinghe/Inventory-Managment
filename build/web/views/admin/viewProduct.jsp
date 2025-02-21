<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Products</title>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
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
        .navbar .logout {
            float: right;
        }
        .container {
            max-width: 1200px;
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
        h1 {
            text-align: center;
            color: #2c3e50;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            text-align: left;
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #2c3e50;
            color: white;
        }
        td {
            background-color: #f9f9f9;
        }
        .action-button {
            background-color: #008000;
            color: white;
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
            margin-right: 10px;
        }
        .action-button:hover {
            background-color: #2980b9;
        }
        .delete-button {
            background-color: #e74c3c; /* Red color */
        }
        .delete-button:hover {
            background-color: #c0392b; /* Darker red */
        }
        .no-data {
            text-align: center;
            font-size: 18px;
            color: #888;
            margin-top: 20px;
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
        .footer-links a {
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }
        .footer-links a:hover {
            color: #f5a623;
        }
        .social-media a {
            color: white;
            font-size: 1.5rem;
            transition: color 0.3s;
        }
        .social-media a:hover {
            color: #f5a623;
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
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h1>Admin Dashboard</h1>
        <div class="nav-links">
            <a href="adminDashboard.jsp">Home</a>
            <a href="../../aboutUs.jsp">About Us</a>
            <a href="../../contact.jsp">Content</a>
            <a href="products">Products</a>
            <a href="search">Search</a>
            <a href="filter">Filter</a>
            <a href="../../home.jsp" class="logout">Logout</a>
        </div>
    </div>
    <div class="container">
        <h1>Product List</h1>

        <%
            String dbURL = "jdbc:mysql://localhost:3306/inventory_management";
            String dbUser = "root";
            String dbPassword = "";

            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                String query = "SELECT id, name, category, price, stock FROM products";
                ps = conn.prepareStatement(query);
                rs = ps.executeQuery();

                if (rs.next()) {
        %>
        <table>
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Stock</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    do {
                        String productId = rs.getString("id");
                        String productName = rs.getString("name");
                        String category = rs.getString("category");
                        double price = rs.getDouble("price");
                        int stock = rs.getInt("stock");
                %>
                <tr>
                    <td><%= productId %></td>
                    <td><%= productName %></td>
                    <td><%= category %></td>
                    <td>$<%= price %></td>
                    <td><%= stock %></td>
                    <td>
                        <!-- Edit Icon -->
                        <a class="action-button" href="editProduct.jsp?productId=<%= productId %>">
                            <i class="fas fa-edit"></i> Edit
                        </a>
                        <!-- Delete Icon (Red Button) -->
                        <a class="action-button delete-button" href="DeleteProduct.jsp?productId=<%= productId %>">
                            <i class="fas fa-trash-alt"></i> Delete
                        </a>
                    </td>
                </tr>
                <% 
                    } while (rs.next());
                %>
            </tbody>
        </table>
        <% 
                } else {
        %>
        <div class="no-data">No products found in the database.</div>
        <% 
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                out.println("<div class='no-data'>Error: Database driver not found.</div>");
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<div class='no-data'>Error: Unable to fetch product data.</div>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (conn != null) conn.close();
                } catch (SQLException ignore) {}
            }
        %>
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
