<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/main.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/loginstyle.css">
</head>
<body>
	<div class="logo-container">
            <img src="<%= request.getContextPath() %>/static/logo/logo.png" alt="Logo" width="100px" height="100px">
        </div>
    <div class="login-container">
        <h2>아이디 찾기</h2>
        <!-- 아이디 찾기 폼 -->
        <form class="login-form" action="<%= request.getContextPath() %>/findId" method="post">
            <label for="email">이메일</label><br>
            <input type="email" id="email" name="email" placeholder="이메일을 입력하세요" required><br>

            <label for="phone">휴대폰 번호</label><br>
            <input type="text" id="phone" name="phone" placeholder="휴대폰 번호를 입력하세요" required><br>
			<br>
            <button type="submit" class="login-btn">아이디 찾기</button>
        </form>

        <!-- 에러 메시지 표시 -->
        <% if (request.getAttribute("error") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
    </div>
</body>
</html>
