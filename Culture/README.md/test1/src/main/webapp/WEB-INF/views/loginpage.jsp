<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/loginstyle.css">
    <script src="<%=request.getContextPath()%>/static/js/user.js"></script>
    <title>로그인 페이지</title>
</head>
<body>
    <main>
        <div class="login-container">
            <div class="logo">
                <img src="<%= request.getContextPath() %>/static/logo/logo.png" onclick="background()" alt="Logo" width="100px" height="100px">
            </div>
            <h3>로그인 후 다양한 서비스를 이용해 보세요.</h3>
            <br>
            <% if (request.getAttribute("error") != null) { %>
                <div class="error-message" style="color:red;">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>
            <form class="login-form" action="<%= request.getContextPath() %>login" method="post">
                <input type="text" name="id" placeholder="아이디">
                <input type="password" name="password" placeholder="비밀번호">
                <div class="login-options">
                    <label><input type="checkbox"> 아이디 저장</label>
                    <span class="security">보안접속 ON</span>
                </div>
                <button type="submit" class="login-btn">로그인</button>
            </form>
            <div class="links">
                <a href="signup">회원가입</a>
                <a href="#">아이디 찾기</a>
                <a href="#">비밀번호 찾기</a>
            </div>
            <div class="slider">
                <div class="slides">
                    <div class="slide"><img src="<%=request.getContextPath()%>/static/event/example.png" width="500px" height="200px"></div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
