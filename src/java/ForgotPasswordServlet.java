import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Define the URL mapping for the servlet
@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        // Simulated email sending logic (replace with actual email service)
        boolean emailSent = true; // Simulate successful email sending

        if (emailSent) {
            request.setAttribute("successMessage", "Password reset email sent to " + email);
            request.getRequestDispatcher("forgetpassword.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Failed to send reset email. Try again.");
            request.getRequestDispatcher("forgetpassword.jsp").forward(request, response);
        }
    }
}
