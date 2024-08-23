package mybatis;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class EventDAO {
    private final SqlSessionFactory sqlSessionFactory;

    public EventDAO(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    public List<Event> getAllEvents() {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectList("mybatis.EventMapper.selectAllEvents");
        }
    }

    public Event getEventById(int eventNum) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectOne("mybatis.EventMapper.selectEventById", eventNum);
        }
    }
}
