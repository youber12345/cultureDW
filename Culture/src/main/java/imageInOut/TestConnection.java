package imageInOut;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TestConnection {
    public static void main(String[] args) {
        try {
            Connection connection = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

            String query = "SELECT event_name, event_address FROM eventDB WHERE event_num = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, 1);  // 예시로 event_num이 1인 데이터를 조회

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String eventName = resultSet.getString("event_name");
                String eventAddress = resultSet.getString("event_address");

                System.out.println("Event Name: " + eventName);
                System.out.println("Event Address: " + eventAddress);
            }

            resultSet.close();
            preparedStatement.close();
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}