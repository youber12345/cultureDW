package Service;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import DAO.LikeDAO;

@Service
public class LikeService {

    private final LikeDAO likeDAO;

    @Autowired
    public LikeService(SqlSessionFactory sqlSessionFactory) {
        this.likeDAO = new LikeDAO(sqlSessionFactory);
    }

    // 좋아요 토글 기능 추가
    public boolean toggleLike(int userNum, int eventNum) {
        try {
            // 좋아요가 이미 존재하는지 확인
            boolean isLiked = likeDAO.isLiked(userNum, eventNum);

            if (isLiked) {
                // 존재하면 삭제
                return likeDAO.removeLike(userNum, eventNum);
            } else {
                // 존재하지 않으면 추가
                return likeDAO.insertLike(userNum, eventNum);
            }
        } catch (Exception e) {
            e.printStackTrace(); // 에러 발생 시 로그 출력
            return false;
        }
    }
}
