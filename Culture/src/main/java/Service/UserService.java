package user;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    private final SqlSessionFactory sqlSessionFactory;

    public UserService(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    /**
     * 로그인 메서드: 아이디와 비밀번호를 사용해 로그인 여부를 확인.
     * 
     * @param id 사용자 아이디
     * @param password 사용자 비밀번호
     * @return 로그인 성공 시 User 객체, 실패 시 null 반환
     */
    public User login(String id, String password) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            UserMapper userMapper = session.getMapper(UserMapper.class);
            User user = userMapper.getUserById(id);
            if (user != null && user.getPassword().equals(password)) {
                return user; // 로그인 성공 시 User 객체 반환
            }
        }
        return null; // 로그인 실패 시 null 반환
    }

    /**
     * 아이디로 사용자 정보를 조회하는 메서드.
     * 
     * @param id 사용자 아이디
     * @return 조회된 User 객체
     */
    public User getUserById(String id) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            UserMapper userMapper = session.getMapper(UserMapper.class);
            return userMapper.getUserById(id);
        }
    }

    /**
     * 새로운 사용자를 데이터베이스에 추가하는 메서드.
     * 
     * @param user User 객체
     * @return 성공 시 true, 실패 시 false 반환
     */
    public boolean createUser(User user) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            UserMapper userMapper = session.getMapper(UserMapper.class);

            // 1. 시퀀스 값을 가져옴
            int userNum = userMapper.getNextUserSeq();

            // 2. 가져온 시퀀스 값을 User 객체에 설정
            user.setUserNum(userNum);

            // 3. 사용자 정보를 데이터베이스에 삽입
            int rowsInserted = userMapper.insertUser(user);

            // 4. 트랜잭션 커밋
            session.commit(); // 변경 사항을 커밋하여 데이터베이스에 반영

            return rowsInserted > 0; // 삽입된 행이 0보다 크면 성공으로 간주
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
