<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/Css/contactus.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/Css/Header.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/Footer.css"/>
</head>
<body>
<jsp:include page="header.jsp"/>

	<div class="container">
		<main class="row">
			<!--Left Section (Column) Starts-->

			<section class="col left">

				<!--Title Starts-->
				<div class="contactTitle">
					<h1>Get In Touch</h1>

				</div>
				<!--Title Ends-->

				<!--Contact Info Starts-->
				<div class="contactInfo">

					<div class="iconGroup">
						<div class="icon">
							<img class="icon"
								src="${pageContext.request.contextPath}/Resources/image/Phone.png"
								
								alt="Phone">
						</div>

						<div class="details">
							<span>Phone</span> <span>+977 9815836412</span>
						</div>
					</div>

					<div class="iconGroup">
						<div class="icon">
							<img class="icon"
								src="${pageContext.request.contextPath}/Resources/image/mail.png"
								alt="Gmail">
						</div>

						<div class="details">
							<span>Email</span> <span>Prithivirajsah584@gmail.com</span>
						</div>
					</div>

					<div class="iconGroup">
						<div class="icon">
							<img class="icon"
								src="${pageContext.request.contextPath}/Resources/image/location.png"
								alt="Location">
						</div>

						<div class="details">
							<span>Location</span> <span>Jhamsikhel, Kathmandu</span>
						</div>
					</div>
				</div>
				<!--Contact Info Ends-->

				<!--Social Media Starts-->
				<div class="social-links">
					<a href="https://www.facebook.com/profile.php?id=100084882249955&mibextid=gik2fB">
						<img class="icon" src="${pageContext.request.contextPath}/Resources/image/facebook.png" alt="facebook">
					</a> 

					<a href="https://www.instagram.com/prithivirajsah1?igsh=YWtncHBibzU4bml5">
						<img class="icon" src="${pageContext.request.contextPath}/Resources/image/instagram.png" alt="instagram">
					</a> 

					<a href="https://www.linkedin.com/in/prithivirajsah-bb4314297?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app">
						<img class="icon" src="${pageContext.request.contextPath}/Resources/image/linkdein.png" alt="linkdein">
					</a>
				</div>


			</section>
			<!--Left Section (Column) Ends-->
			
			<!--Right Section (Column) Starts-->
			<section class="col right">
			
				<!--Form Starts-->
				<form class="messageForm">
					<div class="inputGroup halfWidth">
						<input type="text" required="required"> <label>Your Name</label>
					</div>

					<div class="inputGroup halfWidth">
						<input type="email" required="required"> <label>Email</label>
					</div>

					<div class="inputGroup fullWidth">
						<input type="text" required="required"> <label>Subject</label>
					</div>

					<div class="inputGroup fullWidth">
						<textarea required="required"></textarea>
						<label>Say Something</label>
					</div>

					<div class="inputGroup fullWidth">
						<button>Send Message</button>
					</div>
				</form>
				<!--Form Ends-->
				
			</section>
			<!--Right Section (Column) Ends-->
			
		</main>
	</div>
	
	<!-- Footer Include -->
	<jsp:include page="footer.jsp" />
</body>
</html>