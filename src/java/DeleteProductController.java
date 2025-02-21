import Model.DBHelper;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteProductController")
public class DeleteProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        Connection conn = null;
        PreparedStatement ps = null;

        // Get the product ID from the request
        String productIdStr = request.getParameter("id");

        try {
            // Parse product ID
            int productId = Integer.parseInt(productIdStr);

            // Establish database connection
            conn = DBHelper.DBHelperConnection("jdbc:mysql://localhost/inventory_management", "root", "");

            // SQL query to delete the product from the database
            String sql = "DELETE FROM products WHERE id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, productId);

            // Execute the query
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                // Successfully deleted the product
                response.sendRedirect("views/admin/viewProduct.jsp");  // Redirect to the product list page
            } else {
                // Failed to delete the product
                out.println("<h2>Error: Product not found.</h2>");
                request.getRequestDispatcher("views/admin/DeleteProduct.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            // Handle invalid product ID format
            request.setAttribute("errorMessage", "Invalid product ID format.");
            request.getRequestDispatcher("views/admin/DeleteProduct.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException e) {
            // Handle database errors
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("views/admin/DeleteProduct.jsp").forward(request, response);
        } finally {
            // Close database resources
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
