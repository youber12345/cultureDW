package DAO;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import DTO.Comment;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CommentDAO {
    private final SqlSessionFactory sqlSessionFactory;

    public CommentDAO(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    // 댓글 등록
    public void insertComment(Comment comment) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            sqlSession.insert("mapper.CommentMapper.insertComment", comment);
            sqlSession.commit(); // 변경사항을 커밋
        } catch (Exception e) {
            e.printStackTrace(); // 예외 처리
            throw new RuntimeException("Failed to insert comment", e);
        }
    }

    // 댓글 수정 
    public boolean updateComment(int commentId, String comm) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            int rowsUpdated = session.update("mapper.CommentMapper.updateComment", 
                Map.of("commentId", commentId, "comm", comm));
            session.commit();  // 트랜잭션 커밋
            return rowsUpdated > 0;  // 수정된 행이 있는지 확인
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 댓글 삭제
    public boolean deleteComment(int commentId) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            int rowsDeleted = session.delete("mapper.CommentMapper.deleteComment", commentId);
            session.commit();  // 트랜잭션 커밋
            return rowsDeleted > 0;  // 삭제된 행이 있는지 확인
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 이벤트별 댓글 목록 조회
    public List<Comment> getCommentsByEvent(int eventNum) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            List<Comment> comments = session.selectList("mapper.CommentMapper.getCommentsByEvent", eventNum);
            return (comments != null) ? comments : new ArrayList<>();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to retrieve comments by event", e);
        }
    }
}
