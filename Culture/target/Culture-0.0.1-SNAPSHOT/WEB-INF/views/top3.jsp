<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TOP3 축제</title>
    <link rel="icon" type="image/x-icon" href="<%= request.getContextPath() %>/static/logo/logo.png">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/topst.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <script src="<%= request.getContextPath() %>/static/js/topsrp.js"></script>
</head>

<body>
    <header>
        <div class="logo">
            <img src="<%= request.getContextPath() %>/static/logo/logo.png" alt="Logo" width="100px" height="100px">
        </div>
        <nav class="nav">
            <a href="<%= request.getContextPath() %>/top3" class="a1">TOP3</a>
            <a href="<%= request.getContextPath() %>/index">행사정보</a>
            <a href="<%= request.getContextPath() %>/place">맛집추천</a>
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
    <main class="main-content">
        <button id="left-button" class="arrow left-arrow">&#9664;</button>
        <section class="event-list">
<c:forEach var="event" items="${top3Events}">
    <div class="event-item" onclick="location.href='<%= request.getContextPath() %>/view?eventNum=${event.event_num}'">
        <img src="${event.event_poster}" alt="event_poster">
    </div>
</c:forEach>

   





        </section>
        <button id="right-button" class="arrow right-arrow">&#9654;</button>
    </main>
</body>

</html>
