package Service;

import DAO.LikeDAO;
import DTO.Event;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class LikeService {

    private final LikeDAO likeDAO;

    @Autowired
    public LikeService(SqlSessionFactory sqlSessionFactory) {
        this.likeDAO = new LikeDAO(sqlSessionFactory);
    }

    // 좋아요 토글 기능
    public boolean toggleLike(int userNum, int eventNum) {
        boolean isLiked = likeDAO.isLiked(userNum, eventNum);
        if (isLiked) {
            return likeDAO.removeLike(userNum, eventNum);
        } else {
            return likeDAO.insertLike(userNum, eventNum);
        }
    }

    // 사용자 번호로 좋아요한 이벤트의 이름과 날짜만 가져오는 서비스 메서드
    public List<Map<String, Object>> getLikedEventNamesAndDates(int userNum) {
        return likeDAO.getLikedEventNamesAndDates(userNum);
    }

    // 특정 이벤트의 좋아요 개수 가져오기
    public int countByEventNum(int eventNum) {
        return likeDAO.countByEventNum(eventNum);
    }

    // 사용자가 특정 이벤트에 좋아요를 눌렀는지 확인
    public boolean isLiked(int userNum, int eventNum) {
        return likeDAO.isLiked(userNum, eventNum);
    }
}
