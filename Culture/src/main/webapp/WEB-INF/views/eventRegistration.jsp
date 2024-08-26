<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Event Registration</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/signup.css">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Shantell+Sans:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">
    <script>
    function validateForm(event) {
        // 임시로 검증 로직 비활성화
        return true; // 무조건 폼 제출
        console.log("Event Name:", eventName);
        console.log("Event Start Date:", eventStartDate);

    }


        function backToHome() {
            window.location.href = '<%=request.getContextPath()%>/';
        }
    </script>
</head>
<body>
    <div class="logo">
        <img src="<%=request.getContextPath()%>/static/logo/logo.png" alt="Logo" onclick="backToHome()">
    </div>
    <div class="signup-container">
        <div class="form-container">
            <h2>이벤트 등록</h2>
            <!-- MyBatis를 사용하여 이벤트 데이터를 처리하는 폼 -->
            <form action="<%=request.getContextPath()%>/eventProcess" method="post">
                <div class="input-group">
                    <label for="eventName">이벤트 이름</label>
                    <div class="input-wrapper">
                        <input type="text" id="event_name" name="event_name" placeholder="이벤트 이름" required>

                    </div>
                </div>

                <div class="input-group">
                    <label for="eventStartDate">이벤트 시작 날짜</label>
                    <div class="input-wrapper">
                        <input type="date" id="event_sdate" name="event_sdate" required>
                    </div>
                </div>

                <div class="input-group">
                    <label for="eventEndDate">이벤트 종료 날짜</label>
                    <div class="input-wrapper">
                        <input type="date" id="event_edate" name="event_edate" required>
                    </div>
                </div>

                <div class="input-group">
                    <label for="eventPrice">이벤트 가격</label>
                    <div class="input-wrapper">
                        <input type="number" id="event_price" name="event_price" placeholder="이벤트 가격" required>
                    </div>
                </div>

                <div class="input-group">
                    <label for="eventGuName">이벤트 구명</label>
                    <div class="input-wrapper">
                        <input type="text" id="event_guName;" name="event_guName" placeholder="이벤트 구명" required>
                    </div>
                </div>

                <div class="input-group">
                    <label for="eventAddress">이벤트 주소</label>
                    <div class="input-wrapper">
                        <input type="text" id="event_address" name="event_address" placeholder="이벤트 주소" required>
                    </div>
                </div>

                <div class="input-group">
                    <label for="eventTag">이벤트 태그</label>
                    <div class="input-wrapper">
                        <input type="text" id="event_tag" name="event_tag" placeholder="이벤트 태그" required>
                    </div>
                </div>

                <div class="input-group">
                    <label for="eventHomepage">이벤트 홈페이지</label>
                    <div class="input-wrapper">
                        <input type="url" id="event_homepage" name="event_homepage" placeholder="이벤트 홈페이지" required>
                    </div>
                </div>

                <div class="input-group">
                    <label for="eventPoster">이벤트 포스터 업로드</label>
                    <div class="input-wrapper">
                        <input type="url" id="event_poster" name="event_poster"  required>
                    </div>
                </div>

                <div class="input-group">
                    <label for="eventDescription">이벤트 설명</label>
                    <div class="input-wrapper">
                        <textarea id="event_description" name="event_description" placeholder="이벤트에 대한 설명을 입력하세요..." rows="5"></textarea>
                    </div>
                </div>
                
                <div class="input-group">
    				<label for="eventPh">이벤트 전화번호</label>
   					<div class="input-wrapper">
        		<input type="text" id="event_ph" name="event_ph" placeholder="이벤트 전화번호">
    			</div>
			</div>
                <button class="submit" type="submit">등록</button>
            </form>
            <div id="result"></div> <!-- 결과 표시 영역 -->
        </div>
    </div>
</body>
</html>
