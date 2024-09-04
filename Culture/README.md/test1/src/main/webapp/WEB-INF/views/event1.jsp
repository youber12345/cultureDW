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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Shantell+Sans:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">
    <script src="<%= request.getContextPath() %>/static/js/imgslide.js" defer></script>
</head>
<body>
    <header>
        <div class="logo"><img src="<%= request.getContextPath() %>/static/logo/logo.png" alt="Logo" width="100px" height="100px"></div>
        <nav class="nav">
            <a href="<%= request.getContextPath() %>top3">TOP3</a>
            <a href="<%= request.getContextPath() %>homepage" class="a1">행사정보</a>
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
                    <div class="slide"><img src="<%= request.getContextPath() %>/static/event/1/evimg1.jfif" alt="슬라이드 이미지 1"></div> 
                    <div class="slide"><img src="<%= request.getContextPath() %>/static/event/1/evimg2.jpg" alt="슬라이드 이미지 2"></div> 
                    <div class="slide"><img src="<%= request.getContextPath() %>/static/event/1/evimg3.jfif" alt="슬라이드 이미지 3"></div> 
                </div>
                <button class="prev" onclick="prevSlide()">&#10094;</button>
                <button class="next" onclick="nextSlide()">&#10095;</button>
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


            <div>강릉을 품은 천년의 관아, 강릉대도호부</div>
            <h2 class="h2">강릉 문화유산 야행</h2>
            <div class="event-info">
                <div class="event-dates">2024.08.15 ~ 2024.08.18</div>
            </div>
            <div class="description">
                강릉문화유산야행은 문화유산이 밀집된 거리를 중심으로 공연, 체험, 예술 등 다양한 활동을 제공함으로써 문화유산 활용도를 높이고, 문화유산의 의미와 가치 향유를 통해 보존가치를 증진하기 위한 프로그램이다. 강릉시는 2016년부터 국가유산청 문화유산야행사업에 함께하고 있다. 강릉문화유산야행은 매년 강릉대도호부관아와 서부시장 일원을 중심으로 펼쳐지며 밤을 테마로한 8가지 프로그램(야경, 야로, 야사, 야화, 야설, 야식, 야숙, 야시)이 준비되어있다. 각 프로그램은 볼거리, 먹거리, 즐길거리 등 특색있는 콘텐츠를 통하여 문화유산의 의미와 가치를 전달하고, 강릉시의 역사와 문화를 체험할 수 있는 기회를 제공한다.
                <div class="more-content">
                    <br>
                    <p>[행사내용]<br>
                        1. 메인프로그램 : 강릉문화유산야행 개막행사, 강릉의 멋, 한복패션쇼, 드론, 강릉문화유산 그리다, 전통시장연계 활성화 프로그램<br>
                        2. 부대프로그램 : 강릉단오제 '관노 가면극', 강릉농악, 방짜수저장, 강릉학산오독떼기, 강릉단오제 무속악공연<br>
                        3. 소비자 참여 프로그램 : 8개 푸드트럭 : 야식(夜食), 야행맥주거리, 강릉음식문화마켓, 달밤애버스킹, 반짝야행 : 쿠폰별<br>
                    </p>
                </div>
                <button class="more" onclick="more(this)">더보기</button>
            </div>
        </div>
    </div>
</body>
</html>
