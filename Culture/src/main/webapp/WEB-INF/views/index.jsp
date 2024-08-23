<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory, org.apache.ibatis.session.SqlSession" %>
<%@ page import="mybatis.Event, mybatis.EventDAO, mybatis.MyBatisConfig, mybatis.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>서울 이벤트 & 맛집 탐방</title>
    <link rel="icon" type="image/x-icon" href="<%= request.getContextPath() %>/static/logo/logo.png">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Shantell+Sans:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">
    
</head>
<body>
    <header>
        <div class="logo">
            <img src="<%= request.getContextPath() %>/static/logo/logo.png" alt="Logo" width="100px" height="100px">
        </div>
        <nav class="nav">
            <a href="<%= request.getContextPath() %>/top3">TOP3</a>
            <a href="<%= request.getContextPath() %>/index" class="a1">행사정보</a>
            <a href="<%= request.getContextPath() %>/board">게시판</a>
            <a href="<%= request.getContextPath() %>/mypage">마이페이지</a>
        </nav>
        <div class="search-bar">
            <c:choose>
                <c:when test="${not empty sessionScope.userId}">
                    <a href="<%= request.getContextPath() %>/mypage"><img src="<%= request.getContextPath() %>/static/icon/mypage.png" alt="MyPage" width="50px" height="50px"></a>
                </c:when>
                <c:otherwise>
                    <a href="<%= request.getContextPath() %>/loginpage"><img src="<%= request.getContextPath() %>/static/icon/login.png" alt="Login" width="50px" height="50px"></a>
                </c:otherwise>
            </c:choose>
        </div>
    </header>
    <main class="main-content">
    <div class="filter-bar">
        <select>
            <option>카테고리</option>
            <option>문화</option>
            <option>예술</option>
            <option>공연</option>
            <option>전시</option>
        </select>
        <select>
            <option>지역</option>
            <option>서울</option>
            <option>경기</option>
            <option>강원</option>
            <option>충청</option>
            <option>전라</option>
            <option>경상</option>
            <option>제주</option>
        </select>
        <input class="search-time" type="datetime-local" placeholder="시기">
        <button class="search-btn">검색</button>
    </div>

    <div class="event-list">
        <c:forEach var="ce" items="${list}">
            <div class="event-item" onclick="location.href='<%= request.getContextPath() %>/view?eventNum=${ce.event_num}'">
                <img src="${ce.event_poster}" alt="Event Poster">
                <h3>${ce.event_name}</h3>
                <p>${ce.event_sdate} ~ ${ce.event_edate}</p>
                <p>${ce.event_description}</p>
            </div>
        </c:forEach>
    </div>
</main>
</body>
</html>
