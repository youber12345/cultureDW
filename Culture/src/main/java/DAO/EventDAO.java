package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import DTO.Event;
import DTO.SearchEvent;

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

	
    public List<Event> searchselectEvent(SearchEvent sevent) {
        try {
            SqlSession session = sqlSessionFactory.openSession();
            String sql = "SELECT * FROM eventDB "
                       + "WHERE (CASE "
                       + "WHEN event_tag IN ('클래식', '독주/독창회', '콘서트', '국악', '뮤지컬/오페라', '연극', '무용') THEN '공연/콘서트' "
                       + "WHEN event_tag = '교육/체험' THEN '교육/체험' "
                       + "WHEN event_tag = '전시/미술' THEN '전시/미술' "
                       + "WHEN event_tag IN ('축제-문화/예술', '축제-기타', '축제-시민화합', '축제-전통/역사') THEN '축제' "
                       + "WHEN event_tag IN ('영화', '기타') THEN '기타' "
                       + "ELSE '기타' END) LIKE ? "
                       + "AND event_address LIKE ? "
                       + "AND event_edate <= ?";
            
            PreparedStatement ps = session.getConnection().prepareStatement(sql);
            ps.setString(1, "%" + sevent.getEvent_tag() + "%");
            ps.setString(2, "%" + sevent.getEvent_address() + "%");
            ps.setString(3, sevent.getSearchdate());
            
            ResultSet rs = ps.executeQuery();
            List<Event> events = new ArrayList<Event>();
    	
    	while(rs.next()) {
    		Date sdate=new Date();
    		Date edate=new Date();
    		events.add(new Event(
    				rs.getInt("event_num"), 
    				rs.getString("event_name"), 
    				sdate, 
    				edate, 
    				rs.getString("event_description"), 
    				rs.getString("event_ph"), 
    				rs.getString("event_price"), 
    				rs.getString("event_homepage"), 
    				rs.getString("event_poster"), 
    				rs.getString("event_address"), 
    				rs.getString("event_tag"), 
    				rs.getString("event_guName"), 
    				rs.getString("event_lat"), 
    				rs.getString("event_lot")));
    	}
    	return events;
    	}catch (Exception e) {
    		e.printStackTrace();
		}
    	return null;
    	
    	/*
        try (SqlSession session = sqlSessionFactory.openSession()) {
            Map<String, Object> params = new HashMap<>();
            params.put("sevent",sevent); 
            return session.selectList("mapper.EventMapper.searchselectEvent", params);
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();  // 오류 발생 시 빈 리스트 반환
        }
        */
        
    }



	

}
