package controller;

import mybatis.EventService;
import mybatis.Event;
import mybatis.EventDAO;
import mybatis.MyBatisConfig;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class IndexController {

    private final EventService eventService;

    public IndexController() {
        // SqlSessionFactory를 MyBatisConfig를 통해 생성
        EventDAO eventDAO = new EventDAO(MyBatisConfig.getSqlSessionFactory());
        this.eventService = new EventService(eventDAO); // 직접 인스턴스 생성
    }

    @GetMapping("/index")
    public String index(Model model) {
        // 모든 이벤트를 가져옴
        List<Event> eventList = eventService.getAllEvents();
        model.addAttribute("list", eventList);

        return "index"; // index.jsp로 이동
    }

    @GetMapping("/view")
    public String view(int eventNum, Model model) {
        Event event = eventService.getEventById(eventNum);
        model.addAttribute("event", event);
        return "view"; // view.jsp로 이동
    }
}
