package Service;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Service;
import DAO.LikeDAO;

@Service
public class LikeService {

    private final LikeDAO likeDAO;

    public LikeService(SqlSessionFactory sqlSessionFactory) {
        this.likeDAO = new LikeDAO(sqlSessionFactory);
    }

    // eventNum을 int로 받아 처리하도록 수정
    public boolean likeEvent(int userNum, int eventNum) {
        try {
            return likeDAO.insertLike(userNum, eventNum);
        } catch (Exception e) {
            e.printStackTrace(); // 에러 발생 시 로그 출력
            return false;
        }
    }
}
