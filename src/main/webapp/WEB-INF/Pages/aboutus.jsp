<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<meta name="Author" content="Prithvi">
    <meta http-equiv="refresh" content="120">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/Css/about us.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/Header.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/Footer.css"/>
</head>
<body>
<!-- Header Include -->
	<jsp:include page="header.jsp"/>
	
	
	   <div class="main-container">
        <div class="card">
            <h1>About Us</h1>
            <img class="image-banner" src="https://cdn.gadgetbytenepal.com/wp-content/uploads/2024/08/iPhone-16-Pro-Max-Price-in-Nepal-1.jpg" alt="Team Photo">

            <p>At <strong>Everything iPhone</strong>, we are dedicated to exploring the world of iPhones — from the latest models to timeless classics. The iPhone isn't just a smartphone; it's a symbol of innovation, simplicity, and elegance. Since its launch in 2007, the iPhone has revolutionized how we communicate, create, and connect.</p>

            <p>Our platform provides guides, accessories, and real human support to help every iPhone user get the most out of their device.</p>

            <h2>What We Offer</h2>
            <ul>
                <li>In-depth guides for beginners and experts</li>
                <li>Step-by-step tutorials for setup and hidden iOS features</li>
                <li>Honest product reviews (iPhones, MagSafe, chargers, etc.)</li>
                <li>Comparison tools for informed upgrade decisions</li>
                <li>Battery optimization, gestures, privacy, and shortcut tips</li>
                <li>iOS news and update alerts</li>
                <li>Real human support — no bots, just passionate tech lovers</li>
            </ul>
        </div>
    </div>
    
<!-- Footer Include -->
	<jsp:include page="footer.jsp"/>      
</body>
</html>