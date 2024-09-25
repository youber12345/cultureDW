package Service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DAO.CommentDAO;
import DTO.Comment;

@Service
public class CommentService {

    private final CommentDAO commentDAO;

    @Autowired
    public CommentService(SqlSessionFactory sqlSessionFactory) {
        this.commentDAO = new CommentDAO(sqlSessionFactory);
    }

    // 댓글 추가
    public void insertComment(Comment comment) {
        commentDAO.insertComment(comment);
    }

    // 댓글 수정
    public boolean updateComment(int commentId, String comm) {
        return commentDAO.updateComment(commentId, comm);
    }

    // 댓글 삭제
    public boolean deleteComment(int commentId) {
        return commentDAO.deleteComment(commentId);
    }

    // 이벤트별 댓글 목록 조회
    public List<Comment> getCommentsByEvent(int eventNum) {
        return commentDAO.getCommentsByEvent(eventNum);
    }
}
