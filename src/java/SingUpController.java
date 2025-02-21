
import Model.DBHelper;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/SingUpController"})
public class SingUpController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        Connection con = null;
        PreparedStatement pst = null;

        try {
            // Get user inputs
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            String confirm_Password = request.getParameter("confirm_Password");
            String role = request.getParameter("role");

            // Establish the database connection
            con = DBHelper.DBHelperConnection("jdbc:mysql://localhost/inventory_management", "root", "");

            // SQL INSERT statement
            String sql = "INSERT INTO users (username, email, phone, password, confirm_Password, role) VALUES (?, ?, ?, ?, ?, ?)";
            pst = con.prepareStatement(sql);

            // Set parameters for the SQL query
            pst.setString(1, username);
            pst.setString(2, email);
            pst.setString(3, phone);
            pst.setString(4, hashPassword(password));
            pst.setString(5, hashPassword(confirm_Password));
            pst.setString(6, role);

            // Execute the query to insert data into the database
            int rowsAffected = pst.executeUpdate();
            if (rowsAffected > 0) {
                // Redirect based on role
                if ("admin".equalsIgnoreCase(role)) {
                    response.sendRedirect("views/admin/adminDashboard.jsp");
                } else if ("user".equalsIgnoreCase(role)) {
                    response.sendRedirect("views/user/userdashboard.jsp");
                }
            } else {
                out.println("<p style='color: red;'>Failed to insert the record.</p>");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SingUpController.class.getName()).log(Level.SEVERE, null, ex);
            out.println("<p style='color: red;'>Error: " + ex.getMessage() + "</p>");
        } finally {
            // Close resources
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                Logger.getLogger(SingUpController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private String hashPassword(String password) {
        // Implement password hashing here
        return password; // Placeholder; replace with actual hashing logic
    }
}
