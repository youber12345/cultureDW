package DAO;

import DTO.Event;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

public class LikeDAO {

    private final SqlSessionFactory sqlSessionFactory;

    public LikeDAO(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    // 사용자가 해당 이벤트에 좋아요를 눌렀는지 확인
    public boolean isLiked(int userNum, int eventNum) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            Boolean result = session.selectOne("mapper.LikeMapper.existsByUserNumAndEventNum", Map.of("userNum", userNum, "eventNum", eventNum));
            return result != null && result;  // Boolean 값을 처리
        }
    }

    // 좋아요 추가
    public boolean insertLike(int userNum, int eventNum) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            int result = session.insert("mapper.LikeMapper.insertLike", Map.of("userNum", userNum, "eventNum", eventNum));
            session.commit(); // 트랜잭션 커밋
            return result > 0;
        }
    }

    // 좋아요 삭제
    public boolean removeLike(int userNum, int eventNum) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            int result = session.delete("mapper.LikeMapper.deleteLike", Map.of("userNum", userNum, "eventNum", eventNum));
            session.commit(); // 트랜잭션 커밋
            return result > 0;
        }
    }

    // 해당 이벤트의 좋아요 개수 가져오기
    public int countByEventNum(int eventNum) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectOne("mapper.LikeMapper.countByEventNum", eventNum);
        }
    }

 // 사용자 번호로 좋아요 누른 이벤트 이름과 날짜만 가져오는 메서드
    public List<Map<String, Object>> getLikedEventNamesAndDates(int userNum) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectList("mapper.LikeMapper.getLikedEventNamesAndDates", userNum);
        }
    }
}
