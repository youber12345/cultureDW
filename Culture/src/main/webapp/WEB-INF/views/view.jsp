<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>축제 페이지</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/main.css">
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
            <a href="<%= request.getContextPath() %>/place">맛집추천</a>
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
                <img src="<%= request.getContextPath() %>/static/icon/heart.png" width="50px" height="50px"
                     onclick="toggleHeart(${event.event_num})"> ${likeCount}
                <div>
                    <img src="<%= request.getContextPath() %>/static/icon/blackshare.png" width="50px" height="50px" onclick="share()">
                </div>
                <div>
                    <img src="<%= request.getContextPath() %>/static/icon/blackchat.png" width="50px" height="50px" onclick="openCommentSection()">
                </div>
            </div>

            <div class="event-info">
                <div id="darkOverlay" class="dark-overlay"></div>

                <!-- 댓글 창 -->
                <div id="commentSection" class="comment-section">
                    <div class="comment-header">
                        <span>댓글</span>
                        <button onclick="closeCommentSection()" class="close-btn">X</button>
                    </div>

                    <!-- 댓글 목록 -->
                 <div class="comment-list" id="commentList">
					    <c:forEach var="comment" items="${comments}">
					        <div class="comment-item" id="comment-${comment.commentId}" style="margin-left: <c:out value="${comment.parentCommentId != null ? 20 : 0}"/>px;">
					            <p>${comment.comm}</p>
					            <span>작성자: ${comment.username}</span>
					            <c:if test="${not empty comment.createdAt}">
					                <span>작성일: <fmt:formatDate value="${comment.createdAt}" pattern="yy.MM.dd HH:mm:ss" /></span>
					            </c:if>
					            <c:if test="${comment.parentCommentId == null}"> <!-- Only show reply button for parent comments -->
					                <button onclick="reply(${comment.commentId})">답글 달기</button>
					            </c:if>
					        </div>
					    </c:forEach>
					</div>



                    <!-- 댓글 입력 -->
					<div class="comment-input">
					    <input type="text" id="commentInput" placeholder="댓글을 입력하세요...">
					    <button onclick="addComment(${event.event_num})">게시</button>
					</div>

                </div>
            </div>

            <div class="event-dates">
             <h2>
        	<img src="<%=request.getContextPath() %>/static/icon/calender.png" alt="cal" width="40px" height="40px" style="vertical-align: middle; margin-right: 8px;">
       			 행사 및 축제 기간
    		</h2>  
     		<c:if test="${not empty event.event_sdate}">
                    <fmt:formatDate value="${event.event_sdate}" pattern="yyyy.MM.dd" /> ~
                </c:if>
                <c:if test="${not empty event.event_edate}">
                    <fmt:formatDate value="${event.event_edate}" pattern="yyyy.MM.dd" />
                </c:if>
                <br>행사 분류: ${event.event_tag}
            </div>

            <div class="more-content">
                <p class="t1">[행사내용]</p>
                <div>
                <img src="<%=request.getContextPath() %>/static/icon/content.png" alt="content" width="30px" height="30px" style="vertical-align: middle; margin-right: 8px;">
                행사 소개: ${event.event_description}
                </div>
                <div class="t2">
                    <div>
                    <img src="<%=request.getContextPath() %>/static/icon/phone.png" alt="phone" width="40px" height="40px" style="vertical-align: middle; margin-right: 8px;">
                    연락처: ${event.event_ph}
                    </div>
                    <div>
                    <img src="<%=request.getContextPath() %>/static/icon/coin.png" alt="coin" width="40px" height="40px" style="vertical-align: middle; margin-right: 8px;">
                    금액: ${event.event_price}
                    </div>
                    <div> 
                    <img src="<%=request.getContextPath() %>/static/icon/browser.png" alt="coin" width="40px" height="40px" style="vertical-align: middle; margin-right: 8px;">
                    사이트 주소: <a href="${event.event_homepage}">${event.event_homepage}</a>
                    </div>
                    <div>
                     <img src="<%=request.getContextPath() %>/static/icon/mark.png" alt="mark" width="40px" height="40px" style="vertical-align: middle; margin-right: 8px;">
                     행사 주소: ${event.event_address}
                    </div>
                </div>

         


                <p class="t1">위치</p>
                <div id="map" data-lat="${event.event_lot}" data-lng="${event.event_lat}"></div>
            </div>
        </div>
    </div>
</div>

    
</body>
</html>
