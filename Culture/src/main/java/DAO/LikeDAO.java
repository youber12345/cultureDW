package DAO;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import DTO.Like;

public class LikeDAO {
    private final SqlSessionFactory sqlSessionFactory;

    public LikeDAO(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    // eventNum을 int로 받아 처리하도록 수정
    public boolean insertLike(int userNum, int eventNum) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            Like like = new Like(userNum, eventNum); // Like 객체 생성
            int result = session.insert("mapper.LikeMapper.insertLike", like);
            session.commit(); // 데이터 삽입 후 커밋
            return result > 0; // 삽입 성공 여부 반환
        } catch (Exception e) {
            e.printStackTrace(); // 에러 발생 시 로그 출력
            return false;
        }
    }
}
