import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/ProductPDFController")
public class ProductPDFController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("id");

        String dbURL = "jdbc:mysql://localhost:3306/inventory_management";
        String user = "root";
        String password = "";

        try (Connection conn = DriverManager.getConnection(dbURL, user, password)) {
            String query = "SELECT * FROM products WHERE id = ?";
            try (PreparedStatement ps = conn.prepareStatement(query)) {
                ps.setString(1, productId);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    String productName = rs.getString("name");
                    String productCategory = rs.getString("category");
                    double productPrice = rs.getDouble("price");
                    int productStock = rs.getInt("stock");

                    response.setContentType("application/pdf");
                    response.setHeader("Content-Disposition", "attachment; filename=Product_" + productId + ".pdf");

                    PdfWriter writer = new PdfWriter(response.getOutputStream());
                    com.itextpdf.kernel.pdf.PdfDocument pdfDoc = new com.itextpdf.kernel.pdf.PdfDocument(writer);
                    Document document = new Document(pdfDoc);

                    document.add(new Paragraph("Product Report").setBold().setFontSize(14));
                    document.add(new Paragraph("ID: " + productId));
                    document.add(new Paragraph("Name: " + productName));
                    document.add(new Paragraph("Category: " + productCategory));
                    document.add(new Paragraph("Price: $" + productPrice));
                    document.add(new Paragraph("Stock: " + productStock));

                    document.close();
                }
            }
        } catch (SQLException e) {
            throw new ServletException("Database error: " + e.getMessage(), e);
        }
    }
}
