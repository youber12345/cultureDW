<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>축제 페이지</title>
    <link rel="icon" type="image/x-icon" href="<%= request.getContextPath() %>/static/logo/logo.png">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/feststyle.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Shantell+Sans:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">
    <script src="<%= request.getContextPath() %>/static/js/imgslide.js" defer></script>
</head>
<body>
    <header>
        <div class="logo"><img src="<%= request.getContextPath() %>/static/logo/logo.png" alt="Logo" width="100px" height="100px"></div>
        <nav class="nav">
            <a href="<%= request.getContextPath() %>top3">TOP3</a>
            <a href="<%= request.getContextPath() %>index" class="a1">행사정보</a>
            <a href="<%= request.getContextPath() %>board">게시판</a>
            <a href="<%= request.getContextPath() %>mypage">마이페이지</a>
        </nav>
        <div class="search-bar">
            <a href="<%= request.getContextPath() %>loginpage"><img src="<%= request.getContextPath() %>/static/icon/login.png" alt="Login" width="50px" height="50px"></a>
        </div>
    </header>
    <div class="container">
        <div class="content">
            <div class="slider">
                <div class="slides">
                    <div class="slide"><img src="<%= request.getContextPath() %>/static/event/3/evimg1.jpg" alt="슬라이드 이미지 1"></div> 
                    <div class="slide"><img src="<%= request.getContextPath() %>/static/event/3/evimg2.jpg" alt="슬라이드 이미지 2"></div> 
                    <div class="slide"><img src="<%= request.getContextPath() %>/static/event/3/evimg3.jpg" alt="슬라이드 이미지 3"></div> 
                </div>
                <button class="prev" onclick="prevSlide()">&#10094;</button>
                <button class="next" onclick="nextSlide()">&#10095;</button>
            </div>
            <div class="icons">
                <div><img src="<%= request.getContextPath() %>/static/icon/blackfav.png" width="30px" height="30px" onclick="toggleHeart(this)"></div>
                <div><img src="<%= request.getContextPath() %>/static/icon/blackshare.png" width="30px" height="30px" onclick="share()"></div>
                <div><img src="<%= request.getContextPath() %>/static/icon/blackchat.png" width="30px" height="30px" onclick="openCommentSection()"></div>
            </div>
            
            <!-- 어두운 배경 레이어 -->
            <div id="darkOverlay" class="dark-overlay"></div>
            
            <!-- 댓글 창 -->
            <div id="commentSection" class="comment-section">
                <div class="comment-header">
                    <span>댓글</span>
                    <button onclick="closeCommentSection()" class="close-btn">X</button>
                </div>
                <div class="comment-list" id="commentList">
                    <!-- 댓글 목록이 여기에 추가됩니다 -->
                </div>
                <div class="comment-input">
                    <input type="text" id="commentInput" placeholder="댓글을 입력하세요...">
                    <button onclick="addComment()">게시</button>
                </div>
            </div>

            <!-- 이벤트 정보 출력 부분 -->
            
            <div>행사 문구</div>
            <!-- 제목 -->
            <h2 class="h2">${gc.eventName}</h2>
            <!-- 행사 날짜 -->
            <div class="event-info">
                <div class="event-dates">${gc.eventSDate} ~ ${gc.eventEDate}</div>
            </div>
            <!-- 행사 설명 및 상세 정보 -->
            <div class="description">
               ${gc.eventDescription}
                <div class="more-content">
                    <br>
                    <p>[행사내용]
                        1. 연락처: ${gc.eventPhone}<br>
                        <br>
                        2. 금액: ${gc.eventPrice}<br>
                        <br>
                        3. 사이트주소: <a href="${gc.eventHomepage}"></a>
                    </p><br>
                </div>
                <button class="more" onclick="more(this)">더보기</button>
            </div>
       
        </div>
    </div>
</body>
</html>
