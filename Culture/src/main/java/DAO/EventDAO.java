package DAO;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import DTO.Event;

import java.util.ArrayList;
import java.util.List;

public class EventDAO {
    private final SqlSessionFactory sqlSessionFactory;

    public EventDAO(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    // 모든 이벤트를 가져오는 메서드
    public List<Event> getAllEvents() {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectList("mapper.EventMapper.selectAllEvents");
        }
    }

    // 특정 이벤트를 ID로 가져오는 메서드
    public Event getEventById(int eventNum) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectOne("mapper.EventMapper.selectEventById", eventNum);
        }
    }

    public List<Event> getTop3Events() {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            List<Event> events = session.selectList("mapper.EventMapper.selectTop3Events");
            return (events != null) ? events : new ArrayList<>();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to retrieve top 3 events", e);
        }
    }
    
//    public List<Event> getTop3Events() {
//        try (SqlSession session = sqlSessionFactory.openSession()) {
//            return session.selectList("mapper.EventMapper.selectTop3Events");
//        } 
//    }

    
    // 새로운 이벤트를 데이터베이스에 삽입하는 메서드
    public boolean insertEvent(Event event) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            int rowsInserted = session.insert("mapper.EventMapper.insertEvent", event);
            session.commit();  // 트랜잭션 커밋
            return rowsInserted > 0;  // 삽입된 행이 있는지 확인
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Event> searchEvent(String eventTag) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectList("mapper.EventMapper.searchEvent", eventTag);
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();  // 오류 발생 시 빈 리스트 반환
        }
    }


	

}
