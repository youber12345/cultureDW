<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <script>
        function event1() {
            window.location.href = '<%= request.getContextPath() %>event1';
        }
        function event2() {
            window.location.href = '<%= request.getContextPath() %>event2';
        }
        function event3() {
            window.location.href = '<%= request.getContextPath() %>event3';
        }
    </script>
</head>
<body>
    <header>
        <div class="logo">
            <img src="<%= request.getContextPath() %>/static/logo/logo.png" alt="Event 1" width="100px" height="100px">
        </div>
        <nav class="nav">
            <a href="<%= request.getContextPath() %>top3">TOP3</a>
            <a href="<%= request.getContextPath() %>homepage" class="a1">행사정보</a>
            <a href="<%= request.getContextPath() %>board">게시판</a>
            <a href="<%= request.getContextPath() %>mypage">마이페이지</a>
        </nav>
        <div class="search-bar">
            <a href="<%= request.getContextPath() %>loginpage"><img src="<%= request.getContextPath() %>/static/icon/login.png" alt="Event 1" width="50px" height="50px"></a>
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
            <div class="event-item" onclick="event1()">
                <img src="<%= request.getContextPath() %>/static/event/event1.png" alt="Event 1">
                <div class="event-details">
                    <h3>강릉 문화유산 야행</h3>
                    <p>2024.08.15 - 2024.08.17</p>
                    <p>강원도 강릉시</p>
                </div>
            </div>
            <div class="event-item" onclick="event2()">
                <img src="<%= request.getContextPath() %>/static/event/event2.png" alt="Event 2">
                <div class="event-details">
                    <h3>서대문독립축제</h3> 
                    <p>2024.08.13 ~ 2024.08.15</p>
                    <p>서울 서대문구</p>
                </div>
            </div>
            <div class="event-item" onclick="event3()">
                <img src="<%= request.getContextPath() %>/static/event/event3.jpg" alt="Event 3">
                <div class="event-details">
                    <h3>예천곤충축제</h3>
                    <p>2024.08.15 ~ 2024.08.18</p>
                    <p>경상북도 예천군</p>
                </div>
            </div>
            <!-- 추가 이벤트 아이템 -->
            
        </div>
    </main>
</body>
</html>
