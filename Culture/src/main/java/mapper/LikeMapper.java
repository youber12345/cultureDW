package mapper;

import org.apache.ibatis.annotations.*;
import DTO.Like;

@Mapper
public interface LikeMapper {

    int insertLike(Like like);

    int checkUserLike(int userNum, String eventURL); // eventNum 대신 eventURL 사용

    int deleteLike(int likeNum);
}
