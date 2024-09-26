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
    
    <!-- Google Fonts 추가 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">

    <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=dee41a720006637a3ef43799720ec190&autoload=false&libraries=clusterer,services"></script>
    <script src="<%= request.getContextPath() %>/static/js/restaurant.js" defer></script>
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
                    <a href="<%= request.getContextPath() %>/mypage"><img src="<%= request.getContextPath() %>/static/icon/mypage.png" alt="MyPage" width="50px" height="50px"></a>
                </c:when>
                <c:otherwise>
                    <a href="<%= request.getContextPath() %>/login"><img src="<%= request.getContextPath() %>/static/icon/login.png" alt="Login" width="50px" height="50px"></a>
                </c:otherwise>
            </c:choose>
        </div>
    </header>

    <main>
        <!-- 지도 리스트를 카드 형태로 나열 -->
        <div class="map-list">
            <c:forEach var="event" items="${top3Events}">
                <div class="map-item">
                    <h2>${event.event_name} 근처 맛집</h2>
                    <div id="map-${event.event_num}" class="map"
                         data-event-num="${event.event_num}"
                         data-event-name="${event.event_name}"
                         data-event-lat="${event.event_lat}"
                         data-event-lot="${event.event_lot}"></div>
                </div>
            </c:forEach>
        </div>
    </main>

    <footer class="footer">
        <div class="footer-top">
            <a href="#">서비스 이용 약관</a>
            <a href="#">개인정보 처리방침</a>
            <a href="#">고객센터</a>
            <a href="#">마케팅 수신 동의</a>
        </div>
        <div class="footer-bottom">
            <p>Copyright 2024. All rights reserved.</p>
            <p>이 사이트의 모든 콘텐츠는 저작권법의 보호를 받습니다. 무단 복제, 배포를 금지합니다.</p>
        </div>
    </footer>
</body>
</html>
