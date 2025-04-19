<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Research - Everything iPhone</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/research.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/header.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/footer.css"/>
</head>
<body>

  <jsp:include page="header.jsp"/>

  <section class="research-header">
    <div class="textbox">
      <h1>Research</h1>
      <p>Ideas and inspirations behind Everything iPhone's design</p>
    </div>
  </section>

  <section class="research-content">
    <div class="box">
      <div class="website">
        <img src="../Resources/image/sabkophone.jpg" alt="SabkoPhone">
        <h2>Sabkophone layout</h2>
        <p>For the home page we got inspired from SabkoPhone website and we implemented this.</p>
        <div class="reference">
          Visit: <a href="https://sabkophone.com/" target="_blank" class="reflink">sabkophone.com</a>
        </div>
      </div>
    </div>

    <div class="box">
      <div class="website">
        <img src="../Resources/image/trustpilot.png" alt="TrustPilot">
        <h2>Customer Review Format</h2>
        <p>We used TrustPilot review layout as a reference. Each review is wrapped in a card, with text and star ratings styled using custom CSS.</p>
        <div class="reference">
          Visit: <a href="https://www.trustpilot.com/" target="_blank" class="reflink">trustpilot.com</a>
        </div>
      </div>
    </div>

    <div class="box">
      <div class="website">
        <img src="../Resources/image/evostore.jpg" alt="Evo Store">
        <h2>Product Grid Inspiration</h2>
        <p>The product listing grid was inspired by Evo Store’s clean spacing and structure. I customized it for better responsiveness.</p>
        <div class="reference">
          Visit: <a href="https://www.evostore.com.np" target="_blank" class="reflink">evostore.com.np</a>
        </div>
      </div>
    </div>
  </section>

  <jsp:include page="footer.jsp" />

</body>
</html>
