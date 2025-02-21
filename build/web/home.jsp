<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Win Lion Company</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f7f9fc;
        }

        /* Navigation Bar */
        .navbar {
            background-color: #003366; /* Dark navy */
            display: flex;
            justify-content: flex-end; /* Align items to the right */
            align-items: center;
            padding: 0.5rem 1rem;
        }

        .navbar h1 {
            margin: 0;
            padding: 0.5rem;
            color: #fff;
            font-size: 1.5rem;
            margin-right: auto; /* Push title to the left */
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
            background-color: #00509e; /* Slightly brighter blue */
            color: #fff;
        }

        /* Hero Section */
        .hero {
            background-image: url('data:image/jpeg;base64,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');
            background-size: cover; /* Ensures the image covers the entire element */
            background-position: center; /* Centers the image */
            background-repeat: no-repeat; /* Prevents the image from repeating */
            height: 100vh; /* Example: sets the height to 100% of the viewport */
            width: 100%;
            
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
            padding: 2rem;
        }

        .hero h1 {
            font-size: 3rem;
            font-weight: bold;
            margin-bottom: 1rem;
        }

        .hero p {
            font-size: 1.5rem;
            margin-bottom: 2rem;
            max-width: 800px;
        }

        .cta-button {
            padding: 1rem 3rem;
            font-size: 1.2rem;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .cta-button:hover {
            background-color: #0056b3;
        }

        .hero-buttons {
            display: flex;
            gap: 1rem;
            margin-top: 1rem;
        }

        .login-btn, .register-btn {
            padding: 1rem 3rem;
            font-size: 1.2rem;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .login-btn {
            background-color: #28a745;
            color: white;
        }

        .login-btn:hover {
            background-color: #218838;
        }

        .register-btn {
            background-color: #007bff;
            color: white;
        }

        .register-btn:hover {
            background-color: #0056b3;
        }

        /* Features Section */
        .features {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            padding: 4rem 2rem;
            background-color: #fff;
        }

        .feature {
            width: 250px;
            text-align: center;
            margin: 2rem 0;
        }

        .feature-icon {
            font-size: 3rem;
            color: #007bff;
            margin-bottom: 1rem;
        }

        .feature h3 {
            font-size: 1.5rem;
            color: #333;
            margin-bottom: 1rem;
        }

        .feature p {
            font-size: 1rem;
            color: #666;
        }

        /* Footer Section */
        footer {
            background-color: #003366;
            color: white;
            text-align: center;
            padding: 3rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 4rem; /* To create space above footer */
        }

        .footer-left, .footer-center, .footer-right {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 1rem;
        }

        .footer-left {
            text-align: left;
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

        /* Responsive Design */
        @media (max-width: 768px) {
            .hero {
                height: 60vh;
                padding: 1rem;
            }

            .hero h1 {
                font-size: 2rem;
            }

            .hero p {
                font-size: 1.2rem;
            }

            .features {
                flex-direction: column;
                align-items: center;
            }

            .feature {
                width: 80%;
            }

            footer {
                flex-direction: column;
                text-align: center;
            }

            .footer-left, .footer-center, .footer-right {
                align-items: center;
                margin-bottom: 1rem;
            }

            .footer-left {
                text-align: center;
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
                justify-content: center; /* Center the content */
                align-items: center; /* Vertically align input and button */
                gap: 0.5rem; /* Space between the input and the button */
                margin-top: 1rem;
            }

            .newsletter input {
                width: 70%; /* Adjust input width */
                padding: 0.5rem;
                font-size: 1rem;
                border: none;
                border-radius: 30px;
            }

            .newsletter button {
                width: auto; /* Allow button to adjust width based on content */
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

        }
    </style>
</head>
<body>
    <div class="navbar">
        <h1>WinLion Inventory Management</h1>
        <div class="nav-links">
            <a href="home.jsp"><i class="fas fa-home"></i> Home</a>
            <a href="aboutUs.jsp"><i class="fas fa-info-circle"></i> About Us</a>
            <a href="contact.jsp"><i class="fas fa-file-alt"></i> Content</a>
            <a href="products"><i class="fas fa-box-open"></i> Products</a>
            <a href="search"><i class="fas fa-search"></i> Search</a>
            <a href="filter"><i class="fas fa-filter"></i> Filter</a>
            <a href="signin.jsp"><i class="fas fa-sign-in-alt"></i> Login</a>
            <a href="signup.jsp"><i class="fas fa-user-plus"></i> Register</a>
        </div>
    </div>

    <!-- Hero Section -->
    <div class="hero">
        <h1>Revolutionize Your Inventory Management</h1>
        <p>Manage, track, and optimize your inventory with ease. Get the insights you need to run your business smoothly.</p>
        <button class="cta-button">Get Started</button>

        <!-- Login and Register Buttons -->
<!--        <div class="hero-buttons">
            <button class="login-btn">Login</button>
            <button class="register-btn">Register</button>
        </div>-->
    </div>

    <!-- Features Section -->
    <div class="features">
        <div class="feature">
            <div class="feature-icon"><i class="fas fa-box"></i></div>
            <h3>Track Inventory</h3>
            <p>Easily track your inventory in real-time, from stock levels to orders and deliveries.</p>
        </div>
        <div class="feature">
            <div class="feature-icon"><i class="fas fa-chart-line"></i></div>
            <h3>Real-Time Insights</h3>
            <p>Get actionable data to make smarter decisions with detailed reports and analytics.</p>
        </div>
        <div class="feature">
            <div class="feature-icon"><i class="fas fa-users"></i></div>
            <h3>Manage Orders</h3>
            <p>Automate and streamline order management, from placement to delivery.</p>
        </div>
        <div class="feature">
            <div class="feature-icon"><i class="fas fa-cogs"></i></div>
            <h3>Easy Integration</h3>
            <p>Seamlessly integrate with your existing systems for smooth business operations.</p>
        </div>
    </div>

    <!-- Footer Section -->
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
                    <br><br><br>
                    <button type="submit">Subscribe</button>
                </form>
            </div>
        </div>
    </footer>
</body>
</html>
