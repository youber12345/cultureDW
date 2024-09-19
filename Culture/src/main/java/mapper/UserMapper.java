package mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import DTO.User;

@Mapper
public interface UserMapper {

    // 사용자 ID로 사용자 정보를 조회하는 메서드
    User getUserById(String id);

    // 다음 시퀀스 값을 가져오는 메서드
    int getNextUserSeq();

    // 새로운 사용자를 데이터베이스에 추가하는 메서드
    int insertUser(User user);

    // 이메일 또는 휴대폰 번호로 사용자 아이디를 조회하는 메서드
    // 수정된 부분: @Param 어노테이션 추가
    String findIdByEmailOrPhone(@Param("email") String email, @Param("phone") String phone);
    
    // 아이디와 이메일을 기반으로 비밀번호를 조회하는 메서드
    String findPasswordByIdAndEmail(@Param("id") String id, @Param("email") String email);

    // 비밀번호 재설정을 위한 메서드
    int updatePassword(@Param("id") String id, @Param("password") String password);
}
