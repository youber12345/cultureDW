package Mapper;

import org.apache.ibatis.annotations.Mapper;

import DTO.User;

@Mapper
public interface UserMapper {
    
    // 사용자 ID로 사용자 정보를 조회하는 메서드
    User getUserById(String id);

    // 다음 시퀀스 값을 가져오는 메서드
    int getNextUserSeq();

    // 새로운 사용자를 데이터베이스에 추가하는 메서드
    int insertUser(User user);
}
