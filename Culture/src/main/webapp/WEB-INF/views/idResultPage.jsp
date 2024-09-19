<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기 결과</title>
    <style>
        .result-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
            border-radius: 8px;
            text-align: center;
        }
        .result-container p {
            font-size: 18px;
            margin-bottom: 20px;
        }
        .result-container a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin-top: 10px;
        }
        .result-container a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="result-container">
        <h2>아이디 찾기 결과</h2>

        <!-- 서버에서 전달된 아이디 출력 -->
        <% if (request.getAttribute("foundId") != null) { %>
            <p>회원님의 아이디는 <strong><%= request.getAttribute("foundId") %></strong> 입니다.</p>
        <% } else { %>
            <p>아이디를 찾을 수 없습니다.</p>
        <% } %>

        <!-- 로그인 페이지로 이동 -->
        <a href="<%= request.getContextPath() %>/login">로그인 페이지로 이동</a>
    </div>
</body>
</html>
