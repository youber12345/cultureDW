package Mapper;

import java.util.List;

import DTO.Event;

public interface EventMapper {

    // event_num에 따라 이벤트를 조회하는 메서드
    Event selectEventById(int event_num);

    // 모든 이벤트를 조회하는 메서드 (페이징 없음)
    List<Event> selectAllEvents();

    // 새로운 이벤트를 삽입하는 메서드
    int insertEvent(Event event);
}
