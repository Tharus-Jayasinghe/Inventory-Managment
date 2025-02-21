package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class signup_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>Sign Up</title>\n");
      out.write("    <link href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css\" rel=\"stylesheet\">\n");
      out.write("    <style>\n");
      out.write("        body {\n");
      out.write("            background: linear-gradient(to bottom right, #74ebd5, #ACB6E5);\n");
      out.write("            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;\n");
      out.write("            margin: 0;\n");
      out.write("            padding: 0;\n");
      out.write("            display: flex;\n");
      out.write("            justify-content: center;\n");
      out.write("            align-items: center;\n");
      out.write("            height: 100vh;\n");
      out.write("            color: #333;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .back-button {\n");
      out.write("            display: flex;\n");
      out.write("            align-items: center;\n");
      out.write("            font-size: 1rem;\n");
      out.write("            text-decoration: none;\n");
      out.write("            color: #003366;\n");
      out.write("            padding: 10px 15px;\n");
      out.write("            border: 1px solid #003366;\n");
      out.write("            border-radius: 5px;\n");
      out.write("            background-color: #f0f8ff;\n");
      out.write("            transition: background-color 0.3s, color 0.3s;\n");
      out.write("            position: absolute;\n");
      out.write("            top: 20px;\n");
      out.write("            left: 20px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .back-button i {\n");
      out.write("            margin-right: 5px;\n");
      out.write("            font-size: 1.2rem;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .back-button:hover {\n");
      out.write("            background-color: #003366;\n");
      out.write("            color: #fff;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .container {\n");
      out.write("            width: 100%;\n");
      out.write("            max-width: 400px;\n");
      out.write("            background: #ffffff;\n");
      out.write("            padding: 20px;\n");
      out.write("            border-radius: 10px;\n");
      out.write("            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);\n");
      out.write("            text-align: center;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        h1 {\n");
      out.write("            font-size: 28px;\n");
      out.write("            color: #4CAF50;\n");
      out.write("            margin-bottom: 20px;\n");
      out.write("            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .form-group {\n");
      out.write("            display: flex;\n");
      out.write("            justify-content: space-between;\n");
      out.write("            margin-bottom: 15px;\n");
      out.write("            align-items: center;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        label {\n");
      out.write("            font-weight: bold;\n");
      out.write("            color: #555;\n");
      out.write("            width: 40%;\n");
      out.write("            text-align: right;\n");
      out.write("            margin-right: 10px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        input {\n");
      out.write("            width: 60%;\n");
      out.write("            padding: 10px;\n");
      out.write("            font-size: 14px;\n");
      out.write("            border: 1px solid #ccc;\n");
      out.write("            border-radius: 5px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .button-row {\n");
      out.write("            display: flex;\n");
      out.write("            justify-content: space-between;\n");
      out.write("            margin-top: 20px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        button {\n");
      out.write("            padding: 10px 20px;\n");
      out.write("            font-size: 16px;\n");
      out.write("            border: none;\n");
      out.write("            border-radius: 5px;\n");
      out.write("            cursor: pointer;\n");
      out.write("            color: #fff;\n");
      out.write("            transition: transform 0.3s, background-color 0.3s;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        button:hover {\n");
      out.write("            transform: scale(1.05);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .signup-button {\n");
      out.write("            background-color: #4CAF50;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .signup-button:hover {\n");
      out.write("            background-color: #45a049;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .clear-button {\n");
      out.write("            background-color: #f44336;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .clear-button:hover {\n");
      out.write("            background-color: #d32f2f;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        h3 {\n");
      out.write("            color: #d32f2f;\n");
      out.write("            font-size: 16px;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("    <script>\n");
      out.write("        function clearForm() {\n");
      out.write("            document.getElementById('signupForm').reset();\n");
      out.write("        }\n");
      out.write("    </script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <a href=\"signin.jsp\" class=\"back-button\">\n");
      out.write("        <i class=\"fas fa-arrow-left\"></i> Back\n");
      out.write("    </a>\n");
      out.write("\n");
      out.write("    <div class=\"container\">\n");
      out.write("        ");
 
            String message = (String) request.getAttribute("message");
            if (message != null) { 
                if (message.equalsIgnoreCase("success")) { 
        
      out.write("\n");
      out.write("                    <h3>Sign up successful!</h3>\n");
      out.write("        ");
 
                } else { 
        
      out.write("\n");
      out.write("                    <h3>");
      out.print( message );
      out.write("</h3>\n");
      out.write("        ");
 
                }
            } 
        
      out.write("\n");
      out.write("\n");
      out.write("        <h1>Create Your Account</h1>\n");
      out.write("        <form id=\"signupForm\" action=\"SingUpController\" method=\"post\">\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"username\">Username</label>\n");
      out.write("                <input type=\"text\" id=\"username\" name=\"username\" \n");
      out.write("                       required minlength=\"5\" maxlength=\"20\" \n");
      out.write("                       pattern=\"^[a-zA-Z0-9_]{5,20}$\" \n");
      out.write("                       title=\"Username must be 5-20 characters long and can only contain letters, numbers, and underscores.\">\n");
      out.write("            </div>\n");
      out.write("            <br>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"email\">Email</label>\n");
      out.write("                <input type=\"email\" id=\"email\" name=\"email\" required maxlength=\"50\">\n");
      out.write("            </div>\n");
      out.write("            <br>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"phone\">Phone Number</label>\n");
      out.write("                <input type=\"tel\" id=\"phone\" name=\"phone\" \n");
      out.write("                       pattern=\"^\\+?\\d{10,15}$\" \n");
      out.write("                       title=\"Phone number must be 10-15 digits and can include an optional '+' at the beginning.\">\n");
      out.write("            </div>\n");
      out.write("            <br>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"password\">Password</label>\n");
      out.write("                <input type=\"password\" id=\"password\" name=\"password\" \n");
      out.write("                       required minlength=\"8\" \n");
      out.write("                       pattern=\"^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d@$!%*?&]{8,}$\" \n");
      out.write("                       title=\"Password must be at least 8 characters long and contain at least one letter and one number.\">\n");
      out.write("            </div>\n");
      out.write("            <br>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"confirm_Password\">Confirm Password</label>\n");
      out.write("                <input type=\"password\" id=\"confirmPassword\" name=\"confirm_Password\" required minlength=\"8\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"role\">Role</label>\n");
      out.write("                <select id=\"role\" name=\"role\" class=\"form-control\" required>\n");
      out.write("                    <option value=\"\" disabled selected>Select Role</option>\n");
      out.write("                    <option value=\"user\">User</option>\n");
      out.write("                    <option value=\"admin\">Admin</option>\n");
      out.write("                </select>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"button-row\">\n");
      out.write("                <button type=\"button\" class=\"clear-button\" onclick=\"clearForm()\">Clear</button>\n");
      out.write("                <button type=\"submit\" class=\"signup-button\">Sign Up</button>\n");
      out.write("            </div>\n");
      out.write("        </form>\n");
      out.write("    </div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
