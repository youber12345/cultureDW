<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.security.MessageDigest, java.security.NoSuchAlgorithmException" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 처리</title>
</head>
<body>
<%
    // 폼 데이터 받아오기
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String phone = request.getParameter("phone");

    // 비밀번호 해싱 (SHA-256)
    String hashedPassword = null;
    try {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(password.getBytes());
        byte[] byteData = md.digest();
        
        // 바이트 배열을 16진수 문자열로 변환
        StringBuilder sb = new StringBuilder();
        for (byte b : byteData) {
            sb.append(String.format("%02x", b));
        }
        hashedPassword = sb.toString();
    } catch (NoSuchAlgorithmException e) {
        e.printStackTrace();
        out.println("비밀번호 해싱 중 오류가 발생했습니다.");
        return;
    }

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // 데이터베이스 연결
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

        // SQL 쿼리 작성 (user_num 자동 증가 시퀀스 사용)
        String sql = "INSERT INTO userDB (user_num, id, password, email, name, gender, phone, admin) VALUES (user_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, 0)";
        pstmt = conn.prepareStatement(sql);

        // 폼 데이터 설정
        pstmt.setString(1, username);
        pstmt.setString(2, hashedPassword); // 해싱된 비밀번호 저장
        pstmt.setString(3, email);
        pstmt.setString(4, name);
        pstmt.setString(5, gender);
        pstmt.setString(6, phone);

        // 쿼리 실행
        int result = pstmt.executeUpdate();

        if(result > 0) {
            response.sendRedirect("success.jsp"); // 성공 시 리다이렉트할 페이지
        } else {
            out.println("회원가입에 실패하였습니다.");
            response.sendRedirect("failure.jsp"); // 실패 시 리다이렉트할 페이지
        }

    } catch(Exception e) {
        e.printStackTrace();
        out.println("회원가입 중 오류가 발생했습니다.");
    } finally {
        // 리소스 해제
        if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
        if(conn != null) try { conn.close(); } catch(Exception e) {}
    }
%>
</body>
</html>
