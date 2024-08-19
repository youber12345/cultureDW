<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*" %>
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
            <!-- 이벤트 정보 출력 부분 -->
            <%
                // URL에서 eventNum 파라미터를 가져옴
                String eventNumStr = request.getParameter("eventNum");
                if (eventNumStr != null) {
                    int eventNum = Integer.parseInt(eventNumStr);

                    // 데이터베이스 연결 및 이벤트 정보 가져오기
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;
                    try {
                        // Oracle JDBC 드라이버 로드 및 데이터베이스 연결
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

                        // eventDB 테이블에서 특정 이벤트 정보 조회
                        String sql = "SELECT event_name, event_sdate, event_edate, event_description, event_ph, event_price, event_homepage FROM eventDB WHERE event_num = ?";
                        stmt = conn.prepareStatement(sql);
                        stmt.setInt(1, eventNum);
                        rs = stmt.executeQuery();

                        if (rs.next()) {
                            String eventName = rs.getString("event_name");
                            String eventSDate = rs.getDate("event_sdate").toString();
                            String eventEDate = rs.getDate("event_edate").toString();
                            String eventDescription = rs.getString("event_description");
                            String eventPhone = rs.getString("event_ph");
                            String eventPrice = rs.getString("event_price");
                            String eventHomepage = rs.getString("event_homepage");
            %>
            <div>행사 문구</div>
            <!-- 제목 -->
            <h2 class="h2"><%= eventName %></h2>
            <!-- 행사 날짜 -->
            <div class="event-info">
                <div class="event-dates"><%= eventSDate %> ~ <%= eventEDate %></div>
            </div>
            <!-- 행사 설명 및 상세 정보 -->
            <div class="description">
                <%= eventDescription %>
                <div class="more-content">
                    <br>
                    <p>[행사내용]
                        1. 연락처: <%= eventPhone %><br>
                        <br>
                        2. 금액: <%= eventPrice %><br>
                        <br>
                        3. 사이트주소: <a href="<%= eventHomepage %>"><%= eventHomepage %></a>
                    </p><br>
                </div>
                <button class="more" onclick="more(this)">더보기</button>
            </div>
            <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                } else {
                    out.println("<p>이벤트 번호가 제공되지 않았습니다.</p>");
                }
            %>
        </div>
    </div>
</body>
</html>
