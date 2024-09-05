package DAO;

import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

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
}
