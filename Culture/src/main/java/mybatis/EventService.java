package mybatis;

import java.util.List;

public class EventService {
    private final EventDAO eventDAO;

    // 생성자에서 EventDAO를 전달받음
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

    // 새로운 이벤트를 등록하는 메서드
    public boolean createEvent(Event event) {
        return eventDAO.insertEvent(event);
    }



}
