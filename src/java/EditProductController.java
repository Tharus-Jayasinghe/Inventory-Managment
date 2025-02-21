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

@WebServlet("/EditProductController")
public class EditProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        Connection conn = null;
        PreparedStatement ps = null;

        // Get the product ID and other product details from the request
        String productIdStr = request.getParameter("id");
        String productName = request.getParameter("name");
        String productCategory = request.getParameter("category");
        String productPriceStr = request.getParameter("price");
        String productStock = request.getParameter("stock");
        String productDescription = request.getParameter("description");

        try {
            // Parse product ID and price
            int productId = Integer.parseInt(productIdStr);
            double productPrice = Double.parseDouble(productPriceStr);

            // Establish database connection
            conn = DBHelper.DBHelperConnection("jdbc:mysql://localhost/inventory_management", "root", "");

            // SQL query to update the product in the database
            String sql = "UPDATE products SET name = ?, category = ?, price = ?, stock = ?, description = ? WHERE id = ?";
            ps = conn.prepareStatement(sql);

            // Set parameters in the correct order for the SQL query
            ps.setString(1, productName);
            ps.setString(2, productCategory);
            ps.setDouble(3, productPrice);
            ps.setString(4, productStock);
            ps.setString(5, productDescription);
            ps.setInt(6, productId);

            // Execute the update query
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Product Update Successful</title>");
                out.println("<link rel='stylesheet' href='styles.css'>"); // Link an external stylesheet if available
                out.println("<style>");
                out.println("body { font-family: Arial, sans-serif; background: #f4f4f9; margin: 0; padding: 0; display: flex; flex-direction: column; justify-content: space-between; height: 100vh; }");
                out.println("nav { background-color: #003366; padding: 15px; display: flex; align-items: center; }");
                out.println("nav .company-name { font-size: 24px; color: white; font-weight: bold; margin-right: auto; }");
                out.println("nav a { color: white; text-decoration: none; margin: 0 10px; font-size: 16px; }");
                out.println("nav a:hover { text-decoration: underline; }");
                out.println(".content { text-align: center; padding: 50px 20px; }");
                out.println(".content h1 { color: #28a745; font-size: 32px; margin-bottom: 20px; }");
                out.println(".content p { font-size: 18px; color: #333; margin-bottom: 30px; }");
                out.println(".content a { display: inline-block; padding: 10px 20px; background-color: #003366; color: white; text-decoration: none; font-size: 16px; border-radius: 5px; }");
                out.println(".content a:hover { background-color: #00509e; }");
                out.println("footer { background-color: #003366; color: white; text-align: center; padding: 10px; font-size: 14px; }");
                out.println("</style>");
                out.println("</head>");
                out.println("<body>");

                // Navbar
                out.println("<nav>");
                out.println("<div class='company-name'>Winlion Inventory System</div>");
                out.println("<a href='home.jsp'>Home</a>");
                out.println("<a href='aboutUs.jsp'>About Us</a>");
                out.println("<a href='contact.jsp'>Contact</a>");
                out.println("</nav>");

                // Content Section
                out.println("<div class='content'>");
                out.println("<h1>Product Edited Successfully!</h1>");
                out.println("<p>The product with ID <strong>" + productId + "</strong> has been updated successfully.</p>");
                out.println("<a href='views/admin/viewProduct.jsp'>Edit Another Product</a>");
                out.println("</div>");

                // Footer
                out.println("<footer>");
                out.println("© 2024 Winlion Company | All Rights Reserved");
                out.println("</footer>");

                out.println("</body>");
                out.println("</html>");
            } else {
                out.println("<p style='color: red;'>Failed to update the record.</p>");
                request.getRequestDispatcher("views/admin/editProduct.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            // Handle invalid product ID or price format
            request.setAttribute("errorMessage", "Invalid product ID or price format.");
            request.getRequestDispatcher("views/admin/editProduct.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException e) {
            // Handle database errors
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("views/admin/editProduct.jsp").forward(request, response);
        } finally {
            // Close database resources
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
            }
        }
    }
}
