package imageInOut;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class ImageToOracle {
    public static void main(String[] args) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        FileInputStream fileInputStream = null;

        try {
            // Oracle DB 연결
            connection = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

            // 파일에서 이미지 읽기
            File imageFile = new File("C:\\Users\\koas\\Desktop\\새 폴더\\test1.jpg");
            fileInputStream = new FileInputStream(imageFile);

            // SQL 쿼리 준비 (eventDB에서 event_num을 조인하여 가져옴)
            String sql = "INSERT INTO event_images (image_num, event_num, image_data) " +
                         "VALUES (images_seq.NEXTVAL, " +
                         "(SELECT event_num FROM eventDB WHERE event_name = ?), ?)";

            preparedStatement = connection.prepareStatement(sql);

            // event_name을 설정 (예: '이벤트명' 대신 실제 이벤트명을 입력)
            preparedStatement.setString(1, "서울시합창단 송년음악회");

            // 이미지 데이터를 바이너리 스트림으로 설정
            preparedStatement.setBinaryStream(2, fileInputStream, (int) imageFile.length());

            // 쿼리 실행
            int rows = preparedStatement.executeUpdate();

            if (rows > 0) {
                System.out.println("Image saved to database.");
            } else {
                System.out.println("Failed to save the image. Check if the event exists.");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 리소스 해제
            try {
                if (fileInputStream != null) fileInputStream.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
