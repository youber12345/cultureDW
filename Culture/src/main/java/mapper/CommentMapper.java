package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import DTO.Comment;

public interface CommentMapper {
    // 댓글 등록
    void insertComment(Comment comment);

    // 댓글 수정
    void updateComment(@Param("commentId") int commentId, @Param("comm") String comm);

    // 댓글 삭제
    void deleteComment(int commentId);

    // 이벤트별 댓글 목록 조회
    List<Comment> getCommentsByEvent(int eventNum);
}
