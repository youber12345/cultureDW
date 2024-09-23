<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>맛집 추천</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/restaurant.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/main.css">
    <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=dee41a720006637a3ef43799720ec190&autoload=false&libraries=clusterer,services"></script>
    <script src="<%= request.getContextPath() %>/static/js/restaurant.js" defer></script>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Shantell+Sans:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">
 	<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    
</head>
<body>
    <header>
        <div class="logo">
            <img src="<%= request.getContextPath() %>/static/logo/logo.png" alt="Logo" width="100px" height="100px">
        </div>
        <nav class="nav">
            <a href="<%= request.getContextPath() %>/top3">TOP3</a>
            <a href="<%= request.getContextPath() %>/index">행사정보</a>
            <a href="<%= request.getContextPath() %>/place" class="a1">맛집추천</a>
            <a href="<%= request.getContextPath() %>/mypage">마이페이지</a>
        </nav>
        <div class="search-bar">
            <c:choose>
			    <c:when test="${not empty sessionScope.userId}">
			        <a href="<%= request.getContextPath() %>/mypage">
			            <img src="<%= request.getContextPath() %>/static/icon/mypage.png" alt="MyPage" width="50px" height="50px">
			        </a>
			    </c:when>
			    <c:otherwise>
			        <a href="<%= request.getContextPath() %>/login">
			            <img src="<%= request.getContextPath() %>/static/icon/login.png" alt="Login" width="50px" height="50px">
			        </a>
			    </c:otherwise>
			</c:choose>

        </div>
    </header>
    <main>
        <div id="map" style="width:100%; height:1000px;"></div>
        <div class="restaurant-list">
            <c:forEach var="restaurant" items="${restaurants}">
                <div class="restaurant-item">
                    <h2>${restaurant.name}</h2>
                    <p>주소: ${restaurant.address}</p>
                </div>
            </c:forEach>
        </div>
    </main>
</body>
</html>
