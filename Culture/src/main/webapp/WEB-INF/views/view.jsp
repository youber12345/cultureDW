<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory, org.apache.ibatis.session.SqlSession"%>
<%@ page import="mybatis.Event, mybatis.EventDAO, mybatis.MyBatisConfig, mybatis.EventService"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>축제 페이지</title>
    <link rel="icon" type="image/x-icon" href="<%= request.getContextPath() %>/static/logo/logo.png">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/view.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Shantell+Sans:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">
    <script src="<%= request.getContextPath() %>/static/js/imgslide.js" defer></script>
</head>
<body>
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
            <a href="<%= request.getContextPath() %>/loginpage">
                <img src="<%= request.getContextPath() %>/static/icon/login.png" alt="Login" width="50px" height="50px">
            </a>
        </div>
    </header>

	<div class="event-poster-container">
   				<img src="${event.event_poster}" alt="Event Poster">
				</div>
    <div class="container">
        <div class="content">
            <!-- 이벤트 정보 출력 -->
            <%
                // 이벤트 ID를 파라미터로 받아옴
                String eventIdParam = request.getParameter("eventId");
                int eventId = 0;
                if (eventIdParam != null) {
                    eventId = Integer.parseInt(eventIdParam);
                }

                // MyBatis 설정 및 서비스 초기화
                EventDAO eventDAO = new EventDAO(MyBatisConfig.getSqlSessionFactory());
                EventService eventService = new EventService(eventDAO);

                // 이벤트 데이터 가져오기
                Event event = eventService.getEventById(eventId);

            %>
				
            <div>
                
                <h2 class="h2">${event.event_name}</h2>
                <div class="event-info">
                    <div class="event-dates">${event.event_sdate} ~ ${event.event_edate}</div>
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
    </div>
</body>
</html>
