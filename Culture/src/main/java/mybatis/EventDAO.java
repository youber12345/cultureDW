package mybatis;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class EventDAO {
    private final SqlSessionFactory sqlSessionFactory;

    public EventDAO(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    // 모든 이벤트를 가져오는 메서드
    public List<Event> getAllEvents() {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectList("mybatis.EventMapper.selectAllEvents");
        }
    }

    // 특정 이벤트를 ID로 가져오는 메서드
    public Event getEventById(int eventNum) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectOne("mybatis.EventMapper.selectEventById", eventNum);
        }
    }

    // 새로운 이벤트를 데이터베이스에 삽입하는 메서드
    public boolean insertEvent(Event event) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            int rowsInserted = session.insert("mybatis.EventMapper.insertEvent", event);
            session.commit();  // 트랜잭션 커밋
            return rowsInserted > 0;  // 삽입된 행이 있는지 확인
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
