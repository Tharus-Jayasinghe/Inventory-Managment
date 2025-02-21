import Model.DBHelper;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/udateProductController"})
public class udateProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id")); // Get product ID from request
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Establish connection using DBHelper
            con = DBHelper.DBHelperConnection("jdbc:mysql://localhost/inventory_management", "root", "");

            // SQL to fetch product details for editing
            String sql = "SELECT * FROM products WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, productId);
            rs = ps.executeQuery();

            if (rs.next()) {
                // Set product data as request attributes
                request.setAttribute("id", rs.getInt("id"));
                request.setAttribute("name", rs.getString("name"));
                request.setAttribute("category", rs.getString("category"));
                request.setAttribute("price", rs.getDouble("price"));
                request.setAttribute("stock", rs.getInt("stock"));
                request.setAttribute("description", rs.getString("description"));

                // Forward to Edit_product.jsp
                RequestDispatcher dispatcher = request.getRequestDispatcher("Edit_product.jsp");
                dispatcher.forward(request, response);
            } else {
                // Redirect to update_products.jsp if the product is not found
                response.sendRedirect("UpdateProducts.jsp?error=Product+not+found");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("UpdateProducts.jsp?error=Database+error");
        } finally {
            // Close resources
            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (ps != null) ps.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id")); // Product ID to update
        String name = request.getParameter("name"); // Updated name
        String category = request.getParameter("category"); // Updated category
        String description = request.getParameter("description"); // Updated description
        double price = Double.parseDouble(request.getParameter("price")); // Updated price
        int stock = Integer.parseInt(request.getParameter("stock")); // Updated stock

        Connection con = null;
        PreparedStatement ps = null;

        try {
            // Establish connection using DBHelper
            con = DBHelper.DBHelperConnection("jdbc:mysql://localhost/inventory_management", "root", "");

            // SQL query to update product details
            String updateQuery = "UPDATE products SET name = ?, category = ?, price = ?, stock = ?, description = ? WHERE id = ?";
            ps = con.prepareStatement(updateQuery);
            ps.setString(1, name);
            ps.setString(2, category);
            ps.setDouble(3, price);
            ps.setInt(4, stock);
            ps.setString(5, description);
            ps.setInt(6, id);

            int updatedRows = ps.executeUpdate();
            if (updatedRows > 0) {
                // Redirect to product list page with success message
                response.sendRedirect("UpdateProduct.jsp?success=Product+updated+successfully");
            } else {
                // Redirect back if update fails
                response.sendRedirect("UpdateProduct.jsp?error=Failed+to+update+product");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("UpdateProduct.jsp?error=Database+error");
        } finally {
            // Close resources
            try { if (ps != null) ps.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}
