import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Servlet annotation to map this servlet to the URL pattern "/ViewAllProductsServlet"
@WebServlet("/ViewProductController")
public class ViewProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Define database connection parameters
    private static final String jdbcURL = "jdbc:mysql://localhost:3306/inventory_management";
    private static final String jdbcUsername = "root";
    private static final String jdbcPassword = "";

    // Define SQL query to fetch all products
    private static final String SELECT_ALL_PRODUCTS = "SELECT * FROM products";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // List to store the products fetched from the database
        List<products> productList = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            
            // Loop through the result set and create Products objects
            while (resultSet.next()) {
                int productId = resultSet.getInt("product_id");
                String productName = resultSet.getString("product_name");
                String productCategory = resultSet.getString("product_category");
                double productPrice = resultSet.getDouble("product_price");
                int productStock = resultSet.getInt("product_stock");
                String productDescription = resultSet.getString("product_description");

                // Add the product to the product list
                products product = new products(productId, productName, productCategory, productPrice, productStock, productDescription);
                productList.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error retrieving products from the database.");
        }

        // Set product list as a request attribute
        request.setAttribute("productList", productList);

        // Forward the request to the JSP page for display
        request.getRequestDispatcher("view-all-product.jsp").forward(request, response);
    }
}
