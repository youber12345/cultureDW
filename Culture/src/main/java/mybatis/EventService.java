package mybatis;

import java.util.List;

public class EventService {
    private final EventDAO eventDAO;

    // 생성자에서 EventDAO를 전달받음
    public EventService(EventDAO eventDAO) {
        this.eventDAO = eventDAO;
    }

    public List<Event> getAllEvents() {
        return eventDAO.getAllEvents();
    }

    public Event getEventById(int eventNum) {
        return eventDAO.getEventById(eventNum);
    }
}
