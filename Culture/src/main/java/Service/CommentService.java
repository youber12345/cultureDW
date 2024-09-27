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

    // 대댓글 추가
    public void insertReply(Comment reply) {
        commentDAO.insertReply(reply);  // DAO에 대댓글 삽입 기능 추가 필요
    }

    // 댓글 수정
    public boolean updateComment(int commentId, String comm) {
        // 댓글이 존재하는지 확인하고 수정
        Comment existingComment = commentDAO.getCommentById(commentId);
        if (existingComment != null) {
            return commentDAO.updateComment(commentId, comm);
        }
        return false;  // 수정할 댓글이 존재하지 않는 경우 false 반환
    }

    // 댓글 삭제
    public boolean deleteComment(int commentId) {
        // 댓글이 존재하는지 확인하고 삭제
        Comment existingComment = commentDAO.getCommentById(commentId);
        if (existingComment != null) {
            return commentDAO.deleteComment(commentId);
        }
        return false;  // 삭제할 댓글이 존재하지 않는 경우 false 반환
    }

    // 특정 댓글 ID로 댓글 조회
    public Comment getCommentById(int commentId) {
        return commentDAO.getCommentById(commentId);
    }

    // 이벤트별 댓글 목록 조회
    public List<Comment> getCommentsByEvent(int eventNum) {
        return commentDAO.getCommentsByEvent(eventNum);
    }
}
