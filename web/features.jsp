<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Features - Pinthu Company</title>
    <style>
        /* General Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            color: #333;
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        h1, h2, h3 {
            color: #0077b6;
        }

        p {
            color: #777;
        }

        /* Navbar Styles */
        nav {
            background-color: #0077b6;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }

        nav .company-name {
            font-size: 60px;
            font-weight: bold;
            color: #fff;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            font-size: 40px;
            margin-left: 20px;
            padding: 10px;
            transition: 0.3s;
        }

        nav a:hover {
            background-color: #fff;
            color: #0077b6;
            border-radius: 5px;
        }

        /* Features Section */
        .features-container {
            margin-top: 80px;
            padding: 50px 20px;
            width: 100%;
            background-color: #fff;
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            display: flex;
            flex-direction: column;
            flex-grow: 1;
        }

        .features-header {
            text-align: center;
            margin-bottom: 50px;
        }

        .features-header h1 {
            font-size: 80px;
            font-weight: bold;
        }

        .features-header p {
            font-size: 40px;
            margin-top: 10px;
            color: #777;
             text-align: justify;
        }

        /* Features List */
        .features-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        .feature-item {
            width: 30%;
            margin-bottom: 30px;
            background-color: #f4f4f4;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
        }

        .feature-item:hover {
            background-color: #0077b6;
            color: white;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        .feature-item h3 {
            font-size: 60px;
            color: #0077b6;
        }

        .feature-item p {
            font-size: 40px;
            color: #333;
        }

        /* Footer Styles */
        footer {
            background-color: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
            width: 100%;
             font-size: 40px;
        }
    </style>
</head>

<body>

    <!-- Navbar -->
    <nav>
        <div class="company-name">Pinthu Company</div>
        <div>
            <a href="home.jsp">Home</a>
            <a href="aboutUs.jsp">About</a>
            <a href="contact.jsp">Contact</a>
        </div>
    </nav>

    <!-- Features Section -->
    <div class="features-container">
        <div class="features-header">
            <h1>Our Features</h1>
            <p>At Pinthu Company, our platform is designed to offer a comprehensive suite of features aimed at enhancing business operations and driving growth. One of the key highlights is the customizable solutions feature, allowing businesses to tailor the platform to their specific needs and workflows. This flexibility ensures that our platform can accommodate a wide range of industries and requirements. In addition, our intuitive user interface** makes the platform easy to navigate, ensuring quick adoption by users with minimal training. The platform also offers seamless integration capabilities, enabling businesses to connect existing software tools and systems, fostering greater collaboration and data flow across the organization. Real-time analytics and reporting tools empower users to access actionable insights instantly, enabling data-driven decision-making to optimize strategies and improve performance. As your business grows, our platform is designed with scalability in mind, meaning it can expand to handle larger data volumes, more users, and increased transactions without compromising performance. Furthermore, we take security and reliability seriously, employing the latest encryption protocols and backup systems to ensure that your business data is protected at all times, while maintaining continuous system uptime. Whether you need to streamline operations, enhance collaboration, or unlock data insights, our platform offers all the tools necessary to help your business thrive in today’s fast-paced digital environment. We are committed to delivering a solution that not only meets your current needs but is also adaptable and resilient enough to grow with your business as it evolves. Explore our platform’s features today to see how they can drive efficiency, innovation, and success in your organization.</p>
        </div>

        <!-- Features List -->
        <div class="features-list">
            <div class="feature-item">
                <h3>Feature 1</h3>
                <p>Discover how our first feature helps you streamline your work process and boost productivity.</p>
            </div>
            <div class="feature-item">
                <h3>Feature 2</h3>
                <p>Our second feature offers seamless integration with your existing tools and workflows.</p>
            </div>
            <div class="feature-item">
                <h3>Feature 3</h3>
                <p>With our third feature, you can enjoy enhanced security and privacy for all your data.</p>
            </div>
            <div class="feature-item">
                <h3>Feature 4</h3>
                <p>Experience real-time collaboration with our fourth feature, improving team communication.</p>
            </div>
            <div class="feature-item">
                <h3>Feature 5</h3>
                <p>Take your productivity to the next level with advanced analytics and reporting features.</p>
            </div>
            <div class="feature-item">
                <h3>Feature 6</h3>
                <p>Our sixth feature provides mobile access, allowing you to work on the go.</p>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Pinthu Company. All Rights Reserved.</p>
    </footer>

</body>

</html>
