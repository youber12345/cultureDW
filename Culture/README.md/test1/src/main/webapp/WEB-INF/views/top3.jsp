<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            <a href="<%= request.getContextPath() %>/top3" class="active">TOP3</a>
            <a href="<%= request.getContextPath() %>/homepage">행사정보</a>
            <a href="<%= request.getContextPath() %>/board">게시판</a>
            <a href="<%= request.getContextPath() %>/mypage">마이페이지</a>
        </nav>
        <div class="search-bar">
            <a href="<%= request.getContextPath() %>/loginpage"><img src="<%= request.getContextPath() %>/static/icon/login.png" alt="Login" width="50px" height="50px"></a>
        </div>
    </header>
    <main class="main-content">
        <button id="left-button"><img src="<%= request.getContextPath() %>/static/icon/backarrow.png" alt="Left Arrow"></button> <!-- 왼쪽 화살표 버튼 -->
        <section class="event-list">
            <div class="event-item" onclick="navigateToEvent('<%= request.getContextPath() %>/event1')">
                <img src="<%= request.getContextPath() %>/static/event/event1.png" alt="강릉 문화유산 야행">
                <div class="event-details">
                    <h3>강릉 문화유산 야행</h3>
                    <p>2024.08.15 - 2024.08.17</p>
                    <p>강원도 강릉시</p>
                </div>
            </div>
            <div class="event-item" onclick="navigateToEvent('<%= request.getContextPath() %>/event2')">
                <img src="<%= request.getContextPath() %>/static/event/event2.png" alt="서대문독립축제">
                <div class="event-details2">
                    <h3>서대문독립축제</h3>
                    <p>2024.08.13 ~ 2024.08.15</p>
                    <p>서울 서대문구</p>
                </div>
            </div>
            <div class="event-item" onclick="navigateToEvent('<%= request.getContextPath() %>/event3')">
                <img src="<%= request.getContextPath() %>/static/event/event3.jpg" alt="예천곤충축제">
                <div class="event-details">
                    <h3>예천곤충축제</h3>
                    <p>2024.08.15 ~ 2024.08.18</p>
                    <p>경상북도 예천군</p>
                </div>
            </div>
        </section>
        <button id="right-button"><img src="<%= request.getContextPath() %>/static/icon/rightarrow.png" alt="Right Arrow"></button> <!-- 오른쪽 화살표 버튼 -->
    </main>
</body>

</html>
