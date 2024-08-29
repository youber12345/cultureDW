package controller;

import mybatis.MyBatisConfig;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import DAO.EventDAO;
import DTO.Event;
import DTO.User;
import Service.EventService;
import Service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Controller
public class IndexController {

    private final EventService eventService;
    private final UserService userService;

    public IndexController() {
        // SqlSessionFactory를 MyBatisConfig를 통해 생성
        EventDAO eventDAO = new EventDAO(MyBatisConfig.getSqlSessionFactory());
        this.eventService = new EventService(eventDAO); // 직접 인스턴스 생성

        // UserService 인스턴스 생성
        this.userService = new UserService(MyBatisConfig.getSqlSessionFactory());
    }

    @GetMapping("/index")
    public String index(Model model, HttpSession session) {
        // 모든 이벤트를 가져옴
        List<Event> eventList = eventService.getAllEvents();
        model.addAttribute("list", eventList);

        // 로그인 상태 확인
        User user = (User) session.getAttribute("user");
        if (user != null) {
            model.addAttribute("isLoggedIn", true);
            model.addAttribute("username", user.getId());
        } else {
            model.addAttribute("isLoggedIn", false);
        }

        return "index"; // index.jsp로 이동
    }
    
    @GetMapping("/top3")
    public String top3(Model model, HttpSession session) {
        // 상위 3개의 이벤트를 가져옴
        List<Event> top3Events = eventService.getTop3Events();
        model.addAttribute("top3Events", top3Events);
        // null 체크하여 빈 리스트로 초기화
        if (top3Events == null || top3Events.isEmpty()) {
            model.addAttribute("top3Events", new ArrayList<Event>());
            model.addAttribute("message", "이벤트가 존재하지 않습니다.");  // Optional: 메시지 추가
        } 

        //데이터확인 
        System.out.println(top3Events);
        return "top3"; // top3.jsp로 이동
    }




    
    @GetMapping("/view")
    public String view(@RequestParam("eventNum") int eventNum, HttpSession session, Model model) {
        // 세션에서 사용자 정보 가져오기
        User user = (User) session.getAttribute("user");

        // 사용자 정보가 있는 경우
        if (user != null) {
            model.addAttribute("username", user.getId());
            model.addAttribute("email", user.getEmail());
            model.addAttribute("admin", user.getAdmin()); // admin 값을 직접 사용
        }

        // 이벤트 정보 가져오기
        Event event = eventService.getEventById(eventNum);
        model.addAttribute("event", event);

        return "view"; // view.jsp로 이동
    }


    @GetMapping("/login")
    public String loginForm() {
        return "login"; // login.jsp로 이동
    }

    @PostMapping("/login")
    public String login(@RequestParam("id") String id, 
                        @RequestParam("password") String password, 
                        HttpServletRequest request, 
                        Model model) {

        User user = userService.login(id, password);
        if (user != null) {
            // 로그인 성공
            HttpSession session = request.getSession();
            session.setAttribute("user", user); // 전체 User 객체를 세션에 저장
            session.setAttribute("userId", user.getId()); // userId를 세션에 별도로 저장
            return "redirect:/index"; // 로그인 후 index 페이지로 리다이렉트
        } else {
            // 로그인 실패
            model.addAttribute("error", "아이디 또는 비밀번호가 잘못되었습니다.");
            return "login"; // 로그인 페이지로 돌아감
        }
    }

    @PostMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate(); // 세션 무효화 (로그아웃)
        return "redirect:/index"; // 로그아웃 후 index 페이지로 리다이렉트
    }



    @GetMapping("/mypage")
    public String mypage(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login"; // 로그인하지 않은 경우 로그인 페이지로 리다이렉트
        }

        // 모델에 사용자 정보 추가
        model.addAttribute("username", user.getId());
        model.addAttribute("email", user.getEmail());
        model.addAttribute("admin", user.getAdmin()); // admin 값을 직접 사용

        return "mypage"; // mypage.jsp로 이동
    }

    @GetMapping("/signup")
    public String signupForm() {
        return "signup"; // signup.jsp로 이동
    }
    
    @PostMapping("/signupProcess")
    public String signupProcess(@RequestParam("username") String username,
                                @RequestParam("password") String password,
                                @RequestParam("email") String email,
                                @RequestParam("name") String name,
                                @RequestParam("gender") String gender,
                                @RequestParam("phone") String phone,
                                @RequestParam("admin") int admin,  // int로 그대로 받음
                                Model model) {
        
        // User 객체 생성 및 데이터 설정
        User user = new User();
        user.setId(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setName(name);
        user.setGender(gender);
        user.setPhone(phone);
        user.setAdmin(admin);  // int 값을 그대로 설정

        // UserService를 통해 데이터베이스에 사용자 추가
        boolean isSuccess = userService.createUser(user);

        if (isSuccess) {
            return "redirect:/login"; // 회원가입 성공 후 로그인 페이지로 이동
        } else {
            model.addAttribute("error", "회원가입에 실패했습니다. 다시 시도해주세요.");
            return "signup"; // 실패 시 다시 회원가입 페이지로 이동
        }
    }

    // 새로운 이벤트 등록을 위한 메서드 추가
    @GetMapping("/eventRegistration")
    public String eventRegistrationForm(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null || user.getAdmin() == 0) {
            return "redirect:/login"; // 비관리자 또는 로그인하지 않은 사용자는 접근할 수 없음
        }
        return "eventRegistration"; // eventRegistration.jsp로 이동
    }

    @PostMapping("/eventProcess")
    public String eventProcess(
            @RequestParam(value = "event_name") String event_name,
            @RequestParam(value = "event_sdate") String event_sdate,
            @RequestParam(value = "event_edate") String event_edate,
            @RequestParam(value = "event_price") String event_price,
            @RequestParam(value = "event_address") String event_address,
            @RequestParam(value = "event_tag") String event_tag,
            @RequestParam(value = "event_homepage") String event_homepage,
            @RequestParam(value = "event_poster") String event_poster,
            @RequestParam(value = "event_description") String event_description,
            @RequestParam(value = "event_ph") String event_ph,
            HttpServletRequest request, 
            Model model) {

        // 날짜 형식을 위한 SimpleDateFormat
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        try {
            // 새로운 Event 객체 생성 및 데이터 설정
            Event event = new Event();
            event.setEvent_name(event_name);
            
            // String으로 받은 날짜를 Date로 변환
            event.setEvent_sdate(dateFormat.parse(event_sdate));
            event.setEvent_edate(dateFormat.parse(event_edate));
            
            event.setEvent_price(event_price);
            event.setEvent_address(event_address);
            event.setEvent_tag(event_tag);
            event.setEvent_homepage(event_homepage);
            event.setEvent_poster(event_poster);
            event.setEvent_description(event_description);
            event.setEvent_ph(event_ph);

            // 이벤트 데이터베이스에 삽입
            boolean isSuccess = eventService.createEvent(event);

            if (isSuccess) {
                return "redirect:/index"; 
            } else {
                model.addAttribute("error", "이벤트 등록에 실패했습니다. 다시 시도해주세요.");
                return "eventRegistration"; 
            }
        } catch (ParseException e) {
            // 날짜 파싱 중 오류 발생 시 처리
            model.addAttribute("error", "잘못된 날짜 형식입니다. yyyy-MM-dd 형식으로 입력해주세요.");
            return "eventRegistration"; 
        }
    }

   }

