<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>축제 문의하기 - 채팅</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        function sendMessage() {
            var message = document.getElementById("messageInput").value;
            var eventId = document.getElementById("eventId").value;

            $.post("/sendMessage", {
                message: message,
                eventId: eventId
            }, function(data) {
                if (data.success) {
                    document.getElementById("chatMessages").innerHTML += "<p>나: " + message + "</p>";
                } else {
                    alert("메시지 전송 실패: " + data.error);
                }
            });
        }

        function receiveMessage() {
            var eventId = document.getElementById("eventId").value;

            $.post("/receiveMessage", {
                eventId: eventId
            }, function(data) {
                if (data.success) {
                    document.getElementById("chatMessages").innerHTML += "<p>관리자: " + data.messages + "</p>";
                }
            });
        }

        // 메시지 수신 주기적으로 요청
        setInterval(receiveMessage, 5000);
    </script>
</head>
<body>
    <h2>축제 문의하기</h2>
    <div id="chatMessages"></div>
    <input type="hidden" id="eventId" value="${eventId}">
    <input type="text" id="messageInput" placeholder="메시지를 입력하세요...">
    <button onclick="sendMessage()">전송</button>
</body>
</html>
