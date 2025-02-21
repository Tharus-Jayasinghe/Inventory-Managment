<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Link to Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            color: #333;
        }

        .navbar {
            background-color: #003366;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0.5rem 1rem;
        }

        .navbar h1 {
            margin: 0;
            padding: 0.5rem;
            color: #fff;
            font-size: 1.5rem;
        }

        .navbar .nav-links {
            display: flex;
            gap: 1rem;
        }

        .navbar .nav-links a {
            color: #fff;
            text-decoration: none;
            font-size: 1rem;
            padding: 0.75rem 1rem;
        }

        .navbar .nav-links a:hover {
            background-color: #00509e;
            color: #fff;
        }

        .navbar .logout {
            float: right;
        }

        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 1rem;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .container h2 {
            text-align: center;
            color: #003366;
            margin-bottom: 1.5rem;
        }

        .card {
            background-color: #f8f9fa;
            padding: 1rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin-bottom: 1rem;
            text-align: center;
        }

        .card a {
            text-decoration: none;
            color: #003366;
            font-weight: bold;
        }

        .card a:hover {
            color: #00509e;
        }

        footer {
            background-color: #003366;
            color: white;
            text-align: center;
            padding: 3rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 4rem;
        }

        .footer-left, .footer-center, .footer-right {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 1rem;
        }

        .footer-links {
            text-align: left;
        }

        .footer-links a {
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }

        .footer-links a:hover {
            color: #f5a623;
        }

        .social-media {
            display: flex;
            gap: 1rem;
            justify-content: center;
        }

        .social-media a {
            color: white;
            font-size: 1.5rem;
            transition: color 0.3s;
        }

        .social-media a:hover {
            color: #f5a623;
        }

        .newsletter {
            text-align: center;
        }

        .newsletter input {
            padding: 0.5rem;
            font-size: 1rem;
            border: none;
            border-radius: 30px;
            width: 70%;
            margin-right: 10px;
        }

        .newsletter button {
            padding: 0.5rem 2rem;
            font-size: 1rem;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .newsletter button:hover {
            background-color: #0056b3;
        }

        .chart-container {
            margin: 2rem auto;
            width: 90%;
            max-width: 800px;
        }

        @media (max-width: 768px) {
            footer {
                flex-direction: column;
                text-align: center;
            }

            .footer-left, .footer-center, .footer-right {
                align-items: center;
                margin-bottom: 1rem;
            }

            .footer-links {
                text-align: center;
            }

            .social-media {
                justify-content: center;
                margin-bottom: 1rem;
            }

            .newsletter {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 0.5rem;
                margin-top: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h1>Admin Dashboard</h1>
        <div class="nav-links">
            <a href="../../home.jsp"><i class="fas fa-home"></i> Home</a>
            <a href="../../aboutUs.jsp"><i class="fas fa-info-circle"></i> About Us</a>
            <a href="../../contact.jsp"><i class="fas fa-file-alt"></i> Content</a>
            <a href="products"><i class="fas fa-box-open"></i> Products</a>
            <a href="search"><i class="fas fa-search"></i> Search</a>
            <a href="filter"><i class="fas fa-filter"></i> Filter</a>
            <a href="../../signin.jsp" class="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>

    <div class="container">
        <h2>Welcome, Admin</h2>

        <div class="card">
            <a href="viewProduct.jsp">📊 View Product</a>
        </div>
        <div class="card">
            <a href="AddNewProduct.jsp">➕ Add New Product</a>
        </div>
<!--        <div class="card">
            <a href="UpdateProduct.jsp">✏️ Update Existing Product</a>
        </div>
        <div class="card">
            <a href="DeleteProduct.jsp">❌ Delete a Product</a>
        </div>-->
        <div class="card">
            <a href="ganaratepdf.jsp">📊 Ganarate Report</a>
        </div>
        <!-- Button to download PDF -->
        

        <div class="chart-container">
            <h3>Monthly Sales Overview</h3>
            <canvas id="salesChart"></canvas>
        </div>
    </div>

    <footer>
        <div class="footer-left">
            <div class="footer-links">
                <p>&copy; 2024 Winlion Company. All Rights Reserved.</p>
                <p><a href="#">Privacy Policy</a> | <a href="#">Terms & Conditions</a></p>
            </div>
        </div>

        <div class="footer-center">
            <div class="social-media">
                <a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a>
                <a href="#" target="_blank"><i class="fab fa-twitter"></i></a>
                <a href="#" target="_blank"><i class="fab fa-linkedin-in"></i></a>
                <a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
            </div>
        </div>

        <div class="footer-right">
            <div class="newsletter">
                <p>Subscribe to our Newsletter</p>
                <form action="#">
                    <input type="email" placeholder="Enter your email" required>
                    <button type="submit">Subscribe</button>
                </form>
            </div>
        </div>
    </footer>

    <script>
        // Chart.js Configuration
        const ctx = document.getElementById('salesChart').getContext('2d');
        const salesChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['January', 'February', 'March', 'April', 'May'],
                datasets: [{
                    label: 'Sales',
                    data: [100, 200, 300, 400, 500],
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1,
                    fill: false
                }]
            }
        });

        // PDF Generation and Download
        document.getElementById('downloadPdf').addEventListener('click', function() {
            const { jsPDF } = window.jspdf;
            const doc = new jsPDF();

            // Add content to the PDF
            doc.text("Admin Dashboard Report", 10, 10);
            doc.text("Product Deletion Report", 10, 20);
            doc.text("This is a sample PDF report after deleting a product.", 10, 30);

            // Save the generated PDF
            doc.save("delete_product_report.pdf");
        });
    </script>
</body>
</html>
