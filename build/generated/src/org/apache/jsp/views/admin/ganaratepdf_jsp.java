package org.apache.jsp.views.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class ganaratepdf_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html; charset=UTF-8");
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>View Products</title>\n");
      out.write("    <style>\n");
      out.write("        body {\n");
      out.write("            font-family: Arial, sans-serif;\n");
      out.write("            background-color: #f4f4f4;\n");
      out.write("        }\n");
      out.write("        .container {\n");
      out.write("            max-width: 800px;\n");
      out.write("            margin: 2rem auto;\n");
      out.write("            background-color: #fff;\n");
      out.write("            padding: 20px;\n");
      out.write("            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);\n");
      out.write("            border-radius: 8px;\n");
      out.write("        }\n");
      out.write("        h2 {\n");
      out.write("            text-align: center;\n");
      out.write("            color: #333;\n");
      out.write("        }\n");
      out.write("        table {\n");
      out.write("            width: 100%;\n");
      out.write("            border-collapse: collapse;\n");
      out.write("            margin-top: 20px;\n");
      out.write("        }\n");
      out.write("        th, td {\n");
      out.write("            text-align: left;\n");
      out.write("            padding: 12px;\n");
      out.write("            border: 1px solid #ddd;\n");
      out.write("        }\n");
      out.write("        th {\n");
      out.write("            background-color: #007BFF;\n");
      out.write("            color: white;\n");
      out.write("        }\n");
      out.write("        td {\n");
      out.write("            background-color: #f9f9f9;\n");
      out.write("        }\n");
      out.write("        .action-button {\n");
      out.write("            background-color: #28a745;\n");
      out.write("            color: white;\n");
      out.write("            padding: 8px 12px;\n");
      out.write("            text-decoration: none;\n");
      out.write("            border: none;\n");
      out.write("            border-radius: 4px;\n");
      out.write("            cursor: pointer;\n");
      out.write("        }\n");
      out.write("        .action-button:hover {\n");
      out.write("            background-color: #218838;\n");
      out.write("        }\n");
      out.write("        .no-data {\n");
      out.write("            text-align: center;\n");
      out.write("            color: #666;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<div class=\"container\">\n");
      out.write("    <h2>Product List</h2>\n");
      out.write("    <table>\n");
      out.write("        <tr>\n");
      out.write("            <th>ID</th>\n");
      out.write("            <th>Name</th>\n");
      out.write("            <th>Category</th>\n");
      out.write("            <th>Price</th>\n");
      out.write("            <th>Stock</th>\n");
      out.write("            <th>Action</th>\n");
      out.write("        </tr>\n");
      out.write("        ");

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
        
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td>");
      out.print( productId );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( productName );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( productCategory );
      out.write("</td>\n");
      out.write("            <td>$");
      out.print( productPrice );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( productStock );
      out.write("</td>\n");
      out.write("            <td>\n");
      out.write("                <form action=\"../../ProductPDFController\" method=\"get\">\n");
      out.write("                    <input type=\"hidden\" name=\"id\" value=\"");
      out.print( productId );
      out.write("\">\n");
      out.write("                    <button type=\"submit\" class=\"action-button\">Download PDF</button>\n");
      out.write("                </form>\n");
      out.write("            </td>\n");
      out.write("        </tr>\n");
      out.write("        ");

                    } while (rs.next());
                } else {
        
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td colspan=\"6\" class=\"no-data\">No products available.</td>\n");
      out.write("        </tr>\n");
      out.write("        ");

                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<tr><td colspan='6' class='no-data'>Error: " + e.getMessage() + "</td></tr>");
            } finally {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            }
        
      out.write("\n");
      out.write("    </table>\n");
      out.write("</div>\n");
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
