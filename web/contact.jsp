<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
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
            font-size: 2.5rem;
        }

        p {
            color: #555;
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
            font-size: 1.8rem;
            font-weight: bold;
            color: #fff;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            font-size: 1.2rem;
            margin-left: 20px;
            padding: 10px;
            transition: 0.3s;
        }

        nav a:hover {
            background-color: #fff;
            color: #0077b6;
            border-radius: 5px;
        }

        /* Contact Section */
        .contact-container {
            margin-top: 80px;
            padding: 50px 20px;
            width: 90%;
            max-width: 1200px;
            margin-left: auto;
            margin-right: auto;
            background-color: #fff;
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            display: flex;
            flex-direction: column;
            flex-grow: 1;
        }

        .contact-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .contact-header h1 {
            font-size: 2.8rem;
            font-weight: bold;
        }

        .contact-header p {
            font-size: 1.2rem;
            margin-top: 10px;
            color: #555;
            text-align: justify;
        }

        /* Contact Form */
        .contact-form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .contact-form input,
        .contact-form textarea {
            width: 80%;
            max-width: 600px;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }

        .contact-form button {
            width: 80%;
            max-width: 600px;
            padding: 15px;
            border: none;
            background-color: #0077b6;
            color: #fff;
            font-size: 1rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .contact-form button:hover {
            background-color: #005f8d;
        }

        /* Map Section */
        .map-section {
            margin-top: 50px;
            text-align: center;
        }

        .map-section iframe {
            width: 100%;
            height: 400px;
            border: 0;
            border-radius: 8px;
        }

        /* Footer Styles */
        footer {
            background-color: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
            font-size: 1rem;
            margin-top: 20px;
        }
    </style>
</head>

<body>

    <!-- Navbar -->
    <nav>
        <div class="company-name">Winlion Company</div>
        <div>
            <a href="home.jsp">Home</a>
            <a href="aboutUs.jsp">About</a>
            <a href="contact.jsp">Contact</a>
        </div>
    </nav>

    <!-- Contact Us Section -->
    <div class="contact-container">
        <div class="contact-header">
            <h1>Contact Us</h1>
            <p>
                At Winlion Company, we value our relationships with customers and partners. Whether you’re seeking custom solutions, support, or just want to connect, our team is here for you. Feel free to reach out through the form below, and we will respond promptly to your inquiry.
            </p>
        </div>

        <!-- Contact Form -->
        <div class="contact-form">
            <input type="text" id="name" name="name" placeholder="Your Name" required>
            <input type="email" id="email" name="email" placeholder="Your Email" required>
            <input type="tel" id="phone" name="phone" placeholder="Your Phone Number" required>
            <textarea id="message" name="message" placeholder="Your Message" rows="6" required></textarea>
            <button type="submit">Send Message</button>
        </div>

        <!-- Map Section (Google Map Embed) -->
        <div class="map-section">
            <h2>Our Location</h2>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3809.849255465513!2d80.22466031479661!3d6.938408422245229!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae259fbbf3d570b%3A0x5fc5a4f05a57033a!2sPinthu%20Company!5e0!3m2!1sen!2slk!4v1608086321871!5m2!1sen!2slk"
                allowfullscreen="" loading="lazy"></iframe>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Winlion Company. All Rights Reserved.</p>
    </footer>

</body>

</html>
