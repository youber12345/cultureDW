<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기 결과</title>
</head>
<body>
    <h2>비밀번호 찾기 결과</h2>

    <p>회원님의 비밀번호는 <strong><%= request.getAttribute("foundPassword") %></strong> 입니다.</p>
    
    <a href="<%= request.getContextPath() %>/login">로그인 페이지로 이동</a>
</body>
</html>
