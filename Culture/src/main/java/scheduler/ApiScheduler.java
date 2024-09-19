package scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.w3c.dom.Document;

@Component
public class ApiScheduler {

    @Autowired
    private ApiService apiService;

    @Autowired
    private DatabaseService databaseService;

    @Scheduled(fixedRate = 100000)  // 3600000 1시간마다 실행
    public void updateData() {
        try {
            Document apiData = apiService.getApiData();  // API에서 데이터 가져오기
            databaseService.updateDatabase(apiData);     // DB에 저장
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
