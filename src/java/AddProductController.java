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

@WebServlet("/AddProductController")
public class AddProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        Connection conn = null;
        PreparedStatement ps = null;

        // Get form data from the request
        String productName = request.getParameter("name");
        String productCategory = request.getParameter("category");
        String productPriceStr = request.getParameter("price");
        String productStockStr = request.getParameter("stock");
        String productDescription = request.getParameter("description");

        // Validate the input data
        if (productName == null || productName.isEmpty()) {
            out.println("<h3>Product Name is required.</h3>");
            return;
        }

        // Validate product price and stock
        if (productPriceStr == null || productPriceStr.isEmpty() || productStockStr == null || productStockStr.isEmpty()) {
            out.println("<h3>Product price and stock are required.</h3>");
            return;
        }

        double productPrice = 0;
        int productStock = 0;

        try {
            // Attempt to parse the product price and stock
            productPrice = Double.parseDouble(productPriceStr);
            productStock = Integer.parseInt(productStockStr);
        } catch (NumberFormatException e) {
            // If parsing fails, return an error message
            out.println("<h3>Invalid product price or stock value. Please enter valid numbers.</h3>");
            return;
        }

        try {
            // Establish database connection
           conn = DBHelper.DBHelperConnection("jdbc:mysql://localhost/inventory_management", "root", "");

            // SQL query to insert product details into the products table
            String sql = "INSERT INTO products (name, category, price, stock, description) VALUES (?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);

            // Set parameters for the SQL query
            ps.setString(1, productName);
            ps.setString(2, productCategory);
            ps.setDouble(3, productPrice);
            ps.setInt(4, productStock);
            ps.setString(5, productDescription);

            // Execute the query
            int rowsAffected = ps.executeUpdate();

            // Check if the data was inserted successfully
            if (rowsAffected > 0) {
                
//                
//                out.println("<!DOCTYPE html>");
//                out.println("<html>");
//                out.println("<head>");
//                out.println("<title>Product Deletion Success</title>");
//                out.println("<link rel='stylesheet' href='styles.css'>");
//                out.println("<style>");
//                out.println("body { font-family: Arial, sans-serif; background-color: #f9f9f9; margin: 0; padding: 0; background-image: url('https://www.zmo.ai/wp-content/uploads/2023/09/powerpoint-slide-with-white-background-SB02298-min-scaled.jpg'); background-size: cover; background-position: }");
//                out.println("nav { background-color: #004080; padding: 10px; display: flex; align-items: center; }");
//                out.println("nav .company-name { font-size: 70px; color: white; margin-right: auto; }");
//                out.println("nav a { color: white; text-decoration: none; margin-right: 15px; font-size: 40px; }");
//                out.println("nav a:hover { text-decoration: underline; }");
//                out.println(".content { text-align: center; margin-top: 150px; }");
//                out.println(".content h1 { color: #4CAF50; font-size: 90px; }");
//                out.println(".content p { font-size: 70px; color: #555; }");
//                out.println(".content a { display: inline-block; margin-top: 20px; padding: 10px 20px; background-color: #004080; color: white; text-decoration: none; border-radius: 5px; font-size: 20px; }");
//                out.println(".content a:hover { background-color: #003366; }");
//                out.println("footer { background-color: #004080; color: white; text-align: center; padding: 10px; position: fixed; bottom: 0; width: 100%; font-size: 40px; }");
//                out.println("</style>");
//                out.println("</head>");
//                out.println("<body>");
//                out.println("<nav>");
//                out.println("<div class='company-name'>Your Company Name</div>");
//                out.println("<a href='index.jsp'>Home</a>");
//                out.println("<a href='about.jsp'>About Us</a>");
//                out.println("<a href='contact.jsp'>Contact</a>");
//                out.println("</nav>");
//                out.println("<div class='content'>");
//                out.println("<h1>Product Deleted Successfully!</h1>");
//                out.println("<p>The product with ID <strong>" +  productName + "</strong> has been deleted successfully.</p>");
//                out.println("<a href='views/admin/AddNewProduct.jsp'>Add New Another Product</a>");
//                out.println("</div>");
//                out.println("<footer>");
//                out.println("© 2024 Your Company Name | All Rights Reserved");
//                out.println("</footer>");
//                out.println("</body>");
//                out.println("</html>");
//            } else {
//                out.println("<h3>Failed to add product.</h3>");
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Registration Successful</title>");
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
                out.println("<h1>Add Product Successful!</h1>");
                out.println("<p>The product with ID <strong>" +  productName + "</strong> has been deleted successfully.</p>");
                out.println("<a href='views/admin/AddNewProduct.jsp'>Add New Another Product</a>");
              
                out.println("</div>");

                // Footer
                out.println("<footer>");
                out.println("© 2024 Winlion Company | All Rights Reserved");
                out.println("</footer>");

                out.println("</body>");
                out.println("</html>");

            } else {
                out.println("<p style='color: red;'>Failed to insert the record.</p>");

            }

        } catch (SQLException e) {
            // Handle SQL exceptions (e.g., connection issues, query issues)
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        } catch (ClassNotFoundException e) {
            // Handle ClassNotFoundException for database connection class
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        } finally {
            // Close resources (PreparedStatement, Connection)
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                out.println("<h3>Error closing resources: " + e.getMessage() + "</h3>");
            }
        }
    }
}
