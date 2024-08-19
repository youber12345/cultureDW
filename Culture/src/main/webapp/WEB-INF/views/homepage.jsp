%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*" %> <!-- SQL 관련 클래스 임포트 -->
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
</head>
<body>
    <header>
        <div class="logo">
            <img src="<%= request.getContextPath() %>/static/logo/logo.png" alt="Logo" width="100px" height="100px">
        </div>
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
            <%
                // 데이터베이스 연결 설정
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;
                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

                    // 이벤트 데이터 조회 (최대 6개만 가져옴)
                    String sql = "SELECT event_num, event_name, event_sdate, event_edate, event_address, event_poster FROM eventDB ORDER BY event_sdate DESC FETCH FIRST 6 ROWS ONLY";
                    stmt = conn.prepareStatement(sql);
                    rs = stmt.executeQuery();

                    while (rs.next()) {
                        int eventNum = rs.getInt("event_num");
                        String eventName = rs.getString("event_name");
                        String eventSDate = rs.getDate("event_sdate").toString();
                        String eventEDate = rs.getDate("event_edate").toString();
                        String eventAddress = rs.getString("event_address");
                        Blob posterBlob = rs.getBlob("event_poster");

                        // Blob 데이터를 Base64로 인코딩
                        byte[] posterBytes = posterBlob.getBytes(1, (int) posterBlob.length());
                        String base64Poster = java.util.Base64.getEncoder().encodeToString(posterBytes);
            %>
            <div class="event-item" onclick="window.location.href='<%= request.getContextPath() %>/event.jsp?eventNum=<%= eventNum %>'">
                <img src="data:image/jpeg;base64,<%= base64Poster %>" alt="Event Poster">
                <h3><%= eventName %></h3>
                <p><%= eventSDate %> ~ <%= eventEDate %></p>
                <p><%= eventAddress %></p>
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
            %>
        </div>
    </main>
</body>
</html>
