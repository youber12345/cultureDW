package mybatis;

import java.util.List;

public interface EventMapper {

    // event_num에 따라 이벤트를 조회하는 메서드
    Event selectEventById(int event_num);

    // 모든 이벤트를 조회하는 메서드 (페이징 없음)
    List<Event> selectAllEvents();
}
