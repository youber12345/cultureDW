package controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

    @RequestMapping("/")
    public String homepage() {
        return "homepage";
    }

    @GetMapping("/top3")
    public String top3() {
        return "top3";
    }

    @GetMapping("/homepage")
    public String homepage1() {
        return "homepage";
    }

    @GetMapping("/event1")
    public String event1() {
        return "event1";
    }

    @GetMapping("/event2")
    public String event2() {
        return "event2";
    }

    @GetMapping("/event3")
    public String event3() {
        return "event3";
    }

    @GetMapping("/loginpage")
    public String loginpage() {
        return "loginpage";
    }

    @GetMapping("/signup")
    public String signup() {
        return "signup";
    }

    // 로그인 처리 메서드 수정
    @PostMapping("/login")
    public ModelAndView login(@RequestParam("id") String id,
                              @RequestParam("password") String password,
                              HttpServletRequest request) {
        // 데이터베이스 연결 정보
        String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe";
        String dbUser = "system";
        String dbPassword = "1234";

        ModelAndView mv = new ModelAndView();

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
            
            // 데이터베이스 연결 확인
            System.out.println("Database connected successfully!");

            String query = "SELECT * FROM userDB WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String storedHashedPassword = resultSet.getString("password");

                // 입력된 비밀번호 해싱
                String inputHashedPassword = hashPassword(password);

                if (storedHashedPassword.equals(inputHashedPassword)) {
                    // 로그인 성공 시 세션에 사용자 정보를 저장하고 홈페이지로 리다이렉트
                    HttpSession session = request.getSession();
                    session.setAttribute("userId", id);
                    mv.setViewName("redirect:/homepage");
                } else {
                    // 로그인 실패 시 로그인 페이지로 다시 이동하고 오류 메시지를 표시
                    System.out.println("Invalid username or password.");
                    mv.setViewName("loginpage");
                    mv.addObject("error", "Invalid username or password.");
                }
            } else {
                // 사용자가 데이터베이스에 없는 경우
                System.out.println("Invalid username or password.");
                mv.setViewName("loginpage");
                mv.addObject("error", "Invalid username or password.");
            }

            resultSet.close();
            preparedStatement.close();
            connection.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            mv.setViewName("loginpage");
            mv.addObject("error", "Database connection error.");
        }

        return mv;
    }

    @PostMapping("/signupProcess")
    public ModelAndView signupProcess(@RequestParam("username") String username,
                                      @RequestParam("password") String password,
                                      @RequestParam("email") String email,
                                      @RequestParam("name") String name,
                                      @RequestParam("gender") String gender,
                                      @RequestParam("phone") String phone) {
        ModelAndView mv = new ModelAndView();
        
        // 데이터베이스 연결 정보
        String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe";
        String dbUser = "system";
        String dbPassword = "1234";

        try {
            // JDBC 드라이버 로드
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            // 비밀번호 해싱 (SHA-256)
            String hashedPassword = hashPassword(password);

            // 사용자 정보 삽입 쿼리 작성
            String query = "INSERT INTO userDB (user_num, id, password, email, name, gender, phone, admin) "
                         + "VALUES (user_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, 0)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, hashedPassword); // 해싱된 비밀번호 저장
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, name);
            preparedStatement.setString(5, gender);
            preparedStatement.setString(6, phone);

            int result = preparedStatement.executeUpdate();

            if (result > 0) {
                // 회원가입 성공 시 성공 페이지로 이동
                mv.setViewName("redirect:/loginpage");
            } else {
                // 실패 시 에러 메시지와 함께 회원가입 페이지로 이동
                mv.setViewName("signup");
                mv.addObject("error", "회원가입에 실패했습니다. 다시 시도해주세요.");
            }

            preparedStatement.close();
            connection.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            mv.setViewName("signup");
            mv.addObject("error", "Database connection error.");
        }

        return mv;
    }

    // 비밀번호 해싱 메서드
    private String hashPassword(String password) {
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
        }
        return hashedPassword;
    }
}
