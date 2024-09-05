<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">
    <script src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=8e480e67209fc1cea057758a6f85f8c4"></script>
    <script src="<%= request.getContextPath() %>/static/js/kakaomap.js" defer></script>  
    <script src="<%= request.getContextPath() %>/static/js/imgslide.js" defer></script>
    </head>
    
<body>
    <!-- 세션에서 사용자 이름과 userId를 전달하기 위한 숨겨진 input 필드 -->
    <input type="hidden" id="username" value="${username}">
    <input type="hidden" id="sessionUserId" value="${sessionScope.userId}">
    <input type="hidden" id="userNum" value="${userNum}">

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
			        <a href="<%= request.getContextPath() %>/mypage">
			            <img src="<%= request.getContextPath() %>/static/icon/mypage.png" alt="MyPage" width="50px" height="50px">
			        </a>
			    </c:when>
			    <c:otherwise>
			        <a href="<%= request.getContextPath() %>/login">
			            <img src="<%= request.getContextPath() %>/static/icon/login.png" alt="Login" width="50px" height="50px">
			        </a>
			    </c:otherwise>
			</c:choose>

        </div>
    </header>

    <div class="container">
        <div class="content">
            <div class="description">
                <h2 class="h2">${event.event_name}</h2>
                <img class="event-poster" src="${event.event_poster}" alt="Event Poster">
                <div class="icons">
				<!-- 좋아요 아이콘 -->
				<img src="<%= request.getContextPath() %>/static/icon/blackfav.png" width="50px" height="50px"
				     onclick="toggleHeart(${event.event_num})" 
				     style="filter: ${isLiked ? 'grayscale(0%)' : 'grayscale(100%)'};"> ${likeCount}

                    <div><img src="<%= request.getContextPath() %>/static/icon/blackshare.png" width="50px" height="50px" onclick="share()"></div>
                    <div><img src="<%= request.getContextPath() %>/static/icon/blackchat.png" width="50px" height="50px" onclick="openCommentSection()"></div>
                </div>

                <div class="event-info">
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

                    <div class="event-dates">
                        <h2>행사 및 축제 기간</h2>
                        <div class="event-dates">
					    <h2>행사 및 축제 기간</h2>
					    <c:if test="${not empty event.event_sdate}">
					        <fmt:formatDate value="${event.event_sdate}" pattern="yyyy.MM.dd" /> ~
					    </c:if>
					    <c:if test="${not empty event.event_edate}">
					        <fmt:formatDate value="${event.event_edate}" pattern="yyyy.MM.dd" />
					    </c:if>
					    <br>행사 분류: ${event.event_tag}
						</div>

                    </div>

                    <div class="more-content">
                        <p class="t1">[행사내용]</p>
                        <div class="t2">
                            <div>연락처: ${event.event_ph}</div>
                            <div>금액: ${event.event_price}</div>
                            <div>사이트 주소: <a href="${event.event_homepage}">${event.event_homepage}</a></div>
                            <div>행사 주소: ${event.event_address}</div>
                        </div>
                        <!-- 문의하기 버튼 추가 -->
                        <div class="inquiry-button">
                            <button onclick="location.href='<%= request.getContextPath() %>/contactForm?eventId=${event.event_num}'">문의하기</button>
                        </div>
                        <p class="t1">위치</p>
                        <div id="map" data-lat="${event.event_lot}" data-lng="${event.event_lat}"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>
