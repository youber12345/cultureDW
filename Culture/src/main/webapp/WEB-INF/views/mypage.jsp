<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/styles.css">
    <style>
        .user-info {
            border: 2px solid #000;
            border-radius: 10px;
            padding: 20px;
            width: 300px;
            margin: 0 auto;
            text-align: center;
            font-size: 20px;
        }
        .user-info h2 {
            font-size: 30px;
            margin-bottom: 10px;
        }
        .button-group {
            margin-top: 20px;
        }
        .button-group button {
            margin: 5px;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }
        .calendar {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="user-info">
    <h2>${username}님</h2>
    <p>이메일: ${email}</p>
    <p>행사 관리자 여부: 
        <c:choose>
            <c:when test="${admin == 1}">관리자</c:when>
            <c:otherwise>일반 사용자</c:otherwise>
        </c:choose>
    </p>
    <div class="button-group">
        <c:if test="${admin == 1}">
            <button onclick="location.href='<%= request.getContextPath() %>/eventRegistration'">행사 등록하기</button>
        </c:if>
        <form action="<%= request.getContextPath() %>/logout" method="post">
            <button type="submit">로그아웃</button>
        </form>
    </div>
</div>

   
</body>
</html>
