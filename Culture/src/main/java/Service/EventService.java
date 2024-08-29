package Service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import DAO.EventDAO;
import DTO.Event;

@Service
public class EventService {
    
    private final EventDAO eventDAO;

    @Autowired
    public EventService(EventDAO eventDAO) {
        this.eventDAO = eventDAO;
    }

    // 모든 이벤트를 가져오는 메서드
    public List<Event> getAllEvents() {
        return eventDAO.getAllEvents();
    }

    // 특정 이벤트를 ID로 가져오는 메서드
    public Event getEventById(int eventNum) {
        return eventDAO.getEventById(eventNum);
    }

    // 상위 3개의 이벤트를 조회하는 메서드
    public List<Event> getTop3Events() {
        return eventDAO.getTop3Events();
    }
    
    // 새로운 이벤트를 등록하는 메서드
    public boolean createEvent(Event event) {
        return eventDAO.insertEvent(event);
    }
}
