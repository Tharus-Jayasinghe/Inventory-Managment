<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to bottom, #ffffff, #f0f4f8);
            overflow-x: hidden;
        }
        .navbar {
            background-color: #343a40;
            color: #fff;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .navbar h1 {
            margin: 0;
        }
        .navbar .nav-links a {
            color: #fff;
            text-decoration: none;
            margin: 0 10px;
            padding: 8px 15px;
            border-radius: 5px;
            transition: background 0.3s;
        }
        .navbar .nav-links a:hover {
            background: #495057;
        }
        .container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 20px;
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            animation: fadeIn 1.5s ease-in-out;
            overflow: hidden;
            position: relative;
        }
        .container img {
            width: 100%;
            height: auto;
            object-fit: cover;
            border-radius: 15px 15px 0 0;
        }
        .content {
            padding: 30px;
            position: relative;
            z-index: 2;
        }
        .content h2 {
            margin: 0 0 20px;
            font-size: 2em;
            color: #343a40;
            animation: slideInLeft 1s ease-in-out;
        }
        .content p {
            margin: 0 0 15px;
            line-height: 1.8;
            color: #6c757d;
            animation: slideInRight 1.2s ease-in-out;
        }
        footer {
            text-align: center;
            padding: 20px;
            background: #343a40;
            color: #fff;
            position: relative;
        }
        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        @keyframes slideInLeft {
            from { opacity: 0; transform: translateX(-50px); }
            to { opacity: 1; transform: translateX(0); }
        }
        @keyframes slideInRight {
            from { opacity: 0; transform: translateX(50px); }
            to { opacity: 1; transform: translateX(0); }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <h1>Admin Dashboard</h1>
        <div class="nav-links">
            <a href="views/admin/adminDashboard.jsp"><i class="fas fa-home"></i> Home</a>
            <a href="aboutUs.jsp"><i class="fas fa-info-circle"></i> About Us</a>
            <a href="contact.jsp"><i class="fas fa-file-alt"></i> Content</a>
            <a href="products"><i class="fas fa-box-open"></i> Products</a>
            <a href="search"><i class="fas fa-search"></i> Search</a>
            <a href="filter"><i class="fas fa-filter"></i> Filter</a>
            <a href="home.jsp" class="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>

    <!-- About Us Section -->
    <div class="container">
        
        <div class="content">
            <h2>About Us</h2>
            <p>
                Welcome to Winlion Company, your one-stop destination for a wide range of products across various categories. We take pride in offering high-quality products to meet your needs and expectations.
            </p>
            <p>
                <strong>Mission:</strong> At Winlion, our mission is to provide unparalleled value to our customers by offering a diverse range of products and exceptional service, ensuring satisfaction at every step.
            </p>
            <p>
                <strong>Vision:</strong> Our vision is to become a leading brand recognized for its commitment to excellence, innovation, and customer-centric solutions.
            </p>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        &copy; 2024 Winlion Company. All Rights Reserved.
    </footer>
</body>
</html>
