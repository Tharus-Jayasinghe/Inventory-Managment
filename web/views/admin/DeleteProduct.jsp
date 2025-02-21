<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Product</title>
    <!-- Link to Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
            color: #333;
        }

        .navbar {
            background-color: #003366;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 2rem;
        }

        .navbar h1 {
            margin: 0;
            color: white;
            font-size: 1.8rem;
        }

        .navbar .nav-links {
            display: flex;
            gap: 1.5rem;
        }

        .navbar .nav-links a {
            color: white;
            text-decoration: none;
            font-size: 1rem;
            padding: 0.75rem;
            border-radius: 5px;
        }

        .navbar .nav-links a:hover {
            background-color: #00509e;
        }

        .container {
            max-width: 800px;
            margin: 2rem auto;
            padding: 2rem;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .container h2 {
            text-align: center;
            color: #003366;
            margin-bottom: 2rem;
        }

        .form-group {
            display: flex;
            justify-content: space-between; /* Ensure buttons are spaced out */
            margin-bottom: 1rem;
        }

        .form-group p {
            font-size: 1.1rem;
            text-align: center;
            margin-bottom: 2rem;
        }

        .form-group button,
        .form-group a {
            padding: 1rem 2rem;
            font-size: 1.1rem;
            border-radius: 8px;
            width: 25%;
            text-align: center;
        }

        .form-group button {
            background-color: #e74c3c;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-group button:hover {
            background-color: #c0392b;
        }

        .form-group a {
            background-color: #003366;
            color: white;
            text-decoration: none;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-group a:hover {
            background-color: #00509e;
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
            <a href="adminDashboard.jsp"><i class="fas fa-home"></i> Home</a>
            <a href="../../aboutUs.jsp"><i class="fas fa-info-circle"></i> About Us</a>
            <a href="../../contact.jsp"><i class="fas fa-file-alt"></i> Content</a>
            <a href="products"><i class="fas fa-box-open"></i> Products</a>
            <a href="search"><i class="fas fa-search"></i> Search</a>
            <a href="filter"><i class="fas fa-filter"></i> Filter</a>
            <a href="../../home.jsp" class="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>

    <div class="container">
        <h2>Delete Product</h2>
        <form action="../../DeleteProductController" method="POST">
            <input type="hidden" name="id" value="<%= request.getParameter("productId") %>">
            <div class="form-group">
                <p>Are you sure you want to delete the product with ID: <%= request.getParameter("productId") %>?</p>
            </div>
            <div class="form-group">
                <a href="viewProduct.jsp" class="cancel">Cancel</a>
                <button type="submit">Delete</button>
            </div>
        </form>
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
</body>
</html>
