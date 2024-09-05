package mapper;

import org.apache.ibatis.annotations.Param;

public interface LikeMapper {

    // 좋아요 추가
    int insertLike(@Param("userNum") int userNum, @Param("eventNum") int eventNum);

    // 사용자가 특정 이벤트에 좋아요를 눌렀는지 확인
    boolean existsByUserNumAndEventNum(@Param("userNum") int userNum, @Param("eventNum") int eventNum);

    // 좋아요 삭제
    int deleteLike(@Param("userNum") int userNum, @Param("eventNum") int eventNum);

    // 특정 이벤트의 좋아요 개수 가져오기
    int countByEventNum(@Param("eventNum") int eventNum);
}
