<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory, org.apache.ibatis.session.SqlSession"%>
<%@ page import="mybatis.Event, mybatis.EventDAO, mybatis.MyBatisConfig"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		            <a href="<%= request.getContextPath() %>/login"><img src="<%= request.getContextPath() %>/static/icon/login.png" alt="Login" width="50px" height="50px"></a>
		        </c:otherwise>
		    </c:choose>
</div>
	
    </header>
    <div class="container">
        <div class="content">
            <!-- 이벤트 정보 출력 -->
            <img class="event-poster" src="${event.event_poster}" alt="Event Poster">
            <h2 class="h2">${event.event_name}</h2>
            <div class="event-info">
                <div class="event-dates">${event.event_sdate} ~ ${event.event_edate}</div>
            </div>
            <div class="icons">
		    <div><img src="<%= request.getContextPath() %>/static/icon/blackfav.png" width="30px" height="30px" onclick="toggleHeart(this)">    </div>
		    <div><img src="<%= request.getContextPath() %>/static/icon/blackshare.png" width="30px" height="30px" onclick="share()">    </div>
		    <div><img src="<%= request.getContextPath() %>/static/icon/blackchat.png" width="30px" height="30px" onclick="openCommentSection()">    </div>
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
            <div class="description">
                ${event.event_description}
                <div class="more-content">
                    <p>[행사내용]</p>
                    <ul>
                        <li>연락처: ${event.event_ph}</li>
                        <li>금액: ${event.event_price}</li>
                        <li>사이트 주소: <a href="${event.event_homepage}">${event.event_homepage}</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
