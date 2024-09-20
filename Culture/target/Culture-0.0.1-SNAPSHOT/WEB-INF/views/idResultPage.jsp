<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기 결과</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/loginstyle.css">
</head>
<body>
    <div class="login-container">
        <h2>아이디 찾기 결과</h2><br>

        <!-- 서버에서 전달된 아이디 출력 -->
        <% if (request.getAttribute("foundId") != null) { %>
            <p>회원님의 아이디는 <strong><%= request.getAttribute("foundId") %></strong> 입니다.</p><br>
        <% } else { %>
            <p>아이디를 찾을 수 없습니다.</p>
        <% } %>

        <!-- 로그인 페이지로 이동 -->
        <a href="<%= request.getContextPath() %>/login">로그인 페이지로 이동</a><br>
    </div>
</body>
</html>
