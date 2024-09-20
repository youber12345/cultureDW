<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory, org.apache.ibatis.session.SqlSession" %>
<%@ page import="DTO.Event,DAO.EventDAO, mybatis.MyBatisConfig, mybatis.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이벤트 검색 결과</title>
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
            <a href="<%= request.getContextPath() %>/place">맛집추천</a>
            <a href="<%= request.getContextPath() %>/mypage">마이페이지</a>
        </nav>
    </header>

    <main class="main-content">
        <h1>이벤트 검색 결과</h1>

        <!-- 검색 필터 유지 -->
        <form action="${pageContext.request.contextPath}/searchEvent" method="get">
            <div class="filter-bar">
                <select name="event_tag">
                    <option value="">카테고리</option>
                    <option value="공연/콘서트" <c:if test="${param.event_tag == '공연/콘서트'}">selected</c:if>>공연/콘서트</option>
                    <option value="교육/체험" <c:if test="${param.event_tag == '교육/체험'}">selected</c:if>>교육/체험</option>
                    <option value="전시/미술" <c:if test="${param.event_tag == '전시/미술'}">selected</c:if>>전시/미술</option>
                    <option value="축제" <c:if test="${param.event_tag == '축제'}">selected</c:if>>축제</option>
                    <option value="기타" <c:if test="${param.event_tag == '기타'}">selected</c:if>>기타</option>
                </select>
                <select name="region">
                    <option value="">지역</option>
                    <option value="서울" <c:if test="${param.region == '서울'}">selected</c:if>>서울</option>
                    <option value="경기" <c:if test="${param.region == '경기'}">selected</c:if>>경기</option>
                    <option value="강원" <c:if test="${param.region == '강원'}">selected</c:if>>강원</option>
                    <!-- 지역 옵션 추가 -->
                </select>
                <input class="search-time" type="datetime-local" name="search_time" value="${param.search_time}" placeholder="시기">
                <button class="search-btn" type="submit">검색</button>
            </div>
        </form>

        <!-- 검색된 이벤트 출력 -->
        <div class="event-list">
            <c:if test="${not empty list}">
                <c:forEach var="ce" items="${list}">
                    <div class="event-item" onclick="location.href='<%= request.getContextPath() %>/view?eventNum=${ce.event_num}'">
                        <img src="${ce.event_poster}" alt="Event Poster">
                        <h3>${ce.event_name}</h3>
                        <fmt:formatDate value="${ce.event_sdate}" pattern="yyyy.MM.dd" /> ~
                        <fmt:formatDate value="${ce.event_edate}" pattern="yyyy.MM.dd" /> 
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty list}">
                <p>검색 결과가 없습니다.</p>
            </c:if>
        </div>
    </main>
</body>
</html>
