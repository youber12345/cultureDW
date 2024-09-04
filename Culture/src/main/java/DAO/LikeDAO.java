package DAO;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import DTO.Like;

import java.util.HashMap;
import java.util.Map;

public class LikeDAO {
    private final SqlSessionFactory sqlSessionFactory;

    public LikeDAO(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    // 좋아요 추가
    public boolean insertLike(int userNum, int eventNum) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            Like like = new Like(userNum, eventNum);
            int result = session.insert("mapper.LikeMapper.insertLike", like);
            session.commit();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 좋아요 삭제
    public boolean removeLike(int userNum, int eventNum) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            Map<String, Integer> params = new HashMap<>();
            params.put("userNum", userNum);
            params.put("eventNum", eventNum);
            int result = session.delete("mapper.LikeMapper.deleteLike", params);
            session.commit();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 좋아요 확인
    public boolean isLiked(int userNum, int eventNum) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            Map<String, Integer> params = new HashMap<>();
            params.put("userNum", userNum);
            params.put("eventNum", eventNum);
            int count = session.selectOne("mapper.LikeMapper.isLiked", params);
            return count > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
