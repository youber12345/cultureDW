<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/signup.css">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Shantell+Sans:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">
    
</head>
<body>
    <div class="logo">
        <img src="<%=request.getContextPath()%>/static/logo/logo.png" alt="Logo">
    </div>
    <div class="signup-container">
        <div class="form-container">
            <!-- 폼 액션과 메서드를 설정하여 데이터 제출 -->
            <form action="<%=request.getContextPath()%>/signupProcess.jsp" method="post">
                <div class="input-group">
                    <label for="username">아이디</label>
                    <div class="input-wrapper">
                        <input type="text" id="username" name="username" placeholder="아이디">
                    </div>
                </div>
                
                <div class="input-group">
                    <label for="password">비밀번호</label>
                    <div class="input-wrapper">
                        <input type="password" id="password" name="password" placeholder="비밀번호">
                        <i class="password-icon"></i>
                    </div>
                </div>
                
                <div class="input-group">
                    <label for="email">이메일 주소</label>
                    <input type="email" id="email" name="email" placeholder="[선택] 이메일주소">
                </div>
                
                <div class="input-group">
                    <label for="name">이름</label>
                    <input type="text" id="name" name="name" placeholder="이름">
                </div>
                
                <div class="input-group">
                    <label for="birthdate">생년월일</label>
                    <input type="text" id="birthdate" name="birthdate" placeholder="생년월일 8자리">
                </div>
                
                <div class="gender-group">
                    <label for="gender">성별</label>
                    <div class="gender-options">
                        <input type="radio" id="male" name="gender" value="male">
                        <label for="male">남자</label>
                        <input type="radio" id="female" name="gender" value="female">
                        <label for="female">여자</label>
                        <input type="radio" id="none" name="gender" value="none">
                        <label for="none">선택안함</label>
                    </div>
                </div>
                
                <div class="input-group">
                    <label for="country">국가</label>
                    <select id="country" name="country">
                        <option value="korea">대한민국 +82</option>
                        <!-- 추가 국가 선택지 -->
                    </select>
                </div>
                
                <div class="input-group">
                    <label for="phone">휴대전화번호</label>
                    <input type="text" id="phone" name="phone" placeholder="휴대전화번호">
                </div>
                
                <!-- 회원가입 버튼 -->
                <button class="submit" type="submit">회원가입</button>
            </form>
        </div>
    </div>
</body>
</html>
