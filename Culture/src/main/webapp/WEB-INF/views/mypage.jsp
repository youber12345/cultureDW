<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이 페이지</title>
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Shantell+Sans:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <!-- CSS 파일 링크 -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/mypage.css">

</head>
<body>
    <header>
        <div class="logo">
            <img src="<%= request.getContextPath() %>/static/logo/logo.png" alt="로고" width="100px" height="100px">
        </div>
        <nav class="nav">
            <a href="<%= request.getContextPath() %>/top3">TOP3</a>
            <a href="<%= request.getContextPath() %>/index">행사정보</a>
            <a href="<%= request.getContextPath() %>/board">게시판</a>
            <a href="<%= request.getContextPath() %>/mypage" class="a1">마이페이지</a>
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

    <div class="container">
        <div class="main">
            <div class="calendar">
                <div class="header">
                    <button onclick="prevMonth()">&#9664;</button>
                    <span id="currentMonth"></span>
                    <button onclick="nextMonth()">&#9654;</button>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th class="sunday">일</th>
                            <th>월</th>
                            <th>화</th>
                            <th>수</th>
                            <th>목</th>
                            <th>금</th>
                            <th class="saturday">토</th>
                        </tr>
                    </thead>
                    <tbody id="calendarBody">
                        <!-- 날짜가 동적으로 생성됩니다 -->
                    </tbody>
                </table>
            </div>
        </div>
        <div class="side-panel">
            <div class="user-info">
                <h2>${username}님</h2>
                <p>이메일: ${email}</p>
                <p>행사 관리자 여부: 
                    <c:choose>
                        <c:when test="${admin == 1}">관리자</c:when>
                        <c:otherwise>일반 사용자</c:otherwise>
                    </c:choose>
                </p>
                <div class="button-group">
                    <c:if test="${admin == 1}">
                        <button onclick="location.href='<%= request.getContextPath() %>/eventRegistration'">행사 등록하기</button>
                    </c:if>
                    <form action="<%= request.getContextPath() %>/logout" method="post">
                        <button type="submit">로그아웃</button>
                    </form>
                </div>
            </div>
            <div class="todo-list">
                <div id="selectedDate"></div>
                <h2>TO DO LIST</h2>
                <div id="todoContent">
                    <!-- 선택된 날짜의 TO DO LIST 내용이 동적으로 생성됩니다 -->
                </div>
            </div>
        </div>
    </div>
    <script src="<%= request.getContextPath() %>/static/js/calendar.js"></script>
</body>
</html>
