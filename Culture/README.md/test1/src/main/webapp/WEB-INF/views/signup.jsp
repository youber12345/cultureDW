<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/signup.css">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Shantell+Sans:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">
    <script>
        function validateForm() {
            const username = document.getElementById("username").value;
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirmPassword").value;

            if (username.length > 20) {
                alert("아이디는 20자 이하여야 합니다.");
                return false;
            }

            if (password.length > 20) {
                alert("비밀번호는 20자 이하여야 합니다.");
                return false;
            }

            if (username === password) {
                alert("아이디와 비밀번호가 동일합니다.");
                return false;
            }

            if (password !== confirmPassword) {
                alert("비밀번호가 일치하지 않습니다.");
                return false;
            }

            return true;
        }
        function background() {
        	window.location.href = 'homepage';
    }
    </script>
</head>
<body>
    <div class="logo">
        <img src="<%=request.getContextPath()%>/static/logo/logo.png" alt="Logo" onclick="background()">
    </div>
    <div class="signup-container">
        <div class="form-container">
            <!-- 폼 액션과 메서드를 설정하여 데이터 제출 -->
            <form action="<%=request.getContextPath()%>/signupProcess" method="post" onsubmit="return validateForm()">
                <div class="input-group">
                    <label for="username">아이디</label>
                    <input type="text" id="username" name="username" placeholder="아이디" required>
                </div>
                
                <div class="input-group">
                    <label for="password">비밀번호</label>
                    <input type="password" id="password" name="password" placeholder="비밀번호" required>
                </div>
                
                <div class="input-group">
                    <label for="confirmPassword">비밀번호 재입력</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="비밀번호 재입력" required>
                </div>
                
                <div class="input-group">
                    <label for="email">이메일 주소</label>
                    <input type="email" id="email" name="email" placeholder="[선택] 이메일주소">
                </div>
                
                <div class="input-group">
                    <label for="name">이름</label>
                    <input type="text" id="name" name="name" placeholder="이름" required>
                </div>
                
                <div class="gender-group">
                    <label for="gender">성별</label>
                    <select id="gender" name="gender">
                        <option value="female">여성</option>
                        <option value="male">남성</option>
                    </select>
                </div>
                
                <div class="input-group">
                    <label for="phone">휴대전화번호</label>
                    <input type="text" id="phone" name="phone" placeholder="휴대전화번호" required>
                </div>
                
                <!-- 회원가입 버튼 -->
                <button class="submit" type="submit">회원가입</button>
            </form>
        </div>
    </div>
</body>
</html>
