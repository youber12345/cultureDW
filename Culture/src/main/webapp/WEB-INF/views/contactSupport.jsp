<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>실시간 문의</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/contactSupport.css">
</head>
<body>
    <h1>실시간 문의</h1>
    <form action="<%= request.getContextPath() %>/submitInquiry" method="post">
        <textarea name="message" placeholder="문의 내용을 입력하세요"></textarea>
        <button type="submit">문의하기</button>
    </form>
</body>
</html>
