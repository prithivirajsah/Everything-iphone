<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/PrithiviAboutus.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/header.css"/>
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/Css/footer.css"/>
  
</head>
<body>

<!-- Header Include -->
	<jsp:include page="header.jsp"/>
	
	
	<div class="main"> 
    
        <table style="width: 100%;"> 
    <tr>
        <th style="width: 100%;">
            <h1 align="left" style="color: #8a8a8a; margin-left: 7%; font-size: 17px; margin-top: 10px; margin-bottom: 0;"> prithivi(); </h1>
        </th>
        <th class="list">
            <ul>
                <li>
                    <a href=".jsp"><button  class="port">About</button></a>
                </li>
                
                <li>
                    <a href="https://github.com/prithivirajsah"><img src="${pageContext.request.contextPath}/Resources/image/github.png" alt="Github" style="width: 25px; "></a>
                </li>
            </ul>
        </th>
    </tr>
</table>

        <hr style="width: 90%; background-color: #8a8a8a; height: 1px;">

        <div class="about" id="about">
            <div class="photo" style="background-image: url(${pageContext.request.contextPath}/Resources/image/prithvi.png);"></div>
            <div align="center">
                <h2 class="about-text"> Howdy!! </h2>
                <h2 class="about-text">It's me Prithivi Raj Sah.</h2>
                <h2 class="about-text" style="color: #FD8989;" id="typing-text"></h2>
                <h2 class="about-text">Welcome to my about section</h2>
            </div>
            
            <h1 style="margin-left: 7%;">Aboutme</h1>
            <hr width="90%">
            <p style="margin-left: 5%; margin-right: 5%;" >
                Hi,I am Prithivi Raj Shah a dedicated and proactive individual from Nepal.
                As a computing student from coding in languages like Java python to diving into database management and software development, 
                I've gained a wide range of skills to analyze problems and come up with creative solutions.
                I am passionate about technology and eager to become a tech expert 
                With a thirst for knowledge and a drive to succeed, I am committed to embracing the opportunities that come my way, 
                and I am enthusiastic about the journey ahead in the ever evolving world of technology
            </p>
            
                <h1 style="margin-left: 7%;">Skills</h1>
                <hr width="90%">
                <h1 style="font-size: 25PX; margin-left: 7%;">Expertise</h1>
                <div>
                    <ul class="tech_list">
                        <li>HTML</li>
                        <li>CSS</li>
                        <li>javascript</li>
                        <li>Java</li>
                        <li>python</li>
                    </ul>
                </div>
            <h1 style="font-size: 25px; margin-left:7%;">Tools</h1>
                <div>
                    <ul class="tech_list" style="margin-bottom: 90px;">
                        <li>Vs Code</li>
                        <li>My Sql</li>
                        <li>Github</li>
                        <li>Eclipse</li>
                        
                    </ul>
                </div>
        </div>
	</div>
	
	<!-- Footer Include -->
        <jsp:include page="footer.jsp"/>
</body>
</html>