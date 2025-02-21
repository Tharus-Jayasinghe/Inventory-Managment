import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.WebServlet;

@WebServlet(urlPatterns = {"/SignInController"})
public class SignInController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get login credentials
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        PrintWriter out = response.getWriter();

        // Database connection setup
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        response.setContentType("text/html");

        try {
            // Load the database driver (Update this according to your database)
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory_management");

            // Prepare the SQL query
            String query = "SELECT * FROM users WHERE username = ? AND password = ?";
            stmt = conn.prepareStatement(query);
            
            stmt.setString(1, (String) username);
            stmt.setString(2, password);

            // Execute the query
            rs = stmt.executeQuery();

            if (rs.next()) {
                // Successful login
                HttpSession session = request.getSession();
                session.setAttribute("UN", username);
                request.setAttribute("message", "Welcome " + username);
                request.getRequestDispatcher("views/admin/adminDashboard.jsp").forward(request, response);
            } else {
                // Invalid login
                out.println("<html><body><h3>Invalid credentials. Please try again.</h3></body></html>");
                request.getRequestDispatcher("signin.jsp").include(request, response);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SignInController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(SignInController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
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
                out.println("<h1>Login Successful</h1>");
                out.println("<p>Welcome, " + username + "</p>");
                out.println("<a href='views/admin/adminDashboard.jsp'>Go to Dashboard</a>");
                out.println("</div>");

                // Footer
                out.println("<footer>");
                out.println("© 2024 Winlion Company | All Rights Reserved");
                out.println("</footer>");

                out.println("</body>");
                out.println("</html>");
        // HTML structure
        
    }
}
