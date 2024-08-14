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
                    <div class="slide"><img src="<%= request.getContextPath() %>/static/event/3/evimg1.jpg" alt="슬라이드 이미지 1"></div> 
                    <div class="slide"><img src="<%= request.getContextPath() %>/static/event/3/evimg2.jpg" alt="슬라이드 이미지 2"></div> 
                    <div class="slide"><img src="<%= request.getContextPath() %>/static/event/3/evimg3.jpg" alt="슬라이드 이미지 3"></div> 
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
            <div>예천 벅스 워터피아에서 시원한 여름나기!</div>
            <h2 class="h2">예천곤충축제</h2>
            <div class="event-info">
                <div class="event-dates">2024.08.15 ~ 2024.08.18</div>
            </div>
            <div class="description">
                대한민국 곤충 육성산업을 이끌어온 예천군은 올해 “곤충과 여름의 만남”이라는 주제로 무더운 여름을 시원하게 보낼 수 있는 2024 예천곤충축제를 준비했습니다. 어린 아이들부터 7080세대까지 전 연령층이 즐길 수 있는 이번 축제는 곤충생태관과 연계되어 곤충 체험 특화 프로그램, 어린이 특화 프로그램뿐 아니라 세대별 테마 공연, 물놀이장, 벅스흙탕싸움, 수상체험, 다양한 물 콘텐츠와 버블마켓, 야시장, 푸드트럭 등 다채로운 먹거리와 즐길거리로 준비되어 있다.
                <div class="more-content">
                    <br>
                    <p>[행사내용]
                        1. 어린이 행복 이벤트(4월~11월)<br>
                        - 입장 유아.어린이(25개월 ~ 초등) 동물먹이 1인 1매 교환권 증정<br>
                        <br>
                        2. 봉선화 시즌 운영<br>
                        - 봉선화. 서양 봉선화(산파첸스) 정원 관람<br>
                        - 봉선화 손톱 꽃물들이기 체험 : 봉선화 시즌 무료 이벤트<br>
                        - 로즈마리 식물 심기 : 10,000원<br>
                        - 향기압화목걸이 만들기 : 10,000원<br>
                        <br>
                        3. 상시 운영 체험<br>
                        - 레일썰매장 이용(유료)<br>
                        - 동물먹이주기 체험(유료)</p><br>
                </div>
                <button class="more" onclick="more(this)">더보기</button>
            </div>
        </div>
</body>
</html>
