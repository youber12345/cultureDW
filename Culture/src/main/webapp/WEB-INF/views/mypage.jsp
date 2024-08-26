<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calendar</title>
    <!-- CSS 파일 링크 -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/mypage.css">
    <!-- External JS 파일 링크 -->
    <script src="<%= request.getContextPath() %>/static/js/calendar.js" defer></script>
</head>
<body>
    <header>
        <!-- header content -->
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

            <div class="selected-date" id="selectedDate"></div>
        </div>
        <nav class="nav-right">
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
        </nav>
    </div>
</body>
</html>
