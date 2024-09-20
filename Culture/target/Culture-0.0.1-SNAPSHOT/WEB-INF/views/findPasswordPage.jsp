<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/loginstyle.css">
</head>
<body>
<div class="logo-container">
            <img src="<%= request.getContextPath() %>/static/logo/logo.png" alt="Logo" width="100px" height="100px">
        </div>
    <div class="login-container">
    <h2>비밀번호 찾기</h2>
    <form class="login-form" action="<%= request.getContextPath() %>/findPassword" method="post">
        <label for="id">아이디</label><br>
        <input type="text" name="id" id="id" required><br>
        
        <label for="email">이메일</label><br>
        <input type="email" name="email" id="email" required><br>
        
        <button type="submit" class="login-btn">비밀번호 찾기</button>
    </form>

    <% if (request.getAttribute("error") != null) { %>
        <div style="color: red;"><%= request.getAttribute("error") %></div>
    <% } %>
    </div>
</body>
</html>
