<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
</head>
<body>
    <h2>비밀번호 찾기</h2>
    <form action="<%= request.getContextPath() %>/findPassword" method="post">
        <label for="id">아이디</label>
        <input type="text" name="id" id="id" required>
        
        <label for="email">이메일</label>
        <input type="email" name="email" id="email" required>
        
        <button type="submit">비밀번호 찾기</button>
    </form>

    <% if (request.getAttribute("error") != null) { %>
        <div style="color: red;"><%= request.getAttribute("error") %></div>
    <% } %>
</body>
</html>
