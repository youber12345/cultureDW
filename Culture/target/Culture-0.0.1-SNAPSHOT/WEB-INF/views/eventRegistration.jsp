<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Event Registration</title>
    <!-- Bootstrap CSS를 먼저 로드 -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- 사용자 정의 CSS를 나중에 로드 -->
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
            width: 100%;
            max-width: 600px; /* 컨테이너 너비를 설정하여 입력 필드가 잘리지 않도록 */
        }
        .input-group label {
            font-size: 18px;
            color: #555;
            text-align: left;
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }
        .input-group .form-control {
            width: 100%; /* 입력 필드가 컨테이너 너비를 전부 사용하도록 설정 */
            font-size: 18px;
            padding: 12px 15px;
            border-radius: 8px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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

        function backToHome() {
            window.location.href = 'index';
        }
    </script>
</head>
<body>
    <div class="logo-container">
            <img src="<%= request.getContextPath() %>/static/logo/logo.png" alt="Logo" width="100px" height="100px" onclick="backToHome()">
        </div>
    <div class="signup-container">
        <div class="form-container">
            <h2>이벤트 등록</h2>
            <form id="eventForm" action="<%=request.getContextPath()%>/eventProcess" method="post" onsubmit="validateForm(event)">

                <!-- 첫 번째 단계 -->
                <div class="form-step active">
                    <div class="input-group">
                        <label for="event_name">이벤트 이름</label>
                        <input type="text" id="event_name" name="event_name" class="form-control" placeholder="이벤트 이름" required>
                    </div>

                    <div class="input-group">
                        <label for="event_sdate">이벤트 시작 날짜</label>
                        <input type="date" id="event_sdate" name="event_sdate" class="form-control" required>
                    </div>

                    <div class="input-group">
                        <label for="event_edate">이벤트 종료 날짜</label>
                        <input type="date" id="event_edate" name="event_edate" class="form-control" required>
                    </div>

                    <div class="input-group">
                        <label for="event_price">이벤트 가격</label>
                        <input type="number" id="event_price" name="event_price" class="form-control" placeholder="이벤트 가격" required>
                    </div>
                     <div class="input-group">
                        <label for="event_guName">이벤트 구명</label>
                        <input type="text" id="event_guName" name="event_guName" class="form-control" placeholder="이벤트 구명" required>
                    </div>
                </div>

                <!-- 두 번째 단계 -->
                <div class="form-step">
                   
                    <div class="input-group">
                        <label for="event_address">이벤트 주소</label>
                        <input type="text" id="event_address" name="event_address" class="form-control" placeholder="이벤트 주소" required>
                    </div>

                    <div class="input-group">
                        <label for="event_tag">이벤트 태그</label>
                        <input type="text" id="event_tag" name="event_tag" class="form-control" placeholder="이벤트 태그" required>
                    </div>

                    <div class="input-group">
                        <label for="event_homepage">이벤트 홈페이지</label>
                        <input type="url" id="event_homepage" name="event_homepage" class="form-control" placeholder="이벤트 홈페이지" required>
                    </div>
                    <div class="input-group">
                        <label for="event_poster">이벤트 포스터 업로드</label>
                        <input type="url" id="event_poster" name="event_poster" class="form-control" required>
                    </div>
                </div>

                <!-- 세 번째 단계 -->
                <div class="form-step">
                    <div class="input-group">
                        <label for="event_description">이벤트 설명</label>
                        <textarea id="event_description" name="event_description" class="form-control" placeholder="이벤트에 대한 설명을 입력하세요..." rows="5"></textarea>
                    </div>
                    
                    <div class="input-group">
                        <label for="event_ph">이벤트 전화번호</label>
                        <input type="text" id="event_ph" name="event_ph" class="form-control" placeholder="이벤트 전화번호">
                    </div>
                    
                    <div class="input-group">
                        <label for="event_lat">위도</label>
                        <input type="text" id="event_lot" name="event_lot" class="form-control" placeholder="위도 값을 입력하세요...">
                    </div>
                    
                    <div class="input-group">
                        <label for="event_lot">경도</label>
                        <input type="text" id="event_lat" name="event_lat" class="form-control" placeholder="경도 값을 입력하세요...">
                    </div>
                    
                </div>

                <button id="prevButton" type="button" class="btn btn-secondary" onclick="prevStep()">이전</button>
                <button id="nextButton" type="button" class="btn btn-primary" onclick="nextStep()">다음</button>
                <button id="submitButton" class="btn btn-success" type="submit" style="display: none;">완료</button>
            </form>
        </div>
    </div>
</body>
</html>
