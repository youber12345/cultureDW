<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Event Registration</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/regev.css">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Shantell+Sans:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">
    <style>
        .form-step {
            display: none;
        }
        .form-step.active {
            display: block;
        }
        .form-container {
            border-radius: 15px;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
    <script>
        let currentStep = 0;

        function showStep(step) {
            const steps = document.querySelectorAll('.form-step');
            steps.forEach((element, index) => {
                element.classList.remove('active');
                if (index === step) {
                    element.classList.add('active');
                }
            });
            document.getElementById('prevButton').style.display = step > 0 ? 'inline-block' : 'none';
            document.getElementById('nextButton').style.display = step < steps.length - 1 ? 'inline-block' : 'none';
            document.getElementById('submitButton').style.display = step === steps.length - 1 ? 'inline-block' : 'none';
        }

        function nextStep() {
            currentStep++;
            showStep(currentStep);
        }

        function prevStep() {
            currentStep--;
            showStep(currentStep);
        }

        function validateForm(event) {
            event.preventDefault();
            // 여기에 폼 검증 로직을 추가하세요.
            document.getElementById('eventForm').submit();
        }

        window.onload = function() {
            showStep(currentStep);
        };
    </script>
</head>
<body>
    <div class="logo">
        <img src="<%=request.getContextPath()%>/static/logo/logo.png" alt="Logo" onclick="backToHome()">
    </div>
    <div class="signup-container">
        <div class="form-container">
            <h2>이벤트 등록</h2>
            <form id="eventForm" action="<%=request.getContextPath()%>/eventProcess" method="post" onsubmit="validateForm(event)">

                <!-- 첫 번째 단계 -->
                <div class="form-step active">
                    <div class="input-group">
                        <label for="eventName">이벤트 이름</label>
                            <input type="text" id="event_name" name="event_name" placeholder="이벤트 이름" required>
                    </div>

                    <div class="input-group">
                        <label for="eventStartDate">이벤트 시작 날짜</label>
                            <input type="date" id="event_sdate" name="event_sdate" required>
                    </div>

                    <div class="input-group">
                        <label for="eventEndDate">이벤트 종료 날짜</label>
                            <input type="date" id="event_edate" name="event_edate" required>
                    </div>

                    <div class="input-group">
                        <label for="eventPrice">이벤트 가격</label>
                            <input type="number" id="event_price" name="event_price" placeholder="이벤트 가격" required>
                       
                    </div>
                </div>

                <!-- 두 번째 단계 -->
                <div class="form-step">
                    <div class="input-group">
                        <label for="eventGuName">이벤트 구명</label>
                            <input type="text" id="event_guName" name="event_guName" placeholder="이벤트 구명" required>
                    </div>

                    <div class="input-group">
                        <label for="eventAddress">이벤트 주소</label>
                            <input type="text" id="event_address" name="event_address" placeholder="이벤트 주소" required>
                    </div>

                    <div class="input-group">
                        <label for="eventTag">이벤트 태그</label>
                            <input type="text" id="event_tag" name="event_tag" placeholder="이벤트 태그" required>
                    </div>

                    <div class="input-group">
                        <label for="eventHomepage">이벤트 홈페이지</label>
                            <input type="url" id="event_homepage" name="event_homepage" placeholder="이벤트 홈페이지" required>
                    </div>
                </div>

                <!-- 세 번째 단계 -->
                <div class="form-step">
                    <div class="input-group">
                        <label for="eventPoster">이벤트 포스터 업로드</label>
                            <input type="url" id="event_poster" name="event_poster" required>
                    </div>

                    <div class="input-group">
                        <label for="eventDescription">이벤트 설명</label>
                            <textarea id="event_description" name="event_description" placeholder="이벤트에 대한 설명을 입력하세요..." rows="5"></textarea>
                      
                    </div>
                    
                    <div class="input-group">
                        <label for="eventPh">이벤트 전화번호</label>
                            <input type="text" id="event_ph" name="event_ph" placeholder="이벤트 전화번호">
                    </div>
                </div>

                <button id="prevButton" type="button" onclick="prevStep()">이전</button>
                <button id="nextButton" type="button" onclick="nextStep()">다음</button>
                <button id="submitButton" class="submit" type="submit" style="display: none;">완료</button>
            </form>
        </div>
    </div>
</body>
</html>
