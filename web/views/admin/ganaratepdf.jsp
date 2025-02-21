<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Products</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            margin: 2rem auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            text-align: left;
            padding: 12px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        td {
            background-color: #f9f9f9;
        }
        .action-button {
            background-color: #28a745;
            color: white;
            padding: 8px 12px;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .action-button:hover {
            background-color: #218838;
        }
        .no-data {
            text-align: center;
            color: #666;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Product List</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Category</th>
            <th>Price</th>
            <th>Stock</th>
            <th>Action</th>
        </tr>
        <%
            String dbURL = "jdbc:mysql://localhost:3306/inventory_management";
            String user = "root";
            String password = "";

            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(dbURL, user, password);

                String query = "SELECT * FROM products";
                ps = conn.prepareStatement(query);
                rs = ps.executeQuery();

                if (rs.next()) {
                    do {
                        int productId = rs.getInt("id");
                        String productName = rs.getString("name");
                        String productCategory = rs.getString("category");
                        double productPrice = rs.getDouble("price");
                        int productStock = rs.getInt("stock");
        %>
        <tr>
            <td><%= productId %></td>
            <td><%= productName %></td>
            <td><%= productCategory %></td>
            <td>$<%= productPrice %></td>
            <td><%= productStock %></td>
            <td>
                <form action="../../ProductPDFController" method="get">
                    <input type="hidden" name="id" value="<%= productId %>">
                    <button type="submit" class="action-button">Download PDF</button>
                </form>
            </td>
        </tr>
        <%
                    } while (rs.next());
                } else {
        %>
        <tr>
            <td colspan="6" class="no-data">No products available.</td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<tr><td colspan='6' class='no-data'>Error: " + e.getMessage() + "</td></tr>");
            } finally {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            }
        %>
    </table>
</div>
</body>
</html>
